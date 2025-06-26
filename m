Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486FC214A6A;
	Thu, 26 Jun 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940903; cv=none; b=OwX5Dh10j1TkHI7veL842vaqloa3cbavuf6A3gYVIu2o/HvB3T1QvcMfZaq8lJPUatmyy7roYHwDJDzbEmVH6AqjZVdgR9dxWEhfV9i6ug6+NGv8nM8r5BO42mW2XPjjjsAOLXDizIW/SlUGOaAc4DMYcTIEfZLajtTlRdsZVKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940903; c=relaxed/simple;
	bh=yhvCapA+CzAoCFu5PttVIJhSrWZvvCFVrtw0oQI/xk4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eBkGYhEHNliOE4ibUgpiJsAxAB97krpnCQMb6FvwOL82fqMd4H7oWnEOr6Yv4MiLSgCDLQyV6QGCaRy5YNjPtm1YmDlBZLnMVe3P6Ns6jOGphkkgUsELCVi2MDehUYZJ+eTsee42nQAdF2IzSYNOQKMIaFlfS06TKUH+/QZdDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net; spf=pass smtp.mailfrom=arunraghavan.net; dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b=TbbJ1xVu; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gxcBYFUP; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arunraghavan.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arunraghavan.net header.i=@arunraghavan.net header.b="TbbJ1xVu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gxcBYFUP"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 47B94140008E;
	Thu, 26 Jun 2025 08:28:20 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-05.internal (MEProxy); Thu, 26 Jun 2025 08:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	arunraghavan.net; h=cc:cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to; s=fm1; t=1750940900; x=1751027300; bh=yhvCapA+CzAoCFu5PttVI
	JhSrWZvvCFVrtw0oQI/xk4=; b=TbbJ1xVuOel5NBzm4nPMYSOuThjpyG2gbSPJy
	ROVsIUOlZ7tyCu4ZnCXGXSY6bmNlbRtyeW2SFzyp9GLPKnKip1a8JHEyT8MAXvGv
	05FVqwj+ly3gfnFi+bEQPzc1Yi/ceJ0zlzJkJtoktOSYUBYcWi8AogJoHJpAObx/
	H21gnwgQOJGPaW9zt3jvI0hAhv9Fv4rFZVzUA8aQGil201ustbWN+JsaS3ibUEBI
	lC/yU92g0PpQw9lJIeZBRkOkjGNdgPssm1eQAz4/RKAo8NkCblatKlkd65NtlrGF
	Fa+fCJJWHUp2Kybbrg1Ocn8m9FogNULKOju8G6NIuLymkj4hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1750940900; x=
	1751027300; bh=yhvCapA+CzAoCFu5PttVIJhSrWZvvCFVrtw0oQI/xk4=; b=g
	xcBYFUPBVr90AAVrd33kClnU5uge/cKZ/GnL2tO2EYN9prKe2+vh/FeAfo3xmLRO
	UO/dFRBeNtzSQFxBxnjXdTg0YpUSUYnBEo+9K449DRuxFtIz2bI+FzvtNSvkmtZS
	K1X8gcpSMna++Rtm6jNcfmC51lxhdOJBKVh/gjXkZJwlv0Ze9d9teKltOqiMRn1R
	6+3NBj0rF1T/zjwTsrqexKIXAugzKCEWN8Z+EKIy2+I5kKiNNSk3JsscN4bMzr3a
	ERbBBkcCflYTlX1GqCm2HtxOPGZdXNOzyMUVJijE8egjWqBFc9ETSiQQbcBJLYwm
	ifgyCx1TFaza2qoBJfcTA==
