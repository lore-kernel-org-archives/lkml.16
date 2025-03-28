Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAEE4171092
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743169952; cv=none; b=cjiBC9MKsUM9zc6SK6aXSP+rT/qzt87cKCJ+fO3k8HLE6U/OIsaNrIlot6/FcwJ0Y5Y8/A7yJN7GEnQBMQz3dcpDo91cZAq4u8kLOuUGqvv9geltLQxlgrUGu4PFJVUqD51GLEuEHUi6+URyctaT858t2PLI9Sixs3DZZhU4VAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743169952; c=relaxed/simple;
	bh=+yjkcF4b2dcbI70nQ0EilJ8oLkBOd7kK7kf6pKkeuFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Gw/YipU/YGz62O34cZwKkODExKzlMRa/1lNaywAyPPhC3+IHdQuo4oaWV1sIq9iuQZvpcHl02k6+DqL422/HvoY3oVS+qpeij2d1um41ju9xSc0/Y6DeadJLrXWNQEyKEh0caMSthHmK7D3egfzlv0vbiQPlpwsYV4vDsDo80Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D1481691;
	Fri, 28 Mar 2025 06:52:35 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 81EE83F58B;
	Fri, 28 Mar 2025 06:52:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	James Clark <james.clark@linaro.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH] tools build: Use -fzero-init-padding-bits=all
Date: Fri, 28 Mar 2025 13:52:21 +0000
Message-Id: <20250328135221.10274-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GCC-15 release claims [1]:

  {0} initializer in C or C++ for unions no longer guarantees clearing
  of the whole union (except for static storage duration initialization),
  it just initializes the first union member to zero. If initialization
  of the whole union including padding bits is desirable, use {} (valid
  in C23 or C++) or use -fzero-init-padding-bits=unions option to
  restore old GCC behavior.

As a result, this new behaviour might cause unexpected data when we
initialize a union with using the '{ 0 }' initializer.

Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
in unions and structures.  This commit applies the same option for tools
building.

The option is not supported neither by any version older than GCC 15 and
is also not supported by LLVM, this patch adds the cc-option function to
dynamically detect the compiler option.

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Leo Yan <leo.yan@arm.com>
---

This patch was originally from [1]. After consideration, the top level
of the tools directory is a better place to accommodate this option
rather than perf folder.

[1] https://lore.kernel.org/linux-perf-users/20250320105235.3498106-1-leo.yan@arm.com/

 tools/scripts/Makefile.include | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0aa4005017c7..e912a10afd89 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -40,6 +40,19 @@ EXTRA_WARNINGS += -Wwrite-strings
 EXTRA_WARNINGS += -Wformat
 EXTRA_WARNINGS += -Wno-type-limits
 
+try-run = $(shell set -e;		\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+__cc-option = $(call try-run,\
+	$(1) -Werror $(2) -c -x c /dev/null -o /dev/null,$(2),)
+cc-option = $(call __cc-option, $(CC),$(1))
+
+# Explicitly clear padding bits with the initializer '{ 0 }'
+CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 # Makefiles suck: This macro sets a default value of $(2) for the
 # variable named by $(1), unless the variable has been set by
 # environment or command line. This is necessary for CC and AR
-- 
2.34.1

