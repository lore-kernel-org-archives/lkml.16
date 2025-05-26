Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A4B1F8BC6
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748266102; cv=none; b=fFzQAlxP1irxgDsJWy5+Aue+klYi46oSCjCVQRBAWrspbhuthN5xydK2Y1P/ZvvA9w02NFL106zMKKdOOzTUwhP+c7AZqsvhPJkIWTalmkTPXgeY7UFoIJXZOxQcIN86n0+pMznV0F41aQm7/crBZ+Zs9b4Y93UWg9kZzycwq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748266102; c=relaxed/simple;
	bh=jWGCVJvCwWmqnY7C1gLvFAf5WbhXCFFFGXco88wozQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-type; b=ibn2yy8Zg+AWTyLWgLnIns0oTUJzNYyvkQ3yESXEAdMtcOyxHeXvyqxrjoqt5vOxIKu1Tw7WD5UA5dKaUqEilFVy5psOvAa8bSLdm0JtxqeKFqL0RZY0PlzyHOy6ab1E0TQ+pyj1lmd82io3+Rn7020jcGLPpjwB70u/y/PtGWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JpyZ54xJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JpyZ54xJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748266099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:  content-type:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CaDjeuor3qvehrWwyZqxrxslYPrtt2O/kVi0sHBOQXY=;
	b=JpyZ54xJTzOqCSyKy+U2DJ0jer4BNO9mh56hwkZxPMrf0KxtTPq/7hQRWBeO9Pyjt3BMcG
	mNqORJN5oPxOG9Zj8kLq8J/nVFc30W5a42dEVCKBdEj56ucBt0mdVHL+WjBrO9y654gLLM
	sB0c/Lz8VHT1eLCx3ezYMcLgux0Ep/M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-CG1531BQPf2Tcu656j5n6g-1; Mon, 26 May 2025 09:28:16 -0400
X-MC-Unique: CG1531BQPf2Tcu656j5n6g-1
X-Mimecast-MFC-AGG-ID: CG1531BQPf2Tcu656j5n6g_1748266095
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4cfda0ab8so649463f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748266095; x=1748870895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaDjeuor3qvehrWwyZqxrxslYPrtt2O/kVi0sHBOQXY=;
        b=GMa6vTkmQe22B6AQlfE9qm86yruTxk9XW6xz82f/Kxl2sBEsGRJmxj53ey9gHJE/wb
         /ybGMZPdNlaGRLy3CWmF6Rti67gs9G0Cmf4x/gTMSdDD7L7lCxTnCpBG+S1heRa2hR6u
         TiQ6jsWoasFXjW8sFjo7PFdelcyXrn1c8iSG8NqWrF7JWlq475D0npoL+5p/e191CAq5
         xzwurhCJuKXq52Ymr7agBdM5WByxUmuPVigjo5TuAGb8bbrc+eTMnbjkgUef7/n5VMGX
         /jMwTjhdDKuqDXj1BVCO6E95hzB/WzRDM1BPzBqx6M52qwQGvQFIBGrCvsJOE+w3DMum
         sU1w==
X-Forwarded-Encrypted: i=1; AJvYcCUgQ4rGfzUBrJzNoZaQTQpT9ICsENB8a/S7T9Acst9c5/As+JHPg/1bCKq3r7p4TlRrOR5qiesUvkdZKB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzddVhStaGpc3lgLP+KsitxnPwq94Ano5Gs0WgY/rfPMh2fLS84
	W+dBDC4hRtBAsfpHERM29nJ649tdAMN1AzYbexd36Ld9SBZTCyWgw8Z29WmIH6xdc1SWnE0NqEo
	UxfyMPIXJTSzmqW8SbEBfWYErI8r6cISK+wResxAaybK0n139pCmabxK3BbFevnhxHQ==
X-Gm-Gg: ASbGncvSjsCiuY3T1Ppn5hEXE1E8ZesmR7wet0sunYCOSs1zCUa00bu2QnkpzE2FWcW
	NEWeF0p9jtGJBLyojsPfRWTa3YFZu6Opj+jboX7a2EQRZJ/5vPR+Udp9J0rssxoV2D8gM7avUiQ
	IYabPfn3Be5NVEHb4Ck93HnzEdkDAcWXh8UKIWARP3yYMU2Aq44gEl2QhCWAbnKAv6KULEcva94
	uHnno/m51MpZdRVKtuyhSB9bqfLRvdBWP45QTcfb6w++Z2eqhRoiJoH/YL3lSYIRsRLDHnymhHG
	hSg3nxyeFl5v+msH
X-Received: by 2002:a05:6000:2301:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a4da873b5dmr1710149f8f.42.1748266094795;
        Mon, 26 May 2025 06:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeYvbzrZNcWcmW1qUBxQajDh+d2LT6ajoVkh4KOQZsRA+0DvHZ1ZoRl+TxtNrpzzd9byku2A==
X-Received: by 2002:a05:6000:2301:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a4da873b5dmr1710127f8f.42.1748266094346;
        Mon, 26 May 2025 06:28:14 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4c8455e7dsm8836663f8f.9.2025.05.26.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 06:28:13 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
