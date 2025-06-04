Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242D1DA21
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749007089; cv=none; b=CvcbyKA9vjzRB+hW7tsukOb0IiFMZPl4ys5rmz2cX9hcVTt85etF5wgYa9eG5PDDcozUsQ3LsVNl4/rt2mVPKH8RhalECA9vsWJE8itzMkVfm566QcvwMIwZOTHWL/rJ9W9IQwMt5T1asKKH/GlajmcYtbx4v7Qi82zGWkBb5ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749007089; c=relaxed/simple;
	bh=0ZiCWsWxD8FXyIS2woUnMV1G81roXZ6sK20SkhumZ5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HXWlBjraIpmkggUJLf5OjawWmj+vYziTMAqXyy39LNhiApyEH8p/xcefmnzRUYvb4vVwDyaCGm+QAgHxCRzgLkXrLd+Mj135ArqKV1qtlpVYDVGb6YDP+IA3O7XEiOzYPyXf1ixN7PzP1QL+kJLxbvN3iku2kC5YEZXmMEPF8RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 853e1c6e40f211f0b29709d653e92f7d-20250604
X-CID-CACHE: Type:Local,Time:202506041104+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:e37eb776-1ba1-4d49-9782-a173116750ba,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:6493067,CLOUDID:ee68645b08a44cf72da7de252771bdb6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:5,IP:nil,URL
	:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 853e1c6e40f211f0b29709d653e92f7d-20250604
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <xialonglong@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1550991278; Wed, 04 Jun 2025 11:18:01 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id CC3D916001A01;
	Wed,  4 Jun 2025 11:18:00 +0800 (CST)
X-ns-mid: postfix-683FBAE8-646960652
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id C923C16001CC7;
	Wed,  4 Jun 2025 03:17:59 +0000 (UTC)
From: Longlong Xia <xialonglong@kylinos.cn>
To: akpm@linux-foundation.org,
	xu.xin16@zte.com.cn
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Longlong Xia <xialonglong@kylinos.cn>
Subject: [PATCH 0/2] mm/ksm: calculate ksm_process_profit more accurately
Date: Wed,  4 Jun 2025 11:17:53 +0800
Message-ID: <20250604031758.4150209-1-xialonglong@kylinos.cn>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

During the KSM testing, it was observed that the sum of KSM profits=20
for each process does not equal the general_profit.

The reason is general_profit_show() only considers ksm_pages_sharing,
whereas ksm_process_profit() accounts for both ksm_pages_sharing
and ksm_pages_shared for each process. By concentrating solely on=20
ksm_pages_sharing, we can achieve a more accurate representation=20
of actual profits.

Thanks for review and comments!

Longlong Xia (2):
  mm/ksm: calculate ksm_process_profit more accurately
  mm/ksm: Rename ksm_merging_pages to ksm_process_sharing

 Documentation/admin-guide/mm/ksm.rst          |  6 ++---
 Documentation/filesystems/proc.rst            |  6 ++---
 .../translations/zh_CN/admin-guide/mm/ksm.rst |  8 +++----
 .../translations/zh_TW/admin-guide/mm/ksm.rst |  8 +++----
 fs/proc/base.c                                | 10 ++++-----
 include/linux/mm_types.h                      |  2 +-
 mm/ksm.c                                      | 22 ++++++++-----------
 .../selftests/mm/ksm_functional_tests.c       | 10 ++++-----
 8 files changed, 34 insertions(+), 38 deletions(-)

--=20
2.43.0

