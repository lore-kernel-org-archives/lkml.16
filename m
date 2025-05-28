Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513971F461A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748402812; cv=none; b=FH4AyJ0fc170WHl0s4cVhqKB4IjekWGFXI/F4nCqXPLCFu+PlZwiyR/rEBQik7+PGSwhjoXNhPRTuj8FlflorSOg3AQ1KpQ0Z20vUrROQ2V7idtgLbW8oTLQDnGM4LNOT/TNfskj2Bxx63RteICjxdX7aweAv/p2qx/UxE0+WSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748402812; c=relaxed/simple;
	bh=i8h7n5g7Yx2jMb7iS2ljtS04TytCEx4tl3E+OmLZXeY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=r9MJXHkQ+BvN0/TOpi0sOfv2xjDYuLZr4Hb6ympjVsxcm6w6VF+jO19r15cbdyrm41mWOczP1hgaGeVmVLu2bKaaO1ip7Gg60krK2NFZixINBKp4CLX/K8UOriHy5KWgzSJjIv5gOdHQSpVowLh/JHy8GWtIh9PP8L96Bn6np3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MnQMpx0W; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MnQMpx0W"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b1442e039eeso2450888a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 20:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748402810; x=1749007610; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zff0XHnUhlPO/m8VZhhkpC6s4Vm+rG87FvJ9ag7e9mc=;
        b=MnQMpx0Wkc1eM2dvpJug20o/44HENBxI6eOIyVk5NDURbIDlfJEXlF62dyTOfrWx7B
         /3aPvIPhSlBrjT3GJDAyRewq0Od14bnhm633WHwstKhml5+pdsGo1+S2jUcp9JBSpSHl
         GK87A7e6Ccd962xsGVcazyxnI/hhmswDPo7sL7EXNGr3GFIV/rlFYkSBZTzVnS62/TGd
         L6Fa1ZTv5EvhSEKMSqBZrieMPU7RToMuL1YBNuXmi3y/3MJHEaFhwZn6oEup5cwgKE9L
         1QGv/BJfXm4go54zMMA+AhP8urwFO2PLD45qu/ZDBJlxlTKB+zn7cYS5xGGP+dhWVI9k
         bxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748402810; x=1749007610;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zff0XHnUhlPO/m8VZhhkpC6s4Vm+rG87FvJ9ag7e9mc=;
        b=VbB2kuLCejVP8S5QnU3ZlhWuRlh0gjfGmPVEnR6tBwZ8ZNXoAXS57NZEN4kTVK4k7B
         Zn2LOx9XqWfpCfkw+TDkEqkineM7uu6I+o/4VF32YGoucOp+sjkdjppCmyds38lHPJLB
         +yIGfOcPKGUFxCgoeY03zuYUO/CpS0Ja7Kda08qGAnJkE4UsfbhhHwEmaoYt5UAE05NM
         dCvTg28/djngm5yienYbUFv0n4KYd0/bxOI0ZOPp4+mwo6f9LM4DcEfYZA/R8fXRSbf7
         9jCyfNB7FVVHM7cwBDEhV1hD+VV9FxuJ/IexenzBd+IHqkMV89Xw27zUue1svJWBw5vP
         /+uA==
X-Forwarded-Encrypted: i=1; AJvYcCWlZB5kc00TVQzPjhOrXuriR7Q7bCheXCkiUG/3EfW7FpvQY2Pcy253jIHMLWyHeyiaU/lVXuu7GIl9/a4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LVKJT3KifkOu3kpR3GWzI9kUZ2fosYkN02njnuA59eN2Tawg
	EAXlZoKOOgvAK5RxraPV8Rkag+3cx9xUQogDg5PAXq0WAxsPKJWzik76wCVyg6qYVU8DMGASOL7
	HILxv/IZFkw==
X-Google-Smtp-Source: AGHT+IHKJ/0qDXr34QCYKZBYCJAvA33TCQrzWCgJUlHJZjfno5vd2Mk/7+DxoSgW8MSUvTLSWTwhIR8Qf/no
X-Received: from pjbse6.prod.google.com ([2002:a17:90b:5186:b0:311:676a:af17])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c0a:b0:2f8:b2c:5ef3
 with SMTP id 98e67ed59e1d1-3110f20cc93mr27240188a91.14.1748402810537; Tue, 27
 May 2025 20:26:50 -0700 (PDT)
Date: Tue, 27 May 2025 20:26:35 -0700
In-Reply-To: <20250528032637.198960-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250528032637.198960-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250528032637.198960-6-irogers@google.com>
Subject: [PATCH v2 5/7] perf test intel-pt: Skip jitdump test if no libelf
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

jitdump support is only present if building with libelf. Skip the
intel-pt jitdump test if perf isn't compiled with libelf support.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/shell/test_intel_pt.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/perf/tests/shell/test_intel_pt.sh b/tools/perf/tests/shell/test_intel_pt.sh
index f3a9a040bacc..32a9b8dcb200 100755
--- a/tools/perf/tests/shell/test_intel_pt.sh
+++ b/tools/perf/tests/shell/test_intel_pt.sh
@@ -288,6 +288,11 @@ test_jitdump()
 	jitdump_incl_dir="${script_dir}/../../util"
 	jitdump_h="${jitdump_incl_dir}/jitdump.h"
 
+        if ! perf check feature -q libelf ; then
+		echo "SKIP: libelf is needed for jitdump"
+		return 2
+	fi
+
 	if [ ! -e "${jitdump_h}" ] ; then
 		echo "SKIP: Include file jitdump.h not found"
 		return 2
-- 
2.49.0.1238.gf8c92423fb-goog

