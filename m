Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE6A1DDA2F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921480; cv=none; b=XpK4sTo/AHeJHgSJICfdhiE6TyYEckMn+sml5xL3i7kyIFU0XjgGXpVFmEzHgeym9Ao54FMG3oKQXnYQX5BJbhm9tdGV750hkM60lq/UqMTlBsUY9RNhYB/f/ecOSvJcEUd7GJJbFXbzHj/H0UbOUI77sYAcLpx5gHIWC2h+HX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921480; c=relaxed/simple;
	bh=VPHZvFiFxroYMoSLt8kCqS1ipMnQzJ3S120vyCAnZFY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nFedEigmsk9LvOvR/ISncxrnTuEjc3KA0cmV/f3dKCv7VO1hh2BlMrZ8HYKJbCz0qywkq7MCpqV545q7n1S79Rcszue/wVeCe6cTjBaI2niFTkYoddiDzBMuUUuOkoYQR06qozI01p8qq/x+v4YusN9sXKw3HAM0pAKvdwBqPvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=OVfybnni; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="OVfybnni"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1738921469; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=HpF9o40N1EUwBnxQ8TQDhm2ad3ohExl5niPw381m7v0=;
	b=OVfybnniRDKTbGgjnS8V2IKjOEXs3xYylrf4ZbXGzWw9RDRy6g1M+Io/TARvsmr/7+TuSEnj8FE7fOqRfIK9YZ78eJ2d+XroXOK5Z5jR2knrSMKiY9RW2l2vlCe+zEojZKh13iYQbDN5ofKo2Ji5IY1OoWi3fyRHcTrRaSZQNLs=
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WOz9Evq_1738921468 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Feb 2025 17:44:28 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: akpm@linux-foundation.org,
	hughd@google.com
Cc: david@redhat.com,
	baolin.wang@linux.alibaba.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] Some trivial cleanups for shmem
Date: Fri,  7 Feb 2025 17:44:16 +0800
Message-Id: <cover.1738918357.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Patch 1 - Patch 5 do some trivial cleanups and refactoring for shmem.
Patch 6 adds myself as shmem reviewer.

Baolin Wang (6):
  mm: shmem: drop the unused macro
  mm: shmem: remove 'fadvise()' comments
  mm: shmem: remove duplicate error validation
  mm: shmem: change the return value of shmem_find_swap_entries()
  mm: shmem: factor out the within_size logic into a new helper
  MAINTAINERS: add myself as shmem reviewer

 MAINTAINERS |  1 +
 mm/shmem.c  | 76 ++++++++++++++++++++++++++---------------------------
 2 files changed, 39 insertions(+), 38 deletions(-)

-- 
2.39.3