X-ME-Sender: <xms:4zxdaJKldw4msyA2lykWx7cybRCgvuNal9hOIX0RJADW6t8MvgdQwQ>
    <xme:4zxdaFLHQC4Pt8glC_tcFMyor7ePCBYNPzhxQ74H39k6Ld1F7GY9eGFIknWoptpQR
    v9hSEUpgaXyp_YLBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    foggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhunhcutfgr
    ghhhrghvrghnfdcuoegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtqeenucggtf
    frrghtthgvrhhnpeevkeehvdetudfhlefhkeffvdeihfegffdvffdtheekvefhuddugfei
    gedtiefgleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrrhhunhesrghruhhnrhgrghhhrghvrghnrdhnvghtpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghruhhnsegrshihmhhpthhoth
    hitgdrihhopdhrtghpthhtohepgihiuhgsohdrlhgvvgesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehlghhirh
    gufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhitgholhgvohhtshhukhgr
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhhvghnghhjihhurdifrghnghesghhmrg
    hilhdrtghomhdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgii
X-ME-Proxy: <xmx:4zxdaBvioLcHnJGPpA2p8Dxwhf7ZHV2nttdCgTTfKUhYnEehvRem0Q>
    <xmx:4zxdaKbza9p51z2E_JEPr29dT0w0LsdjfVZqiGcZyKVcKjmCn_UCLw>
    <xmx:4zxdaAamKcq8otUpRvuUhOw2f7NnUylhuwgHGcahzj2bN0WGTrqRnQ>
    <xmx:4zxdaOCwU0H_Bs3aRQrILB8OU6tQ8WC44co-ZqhqlYerCsXdv4oqMA>
    <xmx:5DxdaIFLZ4RAkBVav2vgksjqVV2YQuIcbPpDUD4fv1pkrqzy36ajz68E>
Feedback-ID: i42c0435e:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2BE93B60069; Thu, 26 Jun 2025 08:28:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T475c73c73170c175
Date: Thu, 26 Jun 2025 08:27:58 -0400
From: "Arun Raghavan" <arun@arunraghavan.net>
To: "Fabio Estevam" <festevam@gmail.com>
Cc: "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Xiubo Li" <Xiubo.Lee@gmail.com>, "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Pieterjan Camerlynck" <p.camerlynck@televic.com>,
 linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Arun Raghavan" <arun@asymptotic.io>
Message-Id: <fe9956b2-4d71-4a57-ab70-6ff64c4525cf@app.fastmail.com>
In-Reply-To: 
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
References: <20250626115218.141874-1-arun@arunraghavan.net>
 <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in consumer
 mode
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Jun 2025, at 7:58 AM, Fabio Estevam wrote:
> Hi Arun,
>
> On Thu, Jun 26, 2025 at 8:52=E2=80=AFAM Arun Raghavan
> <arun@arunraghavan.net> wrote:
>>
>> From: Arun Raghavan <arun@asymptotic.io>
>>
>> On an imx8mm platform with an external clock provider, when running
>> the receiver (arecord) and triggering an xrun with xrun_injection, we
>> see a channel swap/offset. This happens sometimes when running only
>> the receiver, but occurs reliably if a transmitter (aplay) is also
>> concurrently running.
>>
>> It seems that the SAI loses track of frame sync during the trigger
>> stop -> trigger start cycle that occurs during an xrun. Doing just a
>> FIFO reset in this case does not suffice, and only a software reset
>> seems to get it back on track.
>>
>> This looks like the same h/w bug that is already handled for the
>> producer case, so we now do the reset unconditionally on config
>> disable.
>>
>> Signed-off-by: Arun Raghavan <arun@asymptotic.io> Reported-by:
>> Pieterjan Camerlynck <p.camerlynck@televic.com>
>
> What about adding a Fixes tag and Cc stable so that it gets backported
> to the stable trees?

Sure! Will send in a v4 with both of these.

The commit that added the initial fix (3e3f8bd56955 ("ASoC: fsl_sai: fix
no frame clk in master mode")) refers to an errata, but I could find
anything in a couple of imx8* errata I checked.

I was wondering if there's any public documentation of this that I can
refer (and link) to?

Cheers,
Arun
