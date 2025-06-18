Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17717155757;
	Wed, 18 Jun 2025 04:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219969; cv=none; b=Cdp7G62fND2YZqX2Q9/t6hHIZnglqF+vecpctJo4VBARx1+VK+37mxu7GU2vrZB0RfFhnvqlTgjtpv60N0TI6Kr9IhtPcX07PJCKiZLh4Z6TY+7o4XSyepinGap0EyAgsmdudBVD5qP4pKsoYDD3nXeyDBWyRHGE1gQzFH7FdOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219969; c=relaxed/simple;
	bh=5iy3jpjdE93os/WkQGjSSWQf0eSkKBsaoPQNj+YzYP0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JuWJMtQjZbNw2UhFlRcPaP5Bj7CWRMZjLrEdOtvmH2+FDT59J+1eOOoWPAkK78aRoiz/inwQ4lNAoy7qRqlXJqRvP1wv+dZ8NbnahpKbaZtFX3a9JZlIl+R1f+Rz5Ilc9UjF3+pSRTRaENGEMElG2AxrZMpEPP7f45nduCD0rrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4FAF614BF;
	Tue, 17 Jun 2025 21:12:25 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E06C3F66E;
	Tue, 17 Jun 2025 21:12:42 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC 0/2] lib/vsprintf: Add support for pte_t
Date: Wed, 18 Jun 2025 09:42:33 +0530
Message-Id: <20250618041235.1716143-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing page table entries has been a common requirement both in generic
and platform memory management for various purposes. Let's just create a
dedicated printk format for such entries which will also help standardize
printing across different platforms.

Also add a test for this new print format in lib/tests/printf_kunit.c via
CONFIG_PRINTF_KUNIT_TEST.

This series applies on v6.16-rc2

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-mm@kvack.org

Anshuman Khandual (2):
  lib/vsprintf: Add support for pte_t
  kunit: printf: Add test case for pte_t

 Documentation/core-api/printk-formats.rst | 14 ++++++++++++
 lib/tests/printf_kunit.c                  | 26 +++++++++++++++++++++++
 lib/vsprintf.c                            | 20 +++++++++++++++++
 mm/memory.c                               |  5 ++---
 scripts/checkpatch.pl                     |  2 +-
 5 files changed, 63 insertions(+), 4 deletions(-)

-- 
2.30.2

