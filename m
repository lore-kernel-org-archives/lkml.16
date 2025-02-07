Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D652940B
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893941; cv=none; b=IZCUquqAklrWtrfo6NAPOusO21DzHJNWo1vKJoctvF8aZ5Zm7GDsrXsODvLizDccuLMSBNFUtTIeHcukJh/lopD2S2QaKqFds5jXptZFr4KfNFi/hUBViUw84VUAgQEQUGLOjRtrF1jpG948asDSGLsnKQgLaIciUjlUB56iTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893941; c=relaxed/simple;
	bh=Q2OkqnaEywltUrTvLR9BEhPUZfK5Xxof8YuvKLY13QU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OCsosC9LnQTCN2Ftry/x2W9pJx398AmneDK7qZTqVc/ZW/9hUghpt1+xRjeOmtOHwAV2TkeTTJ0+sRi76fecpx47Y4qO531tWsX1OjIPkbRCyI9BlmAW5drkUzOROCEDxA00mEba8U/7z8xGjU9uaA7lA7eGVZ9Svxgs9gETzpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0F3zl6z7; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0F3zl6z7"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa1e63a5ffso2427608a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893939; x=1739498739; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G0ksBymLsFxBv6dTHVXwRUMsPxued+iewutBsq02rrE=;
        b=0F3zl6z7IU/2gHkgczbWDC4O0lUQdtSX8LmnjIvSsPuLM+lgenSfRzqG5IubZFHFvj
         vryKzmdatssv9uKQoBPOOAsmHuy7fD3QYjZllwrgT7sc2EpHFvI8ZB37SNp26+roLzQQ
         JqLU832PLxNFQnc1n4epCQwbNU/3zzjUn97Scynro/NAmO+Pq9J+hdEM2ZISlqlU/C6d
         ivDk3nGqZceNc0nI4rcbOJyAy3itKisORrfLU3qM/WpfOpIE8zP7FCOpBdlhsVHeQKEc
         JSRQSZ4nmbWUNEHasmacdgM/UYAge9/ldrLkSUUG8bh45Yp4JPsa4oKhGdqdxgt2GPaT
         XPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893939; x=1739498739;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G0ksBymLsFxBv6dTHVXwRUMsPxued+iewutBsq02rrE=;
        b=Q7SkC0uar0GPfzkohw6ZovKK/WLDetwJS3uoa1AE6z08sbEzOE9tGiVmRYkKIK0iVT
         x91CfBWOV/IUWRwtXpn9zMhJ1yKR8n/XjrXKTpHDZGANuxVvE+QzsFnMfEwrq+VKNPjk
         pA3nznFSDzdXcU2KJo09KGRhzXqyye7XVsWlc0TXY68iL+7UBBlmG2ywWJ0UPtkjxtuR
         C9oWxkn5xoqJXZ65oD2eZGNFsG1ekKZ8pUawq17h+17z/FBpT3wC7bMSW+ihMXPIHIoy
         H/6IgZBc9xUGsbit7YiCYT85sTAAV1G+kx5ndzXmyl4w8LK+c86v60JKTjLF1r3ruG1r
         64/g==
X-Forwarded-Encrypted: i=1; AJvYcCXjm8WRphTZUf2/8MeCYdXKGNgvXcFpfG6/M1XDuoDb1y884bie1isiayFhIQB/kMpfFurvd3FmCz6tIfg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkLKDHeEZ9/50gLI9Bzht+y0Bqr7jGqoIGv2tobzn7gVWpkbc0
	xB83oAUewTt/9ihfKKmuzKSKG0DtHkhFWQIRqWM2Yx0D/C32oGRfqbImR9OUOXHnMgAaNc9ewbd
	piRyY1EGRAw==
X-Google-Smtp-Source: AGHT+IEQXS8/Za22ftZ1p+Phe57YwI7GpMBkpoOV+QxJBEcmY8iFZ5iWxAf92Zvu9JrzhNYd5itkmkXtR2L03w==
X-Received: from pfai16.prod.google.com ([2002:aa7:9090:0:b0:72b:ccb:c99b])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:882:b0:71e:6b8:2f4a with SMTP id d2e1a72fcca58-7305d47c9d1mr2600297b3a.12.1738893938799;
 Thu, 06 Feb 2025 18:05:38 -0800 (PST)
Date: Fri,  7 Feb 2025 02:05:34 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <363538659933fb2e289d937d81fc8eecb284ea7b.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 3/9] bpf/verifier: Factor out check_load_mem() and check_store_reg()
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

Extract BPF_LDX and most non-atomic BPF_STX instruction handling logic
in do_check() into helper functions to be used later.  While we are
here, make that comment about "reserved fields" more specific.

