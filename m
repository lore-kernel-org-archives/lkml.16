Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA2E1AB52D
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009236; cv=none; b=edCAHoABNym6DvKWmbckzw2p9njFovio2bhPC95RGe0wkokupiZ8+UhMcKY6g8u8mhSnjN36LFZ9Tc1XulBaRbkOeToPVrFA1gX4tTr9/D9ZQMPcXA+UPmCA4Ugx0rW7BvdreqvYYA1nqYbdeNkwrcYaqVCDAI7oJRkeyMaA0Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009236; c=relaxed/simple;
	bh=OYlzBYbdULFPlroDWHV11nkN6gRBf54kIhGlX/qTz8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lEBhNB+oebA4DNELoyasw5qcv6jed1/PmwzISAIzucHBn2pb2Pkil4VnRE9LNaNxq/+yjEWkgqtzOXYBBit91kybx8Pkb8NU1e0YbY9ptyEvPa/2zx3kIAuQ2eIBlm5VWalHfoX/DIii8ZlMdf7LjWuIngg7BsMAUJ94IRBAYtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eWqnwKyj; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eWqnwKyj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751009231;
	bh=OYlzBYbdULFPlroDWHV11nkN6gRBf54kIhGlX/qTz8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWqnwKyjmsGcTEm7/durpw33vQA7bo488Esy0Kbe4M5huJJ0UpAI4bgwBs6srqLGE
	 dtjhAH3Dx8DZxpxENQu5luPJbV2PW+XzouZ/n+yqLgjqdodJaSw2tktqtgx/tOkjw1
	 3XwxEZa0/aWzk8stdop7K6uKkyG+jihy9W5zv1qc=
Date: Fri, 27 Jun 2025 09:27:10 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH 3/3] tools/nolibc: add a new "install_all_archs"
 target
Message-ID: <cdf2ebbf-8bfe-40f8-a071-10d56221c202@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-4-w@1wt.eu>
 <92eda9ff-116e-4ec1-930c-7474da9652fc@t-8ch.de>
 <b14da196-84cc-4d13-baa2-952ba22f5a3e@app.fastmail.com>
 <89a2e713-edfd-4556-b321-cdccc3437a43@t-8ch.de>
 <20250627054618.GA4540@1wt.eu>
 <20250627054918.GB4540@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250627054918.GB4540@1wt.eu>

On 2025-06-27 07:49:18+0200, Willy Tarreau wrote:
> On Fri, Jun 27, 2025 at 07:46:18AM +0200, Willy Tarreau wrote:
> > On Fri, Jun 27, 2025 at 07:11:45AM +0200, Thomas Weißschuh wrote:
> > > On 2025-06-26 23:15:07+0200, Arnd Bergmann wrote:
> > (...)
> > > With the symlink, a given generic UAPI tree can be specialized to one
> > > specific architecture. But here we want to create a full sysroot that works
> > > for all architectures *at the same time*. So a symlink would not be enough.
> > 
> > Exactly!
> > 
> > > > If it's indeed possible to concatenate the path name (I couldn't
> > > > figure that out either), that could also be done in place of the
> > > > symlink but simpler than the #if/#elif/#elif/... block, like
> > > > 
> > > > #include <arch.h> // defines ARCH_PREFIX
> > > > #include CONCAT(ARCH_PREFIX, ioctl.h)
> > > 
> > > If we can't get it to work like this I would still prefer to have a
> > > template header file which gets specialized with sed instead of the
> > > Makefile loop.
> > 
> > The thing is that it's not a single header, it's for each header file
> > present in asm/. And we can't request that anyone adding anything into
> > asm would also have to maintain one extra template for each of them.
> > 
> > Or I'm simply not getting how you would envision it maybe.
> 
> Or do you mean a template that contains all #ifdef/#include for all
> archs, that serves as the basis to rebuild all headers, and that we
> still have the loop on all files in the makefile ? I.e. you simply
> want to drop the arch loop ? If that's it, yes I'm fine with this as
> well and can give it a try.

This is exactly what I meant.


Thomas
