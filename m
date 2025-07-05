Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C2B1A073F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751724372; cv=none; b=q+Gsbzp4kf2jxgDY2gs7/+AcnlZOoVjTIqToKulF6QYz/zzkCdI2ESGHGZaHNKUzchzgGmWyF/hprrl5ki9BDZnZftZOaenYN+TDKfh/VX6TSciZG05KUQFeU+qCWTjTJeCfje2mwk3JAFhyefTE1Dk4iSM7MopiL7hyU7Aqm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751724372; c=relaxed/simple;
	bh=/HOVbTYQCHsMdDDq7gBoIFw9FEg0lNKVNqIBp1PBLtY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=oEzkKH7/AvRl+sNBBT4d8U3WQFfYqSGO/PEyAT+L6GugX1kePZ7mBGc11BYbBObkaP0NUzMU5fC8e7BMYv1SpMAjSY5/B2GS3VA1spx+gRwOg52TGX+qkbp/VWDNZ6QqF3iFEFodFTrR1zTpvDmVlCSUSdxMAcM8TYazXkNR3l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=zY2LkYgW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EuISihaT; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="zY2LkYgW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EuISihaT"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 6984E1D00027;
	Sat,  5 Jul 2025 10:06:09 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-06.internal (MEProxy); Sat, 05 Jul 2025 10:06:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1751724369;
	 x=1751810769; bh=o984k9J9qiUodd3G7z/DU89+EKzgqyct3JlnGKUqBiI=; b=
	zY2LkYgWo3jpfb6k0dqCLz4MdXLNJAdE84WX18+dtYBrw0kBjpi122YbhDFYd57h
	JwnNcoe+9vQo5i6qwlXM/VxjwLCXTEa+Js0odv5xO+05APf44IWd6FqFzV52A76x
	GBdUn10zMOPvLlqVbXHHdmWDnA7LVisuxji2U56vGVg1D3yyOjwvPtTBK62QRRBs
	U9XlDAInqk+S5vf7L+g4OpS72e8t//BCXRU5x3hT5W+rhdj8vTTFYsVYm8NWLYEQ
	xyNzdR2d0QC5j9iDHoeyQt321DDWs9TOpf/MJKtCoJKCd9RK/hrFxJh5Y887ui07
	TU9vX5dw8wIKByWLS7JnqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751724369; x=
	1751810769; bh=o984k9J9qiUodd3G7z/DU89+EKzgqyct3JlnGKUqBiI=; b=E
	uISihaTJzQxzqKwmUybA0iC++QT7LUqeDGwxq72NQyyLPk4Ndwf2cvqnelWZ2CWB
	aXyMSNj2vLjRK+vD4vZwLnzO2wY1zlz4Pgz189ECx4PB6AMO2DzYNV7l+vk4rFs6
	K50WtGUGdZu2nIVTgxlSG4svIsRWl2gplJK74Z7VuO64zmjqz94yKOvqT9PtXhZN
	vjaMyIRjbm/SGx0NMYB9c6dIn8OoIBIX2tAOwoBSLAIpt8pPODLuZiYclB4MIsID
	gGUsX268e1CgTMV9pLEovDofDfpfiFwIrKjaQ3WwKPLsIUJkmlCNqC9T4iu3DYHD
	qENkgRYiBJp5l/PV6QBRg==
