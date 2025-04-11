Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9635278E41
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744368965; cv=none; b=T/ZoA5k7/O+1uvFG6k13lQ4r10bg3CZGQemACD+anEumursMs7dWtiio8c6p9FSpDRClbMCgRcZwGB80vRCF+YE1rBk8YY1ncyzaM8k9CPI1xqeMZiNhnXLXzk5bM3u+/uoqtLD+nyaiq71vtVl/6vmJFEyAMwfM8LlBGfQn5wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744368965; c=relaxed/simple;
	bh=jqDlFIa9nXreIrIE2WW7Y4W6moFZIb47Wmj2ENq+69w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmsmwOV5+g4fqCaLi3xKyUV/t8wETU+vtlaZhbNdseKnylhfK9UcZPlytccOORC8Vnhdrw+7bacCROwQ+6Jy44oiaPRoXPlDSpe4+sIJmGnEE4AQS7RA7DY72WfHPjDId9kK09Thvqsz90VN7SMRy5AV1VrdQhlwIC+apsBqj40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=GInpplfv; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="GInpplfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1744368943;
	bh=/qn0p6J5+xNZBsokBovowNWuCD4lU8aYsY3FHaO7Ed4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GInpplfvQvhXz0fb+6Rb416j3A9zWZQJwF/cY/WkP9jl8mpG/rP1TWMJmM9uW6Sa1
	 9yFDRwMxHyILw3XqFuzVDn9TGkFxQ0TRTzEFqSHmZ7CDxc13PwtzUUF2f3segCJrcB
	 lEyxLPqaABGiSmIYufNXkHj6OMkzPYWoDvis+SHk=
X-QQ-mid: bizesmtp23t1744368937t5884943
X-QQ-Originating-IP: duB2Rjf1ZqJYT5wJj13gyN+cKq8Ml0Z4OVfBpGn4x6c=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 11 Apr 2025 18:55:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14495813504246100742
EX-QQ-RecipientCnt: 5
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Winston Wen <wentao@uniontech.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/7] mm: add __always_inline for page_contains_unaccepted
Date: Fri, 11 Apr 2025 18:54:50 +0800
Message-ID: <9AE63B25D47B2D2F+20250411105459.90782-2-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105459.90782-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NtoEpQAviy6qXJlFSJs65qqOvEITHP48t56wn5y4gvMc3vZ/ZDReLYE7
	sbpP9HHvtmIvJDVw7kR66bARG6152UmO6bL+1pLveAZVvofOc/GMEBggf/iHxAmZ5Y38oM3
	SdUODR/tHOQ/lZW61l+zq5faV1x5E+n8wx+pDtljWChNdpnOvWwQ5wpRiLcyNC8pBUvnU1O
	zG6eDtstuT8nXYCAlEozXWBlTwESm2g7C3Yy7ryMzwKxcX5gDVwa5V+De2wtV+tGK7Rg33i
	CQYqDLkaO6DYI3SyQZJCPj6nkMKI/5DXSUuDV4VvvQpV+hdevf+BfJWXD0oC9XyJzRBn1Jk
	E3h1ptrDh024Jc4nGdNwBJ8OPZtxOFSDazabTo5e8RK5Qm+lGjauqFv3M3ovCDcZGxxJOqh
	6KKiC3lag9hHmy5SzuQ7VofxpzV+tbrQVCplozVX3DYLkNckJuJhMdLSt6LBShVA6HHv2s4
	bsOAm7VFr898QZWgsrn6gv5VW52lCqygioo2mJ2PqOdDY6F7fPlhY0RJnU1LTcRPtWGLQXv
	jLvAVetn+iiUSgkS1eijsJSLpBE2mxS1h9+A7E4JwYP1nRGaOttIihgxo+6xrtOVu5QWGOS
	ONN2VTGHueyW/3zvjhfqqOronkCnolMcQOfQ7F87Z8KU3aawJL6l+nm912k8FugoDqaBUYn
	RfzkOyor4ljgS5+KiYG9imtQen9ciJdxKvEZtOS5dYbeB5bVFnLpyJiyfsqNjclKTgCfmlk
	IG7b2FgsYCOJa1suxHQD5oP539y5TZJYA1llaYNZ38bjfmcvVquSB5vNm5tQPZtK0UVK94N
	VjYiB7ivJpuJvtxUg7LR9IBvdCYH2BQmoLQ0xyFj6RJ7Rhg6CokiTfFHPNRfigIFA+QIYaJ
	2U6rFy0JeDkvdfFnKB8GQmSfAdBpg2jAjQFnVJRMVmNH3yQwBG9M61/Y8+HzahIP3gp3N0h
	pIc+3O5NkaSj6VhRXM/bYNkRyrz+OzKKZXb6dhKp5NKmutgm2piIJ6Ixx56Us+4LSAOarN/
	Wtm34Vi2ru+f5kZ57TFJA+sBeVBkajdimWkUHWEQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

From: Winston Wen <wentao@uniontech.com>

On x86_64 with gcc version 13.3.0, I compile mm/page_alloc.c with:

  make defconfig
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once" \
    mm/page_alloc.o

Then I get a compile error:

    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      mm/page_alloc.o
  In file included from <command-line>:
  mm/page_alloc.c: In function '__free_unaccepted.isra':
  ././include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_1013' declared with attribute error: BUILD_BUG failed
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  ././include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
    538 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  ././include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
        |                     ^~~~~~~~~~~~~~~~
  mm/page_alloc.c:7301:9: note: in expansion of macro 'BUILD_BUG'
   7301 |         BUILD_BUG();
        |         ^~~~~~~~~

Signed-off-by: Winston Wen <wentao@uniontech.com>
Co-Developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fd6b865cb1ab..7c0934c818dd 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7286,7 +7286,7 @@ static bool __free_unaccepted(struct page *page)
 
 #else
 
-static bool page_contains_unaccepted(struct page *page, unsigned int order)
+static __always_inline bool page_contains_unaccepted(struct page *page, unsigned int order)
 {
 	return false;
 }
-- 
2.48.1

