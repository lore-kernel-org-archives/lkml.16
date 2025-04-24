Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC5A1F2BA4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 20:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745526134; cv=none; b=Lqohd15JJPdSk7XP5VGY2B0PZ7w6w5zpsctG96nFjzRSUI6V4747bB/rL4vm6JNVQSoUKT8rPgYrp2A8w3m/Zy3erO57k/Gw1rvAdomcfpec5K0NT8mqq/I1bhgi3kGUxf6J9+dRmdc3wvhCgRau0mp29ZLxEUFuxGouNcg9zzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745526134; c=relaxed/simple;
	bh=JVRxd1bxv/rdSKNVHJhscYrIL7rIp+ssi2F0tDL80/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tO+m2fURrMuKSbMz7dqzauutOyWhWcevenpmlLTf9+DAn9AQjfmxqROXyr/linpa2MbnhL+ovrlOWJippZnP0imiwLFC3qWOGXoT1swwU3LlZj8+3aT1ITfBiUeGrt2NPIfwYf5nQF6pBtsbdJJVt56a5eE7uiOT12Lj9yUnZLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IUkdzdvD; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IUkdzdvD"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6ecf99dd567so20676776d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745526131; x=1746130931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MqqLjEz3abz2XbBlgSzVqyzhHUlBkBot7mBAspwG3c=;
        b=IUkdzdvDfJq8isfvP6W+sMrXNYQEqmtXobzwuI9CFl5JxYvrPfldR+FnZCXqdgSiog
         1M90krYDirC4o0oQUWb7rHY4hREtHb3/VznAZoyYk0kJJbeXJOjg0m0B1ISTx3z++a49
         pupeJjvjwosW2liWJNqVbAkpMC8EAjqWyLQodNbXdSzrKGe8eFQmjpaIQz8zswt5YCJE
         SzZBoEyhHLlS0HUPTs9IfAwsTnM7N0lcghdLMWkOIWkcYcLdjiilgWfKNOJbg0RtVKh5
         4qnxMzgBPdzoBGApdC4C6BcXJQhWT1DsiLADlM1h1p5oMvomG2S933rvrHJv0jT3VCkZ
         +K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745526131; x=1746130931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7MqqLjEz3abz2XbBlgSzVqyzhHUlBkBot7mBAspwG3c=;
        b=jfBdluAgdMq2+oF++gMveyhnCtjFvzSxwqQtfMC3fofz7qMcM1ZcnJzpfXjxqNNvwG
         IwBsgTTFnmaaNsAUev2CMDukZVpwnl779H9cdAnxwxjBaCyR88K2rVx587U74cN4W+wp
         Hfu5C57++0im0hWlZcGCFZlwAnmMu9hefJQnBOLdNGwjqvbtY0lApIu6Jo2g1g9f3t32
         vV/uSF/uzwZpqZY39REt1jxSSaz7qEffVc97evJZ+HV5sk9d5Cz6N6Gls2Xa+BZjM6e6
         cUvPKpX6Ak/RIM8lHVnM70UnVbyWIvH9DngKzARyuvyCFKvi9L6j4A/nlqH99VA9vmc5
         vDew==
X-Forwarded-Encrypted: i=1; AJvYcCWK3YCUHv/59ouyVYmOq/cdKYSTWL+QhvcWlJIdhXgZgrffC1LM1gijpb+vZ8JM2UTPJctkRxpFwxUMnvk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFUbsVFleAcnllMqRtl2mtWrVQthDP2HNmfROp30iE5OczUinw
	9A9r0tmcR6bKVPEvLaZt8c2WHsstCUGr5f8y04n9fLrtOMlE0cq9S3XEgUbVVbk=
X-Gm-Gg: ASbGncsGls20TQoShhZ9vHtf+NqQTKxqdvpuSJxeW2GEm7Il9dY5YE1NEU7hLOKPqpa
	gTNdKm+Bp8ea/xhp20ToWVcSoFRi2Vvy+KYzBP0K8FsMz3g9aKnzRpZ84qtF0v6Kv+0mR+V5BpV
	zQq2YTUH17ZBpNgjNirJvxfGfelvIfgNHue9YoPTqnV3zfPyzViQP7hnEU01+yaQfmANG1mc1IR
	sQN9qvP6RdvRq8Yxi/SG4tRE5SzYQ/vZy+SEI4+SxEMpEf9p2wFGFDwWdmVUTHMNRKgOCQmRNu1
	PJPQvR2f7dE3f4SiGOht3tfWHVEg8iCRmYFQ9sHRP9yaC1bbe0ECfn3F+8/WrJ/qlN23zKvJaMU
	qoV7A1NKkbsnvEsSR1CcEe3epcP9T
X-Google-Smtp-Source: AGHT+IHzJydVHqLkJW/S73lsyHzdB/5PBag7H57VQIk8FgTn0eiWJ6yg6tmqovHihAgl2dwEGADSww==
X-Received: by 2002:a05:6214:500e:b0:6e6:6b99:cd1e with SMTP id 6a1803df08f44-6f4c9530770mr13650426d6.26.1745526131437;
        Thu, 24 Apr 2025 13:22:11 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958cbfb1bsm129618385a.44.2025.04.24.13.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 13:22:11 -0700 (PDT)
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
Date: Thu, 24 Apr 2025 16:22:05 -0400
Message-ID: <20250424202207.50028-1-gourry@gourry.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422012616.1883287-3-gourry@gourry.net>
References: <20250422012616.1883287-3-gourry@gourry.net>
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
