Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996122D94B6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585068; cv=none; b=CkQUIFDAxCFl4uG0vpieUJMY+dNTxkTotqZjh8whniPvyAlbizJOV1tIhOyuE+aFRAc020OaxKzvzB64vg+Qe3rhgSJrL9yHAbMS4WA+SOVT28iSDDyxoHpUMKA67667S3xH8f9v9n73WAWWXXwHdpsmhMV+I+CuGTinUl0ExUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585068; c=relaxed/simple;
	bh=OB8sdRd8QcoqmeFz1QpRibhaYPd3bURA2psIKD0ep3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUlUtzWiQpfR3xW5w4i9VC6REc1K6Qppg58m4UCNhTuv7ZmFEhoBxI9sfMzAE7kgDk7KtKGtsNmx/0H7O7QbtP0wGFWm36N+TutTWiNI6gtXHIQLw1BCUJgjsIIzQiauS5fP+dcghKB1hNN+86MckVlYP3aTtoFB4dZCr+dqSn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VL3q21pO; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VL3q21pO"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0138C432D3;
	Thu,  3 Jul 2025 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751585058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IzHZz3REpQe6+TxlvDO5PuSOOf9kHVQFez8f/Q4aQGQ=;
	b=VL3q21pOtiNokjilR+zFIGrVJxpN67xVti/M4JDwuuEFt1WoXLzrowKYTgFcq98xlSkpfK
	IhxWxre0P3a116sNpWc+YTQ7rwlz9kvmwAw1SgweN38P4/st38SSpacWwX1Ta57IW3vmOj
	p7EK+h/BcuAcffiuwbgJ0T3hLt9H6t88umewwj+RAz1m+3hBg0JkC2JSmOtI73HtESJSPs
	2iOGF1j5FPBvv4HIowyMrrhtL1K2o71Jaz0KsNEe4eLdJJHEStI2yZ2fOOrtilocE39yjW
	7AnfjyuM7h6oBMZVN+pSCiK4PjI3Qv3ccaLggZmHqwe8GQ1naGqkXBNx0q1ZLw==
Date: Fri, 4 Jul 2025 01:24:17 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Initialize ret in i3c_i2c_notifier_call()
Message-ID: <175158504911.797604.18214189738603124144.b4-ty@bootlin.com>
References: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvudehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemvgdtfhgvmeegfhdvfhemvdelvgegmeehudejtgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopefhrhgrnhhkrdfnihesnhigphdrtghomhdprhgtphhtthhopehjohhrghgvrdhmrghrqhhuvghssegrnhgrlhhoghdrtghomhdprhgtp
 hhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 22 Jun 2025 12:11:07 +0200, Jorge Marques wrote:
> Set ret to -EINVAL if i3c_i2c_notifier_call() receives an invalid
> action, resolving uninitialized warning.
> 
> 

Applied, thanks!

[1/1] i3c: master: Initialize ret in i3c_i2c_notifier_call()
      https://git.kernel.org/abelloni/c/290ce8b2d074

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
