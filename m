Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CC727CB39
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364550; cv=none; b=IskA3PHnaEX871r0DsmctIGZiH/0khCfqrfPSmiDpRQw5NnhBWuv5sFliUYVhBI70DlrLhD3k3cv/91anc1I+tbrJBjBMBPUFAI4EkXv9DDHK5dfUOivHzMEZKKB/15KKVrX35NcTxxgsI/xX7fRD7brGkLaON8Ko3tMp25YAaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364550; c=relaxed/simple;
	bh=5a8IqEg0B6tgmmZdTPBgyrQ7BtOyZybuO/7ITkZqZ7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrE0P5NKqlH9kxnpHYLIYg1f2zwALT+obDA3PmOfPM5lHCg6lerKEdhaF5+VaqVinlUwllhjdmkQ5PB1S4aSlVqb1TKLyidJF7erwB9XDgMWYlqzBWHLd3/p03d7ftViJhi7daXbFj9WpmvEDVpTN8aAJnfJdeP+svtrG1z44lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QN2LPWmF; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QN2LPWmF"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso18817345e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744364546; x=1744969346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ik7Kk0gWH7p5aFOmLTfUiCa4UM2teSE9U/Cy13SbPPs=;
        b=QN2LPWmFByls8K+O82p4VJ7r/5raZrrUOJTCX9sTaljHtVfMatmGt+wH8g/1tHg1wW
         Vp12R71YakENszD+MFTB5LJE2zXch3zrdZ6j6dnX+0MIJyKLcjNsdKneUpcS7RE0ToDF
         ByreljEBy5Y4zAs74bRMzEEaBDS56O11WrWojcON/GaOCflF+WLjidO1zCIm134ze2Nv
         0+aainDUuaXUPnKXQ0WmeIVy4XWGZe1ObDY6h5nG3CwslJVwTL+tfVKHM8XHtMEfwGj4
         LDh2HOc2yHozAO9HCEgn6Yz8UDhSbvQ0rWMX+CVqNAxLkAmlJxEnHNX+hWgLgVlOqg6U
         nF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364546; x=1744969346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ik7Kk0gWH7p5aFOmLTfUiCa4UM2teSE9U/Cy13SbPPs=;
        b=rvfv0j7VscdM710q1YtkiU3U9tfWCuKbLKG/Z0HwHVOhKo/4PrF3fJsu2/Vs9x4NX2
         RFI3L7dUdGwWH+e1YZWU9flj3M1sHWfUNyLrVVSViFQYyEFs+7XvDBE9GbKURQ72nwn+
         1Ccbt9zTxIxRboqxSrXP+hJkDX83Q8oAzdNqAAz/Qg4BUCF4AbI06EqBQFbv2TVyXCW+
         tZgSKhv/tL4nuUyCOpUVxvcF3ZVM0D943ofT1JAlcZWQe/lTqYgnST1Pn48BhKojGkVY
         jEqfiPf4EpBxECQAu5SEDcxdRzfFz9jwcksNhvfeMIjO46XfC/+tv4ONvzOL4zg0qAuW
         d7jw==
X-Forwarded-Encrypted: i=1; AJvYcCWx7Or9nGtRkvdoJ1H7BIHu3MY0aVlMx4YeaRwktrB5dG9btfJYRU+qtWUUxuOvoHSa0dVx1cRvA6Sil5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4986Axq+/SImcW9KpMsYSAyS4fYYv8boFOx23GBDk879Fn2q
	ThcZdeYEtLU36ZLjYvd7YfyeMWBgn/odRmvJQ0DIg8VutpO3KZ60f0YXSDP80DM=
