Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B50B78F3B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402803; cv=none; b=Nv5Q37jmDZuZMIMU98M9qacwIcq/9Mzu6j6zdEayp/4HKFQ/5Jz9dZSq4RZtlqZNiYyS2cB5LW0SAKBWy8fW5+QsRQJ8C84nw0+athMvPKnfFzdlP+Ni/YX3HRJQvTTLi7yNhNvpyYfgu7tJGD5wQhA5dqOwmErJPX2d/AcUoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402803; c=relaxed/simple;
	bh=rNzkr9PD/Dn687T+AGetBIv/1kfPiIBsjmnIT83qck4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=jI9ZB4QW4V4u74qiPAaUIfsNAjc8CBeq8+LaneohmKvEUJN/i/vvlo3phFRt9yk3PzDidXQSWmRbhX12w3C9mwZFpk0XAgTRNw4j9zTPV+BE0hc/G9ce9f3etfj/aeVibip2FImSDKSgHiCmhn0o3LZW13ebDAvl4cSc6bBqp04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q2dUn5jV; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q2dUn5jV"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0e0c573531so2370101a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402800; x=1749007600; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qthGPSnrY3//sB/RtQQS5H9LtWVtNZRKXA0sksz8t9E=;
        b=Q2dUn5jVZeX/+/mi+5W92XiMHFs0yaoHvCSoo2Y819Ar2q5QXeaolfyTwT5rvZlr3R
         gZjfkJrAfVJDN85p5hpcoND1fHWMogJhLA9GOTpO7WGCObUJiESVeL/N/7CYka30CWKJ
         LTHZHSZHOiAkQwyoGihY6KsLcVM2mUomVUfUBqzE+R78jbpKWzZBZyC3ne5/36M5nZj4
         zJvCQWQrzhSvS4UpBy7moL4Hq6HHfiV5AWwPiGgW12ScmYSquHde6ByyzzrXKGpXa8/D
         hK78av9MI7u711cUnhG6XRnn+nCpgqsKy0OMhpnUe60aX2fBDzgYtv66Hcc3FwCl+ebQ
         AoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402800; x=1749007600;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qthGPSnrY3//sB/RtQQS5H9LtWVtNZRKXA0sksz8t9E=;
        b=Oz9yyDa5f9C+jJotzx/nTuBl8qMeTxdDTRlCENK7lJEmezeorVR/FLUjck3bKYrOwP
         YKSpdXCUCAxJIY6gZb+0x6w1Xn+0JkxhprxrgskjigIFXdfeATMdk8ptwFSCdSfzhwFD
         R+C3cGW/RksNnSfWsqtKapVQs56FktAKWk0srSOss7W27g/+YbYLg5aTGkKg7C3hRgv5
         YSwH4YbHJ++6eHgtmfNH655b3SSxzInbU3Jb96slpG7r94GkXp2PWT+of1/WHpjVzMTS
         P6zv6YkyKS8xSEmw0OQ2LMOSaRDXKCrk3traltPyn1iiI+RAw3w7hfFEXfsMrA/lWhuG
         TKSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8v/iFWJnGLiA5am42L5PkeLewqiftaxC0P4wJ/pJTck+UxQyDI8q8gnUUz1R/ejtIEidfBbbSK14WMZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBH8LDGSD8nRGds5JZhOLw9RXY+KlVP5bj5BWAvMIAC7DHvPT
	o7fj522Clj9xBGqnHCX5kyG4ilKTqH/vl0dLFiFKj2yk/DWi+k9gZujWDZC8QvFPkxgWzL4fh1s
	D0fn3CZZzjA==
X-Google-Smtp-Source: AGHT+IEieyR9hfyUbMGNfOASge5qq2XRjAhfP7DHYG9bUxzx9nIbSVq4zNmmetxMqCCk80MpvM4NnSqoC0uW
X-Received: from pgbfq14.prod.google.com ([2002:a05:6a02:298e:b0:b2d:aac5:e874])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c6cd:b0:1fd:e9c8:cf3b
 with SMTP id adf61e73a8af0-2188c32800bmr26426139637.30.1748402800192; Tue, 27
 May 2025 20:26:40 -0700 (PDT)
Date: Tue, 27 May 2025 20:26:30 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250528032637.198960-1-irogers@google.com>
Subject: [PATCH v2 0/7] Various asan and test fixes
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

When testing removing perf_env with asan I noticed a number of test
failures either because of asan issues or because of building with
NO_LIBELF=1 and NO_LIBBPF=1 to avoid false memory leaks. Address these
issues so that real test failures stand out.

v2: Fix wrong elf size use in filename__read_build_id fix. Add
    thread__comm_lock fix.

Ian Rogers (7):
  perf symbol: Fix use-after-free in filename__read_build_id
  perf test demangle-java: Don't segv if demangling fails
  perf symbol: Move demangling code out of symbol-elf.c
  perf intel-tpebs: Avoid race when evlist is being deleted
  perf test intel-pt: Skip jitdump test if no libelf
  perf test trace_summary: Skip --bpf-summary tests if no libbpf
  perf thread: Avoid recursively taking thread__comm_lock

 tools/perf/tests/demangle-java-test.c   |   5 +
 tools/perf/tests/shell/test_intel_pt.sh |   5 +
 tools/perf/tests/shell/trace_summary.sh |   6 +
 tools/perf/util/demangle-cxx.h          |   2 +
 tools/perf/util/intel-tpebs.c           |  12 +-
 tools/perf/util/symbol-elf.c            |  86 ------------
 tools/perf/util/symbol-minimal.c        | 175 ++++++++++--------------
 tools/perf/util/symbol.c                |  87 ++++++++++++
 tools/perf/util/thread.c                |  17 ++-
 9 files changed, 198 insertions(+), 197 deletions(-)

-- 
2.49.0.1238.gf8c92423fb-goog

