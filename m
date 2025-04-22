Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2211E9B20;
	Tue, 22 Apr 2025 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745343920; cv=none; b=gW+Z3Qb4dTIPyNP2SZuYx+TN4fMQVJ3RBNCTYSEPtUC/CCIPjwUggkzBc5rKapuSaIZ+/3VKLOFLw0ZhXWLar9PRMzWV+OsHk7ghqH06t0bSVzE8ndHhKTwQCBgyo9n1MXcG4sCVNXSoBlC5gnwlTI25o0TLjEhM0F2KR1NO2GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745343920; c=relaxed/simple;
	bh=5nfu/M8yhD6PAdV1pgRL0jEbGKuSwpC1ZvuPQD1vU+w=;
	h=MIME-Version:Content-Type:Date:Message-ID:CC:Subject:From:To:
	 References:In-Reply-To; b=mTm591Rtc3fk02JXxHeXMjGhkIhv5ovRdbUaiL6XGgAuMc74V5gu2VWC+Ku7Rv9lw27RUIpv1tma49lvNb3A3Z86uwvLDJfFdW+81/UP15+7zo9ernYrzj1x6rWOm3PYj0z0i1xiTfMcuWEMWyGy6KDK4f4ciCZhKCPpBWXX+cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Vr6ntw2R; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Vr6ntw2R"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHj5IK2049063
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 12:45:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745343905;
	bh=sHUZgs2N1G1RS84r+sddjNkMZICay2gHqF5Pa5egcLQ=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=Vr6ntw2RbWxXhhQd7wTFis+m+dS+poX79ZkKk9PmYbDJUPYGOu7SxjleVMtfvpaSF
	 zGpiH0K/zbD5qBdtMVIvjzWyU4LXVBlvWywGvqYHVpNrfjCragsPzOwLO1WrRLXSPq
	 4x/4G8RdIaTLMK+256+xhgCNhwlK9UqV9W5dshAw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHj5Ja092315
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 12:45:05 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 12:45:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 12:45:04 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MHj40C118975;
	Tue, 22 Apr 2025 12:45:04 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 22 Apr 2025 12:45:04 -0500
Message-ID: <D9DCS0V1ZIVJ.17SASQOHSJ8ZI@ti.com>
CC: "Kumar, Udit" <u-kumar1@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Frank Binns <Frank.Binns@imgtec.com>,
        Alessio
 Belle <Alessio.Belle@imgtec.com>,
        Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
        Luigi Santivetti <Luigi.Santivetti@imgtec.com>,
        Darren Etheridge
	<detheridge@ti.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: ti: k3-j721s2: Add GPU node
From: Randolph Sapp <rs@ti.com>
To: Matt Coster <Matt.Coster@imgtec.com>, Nishanth Menon <nm@ti.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250417-bxs-4-64-dts-v2-0-9f8c09233114@imgtec.com>
 <20250417-bxs-4-64-dts-v2-2-9f8c09233114@imgtec.com>
 <8017c015-73aa-4807-a177-d5391e073981@ti.com>
 <D9CPY0IDAJSR.39JPPAXZAUNQE@ti.com> <20250422120420.iv2hbaf4ykqazvlx@bleak>
 <bbfc83a5-8de4-438a-8e14-b684b30143a0@imgtec.com>
