Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33F91C695
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745779968; cv=none; b=cwR9fTeH2FcsjZFgxL6/4LRY2Ssst64xg6Pkksr6LSWWj07HmFie02YFURaPTUj/T1u/+44kIo/N62bROUWUyyHp/Rcrqk6p6JeKDQp6xc/YzdgcAZluxNDdcYrGyrPRJqJe8BEFZUh9n9Ci1XVgF+exG8NPdkLh4kSMzH8kVLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745779968; c=relaxed/simple;
	bh=MeWcMc/3rUAQKiw3kzgdTL9+0Iuyuzo2tqvxPa7jMXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHCKIkZ6H2clHp0wUGhQJOj4/LQC5r3Wr7Zei2i+/bhVFvMGxm+FWJL043LhTdPpNpovReHOiXzRVM/aLkEAF1J/ggQwhAQPmZOG65IfsYD7mXKhHhWpaFkog01sxnWi/10tVSKoRF/ZHA6LV0UZSUBNv6rnv+KCDUmJ01A/Yyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jAdPmkSG; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAdPmkSG"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7399838db7fso4019517b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 11:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745779966; x=1746384766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6qM4yswkQvDZs6T0R/skZfwyvRhvZipSs0n1z+TSDKU=;
        b=jAdPmkSGQjuRvNEHWYK/QmSOzKrT+wHK74NE3+8kEu5PZpo+bVmOB09aMb4MZhHG8o
         pYfrgVEBn0iOAo/UI1CStVNNow7yWbhDX0gMHUmrR1HvDGjcwxTFmJg7NZufkf+Z4XoE
         5FbshlcwJU9QOJgNdf0jEhQp15YZS+nwbcoy1oHsHCr9gUfI4etwgDKNm4HC1ERF2VlO
         ShaYi0BET5js23izdFYYy1jJ8gyjU6Un/J0Qov1Sa6WuNfVxW9nuWEyE/mMLEla0RQ6v
         UdYofxIUxnEx+1Ax7BUt1a8z8THpRVoIdewXnLibtlJzbheI0fsgbIT6Pe2FgDkOA0KC
         wAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745779966; x=1746384766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qM4yswkQvDZs6T0R/skZfwyvRhvZipSs0n1z+TSDKU=;
        b=UIBhSYOiJcCNvTFDMvZs3ss0pXRfkwYlSlcOsOXIWeZx1/+IDGYxHcVoBCiFRoRZnB
         ojplGF8oY/ak3KaLoK9vrRoPipv/RHYQy17Ggz571yt7jFvobE/GL2eC/FvpC49nRueT
         NaMEauyzbf2g1xCKAutuFAogtmH1YKNqw2hBe72zrg4NSYuln5a199Qs453HrTf7KQYr
         3JpN6DjM/MLvRrfmZv3B94Xc52U7LcxejEhtASK9RwBG5f5zmICn/e/+6W+f/neYBvuD
         vSfYBoQ0krpKxLHklMsFcgXNZz/uTBLr7canDFgzlfIdZO3AZL18IGX9RjPsGj60D86g
         7Umw==
X-Forwarded-Encrypted: i=1; AJvYcCUnT2d4WY3eU6b03jLowc3kwH6A89imE0kTlW3akIWH/WF1gfR4r1dUXp5pwCaA8Hts6tkcM/F2qew90+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVWi6x/8UYNgP/Y9DmLF8i1ncdgchVHT39GeI3c1BXEzPmILWu
	P9r0L8GHOh3Mrbs+SBigX3ejRz3mE4pksbuG3NAp8FX9xdh9FGiq
X-Gm-Gg: ASbGncv7qQeBJsakwsj3wG0m1rLN/MpOAGGKkdyRsdoG6zMe+vN/mzI1C8B62YU6X9e
	bAsCNuvjrL/MSaX27XQjXvsXKMTIH0oLI4FQ+7eCycOkjjIIx5j3tM+/nT352wHnJv8S8c8ahDI
	X1c7kNUZhxpzJeTYHBO1RwsB8ADbVlRF4WDlscCP90bQd25E7tBs4pQnLnoFuaxK3JcmPiw1uJM
	hSatACh7Ew56HR2Se/EiyayNSM+ERmzjp3LIHo8/HZQ3aMofOIR1kNFAqqm5PuDOzetKFct/5Ee
	PAySmizRg4p7bZcBBJdVBvGxukZMkJQYH6zGq8YKXT6HUiiYWcc=
X-Google-Smtp-Source: AGHT+IHs8JX/lEmqBBdD9lliAqecT73BKklOGDyVJvmyq8yU8IpCgCEGIZMJ2awzYvyzWP/s8LkAvg==
X-Received: by 2002:a05:6a00:8104:b0:732:5875:eb95 with SMTP id d2e1a72fcca58-73e267e0e51mr18760549b3a.4.1745779966020;
        Sun, 27 Apr 2025 11:52:46 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e2e8b7e1dsm5786497b3a.50.2025.04.27.11.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 11:52:45 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
	James Morse <james.morse@arm.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] cpumask: add missing API and simplify cpumask_any_housekeeping()
Date: Sun, 27 Apr 2025 14:52:27 -0400
Message-ID: <20250427185242.221974-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

cpumask library missed some flavors of cpumask_any_but(), which makes
users to workaround it by using less efficient cpumask_nth() functions

This series adds missing cpumask_any_andnot_but() and makes
cpumask_any_but() understanding the RESCTRL_PICK_ANY_CPU hint.
This simplifies cpumask_any_housekeeping() significantly.

v1: https://lore.kernel.org/all/20250407153856.133093-1-yury.norov@gmail.com/
v2:
 - switch cpumask_any_but() functions to signed type for CPU (Reinette);
 - change name for the new function to cpumask_any_andnot_but() (James);
 - drop O(n*log(n)) comment. cpumask_nth() is slower, but still linear.

Yury Norov [NVIDIA] (4):
  cpumask: relax cpumask_any_but()
  find: add find_first_andnot_bit()
  cpumask: add cpumask_{first,next}_andnot() API
  x86/resctrl: optimize cpumask_any_housekeeping()

 arch/x86/kernel/cpu/resctrl/internal.h | 28 +++-------
 include/linux/cpumask.h                | 75 ++++++++++++++++++++++++--
 include/linux/find.h                   | 25 +++++++++
 lib/find_bit.c                         | 11 ++++
 4 files changed, 114 insertions(+), 25 deletions(-)

-- 
2.43.0

