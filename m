Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBFA296713
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302863; cv=none; b=flZeRcKWrIhwc0/HVp0qeVjHg2VTiGN6z+J+c49wlcD3gCV7F0b+VammySvVeZMPuR4QMTlRngbkigzEW82FIaMgmcLQ6R+MAAiqrXQibgkawbs5rv7/aCzaixUp0nZHDInrEy3DOHdX0QkcOaNvRiBjuReushY0GDhg6wP3W04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302863; c=relaxed/simple;
	bh=CreBYfWuka1y7TiG842KokhzjKFhbuzItrpNv2PcT8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVYBwoBm7BvGkodQTKagzpBvQyMwIAvxCFSrZZeL8ACbVxmJ0+hA1ObZLmuSu2p+p7Ml70g4PURudO6Kx5skla+3ge8IJ9T4xSMQWp5JMhW7RTG5cLq4HfmiLatwsGD59MWAySN0gr3ShiFYUlTqaHgaY+8VQ78fq+eQxMnWfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=amE1zNhl; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="amE1zNhl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 89B7343B89;
	Thu, 15 May 2025 09:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1747302858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hYPpHlTt26oAx0c/+Xk9ADP4ln/33H08Wnxj8uMpvL8=;
	b=amE1zNhlCdWVhhOjFuX0co6iiVu31b60ZA4Tg+eAv3tv8Ojy3JoVoeN2SFwb5Y//bFICCh
	xgm0FcglND+Y8ba6Kp0yFbdiPmDU0l5vOogifDx2ebCFh54RveohfeLlLH05P7nGevP6OC
	kpzwb1dt0qQ0rBHdKPExvXtJA1KJthFcqQ3qczVt4LoGYCAS/WHPb/D8CQkXwjxVGCJ2aj
	TVj3OmP2tkHEhOxZqCJ2hu56M6sPVoLOJLo9sTA8VXexnzNdRU2uT0pDAWxUwI+itlra+j
	OewskXbyYTlbQxPKC1Xs4x6h1gXZ9/dSPMcw6bQHeVQlOe7b451W/TEoz9P7EA==
Date: Thu, 15 May 2025 11:54:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 0/2] svc-i3c-master: Reduce IBI transaction time
Message-ID: <174730284585.1309105.12276937340014821403.b4-ty@bootlin.com>
References: <20250415051808.88091-1-yschu@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415051808.88091-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtugemvgegkeejmeegudegfhemfedtvgefmeeitgdvudemhegruggrmehfhegsmeelfeegvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtugemvgegkeejmeegudegfhemfedtvgefmeeitgdvudemhegruggrmehfhegsmeelfeegvgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhis
 hhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com

On Tue, 15 Apr 2025 13:18:06 +0800, Stanley Chu wrote:
> This patchset reduces the IBI transaction time by the following
> improvements.
> 1. Receive the request in interrupt context.
> 2. Emit the STOP as soon as possible.
> 
> Stanley Chu (2):
>   i3c: master: svc: Receive IBI requests in interrupt context
>   i3c: master: svc: Emit STOP asap in the IBI transaction
> 
> [...]

Applied, thanks!

[1/2] i3c: master: svc: Receive IBI requests in interrupt context
      https://git.kernel.org/abelloni/c/8d29fa6d921c
[2/2] i3c: master: svc: Emit STOP asap in the IBI transaction
      https://git.kernel.org/abelloni/c/81f2a9af9821

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
