Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA546B8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494114; cv=none; b=qfA/pUTAYQA7JKcovkPZOAZbsKe2VbU+qGomvtrCo3lFPmdRLVaDtVGaun31BoVubo3HDQ9Nh/dMLgP9of3ksNIdBXKLTPSoL/fNz4zRRCSHV//7G8HK7iVDQfBAUe5YtvHX9fk3uzISEMr9kY2rnJnf5+ujE7/8tuVteWLTCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494114; c=relaxed/simple;
	bh=I/3/dxrvpZvxthOOHGIjIoWYHHgvTVzJlOE1lsHOueM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV5KeVcZJs7JNscgfl45N4Bb7VVee8kH2vMfZuSn5mL+FAs7FG30Rtp+zOpVqARIvjArZYnuFpwiIV76dXIg5YOC8dW34nLdhYjWNgeJnJRgrcA+/Y4/8+xBXmvT2PCCS3n5obqNqBnFo/gUbMzau/QdJq2kgwMOCNorT6xKmR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=J9yDdcWG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="J9yDdcWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750494110;
	bh=I/3/dxrvpZvxthOOHGIjIoWYHHgvTVzJlOE1lsHOueM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9yDdcWGwj36T1PdInFrpBhzm9VdXSNBaAizMm9qMcd8UQysunUgU1RpWD7W0LkNv
	 iR/qtOXTF7TmCMKG2w2VwScWK2SQwHSrDNHhq7cgrF28FWU0O9nbetUwV/VTB6Qy3Y
	 uInmTGbe1+viF9QRanyyYSCRzfDTsR1wHHIcc3pg=
Date: Sat, 21 Jun 2025 10:21:47 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
References: <20250620100251.9877-1-w@1wt.eu>
 <20250620100251.9877-4-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620100251.9877-4-w@1wt.eu>

On 2025-06-20 12:02:50+0200, Willy Tarreau wrote:
> Modern programs tend to include sys/select.h to get FD_SET() and
> FD_CLR() definitions as well as struct fd_set, but in our case it
> didn't exist. Let's move these definitions from types.h to sys/select.h
> to help port existing programs.
> 
> Signed-off-by: Willy Tarreau <w@1wt.eu>

<snip>

> diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
> index 16c6e9ec9451f..0b51ede4e0a9c 100644
> --- a/tools/include/nolibc/types.h
> +++ b/tools/include/nolibc/types.h
> @@ -10,6 +10,7 @@
>  #ifndef _NOLIBC_TYPES_H
>  #define _NOLIBC_TYPES_H
>  
> +#include "sys/select.h"

Is this really necessary?

>  #include "std.h"
>  #include <linux/mman.h>
>  #include <linux/stat.h>
> @@ -70,11 +71,6 @@
>  #define DT_LNK         0xa
>  #define DT_SOCK        0xc

<snip>