To: linux-kselftest@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v5 0/5] kunit: Add support for suppressing warning backtraces
Date: Mon, 26 May 2025 13:27:50 +0000
Message-Id: <20250526132755.166150-1-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons:
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address the problem would be to add messages such as
"expected warning backtraces start/end here" to the kernel log.
However, that would again require filter scripts, might result in
missing real problematic warning backtraces triggered while the test
is running, and the irrelevant backtrace(s) would still clog the
kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum.

Overview:
Patch#1 Introduces the suppression infrastructure.
Patch#2 Mitigate the impact at WARN*() sites.
Patch#3 Adds selftests to validate the functionality.
Patch#4 Demonstrates real-world usage in the DRM subsystem.
Patch#5 Documents the new API and usage guidelines.

Design Notes:
The objective is to suppress unwanted WARN*() generated messages.

Although most major architectures share common bug handling via `lib/bug.c`
and `report_bug()`, some minor or legacy architectures still rely on their
own platform-specific handling. This divergence must be considered in any
such feature. Additionally, a key challenge in implementing this feature is
the fragmentation of `WARN*()` messages emission: specific part in the
macro, common with BUG*() part in the exception handler.
As a result, any intervention to suppress the message must occur before the
illegal instruction.

Lessons from the Previous Attempt
In earlier iterations, suppression logic was added inside the
`__report_bug()` function to intercept WARN*() messages not producing
messages in the macro.
To implement the check in the check in the bug handler code, two strategies
were considered:

* Strategy #1: Use `kallsyms` to infer the originating functionid, namely
  a pointer to the function. Since in any case, the user interface relies
  on function names, they must be translated in addresses at suppression-
  time or at check-time.
  Assuming to translate at suppression-time, the `kallsyms` subsystem needs
  to be used to determine the symbol address from the name, and again to
  produce the functionid from `bugaddr`. This approach proved unreliable
  due to compiler-induced transformations such as inlining, cloning, and
  code fragmentation. Attempts to preventing them is also unconvenient
  because several `WARN()` sites are in functions intentionally declared 
  as `__always_inline`.

* Strategy #2: Store function name `__func__` in `struct bug_entry` in
  the `__bug_table`. This implementation was used in the previous version.
  However, `__func__` is a compiler-generated symbol, which complicates
  relocation and linking in position-independent code. Workarounds such as
  storing offsets from `.rodata` or embedding string literals directly into
  the table would have significantly either increased complexity or
  increase the __bug_table size. 
  Additionally, architectures not using the unified `BUG()` path would 
  still require ad-hoc handling. Because current WARN*() message production
  strategy, a few WARN*() macros still need a check to suppress the part of
  the message produced in the macro itself.

Current Proposal: Check Directly in the `WARN()` Macros.
This avoids the need for function symbol resolution or ELF section
modification.
Suppression is implemented directly in the `WARN*()` macros.

A helper function, `__kunit_is_suppressed_warning()`, is used to determine
whether suppression applies. It is marked as `noinstr`, since some `WARN*()`
sites reside in non-instrumentable sections. As it uses `strcmp`, a
`noinstr` version of `strcmp` was introduced.
The implementation is deliberately simple and avoids architecture-specific
optimizations to preserve portability. Since this mechanism compares
function names and is intended for test usage only, performance is not a
primary concern.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

Changes since v2:
- Rebased to v6.9-rc2
- Added comments to drm warning suppression explaining why it is needed.
- Added patch to move conditional code in arch/sh/include/asm/bug.h
  to avoid kerneldoc warning
- Added architecture maintainers to Cc: for architecture specific patches
- No functional changes

Changes since v3:
- Rebased to v6.14-rc6
- Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lists tests"
  since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
- Added __kunit_ and KUNIT_ prefixes.
- Tested on interessed architectures.

Changes since v4:
- Rebased to v6.15-rc7
- Dropped all code in __report_bug()
- Moved all checks in WARN*() macros.
- Dropped all architecture specific code.
- Made __kunit_is_suppressed_warning nice to noinstr functions.

Alessandro Carminati (2):
  bug/kunit: Core support for suppressing warning backtraces
  bug/kunit: Suppressing warning backtraces reduced impact on WARN*()
    sites

Guenter Roeck (3):
  Add unit tests to verify that warning backtrace suppression works.
  drm: Suppress intentional warning backtraces in scaling unit tests
  kunit: Add documentation for warning backtrace suppression API

 Documentation/dev-tools/kunit/usage.rst |  30 ++++++-
 drivers/gpu/drm/tests/drm_rect_test.c   |  16 ++++
 include/asm-generic/bug.h               |  48 +++++++----
 include/kunit/bug.h                     |  62 ++++++++++++++
 include/kunit/test.h                    |   1 +
 lib/kunit/Kconfig                       |   9 ++
 lib/kunit/Makefile                      |   9 +-
 lib/kunit/backtrace-suppression-test.c  | 105 ++++++++++++++++++++++++
 lib/kunit/bug.c                         |  54 ++++++++++++
 9 files changed, 316 insertions(+), 18 deletions(-)
 create mode 100644 include/kunit/bug.h
 create mode 100644 lib/kunit/backtrace-suppression-test.c
 create mode 100644 lib/kunit/bug.c

-- 
2.34.1

