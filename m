Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581917A305
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633909; cv=none; b=OHtIvjNq362fNwH66LBI02EtQZYuxrE6nzXUIQqGnJ/L5+UZdU1ZPD++QqLVdASbPzp2boeifnM2qCgdDQJe5PkSpNPNKk26ArJFuulFPbA21a6HW5s9bubJ/GgsM/82L9Uw8JR8iWxIzXME9TJNp+dMbvZmfpOUXEoo4eXswv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633909; c=relaxed/simple;
	bh=Ub+bREUz26MZsF0p4MWug9Yo0djKeDcAZdv169/OOWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1aBzm9bAKtH0t+iVFcs5nPX6/s61u0K5aKUfwcQ2OjP1A3B8nExSu8eAXwf8ILQyTriAEm0HqAGk+vn2WIejHZC/tBg1MTJzasi3NKr+CBa+oD/TGcvauH8Ir+vjaFGUrQ5c6VVgyI9gwBUAGk2rPFPJrvK7JY41d9BBJqiB2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=a4ktIU6o; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="a4ktIU6o"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso3962934f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744633905; x=1745238705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UzE4G1qxViP6T7whIrLBrJ/GtgCmUCswBCy5CnSYKK8=;
        b=a4ktIU6oo8d29Sp6sCAIT24lMqDriXd9ZZUgECccsJfYdmfc/f/HCyYYM4JD7imBoZ
         YJSpOTdff2gjPjVk6J3Xobx4S29LiJoYiNlF0Elnu/hz7UP8cV5/lW/FFFjzlxNI7vUU
         Vmiicm6DqLOvJMueP60uHUI1uAheQLsmzZDhgAKEIXWPpJdMIggK4phLjYKzTctKu3zF
         G+Jd4rBQ0vIYmBRxxT1U8ojeVMPyzC4f32GDh4E8ekeqaxM1OLy+VAijqm+DWc9KadMr
         omjUH3g5CGKy7WBotnY7/iuTXCcqyeQtWDExl9ZsqayKDR+Xz544YUVgYhbVVpAZHIpi
         OYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744633905; x=1745238705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzE4G1qxViP6T7whIrLBrJ/GtgCmUCswBCy5CnSYKK8=;
        b=hfAeqFU1xnvztabdxHy+8bhWM1GEgPlP+oQs1UnWUvPAR1IpSoiC95/OiXyEdHeGaa
         HONopMBQ4dd6fly3pjX4bL7KlVuoF85xTmx/N6yw7cqgLMb13yLg2UMyvyO4DNtfap8n
         Sckanl2df69lt1aOgwjXZBI4T0FBlz0jaQEJtae5Ib1yz6PeTG5E+kDh2Y3kjcVC8vFu
         HY5I6f/i6+97EOClppjmNMNsjrO8bdEhROUsLCJyGtp24rvDMg0GX2rUymneSXl+PCCh
         HQKcqfaj6Mq0rKvg3ICltjxlR0/3S9Cdg3Wy2vgbquD8n5fb70sQgGKRlRpU6PkhLv2Z
         U58g==
X-Forwarded-Encrypted: i=1; AJvYcCVje2Pe3hbbD5JAPTBe7y8PwRw+vj7X5iNkYTATBecZ80wH0KyKrxVgSw5/nXMMXQLamgAvECAtwulXSCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwupfBcUOK/WzGmEdwr9u4bZhER3CThnrXspDC5SJPPwfurIcVN
	/xnB5DHgtgEVKLo9bE4jS9Yc8/jY+YE3tnjAb9GRNGnsG5PCOTSwfbKBlcY2+LU=
