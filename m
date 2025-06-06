Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CE41C860C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 05:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749187436; cv=none; b=KOKJPJ08225B58mCe8YuVsAvKtZXiid2FT2zZsSaSMxpS09bVpge+DyCTBdgmrJrq8Tz+0SyM75HADC2utxBD5b8KnB9sEyGry3Zv+Vxo2atz3xHRZeCxpcgdGa9f9QaBboiSMyxclM2dr1YngGZfO+WHeNYOdQdtfZeB5VYYrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749187436; c=relaxed/simple;
	bh=0LcugX7pIJqi20ylrFfW2GJHIIOk7YhX5V657AkjHuo=;
	h=Date:Message-Id:Mime-Version:Subject:From:To:Cc:Content-Type; b=BdwnB4S2aeLZhjuU9exOgoOcRIzeN6Zo66ELyZFJyqSbD6OE5vxx35PsVrl+SVVvdiRqUa957Tmys7pIUdlEqzDGfXV1Q9T9ZSHXtMl5XCROZt92Cqso0j5/TahBe0+dgKgUtRkQpvzhgR87IULQ0waOE0HzdYI0yUFkZzWGLI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yfP10EHU; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--suleiman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yfP10EHU"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7071dd5dbc1so23540087b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 22:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749187433; x=1749792233; darn=vger.kernel.org;
        h=cc:to:from:subject:mime-version:message-id:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xPdemEaGJWvzsN6Iuk80gCcUSIvsiiSoKmwg/dFuW0k=;
        b=yfP10EHUYSptf3vTvQpLzrWk6SoM8dVGsCjwcyPEPo1u9ALbLCd5EXvrwaXwKRwYYo
         QlI3UZwO3ik/aXEoFohb0r+fmmx00W5sv8f4KwPHaiSfLFHjxB/92F12jGCeRfjbKqWZ
         IB4U8j/hh9hYDPt0eumUIed+UIcuK+ZtXcZTEttc1jJQmY/nTlcPqNPtLxT8ovD59lyU
         aHuj/jIuX/1EvpONMGuWMpuIShkjM2gtvXHZScLLDgFmyZtCQxI+1QxbheG4dRt4OlpD
         uAEwS5eMPbNv43LUyZ1QcgbqHK8JsQUSMN626nNs8B+GoE0wV6R5xOGa41diDiFYybm4
         z5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749187433; x=1749792233;
        h=cc:to:from:subject:mime-version:message-id:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xPdemEaGJWvzsN6Iuk80gCcUSIvsiiSoKmwg/dFuW0k=;
        b=C+x/8Dgk63+AWuwaKUprxcc2/jHaqEy+vGmXvEk2nElH4hSMHKDh4X1GgLeveCJxQK
         P/XBVYVQct9PiuRReltAyCsIZGNQYAf8/aary/+GqHnAqFF1ULiE0DX68NAUCfs6Qok1
         X+YAT2RPu7UAVrgCR2yedpwFzjxysVYWqvQjCw2lkUvDkR2ojjTFeXzYbSJmZsRDynMC
         9LK4TtiTIyNpHvIxAAExolbQ1I7a9TrGK0ArcUeaCXZKySO7dVdLkjU6OiR15CkYzO8V
         q0uHdSsR4rh18f6XgVoor6Bgmm3DrRFnHQay8Vm3jz4M0kQHvOZ/3cBvUtlWbnVHvWpv
         fBZA==
X-Forwarded-Encrypted: i=1; AJvYcCXyJdpnHAm6oTbawbyKthgJhcFcdDyxPCQhVs3h8B/mitzn6+kfgvfr3BNU0N6mIgbrcCtP95nvAckzcgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwagVx7QjrJf0ViQgjGhAazBo3o7Xt4ExnaaQHKe7Um6TOrps/W
	DiGYD6c+fQLiRUNsRtNC6cqx1t3vlFVdSt0bL8P7hiCrs2FKi2bx72RXiOzyPxrCS4HgXobaW1q
	TgDo9yIH88A4HdA==
X-Google-Smtp-Source: AGHT+IGM/2zgkKAi8l8Bv5Y3g3HKlCcWzySlnqdZP8vCaBlczO4XnsaCrkzqSdd8WqbJpXkzwLkHLILC/I6frg==
X-Received: from suleiman1.tok.corp.google.com ([2401:fa00:8f:203:b09c:3d84:6735:a65])
 (user=suleiman job=sendgmr) by 2002:a05:690c:8e0d:b0:70e:458:874a with SMTP
 id 00721157ae682-710f7533fb3mr8927b3.0.1749187433661; Thu, 05 Jun 2025
 22:23:53 -0700 (PDT)
Date: Fri,  6 Jun 2025 14:23:01 +0900
Message-Id: <20250606052301.810338-1-suleiman@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Subject: [PATCH] tools/resolve_btfids: Fix build when cross compiling kernel
 with clang.
From: Suleiman Souhlal <suleiman@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>
Cc: Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When cross compiling the kernel with clang, we need to override
CLANG_CROSS_FLAGS when preparing the step libraries for
resolve_btfids.

Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
when building tools in parallel"), MAKEFLAGS would have been set to a
value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
fact that we weren't properly overriding it.

Cc: stable@vger.kernel.org
Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as host program")
Signed-of-by: Suleiman Souhlal <suleiman@google.com>
---
 tools/bpf/resolve_btfids/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bpf/resolve_btfids/Makefile b/tools/bpf/resolve_btfids/Makefile
index afbddea3a39c..ce1b556dfa90 100644
--- a/tools/bpf/resolve_btfids/Makefile
+++ b/tools/bpf/resolve_btfids/Makefile
@@ -17,7 +17,7 @@ endif
 
 # Overrides for the prepare step libraries.
 HOST_OVERRIDES := AR="$(HOSTAR)" CC="$(HOSTCC)" LD="$(HOSTLD)" ARCH="$(HOSTARCH)" \
-		  CROSS_COMPILE="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
+		  CROSS_COMPILE="" CLANG_CROSS_FLAGS="" EXTRA_CFLAGS="$(HOSTCFLAGS)"
 
 RM      ?= rm
 HOSTCC  ?= gcc
-- 
2.50.0.rc0.642.g800a2b2222-goog

