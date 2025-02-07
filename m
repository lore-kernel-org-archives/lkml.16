Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6DF537E9
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893988; cv=none; b=l3iOPAaWSWOayGip5PMMm+SOv7teaDXxsS95Day0238Yd1PaVkXDGRX/Oyd+b9kfSahh2t/9DTXza5bvyb75rsqE1dN0sEwbicSDORh9ywK0d9grRVQiK16H6ktQg6f5E3Ro8KP1IvhT9/yh1w5zZkPRlxJ6K+wozaSL6pKDqAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893988; c=relaxed/simple;
	bh=o+cMo6NZBu9P5vO9g1QzNKIoy5uAblRmQs2pktEwXww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FJGwh7heXVsiOA5tkABHO2BuZR4JmgQLH9Zqf7LC3UZevMb3nwkxLt6mtBhOE8WEi2QbEYrLhE1bxaitoB2I/xcStl0y83ZDVcSXkzUtg13Wg+EO7ADsJaO3woLsZWkGQhAroJEbiWhjPy1HEv/CXjQZMOQM1aQs6nAYsy+7mvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WysYzdqA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WysYzdqA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9f42d98e3so3286764a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893986; x=1739498786; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/uv2akh8MDqd9n19hYJv/xvE4Iur0KMmE3+KGKTk/Y=;
        b=WysYzdqAJZMfY79lhOhHfzXn2DXAJxascyYCOAjbAIaN7ROtVwB9gPdtxcu8IFbIyD
         RuETtGoG2BmM3FSRyrMUZGS5Rxc6vm2CtC+EHHK3McpJWoAWKrwMyB7+F00ilf0Qscw4
         mhiE3+YMldZjIzaCMW+ovC88CL+PSgBbvOvMpZIFkeOeKm3Ecf8jTEYl1FEgC+6i/HYW
         GFBRDfLGmPwOYm0FbdL2lIbWBnksLSsC+Xu1kSurGlcJ0Ovph7QAbL8mxzFnCPZj7jhg
         fcnUNccaEk06110bzo2pv1/CJibo7c7lV+Ef/KgFohr0THtP8QKE+GsPqpLIHZr3Ve9f
         sCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893986; x=1739498786;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/uv2akh8MDqd9n19hYJv/xvE4Iur0KMmE3+KGKTk/Y=;
        b=ilVzm5ZqKddlndsHEmi/YWyXFhtCq9ufGQFkKIZPeyx9UHx/CD1Cr6jxpXvOux7YdO
         IAVdFq4ZhfMf2qqffLI3WdGBHHANSd67+FsRNkpFcJW+1IIOuspqX2NGTYchjXoiOB5I
         BOnoF9ZqK9HHdsy/0ofWh9vLGg9JJB008BJAyV5f4h5M335LNQ0XW1yLZIJH3hUC8Rj7
         jw1LlNutDjmRL97CBryKO2vfKOX+dvhgExLnYS+mWr2HyGpCQMAS/VblS0gWFBWQL8zY
         CN8dgkF1ist0QuSIP5SbLxjQzKgF0V/EbanUl+9me4QDULhQE9yB0/Fs0fi7OFRPEJED
         LCfA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ8Tc9MBQneUFND5JjvT5MDxjF8+zxj+7T9fFr1RFytN/b6pi6ofb3s+Lbk4DDQySO+biVbPu4OlKSYm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8qW39kPkSZXkexz+DLFUiCaZmwSf5wvO+yFYNcSAB4923eVm
	jzP2VaITuqtifUZezfWIE5O2pEFGWuZMV7TBxWFyUFQA6s8nnqMmPQKlLI/HOnO6pBeDhxY3wAK
	BqN7Q/9iNXA==
X-Google-Smtp-Source: AGHT+IHmd7jXzZpPbORG/2teAdCv8IQKKJx1keqS0VzPbP7gZVccyL5ZzCdiANnZVKcUIXtFTxwxZpQFooUwFw==
X-Received: from pfvx11.prod.google.com ([2002:a05:6a00:270b:b0:725:dec7:dd47])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:230c:b0:725:e4b9:a600 with SMTP id d2e1a72fcca58-7305d4f0412mr2817045b3a.16.1738893986567;
 Thu, 06 Feb 2025 18:06:26 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:19 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <73f55267778db55ba9e854f0e3bef24c4bbba2fb.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 7/9] bpf, arm64: Support load-acquire and
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

