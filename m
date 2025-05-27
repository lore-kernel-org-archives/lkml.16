Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D811C6FEC
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372631; cv=none; b=ubNOZaC4N/3weaJEn3tv4YHfGAzZZZ1/TmnBtuS4BUK0CIq5zGqPAkEdWymBF0HeWwp0ZZaU7tXeBuOvxcl1dAZeKj0dkpcWXXJUkNqx3TEfyEjFhHvPfw5w0ALESFBoq9qojuZaWO4dv1JeQD95HSb8ZM5mj3m9US8IUz6/MQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372631; c=relaxed/simple;
	bh=0V2IT0GB3CCYDHYDd9IPNTJA/sCAev+NfA710MYJ9D0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR13wiUgNsW7qZJkJiWTOHsM6jSXRlq2nWh5pcsXWuOn7+/SIt9mtT5NyYmU+OO0XQrfpuilsH2l1QwsoxRYhkv1AH0Gu7Y35cRjxpaO+FSFZ61iWzaf7+rq0C5uYDGgGSlyw773SEJ9z2vXD4Ew91hG+w8P745UU6A60J1NR+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkzJutaf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkzJutaf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c9563fd9so2577026b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 12:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748372629; x=1748977429; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/21inFLnmwjl5s1Qdj5NSJO73NTgGmWxCNcX3uDgbE=;
        b=HkzJutafZjOMKXstZnn8s4k5tT166skBVdBGFUXWqTuVJd5smC1zF1MAx8SNc4XTWS
         gjrlJlN4galSvC+Z5x5m2ob+/DL0OPnjFMXjQ4v1HdFlTmVQykN9bpQ+0rEq5gxMQ436
         FxrhOPXXiZ5+KItYHDqzmI0/nOw2yVP1Dt8IVdwQPjwKQlsa3HnhY9l6TreG2xWQFlJI
         xcSYMKgGiFVi51WnYoZSfJL7wgbmAuXSds0oLiyYfBppYiR5svMy5I5SpMVG7FkgMrVg
         mB6BcwrrSF02PEWahjxm2bBF7hSRBXXZyk2JjatLA7HTskS3TcX3M+Y0O5es36rQbIjV
         cp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372629; x=1748977429;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/21inFLnmwjl5s1Qdj5NSJO73NTgGmWxCNcX3uDgbE=;
        b=B2oBCVf0I0BxeUk5Gdn9iuGPYTzxgD226hhyrqF3ed7fyiISC/uVeG9I8CPe26rmPI
         bvWgE33NFNWKpMHMn7eRfj/rmVMh6srBIvNj3Q2imlNmer8X6klxSZqPSPSOL9QcAuSw
         WFtaCU6z9KU5EJhsI5GAw7GwE2Rf9FTxIjNb9bW+J20njjAYLL8oEXXRkMLbfOZ+cMd8
         WFCwjEy1x5DGXQ7lAWRYBNHZSm6aFwZotmxMd4kx1X82TTbF1OZUiUa1q7TF5qlM8AzG
         F36/Jnu9PK+hI0h5rPo4xyib6TGgT54Ri+lUSqEccV7uIGRkGCpkNxHE+jAS1XgdXENu
         z4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9Rqf1zbMlJp3z7NL4s26SqNGK8KRorFPMMR7y2qtQNrwHEEylNUTUHqZ12/ANpLfKT2+195hO8UPo3OE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dV3NUjSFCaNuja5j9fOBIxZg1v6iq/4unCEOIqZw0c68K1XV
	eJLaNTDv6PjoW56VW6e//hsjsW5am333dM+xJyy7vq8qW+uZwwZ7ANih
X-Gm-Gg: ASbGncvNuVc7SmrngXTVYQpKdPRkhqAlFJc9hQllRHJSthMiBSeFY39camcQC8Y33T3
	YTpWX3VfoUzMDyp4ebpKS+BhzMUprGCgCO2ZrZlP1spb8ewNweoYpytyhR3Av9KMrv2YTPQUkCe
	grVRl5nEglS8TE/DYrZuAh+9Vh1xht1Miv9YNx+EciJP2tpckOm07ZK118pKAsJtBjnGDOFb7DX
	vMF4MPOHsNkVSdcoz25pPF9iieVvy0BUFIN/W6tZ6+jumtl0km9jO3nrz0zFSkx9dPC4c9mOiFK
	EuMMkD86G+evH0oOi3HxGZ0etB39+lUuo+LHNGOjf7dlP+213oLPbqx7h9D7pQ==
