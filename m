Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5734D11CA9
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 05:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745041110; cv=none; b=YaZFbdVYwACNRaatQ9JOxgTgX5pC0EooQzK4IDLPce8uknIX8aN0VJ3GFDpzNWKWyVb1IUu19nWcJlzjcxlXIHNVIzozTtbZJJaUsQc2RXirWXvE1rByDgFAv4T7W/46ZnefnhaW1bdqKzQQ/iXcNUUWwF6SGh3+KNRuJ7o83DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745041110; c=relaxed/simple;
	bh=uL1WQ8LK/h/Zb0dv5e4SK8N1OJRo5H6PcHtr36ik/kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tY2fX/c1tRe+9AdGSe9edRVUWfdcF0SuidtX4LCg5NIJZsRHRdvOEKD8SLRAxH+RI6dhBDEna/xkE7AgoqEhJC8Ch1QNrOJ8eqNyCRKvsoKsQ2Fapp9pIxMI1Qy+znVfu+NiJGvUaYW09rHjB9oTuTvDL6bc+h2Z/FHwyuowXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=oPx+/ssZ; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="oPx+/ssZ"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7be49f6b331so254637785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745041108; x=1745645908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MkF0JOp4lFK4CnPP02hYvjuEDN2qDsBOK7lNPu8eYOE=;
        b=oPx+/ssZl8TTDo9a1Vq/Psr++/IDJCmRbs/7nr+1BWu70a8HmpHJBW8gsAO6m9lepS
         reQrLfrq53zkcHKgqEoh50gh5wziEn+LnLqGDGLBZSIl/3y6XsN49a4odCjuPAmsNF+U
         ooIp2E5i/lowxXLgDsufX0smLf1XVmNf80qWLiRjrERFcg8Kx8OntPeb3Y13cDL6AcQQ
         E9u9Sfnhm77O6K3PKGkTbpD51xF8UIt4X9IIzQlozbcAD9uBl4i4vU+yLcCJq683+moN
         jUoXVV5OFTnc23JkHKMI87AEe4oDUx6tk0QTF1ZAOZADU+5kv0ClbJF3dq1goZFNDYRm
         lWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745041108; x=1745645908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkF0JOp4lFK4CnPP02hYvjuEDN2qDsBOK7lNPu8eYOE=;
        b=tKRgpVGwu2aoJyek8jkeBzIBJGsnd4tNwUgndWtw7FzrZQmz0iRLm+wuWzqMhYXv8I
         ewfQpv80c1kOPtTyjy67Jgc/i5FAWm4LEXxeCMbMrHvp2AS8twO26llOh3ngHpgBdbbd
         FErpSZxZz8puaDxoqikjpw2OuY5pPmhMhGSwPHSofela0dxx+riMs2lrYM6I8GUZXFd9
         bZEYIjoG3hW+ru6bfBZLfvT9v6GGg0Az4v9AvCijNQCPuLhvHfvx2BMSWtUdmULUeZ6h
         H+DE5E9JbBnrOfFuft8oABeWy3UOf+G7lo5xdSBQFs2v5k1RPHWe/3JwxcR+SKBaCBRo
         VThA==
X-Forwarded-Encrypted: i=1; AJvYcCUsvyMsYN9SPtgZP3YbfYFJOJ3bGJod/CupKv6M8RGlre6u9V+iizFLScrfR4+WDoMYg0jQSwGLpk1WjtI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xDKBxz8h0hd/pDqTM2n2VZtUEM711Z2D33SeubeIsxpQciSC
	JcVcne72QuRmsm4xLGhU4vgEhDr9ocbtDXS6Z0E0Nxq+8dseUpb96SNOHIqOuMY=
X-Gm-Gg: ASbGnctCGvX9c38QRUrZkLCY43YamseZ/Ur4FI3kqZQARawBk08bK63PshVXm82KX+u
	Ffpg2NWT+bUgkatb51CeFuYbQEco5UFCUMFPSnIHNqMTjrbwb5V1kdqWoEzuhi4h7YCZ7Qjxkd5
	glpyv8UiG9YSsnakBDl2eCfasMGQhNBl0aKrr4BuVqOMlRjU6e2RaggQKFuVSUTKdhh73dNLwG1
	yMSrONqrhNLYM/o4ZmZhka0Km7G0nmVj2qOHkN9dx8iRiuhgzgO/G5ZMdL6ghu/YlTcTlzkOnOI
	KX5oUkcp4vn1KrPP3SDOo/2yAY5zjSIiUM7hLE8cL0B0z7GWPhCIY4tKm+Zm5vjoZNXz/SFzglc
	3p3HKwNQ2pPxTNB8Jzr+7H9GUUkfy
X-Google-Smtp-Source: AGHT+IFM1C8EHqGpWDsCzXLvWukyQ89UOjGIyccxMnRe93dLXZg+F0y81hHRlPy4r6OD3LG/0BMeZA==
X-Received: by 2002:a0c:e5ce:0:b0:6f2:d4ed:c549 with SMTP id 6a1803df08f44-6f2d4edc58dmr1306516d6.20.1745041108076;
        Fri, 18 Apr 2025 22:38:28 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b30c65sm18341956d6.51.2025.04.18.22.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 22:38:27 -0700 (PDT)
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
Subject: [PATCH v3 0/2] vmscan: enforce mems_effective during demotion
Date: Sat, 19 Apr 2025 01:38:22 -0400
Message-ID: <20250419053824.1601470-1-gourry@gourry.net>
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
associated wih the mem_cgroup of the lruvec being scanned.

This requires renaming the existing cpuset_node_allowed() to be
cpuset_current_now_allowed() - which is more descriptive anyway - to
implement the new cpuset_node_allowed() which takes a target cgroup.

v3:
- remove cgroup indirection, call cpuset directly from memcontrol
- put mem_cgroup_node_allowed in memcontrol.c to reduce cpuset.h
  include scope
- return true if mems_effective is empty, and don't walk the parents
  as recommended by Waiman Long.

Gregory Price (2):
  cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
  vmscan,cgroup: apply mems_effective to reclaim

 .../ABI/testing/sysfs-kernel-mm-numa          | 14 ++++---
 include/linux/cpuset.h                        |  9 +++-
 include/linux/memcontrol.h                    |  6 +++
 kernel/cgroup/cpuset.c                        | 25 ++++++++++-
 mm/memcontrol.c                               |  6 +++
 mm/page_alloc.c                               |  4 +-
 mm/vmscan.c                                   | 41 +++++++++++--------
 7 files changed, 78 insertions(+), 27 deletions(-)

-- 
2.49.0

