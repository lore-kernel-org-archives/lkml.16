Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980822A1C5
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744997; cv=none; b=qoKAJ+qgG1u+P8Cg/kuXn+yc8hzpwxiRUa9uy8qoXdoL8edcVBp77WEfhkDp42NoEwW065s8Vk/mv1y/QktSxkqP60JapNPz/8KjQtRhdmLHNhuFT+7fe8aBMRnFgbz6H2jrY+sX44E3/aI9L4AK94eKmwa4168vse71+ve8xnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744997; c=relaxed/simple;
	bh=p0ibE0imzJrzuTS00bOK/Id3Y9/SeHlbskz2XeE+f3c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IWHRzit6soLUJlHcL5/hm4WSTSv7nU/7/TKNIerCZrUU1efZE7QCVMfTU4EIFh2Ngrvw4c2liSO1zYbcX7a5kOJtn/XquF/lqZWumR8eTvIg1UiS7b3wK6MVC9XHUAYEtjCOTiJp6TwdF7qDPq6QB9JdL5zVdUEZSiPOnQzoMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=ThTFi8Yr; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="ThTFi8Yr"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401b7f7141so6052114e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1738744994; x=1739349794; darn=vger.kernel.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+e+hBHhv2/Q+FPnc04pk6OB54D2kTpJhA7pWv3JJQyA=;
        b=ThTFi8YrYfEMUaI4c7IGuw1Y25VaBiNgGzQPd98qMow4CYsBxh84hcryJ7I1r4DH0Q
         ve/WVmE8H3Qmd0p/FSAsEAK7jUVLQaiXPQgBtmOMVfemryyiRZaXkdqrgC9MLlz13Orv
         hn+TxMcCikftehseLaEQVsArzfDvBzKJ7Ahy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744994; x=1739349794;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+e+hBHhv2/Q+FPnc04pk6OB54D2kTpJhA7pWv3JJQyA=;
        b=hH6Yr2A94L4cSHudQYfd9cPHXs04Ix2zeTeficzdXjS/wABRQkkWTi62kgx0vWJZR8
         eEHYq3L6FhL8FjLu8G7E/sMmP9//GwgG5C+shGMftJNPv+VI00sn4CggJQmXgr5m7uvR
         ljVhhvUX638T0KAuMg2U4hHBrqCZRTXVHU/Vh5OfPIy5/IATxtawFO9BewA+li9nFFzK
         zU/9ZYWRDy2ItVtbt0yCOlLg+BGrqFToXs2l8pZDFP5HDUyYpjAfAxoPUSaxlMdXzSQj
         29Qe2na6/43FKdU4UeXdmzobfOrJMDpEHP31yAcDnb/g8MoXVP6gaFxE4nLepUuEko2K
         HoSg==
X-Gm-Message-State: AOJu0YyOc9aazLwrRJbeAbOxq7B6Jui66HID+BaE0rMR6mb5sTHV+58s
	8fzPv9XAMCYVITjjpYL+rIqZ2ymxLNpBgNd958dFsgl7/GJq5fnix9q2KVODyuM=
X-Gm-Gg: ASbGncvzH16iLiPncuKhHDgEB8sthrbB36O/PTC8rQKds/JZ18H7zywQE3NljUMfOat
	qyZ3T0Th4hp2M20lJv5z9FRDuaFWaQpxUAsVrKuvau+MU8IrQHOGRlE2LJTSmJD7iNGDGgmQ0Ak
	BEWzG0+o9yEmBAmGnLMPAHpoG5hqBky2nkExErn5Xh4al6T1qULdOYvsYJizaEFvvo7OOA5+tJw
	+SOweKvbJDAvYd7GMUYS9rvLxxG2PCU37HTqhuvIQ0mcPYRmRPyFBv6UJTp10/3oN3lYmUhlTlP
	M+UOg0MbQpWQVZEz
X-Google-Smtp-Source: AGHT+IGdeze+FGm6RJ6kK0EmlM0IzS1+jIlMHYzfJceotO2M3xr68jPPBD2PPXE1VqhcZHZypTYtiw==
X-Received: by 2002:a05:6512:ba4:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-544059fd016mr420040e87.7.1738744993888;
        Wed, 05 Feb 2025 00:43:13 -0800 (PST)
