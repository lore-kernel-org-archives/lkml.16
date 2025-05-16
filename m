Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9561D88AC
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375361; cv=none; b=hPMbrxwNTL+pvi0c8EnGt9LVQwdrfmWWKqNeCPjHOY1mFLXD6qSvGUxbNCwoB49wpZa3SvQ5MK8nJ/a3UbcH+oa+efO5l1bQFWIZzYnCdHPl09V40n9AgfmJMJoq1kbLH23oDp7YyK01kFK7/tTfASHjVMISuFMmJQ/bz2L8Mlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375361; c=relaxed/simple;
	bh=FFW0hqGTqpSSQEt0oM9VrJkvsbPrdiAwXszFH8NO5sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U74bKw9bHaAk84GhAImUI3Mcxjn9OkJjXJr8NlpbvraSTsJJ7RolcecZp6cekCIZq3AEwNMAO1hSCukfVnunq9Eh2q11jdNxPFbgVafXdWep33dSFcvTDdRHoQf8Kq301TloKm7CuwvK7aFAd6BsOl+bgCoDpOYQMiGD3miqh/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dwOsgyFC; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dwOsgyFC"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so13278275e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747375358; x=1747980158; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YRCpYLM2KigShkSCMx1Qo6LnPBeFu9CM55DsyR/vk34=;
        b=dwOsgyFCqUtAcxaArAly5u3HlrR0tZeCOZA5XgIZrvlgwqzqD8uisx2IOdMkXBU49w
         W1DzTjO/Hhg4Av5PY5hNm/SeQ1V5J6IH/7ZLOPBZJJ8g/2ZTcZuxIRqFOJW3J/Z/ZJH4
         ewH3fpXljxZToAHhvsKJ/AebACnS37CgT1HU8oJz7kNpDCpZF5MiYoJ2kTBkRn/VorzC
         0bQ0M+wUYBpa0WvNBbk8TJEGU2QItB0RNlqzb20EJ6wQ4dDrwQ5lTTgiWfUGZv0lN5Op
         ixN7sFbfiuQJONpzX9jtJegEwuserDLS6C233GiEx/Wh2F5fAjCE+IDslThlgd6QQScP
         HmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747375358; x=1747980158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRCpYLM2KigShkSCMx1Qo6LnPBeFu9CM55DsyR/vk34=;
        b=vCXXbtCpR8SdJ7IvEmRvgh2nD5FUnJYmuIN46YFvjYXOSF0bDm4BZG3SJ+I05RFxD7
         PbFGd8qk3ZEn8Gp8M0rt7R+lvBzuNah+41ePUJ4dYWZjfoy1JpMdPon3j6YJEkyIfel2
         lPAZQigQb22Inp3wLJ7HJxo+qeEnyAiR/Wg1JYKvgcHp2cS2J+CQ+XO2F08jHNIhU6fE
         gQxbZczYEKiH/jJejHM19W4xoVZEXWa87E8r3As/rh+C/P85w1P+UppOVQOaiRiLJKBG
         y1I9wwv0LquF+ye94iGm6YFIaI1+HbCScabXC0KgiG8XOTDTB9jUT8Gmeb0Jsh9+zc6S
         EPcw==
X-Forwarded-Encrypted: i=1; AJvYcCW+bnC6a0WBZRZ9Xa+yg3J6tjrWTavoXWW6JDDo49xpGSmQPiJ87/dX15YvWrUCx+2Yy1rhoMjQUo9qfEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx29n4tZH8IER/hOCXk7Yogvm6bKxyzx5R0QVHSPagiLryUncqU
	ZXNCkvpXV1Hr7ujmrlrd1aP0inTdu2uG8wbXhO+tpSsS24XiuGPt3U7SUCF9BQ0GFzk=
X-Gm-Gg: ASbGncvhQa40Mfg4QHXnx51+w39PB5CzJBcCgi6IjtNOE5acxfURyaCAlqt4ISdb5YC
	q4gWhIdLYxVNkjqiXo0yjhsqvKKz7pXE0/LRPwwg1LQDrd0tYUma2N4bhQmAbkGZPCrAnGuBo0W
	ip8PnSssdttzUhyXpokckYtEXxENIPA8YM1EqV+JojHc8sVZwKJ7p7E6sVHY16H9Akz5cbMwUYO
	nSt7lfZ5f02WlBj833OFl+2xV2UYz4PtNRP5PgELGjunfjCCr0HAGA7A7JrpMpacv4XYDH6gAkd
	ua3UfslqDR7tHiKY1U85ZerFSAuJAmmWN2mm9PEs2hRQkx/yT22Rf9rkNjr+ZNh1PaFSRYU=
X-Google-Smtp-Source: AGHT+IExAX5L6jhpudxoopt/jOxKXl18l7eevqO0BjrQScjyjlt4zB8dW0pf982EIRtAZl2LOgjSqw==
X-Received: by 2002:a5d:4567:0:b0:391:4999:778b with SMTP id ffacd0b85a97d-3a35c84428fmr1663501f8f.28.1747375357714;
        Thu, 15 May 2025 23:02:37 -0700 (PDT)
Received: from u94a (27-51-34-195.adsl.fetnet.net. [27.51.34.195])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec12287esm1112560241.10.2025.05.15.23.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 23:02:37 -0700 (PDT)
Date: Fri, 16 May 2025 14:02:22 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Erhard Furtner <erhard_f@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	bpf@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/2] mm: vmalloc: Actually use the in-place vrealloc
 region
Message-ID: <yw7aumjfrefi5cdejjgtjfeusaihfh5yjuhry3xvetjld36fgi@ob4a6lwdlqt4>
References: <20250515214020.work.519-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515214020.work.519-kees@kernel.org>

On Thu, May 15, 2025 at 02:42:14PM -0700, Kees Cook wrote:
> Hi,
> 
> This fixes a performance regression[1] with vrealloc(). This needs to
> get into v6.15, which is where the regression originates, and then it'll
> get backport to the -stable releases as well.
> 
> Thanks!
> 
> -Kees
> 
> [1] https://lore.kernel.org/lkml/20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg/
> 
> Kees Cook (2):
>   mm: vmalloc: Actually use the in-place vrealloc region
>   mm: vmalloc: Only zero-init on vrealloc shrink

Thank you for the prompt fix! I'll remember to include a more thorough
note on reproducing the issue next time.

With the patchset applied, BPF selftests on both 6.15-rc6 and 6.14.7-rc2
passes successfully.

Tested-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
