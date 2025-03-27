Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241B211487
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743074123; cv=none; b=Usl1xTpkxuOaEMgIrsiU9ki3rEBWsjQSJRCO3onDVFnM7SJDfbJqGAVHFPvGJXqs44nIyWp2Ha6mCXKdQ8eQ6GGU/FGunA95DC5ohdhWoOtt4KZYkGMAE0KyCjgErnaxY1ymHuWl1g3Xwajl5AFSPZHazCFtOlHKnrNu8hsaNL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743074123; c=relaxed/simple;
	bh=Lb97isTLBEeOVnMF+0hR3SCtW77apQZ6W9iJ3L6spPk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=unFHnScUeYXM52EJQt6hYxeE3MFA6KazNSvJe1m9+urdqy8i6X1twmlLRWnDKDctgTBtutMr8/9/gIh7/1HblZAM86B5C2UKSDCshesTzUhp2IP+2Qs7LAzNNX8uvmQBO141jzjmwQz6GdjmU8UgDt2VtWCivQowrDHCceh9jPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Ua7daI3E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Ua7daI3E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39143200ddaso482146f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743074120; x=1743678920; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMODiyhJzHUS6gKDF2pRi/gZt3v4YGP+Fqt7967m3t0=;
        b=Ua7daI3EvYZDstf8j3kQsF7ViSlzxPEarN7A6yQgsr+sHX7UEv9V+c15/hX54TnGph
         p0EawDGgLDTHJhpTwb6G+Gel64UOFU+zcfxe5cbAl7Zwj4vkZK42Q+3jdAmMhKazqqh9
         CZ2O+VZdg7WpDKgVBlTA9l4fgP7F1is870eL+iAsRTuNg8fctwMn6TdA6FfZlOkp+IVg
         0Np+HwECM398A+DtOHbZ+vj5Ddh59TYZRNuTzGfNza6A9L49zjF6dygpKniKU+GCLl0t
         uBsSoDO5Je8N/kfSQbSUghJpD1wK25mftQ+Do/FjYPkqs9TwQEz38rebOX1MT9lhWuyO
         xNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743074120; x=1743678920;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMODiyhJzHUS6gKDF2pRi/gZt3v4YGP+Fqt7967m3t0=;
        b=IAElNnq7FRURh6ztMhE789uuUQHY4HPz4h6d7r6gQoMHLKPdNkTS+MQAAMeYU3FUAN
         i8z8zZ2hoAfKSEjh2V/QXXuRC7CFB0u+xwl321yUtjSq7SsSJBHFsbfMD/id6p80ZTpU
         nqtPT1w4nqpD9wsjaz5bNVrQjy9iLYEs38tH1QYahztu95RzXbmlzkds1/TDkUEgIKPr
         CszTzChotHhx2Scj14lrC7syz2FKh5OOOPpUukx4/4kpDa4DxuINDMYGwTu1pDy7aUNf
         GcB84r+XnZgyaNvP+WA0oVTAS46iRpmbMk6kb2bzYvX/TML2Lal3CRbpa54gFRMgFl25
         CVnA==
X-Gm-Message-State: AOJu0YyQkxL8A0tnO19GlKkXFuDQedSevgQmCHgMnr8JPhYAunGD92t7
	5lRNQ0DWvzg+lojG+THMjO4xdCrThUqnrcMo2Eg1c5QA0o2MHIImNTJ3DGpbkRY=
X-Gm-Gg: ASbGncvBucQDQqJS06JpaCF48Opy6xx+N2QUQojCdYJhTzqcuOWx4gpOWhFMGC2wWHS
	X48o2ol/NBcNd0uextTYaa+BuyaX5ab+plncqpFcptAl1+THYNf8sLRLgzwVzZ3KMejkqpDzE5w
	wAKWi+Jlc/MRUrfboNyoVSuSMOsPST+qfFBunTvsG3NfMdhr1pKwMYd89E77meNgy2p41Ot7G/E
	94w9vZqi27+G7fMabQnjbm5WJ5bjvk6tiFE8yAnrwpeOty7AHNfPAYsd/tIPFM0uOmTKIIozarf
	SxSYtjME3kgV1w4MFDKGsY+W81laTHAEIWRSz0smhOGuYDU=
X-Google-Smtp-Source: AGHT+IEM+iSkjODwzqX6JmHzpZx5dFBa9V5ncsKe5tqs1bQnjwuXD+UnyrMlHKMZu+xQ4SanEW4CPw==
X-Received: by 2002:a5d:47a5:0:b0:391:ab2:9e80 with SMTP id ffacd0b85a97d-39ad174df98mr2492035f8f.24.1743074119917;
        Thu, 27 Mar 2025 04:15:19 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b3dd5sm19503318f8f.45.2025.03.27.04.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 04:15:19 -0700 (PDT)
Date: Thu, 27 Mar 2025 12:15:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Subject: [GIT PULL] livepatching for 6.15
Message-ID: <Z-UzRZybK1du6HYM@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull the latest changes for the kernel livepatching from

  git://git.kernel.org/pub/scm/linux/kernel/git/livepatching/livepatching.git tags/livepatching-for-6.15

==========================================

- Add a selftest for tracing of a livepatched function.
- Skip a selftest when kprobes are not using ftrace
- Some documentation clean up.

----------------------------------------------------------------
Filipe Xavier (2):
      selftests: livepatch: add new ftrace helpers functions
      selftests: livepatch: test if ftrace can trace a livepatched function

Petr Mladek (1):
      Merge branch 'for-6.15/ftrace-test' into for-linus

Song Liu (1):
      selftest/livepatch: Only run test-kprobe with CONFIG_KPROBES_ON_FTRACE

Vincenzo MEZZELA (1):
      docs: livepatch: move text out of code block

Yafang Shao (1):
      livepatch: Add comment to clarify klp_add_nops()

 Documentation/livepatch/module-elf-format.rst    | 13 ++++---
 kernel/livepatch/core.c                          |  9 +++--
 tools/testing/selftests/livepatch/functions.sh   | 49 ++++++++++++++++++++++++
 tools/testing/selftests/livepatch/test-ftrace.sh | 34 ++++++++++++++++
 tools/testing/selftests/livepatch/test-kprobe.sh |  2 +
 5 files changed, 99 insertions(+), 8 deletions(-)
