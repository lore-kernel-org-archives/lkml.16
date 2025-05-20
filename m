Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359FA26D4D2
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747737283; cv=none; b=QLnAYeMjOwuMDt3j6HmJKcXgXATYIlGG7HOW7Jkvbdxm9neLDFLSQ5u72IsIHtQaRspCL72PrP/lHtACbMUtvdQVIN3SVIEb6+C282CxtZq6z2WLknVTs0JIM0YEv9zFddkJlOgoKJaCHS7PDd+fYIxnUP0HlAGFQxg+IBXpEPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747737283; c=relaxed/simple;
	bh=RQTZAenUtcsRiv6Uw1KyiQmpjsuD8ey+uBfLQjI0Zyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=QASPnfaZ/nbIMH0b0EmyyokZ2mceh9kPNIOMaAhvH3JKI3wHiJNvoJuQBAepWdZ2bUJ6kk6FB/4P/bCC70LyZO4I1vuCAz7sfirpH7zzj4jk5yMV8NRQqg5S00tqGWo3Oz5SOhWvcPysuyUSfpI4wtdNtfD2PQPimq9AMuw8744=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1ZSoh69; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1ZSoh69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747737282; x=1779273282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RQTZAenUtcsRiv6Uw1KyiQmpjsuD8ey+uBfLQjI0Zyg=;
  b=j1ZSoh698jEkR9Jzggjuu7mwuCJ2OXl6SkGlWeXwtMLUb31rfxmtTKgj
   kAV27K/K2RcTwi5fict5WACJ/0GO/blw+/pyl2xCPwfQh3Rr/gPjacM5+
   z1TgyNAEScdP1/rtqacYbVvDZm9X7KRwgcx9S93bxd9beMpAvlFLuwtF2
   PDMYqZslDsfqBJbz/BG7BipoJlXedHFnEJSerxHZllSFLBPEKamkrojOF
   BBulzPK8OyNmKy3Gu57DiF1Cv+pzIf5Y5f6eMvWL/ZgXOTx6g7mmUctr0
   XfiFKijOFxTVvV6F9qh6/7cPhsM+ewQrr/d8dLGdagQ9aIkhwIBTF/rN5
   g==;
X-CSE-ConnectionGUID: OXxpMo7XS6amDSYx+1EIig==
X-CSE-MsgGUID: x7BuilAaRTmlHdNBItuyqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="48918041"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="48918041"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:34:41 -0700
X-CSE-ConnectionGUID: sQul3Mq5TjOtqUUF5IcAWg==
X-CSE-MsgGUID: ccpFafcFQcaOgX12Wu+y/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="139555855"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.119])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 03:34:40 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 4065711F741;
	Tue, 20 May 2025 13:34:38 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1uHKIw-001xvl-0S;
	Tue, 20 May 2025 13:34:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 1/1] container_of: Document container_of() is not to be used in new code
Date: Tue, 20 May 2025 13:34:37 +0300
Message-Id: <20250520103437.468691-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There is a warning in the kerneldoc documentation of container_of() that
constness of its ptr argument is lost. While this is a faible suggestion
container_of_const() should be used instead, the vast majority of new code
still uses container_of():

$ git diff v6.13 v6.14|grep container_of\(|wc -l
646
$ git diff v6.13 v6.14|grep container_of_const|wc -l
9

Make an explicit recommendation to use container_of_const().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Greg, Andy,

I guess we generally agree the additional constness check in
container_of_const() is useful, but adding the same check to
container_of() generates warnings -- there are some errors, too -- such as
this one currently:

In file included from /home/sailus/src/linux/include/linux/bcma/bcma.h:14,
                 from /home/sailus/src/linux/arch/x86/kernel/early-quirks.c:17:
/home/sailus/src/linux/include/linux/ssb/ssb.h: In function ‘dev_to_ssb_dev’:
/home/sailus/src/linux/include/linux/ssb/ssb.h:291:14: warning: assignment discards ‘const’ qualifier from pointer target type [-Wdiscarded-qualifiers]
  291 |         wrap = container_of(dev, struct __ssb_dev_wrapper, dev);
      |              ^

As noted above, 646 new missing constness checks were introduced through
container_of() macro use during the 6.14 cycle alone. Most of these are
likely harmless, but with so many new users some are bound to be ignoring
constness.

Once the warnings from bad container_of() use are worked out in a way or
another, the constness check could be added to the container_of() macro
and the current container_of_const() be dropped altogether.

If this patch is accepted, I'll see how to add a warning on container_of()
to checkpatch.pl.

- Sakari

 include/linux/container_of.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/container_of.h b/include/linux/container_of.h
index 713890c867be..40139b52036a 100644
--- a/include/linux/container_of.h
+++ b/include/linux/container_of.h
@@ -13,7 +13,8 @@
  * @type:	the type of the container struct this is embedded in.
  * @member:	the name of the member within the struct.
  *
- * WARNING: any const qualifier of @ptr is lost.
+ * WARNING: any const qualifier of @ptr is lost. DO NOT USE container_of() IN
+ * NEW CODE.
  */
 #define container_of(ptr, type, member) ({				\
 	void *__mptr = (void *)(ptr);					\
@@ -28,6 +29,8 @@
  * @ptr:		the pointer to the member
  * @type:		the type of the container struct this is embedded in.
  * @member:		the name of the member within the struct.
+ *
+ * Always prefer container_of_const() over container_of() in new code.
  */
 #define container_of_const(ptr, type, member)				\
 	_Generic(ptr,							\
-- 
2.39.5

