Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 274201411DE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743615069; cv=none; b=GLjf/17VxzUTq4bNgZuYPv8KbF+0yHFnp9mPR21e6dk7+xY83vGm045H3NHipGtKANyV9TO9o+KIXL8moiTlOlYOzcUbKKvvkZ7LDvtvC1OjCA5Jd9fZ1Mv94VK0I3VJFYNnlmVlSblkoRA9cbJ14laMsYnAdk4pfIxKCcTV+tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743615069; c=relaxed/simple;
	bh=OLR/HRHJE/+kxAiYbmu99nXKOfk9ruZKhS2Q+yM/8Vs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aE5QMRXDeRDNtgTA9sXMMrD5Mbk9+qHO6wuTUT8o1Roxb55DtJddKC9txGjlt6wbRsCb5rMqQHCriSvpui4HhQijjWLV8k7gZ2uMg8rAwBqoz/HpNG+IdMkRv0FAK4LFjL5SJutwzpONuIKjwMDt6Tn3A8GKh9bKkWSjDH8mMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5733C106F;
	Wed,  2 Apr 2025 10:31:08 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AAE03F694;
	Wed,  2 Apr 2025 10:31:03 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2] tools build: Use -fzero-init-padding-bits=all
Date: Wed,  2 Apr 2025 18:30:56 +0100
Message-Id: <20250402173056.829400-1-leo.yan@arm.com>
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

Changes from v1:
Sync comments and code with scripts/Makefile.compiler. (Ian)

 tools/scripts/Makefile.include | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index 0aa4005017c7..51036d5fbce0 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -40,6 +40,30 @@ EXTRA_WARNINGS += -Wwrite-strings
 EXTRA_WARNINGS += -Wformat
 EXTRA_WARNINGS += -Wno-type-limits
 
+# output directory for tests below
+TMPOUT = .tmp_$$$$
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	mkdir -p $(TMPOUT);		\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+# cc-option
+# Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
+cc-option = $(call try-run, \
+	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
+# Explicitly clear padding bits with the initializer '{ 0 }'
+CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 # Makefiles suck: This macro sets a default value of $(2) for the
 # variable named by $(1), unless the variable has been set by
 # environment or command line. This is necessary for CC and AR
-- 
2.34.1

