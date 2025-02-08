Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0FF1547C9
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989832; cv=none; b=PCEN4TWUXwHLuSvZkkMI/hutio4KHxDNpz1wZajAF0D+xZD9KEf+MjYVFCHtx9h7UOr57szWxb1qaWdiqyh70QquwTsWz+XP4bnS/TWESWjktSG0CVnAPKx41AEHZg6joI+b5C4hgpM0gQjeqxq+N34kGE6in9uc5UIeKHM6ijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989832; c=relaxed/simple;
	bh=qcMwPSlcrQWk2aW8kVm1zrIlSYlrrEI1b5xh/iLqLBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Be1xkkC0zkh8ffF+hPooKfjrKezCvc25Wt7dZMBYRe+/1ERgy5NKtRkFTGYtYOKvcNCADOxAQoMB1EJdg+ae6Q5CxW0jmvEnTZDwW9Q1o+Hmm8oQasDkb6IHLuESRX4kr1PoySJz87iMcMeWRLVnasTyuOdAsWZIiek3zZU4ovg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=kxX0KEpU; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="kxX0KEpU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5JRcweAhieKCUMNOWzbc7SsZ8ZDShwCIKltoJTKhHqc=; b=kxX0KEpU1AqsO3bmqeYzzrrnr5
	Zx6WcYcochulDkl70DNv4MtWH4RJLm+k/vUPD7QpHpjsHoFF0zm1lcSz4Hwh4UghaP7s5vreERwrw
	vGAeMCWlLMPXs1TgWHSfVilVIKB9dyDVaz6clHk+ifMtY2IX+rzpEaLLp5lor+ggz9sjBV4O/pyPQ
	pqbU4FRZclN9QfvDpDE30hZ4iPJMV0Nxc/4zDnSs6OdJ9b8tfh4Q0TS6WKx3CxQX2vpj3rXBH/+wK
	CigYv2VoBGfonuCBiB9ySGsHEld3utt9oH5M8oW/nVIwduUQZ/LzTgi6U9+2msKro+r0kju6QzXGB
	XhN651Og==;
Received: from [106.101.136.205] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgcgn-006G9t-RU; Sat, 08 Feb 2025 05:43:40 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 0/4] sched_ext: Compatible testing of SCX_ENQ_CPU_SELECTED
Date: Sat,  8 Feb 2025 13:43:28 +0900
Message-ID: <20250208044332.492494-1-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is for testing `SCX_ENQ_CPU_SELECTED` in a compatible way.
More specifically, it handles two cases:
  1. a BPF scheduler is compiled against vmlinux.h where
  SCX_ENQ_CPU_SELECTED is defined, but it runs on a kernel that does not
  have SCX_ENQ_CPU_SELECTED.
  2. a BPF scheduler is compiling against vmlinux.h where
  SCX_ENQ_CPU_SELECTED is not defined.

The patch consists of three parts:
  1. Add enum_defs.autogen.h, which has macros denoting whether SCX
  enums are defined in the vmlinux.h or not.
  2. Implement __COMPAT_is_enq_cpu_selected(), which provide the test of
  SCX_ENQ_CPU_SELECTED in a compatible way.
  3. Use  __COMPAT_is_enq_cpu_selected() in scx_qmap.

Also, this patchset is a sync of the relevant PR [1] in the scx repo.

[1] https://github.com/sched-ext/scx/pull/1314

Changwoo Min (4):
  sched_ext: Add enum_defs.autogen.h
  sched_ext: Include enum_defs.autogen.h from common/common.bpf.h
  sched_ext: Add __COMPAT_is_enq_cpu_selected() for BPF compatability
  sched_ext: Use __COMPAT_is_enq_cpu_selected() in scx_qmap

 tools/sched_ext/include/scx/common.bpf.h      |   1 +
 tools/sched_ext/include/scx/common.h          |   1 +
 tools/sched_ext/include/scx/compat.bpf.h      |  52 ++++++++
 .../sched_ext/include/scx/enum_defs.autogen.h | 120 ++++++++++++++++++
 tools/sched_ext/scx_qmap.bpf.c                |   2 +-
 5 files changed, 175 insertions(+), 1 deletion(-)
 create mode 100644 tools/sched_ext/include/scx/enum_defs.autogen.h

-- 
2.48.1

