Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A65238C34
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745303868; cv=none; b=sG8tPMekECCtaETFUyn+1uAFT3FMVVDfVRsUcYSmYdhb4kNj9msMVU2FiinzixdMTXddd6wk2pejYLWhYActMGENFsDUij+jH83jrJUCV82ntj5gHkgdgmnjvpWkV9lvXOBl+6NHYX5iHuzKupuaW5I6zfEyimlz48qFWI+6qOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745303868; c=relaxed/simple;
	bh=Y+3EIHN0NZoW1VUAItK2o8y7NOX8Iz9LJIK8BuOKzM4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=X1eU3CLL3IGHomOFcpurmDf5nMMTNZeItz3tDc2NnLveuSqjs88wx54CNRmXLh96XVsUzljCWTv/2LU6uYIG4AivLMSxLU5r37sWw0lKO/ZVzA4Kqwl/dbiEFXaxlot/iihJCj+ZyjREstUZ5iyDIOJHWjWVqEazkg6RXCWtdbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Lo2DLVmM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g1nYH05H; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Lo2DLVmM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g1nYH05H"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AD7232540212;
	Tue, 22 Apr 2025 02:37:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Tue, 22 Apr 2025 02:37:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745303864;
	 x=1745390264; bh=ovzNnQXCxxPbw+iTp1IpdqpMxWWHjLCLwy0mzBZVN9g=; b=
	Lo2DLVmMK/FtFkrSOVOysOqzREOMr1h2WXPm4bq+fWBNsszfH5CVV3hK5FsUM7y0
	Jno5uxNT+SSWuKZJP2FWiBV/8kMGJ3O3QVAaWZcdi8sJrSoy7THRPgQV2FW6iruK
	dJpkMrWNEqzguuS5C1WWzNBkBnslFWTRnKKCGO4tT7Wd3U5ZadcjZehT/WbXCubW
	PFgwjHyEdMS3KaFqfIzKc7EMlbRECOnPVg8S5hB5cuvKzrvLpfC9Pms2qIUJ7ffS
	UEQHKiyivKKuf7RjtBg9g6ctMy6gkzCK9z+h27WQAHrtbutW/RwgpkNN0RNuHjKq
	+4/zXZ+OKzK0zr6iNeZ5ww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745303864; x=
	1745390264; bh=ovzNnQXCxxPbw+iTp1IpdqpMxWWHjLCLwy0mzBZVN9g=; b=g
	1nYH05H51oIjk5R46oG9LPhrm5/wrbrkIQ2e/aa89VV95tBytMie7c78UkoSrT2b
	vuH+KNrnSq3TKXyM72a9/LOb4EmMtIHero0M8ApBOETcizLgt3HtRC383YsCQt2z
	8n8vrmeOGh2mCM2S5tjf5HnNUuEbXDu72ZG6CuxBCJdYR0JGkgg4SE2GZoFp5r9e
	Liurn/iFMuagnGh0e+oR7Q7pbBe1R8HckMAWsFSPq46y8l9Yv6ixMkbKgzWpb4qa
	+riOFr5h8o+/gXIVqTVH0e8q8D6pCchyv9R4e5of/13/HJeW9G3yB5p8S8domFar
	BRqwTq+eFhS/BJr9xN57A==
X-ME-Sender: <xms:ODkHaKc5Fv0UiaINKioA9VyP6u4bpXr5qgk38A2XyI6djMVF1YEMow>
    <xme:ODkHaEOyLPpD1P9G_w7K2zaHnZpHWkot7ZH6ylyJjwgPfIlRGY6QRc9-Y7HQV0grm
    Bd_glq3mI5taejNigU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeftddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhl
    ihguvghrrdgsvgdprhgtphhtthhopehluhhmrghgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriiihshiithho
    fhdrkhhoiihlohifshhkiheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtohepsghjohhrnhdrrghnuggvrhhsshhonhesohhsshdrqhhurghltghomhhmrdgtoh
    hmpdhrtghpthhtohepjhhmsehtihdrtghomhdprhgtphhtthhopehnmhesthhirdgtohhm
X-ME-Proxy: <xmx:ODkHaLhwVBRyJg07EZNHIbYq1Hyah8xspwb4rCxMzi08lBp5X8oYVw>
    <xmx:ODkHaH-6vEO2sMoYo-SBySjBGbRCZkUDi0M7vFg4X3y96a-u6yKicA>
    <xmx:ODkHaGtGQbJu5EFY65_D40pBavmmADt_MFKkHZYcTSJiwULxGeyInA>
    <xmx:ODkHaOG5mcC0M8V9A0ROFAISTXUbN-PVUcFLy0TZ5wfHhmdYps7j4A>
    <xmx:ODkHaMkuJDzim2xw0GUFaQ4xjheGeuaDujDwZcaQ96ZVu59Na6ePsXSL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F1FC72220073; Tue, 22 Apr 2025 02:37:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tafab3bbc3080752d
Date: Tue, 22 Apr 2025 08:37:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Judith Mendez" <jm@ti.com>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>
Cc: "Bjorn Andersson" <bjorn.andersson@oss.qualcomm.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Dmitry Baryshkov" <lumag@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Nishanth Menon" <nm@ti.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Message-Id: <55d306d4-c9cd-4119-8798-b65a6956f4df@app.fastmail.com>
In-Reply-To: <20250421201055.3889680-1-jm@ti.com>
References: <20250421201055.3889680-1-jm@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable hwspinlock and eQEP for K3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Apr 21, 2025, at 22:10, Judith Mendez wrote:
> Enable CONFIG_HWSPINLOCK_OMAP to allow usage of these devices
> across K3 SoC's. Also enable CONFIG_TI_EQEP which is enabled by
> default on am64x SK board.
>
> Signed-off-by: Judith Mendez <jm@ti.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

The patch seems fine to me, but you should address it at the 
TI K3 maintainers, so they know they should apply it and forward
it to the SoC tree. You have Nishanth and Vignesh in Cc already,
so I assume they will pick it up from here, just put them in
'To' instead next time and move Catalin and Will to 'Cc' or
leave them off entirely.

> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9e16b494ab0e2..1f7b97ff46a7e 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1415,6 +1415,7 @@ CONFIG_CLK_GFM_LPASS_SM8250=m
>  CONFIG_CLK_RCAR_USB2_CLOCK_SEL=y
>  CONFIG_CLK_RENESAS_VBATTB=m
>  CONFIG_HWSPINLOCK=y
> +CONFIG_HWSPINLOCK_OMAP=m
>  CONFIG_HWSPINLOCK_QCOM=y
>  CONFIG_TEGRA186_TIMER=y
>  CONFIG_RENESAS_OSTM=y
> @@ -1676,6 +1677,7 @@ CONFIG_INTERCONNECT_QCOM_SM8650=y
>  CONFIG_INTERCONNECT_QCOM_SM8750=y
>  CONFIG_INTERCONNECT_QCOM_X1E80100=y
>  CONFIG_COUNTER=m
> +CONFIG_TI_EQEP=m
>  CONFIG_RZ_MTU3_CNT=m
>  CONFIG_HTE=y
>  CONFIG_HTE_TEGRA194=y
> -- 
> 2.49.0
