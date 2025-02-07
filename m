Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF30E31A89
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893977; cv=none; b=tW4cLtlE+MmXFIVlz3PFxLSQxqunyvXVyPh3AbydxIOnCKRmn7WV7ClqjAeC1U7OYYdQ5Yk6hCDytJSVJX4elSMhTbkh5SFO/SkOScEUDhLng8DJ5NInzwE0kGkSVepEsLl56NbDNMDKFOA2Ho401s7+Oes/DL5/jarx773nLK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893977; c=relaxed/simple;
	bh=lOx0oxqsFi2jJOQkIsQuz42bLtGdgU6p3JqX0Ube2Es=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G4zSGOCO565d16y5yI+drAz0Uw1MJ/gEXc92bXPqBkUalhjcUge8JPaHdRSDWO79hkEueaK5ym+oXALec2YTRSzVs1Eg7NaPKNZhPLtHcngq0k8S1wZGm3CpHFTuBOgowJXpdQ/Pv0/2CruJKH4aFDfDPKXr081Q+E6CFiLA5Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jlFoIJie; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jlFoIJie"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9f2bf2aaeso3265418a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893975; x=1739498775; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZVryglY4SpsTL4//l81oNX0vaTjg5yUDPJMzMkBO6s=;
        b=jlFoIJieb5nKFPQkHEf/n40oIocBe5eIx3P4bVz/H7AXIxvL7034E+58Z2qG0kg5VG
         nEjFcWMWAum5sm8JnCbYBbzNRNj7b8ng9NBv/BhKKfsccNFDFlG/oywIBNb3sFNv6rB7
         BpzmxIVSJQpCgcZa7NxItszxpS+2dHZP+zOtqzhB5DIBWu+paAb92Qg6AnSQi+6fIRbb
         4jmFLqRboAT7fYoknoUpojvNwtJGOr2TDwJzJL1jpK5M8W0SBytZ4zEn51qZBrhzPEwS
         SiwsxAoO5zV8Nm5JLvDbPSGLBHIGedZuzzlq02338hmu0StBRkt/0I2eqAsfMbsyvp4y
         4DZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893975; x=1739498775;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZVryglY4SpsTL4//l81oNX0vaTjg5yUDPJMzMkBO6s=;
        b=RcHVTJhNPx3PR2P9/jg8LvPGQsQpmUoM4ORwiquX9prDIB8+5fMDrnUfdlnh+37O6f
         +jCYJxdPn0c2pUrq5s+NdbjT/t+HTqOPGJvP5s381+PN4C4U3pALYo0yhWboUQUqgegm
         YHBfk6h5w2ADLPIBUkUvBx8RNNNmwLeoOMSCxd8lHgbFqGKVh+1dwmnbpAz7XuGvC4Bi
         PrjBp2Tck7jL3/5y3y6uXUH9DuM9ApOuxKosfFHYzBE04GHAn/gHl/ukYt8nrE1CEZOX
         a13Gcxxho6QE9yq7UaE23uUZUeUa4aaYJ+t48hQpvkU1vBntodHZjn344bF4XBqYInhq
         eXsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFEZSzPHhKqlSLtaybHH+5cU5/9qqFzVKP0lUSwhH8fZmBtJV7e0SavVJtTUjjrx1Njrw/45OxKnZgoF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhneAQ5e5Xxb3kJDWqPRaZ2VTrlO0u1MZIxT+85aY6BQD3JrML
	E7ik2HnlP1dCOc6h8kvewQTut4x0gyqcu1TxTCRkfGJ+aeKt6PKtlCA3qOlOS68FljkTEWxucig
	BLV1SXjDGCA==
X-Google-Smtp-Source: AGHT+IGIQlJHYn4lDP+h2wWyOKBebCVWMqyOh64SVoatr4LfPmXKB3GVTfYlGBX4UVXE3HcAasyz3VEj0/8t8w==
X-Received: from pjyf6.prod.google.com ([2002:a17:90a:ec86:b0:2fa:15aa:4d1e])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:184d:b0:2ee:d824:b559 with SMTP id 98e67ed59e1d1-2fa243f058cmr2144082a91.28.1738893974955;
 Thu, 06 Feb 2025 18:06:14 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:10 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <8d599a837068e7a526200bbe7c6355ad4c5fc028.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 6/9] arm64: insn: Add load-acquire and
 store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add load-acquire ("load_acq", LDAR{,B,H}) and store-release
