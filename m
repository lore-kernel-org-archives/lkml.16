Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC484502B;
	Tue, 29 Apr 2025 02:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745892398; cv=pass; b=O/QFIOkbm8oWeHZ5B6ERuvr5gA9VCvKEcC8DhlXvHsLZr7ncnycxMLK96GF2yWvW7dcxVKC+DXciUFjiz6d91RulvUJIuXcFh6hmgUGN3t/hwiDsv2ICuaaNKOt3NYxNOunCZA0zBWOKSlC6e9JLrRO4eyG2QTN5IfkwOTrY6yA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745892398; c=relaxed/simple;
	bh=oUBOWps8OEEi19ubbbJKklFDEKA5pyvKPJcGzc9KhKQ=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=t7jnSKM5UTwhyMJiNQafkbq2doBnKQJ7I7ml63r8YEYyoTOMNv6AyGS3Ki0A5TpApzEecuW+7Iys5uCUbnMef4vdvbH+lBggy0Up92WWQevMS7h55ksX+UuH1zWdvYtPTNMHdAxU560chwDtzdqaWGdg9BaGHp5W9X3MOgYLqQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=UeGsPCr9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="UeGsPCr9"
ARC-Seal: i=1; a=rsa-sha256; t=1745892359; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Tp+ULCb/NX2CXxKOPjWGqBe0fqwgxr9x9CLyvf6rlNPNi2FiD/rBQGGwdvVcvZtL9EIB750v4XP3RrMfar1DR3mH8BxYN1Ky0qJZDJdHleEVSinQSYHF0jz60k59O1xEbj4mcgypzmq8DnuDG+fIrnNm/jGyVL6UImvmBTsy4EA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745892359; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=G9pnAX/pTfcnbAMpNAi7zvp1vwdrfPjFEIddTEFp+hs=; 
	b=lFf/P1omGs/txsFeVDKuSI++OXK3BADA4furDSYctP2uJuYuqBrFGb0nczQcjlrK1FXVUUSImAYjifIyfFvvkXWPblY/st3T7wRAmpg5PSo68okLHV2u0YKgDralFA7QTjuTriUyCrPSs5DPyV+c7vqG5LyEVKCQLOn2uCNo0+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745892359;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=G9pnAX/pTfcnbAMpNAi7zvp1vwdrfPjFEIddTEFp+hs=;
	b=UeGsPCr9GpNvuSdbeFSbgg1lMlumVw5Y3n2BCTEjDObCVF2ZR/ZJrCAQPqAooJ2U
	6v/vOUa627bOphWxQR/KNnxKdTB1U9PKeEbDtGzLNKzmD6Y0WXNRTrGesBJEpc7i4c/
	Tx7tN10wFisKubc2HsWxSqPG7IvvFHKRVF2lZLlw=
Received: by mx.zohomail.com with SMTPS id 1745892356039231.37800848772383;
	Mon, 28 Apr 2025 19:05:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>
In-Reply-To: <20250428-glade-unripe-4cdb4913ede4@spud>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, "Yuntao Dai" <d1581209858@live.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add Sophgo CV18XX series SoC
Message-ID: <183aa7d7183c45f8.dee2d6a7f4d6f33a.37931e87d1f102d2@Jude-Air.local>
Date: Tue, 29 Apr 2025 02:05:47 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Conor,
Thanks for your review.

On 28/04/2025 17:52, Conor Dooley wrote:
> On Mon, Apr 28, 2025 at 08:39:44PM +0800, Junhui Liu wrote:
>> From: Yuntao Dai <d1581209858@live.com>
>>=20
>> Introduce the mailbox module for CV18XX series SoC, which is responsible
>> for interchanging messages between asymmetric processors.
>>=20
>> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   | 57 ++++++++++++++++=
++++++
>>  1 file changed, 57 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mai=
lbox.yaml b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox=
.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5815dc02189c973d681f5b4ff=
22a9fb7536802b9
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.ya=
ml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mailbox/sophgo,cv1800b-mailbox.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Sophgo CV1800/SG2000 mailbox controller
>> +
>> +maintainers:
>> +  - Yuntao Dai <d1581209858@live.com>
>> +  - Junhui Liu <junhui.liu@pigmoral.tech>
>> +
>> +description: |
>> +  Mailboxes integrated in Sophgo CV1800/SG2000 SoCs have 8 channels, eac=
h
>> +  shipping an 8-byte FIFO. Any processor can write to an arbitrary chann=
el
>> +  and raise interrupts to receivers. Sending messages to itself is also
>> +  supported.
>=20
>> +  Sophgo CV1800/SG2000 SoCs include the following processors, numbered a=
s:
>> +  <0> Cortex-A53 (Only available on CV181X/SG200X)
>> +  <1> C906B
>> +  <2> C906L
>> +  <3> 8051
>=20
> I think this section should be moved to the mbox-cells property, since it
> is describing how to use the mboxes property.

You're right. I will move it to the mbox-cells property.

>=20
>> +
>> +properties:
>> +  compatible:
>> +    const: sophgo,cv1800b-mailbox
>=20
> Remind me, why only a cv1800b compatible when you also mention sg2000?
> Rebranding of the same SoC, or something like that?

Yes, this is some kind of rebranding behavior, as discussed previously
in [1].

And since the behavior of mailbox is consistent between CV18XX/SG200X
when using C906B RISC-V core (Arm-A53 and C906B can't run at the same
time), I only added sophgo,cv1800b-mailbox as a common compatible.

Things will be slightly different when using Arm-A53 core, the receiver
id in the driver will be different. I think a compatible like
sophgo,sg2000-mailbox-a53 can be added to handle it when the A53 core is
ready [2].

link: https://lore.kernel.org/linux-riscv/20240116-music-luckiness-3220a9efd=
bbf@spud/ [1]
link: https://lore.kernel.org/all/20250316185640.3750873-1-alexander.sverdli=
n@gmail.com/ [2]

>=20
> Cheers,
> Conor.
>=20
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  "#mbox-cells":
>> +    const: 2
>> +    description:
>> +      The first cell indicates the channel index (0-7), the second cell
>> +      indicates the target processor ID (0-3) to which messages are sent=
.
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - "#mbox-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    mailbox@1900000 {
>> +        compatible =3D "sophgo,cv1800b-mailbox";
>> +        reg =3D <0x01900000 0x1000>;
>> +        interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
>> +        #mbox-cells =3D <2>;
>> +    };
>>=20
>>

--=20
Best regards,
Junhui Liu