In-Reply-To: <bbfc83a5-8de4-438a-8e14-b684b30143a0@imgtec.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Tue Apr 22, 2025 at 11:22 AM CDT, Matt Coster wrote:
> On 22/04/2025 13:04, Nishanth Menon wrote:
>> On 18:51-20250421, Randolph Sapp wrote:
>>> On Sat Apr 19, 2025 at 11:15 AM CDT, Udit Kumar wrote:
>>>> Hello Matt,
>>>>
>>>> On 4/17/2025 2:40 PM, Matt Coster wrote:
>>>>> The J721S2 binding is based on the TI downstream binding in commit
>>>>> 54b0f2a00d92 ("arm64: dts: ti: k3-j721s2-main: add gpu node") from [1=
]
>>>>> but with updated compatible strings.
>>>>
>>>> Downstream kernel[1] sha 5657fc069e8b3 ("PENDING: arm64: dts: ti:=20
>>>> k3-j721s2-main: add gpu node")
>>>>
>>>> also has assigned-clock-rates.
>>>>
>>>> Please check if gpu node needs assigned-rate too.
>>>
>>> If I remember correctly, J721S2 was one of the few platforms that actua=
lly
>>> defaulted to 800MHz, so it may not be necessary for that platform speci=
fically.
>>> (I don't have a board to test this right now though. This very well may=
 have
>>> changed.) AM62 also defaults to the correct value, and that one I did m=
anage to
>>> verify.
>>>
>>> That being said, Udit is right, it's generally a good idea to explicitl=
y set the
>>> clock speed for our devices. I know AM62P, for example, used to default=
 our
>>> clock to the bus speed.
>>>
>>> At one point though this driver was experimenting with a DVFS mechanism=
. Matt,
>>> use of assigned-clocks shouldn't interfere with that assuming there is =
no
>>> defined opp-table, right? May be a good idea to set our usual 800 MHz f=
or J721S2
>>> and 500 MHz for AM625. This shouldn't require any binding related chang=
es.
>>>
>>> On the topic of opp tables for the GPU, I did some testing on the propr=
ietary
>>> driver a little while back. These devices do not support voltage scalin=
g and
>>> simple frequency scaling saw a general decrease in performance and incr=
ease in
>>> power draw for the usual utilization bursts a single application runnin=
g at 60
>>> FPS generates. I have a feeling this will carry over to the open source=
 driver,
>>> but we can always do additional testing if you are curious.
>>>
>>> - Randolph
>>>
>>>>> The clock[2] and power[3] indices were verified from HTML docs, while
>>>>> the intterupt index comes from the TRM[4] (appendix
>>>>> "J721S2_Appendix_20241106_Public.xlsx", "Interrupts (inputs)",
>>>>> "GPU_BXS464_WRAP0_GPU_SS_0_OS_IRQ_OUT_0").
>>>>
>>>>> [1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel
>>>>> [2]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/clock=
s.html
>>>>> [3]: https://downloads.ti.com/tisci/esd/latest/5_soc_doc/j721s2/devic=
es.html
>>>>> [4]: https://www.ti.com/lit/zip/spruj28 (revision E)
>>>>>
>>>>> Reviewed-by: Randolph Sapp <rs@ti.com>
>>>>> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Add interrupt reference details
>>>>> - Add Randolph's Rb
>>>>> - Link to v1: https://lore.kernel.org/r/20250415-bxs-4-64-dts-v1-2-f7=
d3fa06625d@imgtec.com=20
>>>>>
>>>>> This patch was previously sent as [DO NOT MERGE]:
>>>>> https://lore.kernel.org/r/20250410-sets-bxs-4-64-patch-v1-v6-18-eda62=
0c5865f@imgtec.com=20
>>>>> ---
>>>>>   arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi | 12 ++++++++++++
>>>>>   1 file changed, 12 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi b/arch/arm64/=
boot/dts/ti/k3-j721s2-main.dtsi
>>>>> index 92bf48fdbeba45ecca8c854db5f72fd3666239c5..a79ac41b2c1f51b7193e6=
133864428bd35a5e835 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-j721s2-main.dtsi
>>>>> @@ -2048,4 +2048,16 @@ watchdog8: watchdog@23f0000 {
>>>>>   		/* reserved for MAIN_R5F1_1 */
>>>>>   		status =3D "reserved";
>>>>>   	};
>>>>> +
>>>>> +	gpu: gpu@4e20000000 {
>>>>> +		compatible =3D "ti,j721s2-gpu", "img,img-bxs-4-64", "img,img-rogue=
";
>>>>> +		reg =3D <0x4e 0x20000000 0x00 0x80000>;
>>>>> +		clocks =3D <&k3_clks 130 1>;
>>=20
>> On the basis of the above discussion, Matt,
>> please add:
>> assigned-clocks =3D <&k3_clks 130 1>;
>> assigned-clock-rates =3D <800000000>;
>
> As requested, I've sent a v3 with these properties added. I checked
> using:
>
> $ make CHECK_DTBS=3D1 ti/k3-am68-sk-base-board.dtb
>
> Which reported no issues. Does this mean these properties are defined as
> globally allowed somewhere, and that we will not need to add them
> specifically to our bindings?
>
> Cheers,
> Matt

Yeah, they are defined by the clock meta-schema [1] and inherited by the co=
re
meta-schema [2] that you are using.

[1] https://github.com/devicetree-org/dt-schema/blob/e6ea659d2baa30df1ec0fc=
c4f8354208692489eb/dtschema/meta-schemas/clocks.yaml#L26
[2] https://github.com/devicetree-org/dt-schema/blob/e6ea659d2baa30df1ec0fc=
c4f8354208692489eb/dtschema/meta-schemas/core.yaml#L29

- Randolph

>>>>> +		clock-names =3D "core";
>>>>> +		interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
>>>>> +		power-domains =3D <&k3_pds 130 TI_SCI_PD_EXCLUSIVE>,
>>>>> +				<&k3_pds 373 TI_SCI_PD_EXCLUSIVE>;
>>>>> +		power-domain-names =3D "a", "b";
>>>>> +		dma-coherent;
>>>>> +	};
>>>>>   };
>>>>>
>>>
>>=20

