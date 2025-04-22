Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7342AB4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745285184; cv=none; b=OQi4mlDv9spJKYuLzcKNsfreM/WoVXfWimwIK0kHEYBjpueTyEkVqJmcxQRjbgWiNdospbJfAl9iBhofeFhBUtHV66G9hONrjsuFRhaPJzITcP95Va71Z9jobTSwHOWQqoGRrGQBciIAAddRXjcBvdZK2Lw8TY3bAXBkM/sam2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745285184; c=relaxed/simple;
	bh=5B16rGU+2k+wStQl5NGI8RjKMaLbRadkXKi9vkJ/oho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LHoS0SssIJ41lPhyQo6QPSsHIsiAsKxfU73KKA8tVzeWxFLa22jt0L1ZMxGpgVk7qgMP9FPcpFrqw0/C/o9srGu8iYBMBxaHlI/pFz6dsU+ZmDAT/u9FiqI0Mcw6UCUIqrZF+VfXD0KkcJDerZxvOwTd/gCZFyKDLQ9iICBFL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uz26Yi3V; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uz26Yi3V"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6f2b04a6169so49546066d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 18:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745285178; x=1745889978; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShM+OPRo4tkARwcyIJhuiyqycqSNpimqPcyhrf6R0T8=;
        b=uz26Yi3V8UGsVpLfIRcKlQeM62t2W/URAKwJzgrGIBm/jGqkwOaJBdFBmafqZjrx30
         B3mpsmFF0rZnwW3/QhAkfUQG8QWGbz0n5TClwXfbq+IUbgnPMTldRUDCsrxw/HswJboi
         xJECqFft7B5zsyTm6Uic1RCkKfc+R6TX1bcekr37mzAzO1HnrahEED+JBNrM9l/afqUf
         gzfZ5ksYOherYK4d9OD0HiB2Sarf7teCwi+5pCP3ETkyC92trAAWByN02TH5l1oyusbz
         LR5FlWZOuOElRRuEq5CWGa8aKGvZ/qbQnoRD2/m+nDvIDcRjIbMVVTV25lIJesBPMtm/
         IhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745285178; x=1745889978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ShM+OPRo4tkARwcyIJhuiyqycqSNpimqPcyhrf6R0T8=;
        b=Ar+QLlJbibQlvhaGwGLyZEA0sC6htYdrImp+45NHhg1uy4sFZxnNjxfkpN1fmP8/Fb
         jpV1reBCOeBoUna+PRKfo5IJWXNME3WtYx8mseTninJipku/Q2Cg28i/azohaC2gqVWJ
         HDeb5eGk8x+DCVXDgEId4HjpFy7JBDesFkFTfQ/ENFvgrlJzwP55/GH/Dfj+Z5G4UOtN
         k32mvDUZILXJbkcRp/Ne6kwQs6LBpjpS5L3Ndq+TD26T47U2XQtkFxoXSzeNEnbCbSUl
         GRi1LtfFCt62J8q8Qvi8+bHflMH1Xx+k1RmLTBiGEGBsVR5hK2pEdCeoMP690vg22DNx
         rBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoWt7aKRFY6nbjJ7dxT8ohCvW2JkytQBT3hX6+UcuG0dQB/11KFK2mq3YGCRvbSmXSyr4xuJyaNJ8WQLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1lFa3jnWRz1XNWR4gabLeqSJUIf4F6uS8DpBBB0/QbcGE3uN5
	U3d1/bLoz9JVn/fSYqM8b0DZ6MVyhSaOZsSTnGGTYp7T/23liT5m+INBwoodh78=
X-Gm-Gg: ASbGncugU3aW4+gs3vGjiRTKfzsmh+EWYc1du8Z1wKWnvvKVcb3pRffeKCJARfIFo9j
	eSkklWlF6EL+B98X/jCNujr7mFTGI2Q805qDb26YvtSWXVvga2jwE2OqUva3w/1cx8AIL/13I6+
	0XfHz37vwaxMAvPEAX4d9sqMfL6OT91CQxHVmCPIw8dsj3CFxdkLp0Ct5CEkU/TvgOnU2kr3t71
	iZDI/44oU1RXbE5QKn+o/JuKp7sg38dP6My3I1T23E+A7N6iNuzl4xdedrbO1ugobRnum9o8qRu
	/8DovsrIr2wQv6k+DcdqzOOU668jkqMa98HstxO8oWY5a9dLmIDTCG5S5ytlQOazkZKy356jbag
	K1SJVgIq8rGd0UOeNPfJEdPQoh1V3
X-Google-Smtp-Source: AGHT+IHA09oLgmb2N1FkvGXbNK6Ei2QvTetwNGSUKWYaIIAktisNIJsenYqDkUExZvqsSRrL/Qzp4w==
X-Received: by 2002:a05:6214:248a:b0:6d1:7433:3670 with SMTP id 6a1803df08f44-6f2c44e963cmr251526376d6.4.1745285178136;
        Mon, 21 Apr 2025 18:26:18 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c00d78sm50985746d6.79.2025.04.21.18.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 18:26:17 -0700 (PDT)
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
Subject: [PATCH v4 0/2] vmscan: enforce mems_effective during demotion
Date: Mon, 21 Apr 2025 21:26:13 -0400
Message-ID: <20250422012616.1883287-1-gourry@gourry.net>
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

v4:
- explicitly expect v1 instead of checking for empty effective_mems.
  this was the case anyway since cpuset and mem_cgroup are in different
  heirarchy in v1.
- update docs to reflect this
- rcu_read_lock instead of taking a global lock.
- cpuset header fixup when compiled out.

Gregory Price (2):
  cpuset: rename cpuset_node_allowed to cpuset_current_node_allowed
  vmscan,cgroup: apply mems_effective to reclaim

 .../ABI/testing/sysfs-kernel-mm-numa          | 16 +++++---
 include/linux/cpuset.h                        |  9 +++-
 include/linux/memcontrol.h                    |  6 +++
 kernel/cgroup/cpuset.c                        | 30 +++++++++++++-
 mm/memcontrol.c                               |  6 +++
 mm/page_alloc.c                               |  4 +-
 mm/vmscan.c                                   | 41 +++++++++++--------
 7 files changed, 84 insertions(+), 28 deletions(-)

-- 
2.49.0
