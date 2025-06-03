Received: from mail-oa1-f73.google.com (mail-oa1-f73.google.com [209.85.160.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CF21531D5
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 22:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988848; cv=none; b=lAI4ApXRc7xI8Zl+UiebPZde8ElNCOvByPXadVs4ZNXt4I+qlEItlKrKb6ioKxxEEbLMXi/xPCGuXWkTGljZpY3fIprf9wR7tIXEPCoWzNHJ/WrgdVIYd6X4zG0zLBhSk1noPTegw7wdlOA2RqxENompkFXR6xDvm6gf+huY8PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988848; c=relaxed/simple;
	bh=hduZuFIuqUufg3qRvz7EfqJxi8VCTStcJd48NQA7LAI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=OyhC/TVrEPuRcuy0JaIKipdWGd8KFbfgvYAG/tG6/OHoxkilgAianPlMIShGppjhLTobYQ+pMf0SXO4zcXJ6r6QfNziUlDd05H0MTVHp6IPDqvMPaq+KzgSqsHvohpufXlViRgLy9dHrcAZxCmCaPnQBJeQrdoHgM0qGHY2d1DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKyaMqJe; arc=none smtp.client-ip=209.85.160.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKyaMqJe"
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-2e9b472cfd1so635192fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 15:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748988845; x=1749593645; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HBvqis6Gd/BZXWR1PaU818LTftivU69Sy8CHjNdsMnI=;
        b=qKyaMqJeNgIcHz22wWe1EiUZr+tSQlS8BqQhH0AZjZJbcn/rWP8MQjeSVp4dTHGXhG
         11K7DZFGczHUHclij6+8mJWotgMegn9sj/i0x6xzXa5oKd6+qsFz2Fd6AG4nfZjGWW6G
         Kd8kl4rbcKxLk7QagBZqH+ONoEHZpr+4BMzK7Ga5zEjfhLugtAIcH5P9rU83GqqxnfLT
         RTDsRTodoRgS2+yTsTqumj4E/sq/O2j6I7JYstwL2jpkZ/DMLNEw8hb/Eqm+IjkVi+2E
         z2Gh1bg/tNvMB1ko84ecJSBDQsSp0/s+QKamzUUDRGcII/JQVq8jGVDwKYVqhDUeZZVf
         qnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988845; x=1749593645;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HBvqis6Gd/BZXWR1PaU818LTftivU69Sy8CHjNdsMnI=;
        b=u8aQ7rw/uinWn4DSBZnku37W3GqsqNcShJN02yv3vFKWK17o6D9Y/AeP08s/dZiUnK
         S9NueVdALQ75uZpjUIVQdnEYHKcYAqvPPedxGefpxXXXhA2Z5QeRrHThBpaQm0PV9Cw0
         V45cCrMkMOFznJm6T5nwIYrbipsmXchH0mrsBhuj5RwNTwPahAP7rOrU9UuXVGNigh8D
         3bRIVjMHJYrsUXg5yVhaTPt0eOwryRmKRRfvI+StCGIwhG/Q4VB7D4jNW3McU0WoF64C
         s+QF1Wtyi1fpr39JrTF7z0PpWcurccgT5iacGl3iTyUWNobdNWT87/S8StTIG508A5pt
         yomg==
X-Forwarded-Encrypted: i=1; AJvYcCVzY0lXO45NkaZ8ealjbhzOhjV8luFVvUx08Sk6byXYlX8K4lGs5PcshlqPLVBMzDX5lJmxEgj75FNJ5zM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz77wViTPNC79pg4HN4Pg1qV83jbDWaJjrmrjbRxzMjEonKEez
	jg67WUll+k1kPrg2vdQRhOnBLhLbmNrC83tvtBoDeNaFbdnFl8poo5yrpw/PkYmUNr8CbMioqa9
	VTdchu+gr9Q==
X-Google-Smtp-Source: AGHT+IGQdxlydEspoa/IRPzLHst/hTjDxEHz14OBx3FOg3qc8iUmmhkOkFokPCY6u/UhkfkGLnOX2+IRxdXd
X-Received: from oabhp23.prod.google.com ([2002:a05:6870:9a97:b0:2e8:febf:9eae])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:164c:b0:2d5:ba2d:80ed
 with SMTP id 586e51a60fabf-2e9bf40e7fbmr293777fac.25.1748988845743; Tue, 03
 Jun 2025 15:14:05 -0700 (PDT)
Date: Tue,  3 Jun 2025 15:13:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250603221358.2562167-1-irogers@google.com>
Subject: [PATCH v1] tools/build: Remove some unused libbpf pre-1.0 feature
 test logic
From: Ian Rogers <irogers@google.com>
To: Namhyung Kim <namhyung@kernel.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Ian Rogers <irogers@google.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	Quentin Monnet <qmo@kernel.org>, James Clark <james.clark@linaro.org>, 
	Tomas Glozar <tglozar@redhat.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Leo Yan <leo.yan@arm.com>, 
	Yang Jihong <yangjihong@bytedance.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Jiri Olsa <jolsa@kernel.org>, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 76a97cf2e169 ("perf build: Remove libbpf pre-1.0 feature
tests") removed the libbpf feature test logic used by perf in favor of
using LIBBPF_MAJOR_VERSION. Remove some build targets that should have
been removed as part of that clean up.

Fixes: 76a97cf2e169 ("perf build: Remove libbpf pre-1.0 feature tests")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/build/Makefile.feature |  6 ------
 tools/build/feature/Makefile | 21 ---------------------
 2 files changed, 27 deletions(-)

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 1f44ca677ad3..05f6671a2d07 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -127,12 +127,6 @@ FEATURE_TESTS_EXTRA :=                  \
          llvm                           \
          clang                          \
          libbpf                         \
-         libbpf-btf__load_from_kernel_by_id \
-         libbpf-bpf_prog_load           \
-         libbpf-bpf_object__next_program \
-         libbpf-bpf_object__next_map    \
-         libbpf-bpf_program__set_insns  \
-         libbpf-bpf_create_map		\
          libpfm4                        \
          libdebuginfod			\
          clang-bpf-co-re		\
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index b8b5fb183dd4..4aa166d3eab6 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -339,27 +339,6 @@ $(OUTPUT)test-bpf.bin:
 $(OUTPUT)test-libbpf.bin:
 	$(BUILD) -lbpf
 
-$(OUTPUT)test-libbpf-btf__load_from_kernel_by_id.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-bpf_prog_load.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-bpf_map_create.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-bpf_object__next_program.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-bpf_object__next_map.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-bpf_program__set_insns.bin:
-	$(BUILD) -lbpf
-
-$(OUTPUT)test-libbpf-btf__raw_data.bin:
-	$(BUILD) -lbpf
-
 $(OUTPUT)test-sdt.bin:
 	$(BUILD)
 
-- 
2.49.0.1204.g71687c7c1d-goog