X-Gm-Gg: ASbGnctD2HmLSlEdDnlm8y3zi3n09WqJ1Nk6mWBHc8erNkx0SsHYP1FBbmyJlIkPtbb
	mRao2wJNw2CDzp4uPfvAbh7d9uI6vkyC57mCJJiW66YGC6zD+qeF1T9dJ0DuLg27KRhz20rFMGB
	j6++GLQE9qRucXEVvtFXrh+5CKeJaykN1lKgg2OTIwTY5Rjn2uEpP5CjLOwZnhDKWpxCzhKl+rK
	nbyJR9H83N6nB0fq2y5YoHnZlMMZlzUYxbAo+UuiQP5M/6UMtR5i/3b264DK8W8SHFNcinrCKYn
	WCKU4HAvGiTlYiy6Kv5GV/iHcC8NjCzOQX+f1Io7NJY=
X-Google-Smtp-Source: AGHT+IGPx3FekDQBH+w1DRIhnhl/LKSHQTM4c3o3SlHgBBWG1pxWWapk3NPpkMv5AAzM/asN/sLGnA==
X-Received: by 2002:a05:6000:2911:b0:391:1652:f0bf with SMTP id ffacd0b85a97d-39eaaea8c84mr8884498f8f.33.1744633904685;
        Mon, 14 Apr 2025 05:31:44 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43d053sm11008797f8f.68.2025.04.14.05.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:31:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:31:42 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Sergio Perez Gonzalez <sperezglz@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Harry Yoo <harry.yoo@oracle.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	Thomas Huth <thuth@redhat.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] slab: Decouple slab_debug and no_hash_pointers
Message-ID: <Z_0AFjai6Bvg-YLD@pathway.suse.cz>
References: <20250410174428.work.488-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410174428.work.488-kees@kernel.org>

On Thu 2025-04-10 10:44:31, Kees Cook wrote:
> Some system owners use slab_debug=FPZ (or similar) as a hardening option,
> but do not want to be forced into having kernel addresses exposed due
> to the implicit "no_hash_pointers" boot param setting.[1]
> 
> Introduce the "hash_pointers" boot param, which defaults to "auto"
> (the current behavior), but also includes "always" (forcing on hashing
> even when "slab_debug=..." is defined), and "never". The existing
> "no_hash_pointers" boot param becomes an alias for "hash_pointers=never".
> 
> This makes it possible to boot with "slab_debug=FPZ hash_pointers=always".

The idea makes sense. But it seems that the patch did not handle
the "always" mode correctly, see below.


> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -60,6 +60,20 @@
>  bool no_hash_pointers __ro_after_init;
>  EXPORT_SYMBOL_GPL(no_hash_pointers);
>  
> +/*
> + * Hashed pointers policy selected by "hash_pointers=..." boot param
> + *
> + * `auto`   - Hashed pointers enabled unless disabled by slub_debug_enabled=true
> + * `always` - Hashed pointers enabled unconditionally
> + * `never`  - Hashed pointers disabled unconditionally
> + */
> +enum hash_pointers_policy {
> +	HASH_PTR_AUTO = 0,
> +	HASH_PTR_ALWAYS,
> +	HASH_PTR_NEVER
> +};
> +static enum hash_pointers_policy hash_pointers_mode __initdata;
> +
>  noinline
>  static unsigned long long simple_strntoull(const char *startp, char **endp, unsigned int base, size_t max_chars)
>  {
> @@ -2271,12 +2285,13 @@ char *resource_or_range(const char *fmt, char *buf, char *end, void *ptr,
>  	return resource_string(buf, end, ptr, spec, fmt);
>  }
>  
> -int __init no_hash_pointers_enable(char *str)
> +void __init hash_pointers_finalize(bool slub_debug)
>  {
> -	if (no_hash_pointers)
> -		return 0;
> +	if (hash_pointers_mode == HASH_PTR_AUTO && slub_debug)
> +		no_hash_pointers = true;
>  
> -	no_hash_pointers = true;
> +	if (!no_hash_pointers)
> +		return;
>  
>  	pr_warn("**********************************************************\n");
>  	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");


The mode/policy is generic but this function is ready to be called
only once. And we might actually want to call it twice, see below.

I would suggest to use a generic names and allow to call it more
times, something like:

/**
 * hash_pointers_update() - update the decision whether to hash
 *	printed pointers
 * @auto_disable: Disable hashing in auto mode
 *
 * The function allows to disable hashing printed pointers either
 * when the global mode is HASH_PTR_NEVER or when the caller
 * wants to disable it and the mode is HASH_PTR_AUTO.
 */
void __init hash_pointers_update(bool auto_disable)
{
	bool disable_hashing = false;

	switch(hash_pointers_mode) {
	case HASH_PTR_AUTO:
		disable_hashing = auto_disable;
		break;
	case HASH_PTR_ALWAYS:
		disable_hashing = true;
		break;
	case HASH_PTR_NEVER:
		if (no_hash_pointers) {
			pr_warn("Pointers were temporary printed without hashing. Force hashing again.\n");
			no_hash_pointers = false;
		}
		break;
	default:
		pr_warn("Unknown hash_pointers mode '%d' specified; assuming auto.\n",
			hash_pointers_mode);
		disable_hashing = auto_disable;
	}

	/* Nope when no change requested. */
	if (no_hash_pointers || !disable_hashing)
		return;

	no_hash_pointers = true;

	pr_warn("**********************************************************\n");
	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
	pr_warn("**                                                      **\n");
	pr_warn("** This system shows unhashed kernel memory addresses   **\n");
	pr_warn("** via the console, logs, and other interfaces. This    **\n");
	pr_warn("** might reduce the security of your system.            **\n");
	pr_warn("**                                                      **\n");
	pr_warn("** If you see this message and you are not debugging    **\n");
	pr_warn("** the kernel, report this immediately to your system   **\n");
	pr_warn("** administrator!                                       **\n");
	pr_warn("**                                                      **\n");
	pr_warn("** Use hash_pointers=always to force this mode off      **\n");
	pr_warn("**                                                      **\n");
	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
	pr_warn("**********************************************************\n");
}

> @@ -2289,11 +2304,39 @@ int __init no_hash_pointers_enable(char *str)
>  	pr_warn("** the kernel, report this immediately to your system   **\n");
>  	pr_warn("** administrator!                                       **\n");
>  	pr_warn("**                                                      **\n");
> +	pr_warn("** Use hash_pointers=always to force this mode off      **\n");
> +	pr_warn("**                                                      **\n");
>  	pr_warn("**   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **\n");
>  	pr_warn("**********************************************************\n");
> +}
> +
> +static int __init hash_pointers_mode_parse(char *str)
> +{
> +	if (!str) {
> +		pr_warn("Hash pointers mode empty; falling back to auto.\n");
> +		hash_pointers_mode = HASH_PTR_AUTO;
> +	} else if (strncmp(str, "auto", 4) == 0)   {
> +		pr_info("Hash pointers mode set to auto.\n");
> +		hash_pointers_mode = HASH_PTR_AUTO;
> +	} else if (strncmp(str, "never", 5) == 0) {
> +		pr_info("Hash pointers mode set to never.\n");
> +		hash_pointers_mode = HASH_PTR_NEVER;
> +	} else if (strncmp(str, "always", 6) == 0) {
> +		pr_info("Hash pointers mode set to always.\n");
> +		hash_pointers_mode = HASH_PTR_ALWAYS;

This mode is not handled anywhere, see below.

> +	} else {
> +		pr_warn("Unknown hash_pointers mode '%s' specified; assuming auto.\n", str);
> +		hash_pointers_mode = HASH_PTR_AUTO;
> +	}

We might handle HASH_PTR_ALWAYS by calling:

	hash_pointers_update(false);

>  	return 0;
>  }
> +early_param("hash_pointers", hash_pointers_mode_parse);
> +
> +static int __init no_hash_pointers_enable(char *str)
> +{
> +	return hash_pointers_mode_parse("never");
> +}
>  early_param("no_hash_pointers", no_hash_pointers_enable);
>  
>  /*

Best Regards,
Petr
