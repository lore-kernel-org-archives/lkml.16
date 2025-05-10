Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEB2222BB
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746871910; cv=none; b=m1bAYxomHWAxVwzPdKLxcawWPts/h/c/Z7Y8HL0XHRs67K6WJuVxqecfwowE329WpC4JyhT9xHoPtdUrbLTE9/F7mX+6Lvr/wkVaq9F+zfj+XL4KHwxZFihxXyVF4L+gdko1l6FGIvoanO8kiVT50PoLqRWA0QzvTV/471C1smg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746871910; c=relaxed/simple;
	bh=TAdkEWmft0UsuHt29v3Eue/35LhyOeiZPHuU7JfGkcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8/A7x4B+MUzClDuFYVtZ7aeWv+Q0Tir07vhX8XJoELHn/eX6mPmRUwNSKM4Vhpsz//UpgDy1eQmWjajBbMQQvxMmY0BM1oSKyHfIGDvlZBr5+gcOjZ6+Y6NTEl8EV9qwR6ecYUye82SNbS38ozpcI4qteJHYmQHqc0QfHKVV8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwkAkL46; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwkAkL46"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfe574976so20059145e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746871907; x=1747476707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=mwkAkL465sVULreKQ9LN0/mqk0xsvy0PFRJbc/B9yb4ehcByZXtRJoLpHrbz17oB/k
         /4M1iS2pcoJygsRK5OylVoWgAxi2y4hvBFaolbVfgXWauJV6C2YKF2mAsFp1L5eGsTJc
         s1/QBWSADZrShTGNljloTbkcy9+l7nkM/svtRHASscHGySSrtxkqL7msQD98wmyzuxi0
         iNAQRlxsWgHPiPCO6ZobTZmLKMkxCptrUaGtt2yn5psLDYGJf65PrXw5imskAn1t7tkY
         tvSzIfJIyp61ww6tI+dL6dV03cyccPM9f+X+oqd60LJlHzYMYYJjMYpKYeHv8Qz49Qzc
         sPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746871907; x=1747476707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEGLI17Sg6m1LZBmMFTStRe876DURecVpE92sDlyUxQ=;
        b=QLi2/QpYnh9L5evfLHparewBC3zIbRyKYR/TbYRPvNlYvFq0RsT1qTOdR2j/1KVVC1
         59INWyPs60kYqBIb3TSRg0RKVMZC4fGtGf16JIRFyk77LQqJrMF6shbn4H1o1vwrJAg7
         n2j+7LjNG645QkMvq29CcUgO/bdFeR+O9cFWkQPb0CRDfifbRYGNuh7uvyZxJhEw8lf6
         Sb6uKoEa6I9hs81dn9LeAfZ4Z58biAfLNToEHDRIiID3JktYB+GDt1a6b1hzx9KsZ+E2
         fS9vlfXSp9KjrhzNt8lMPxnx61ouDTvj9kKhHtEU5Zv9M4guz7lP8EVkx+MGm7vkSppd
         W9AA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Qxg8U6tA7u+XaW0ZbmDU8dmhOXGbXcHyoUMNp0Xk+ItUgucU0NC8F3FBVUGGofiXfoWsMcxXrBfntGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZLLUig0jZE2ZxWHCJZq7jm7lweRvFXZDL2njXr7Sz6UhfmEtU
	zMYB9F4TkdgwOdYgnQ20UJDTXkRRwlNAXevtRWzAq9lT6o4saSo2VQJuBWWSq78=
X-Gm-Gg: ASbGncs3FKyaYr6EjzDbCwSHpOdOlBl+EKqwFuTMHCUX0wqXrP9Vh4nektjpbSGhsgL
	0hHCuBCi4Gm6q1teceDTHlArOul+MKMDKongJP7qOFlvWmW78bq5NoJQw0gmW2dNJGysOjY7Ya3
	Az7yJ4ttNRXtRg2LtpbxavYSmdEWAYXsR0oohYqLhOt4eWdWDNKQ41J2eoUxexhheJxKbFm/n7L
	dcMfMNHu0Zzy1ov5LgOYO6E6xvTCPJWg8fC8sH1ImdvsCOWXHKa7P01w5Mx8vuVorZIdR3lreWE
	aeJu2zGzMJnTzRhl7/T3ocbssLc0bkIYWMGRp1rrC6I9pdzbcvNqAgqK
X-Google-Smtp-Source: AGHT+IFPRV3WrM4qUPjKyQq2cTWDQTQifuNlkOsms5GePA9Os7cAR7/IKQemogvl9WbUSLD3uLc2Xg==
X-Received: by 2002:a05:6000:2506:b0:391:22a9:4408 with SMTP id ffacd0b85a97d-3a1f64386eemr5180967f8f.16.1746871907101;
        Sat, 10 May 2025 03:11:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d780ffb7sm31422365e9.1.2025.05.10.03.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 03:11:46 -0700 (PDT)
Date: Sat, 10 May 2025 13:11:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [tip:x86/boot 10/10]
 arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we
 previously assumed 'boot_ghcb' could be null (see line 101)
Message-ID: <aB8mXZ_TxDuLa7Jr@stanley.mountain>
References: <202505100719.9pE7wDfB-lkp@intel.com>
 <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHyVh7KwNyekd8ZAATufnMHyzyMismVf2xW8F=LfBJviQ@mail.gmail.com>

On Sat, May 10, 2025 at 09:57:23AM +0200, Ard Biesheuvel wrote:
> Hi Dan,
> 
> On Sat, 10 May 2025 at 09:43, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > Hi Ard,
> >
> > FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/boot
> > head:   ed4d95d033e359f9445e85bf5a768a5859a5830b
> > commit: ed4d95d033e359f9445e85bf5a768a5859a5830b [10/10] x86/sev: Disentangle #VC handling code from startup code
> > config: x86_64-randconfig-161-20250510 (https://download.01.org/0day-ci/archive/20250510/202505100719.9pE7wDfB-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202505100719.9pE7wDfB-lkp@intel.com/
> >
> > smatch warnings:
> > arch/x86/boot/compressed/sev-handle-vc.c:104 do_boot_stage2_vc() error: we previously assumed 'boot_ghcb' could be null (see line 101)
> >
> > vim +/boot_ghcb +104 arch/x86/boot/compressed/sev-handle-vc.c
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   96  void do_boot_stage2_vc(struct pt_regs *regs, unsigned long exit_code)
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   97  {
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   98   struct es_em_ctxt ctxt;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04   99   enum es_result result;
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  100
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @101   if (!boot_ghcb && !early_setup_ghcb())
> >                                                     ^^^^^^^^^^
> > Check for NULL.  Should the && be ||?
> >
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  102           sev_es_terminate(SEV_TERM_SET_GEN, GHCB_SEV_ES_GEN_REQ);
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04  103
> > ed4d95d033e359 Ard Biesheuvel 2025-05-04 @104   vc_ghcb_invalidate(boot_ghcb);
> >                                                                    ^^^^^^^^^
> > Unchecked dereference.
> >
> 
> On success, early_setup_ghcb() will assign boot_ghcb, and so it is
> only called if it was unset.
> 
> The logic is a bit clunky here: for clarity, it could be rewritten as
> 
> if (!boot_ghcb) {
>   early_setup_ghcb();
>   if (!boot_ghcb)
>     sev_es_terminate(...);
> }

Ah.  Thanks.  I didn't even think that early_setup_ghcb() might
set boot_ghcb().

regards,
dan carpenter
