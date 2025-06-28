Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E3244665
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 09:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751102030; cv=none; b=QrfOi7KJniJH4o/bK2Mw5blZZ4F73kW8dUdQC3DPxxVSVB3sEciSqH5ki0xxgN99KFgS2TE/5AYxAz+uvsMLDk0860a4psptaO0ItazH5fYWunyVNU/ayXlKjjHJhOz8Q5Z56eZ8ILXH1p11h3IDskd2KswUGStBxwcpHRiWuL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751102030; c=relaxed/simple;
	bh=juTA01te9FKV5B8PHkCYX955l/JRRH6fuRt+KBGvoyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYELG6ZOvRxjXKlEkAWZfsz82iLPPSS/1mG7OK6Bjq+6UZUAGhQ+378P0I/1h5H14uRorUjV9B3gaVV6tYwwOIZz4VPJZZpd4qA+YkoRVfWa6sLIoVcOO7CIkqE66qS5lBJ8xObWmmvXZDRadhfQ/OizDXBwglgwvAncn8M21R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=mdVgcxp/; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="mdVgcxp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751102025;
	bh=juTA01te9FKV5B8PHkCYX955l/JRRH6fuRt+KBGvoyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdVgcxp/LfDJ4VZjuRc0z4HXhiBgbGmfOae7xrLX0u7ZxGKbpoiDS9hX1QK6vlrsh
	 CxrPCVrGd4NXSmeSv8bV8CNjukWJBr5OMINZ+r/qNaFKlhQ7RKjUm5ubLCqHjbNxpb
	 6Ger+y3Zh9CfMH+veGJj/uivlK9Wq6HOy941GJDA=
Date: Sat, 28 Jun 2025 11:13:45 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] Docs/ABI: Fix sysfs-kernel-address_bits path
Message-ID: <02779f20-f910-4045-8e36-0a60bd9fe7b5@t-8ch.de>
References: <20250408115823.1358597-1-richard@nod.at>
 <1837899202.21230.1751099700585.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1837899202.21230.1751099700585.JavaMail.zimbra@nod.at>

On 2025-06-28 10:35:00+0200, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "richard" <richard@nod.at>
> > An: "linux-kernel" <linux-kernel@vger.kernel.org>
> > CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, linux@weissschuh.net, "richard" <richard@nod.at>
> > Gesendet: Dienstag, 8. April 2025 13:58:21
> > Betreff: [PATCH] Docs/ABI: Fix sysfs-kernel-address_bits path
> 
> > It's address_bits, not address_bit.
> > 
> > Fixes: 00142bfd5a91 ("kernels/ksysfs.c: export kernel address bits")
> > Signed-off-by: Richard Weinberger <richard@nod.at>
> > ---
> > Documentation/ABI/testing/sysfs-kernel-address_bits | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-kernel-address_bits
> > b/Documentation/ABI/testing/sysfs-kernel-address_bits
> > index 5d09ff84d4d6..3b72e48086aa 100644
> > --- a/Documentation/ABI/testing/sysfs-kernel-address_bits
> > +++ b/Documentation/ABI/testing/sysfs-kernel-address_bits
> > @@ -1,4 +1,4 @@
> > -What:		/sys/kernel/address_bit
> > +What:		/sys/kernel/address_bits
> > Date:		May 2023
> > KernelVersion:	6.3
> > Contact:	Thomas Weißschuh <linux@weissschuh.net>
> > --
> > 2.48.1
> 
> *kind ping*

Acked-by: Thomas Weißschuh <linux@weissschuh.net>
