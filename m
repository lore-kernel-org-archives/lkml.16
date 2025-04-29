Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198D520D4E2;
	Tue, 29 Apr 2025 02:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745894694; cv=pass; b=p22AEQz+9VsIIvUOaLFUcf8JvdikN6QscMZ9l5+XIqRIj4tZyF5toksOPlTOiXGr8RpZhthWdK2HcfUule6SVDD2uMRsAOzVFQ6cf4s5PhRy6Y3cyMc9yTml0ni786Nay5TUi0DaCo0mqIjS69r9xk9/M9rCBDfJZSFZM0GpsVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745894694; c=relaxed/simple;
	bh=80hSbyKne/0EugL7CapBvsxNWe+IjuzVuUn1HpWWPrc=;
	h=MIME-Version:From:To:In-Reply-To:Cc:Subject:Message-ID:Date:
	 Content-Type; b=W8oo9ovWK8WK6qPYg/GJ3TFpcOH+Xipb4/tZMMx8R9SBEFKUKiTv1VYj4xo9mO7VNN47ui+vJ2nAvaPcpEGFvGo693ImyYPy/026/JzbaUAi0WcyRlE0VKxd/z+JFxWcS1ZHdtIS0GCNlY4gE7NuU6vn0akA7q7aepmjclP9Ak8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=rxu3yHkM; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="rxu3yHkM"
ARC-Seal: i=1; a=rsa-sha256; t=1745894658; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W7Yqbl3KpTat/YCL5zO60BQism51l0PaZskt2Vj3NMRX7/ATEeDYjoIbfFXiqp9Redyr6QPoajgVisPtElobNqgguNSYYBvcWvTa1ZcmBE+geEWfZJUHcf8URe2450CtFeuXEcA52oRitOHYJ+gkZ1fHPEjNHw+FIGzqoA3gL+o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745894658; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Y8qohLpxxXxjlKsGCMSvmJyXGDphODOZWso+yF8m3A0=; 
	b=YeU8SaNId4zOrIMVHLz8bFrSr9UiTlEtuGhiOiak6R54fg53lmOnTdh4NN+X3TSyItXEZTVlPtjNOxQoG1U7KQuEa5IhgUHJu8luYh/6585S3LnbomIVE8azzmUU41iK+1AcpxWFt0rkFIHw+fnIJ8KnmfD3Snfi2KN+Co4qD/M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745894658;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Y8qohLpxxXxjlKsGCMSvmJyXGDphODOZWso+yF8m3A0=;
	b=rxu3yHkMtXenqyShakil1PCUh7UQ7F9cG2qo8QLzJXOwSBpHvYGMOCDE4HwX2Gg3
	1qHPo9fVI3cYtJ8l5W0dPJ68jFneYBTM8DjWZ7e9Q8U1PHpRIW1/jx9bImqvok5Niyn
	ZPKBoZd3avLaZz+kdP/h12Z0oZ00DKDUiKpldNqw=
Received: by mx.zohomail.com with SMTPS id 1745894656786665.8936609850081;
	Mon, 28 Apr 2025 19:44:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Conor Dooley" <conor@kernel.org>
In-Reply-To: <20250428-water-sermon-eefdfa511f8d@spud>
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
	<linux-riscv@lists.infradead.org>, "Junhui Liu" <junhui.liu@pigmoral.tech>
Subject: Re: [PATCH v3 2/3] riscv: dts: add mailbox for Sophgo CV18XX series
	 SoC
Message-ID: <183aa9ef25290278.6bcb31a17e34dfae.e6a8b825df767676@Jude-Air.local>
Date: Tue, 29 Apr 2025 02:44:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi Conor,
Thanks for you review.

The previous email accidentally lost some Cc lists :(, I'm sorry to
harass you.

On 28/04/2025 17:55, Conor Dooley wrote:
> On Mon, Apr 28, 2025 at 08:39:45PM +0800, Junhui Liu wrote:
>> From: Yuntao Dai <d1581209858@live.com>
>>=20
>> Add mailbox node for Sophgo CV18XX series SoC.
>>=20
>> Signed-off-by: Yuntao Dai <d1581209858@live.com>
>> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>> ---
>>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts=
/sophgo/cv18xx.dtsi
>> index c18822ec849f353bc296965d2d600a3df314cff6..f7277288f03c024039054bdc4=
176fc95c2c8be52 100644
>> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
>> @@ -55,6 +55,13 @@ soc {
>>  		dma-noncoherent;
>>  		ranges;
>> =20
>> +		mailbox: mailbox@1900000 {
>> +			compatible =3D "sophgo,cv1800b-mailbox";
>> +			reg =3D <0x01900000 0x1000>;
>> +			interrupts =3D <101 IRQ_TYPE_LEVEL_HIGH>;
>> +			#mbox-cells =3D <2>;
>> +		};
>=20
> No user added here, is there another series in the works that adds a
> user of the mailbox?
>=20

There isn't an actual user node in this specific patch. I used a
`mailbox-test` node to verify the functionality in this patch series.

The intended user for this mailbox is the `remoteproc` node. I plan to
submit the `remoteproc` driver patches once the corresponding reset
driver [1] is ready and merged.

link: https://lore.kernel.org/linux-riscv/20250209122936.2338821-1-inochiama=
@gmail.com/ [1]

>> +
>>  		clk: clock-controller@3002000 {
>>  			reg =3D <0x03002000 0x1000>;
>>  			clocks =3D <&osc>;
>>=20
>>

--=20
Best regards,
Junhui Liu
