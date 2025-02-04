Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E192163AA;
	Tue,  4 Feb 2025 17:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690627; cv=none; b=suFrfrutL4nderrj8Jsb9vLA8qhUQqFj6gqeuh9FjYps6QhsAvfKLSpzt6Dt2DCqG5AvdwZcq1upS8akU1v2K4MwMLR2yO5Uy1TC/9iWxU7vJxi4rptqU53nbaBuPRDzP/748xDgYtNNXau97AnIi5lxYttF3sMcuLLp3rDJVwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690627; c=relaxed/simple;
	bh=r2iiDiPZOS4/QANoocz7hbq1LBuYUYYysQaiQVX4JUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOrfn2Jm7lz9UDUADxwD2UmINo9nSVeM7X2MKF/n0NT/ngwq6Ibb5w3qPCHtCcQBW4FvbvjkzzTD2lF7eaIYieJSsO8M+t8LV+YHcXPihlPKCX5X+w9XHKgpmxGgJbZRb/bqgQz0e2Ym3Fo4hz35dKaCKJhiT4WwOe72YCbYqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9DnbX4Z; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9DnbX4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690626; x=1770226626;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r2iiDiPZOS4/QANoocz7hbq1LBuYUYYysQaiQVX4JUg=;
  b=A9DnbX4Z9IwBYz3VpbeJxIgfP3l52T38fvZC/JCnHlJRKN4J+P47wTOG
   nWu9Pqab15e01pHqHX/3KmwEr8/EL2suF4dYHr3ixz0lwEDlKIjqp/dMw
   CbltiCEzVwKYJBZ6zIJ17R1KyuOr8hqVbHtmwasZ39cn4Td5J1COGQNJz
   i7ejcJOxS+W2mK/nUh8UfWloYT1jPRr8Uzwv2A591dzilinxCy5sRU229
   KJMEmWTTjR5RwrkKbxuFBXBWMR2WzcOWUzA4EvtMHQfDbSz+gsdPP/Xmz
   QaDvMHhwyMGyerdQHPZp3EYAdkfG1uMweLAumqZYKKQ79/F1kElLn+Qz6
   A==;
X-CSE-ConnectionGUID: Jlv3wYWESBmqrrSs8UzHKw==
X-CSE-MsgGUID: gq2SdZbzRdu//H0avhk1Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38931048"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38931048"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:37:04 -0800
X-CSE-ConnectionGUID: F7WrZE34TJC30qp8xAUvrQ==
X-CSE-MsgGUID: 1Ko21FfoQgSOsBU65eanYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866985"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:51 -0800
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: luto@kernel.org,
	xin@zytor.com,
	kirill.shutemov@linux.intel.com,
	palmer@dabbelt.com,
	tj@kernel.org,
	andreyknvl@gmail.com,
	brgerst@gmail.com,
	ardb@kernel.org,
	dave.hansen@linux.intel.com,
	jgross@suse.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	corbet@lwn.net,
	maciej.wieczor-retman@intel.com,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	ytcoode@gmail.com,
	tglx@linutronix.de,
	hpa@zytor.com,
	seanjc@google.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	justinstitt@google.com,
	jason.andryuk@amd.com,
	glider@google.com,
	ubizjak@gmail.com,
	jannh@google.com,
	bhe@redhat.com,
	vincenzo.frascino@arm.com,
	rafael.j.wysocki@intel.com,
	ndesaulniers@google.com,
	mingo@redhat.com,
	catalin.marinas@arm.com,
	junichi.nomura@nec.com,
	nathan@kernel.org,
	ryabinin.a.a@gmail.com,
	dennis@kernel.org,
	bp@alien8.de,
	kevinloughlin@google.com,
	morbo@google.com,
	dan.j.williams@intel.com,
	julian.stecklina@cyberus-technology.de,
	peterz@infradead.org,
	cl@linux.com,
	kees@kernel.org
Cc: kasan-dev@googlegroups.com,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org
Subject: [PATCH 12/15] x86: Minimal SLAB alignment
Date: Tue,  4 Feb 2025 18:33:53 +0100
Message-ID: <162610a0af3e04e2f42872401461b1d62ec78fbd.1738686764.git.maciej.wieczor-retman@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adjust x86 minimal SLAB alignment to match KASAN granularity size. In
tag-based mode the size changes to 16 bytes so the value needs to be 4.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 arch/x86/include/asm/kasan.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
index 8829337a75fa..f7a8d3763615 100644
--- a/arch/x86/include/asm/kasan.h
+++ b/arch/x86/include/asm/kasan.h
@@ -36,6 +36,8 @@
 
 #ifdef CONFIG_KASAN_SW_TAGS
 
+#define ARCH_SLAB_MINALIGN (1ULL << KASAN_GRANULE_SHIFT)
+
 #define __tag_shifted(tag)		FIELD_PREP(GENMASK_ULL(60, 57), tag)
 #define __tag_reset(addr)		(sign_extend64((u64)(addr), 56))
 #define __tag_get(addr)			((u8)FIELD_GET(GENMASK_ULL(60, 57), (u64)addr))
-- 
2.47.1

