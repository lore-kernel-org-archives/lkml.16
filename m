Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7A286D7A;
	Wed,  7 May 2025 13:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623720; cv=pass; b=Ps0XcNMXLOrofDypGzguFv5TSWE3m/nLNIRpyHt8EeC2gw/ULo21i7qidQBeA5H9UbSH3BEaTOE0I3JpZ1vREoUogdkG3PndJSK/Zuy+CvKk7o6kfdCZlQ01zck/LQS57TlmrfLF488R8jvuDyUUKiO2jBkCLNydKyTbCgkqKL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623720; c=relaxed/simple;
	bh=2yOg3Bb/rac0XgXN9hTPToGcLyfnbfMaRV2hE+l7Eg8=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=noDxaNEIxm9hpf/vsKVekA7geao0mJDJa9tXUj2oht5Qxv3v/hIdUIeZayx8nnpQ5Gb4Li+hQ9dZWzTHZtBUN81ppQP9CTzaAgN6+ik+7HjyXSDkyzshzP3G/suIV5w5q02KkBR273UD7gcpaq1onBzmJMx/7TrvsoinRouRvos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=HUYLgu2n; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="HUYLgu2n"
ARC-Seal: i=1; a=rsa-sha256; t=1746623684; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eDcPnx8EZoR6mILNb1tC9QJ2hoMrWLxxe6xqeD5gDldVIaSd5yha8mjGIS6OpzWm+uQOrDic4bA8+9+3OiETC12L5zJqUxEVBdGn29v/Le16i+Cqs1r0OJDkSLQGN96Qx8WLmRSGm6hVrKJc6Z6fOuiFMG0x8VQHieTu68DKmAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1746623684; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZsmKLqMYFF5FclFI2zl2gM9NnSF+GvqV6ouEAfjIasM=; 
	b=iZ39D3xX3qtNwIulRL+AXulntpwWckebQj6nyzJ9/p61cdTJzvc0dPnR5qVaEAR9Ao2z/n11WrVXFTiKb1qp37N1i0ybVTU8jb24Uuglx0N4qS3o7L0lD+1dNtrYTDtVsCnbeUOrE3yq5vuVJqNp8byFI8QnewwHDUkzkGQsaJo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746623684;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZsmKLqMYFF5FclFI2zl2gM9NnSF+GvqV6ouEAfjIasM=;
	b=HUYLgu2nlDBywApn/QVH6qKLLqV/PsDfMGc0ZbZByNa026ebRL8Q1Rcb6u8sgcaX
	hQQvKZ1+cRh3O5d+5CosaREm+17xzQhycT+XLT8zSaRlDEKkHiQdAJJLOq+qQOb2b9N
	eNR4nbf8FU9ACw0jDJhWNx8kvJXkQDIihmERn0QQ=
Received: by mx.zohomail.com with SMTPS id 1746623681228340.1573753215861;
	Wed, 7 May 2025 06:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Inochi Amaoto" <inochiama@gmail.com>, 
	"Conor Dooley" <conor@kernel.org>
In-Reply-To: <myug24f2rnscxracipkv2ghsjlv32qcyui6u4ckpwtaij6bw3x@yesvbm6vh5ls>
Cc: "Jassi Brar" <jassisinghbrar@gmail.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Yuntao Dai" <d1581209858@live.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
	 SoC
Message-ID: <183d40fa26bbd878.d80bda6c3142fde6.abe31e31d76ed1ce@Jude-Air.local>
Date: Wed, 7 May 2025 13:14:33 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Inochi,

On 07/05/2025 20:12, Inochi Amaoto wrote:
> On Tue, Apr 29, 2025 at 02:44:10AM +0000, Junhui Liu wrote:
>> Hi Conor,
>> Thanks for you review.
>>=20
>> The previous email accidentally lost some Cc lists :(, I'm sorry to
>> harass you.
>>=20
>> On 28/04/2025 17:55, Conor Dooley wrote:
>> > On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
>> >> From: Yuntao Dai <d1581209858@live.com>
>> >>=20
>> >> Add mailbox node for Sophgo CV18XX series SoC.
>> >>=20
>> >> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> >> ---
>> >>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>> >>  1 file changed, 7 insertions(+)
>> >>=20
>> >> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/=
dts/sophgo/cv18xx.dtsi
>> >> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054b=
dc4176fc95c2c8be52 100644
>> >> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> >> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> >> @@ -55,6 +55,13 @@ soc {
>> >>  		dma-noncoherent;
>> >>  		ranges;
>> >> =20
>> >> +		mailbox: mailbox@1900000 {
>> >> +			compatible =3D "sophgo,cv1800b-mailbox";
>> >> +			reg =3D <0x01900000 0x1000>;
>> >> +			interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
>> >> +			#mbox-cells =3D <2>;
>> >> +		};
>> >=20
>> > No user added here, is there another series in the works that adds a
>> > user of the mailbox?
>> >=20
>>=20
>> There isn't an actual user node in this specific patch. I used a
>> `mailbox-test` node to verify the functionality in this patch series.
>>=20
>=20
> I am happy to see the way you test it. Can you add it to the cover?

Sure, I will post the testing process to the cover letter in the next
version.

>=20
>> The intended user for this mailbox is the `remoteproc` node. I plan to
>> submit the `remoteproc` driver patches once the corresponding reset
>> driver [1] is ready and merged.
>>=20
>> link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochi=
ama@gmail.com/ [1]
>>=20
>=20
> I will submit a version for this in the next rc1. I think you can submit
> you remoteproc patch in RFC to get it reviewed.

ok, thanks.

>=20
> Regards,
> Inochi

--=20
Best regards,
Junhui Liu
