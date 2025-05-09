Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3581423D28F
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 23:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746833912; cv=none; b=tDYLvcIZSO0eSmWGn4pZwTH6wY6ReMW97dPXJItpl/CySkbT4ntpvXfxG78QSPopIkTzdFc8W58z+4xGQpPbGZK+fGBLSbzFTcMp5k0Zhrxy3gf7UqfFxN5MLaAGCrrWZDpU4vNNdrblqJTf3qCTXzaYgpMYye7Z3/n/p7hHNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746833912; c=relaxed/simple;
	bh=zBAJKbJNkN8uN+rOwgPe8ZvLo1/T34pW9dp+TAXCVbE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DbFxKcOi9FbcZyYp6p2L8OqxflcKVq2H8d74m4uk47cvtKqS+MWyhPqe3n+sOsd4IQpRHkvSt5Rec9FVDZs6W0GmIXl32SmRRnSUou7grxuHKUA+YgiXia8MeZrvyiIzJ/vOTmmPAFsnXQQJxXENai8/hbbBaDxg/i+VIKLgoMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wWiGF1WU; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wWiGF1WU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746833908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yclRk7ooaIvmEqMgjub1QEJG1ED/vyWOa9p4x2ARJMI=;
	b=wWiGF1WUUoUBATWBUsBJ0I7cCKcZxaKo7zT5rbGGxGrdOqVKKzxD95We7ZPmhi3QmW4bSw
	KqbrAw8FgXkBGLUP1O01hVk2sw27VRq+Lp1I+Y487UrA+mckVboffn68mFLN6uIgpeKawe
	YvNj1lzJe7tAC5/oVWX0NUjMgqvY9Tc=
From: Sean Anderson <sean.anderson@linux.dev>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Radu Rendec <rrendec@redhat.com>,
	Will Deacon <will@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] arm64: cacheinfo: Report cache sets, ways, and line size
Date: Fri,  9 May 2025 19:37:35 -0400
Message-Id: <20250509233735.641419-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Cache geometry is exposed through the Cache Size ID register. There is
one register for each cache, and they are selected through the Cache
Size Selection register. If FEAT_CCIDX is implemented, the layout of
CCSIDR changes to allow a larger number of sets and ways.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 arch/arm64/include/asm/cache.h |  3 +++
 arch/arm64/kernel/cacheinfo.c  | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index 99cd6546e72e..569330689a2f 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -8,6 +8,9 @@
 #define L1_CACHE_SHIFT		(6)
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
+#define CCSIDR_CCIDX_NumSets		GENMASK_ULL(55, 32)
+#define CCSIDR_CCIDX_Associativity	GENMASK_ULL(23, 3)
+
 #define CLIDR_LOUU_SHIFT	27
 #define CLIDR_LOC_SHIFT		24
 #define CLIDR_LOUIS_SHIFT	21
diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index 309942b06c5b..a0180d3f1631 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -34,8 +34,36 @@ static inline enum cache_type get_cache_type(int level)
 static void ci_leaf_init(struct cacheinfo *this_leaf,
 			 enum cache_type type, unsigned int level)
 {
+	u64 val;
+
 	this_leaf->level = level;
 	this_leaf->type = type;
+	if (type == CACHE_TYPE_NOCACHE)
+		return;
+
+	val = FIELD_PREP(CSSELR_EL1_Level, level - 1);
+	if (type == CACHE_TYPE_INST)
+		val |= CSSELR_EL1_InD;
+	write_sysreg(val, csselr_el1);
+
+	val = read_sysreg(ccsidr_el1);
+	this_leaf->coherency_line_size =
+		BIT(FIELD_GET(CCSIDR_EL1_LineSize, val) + 4);
+	if (FIELD_GET(ID_MMFR4_EL1_CCIDX,
+		      read_sanitised_ftr_reg(SYS_ID_AA64MMFR4_EL1))) {
+		this_leaf->number_of_sets =
+			FIELD_GET(CCSIDR_CCIDX_NumSets, val) + 1;
+		this_leaf->ways_of_associativity =
+			FIELD_GET(CCSIDR_CCIDX_Associativity, val) + 1;
+	} else {
+		this_leaf->number_of_sets =
+			FIELD_GET(CCSIDR_EL1_NumSets, val) + 1;
+		this_leaf->ways_of_associativity =
+			FIELD_GET(CCSIDR_EL1_Associativity, val) + 1;
+	}
+	this_leaf->size = this_leaf->coherency_line_size *
+			  this_leaf->number_of_sets *
+			  this_leaf->ways_of_associativity;
 }
 
 static void detect_cache_level(unsigned int *level_p, unsigned int *leaves_p)
-- 
2.35.1.1320.gc452695387.dirty

