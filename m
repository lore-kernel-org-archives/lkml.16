Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8A433DB
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 09:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739006678; cv=none; b=dPZjz8xVK3NK3WU+xeZG7cxn2cizT+mJa0WNK1/HfoW8C+/4WSh801vQGr4/p4otdrB69yf+SzhTUlTcoVj2Dm0yLJw2HnudIlKGQJonkpEbQso+md618ZMo8EKjabMrEjKNq06ydkIqNHcgDm5jS43QyS6NUlAvxfYnaMusjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739006678; c=relaxed/simple;
	bh=HCWULguJiC9/a/7cNPp63AS7VFBctan+9zWoEoE5eIM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UIVlEsxKKnZzfFf5w8f1ZPyEfnDihIndyoUFMPg8hKyc/5jXJOVuCv0Fjsl1PPNBR3OeyW30d4VEixV0fvo25nlYFBjnvNXvj/8Bu1CF1le3a7QFdOx0m4dQMnYnGKCtU6qexqvmR1YGEkxlGK4+9LeXbqt8/NtD612/ULIG93E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; spf=pass smtp.mailfrom=svenpeter.dev; dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b=i+l+F/HK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X32nboae; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svenpeter.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svenpeter.dev header.i=@svenpeter.dev header.b="i+l+F/HK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X32nboae"
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 5FE0511401A4;
	Sat,  8 Feb 2025 04:24:35 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 08 Feb 2025 04:24:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1739006675; x=1739093075; bh=s1EPUafcPNXclCuOINSGMBbvgYoKzy3O
	rMOtTqPofOA=; b=i+l+F/HKXkOI+dOcO7SERfcCh5zvIRPXLyWvkvFIuq2A+AmI
	WsEbbq+uOihQYUbpfJ3+yMhm+6Qgk6K+Hv4CWgR1fII67079FBhGB+KGGB3xkvI0
	MEnG2FL1DE3n1uexmgrSv9yco9iZhdksHsD+kJ0mp5L3F5HgnQt4Zl1KFbmcXvmv
	gAn9XmCLahMM0weCkguahaWwkbwXySSv8VWmAjsgJ0wOFH4kyYAPGa88lVCUk4q4
	ZvQLYxQwB9nedWTYkFuvyR1O6D0PNfHoiGEFokLcuGD9eir7NbDFH8+C7jyKfw6h
	CxclvJeeXG7U3nZzQloZEYCbp+CZ8xFNSgEN/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739006675; x=
	1739093075; bh=s1EPUafcPNXclCuOINSGMBbvgYoKzy3OrMOtTqPofOA=; b=X
	32nboaeUxieqtbzFci69zBqqUd7+Z3dFHp437mJC99DwxAufWD36oklpnagdRinD
	F7y0kGwYG0gjWOgyS6NyaSZdFKi76D9F/5q+WJF7u529GY/gifLwQrLeQe6q0/YA
	Y4T3bNuqN83Bx1i/3i2XGSL/QeKX48Hkjzjq1/tJ9dT1V1xGgdk7qNIH+8+38FzZ
	5PgnrCLPGs+2u7su4jirv+FYux7vewj1gCWQnk0G5zLQtJgejSj8ttjNgXpro6Yn
	YHDlmfRr03WqJU4vc1XvglUgkB8agpfQatdb12rt36kaahPSa4eFt/W6gnGR168W
	PmDwxwwBxss8okBqirFsw==
X-ME-Sender: <xms:0yKnZ0d6ZrRGzCuWG3C9603r4_7vzW1tssn6zTsraKXD4hGF90-XXw>
    <xme:0yKnZ2P253RzUGW6Iv_Uzq21wz0nahDwRx4mGgwMVvOhSHouAJK1LL5aHyPaagvNa
    9KSMfdqryBp7xECNxI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfuvhgvnhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvg
    hrrdguvghvqeenucggtffrrghtthgvrhhnpeelfeetueegudduueduuefhfeehgeevkeeu
    feffvdffkedtffffleevffdvvdeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehsvhgvnhesshhvvghnphgvthgvrhdruggvvhdpnhgspghr
    tghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghrnhgusegrrh
    hnuggsrdguvgdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehl
    ihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthht
    ohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehmrghrtggrnh
    esmhgrrhgtrghnrdhsthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:0yKnZ1gyxSJ7Mohm0PXEZH_KvdQSiVH-1qRoxtcscRLNnDoT7sXtPw>
    <xmx:0yKnZ5_rNPcq_KQM_eQf4WUmaYR42QNJf_6mjVeF7-VAapdsYUNqLA>
    <xmx:0yKnZwvxECInv3BL_lETSSrYLKIyyF2fQMnRvOtAa6lDHX8c3Odxwg>
    <xmx:0yKnZwEg0foIAyvKeMWTtz1Mh8jcUs23KedX3N2W3UhPbBzCckgWKA>
    <xmx:0yKnZ0j_kk4NlFtaMdALGL0atrebfknnAMpExSuHSBKioRJ83han9DVV>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F2BDBA006F; Sat,  8 Feb 2025 04:24:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 08 Feb 2025 10:23:40 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Janne Grunau" <j@jannau.net>, "Arnd Bergmann" <arnd@arndb.de>,
 "Hector Martin" <marcan@marcan.st>
Cc: soc@lists.linux.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <4121b7d7-1f5b-4fae-b076-5c29fcab0c3e@app.fastmail.com>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,


On Sat, Feb 8, 2025, at 10:22, Janne Grunau wrote:
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Sven Peter <sven@svenpeter.dev>


thanks again for stepping up :)


Best,


Sven

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 
> f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f259688c7791ecfd10423 
> 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:	sound/soc/codecs/ssm3515.c
> 
>  ARM/APPLE MACHINE SUPPORT
>  M:	Sven Peter <sven@svenpeter.dev>
> +M:	Janne Grunau <j@jannau.net>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
>
> Best regards,
> -- 
> Janne Grunau <j@jannau.net>
