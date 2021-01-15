∇ MSET;⎕IO;n;j;CH;x;y;z
 ⎕IO←1 ⋄ CH←0
 L0:'Avec Potentiel ? [1]' ⋄ eq←⎕
 'Xmin Xmax :' ⋄ (Xmin Xmax)←⎕
 'Ymin Ymax :' ⋄ (Ymin Ymax)←⎕ ⋄ →(CH=1)/L1
 'Nombre de points en X et en Y :' ⋄ NPT←⎕
 L1:TXY←Xmin,Xmin+((Xmax-Xmin)÷NPT-1)×⍳NPT-1
 TXY←,TXY∘.,Ymin,Ymin+((Ymax-Ymin)÷NPT-1)×⍳NPT-1
 dim1←⍴TXY ⋄ →(CH=1)/L2
 'Nombremax d''iterations :' ⋄ NMAX←⎕
 L2:j←1 ⋄ POT←nit←⍳0 ⋄ t0←⎕AI[2]
 L3:(cx cy)←⊃TXY[j] ⋄ x2←y2←x←y←n←0
 L4:n←n+1
 z←x+¯11○y ⋄ x2←x×x←cx+9○z*2 ⋄ y2←y×y←cy+11○z*2
 →((n<NMAX)∧10000>x2+y2)/L4
 ⍎(eq≠1)/'dim2←⍴nit←nit,n'
 ⍎((eq=1)∧n<NMAX)/'pot←0.5×(⍟x2+y2)÷2*n'
 ⍎((eq=1)∧n=NMAX)/'pot←0'
 ⍎(eq=1)/'dim2←⍴POT←POT,pot'
 →(dim1≥j←j+1)/L3
 'Duree (s) : ',0.001×⎕AI[2]-t0
 ⍎(eq≠1)/'FXY←(2⍴dim2*0.5)⍴nit'
 ⍎(eq=1)/'FXY←(2⍴dim2*0.5)⍴POT'
 L5:'Plot sections [1], surface [2], niveaux [3] ? '
 ⍎(1=srf←⎕)/'SECTIONS'
 ⍎((srf=2)/'SURF'),(srf=3)/'NIVEAUX'
 L6:'Domaine complexe [1], replot [2]'
 →(1 2=CH←⎕)/L0,L5
∇
