Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F632918F5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523715; cv=none; b=BWrWimP7CzQL50EAG4tvK429WyxnAehmOTqH9womAQhcKjBpcSaMLYQrkFkg7sMlij/KTD1LVpQFMKAABUod4he67sdO38EThA8oL+AiSaFlxn7tlgQaK//pFabYJPfNUHYVYC2gJZelrbyNyXTI7c4SIrdDT1iRracw1PtcWBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523715; c=relaxed/simple;
	bh=CEQ5bq26MaGVXtF1obGtBwc+9qzS8kokQ4eIYbXAjN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=T2mZx0Fd0S6bEiE+MGtCg0nErx64vvjZK3EUaC0LyvggTMM43ZUbPYlKnubwTPa4s5KCVrFwyRmXSGYBu4xtOzs2Tufrm21Fi8/PgFvnQZh1dnScqHaLMKTooAQwyZRogJ9zuq+fybj2vzWo1mdojyGSWhlbUj9H4ki1mzITvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZrqHQRHz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZrqHQRHz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745523714; x=1777059714;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CEQ5bq26MaGVXtF1obGtBwc+9qzS8kokQ4eIYbXAjN8=;
  b=ZrqHQRHzunhzMkcYpLyUGaJyu2ECq+Ho0wKzB8c18VBYDaOkQYQu+yEF
   1k2oBzJzz05mhos46xMVAZy/8z57bjU/5i7yDzSD/FwqXPNJ4Bq4yb45t
   nv0Y7w9z+QdfzIWJK1L2FjWv9lDn7w25pWOVPlsNfWy4tcnHtvJL5f2LP
   cEAYkw3u5LM3AQz1sLxpIBx5p7/ZPObPpcc3GHS4F+zIRooFtvEjdKau4
   aHytfZhyko6gaUDu1gT98z3KDEKhgk9D+J3D3MlHz3lyPSiD7xaHWXAd3
   nAQGPMHvJBFrtC3cKOPd4OQk+ttmjPHSdQfxj9qd4P4Smj6prHaCgtIW3
   A==;
X-CSE-ConnectionGUID: f3gIomqLTJaa/A6A6HJPXA==
X-CSE-MsgGUID: s8iBKmAJT3WKDG62AwQ4WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57375608"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57375608"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:41:53 -0700
X-CSE-ConnectionGUID: T9iQWVm4T8SINsS7wqJ3nQ==
X-CSE-MsgGUID: xwf7p7JTR6imKTfiVJaQrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="132448897"
Received: from unknown (HELO hyperion.jf.intel.com) ([10.243.61.29])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 12:41:53 -0700
From: marc.herbert@linux.intel.com
To: Marc.Herbert@linux.intel.com
Cc: Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Changbin Du <changbin.du@intel.com>,
	Tony Ambardar <tony.ambardar@gmail.com>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Alexander Potapenko <glider@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] compiler_types.h: fix "unused variable" in __compiletime_assert()
Date: Thu, 24 Apr 2025 19:40:35 +0000
Message-ID: <20250424194048.652571-1-marc.herbert@linux.intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Marc Herbert <Marc.Herbert@linux.intel.com>

This refines commit c03567a8e8d5 ("include/linux/compiler.h: don't
perform compiletime_assert with -O0") and restores #ifdef __OPTIMIZE__
symmetry by evaluating the 'condition' variable in both compile-time
variants of __compiletimeassert().

As __OPTIMIZE__ is always true by default, this commit does not change
anything by default. But it fixes warnings with _non-default_ CFLAGS
like for instance this:

 make  CFLAGS_tcp.o='-Og -U__OPTIMIZE__'

                 from net/ipv4/tcp.c:273:

 include/net/sch_generic.h: In function ‘qdisc_cb_private_validate’:
 include/net/sch_generic.h:511:30:
            error: unused variable ‘qcb’ [-Werror=unused-variable]

  {
     struct qdisc_skb_cb *qcb;

     BUILD_BUG_ON(sizeof(skb->cb) < sizeof(*qcb));
     ...
  }

Signed-off-by: Marc Herbert <Marc.Herbert@linux.intel.com>
---
 include/linux/compiler_types.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 501cffddc2f4..3f12ca49bb9e 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -525,6 +525,11 @@ struct ftrace_likely_data {
 	 sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
 
 #ifdef __OPTIMIZE__
+/* #ifdef __OPTIMIZE__ is only a good approximation; for instance "make
+ * CFLAGS_foo.o=-Og" defines __OPTIMIZE__, does not elide the
+ * conditional code and can break compilation with wrong error
+ * message(s). Combine with -U__OPTIMIZE__ when needed.
+ */
 # define __compiletime_assert(condition, msg, prefix, suffix)		\
 	do {								\
 		/*							\
@@ -538,7 +543,7 @@ struct ftrace_likely_data {
 			prefix ## suffix();				\
 	} while (0)
 #else
-# define __compiletime_assert(condition, msg, prefix, suffix) do { } while (0)
+# define __compiletime_assert(condition, msg, prefix, suffix) ((void)(condition))
 #endif
 
 #define _compiletime_assert(condition, msg, prefix, suffix) \
-- 
2.49.0

