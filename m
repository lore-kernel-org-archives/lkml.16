Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D06284678
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748369257; cv=none; b=MNjwqDdVyzAqqvbLr++jjVjcCyqEw7gIJqrVfLvEd5EL2BWxQCV9kC9jVYSpjhUqM3+JvQarLXTsqZ0UIAJIbr9WeOwYFkcv5Dejt7AQAHZ8UFNKrRdhHGVGOBz6rXhDdvUaFcFpOg5eKQLNkQZWthW7P66oGLMEB6wpsV68qW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748369257; c=relaxed/simple;
	bh=hYhJhw9lgUIEnIxwZHfufmbd/yzFeT8cZT61HtEgsyg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=iSkbijfEt1vDIoB7vxE7Hz5RgWlynni5aW5PAzec0uXfUCcyTP9Lv3CxTlj9sbLVZtGzGWdGkqyP+Xa5k9aYsHm3xhCnF8JFApb4ohDATw4elSexghyHiESPdgfpimrQhVOOH4ddl/ls1OvGeij8R2r40GYEWTF7qlR3Wv20UgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mzzdshBP; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mzzdshBP"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23443196f00so38252335ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748369255; x=1748974055; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nD2QkUBNtYWidhmQthg28IqOzebmfKqF2U7ClZ+k9CY=;
        b=mzzdshBPPjtKDQeFpuisUG5yberem71lqoIou9HDAv5EQumwpO8SaPNu+SKc5/VtIm
         mqPrrGupKhdhNGsxQ7WaF5PA6FvDDBfhYu+IFFyV9UuWG6ugFBp8Uvv+G++EY1dVU2Dx
         7yzWaxpTG0kr2bTnDo/tvDFu/YKAR/mB9AnmbI0TeBpe3kjcTYs/z0avCpowgtSclmsh
         icL8DUrz00JFd0rE0OZIgUlbbgMdExfug7ZgA9wjEW9yqYpXq9zpa8zAeHXi4sKxcHC8
         FGluo8GJWmWLVnHtEsLsPJgAWbx0zcTxC1sd67tIu2TdRpu7y6PC5Iz33b8uqlDHeVyj
         HXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748369255; x=1748974055;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD2QkUBNtYWidhmQthg28IqOzebmfKqF2U7ClZ+k9CY=;
        b=wJ2phLonPRYTrQlRCriCpm5elDv9qcusWDHlDjQkTzAd/Fw2B8tC53BSIKB2GmO8HG
         SwGT9u5/vojTCCTGFvpFBa6lCWltpbgdhLfrS7n+9qoSc29GAMyWvCJhDfkfxbZvld0o
         7TK8JksZrOW9fW7aR0BuA+FpSxFToAK1uUjKZ21nJZVI1K79d5ZtVkXjD0Taw/eD4SCb
         mIF5UU5GadIilL3NM8DVZDiWA5LjT8RgcZO8B3NTwS2X6lWz4N1HfYM4uZZg75FDYIDJ
         c2WkYhjOtVDVl7fgYly7oW/0KBkCPUEhXDPcDy/95wKIpJ9wqkEg6oM6KwsSM+luBZ25
         zWRw==
X-Forwarded-Encrypted: i=1; AJvYcCVdVJNIZnSIHIvhuv/xCVyM+ufJa6sTeM7ObJwxpaFKsW6lR7JFLxBbHujnwzgnFcobvhLCPWOD0VRnpoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56QYRToqjZIHNBxhf4DLK0lE7PoKfCFJUciFLYTt56N502p/t
	EiARJ3wL1tauCjqKTCmrxYEqro/Q7QP+8jG1JB6Jy0ISZKcQoMhIWOUEBtmpFnvN6r2cfwUafmt
	18gjOssf52g==
X-Google-Smtp-Source: AGHT+IE4fW6g74Tthm48qNxM7YBO8dkYBPd3gBkxzs41uElkUtHuH5YcJ4K+ZN7/1wnwXfEfwdwixMyWs3MB
X-Received: from pllw5.prod.google.com ([2002:a17:902:7b85:b0:234:4c97:1e84])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:db03:b0:224:1001:677c
 with SMTP id d9443c01a7336-23414f32ca9mr193634635ad.9.1748369245048; Tue, 27
 May 2025 11:07:25 -0700 (PDT)
Date: Tue, 27 May 2025 11:06:59 -0700
In-Reply-To: <20250527180703.129336-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250527180703.129336-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250527180703.129336-3-irogers@google.com>
Subject: [PATCH v1 2/6] perf test demangle-java: Don't segv if demangling fails
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, James Clark <james.clark@linaro.org>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The buffer returned by dso__demangle_sym may be NULL, don't segv in
strcmp if this happens. Currently this happens for NO_LIBELF=1 builds.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/demangle-java-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/tests/demangle-java-test.c b/tools/perf/tests/demangle-java-test.c
index ebaf60cdfa99..0fb3e5a4a0ed 100644
--- a/tools/perf/tests/demangle-java-test.c
+++ b/tools/perf/tests/demangle-java-test.c
@@ -30,6 +30,11 @@ static int test__demangle_java(struct test_suite *test __maybe_unused, int subte
 
 	for (i = 0; i < ARRAY_SIZE(test_cases); i++) {
 		buf = dso__demangle_sym(/*dso=*/NULL, /*kmodule=*/0, test_cases[i].mangled);
+		if (!buf) {
+			pr_debug("FAILED to demangle: \"%s\"\n \"%s\"\n", test_cases[i].mangled,
+				 test_cases[i].demangled);
+			continue;
+		}
 		if (strcmp(buf, test_cases[i].demangled)) {
 			pr_debug("FAILED: %s: %s != %s\n", test_cases[i].mangled,
 				 buf, test_cases[i].demangled);
-- 
2.49.0.1204.g71687c7c1d-goog