X-Gm-Gg: ASbGncukPtje3EFJG4I814sWZx7hgI/IG2rCcrOhpptK4vuvxAdJN2TBWxrm9NHKi2q
	Mu2ptLdU0AGY9RRM24URszeYhQmgLOll4qKyzpDKxUuuRD+qPl+bOTcsuioHwuyWXLj2hYBo5Wn
	EHo21nMcmhX5cXhgFucgpfZoKm3Z/k8mGzfoCNT4FsEOZI+S6fKfAQ9HZWeags+DCZ0cwiTMWC/
	6osf1EmB8EH+notUUqMlnczphzKE2Du1CP11sJaWhVFJ7us2lOP/U1qtxhy7dzTEGodjHHbrJ/p
	DJbjeuGxIep2qpj0QtgeDaIbTCU4DVSnplxkGQB07QlO9nA2kJ2dyg==
X-Google-Smtp-Source: AGHT+IHb/xrWOL3vZlZGhOnz2Titrw4KhO37wLQq3stAmL3/f48u2dHGiQ064W6roqwZ86N5mx3wNA==
X-Received: by 2002:a05:6000:4308:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39eaaec7752mr1445051f8f.36.1744364545957;
        Fri, 11 Apr 2025 02:42:25 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cc72sm1508427f8f.67.2025.04.11.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 02:42:25 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:42:23 +0200
From: Petr Mladek <pmladek@suse.com>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: Exporting functions from vsprintf.c for Rust
Message-ID: <Z_jj_8vvmWY-WuTU@pathway.suse.cz>
References: <D931ZH9KRY2E.2D7HN6QWELGFJ@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D931ZH9KRY2E.2D7HN6QWELGFJ@buenzli.dev>

Adding few more people and lkml into Cc.

On Thu 2025-04-10 17:10:57, Remo Senekowitsch wrote:
> Hi
> 
> I need to print the full path of a fwnode in Rust. One approach is to
> export it, as shown below. Is this acceptable to you in principle?
> 
> There are also some intermediary solutions like not providing a header
> and or prefixing `__`.
> 
> Thanks,
> Remo
> 
> ---
> diff --git a/include/linux/vsprintf.h b/include/linux/vsprintf.h
> new file mode 100644
> index 000000000..b37b11868
> --- /dev/null
> +++ b/include/linux/vsprintf.h

Just for record. Steven suggested to use include/linux/sprintf.h
instead because it was already used for another vsprintf APIs.

> @@ -0,0 +1,4 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +char *fwnode_full_name_string(struct fwnode_handle *fwnode, char *buf,
> +			      char *end);

Honestly, I do not have a good feeling about exporting the internal
vsprintf() functions. They have a very specific semantic.

Especially, they return pointer to the next-to-write character.
And it might be even beyond the given *end pointer. It is because, for
example, vsnprintf() returns the number of characters which would
have been written to the buffer when it was big enough.

Instead, I suggest to create a wrapper which would have a sane
semantic and call scnprintf() internally. Something like:

int fwnode_full_name_to_string(char *buf, size_t size,
			       struct fwnode_handle *fwnode)
{
	return scnprintf(buf, size, "%pfwf", fwnode);
}

I am just not sure where to put it. It might be vsprintf.c.
But I think that a better place would be drivers/base/property.c.
For example, I see a "similar" fwnode_property_match_string()
already there.

Best Regards,
Petr


> diff --git a/lib/vsprintf.c b/lib/vsprintf.c
> index 56fe96319..3b4d0065a 100644
> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -43,6 +43,7 @@
>  #include <linux/compiler.h>
>  #include <linux/property.h>
>  #include <linux/notifier.h>
> +#include <linux/vsprintf.h>
>  #ifdef CONFIG_BLOCK
>  #include <linux/blkdev.h>
>  #endif
> @@ -2103,7 +2104,7 @@ char *flags_string(char *buf, char *end, void *flags_ptr,
>  	return format_flags(buf, end, flags, names);
>  }
>  
> -static noinline_for_stack
> +noinline_for_stack
>  char *fwnode_full_name_string(struct fwnode_handle *fwnode, char *buf,
>  			      char *end)
>  {
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 4bd02abd2..24a565ffd 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -38,6 +38,7 @@
>  #include <linux/security.h>
>  #include <linux/slab.h>
>  #include <linux/tracepoint.h>
> +#include <linux/vsprintf.h>
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <trace/events/rust_sample.h>