Received: from localhost ([81.216.59.226])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-543ebe15778sm1810443e87.104.2025.02.05.00.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:43:13 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org,  linux-modules@vger.kernel.org,
  code@tyhicks.com,  mcgrof@kernel.org,  frkaya@linux.microsoft.com,
  vijayb@linux.microsoft.com,  petr.pavlu@suse.com,  linux@weissschuh.net,
  samitolvanen@google.com,  da.gomez@samsung.com,
  gregkh@linuxfoundation.org,  rafael@kernel.org,  dakr@kernel.org
Subject: Re: [v1 2/3] include: move
 lookup_or_create_module_kobject()/to_module* to module.h
In-Reply-To: <20250204052222.1611510-3-shyamsaini@linux.microsoft.com> (Shyam
	Saini's message of "Mon, 3 Feb 2025 21:22:21 -0800")
References: <20250204052222.1611510-1-shyamsaini@linux.microsoft.com>
	<20250204052222.1611510-3-shyamsaini@linux.microsoft.com>
Date: Wed, 05 Feb 2025 09:43:12 +0100
Message-ID: <87h658u6hr.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Feb 03 2025, Shyam Saini <shyamsaini@linux.microsoft.com> wrote:

> Move the following to module.h to allow common usages:
>  - lookup_or_create_module_kobject()
>  - to_module_attr
>  - to_module_kobject
>
> This makes lookup_or_create_module_kobject() as inline.
>
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>  include/linux/module.h | 39 +++++++++++++++++++++++++++++++++++++++
>  kernel/params.c        | 39 ---------------------------------------
>  2 files changed, 39 insertions(+), 39 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 12f8a7d4fc1c..ba5f5e6c3927 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -894,8 +894,47 @@ static inline void *module_writable_address(struct module *mod, void *loc)
>  #endif /* CONFIG_MODULES */
>  
>  #ifdef CONFIG_SYSFS
> +/* sysfs output in /sys/modules/XYZ/parameters/ */
> +#define to_module_attr(n) container_of_const(n, struct module_attribute, attr)
> +#define to_module_kobject(n) container_of(n, struct module_kobject, kobj)
>  extern struct kset *module_kset;
>  extern const struct kobj_type module_ktype;
> +
> +static inline struct module_kobject * __init lookup_or_create_module_kobject(const char *name)

As others have said, this is way too big for an inline. Also, __init is
at best harmless (if it is indeed inlined into all callers), but if for
whatever reason the compiler decides to emit an OOL version, we
definitely do not want that in .init.text as we are now calling it from
non-init code.

> +{
> +	struct module_kobject *mk;
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kset_find_obj(module_kset, name);
> +	if (kobj) {
> +		mk = to_module_kobject(kobj);
> +	} else {
> +		mk = kzalloc(sizeof(struct module_kobject), GFP_KERNEL);
> +		BUG_ON(!mk);
> +

And while the BUG_ON() is borderline acceptable in the current,
only-used-during-init, state, that definitely must go away once the
function can be called from non-init code.

This is what I alluded to when I said that the function might need some
refactoring before module_add_driver can start using it.

I'd say that the BUG_ON can simply be removed and replaced by a return
NULL; an "impossible" error case that can already be hit by some of the
code below, so callers have to be prepared for it anyway. If the
allocation fails (during early boot or later), the allocator already
makes a lot of noise, so there's no reason to even do a WARN_ON, and
since it "only" affects certain /sys objects, it's probably better to
let the machine try to complete boot instead of killing it.

Also, I agree with the suggestion to drop/outdent the whole else{} branch by
changing the if() to do "return to_module_kobject(kobj);".

To summarize:

- refactor to do an early return

- drop BUG_ON, replace by return NULL.

- drop static and __init, perhaps change __init to __modinit (which is a
  pre-existing #define in params.c, so the function remains __init if
  !CONFIG_MODULES), add an appropriate declaration somewhere, and if you
  like, also do the rename

- make use of it from module_add_driver()

Rasmus
