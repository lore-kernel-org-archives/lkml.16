Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3AB166F32
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738688183; cv=none; b=gSer+tDTj8giiBzU/HY7qIkAG3Tr451gi4XRW7Zul5hN/wgLC/MFea1ctreEwhf+sD54Aj1EFOurfjqvey1J1tA7aB+g+PKZSXAeM9IB74Jp5ozwdv7aWmP971vXHW1/yGDJzpN8nkoR6WqYaxx0PyeYtEldstEERIeIJNCeByg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738688183; c=relaxed/simple;
	bh=Hu7ohwGLlNwT9J8/0+8URlm003trsIfUAkj3bRDp9GM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaRX5FCnKmEjCYmlEnxYRKUoOsUBMFqcXMFdr4IOTeKycpVUGbYGnVt2l9DaNwtbuBhX25+yJ3jlHs1K5huTXh3TT26GtuY0J8zf58cEyAOUQCtveLQo/qtsC6RC2HuIZwK9taEWKyYkbksvB5ircOJCtGbxOfg/nicbGil10rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WPCEQvnN; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WPCEQvnN"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 445A244417;
	Tue,  4 Feb 2025 16:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738688179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yISyECt6ebMIFMXO+V2Q2GFUBfI2I/MCGAr0MqWb81Y=;
	b=WPCEQvnNqsA999cq4xjvpIt1sR/ohh8NNx+sl36igxrh+OXlSfYrzITu6MwvIDScuuUxgC
	9qysoQFadYkIJlRVAX2Wk14KSi9lg3fFhyZrewSQ0LUfnX2G1oinknIBBO6LL/Aq3mc3Sr
	aazYCOPoCiMkYM7gFtJUt7n/34lDJoBQnJo9tocfpWc1q3LUqZKPcfrcNnQk/eXCWFI1l9
	5AhBflI1N0DPgaLiACb6BcCMDhlVaaej+HOnMcw97MVvhufxF54I/nQ6qKxv3aK2R8DK1X
	Tg9avsjgNuKzh5oG5+DpOcaXAmrZsl1PNx5fArQ5o0ZTWmOCTojhuZIBqfEEmQ==
Date: Tue, 4 Feb 2025 17:56:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"aniketmaurya@google.com" <aniketmaurya@google.com>,
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <2025020416561726c9efa0@mail.local>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
 <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvuddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduvefhvdehlefgieelfeetudeugfehgfeugfekleejueefueettdffueetiedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemrggutdefmeegfheltgemfeefjehfmehffeefugdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtoheplhhinhhugiesfigvihhsshhstghhuhhhrdhnvghtpdhrtghpthhtohepsghilhhlhigpthhsrghisegrshhpvggvughtvggthhdrtghomhdprhgtphhtthhop
 ehpghgrjhestggruggvnhgtvgdrtghomhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghonhhorhdrtghulhhhrghnvgesshhilhhvrggtohdrtghomhdprhgtphhtthhopegrnhhikhgvthhmrghurhihrgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepufhhhigrmhdqshhunhgurghrrdfuqdhksegrmhgurdgtohhmpdhrtghpthhtohepjhgrrhhkkhhordhnihhkuhhlrgeslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 04/02/2025 17:50:14+0100, Thomas Weißschuh wrote:
> Hi Billy,
> 
> On 2025-02-04 10:09:31+0000, Billy Tsai wrote:
> > > On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> > > > The change is necessary to enable the use of the
> > > > `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> > > > `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> > > > ensures safe handling of I2C messages when using DMA, making it essential
> > > > for scenarios where DMA transfers are involved. By removing the `const`
> > > > qualifier, this patch allows drivers to prepare and manage DMA-safe
> > > > buffers directly.
> > 
> > > This is missing a changelog to v1 of the series.
> > 
> > > Also I asked before why it is not possible to change the signature of
> > > i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
> > > That looks like the nicer solution to me.
> 
> > The i2c_get_dma_safe_msg_buf() function has existed for a long time,
> > but I do not know the original reason why it declares struct i2c_msg *
> > without const.
> 
> I would guess that nobody ever cared before.
> 
> > However, I believe this is because the
> > i2c_put_dma_safe_msg_buf() function modifies the buffer data, so for
> > consistency, it is declared without const.
> 
> IMO that's a weak argument.
> Maybe the maintainers have a preference?
> 

I guess Wolfram will be the one have the preference, I'm fine using the
existing API as-is.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