X-ME-Sender: <xms:UDFpaDdhab2qtFffBA-bwhs_34a22IrVbEvCQRa0wcXc0E7qDlaHVQ>
    <xme:UDFpaJPq3-uGSTQ85qsLW6MJFnlHnZao05IOm8HfU6u-yprTgd-FCosWU8H9-gFd1
    QKKJIwTwDIBI-oHGKs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddviedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdflihgrgihu
    nhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffekteehhfelgfdvvedvkeeuffefkeeh
    heegvefhveetjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmpdhnsggprhgtphht
    thhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgvfhhfsggrihesrg
    hoshgtrdhiohdprhgtphhtthhopehkvgighigsihhstghuihhtsegrohhstgdrihhopdhr
    tghpthhtohepiihihigrohesughishhrohhothdrohhrghdprhgtphhtthhopehlihhnmh
    hqtddtieesghhmrghilhdrtghomhdprhgtphhtthhopegthhgvnhhhuhgrtggriheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhoohhnghgrrhgthheslhhishhtshdrlhhinh
    hugidruggvvhdprhgtphhtthhopeifrghnghhhohhnghhlihgrnhhgsehlohhonhhgshho
    nhdrtghnpdhrtghpthhtohepiihhohhusghinhgsihhnsehlohhonhhgshhonhdrtghnpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UDFpaMhK-0uC48R8vYz30WIhmQl4YjkZJVwk9-0ED0lYFPIaNrkpJg>
    <xmx:UDFpaE_zccSm5KIQg7BTF35eB10DEsjXNC539zrv6r8g-oN5-qzM4A>
    <xmx:UDFpaPtWNRCAAFs2LcNSY04EXHXcIr_JaO-N1ZQG0VjcBu9P3i9qzA>
    <xmx:UDFpaDEnJi0Is6LBEV2yUUtv7UskjtnefpJaA2x9Ni-h-zXrQ2HAPw>
    <xmx:UTFpaHP8-W0if7kYC_1HYWggIyq5OD0IZTYGv4c00ysGof-QmtaLp3o0>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 113B12CE0078; Sat,  5 Jul 2025 10:06:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5b65cb83a3eb81e4
Date: Sat, 05 Jul 2025 15:05:47 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Yao Zi" <ziyao@disroot.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Xuerui Wang" <kernel@xen0n.name>, "Miaoqian Lin" <linmq006@gmail.com>,
 "Hongliang Wang" <wanghongliang@loongson.cn>,
 "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Mingcong Bai" <jeffbai@aosc.io>, "Kexy Biscuit" <kexybiscuit@aosc.io>
Message-Id: <2ad0ae43-0331-4860-8f39-34ebfe02cae8@app.fastmail.com>
In-Reply-To: <20250705125710.59994-1-ziyao@disroot.org>
References: <20250705125710.59994-1-ziyao@disroot.org>
Subject: Re: [PATCH] LoongArch: Avoid in-place string operation on FDT content
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B47=E6=9C=885=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=
=8D=881:57=EF=BC=8CYao Zi=E5=86=99=E9=81=93=EF=BC=9A
> In init_cpu_fullname, a constant pointer to model property is retrieve=
d.
> It's later modified by the strsep function, which is illegal and
> corrupts kernel's FDT copy. This is shown by dmesg,
>
> 	OF: fdt: not creating '/sys/firmware/fdt': CRC check failed
>
> Create a mutable copy of the model property and do in-place operations
> on it instead. loongson_sysconf.cpuname lives across the kernel
> lifetime, thus manually releasing isn't necessary.
>
> Also move of_node_put() for the root node after the usage of its
> property, since of_node_put() decreases the reference counter thus usa=
ge
> after the call is unsafe.
>
> Fixes: 44a01f1f726a ("LoongArch: Parsing CPU-related information from =
DTS")

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/loongarch/kernel/env.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/arch/loongarch/kernel/env.c b/arch/loongarch/kernel/env.c
> index 27144de5c5fe..fba141472ab9 100644
> --- a/arch/loongarch/kernel/env.c
> +++ b/arch/loongarch/kernel/env.c
> @@ -40,15 +40,18 @@ void __init init_environ(void)
>  static int __init init_cpu_fullname(void)
>  {
>  	struct device_node *root;
> +	const char *model;
>  	int cpu, ret;
> -	char *model;
> +	char *tmp;
>=20
>  	/* Parsing cpuname from DTS model property */
>  	root =3D of_find_node_by_path("/");
> -	ret =3D of_property_read_string(root, "model", (const char **)&model=
);
> +	ret =3D of_property_read_string(root, "model", &model);
> +	if (ret =3D=3D 0) {
> +		tmp =3D kstrdup(model, GFP_KERNEL);
> +		loongson_sysconf.cpuname =3D strsep(&tmp, " ");
> +	}
>  	of_node_put(root);
> -	if (ret =3D=3D 0)
> -		loongson_sysconf.cpuname =3D strsep(&model, " ");
>=20
>  	if (loongson_sysconf.cpuname && !strncmp(loongson_sysconf.cpuname,=20
> "Loongson", 8)) {
>  		for (cpu =3D 0; cpu < NR_CPUS; cpu++)
> --=20
> 2.49.0

--=20
- Jiaxun
