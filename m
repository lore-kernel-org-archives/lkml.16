Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C711A3159
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 18:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745863436; cv=none; b=WohUEyLH5GTm63/2p4p4ippvH6wL0mLjWIOoo4INbnELsKZsWz03U1OyfH7AUGOmRAFM7NrAVJlBT1K3owEHdw3vshB7fDt/9f84aMQ0agI3rlU5Q5iPysFFdv9ZYLxhNeFXaXq4kB8ElN20QqECSAW5zPKcRXmKu7F7KIYN8F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745863436; c=relaxed/simple;
	bh=/mL7HPcjZJGRPYi0Z91nMrxEdW1H1DRgXdBETT/v/m0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GxvhdKnXja/t6wzJV0H6mkrRRv/IVlUYO7AEfKWQSZMD1nvGYyfJHNbaq4PhKOyEvetCdVbpAMbrbLFklpXN9TN91M+vU1sK0X1xl4nxLUx6Vg+YdSoIoTO778TvJe9MSL5bK/Uny2/waR/Gn4g9/Wz3t6YetY1h64F6416A19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1Dywj3PP; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1Dywj3PP"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b00e4358a34so2932070a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745863434; x=1746468234; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jrm6Nx7Z5Mh8oLM61Urr/bTwwYotksqIY3MvIPdnC9o=;
        b=1Dywj3PPfwyS/hAzq50dRSIrzoO563wn66dysDIgProw9tQZgfNC1gYviTTWdtKIvf
         kcxi9ztFBvuQx9QbV2Z+2aRHDkRQP1So6+YGLhY/018YvDJ/qO7OEbXyt2btv3lQUr0Y
         3Vjibv3a11ZGVgC3WzNVb+KVG5qWG75s0XIQ25V2hicJgmW90ly2vvYNLTOlit6Msfy5
         ssORyUNZB84qgGzEws2usWK02pjteobEPvXR6H9WKr+Lbs4FaaSM77auC9gaYfa33n2v
         E8c5imY9gt9CgB8YE5NzegmoBb+lBNbRRnpNnKFabu0CoWwsVAxDHg04luCcPCpP1IY+
         ldTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745863434; x=1746468234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jrm6Nx7Z5Mh8oLM61Urr/bTwwYotksqIY3MvIPdnC9o=;
        b=n/1d/d28iz6szPlBqkVuyXAgOap4Di/qYnFCwnV7rBSZpFlVzUkCYtuU0KaprbRACt
         254nC1uWE+M/YfS91+ystPZx/s/TOC7bZqvmEVhZ87pidJLqURebg+9FZJ3gpB4UxCPK
         EavUt76Wml8+v/wN/NUw0cGA/XlGdYcWXQcS5JeIrCnpPHaxaBwfnh4WHlzJYueQHJgc
         VDDsLoPcvvtE3C7TspCt7ShahaqJ4EnmDCW6KbWf1sIPMw6xkYTSjdqjHzYEe3sMbphR
         8OVCMd59rdtGzdrI/UIZKz/pL7bBJ3B79ZsOG6CnERLTyAqznvesVD2+fVc+2idLyc2u
         DX8w==
X-Forwarded-Encrypted: i=1; AJvYcCVCx3mpVoToNxzr5QvicanWw+AlKS/VSwEWuhPZm1kBTnmEAjwpZaHRgbQqQBjQLy3HAa/3Y7PgpfWfdYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztquKlNjejZ8dUk36k2DPVYgFkC+rJ0kVmfVv4WNhsra0nqIa9
	opEr4C4lBOghmMEYGHLxk7pudp/mUaOQBpLHzAUGKQXMzGRyjnJNPo38BBLjpjHzNbFkuiY2R3e
	R2sZ0B46SKhEA5g==
X-Google-Smtp-Source: AGHT+IGFy7WG9oO3uBh4Wi8t7O9tAPuPJeA5DbCGTeCTVwRypV0To3vLIJ2Ay+WqLvKrHqdhPZuiAH+PfgHZ0k0=
X-Received: from pjbnt15.prod.google.com ([2002:a17:90b:248f:b0:30a:2020:e2bd])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:554f:b0:2fe:dd2c:f8e7 with SMTP id 98e67ed59e1d1-30a21551e90mr1172926a91.10.1745863433996;
 Mon, 28 Apr 2025 11:03:53 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:02:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250428180256.1482899-1-tjmercier@google.com>
Subject: [PATCH] selftests/bpf: Fix kmem_cache iterator draining
From: "T.J. Mercier" <tjmercier@google.com>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The closing parentheses around the read syscall is misplaced, causing
single byte reads from the iterator instead of buf sized reads. While
the end result is the same, many more read calls than necessary are
performed.

$ tools/testing/selftests/bpf/vmtest.sh  "./test_progs -t kmem_cache_iter"
145/1   kmem_cache_iter/check_task_struct:OK
145/2   kmem_cache_iter/check_slabinfo:OK
145/3   kmem_cache_iter/open_coded_iter:OK
145     kmem_cache_iter:OK
Summary: 1/3 PASSED, 0 SKIPPED, 0 FAILED

Fixes: a496d0cdc84d ("selftests/bpf: Add a test for kmem_cache_iter")
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 tools/testing/selftests/bpf/prog_tests/kmem_cache_iter.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/kmem_cache_iter.c b/tools/testing/selftests/bpf/prog_tests/kmem_cache_iter.c
index 8e13a3416a21..1de14b111931 100644
--- a/tools/testing/selftests/bpf/prog_tests/kmem_cache_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/kmem_cache_iter.c
@@ -104,7 +104,7 @@ void test_kmem_cache_iter(void)
 		goto destroy;
 
 	memset(buf, 0, sizeof(buf));
-	while (read(iter_fd, buf, sizeof(buf) > 0)) {
+	while (read(iter_fd, buf, sizeof(buf)) > 0) {
 		/* Read out all contents */
 		printf("%s", buf);
 	}

base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
-- 
2.49.0.906.g1f30a19c02-goog

