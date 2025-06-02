Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D931E15E96
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748888204; cv=none; b=SPG30naYdeaufAAubQe7YQ61NjZkfDiVhVmeATPK+3WA1uMcHBQ5AtXC0QUB+48Pwz9mKqufWAOGvOFoRLiuD8Zth4TvWuJequvQI87sUkJrvtPVHRJAWFMqVpWiwuPsEj++yetqI/6fS6T1ovgm0qNgi9a4q404WVB3aUYWvDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748888204; c=relaxed/simple;
	bh=f9XswYgRoR6xm4eoCjF4bp7QWFQIJHb7zjWzwnUTI18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOyDvHOnQjRPmODAGckQlwLzWV6fTHcKlRcIMD2vp8UGR4OCQPfXRq8I+ZyExN7/PLnQFfaKz/Thf+20gSgQ0GXpgqtJJQzxlr3QPh0xNFJBj+rOMND0JMAu5yPkHRApENU46XhlgACSN4mTfkAQbdeECpTWHfmBB5n5SdZGafU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNNl4NAk; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNNl4NAk"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so5077988a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748888202; x=1749493002; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=enafILAIgMKvYXjM3KyTtWQBW2n1hkN8yMiMH4LBGf4=;
        b=dNNl4NAk2QtAezmkZtX6qMleErPtV7Bn2uZRakkEv2DxC/CuDo/qzBsc/39e80D4hb
         pzRQwVzmvD5ulXX4RXCqdn3XY9ojmC5EgZX/xRWHrxTjNFB55/nrhlbBTGqeM5/55K0i
         7yKld4DvxNHLBwBu74Ho9LnCMCvepemERDe6DbYFFCstIfbopxeBZbpGCKx0N/ZNrEXX
         RcZbKSZKmTwYiqe61UJ8Zx0tZHCLHRauwQ/M90FfIzlzv8i/RSvD2ay1cq7pcZL3akZi
         D1jS2k+85ZvYV9zhbRjL6kRX7l8lAcv3qw4U0CV+9Lkz36/0Eve0+w79/WxS1sbSe7SK
         rDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748888202; x=1749493002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=enafILAIgMKvYXjM3KyTtWQBW2n1hkN8yMiMH4LBGf4=;
        b=RuIdzw7jjoJvrSgEXSYKJ3Y50KBnaUSoio516jz/zzqiCSjyz+QX5Ci2mKZ5xGEoD2
         s3A+qefyhKwMtrhiDYCaPCvi810j+h3zQPT7w+YalRfsK4MY2jiX/zTAXLuxjkoQl5qD
         gWj6ALV3Q4NPdFEcYxZGBE5ryJlrJmpNLZKRpTd55AGOTUbA9+XeMxWLofbatXJ3DnAd
         M3FnsTYOsIxadMlzI9hFpaLIAyfgfqETgE48jJOhF3w/PvJtxA+8Pzvq+Y/yDEf/RN9d
         fJ5aAVQ04JWlb/OKKFHfNxR5nlj+p9VBXFUGOBiah3jl5CGuj5b3G6oDlxUjR/aV4dSQ
         y1/g==
X-Forwarded-Encrypted: i=1; AJvYcCVd+Nl6K9ZsS7XYFO2JJEI2KQbjKKQ2U3e9gguXp27+KSjqUUUkS4Hga5swQ3ygv0ZPuq6AshIOp5dOTJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNvw/FtsrdLyUuA2p59hXCvQKV6mQozenWg+BqIzvvsMbRm/WB
	F8jJwZ9MVEwkta9S5TvQgHFPFfBO6p8cvLUpRxyFsy6kr/prhqB/g47O
X-Gm-Gg: ASbGncuDweysCj5hi/YJKtXBGNli60c/8sigQn6RHuZwoIW4KeSDH2R/mcQMJzxuVS7
	Z0HTlUgoc1b55tTtLIuzKELncFwLMr5hyprgv08sAmiAIawonohMJ6l6JO3gyZ4Rd/+cRsX4jXr
	CAangtpVi4Ohlyyr4e3rqYFZnkImOW0Jh48cALzp0Evxiamo9n8T8/gl2IN7XfaJazzfG5KC581
	gcnoEoX6+DEITwdSEIoqhrchXcaSH4GiKw+Pgew88omZvAHOAVMgqwWfWIHpprJC62Td5/0o3Jg
	Su4z1+Kgsj5Sl1PWKpYJCOGKHZg1KMKBUWLafCPdGakyDO0QXw8=
X-Google-Smtp-Source: AGHT+IFqOoOD4zr3oQBZuji3vrnQOuLh9ewfbHLcw5tQbViyIjBrOOZx82cwecWw/FLnDb+cl3Z9mw==
X-Received: by 2002:a05:6a20:728d:b0:216:5f66:e382 with SMTP id adf61e73a8af0-21bad188886mr15545717637.35.1748888201843;
        Mon, 02 Jun 2025 11:16:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb37d5dsm5845923a12.34.2025.06.02.11.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 11:16:41 -0700 (PDT)
Date: Mon, 2 Jun 2025 14:16:39 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Luo Jie <quic_luoj@quicinc.com>, Andrea Righi <arighi@nvidia.com>
Subject: [GIT RESEND PULL] bitmap fixes for 6.16
Message-ID: <aD3qej7zl8nnTgYT@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull bitmap fixes for 6.16.

Thanks,
Yury

The following changes since commit ca91b9500108d4cf083a635c2e11c884d5dd20ea:

  Merge tag 'v6.15-rc4-ksmbd-server-fixes' of git://git.samba.org/ksmbd (2025-04-28 16:56:01 -0700)

are available in the Git repository at:

  https://github.com/norov/linux.git tags/bitmap-for-6.16-rc1

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

