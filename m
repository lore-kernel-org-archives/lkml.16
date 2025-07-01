Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3A949620
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360840; cv=none; b=o5ACfwpZhvdroMFZesN4/jXOYrnJrMatFOd+mEsErhciSf8TMkdhy4rNEF6lE+7SrAOaHhYFZtO5LLKkB0McX1G/JWfIm3zjfboZ6ru/b3BY2KV34UUrTcRV/8ctRgYBp2jAB6gYYIV5X51Pj2nvH6Bk7Viapo502EuUuJCvVAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360840; c=relaxed/simple;
	bh=sHXLU4YJ58g4jatzLFEY9dC0mPDHancbCEteeL570UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tu0ezzplQqkvCMqa5BO3A6LVsgj+6LsfMWZSfBGjFTGHb+qO031+f1qZnIMlO5QJyKXHTolbc5tkYAtUst9f2pxXg1+v6hxMOYSZ9/sM87WzBiyQamFdpBoc34jBYlm+/qiVckLEuKdMleE5dyMNarzF2/9rOb8Z+GkWjeHTihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=zrcl+Vbf; arc=none smtp.client-ip=83.166.143.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="zrcl+Vbf"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bWcbv4TJWzhZ1;
	Tue,  1 Jul 2025 11:07:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1751360827;
	bh=wYwVNPXhYK1JR5u40nQeLrzk7KnWvJbBV52hgZXlY1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zrcl+VbfPPR6eOXylRxFta9QMLOVL0+toJpuoXiFG6HrdajMYnhGTR+XOF6VslmE1
	 PqAbZVrfs86X12xCheP2rLrVij9m2/D9MbeFAxC5EmQ57QZm8HQn/AuGhe5W9dbpxq
	 v9TdlYi0o+930PLfl4MZJjicljx8Vn0MtZSWQUhU=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4bWcbv0NrFzRGs;
	Tue,  1 Jul 2025 11:07:07 +0200 (CEST)
Date: Tue, 1 Jul 2025 11:07:06 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Brahmajit Das <listout@listout.xyz>, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gnoack3000@gmail.com
Subject: Re: [RFC PATCH] samples/check-exec: Fix building on musl libc
Message-ID: <20250701.daeghaimaL0s@digikod.net>
References: <20250630202353.28439-1-listout@listout.xyz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250630202353.28439-1-listout@listout.xyz>
X-Infomaniak-Routing: alpha

On Tue, Jul 01, 2025 at 01:53:53AM +0530, Brahmajit Das wrote:
> Building with make allyesconfig on musl results in the following
> 
> In file included from samples/check-exec/inc.c:23:
> /usr/include/sys/prctl.h:88:8: error: redefinition of 'struct prctl_mm_map'
>    88 | struct prctl_mm_map {
>       |        ^~~~~~~~~~~~
> In file included from samples/check-exec/inc.c:17:
> usr/include/linux/prctl.h:134:8: note: originally defined here
>   134 | struct prctl_mm_map {
>       |        ^~~~~~~~~~~~
> 
> This is mainly due to differnece in the sys/prctl.h between glibC and
> musl. The struct prctl_mm_map is defined in sys/prctl.h in musl.
> 
> Signed-off-by: Brahmajit Das <listout@listout.xyz>

Thanks!

Reviewed-by: Mickaël Salaün <mic@digikod.net>

Kees, feel free to take it in your tree.  FYI, for the equivalent
changes in Landlock, I moved down the if/include/endif block to ease
sorting of include lines.

> ---
>  samples/check-exec/inc.c      | 2 ++
>  samples/check-exec/set-exec.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/samples/check-exec/inc.c b/samples/check-exec/inc.c
> index 7f6ef06a2f06..775ae8613782 100644
> --- a/samples/check-exec/inc.c
> +++ b/samples/check-exec/inc.c
> @@ -14,7 +14,9 @@
>  #define _GNU_SOURCE
>  #include <errno.h>
>  #include <linux/fcntl.h>
> +#if defined(__GLIBC__)
>  #include <linux/prctl.h>
> +#endif
>  #include <linux/securebits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> diff --git a/samples/check-exec/set-exec.c b/samples/check-exec/set-exec.c
> index ba86a60a20dd..a75b8c6e6b11 100644
> --- a/samples/check-exec/set-exec.c
> +++ b/samples/check-exec/set-exec.c
> @@ -9,7 +9,9 @@
>  #define _GNU_SOURCE
>  #define __SANE_USERSPACE_TYPES__
>  #include <errno.h>
> +#if defined(__GLIBC__)
>  #include <linux/prctl.h>
> +#endif
>  #include <linux/securebits.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> -- 
> 2.50.0
> 
