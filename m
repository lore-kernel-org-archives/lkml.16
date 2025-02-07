Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D053614830F
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 02:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738893969; cv=none; b=rE2lkSBJzTAv/Okr+5eJjs8y69nUgvBOVmepZcrIaKjEUcnAaBEUEVCGT+dAxXYHlHgRabut8D2ERm0pOw8OiHHB+DX9ldWIkgSaAy/CjVcsR8uSbnovFYwhn5VKNuWX/O0TTIhMMLJlkQyywRbVStHFvLv0S6jH0TavimljdBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738893969; c=relaxed/simple;
	bh=E/TpMA247bMkzLdjcLrFOFBXXFCSKNXD47s95nK47Vs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=neNfjLrOY/KUj9OA1DiITOFQCDewKbtheWiYMkdSzRJH7HxB1uIkke2+xrAV6jCd2zCAIu5H5t9Vn6D8SAhzn6Uajy1HgxDNFRmczVAAVpvCOxYqtbKF15upSmz3ilJmi+0/BVtch9bVHs7vKE5m4mGiFTeqTLJIK9DWuo/vLcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UXUnvLq6; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yepeilin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UXUnvLq6"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa166cf693so3103550a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 18:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738893967; x=1739498767; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yopLqhfx9FBzsjoQTq5VQnotD7AE589toKqt2dLQW/g=;
        b=UXUnvLq6tWkJmLQUeX7EbyTEIYhXmvz7FLItJRJExYkvD7xrzAdz+0P4RGGvOdRU2L
         LVlu0O/Jy2zhChNQ2+QdX65Lzg5fZ98Wn5AW8AO+tD0uVCWwxlcHG6fULpPXGjbdbMgk
         z3629GSiL3wey7GKeb4bpbjqM2dlsaVUG+BV5U9cJ6Lqw4fQmkHzBBIaEbjHaIAcAYyC
         oEohSuvFd2swVQhYyv2yziKt7PbamQBoVJGLYhXpyUsCAzJ0+nj7Ier3ovaS/KchzSJ+
         yYCW9C1MU5e2xW16yNkeBgtlDxnoyBdBuDnfJbCEChMJ0q/Y9X8bZolzR35UadK2SQwA
         wx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738893967; x=1739498767;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yopLqhfx9FBzsjoQTq5VQnotD7AE589toKqt2dLQW/g=;
        b=uX8yGObKp3rTzWfBfzSYhTWKlRb3jyhGy1yXY9FPGMLDh8lcDE6PQOyIuP+65kaZVq
         QGs5A2T+sexvKvvNVBxKdxaV6b2dbTOfkIswo/1adBC+yG4Q6noqqNzFUy4hIZJMNINY
         UvQIvg1Tyupb0H0Hlg0TSZnj+2gGNr03a8up4gd8VEdS6oimNxYqurAO5hqc2xfSmkxK
         jDy/t3cl+z1JIo8OmIdHDtA29tFV6aZhnINTQkxjpmy6DYcxv1C9mEUsuG1KImZAnxul
         Okf3gBcTe/V8vZdCGnAi1rOILhCw1NXkmjxoJzTHe8MApirqzGA0uiiXRSyHRJ8OIW/A
         GFSw==
X-Forwarded-Encrypted: i=1; AJvYcCUabVKS1iSxDR1uBDSbDN1FPP8kj1HjkE9Xkc7wXGsF1BymKs/SIFQJqk7Ehk6jY/PkwI9jDM1xKsX7uWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztUydh5dUTIwZNzMN2Sa/0boALRzgcxAbHqsraHSvSZhv43Dg1
	anJ90RpB+mShVYqbxoVRzOOpa1VxkrkgO2/uQh9WgidGW3G/2vr8j9+9TR8WjNAfajo1XT7948e
	wIhtrt59nlg==
X-Google-Smtp-Source: AGHT+IFkXM4xOo99sOcxT31u2xnrLGGSfuSlHl8QgKpY5jPoM6In+piNqVi02IXVxH8TVZTEDBs9f2fc1XsrBg==
X-Received: from pjbpt7.prod.google.com ([2002:a17:90b:3d07:b0:2fa:b84:b308])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3dc3:b0:2ee:8ea0:6b9c with SMTP id 98e67ed59e1d1-2fa24064223mr2524108a91.12.1738893966755;
 Thu, 06 Feb 2025 18:06:06 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:00 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <d6fd6d0d1cafa5520c61bcff7e24e043e606f380.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 5/9] arm64: insn: Add BIT(23) to {load,store}_ex's mask
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

We are planning to add load-acquire (LDAR{,B,H}) and store-release
(STLR{,B,H}) instructions to insn.{c,h}; add BIT(23) to mask of load_ex
and store_ex to prevent aarch64_insn_is_{load,store}_ex() from returning
false-positives for load-acquire and store-release instructions.

Reference: Arm Architecture Reference Manual (ARM DDI 0487K.a,
           ID032224),

  * C6.2.228 LDXR
  * C6.2.165 LDAXR
  * C6.2.161 LDAR
  * C6.2.393 STXR
  * C6.2.360 STLXR
  * C6.2.353 STLR

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/include/asm/insn.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
index e390c432f546..2d8316b3abaf 100644
--- a/arch/arm64/include/asm/insn.h
+++ b/arch/arm64/include/asm/insn.h
@@ -351,8 +351,8 @@ __AARCH64_INSN_FUNCS(ldr_imm,	0x3FC00000, 0x39400000)
 __AARCH64_INSN_FUNCS(ldr_lit,	0xBF000000, 0x18000000)
 __AARCH64_INSN_FUNCS(ldrsw_lit,	0xFF000000, 0x98000000)
 __AARCH64_INSN_FUNCS(exclusive,	0x3F800000, 0x08000000)
-__AARCH64_INSN_FUNCS(load_ex,	0x3F400000, 0x08400000)
-__AARCH64_INSN_FUNCS(store_ex,	0x3F400000, 0x08000000)
+__AARCH64_INSN_FUNCS(load_ex,	0x3FC00000, 0x08400000)
+__AARCH64_INSN_FUNCS(store_ex,	0x3FC00000, 0x08000000)
 __AARCH64_INSN_FUNCS(mops,	0x3B200C00, 0x19000400)
 __AARCH64_INSN_FUNCS(stp,	0x7FC00000, 0x29000000)
 __AARCH64_INSN_FUNCS(ldp,	0x7FC00000, 0x29400000)
-- 
2.48.1.502.g6dc24dfdaf-goog

