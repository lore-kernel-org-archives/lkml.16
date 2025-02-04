Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8F216383;
	Tue,  4 Feb 2025 17:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690564; cv=none; b=T1xBSkZuW3GDYY6bHly2wGeIT69LHgICrJ4Zl6/Uo3S4vEcT7HrgruKuMtcEGEOroGoQMmSf592Odior9coUYA5YQ4nAbplSt2YKRP/Dh+uz7zs1HusMOHiyGSfneubH9orcwW9qGgnPtGE8pLDj4WudRjJqsz/CPgt16csYtCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690564; c=relaxed/simple;
	bh=PewXt3mq2ZzovNzL7I8Fp3xpOP5/pryHgDbcA5gr/7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQ2NtiQTHbDK32UbAV9LGkWgYhnBu+Y8txmqCsMtx0/dniYLHBpTIYe7htmZFv5mj7G/63dxa26TLMFJHQIggilcRqUpA0TaiKsidD58WngZvZAneYsTgYkRDk4WqHQxHxwJ8BcV9dSPoFXq/uVl9928q8J9824lAPhZpnmkwvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWwCojzY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWwCojzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738690562; x=1770226562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PewXt3mq2ZzovNzL7I8Fp3xpOP5/pryHgDbcA5gr/7A=;
  b=jWwCojzYdr/+UtD3oziggohUdthZQHHTjWF/Sxw8vrndR08tKcZrrlB/
   eHDvmqTsx80M5qj3DNc2uNiflBoQ/b4eXEPT9u/Sndd47JJTf5fYxmeVR
   ovT65YY5xMer9vS3bP9sqGJeEhHa4TIh2LrSGfGLtxw7wOnpomrowCuUD
   9w21fw44JakFSn37Es9KzlN8rYanpfPL9vaFTVioCFyYazKZGTzW55zBR
   F5O4Q6Pm1ppGsRnC+6UnfwTcKeIaE4ZAcG/1GGrK/6NC4c6lG2sJcGrEG
   HH6p20dMuuSGaq/tiSOYzLz4Q1IaZTsItmVZBrr96mzA9WyoKKBjRzt+p
   w==;
X-CSE-ConnectionGUID: fW3P6L61TpGZ0fae9ArqHg==
X-CSE-MsgGUID: 4vtfLn6TRzSQAGKjC9Icww==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38930679"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="38930679"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:36:02 -0800
X-CSE-ConnectionGUID: PpX6VWM3RaGBO1JoNfSfGA==
X-CSE-MsgGUID: vYDFTil1TqeMDIrSmNQ1tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="147866647"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO wieczorr-mobl1.intel.com) ([10.245.244.61])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 09:35:50 -0800
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
Subject: [PATCH 07/15] mm: Pcpu chunk address tag reset
Date: Tue,  4 Feb 2025 18:33:48 +0100
Message-ID: <e7e04692866d02e6d3b32bb43b998e5d17092ba4.1738686764.git.maciej.wieczor-retman@intel.com>
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

The problem presented here is related to NUMA systems and tag-based
KASAN mode. Getting to it can be explained in the following points:

	1. A new chunk is created with pcpu_create_chunk() and
	   vm_structs are allocated. On systems with one NUMA node only
	   one is allocated, but with more NUMA nodes at least a second
	   one will be allocated too.

	2. chunk->base_addr is assigned the modified value of
	   vms[0]->addr and thus inherits the tag of this allocated
	   structure.

	3. In pcpu_alloc() for each possible cpu pcpu_chunk_addr() is
	   executed which calculates per cpu pointers that correspond to
	   the vms structure addresses. The calculations are based on
	   adding an offset from a table to chunk->base_addr.

Here the problem presents itself since for addresses based on vms[1] and
up, the tag will be different than the ones based on vms[0] (base_addr).
The tag mismatch happens and an error is reported.

Reset the base_addr tag, since it will disable tag checks for pointers
derived arithmetically from base_addr that would inherit its tag.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 mm/percpu-vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/percpu-vm.c b/mm/percpu-vm.c
index cd69caf6aa8d..e13750d804f7 100644
--- a/mm/percpu-vm.c
+++ b/mm/percpu-vm.c
@@ -347,7 +347,7 @@ static struct pcpu_chunk *pcpu_create_chunk(gfp_t gfp)
 	}
 
 	chunk->data = vms;
-	chunk->base_addr = vms[0]->addr - pcpu_group_offsets[0];
+	chunk->base_addr = kasan_reset_tag(vms[0]->addr) - pcpu_group_offsets[0];
 
 	pcpu_stats_chunk_alloc();
 	trace_percpu_create_chunk(chunk->base_addr);
-- 
2.47.1