("store_rel", STLR{,B,H}) instructions.  Breakdown of encoding:

                                size        L   (Rs)  o0 (Rt2) Rn    Rt
             mask (0x3fdffc00): 00 111111 1 1 0 11111 1  11111 00000 00000
  value, load_acq (0x08dffc00): 00 001000 1 1 0 11111 1  11111 00000 00000
 value, store_rel (0x089ffc00): 00 001000 1 0 0 11111 1  11111 00000 00000

As suggested by Xu [1], include all Should-Be-One (SBO) bits ("Rs" and
"Rt2" fields) in the "mask" and "value" numbers.

It is worth noting that we are adding the "no offset" variant of STLR
instead of the "pre-index" variant, which has a different encoding.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.161 LDAR
  * C6.2.353 STLR

[1] https://lore.kernel.org/bpf/4e6641ce-3f1e-4251-8daf-4dd4b77d08c4@huaweicloud.com/

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h |  8 ++++++++
 arch/arm64/lib/insn.c         | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index 2d8316b3abaf..39577f1d079a 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -188,8 +188,10 @@ enum aarch64_insn_ldst_type {
 	AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX,
 	AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX,
 	AARCH64_INSN_LDST_STORE_PAIR_POST_INDEX,
+	AARCH64_INSN_LDST_LOAD_ACQ,
 	AARCH64_INSN_LDST_LOAD_EX,
 	AARCH64_INSN_LDST_LOAD_ACQ_EX,
+	AARCH64_INSN_LDST_STORE_REL,
 	AARCH64_INSN_LDST_STORE_EX,
 	AARCH64_INSN_LDST_STORE_REL_EX,
 	AARCH64_INSN_LDST_SIGNED_LOAD_IMM_OFFSET,
@@ -351,6 +353,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_acq,  0x3FDFFC00, 0x08DFFC00)
+__AARCH64_INSN_FUNCS(store_rel, 0x3FDFFC00, 0x089FFC00)
 __AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
 __AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
@@ -602,6 +606,10 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 				     int offset,
 				     enum aarch64_insn_variant variant,
 				     enum aarch64_insn_ldst_type type);
+u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
+					enum aarch64_insn_register base,
+					enum aarch64_insn_size_type size,
+					enum aarch64_insn_ldst_type type);
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
index b008a9b46a7f..9bef696e2230 100644
--- a/arch/arm64/lib/insn.c
+++ b/arch/arm64/lib/insn.c
@@ -540,6 +540,35 @@ u32 aarch64_insn_gen_load_store_pair(enum aarch64_insn_register reg1,
 					     offset >> shift);
 }
 
+u32 aarch64_insn_gen_load_acq_store_rel(enum aarch64_insn_register reg,
+					enum aarch64_insn_register base,
+					enum aarch64_insn_size_type size,
+					enum aarch64_insn_ldst_type type)
+{
+	u32 insn;
+
+	switch (type) {
+	case AARCH64_INSN_LDST_LOAD_ACQ:
+		insn = aarch64_insn_get_load_acq_value();
+		break;
+	case AARCH64_INSN_LDST_STORE_REL:
+		insn = aarch64_insn_get_store_rel_value();
+		break;
+	default:
+		pr_err("%s: unknown load-acquire/store-release encoding %d\n",
+		       __func__, type);
+		return AARCH64_BREAK_FAULT;
+	}
+
+	insn = aarch64_insn_encode_ldst_size(size, insn);
+
+	insn = aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT, insn,
+					    reg);
+
+	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RN, insn,
+					    base);
+}
+
 u32 aarch64_insn_gen_load_store_ex(enum aarch64_insn_register reg,
 				   enum aarch64_insn_register base,
 				   enum aarch64_insn_register state,
-- 
2.48.1.502.g6dc24dfdaf-goog