X-Google-Smtp-Source: AGHT+IGgF5wadT64z/ElmyI+k9z9/pXaq18L8S8V1cpKEuwa6Gd9wEt3rqSjlEt4IltfVfav9eEXfw==
X-Received: by 2002:a05:6a00:a21:b0:742:8d52:62f1 with SMTP id d2e1a72fcca58-745fde87b66mr20460884b3a.8.1748372628487;
        Tue, 27 May 2025 12:03:48 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c490c67efsm1122996a12.28.2025.05.27.12.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:03:47 -0700 (PDT)
Date: Tue, 27 May 2025 15:03:45 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Luo Jie <quic_luoj@quicinc.com>, Andrea Righi <arighi@nvidia.com>
Subject: [GIT PULL] bitmap fixes for 6.16
Message-ID: <aDYMkVGnByTn6HBQ@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull bitmap fixes for 6.16. Please notice I changed my pgp key.

Thanks,
Yury

The following changes since commit ca91b9500108d4cf083a635c2e11c884d5dd20ea:

  Merge tag 'v6.15-rc4-ksmbd-server-fixes' of git://git.samba.org/ksmbd (2025-04-28 16:56:01 -0700)

are available in the Git repository at:

  https://github.com/norov/linux.git tags/bitmap-for-6.16

for you to fetch changes up to 895ee6a22e3195b7c1fee140c842bdeedb89ed33:

  topology: make for_each_node_with_cpus() O(N) (2025-05-13 11:40:04 -0400)

----------------------------------------------------------------
bitmap-for-6.16

Bitmap updates for 6.16-rc1 include:
 - dead code cleanups for cpumasks and nodemasks (me);
 - fixed-width flavors of GENMASK() and BIT() (Vincent, Lucas and me);
 - FIELD_MODIFY() helper (Luo);
 - for_each_node_with_cpus() optimization (me);
 - bitmap-str fixes (Andy).

----------------------------------------------------------------
Andy Shevchenko (2):
      bitmap-str: Get rid of 'extern' for function prototypes
      bitmap-str: Add missing header(s)

Lucas De Marchi (3):
      bits: introduce fixed-type BIT_U*()
      drm/i915: Convert REG_GENMASK*() to fixed-width GENMASK_U*()
      test_bits: add tests for GENMASK_U*()

Luo Jie (1):
      bitfield: Add FIELD_MODIFY() helper

Vincent Mailhol (4):
      bits: add comments and newlines to #if, #else and #endif directives
      bits: introduce fixed-type GENMASK_U*()
      test_bits: add tests for BIT_U*()
      build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()

Yury Norov (4):
      nodemask: drop nodes_shift
      cpumask: add non-atomic __assign_cpu()
      riscv: switch set_icache_stale_mask() to using non-atomic assign_cpu()
      cpumask: drop cpumask_assign_cpu()

Yury Norov [NVIDIA] (1):
      topology: make for_each_node_with_cpus() O(N)

 arch/riscv/mm/cacheflush.c           |   2 +-
 drivers/gpu/drm/i915/i915_reg_defs.h | 108 ++++-------------------------------
 include/linux/bitfield.h             |  21 ++++++-
 include/linux/bitmap-str.h           |  10 ++--
 include/linux/bitops.h               |   1 -
 include/linux/bits.h                 |  57 +++++++++++++++++-
 include/linux/build_bug.h            |  10 ++--
 include/linux/compiler.h             |   4 +-
 include/linux/cpumask.h              |  19 +-----
 include/linux/nodemask.h             |  20 +------
 include/linux/topology.h             |   5 +-
 lib/tests/test_bits.c                |  30 ++++++++++
 12 files changed, 134 insertions(+), 153 deletions(-)
