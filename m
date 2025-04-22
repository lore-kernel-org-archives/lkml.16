Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E11B281359
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329843; cv=none; b=a+ik/HSBjbyXfZYeG1YjE38n+qTz16aJNRdfVxQyq/oXt5pGSLAa27RsG6+hqdzKKUvBupdxOVxwA0uVuaG1SF5psCdwYry4B7Hs3zNAzfuJRi9wZ23pbeUL5ygWO0FlqLAwpT44+72ZxEgMWEbpxBZDVMNDLIlzapm4MygfCKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329843; c=relaxed/simple;
	bh=jeM82paYGpr1mwQCA8hN8JIjwhMYsSr79xhqenfpsCI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dfSm0Y9FBnDU1xb5rJvICUY+aHY8EnmLg6vZkMzubb3sX5ckfpCnFvj/hWXQToT6+o10n+pwpHPVlA33/3ZB8oXFlwQvC/of5auXM9DeAMgL5VpbBzxTxhOvR6SlJUGlRfaEOoWiFlicllu2WfsegJz3vfYER+Tzn+kvLqavJqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDgeckK1; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDgeckK1"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3081f72c271so4436650a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745329842; x=1745934642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ho+9Ni3KIpr+Bqz+GZX+bi8Cn1/EYRo+dzzVNPuOWFg=;
        b=SDgeckK1DVKWAS7xZDTvKZnONjSkJYAt+eiz+KHRhZlGJ+0y+gUIjDMHn9Ftqxvbrb
         lk5iCo3lij/AN0M1GwCMD6N3vt1ZHuiwZrbNC29Z7t2rLAa+X6s2dp50ca3T90LetGRT
         NoyqYKwyoEVmB2KYhPhmelJlsntKBc9UxMpZXIpnfQ3GJPo7PRQAN9nYYV6M/Vk3y157
         30R+2he00k2cocgpNPXDu5SMlMsfAy4LU0/2gl7x3amnUIsSeNo59ZpwDDWtIftIEf8v
         Qi2PG0djiPW9sYdbwc+TcvUqDiQ5Wyv2bOiWxJEM+Eo/XIKVd9g8xAo16TPB8xApl7m0
         ou+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745329842; x=1745934642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho+9Ni3KIpr+Bqz+GZX+bi8Cn1/EYRo+dzzVNPuOWFg=;
        b=LECGwFi9csMCBwqW+8iTxhiDJTuWTvuPMtTiAZSWnGlf45SyEyOw5qN1s4aAgKnce3
         hdAv5SGiF7p9VYgKk9JXK/a42aUJDsrtVISOL/i6bDV9w+GlFiDpn4dSmO8vylA/OqgX
         fjv0jYerIttJEuEaja33w4PxVFRng7dIT8qJkYBAXjDEWmLD+j3PtX9i9uRJ0FNYZs0W
         yEY4JzS5+5O0PslenjCVGunaaSI0HfnMbjdh60FmGcMzrJi9bFsz7yACYcQfwDvdKwS1
         nZOuBgn1ixLf78r4d2gIowJeyq1lQ3WY040TIMqlXVfzQXyV5WucXhRof6NN+ZnaMKjn
         EUBg==
X-Forwarded-Encrypted: i=1; AJvYcCW+dPuJm4+FD9nnnhccP6vnLl9pFVlPihtnLW2keXQ2xw3acuFzqxno09diX7SOcYZEKqJ2D+7ZJetT+Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyUHzJ9cLYoC9UHFLyLrC/n6QwsJFAOSIdSNSsCBXCvPO3SO3
	Ob9aVhADLngkLmbm7OZ2ZLHvbdANB+5eQ1m0fzC+KPFw/nW0GGEp
X-Gm-Gg: ASbGncvFAQFuDWC7loSLj2P6tDN4zZOunuAJ7xdngn8YGhzOLpyqw05weYdAUM6oVQy
	6Mqh/qHwNup5aDf9And31m6wd4sggM+wOwz5DyDu0/ijvJOH8/P3dK/htTViYoU8T7ZAJYgnI9q
	cHCA2bEAOlki71A8jdvYxPfFSSJA1nRV8i5S+TJW4Yd1tTPJyElhNZAUbfyzMTO73XYvDmtMyvO
	dBUVNP/V9GA5TQIM8S605ZWjIFnpe3QyDJsYsbH0dopoH4Qk3aOMhtGUgp5sOIFSA9pSZeR1dM3
	ZTJPQhwXKXqY+Bzsym9QQsGXl95i6GDTNhl/k2dQ
X-Google-Smtp-Source: AGHT+IG1DbOB8X4ulpbu6hiPPKfp7TunDgc8zHxm8JUMBsnlFZhmgJP9BZfJN3wgVhReeFh7lLivlA==
X-Received: by 2002:a17:90b:3d89:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-3087bb6ba88mr23112095a91.20.1745329841568;
        Tue, 22 Apr 2025 06:50:41 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa588easm8872952b3a.105.2025.04.22.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:50:40 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:50:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] cpumask: add missing API and simplify
 cpumask_any_housekeeping()
Message-ID: <aAeerphfzpvBKjpA@yury>
References: <20250407153856.133093-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407153856.133093-1-yury.norov@gmail.com>

Ping?

On Mon, Apr 07, 2025 at 11:38:51AM -0400, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> cpumask library missed some flavors of cpumask_any_but(), which makes
> users to workaround it by using less efficient cpumask_nth() functions.
> 
> Yury Norov (4):
>   relax cpumask_any_but()
>   find: add find_first_andnot_bit()
>   cpumask_first_andnot
>   resctrl
> 
>  arch/x86/kernel/cpu/resctrl/internal.h | 28 +++-------
>  include/linux/cpumask.h                | 71 +++++++++++++++++++++++++-
>  include/linux/find.h                   | 25 +++++++++
>  lib/find_bit.c                         | 11 ++++
>  4 files changed, 112 insertions(+), 23 deletions(-)
> 
> -- 
> 2.43.0
