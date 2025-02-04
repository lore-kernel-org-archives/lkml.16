Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B45143C5D
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 09:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662639; cv=none; b=I/PFkpzh2Dli0th/s9NZJjh5bbDzeosu/HD/FgOzo2xf5JPt5OZt8M/8ZPk+HND/NOIu8vBx7uNcoFiEulnicndkifLYC89QVcmVlp3Y+ycFVUUo2qLPdTYL2GwHD1/TUnGPfEVhfCgigMcafl7/Cu7kD5oHbRNUlaB0a7MxAHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662639; c=relaxed/simple;
	bh=sFKhMsokAOxkqQ+lyfqOtMnWWCSgFyyB9tfGsKKlFDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH+kyXpC7yw3Bqlhg7oz/uTaw7olgENHC+06ZNrQtzW1TNUMYyOguMIqPCGQ1Eqb579A7OroNYhwy/nas4CW7UUzEXvH/4flHz2FahKVxJ89cwxfl0IdPNEXOPH5VyNzrTwXSGJwenMiOYt0KgRrMJmtQZd7lSbYsg2cb05G4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Vr0PzjdO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Vr0PzjdO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1738662634;
	bh=sFKhMsokAOxkqQ+lyfqOtMnWWCSgFyyB9tfGsKKlFDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vr0PzjdOemk9h0ggU7S03NdeZp5h3qkAhXRzIWYtvd0YzxKTz/Tul5nAbYQcEzkpg
	 QsfkAl8U+UHSlyp9EMo7LcV3uslYTffCEaO2Jm5Evqr7IrwRnYGFX1g2W+/qf/qjjx
	 bGNl9uHBtjjoOb8DeEzliMPlizscj0N4C/emw51o=
Date: Tue, 4 Feb 2025 10:50:34 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: alexandre.belloni@bootlin.com, pgaj@cadence.com, 
	miquel.raynal@bootlin.com, conor.culhane@silvaco.com, aniketmaurya@google.com, 
	Shyam-sundar.S-k@amd.com, jarkko.nikula@linux.intel.com, wsa+renesas@sang-engineering.com, 
	xiaopei01@kylinos.cn, Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Message-ID: <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>

Hi Billy,

On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> The change is necessary to enable the use of the
> `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> ensures safe handling of I2C messages when using DMA, making it essential
> for scenarios where DMA transfers are involved. By removing the `const`
> qualifier, this patch allows drivers to prepare and manage DMA-safe
> buffers directly.

This is missing a changelog to v1 of the series.

Also I asked before why it is not possible to change the signature of
i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
That looks like the nicer solution to me.

> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c     | 2 +-
>  drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/svc-i3c-master.c    | 2 +-
>  include/linux/i3c/master.h             | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)

<snip>

[0] https://lore.kernel.org/lkml/23854752-435e-432e-ba21-caf690c0cecc@t-8ch.de/
