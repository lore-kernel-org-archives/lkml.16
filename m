Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A2619DF75
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738189307; cv=none; b=Eu+X/JvB2WkFNi5RTGdoOW+5ear49uGALLjx1Mk4h/5x2bmsy99FxHczv2ycpr44+FEq6bfBltKoADo2P8JKOCuY2ty0nDStFGYTkxujDEkpxk/bj7JSP3gpWJjmSTZ8Idrw2Fx3oXWV6bJfXZ9gyHtAfql9NjPH8Qh4i4qtJUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738189307; c=relaxed/simple;
	bh=farTO53coIPRLWdA/j5ulwMmgF1hIwZqDCDXvQL/1/0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JyaJqQozcg2wMyDlODVSRscKekk8aD6DA3pcJQzbjzCY1nGaaP0oKh2hXdEZufuuAhr7Wy2XRyd9Gq7a6qtMscPNrImx6tRleI1/4pcH/b/S8JVHcqcgVNiYNKgCZdEvA4dnZ8k2lsakURYI8vW+diecnTA4mcpf4LJkAw56Amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SPmL78Qi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPmL78Qi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43635796b48so618615e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738189303; x=1738794103; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOVDg+y8yqQJG2b6/A3VgQPrw3p5f6ahdRiK7F2y/XY=;
        b=SPmL78QiHgjJtkK+6hHDJxv0DyfaySmGIHrxO2RjT+rkk3lcdTdzdAdP3QIjL3j8h0
         OXsspkNPLzSI8yFSupXcZzIqGjdMH0EAF/suu6FV0izCApLsJhlwE9DWBX/yciTm6vM6
         f9wJdmCpBGzDz3BiRXVABWvam48USlNn/M2Tqr9CixHPlPPds5xa5v/kw+8v/8v2D0tt
         EsD/h3I0+wAZVsUBo60SNuKgSadwxYw+cLtw0A4XgR8WEhX96DpCllivM/onQ2KhT79t
         aMxmI0S6N4ZZrHptWGSD246IIOunwVAsgt3+4MeWDuayD4cZXX9dKGl3MT5GR2PqjyUJ
         WPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738189303; x=1738794103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOVDg+y8yqQJG2b6/A3VgQPrw3p5f6ahdRiK7F2y/XY=;
        b=CfKohMg/gL7BRiT7IgnoImdVbhMpgvSYaM1oVQ2zs8wzrwJY6xR3H0fvQYWYSTJx80
         j9yjJ6JiXQ1W0c+9IqU63PN8y/g2zNwF6vwEkAeQ3jucIqQMTXrI/Xe0RjVnK0fKKTux
         KHs6OPNl5P33OSSEWbFpdHAWPtAEdjqFulCDGrjbqP7i1NMObw/2rmHtunXcQQZaAlR0
         9MxTwc2WzSHSD7tFSYAW+pN6JaKpSeKDF0KomB0aabe3s4B3llAP+morTwNfyc5Ner7K
         h9Ot+r58kiXzHFJZQCvwJqtmw4DCW8J0ejCgYvxaWuEnIWcock6VUqJ7YrhcgL9OqFBe
         7gVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKPHt3K50cIbYBs/4EealXKhZcj62f+LM4Piyco8gs1MU09SvJyrf9SVGqTyzTRYK0vYJOvjJFVQc22ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJfgIUKOLJRP8/KxpQ9H3KZuxqeltyIwV/NKbRPYGKjqJ+g+2
	mz77CKfnuoGCeqch610mU9X842f6r8Vy+ZX4431bvmLowNpmMYDh
X-Gm-Gg: ASbGncsABlyFCus2YZZl1QEyxtK2jDp+W76gjtiH/xZyXQsRI2OzdAwn5nBBxCpGF14
	4HW6cPlrO12IuhZ56I9j6mzjfqDAip70HccZExkxcr/9swTFCe+BY6Ry+b89/jz8k8DucwrF81+
	bJ3TGoGHRXxVYkhs+fqyN5s5tGMG+ac7fKaeMB5gBX5IQOaRp9l9rJBXaWO6qJBtFORFpdZlJUq
	OSEjLZbAXvN2EmFHIfxYoYVM1LBffaTyd6JsuFDzV1jXQWV75QUiPrvoPmguyf/OfCT/YF7gXpW
	3QNoMKeX/mfrWzhHna2Fpk7gKg77L98Sn4aFZNYUx0VzOOgwfs8Xog==
X-Google-Smtp-Source: AGHT+IFsn/yWIL1EWmQDx0L2XWxnpx2kTSuDh+vsZ4vDcf0vOrxidiZ+CLBoyvPtTo0M0t1fJefQ1A==
X-Received: by 2002:a05:600c:3b8e:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-438e16fa988mr8268035e9.11.1738189303321;
        Wed, 29 Jan 2025 14:21:43 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7b4c4c4sm33826055e9.1.2025.01.29.14.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:21:42 -0800 (PST)
Date: Wed, 29 Jan 2025 22:21:41 +0000
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Even Xu <even.xu@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, Xinpeng Sun
 <xinpeng.sun@intel.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>
Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Message-ID: <20250129222141.478c03df@pumpkin>
In-Reply-To: <202501292144.eFDq4ovr-lkp@intel.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 29 Jan 2025 22:02:59 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
> date:   3 weeks ago
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ovr-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse: sparse: dubious: !x | !y  
>    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, ...):
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
>    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
> 
> vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
...	
>    297		for (i = 0; i < config->prd_tbl_num; i++) {
>  > 298			if (!config->sgls[i] | !config->sgls_nent[i])  
>    299				continue;
...

If zeros are unlikely the bit-wise 'or' is pretty likely to generate better code
than a logical 'or'.

	David

