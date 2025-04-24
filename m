Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38921CC62
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526492; cv=none; b=VVt/2afziThIdBCpPllBcRW13opE1PyUgCrwupebl/uJlmguzTQ/BKICswnEfSLaSexw+oaBwL4ppRYoQxYzClCjo4AjpNrtc6t4OAFwNp6Q3Ye0zBen+EtPTtt5V9nd8Wg3zbYTdhAdMdQhHt1SoXaZ18q4ed7tRgbhR/4YBlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526492; c=relaxed/simple;
	bh=nUFNqBNv+jufOcKVj7RmbeiHI2hKBO+NtzgiTALsO9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k6+rLAWLo137VHa/WF/3RPH1fwV4tPPoC68kJtNWsPFM94HmjP2zh5h/Uq2JSz0b9nCWuXnOR8OqDxlDnsraQVc+tZBi/iMdPPBqdGNhStWFS5uWWPY+Gng4g21SocsgxGobeiviRaXAJ5O6+74SziUhkeLCAy7w451B14bJrB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YW9kjI8q; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YW9kjI8q"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4774193fdffso25216991cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745526489; x=1746131289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mkCigXxCd0yRpiiW/yUceKBlwamXBSHFGuFjCjP5s7s=;
        b=YW9kjI8q9QMd4YJJCPBbObAS2u94pWVlxESckm5tA9kUDsx6VxjqUot5IHDFvss4Jx
         blw0OiWka7DuwVQJWoKKbFe0cWVgJ08flAJf/cqifzv55QWJlbLj4DF8ogc74cxB0BMF
         N1AtbvYajxs6BvA4P14RuNiXKAZvD/7JCJQaHzoFS7xqW8pTOwO6hdsz/YzG6v5k79sG
         mQ/nvqfbbTJZxt5cY07q/nJ7hMdZZ4KQNV4svXhJpaVZHwOfFjCeze30aAmMCh3WIq94
         tBg6woQ7Sl63aOXh14bXhNGeMHFrFX9T6ENVMcCV3SJRSJExRZhC1pyqqxOGplgIXQ3g
         XOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526489; x=1746131289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkCigXxCd0yRpiiW/yUceKBlwamXBSHFGuFjCjP5s7s=;
        b=dkkVt/X2Hrxql3Zju5cFwkaMHLPQqLA3ob0bql12Dll5EoVkVEBKvRaUnzj8W6BqUg
         j9Z6YT0zc7OQxP2zM8uh3GPSMZXAR2yGPRLvgPY6BZE9KRYDBUJA2rgvouZ11WFpGctL
         bD8k+C8zG1axLBVGnqpDWOS/MsuwJy+j49e4fkBJAg3uPbzodMh8/llIncDPwMg8wbK2
         rUVdy6SFb1+PqbHE+DTW2j4LaoTdfr0G9z52aOkuEM9Z0vKfZlCdIsFwoE/YQmTssMas
         GM60ZNheWCg8C8d8dSN4pE1AowrGHVtE2SG3YW81wykSv1z9ZcdRvhaZ2tpQO8kL1lwo
         y3hw==
X-Forwarded-Encrypted: i=1; AJvYcCVhl58xFZrjuMqOSTBSX3nkMJqFGCfL0bjOofIPtpkM78FpBZ3+VbOAZyZgwNieuMIqh2tCXnGlHbgrCKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQSjR+lbhCgJ/asGVEH2imUIl0s/eJ67RGKUMw4X/kPFR5mHi
	vv4etqyNoMdfHAPsjRyWjBBQaRD+oYsuFcThLfa0947iec2oJ2g6q9Y77se2Nyl9NE7jOkgRcCe
	J
X-Gm-Gg: ASbGncvTUzwlReZ8z315H/PGdW3/Zh7DWHFbeUvhuSRwzA83SraucncyBD9QbX0IdD5
	i+F0PGxfDqr+HTEFDWV8igUIb/jzfTQUW1rBTF+bQ7F38bBkBL0+Rwkybh3NP9OykanuqxSNoUr
	+ouNojhlP9DDUO3Do0T8O1JbdDVHRZs5Vkm+GwcOouvKmlZSNplGpjl9tytfFYmJTMGbMvHkeXT
	5joVHq5rknOqvWhxpdcN4IiKl8FOw+rCtReIyyicM41q6OMMvE8dIulL4gtvivNaDgOstfsRUsZ
	n84Xm1Dc/I/xBvJ/ogj49jbh6B5D9HDWGjcXH1ODLWvRzxh3NNAIDnn38flSweLca4bYD6JX90B
	yhjY4EMHEl7BcGP/P3In0gPa6f3nNiluVwtbhKRc=
X-Google-Smtp-Source: AGHT+IEQgccSv5KrYCLIeOkBb6hapQoRMYw3UOEbhpsi+8eTQdTpyiaSKOTPM0LAX5hq1LPrjnY5Fw==
X-Received: by 2002:ac8:7d4d:0:b0:477:6f28:8c16 with SMTP id d75a77b69052e-47fb96e6a40mr17377611cf.6.1745526489664;
        Thu, 24 Apr 2025 13:28:09 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47e9ebeb870sm16091691cf.5.2025.04.24.13.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:28:09 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	longman@redhat.com,
	hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	akpm@linux-foundation.org
Subject: [PATCH v5 0/2] vmscan: enforce mems_effective during demotion
Date: Thu, 24 Apr 2025 16:28:04 -0400
Message-ID: <20250424202806.52632-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change reclaim to respect cpuset.mems_effective during demotion when
possible. Presently, reclaim explicitly ignores cpuset.mems_effective
when demoting, which may cause the cpuset settings to violated.

Implement cpuset_node_allowed() to check the cpuset.mems_effective
associated wih the mem_cgroup of the lruvec being scanned. This only
applies to cgroup/cpuset v2, as cpuset exists in a different hierarchy
than mem_cgroup in v1.

This requires renaming the existing cpuset_node_allowed() to be
cpuset_current_now_allowed() - which is more descriptive anyway - to
implement the new cpuset_node_allowed() which takes a target cgroup.

v5:
- squash drop rcu_read_lock fixlet into second patch,
- changelog fixups

---
(apologies for the spam, did not drop a reply-to)

Gregory Price (2):
  cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
  vmscan,cgroup: apply mems_effective to reclaim

 .../ABI/testing/sysfs-kernel-mm-numa          | 16 +++++---
 include/linux/cpuset.h                        |  9 +++-
 include/linux/memcontrol.h                    |  6 +++
 kernel/cgroup/cpuset.c                        | 40 +++++++++++++++++-
 mm/memcontrol.c                               |  6 +++
 mm/page_alloc.c                               |  4 +-
 mm/vmscan.c                                   | 41 +++++++++++--------
 7 files changed, 94 insertions(+), 28 deletions(-)

-- 
2.49.0