Suggested-by: Eduard Zingerman <eddyz87@gmail.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 kernel/bpf/verifier.c | 110 +++++++++++++++++++++++++-----------------
 1 file changed, 67 insertions(+), 43 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 39eb990ec003..82a5a4acf576 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -7536,6 +7536,67 @@ static int check_mem_access(struct bpf_verifier_env *env, int insn_idx, u32 regn
 static int save_aux_ptr_type(struct bpf_verifier_env *env, enum bpf_reg_type type,
 			     bool allow_trust_mismatch);
 
+static int check_load_mem(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			  bool strict_alignment_once, bool is_ldsx,
+			  bool allow_trust_mismatch, const char *ctx)
+{
+	struct bpf_reg_state *regs = cur_regs(env);
+	enum bpf_reg_type src_reg_type;
+	int err;
+
+	/* check src operand */
+	err = check_reg_arg(env, insn->src_reg, SRC_OP);
+	if (err)
+		return err;
+
+	/* check dst operand */
+	err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
+	if (err)
+		return err;
+
+	src_reg_type = regs[insn->src_reg].type;
+
+	/* Check if (src_reg + off) is readable. The state of dst_reg will be
+	 * updated by this call.
+	 */
+	err = check_mem_access(env, env->insn_idx, insn->src_reg, insn->off,
+			       BPF_SIZE(insn->code), BPF_READ, insn->dst_reg,
+			       strict_alignment_once, is_ldsx);
+	err = err ?: save_aux_ptr_type(env, src_reg_type,
+				       allow_trust_mismatch);
+	err = err ?: reg_bounds_sanity_check(env, &regs[insn->dst_reg], ctx);
+
+	return err;
+}
+
+static int check_store_reg(struct bpf_verifier_env *env, struct bpf_insn *insn,
+			   bool strict_alignment_once)
+{
+	struct bpf_reg_state *regs = cur_regs(env);
+	enum bpf_reg_type dst_reg_type;
+	int err;
+
+	/* check src1 operand */
+	err = check_reg_arg(env, insn->src_reg, SRC_OP);
+	if (err)
+		return err;
+
+	/* check src2 operand */
+	err = check_reg_arg(env, insn->dst_reg, SRC_OP);
+	if (err)
+		return err;
+
+	dst_reg_type = regs[insn->dst_reg].type;
+
+	/* Check if (dst_reg + off) is writeable. */
+	err = check_mem_access(env, env->insn_idx, insn->dst_reg, insn->off,
+			       BPF_SIZE(insn->code), BPF_WRITE, insn->src_reg,
+			       strict_alignment_once, false);
+	err = err ?: save_aux_ptr_type(env, dst_reg_type, false);
+
+	return err;
+}
+
 static int check_atomic_rmw(struct bpf_verifier_env *env,
 			    struct bpf_insn *insn)
 {
@@ -19051,35 +19112,16 @@ static int do_check(struct bpf_verifier_env *env)
 				return err;
 
 		} else if (class == BPF_LDX) {
-			enum bpf_reg_type src_reg_type;
-
-			/* check for reserved fields is already done */
-
-			/* check src operand */
-			err = check_reg_arg(env, insn->src_reg, SRC_OP);
-			if (err)
-				return err;
+			bool is_ldsx = BPF_MODE(insn->code) == BPF_MEMSX;
 
-			err = check_reg_arg(env, insn->dst_reg, DST_OP_NO_MARK);
-			if (err)
-				return err;
-
-			src_reg_type = regs[insn->src_reg].type;
-
-			/* check that memory (src_reg + off) is readable,
-			 * the state of dst_reg will be updated by this func
+			/* Check for reserved fields is already done in
+			 * resolve_pseudo_ldimm64().
 			 */
-			err = check_mem_access(env, env->insn_idx, insn->src_reg,
-					       insn->off, BPF_SIZE(insn->code),
-					       BPF_READ, insn->dst_reg, false,
-					       BPF_MODE(insn->code) == BPF_MEMSX);
-			err = err ?: save_aux_ptr_type(env, src_reg_type, true);
-			err = err ?: reg_bounds_sanity_check(env, &regs[insn->dst_reg], "ldx");
+			err = check_load_mem(env, insn, false, is_ldsx, true,
+					     "ldx");
 			if (err)
 				return err;
 		} else if (class == BPF_STX) {
-			enum bpf_reg_type dst_reg_type;
-
 			if (BPF_MODE(insn->code) == BPF_ATOMIC) {
 				err = check_atomic(env, insn);
 				if (err)
@@ -19093,25 +19135,7 @@ static int do_check(struct bpf_verifier_env *env)
 				return -EINVAL;
 			}
 
-			/* check src1 operand */
-			err = check_reg_arg(env, insn->src_reg, SRC_OP);
-			if (err)
-				return err;
-			/* check src2 operand */
-			err = check_reg_arg(env, insn->dst_reg, SRC_OP);
-			if (err)
-				return err;
-
-			dst_reg_type = regs[insn->dst_reg].type;
-
-			/* check that memory (dst_reg + off) is writeable */
-			err = check_mem_access(env, env->insn_idx, insn->dst_reg,
-					       insn->off, BPF_SIZE(insn->code),
-					       BPF_WRITE, insn->src_reg, false, false);
-			if (err)
-				return err;
-
-			err = save_aux_ptr_type(env, dst_reg_type, false);
+			err = check_store_reg(env, insn, false);
 			if (err)
 				return err;
 		} else if (class == BPF_ST) {
-- 
2.48.1.502.g6dc24dfdaf-goog

