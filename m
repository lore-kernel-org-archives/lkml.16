Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5FC21C165
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744241244; cv=none; b=iE1u44aPMsR4Udp+EPI00Z50VcxoRPVlAhQlz6ijGzYxCZFK/4Q5f5/TK/Os6WLi2B5JJ2qLPnnTM4tJei0ZRxrBdKbc3CPRgY+ZDqkVn0Q3b5P64VuRp6bATDw5E7ZHi2nOyUyk1fOrdvM7Fgj/+hlOD2c0oIoZPU8pefjc1+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744241244; c=relaxed/simple;
	bh=vVIfxMtnrd75777wtYCPS5YQeb3N5rj7yPY08/GkU6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OADiTgq1FC16nGTmubNs6UjjbcT7hXzv9MFi2HfF3B4kgrnDPTyoIk7JGSh0qhqquvOVqj5aswIC7FBWd6ZV0VHdduhJEWfaWI7dBCR9YyU2ockIKbCpmZNpf5DL44tNJyiKE5op7d/Lgy62PQGLZHv6pMQAORmIleNexGKzg7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHBPQy3l; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHBPQy3l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744241242; x=1775777242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vVIfxMtnrd75777wtYCPS5YQeb3N5rj7yPY08/GkU6c=;
  b=OHBPQy3lsY6e+mdL0vsjroCQQt8fAJuBn9Q/aTa4W0B+2e9e+0lqhLq2
   cWsYn+D1alXShdb/pUFCMybx9RVu8c2INP9HkmRJjpC/pOcYsKIcsHrtz
   uYtG8A7PpMKL2WbenHKt7jws6KomKGLwkzz0icn00scL46i/2k179cOiO
   lFwsAfL0zLNwfv4AzFpzzZJ/G2mJjCd8viIHuoFJNylJ7UUJfIy3KuFoS
   gC/AJoVt8wDnpgzNo/zFZIsJiY/XDSoOKdN2pxiI8yklOk6JnhuRYETvu
   nfx407ji7gwiH5JrI8myykUGw/0rEb+FVvA0yWXO+ACJM43j3umf9mRtx
   Q==;
X-CSE-ConnectionGUID: y7MiPMfiRQK7RIqGfD6Yvg==
X-CSE-MsgGUID: fs62TJbXTXqGNY0Zt2yCQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="68224055"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="68224055"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 16:27:21 -0700
X-CSE-ConnectionGUID: f+9ojllqSGWgiHq/vUkKyg==
X-CSE-MsgGUID: xlPLq+ALQfS5OBCcsPonEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; 
   d="scan'208";a="133593083"
Received: from cbae1-mobl.amr.corp.intel.com (HELO cbae1-mobl.intel.com) ([10.124.161.191])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 16:27:21 -0700
From: "Chang S. Bae" <chang.seok.bae@intel.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	colinmitchell@google.com,
	chao.gao@intel.com,
	chang.seok.bae@intel.com
Subject: [PATCH v3 3/6] x86/microcode/intel: Define staging state struct
Date: Wed,  9 Apr 2025 16:27:10 -0700
Message-ID: <20250409232713.4536-4-chang.seok.bae@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409232713.4536-1-chang.seok.bae@intel.com>
References: <20250320234104.8288-1-chang.seok.bae@intel.com>
 <20250409232713.4536-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To facilitate a structured staging handler, a set of functions will be
introduced. Define staging_state struct to simplify function prototypes
by consolidating relevant data, instead of passing multiple local
variables.

Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
---
V2 -> V3: No change
V1 -> V2: New patch

Prior to V2, local variables were used to track state values, with the
intention of improving readability by explicitly passing them between
functions. However, given feedbacks, introducing a dedicated data
structure looks to provide a benefit by simplifying the main loop.
---
 arch/x86/kernel/cpu/microcode/intel.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/intel.c b/arch/x86/kernel/cpu/microcode/intel.c
index a791d5dc2cef..d8ea172d90e2 100644
--- a/arch/x86/kernel/cpu/microcode/intel.c
+++ b/arch/x86/kernel/cpu/microcode/intel.c
@@ -54,6 +54,27 @@ struct extended_sigtable {
 	struct extended_signature	sigs[];
 };
 
+/**
+ * struct staging_state - Tracks the current staging process state
+ *
+ * @mmio_base:		MMIO base address for staging
+ * @ucode_ptr:		Pointer to the microcode image
+ * @ucode_len:		Total size of the microcode image
+ * @chunk_size:		Size of each data piece
+ * @bytes_sent:		Total bytes transmitted so far
+ * @offset:		Current offset in the microcode image
+ * @state:		Current state of the staging process
+ */
+struct staging_state {
+	void __iomem		*mmio_base;
+	void			*ucode_ptr;
+	unsigned int		ucode_len;
+	unsigned int		chunk_size;
+	unsigned int		bytes_sent;
+	unsigned int		offset;
+	enum ucode_state	state;
+};
+
 #define DEFAULT_UCODE_TOTALSIZE (DEFAULT_UCODE_DATASIZE + MC_HEADER_SIZE)
 #define EXT_HEADER_SIZE		(sizeof(struct extended_sigtable))
 #define EXT_SIGNATURE_SIZE	(sizeof(struct extended_signature))
-- 
2.45.2