Support BPF load-acquire (BPF_LOAD_ACQ) and store-release
(BPF_STORE_REL) instructions in the arm64 JIT compiler.  For example:

  db 10 00 00 11 00 00 00  r0 = load_acquire((u64 *)(r1 + 0x0))
  95 00 00 00 00 00 00 00  exit

  opcode (0xdb): BPF_ATOMIC | BPF_DW | BPF_STX
  imm (0x00000011): BPF_LOAD_ACQ

The JIT compiler would emit an LDAR instruction for the above, e.g.:

  ldar  x7, [x0]

Similarly, consider the following 16-bit store-release:

  cb 21 00 00 22 00 00 00  store_release((u16 *)(r1 + 0x0), w2)
  95 00 00 00 00 00 00 00  exit

  opcode (0xcb): BPF_ATOMIC | BPF_H | BPF_STX
  imm (0x00000022): BPF_ATOMIC_STORE | BPF_RELEASE

An STLRH instruction would be emitted, e.g.:

  stlrh  w1, [x0]

For a complete mapping:

  load-acquire     8-bit  LDARB
 (BPF_LOAD_ACQ)   16-bit  LDARH
                  32-bit  LDAR (32-bit)
                  64-bit  LDAR (64-bit)
  store-release    8-bit  STLRB
 (BPF_STORE_REL)  16-bit  STLRH
                  32-bit  STLR (32-bit)
                  64-bit  STLR (64-bit)

Arena accesses are supported.
bpf_jit_supports_insn(..., /*in_arena=*/true) always returns true for
BPF_LOAD_ACQ and BPF_STORE_REL instructions, as they don't depend on
ARM64_HAS_LSE_ATOMICS.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit.h      | 20 ++++++++
 arch/arm64/net/bpf_jit_comp.c | 91 ++++++++++++++++++++++++++++++++---
 2 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/net/bpf_jit.h b/arch/arm64/net/bpf_jit.h
index b22ab2f97a30..a3b0e693a125 100644
--- a/arch/arm64/net/bpf_jit.h
+++ b/arch/arm64/net/bpf_jit.h
@@ -119,6 +119,26 @@
 	aarch64_insn_gen_load_store_ex(Rt, Rn, Rs, A64_SIZE(sf), \
 				       AARCH64_INSN_LDST_STORE_REL_EX)
 
