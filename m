Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F4215781
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738687823; cv=none; b=OGg9pnQMvABawBaMKej7cT09K8wxR8CpEZ1ufP8UrSKWQQG9F75rSqL8mxp37Q+01Yu/rL5d8Yi9Pqt6CRB81Eh+vefIIzS8H2JzgRlsTesoW38bkKPC1TwMNqSs0XH0cCxCIshOrMbqOoSzA4ywOihO7LUrpk7l6CVbYdFsuSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738687823; c=relaxed/simple;
	bh=Sf3PNexg95sapIEeN1jpmuPLmjmuORMj48u5SXvH3zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzD8LJiQVNxkgH1rRTV+gaaqkM4OrvD/o2feVfz/JsMi4PDzzUIPTP8/TYTcntZqPOJcf3Rmvjx0XXfg8NYKOScFmFsyZJRZcX4a5Xi8EZEEVS7lbB112esTRpw42ArWajO/lSEcFsI6/4qruXakqm2vVSqBWJbpmml+N0NOmxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=ss/DdBOu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="ss/DdBOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738687815;
	bh=Sf3PNexg95sapIEeN1jpmuPLmjmuORMj48u5SXvH3zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ss/DdBOuSN7hk6hl3jkuiofAQMF3jfP8z7cGmp/abgAww20ttNW5Zb42qPZgszyiz
	 GZ+JUZTuJZIeXALmPFYXZkqtfPt5Mis6HFiXCJ2JYjltUJLaaEdyZrlQdz0ZKMjUqn
	 3iltZLlGCJi2/QS3hkbm5ovvp5MDJ2xaJ9gRYbM8=
Date: Tue, 4 Feb 2025 17:50:14 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, 
	"pgaj@cadence.com" <pgaj@cadence.com>, "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>, 
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>, "aniketmaurya@google.com" <aniketmaurya@google.com>, 
	"Shyam-sundar.S-k@amd.com" <Shyam-sundar.S-k@amd.com>, "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>, 
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, "xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>, 
	"Guruvendra.Punugupati@amd.com" <Guruvendra.Punugupati@amd.com>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <f05fb969-0632-48a6-afcd-c526c8568d4b@t-8ch.de>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
 <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>

Hi Billy,

On 2025-02-04 10:09:31+0000, Billy Tsai wrote:
> > On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> > > The change is necessary to enable the use of the
> > > `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> > > `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> > > ensures safe handling of I2C messages when using DMA, making it essential
> > > for scenarios where DMA transfers are involved. By removing the `const`
> > > qualifier, this patch allows drivers to prepare and manage DMA-safe
> > > buffers directly.
> 
> > This is missing a changelog to v1 of the series.
> 
> > Also I asked before why it is not possible to change the signature of
> > i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
> > That looks like the nicer solution to me.

> The i2c_get_dma_safe_msg_buf() function has existed for a long time,
> but I do not know the original reason why it declares struct i2c_msg *
> without const.

I would guess that nobody ever cared before.

> However, I believe this is because the
> i2c_put_dma_safe_msg_buf() function modifies the buffer data, so for
> consistency, it is declared without const.

IMO that's a weak argument.
Maybe the maintainers have a preference?


Thomas