+/* Load-acquire & store-release */
+#define A64_LDAR(Rt, Rn, size)  \
+	aarch64_insn_gen_load_acq_store_rel(Rt, Rn, AARCH64_INSN_SIZE_##size, \
+					    AARCH64_INSN_LDST_LOAD_ACQ)
+#define A64_STLR(Rt, Rn, size)  \
+	aarch64_insn_gen_load_acq_store_rel(Rt, Rn, AARCH64_INSN_SIZE_##size, \
+					    AARCH64_INSN_LDST_STORE_REL)
+
+/* Rt = [Rn] (load acquire) */
+#define A64_LDARB(Wt, Xn)	A64_LDAR(Wt, Xn, 8)
+#define A64_LDARH(Wt, Xn)	A64_LDAR(Wt, Xn, 16)
+#define A64_LDAR32(Wt, Xn)	A64_LDAR(Wt, Xn, 32)
+#define A64_LDAR64(Xt, Xn)	A64_LDAR(Xt, Xn, 64)
+
+/* [Rn] = Rt (store release) */
+#define A64_STLRB(Wt, Xn)	A64_STLR(Wt, Xn, 8)
+#define A64_STLRH(Wt, Xn)	A64_STLR(Wt, Xn, 16)
+#define A64_STLR32(Wt, Xn)	A64_STLR(Wt, Xn, 32)
+#define A64_STLR64(Xt, Xn)	A64_STLR(Xt, Xn, 64)
+
 /*
  * LSE atomics
  *
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8c3b47d9e441..c439df0233d1 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -647,6 +647,82 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx)
 	return 0;
 }
 
+static int emit_atomic_load_store(const struct bpf_insn *insn,
+				  struct jit_ctx *ctx)
+{
+	const s32 type = BPF_ATOMIC_TYPE(insn->imm);
+	const s16 off = insn->off;
+	const u8 code = insn->code;
+	const bool arena = BPF_MODE(code) == BPF_PROBE_ATOMIC;
+	const u8 arena_vm_base = bpf2a64[ARENA_VM_START];
+	const u8 dst = bpf2a64[insn->dst_reg];
+	const u8 src = bpf2a64[insn->src_reg];
+	const u8 tmp = bpf2a64[TMP_REG_1];
+	u8 reg;
+
+	switch (type) {
+	case BPF_ATOMIC_LOAD:
+		reg = src;
+		break;
+	case BPF_ATOMIC_STORE:
+		reg = dst;
+		break;
+	default:
+		pr_err_once("unknown atomic load/store op type %02x\n", type);
+		return -EINVAL;
+	}
+
+	if (off) {
+		emit_a64_add_i(1, tmp, reg, tmp, off, ctx);
+		reg = tmp;
+	}
+	if (arena) {
+		emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
+		reg = tmp;
+	}
+
+	switch (insn->imm) {
+	case BPF_LOAD_ACQ:
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit(A64_LDARB(dst, reg), ctx);
+			break;
+		case BPF_H:
+			emit(A64_LDARH(dst, reg), ctx);
+			break;
+		case BPF_W:
+			emit(A64_LDAR32(dst, reg), ctx);
+			break;
+		case BPF_DW:
+			emit(A64_LDAR64(dst, reg), ctx);
+			break;
+		}
+		break;
+	case BPF_STORE_REL:
+		switch (BPF_SIZE(code)) {
+		case BPF_B:
+			emit(A64_STLRB(src, reg), ctx);
+			break;
+		case BPF_H:
+			emit(A64_STLRH(src, reg), ctx);
+			break;
+		case BPF_W:
+			emit(A64_STLR32(src, reg), ctx);
+			break;
+		case BPF_DW:
+			emit(A64_STLR64(src, reg), ctx);
+			break;
+		}
+		break;
+	default:
+		pr_err_once("unknown atomic load/store op code %02x\n",
+			    insn->imm);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 {
@@ -1641,11 +1717,17 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 			return ret;
 		break;
 
+	case BPF_STX | BPF_ATOMIC | BPF_B:
+	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
+	case BPF_STX | BPF_PROBE_ATOMIC | BPF_B:
+	case BPF_STX | BPF_PROBE_ATOMIC | BPF_H:
 	case BPF_STX | BPF_PROBE_ATOMIC | BPF_W:
 	case BPF_STX | BPF_PROBE_ATOMIC | BPF_DW:
-		if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
+		if (bpf_atomic_is_load_store(insn))
+			ret = emit_atomic_load_store(insn, ctx);
+		else if (cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			ret = emit_lse_atomic(insn, ctx);
 		else
 			ret = emit_ll_sc_atomic(insn, ctx);
@@ -2667,13 +2749,10 @@ bool bpf_jit_supports_insn(struct bpf_insn *insn, bool in_arena)
 	if (!in_arena)
 		return true;
 	switch (insn->code) {
-	case BPF_STX | BPF_ATOMIC | BPF_B:
-	case BPF_STX | BPF_ATOMIC | BPF_H:
 	case BPF_STX | BPF_ATOMIC | BPF_W:
 	case BPF_STX | BPF_ATOMIC | BPF_DW:
-		if (bpf_atomic_is_load_store(insn))
-			return false;
-		if (!cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
+		if (!bpf_atomic_is_load_store(insn) &&
+		    !cpus_have_cap(ARM64_HAS_LSE_ATOMICS))
 			return false;
 	}
 	return true;
-- 
2.48.1.502.g6dc24dfdaf-goog

