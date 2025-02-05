Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BF1227BAC
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716468; cv=none; b=X3rvcQHzEpPekssUR6XCWwqd4dIEyfaqJleOYlOFhjcbPn5nMV4zTAsWLKW0/lS28jUcNjmR/FgIL5H44/zM703UzgY3xYvAHwvJSqLg1Ec2F0eBxYFK67gx+BziPQZ6D40+5i6sui3tWDXiJ9fz6eaoGZHyQuOHvn13JDGSr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716468; c=relaxed/simple;
	bh=4vSnt0WDfOYnvS47H/cEChcrirG3q9HPvgmZjfLBzfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=FF3YpTk81+LXqESej5A5uqU5AyD/9PsuOsOAhyrRhvFnp2T4cg7VxxCdH795x2n1ENpkVc/7aJAtZnNSGvkJ5+95358cAW1svJadiynrjFNBn8VVmEIXmPemaIel25+iExZSgdftrSBm4sZy6omMl0XJGwn7TReBJC/o8v14IY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jnjqiXQe; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jnjqiXQe"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250205004743epoutp04243b7e10c81446b2889643aa81b34381~hKWk2jg2i2177621776epoutp04U
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:47:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250205004743epoutp04243b7e10c81446b2889643aa81b34381~hKWk2jg2i2177621776epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738716463;
	bh=uwDTXPOl/iFjYULcYF/gvbwf7NyMWagWNtqOiYY00EA=;
	h=From:To:Cc:Subject:Date:References:From;
	b=jnjqiXQelEQ30yXm1OYe0+kcV4gmZ7v1/rD3BZuFLiUuujTla5qzGCD2JFLylpCIh
	 W4efAimIvtSyQ+ay3AkzG1osPah8k8//phAypDkilszaDGvsVOj9a8bipTel2/ox0A
	 y+snSxGcWhQM9R4AflvwFK40aXWzwmhbRqeX3zHE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTP id
	20250205004742epcas2p39369e1aeaa917b4f574edd9f2ae100b9~hKWkWU-cn0090700907epcas2p3W;
	Wed,  5 Feb 2025 00:47:42 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YnhR16Wbzz4x9Q7; Wed,  5 Feb
	2025 00:47:41 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	79.45.22094.D25B2A76; Wed,  5 Feb 2025 09:47:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64~hKWjJN-sv0319703197epcas2p3p;
	Wed,  5 Feb 2025 00:47:41 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250205004741epsmtrp117728312c8a0ae238979b29757a011f5~hKWjIeT1j0427704277epsmtrp1F;
	Wed,  5 Feb 2025 00:47:41 +0000 (GMT)
X-AuditID: b6c32a48-e7eec7000000564e-e1-67a2b52dec1a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	BF.3D.18729.C25B2A76; Wed,  5 Feb 2025 09:47:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250205004740epsmtip17daa410f5afdbcd7fc5f9c8b425d615d~hKWi5gr0X1698316983epsmtip1j;
	Wed,  5 Feb 2025 00:47:40 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, Hyesoo Yu <hyesoo.yu@samsung.com>, Christoph
	Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David Rientjes
	<rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton
	<akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, Roman
	Gushchin <roman.gushchin@linux.dev>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: slub: call WARN() instead of pr_err on slab_fix.
Date: Wed,  5 Feb 2025 09:46:12 +0900
Message-ID: <20250205004615.1253389-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMJsWRmVeSWpSXmKPExsWy7bCmma7u1kXpBptuGFlM7DGwmLN+DZvF
	9W9vGC3+dl5gtVjZ3cxmsXlOscXlXXPYLO6t+c9q0fb5H5BYspHJYuIaUYvZjX2MDjweO2fd
	ZfdYsKnUY9OqTjaPTZ8msXt0vb3C5HFixm8WjydXpjN5LGyYyuzRt2UVo8eZBUfYPT5vkgvg
	jsq2yUhNTEktUkjNS85PycxLt1XyDo53jjc1MzDUNbS0MFdSyEvMTbVVcvEJ0HXLzAG6XEmh
	LDGnFCgUkFhcrKRvZ1OUX1qSqpCRX1xiq5RakJJTYF6gV5yYW1yal66Xl1piZWhgYGQKVJiQ
	nXHixS3GggkiFTOurWRuYPzK38XIySEhYCLRtvItUxcjF4eQwA5GiWfTH7FBOJ8YJY7s+gmV
	+cYo8aJ5BQtMy/03X9khEnsZJY5/ncgM4XxmlHg/t58JpIpNQF3ixJZljCC2iACLxMrv38G6
	mQVWMUv0vjAHsYUFPCReb7vADGKzCKhK7H78mg3E5hWwkdj1+CUTxDZ5idtrTrJAxAUlTs58
	AjVHXqJ562ywxRICMzkkNq2axgbR4CJxbt51qGZhiVfHt7BD2FISL/vboOxiiW2LDzNBNDcw
	SmzuuM8MkTCWmPWsHehqDqANmhLrd+mDmBICyhJHbkHt5ZPoOPyXHSLMK9HRJgTRqCyxf9k8
	aABJSjxa284KYXtIHJn9DewyIYFYifX/D7FNYJSfheSbWUi+mYWwdwEj8ypGsdSC4tz01GKj
	AhN4rCbn525iBKdeLY8djLPfftA7xMjEwXiIUYKDWUmE9/T2BelCvCmJlVWpRfnxRaU5qcWH
	GE2B4TuRWUo0OR+Y/PNK4g1NLA1MzMwMzY1MDcyVxHmrd7SkCwmkJ5akZqemFqQWwfQxcXBK
	NTBFTc0/wcng9OyGgWCS4Ord/JVdPFHms2VYLt5RvZVtU8a3XOn4z2imtiLmZSm5kgmVlnW5
	s5s+HEgsPTZp3z2P4Cj9kocP2K7oCrN/8jsjbfb59Sb/A3/PXbol8EqBc4XZIqaj031urmhI
	V2xMCb/oVBuZ2JA5Y0/AcpPUP/c+hr0/kn5QfmkqR0gq/5dze067Sc8NOXdH/9kr0WDNO/fq
	r8Qav9o0ueABo8/VmndZ4leOWptHxmx9dSvzXF5hyMy/AR/M48s6z54/9fpSkqeAy1GvhWbB
	09/N+PDOn3nN/b0H6ir5E691l5tPs8iUWWKwYXeGnmeb3i8t57/GwoZxn7sNg5ZweWvdWRJV
	+U6JpTgj0VCLuag4EQB8SLG2RgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMLMWRmVeSWpSXmKPExsWy7bCSnK7u1kXpBjuPMVpM7DGwmLN+DZvF
	9W9vGC3+dl5gtVjZ3cxmsXlOscXlXXPYLO6t+c9q0fb5H5BYspHJYuIaUYvZjX2MDjweO2fd
	ZfdYsKnUY9OqTjaPTZ8msXt0vb3C5HFixm8WjydXpjN5LGyYyuzRt2UVo8eZBUfYPT5vkgvg
	juKySUnNySxLLdK3S+DKOPHiFmPBBJGKGddWMjcwfuXvYuTkkBAwkbj/5it7FyMXh5DAbkaJ
	2Q172SESkhKzPp9kgrCFJe63HGGFKPrIKPFsyn5GkASbgLrEiS3LwGwRARaJld+/s4AUMQts
	Y5a4cXAeG0hCWMBD4vW2C8wgNouAqsTux6/B4rwCNhK7Hr+E2iAvcXvNSRaIuKDEyZlPwGxm
	oHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iwwDAvtVyvODG3uDQvXS85P3cTIzgetDR3
	MG5f9UHvECMTB+MhRgkOZiUR3tPbF6QL8aYkVlalFuXHF5XmpBYfYpTmYFES5xV/0ZsiJJCe
	WJKanZpakFoEk2Xi4JRqYIp84rJKml3///dZd7P2XI6fObFr7b6U6R+fZBTPOz9tnadfqc5K
	hdfxvDMrel+7LJbh9rJbxKF7ov/7hg0n0jcdPBgZ1VcVoNL8zdmuuvWdZmQjmxeLd+y3o3qa
	/AuKrXSVP+85f/neh0lHBBav2zN5ZqV+ge5czTbTLTmT13Hr2oneLn/zZzk399WTZdYJa0pj
	9su7Xq1ZM3vx8Ud7PqfOTuFzf5Pwc/nRlLtBsocvnOVPucQw43zA1e0T+pZ86yublSGsUiBT
	zXM9g3vNQwEVtYdTp5t/9ZjybsO0Yn19FovaNxPdPnrKPQsRyzbq4dzO+HFNeeiP7blnfv54
	+XMpc2Za/+cohpKDP9gj92kpsRRnJBpqMRcVJwIAQPTDjPYCAAA=
X-CMS-MailID: 20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64
References: <CGME20250205004741epcas2p3081bc2c97b7c1c27a9797cd498c4bc64@epcas2p3.samsung.com>

If a slab object is corrupted or an error occurs in its internal
value, continuing after restoration may cause other side effects.
At this point, it is difficult to debug because the problem occurred
in the past. It is better to use WARN() instead of pr_err to catch
errors at the point of issue because WARN() could trigger panic for
system debugging when panic_on_warn is enabled. WARN() should be
called prior to fixing the value because when a panic is triggered by WARN(),
it allows us to check corrupted data.

Changes in v2:
- Replace direct calling with BUG_ON with the use of WARN in slab_fix.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 mm/slub.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 1f50129dcfb3..ea956cb4b8be 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1043,7 +1043,7 @@ static void slab_fix(struct kmem_cache *s, char *fmt, ...)
 	va_start(args, fmt);
 	vaf.fmt = fmt;
 	vaf.va = &args;
-	pr_err("FIX %s: %pV\n", s->name, &vaf);
+	WARN(1, "FIX %s: %pV\n", s->name, &vaf);
 	va_end(args);
 }
 
@@ -1106,8 +1106,8 @@ static bool freelist_corrupted(struct kmem_cache *s, struct slab *slab,
 	if ((s->flags & SLAB_CONSISTENCY_CHECKS) &&
 	    !check_valid_pointer(s, slab, nextfree) && freelist) {
 		object_err(s, slab, *freelist, "Freechain corrupt");
-		*freelist = NULL;
 		slab_fix(s, "Isolate corrupted freechain");
+		*freelist = NULL;
 		return true;
 	}
 
@@ -1445,9 +1445,9 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
 				set_freepointer(s, object, NULL);
 			} else {
 				slab_err(s, slab, "Freepointer corrupt");
+				slab_fix(s, "Freelist cleared");
 				slab->freelist = NULL;
 				slab->inuse = slab->objects;
-				slab_fix(s, "Freelist cleared");
 				return 0;
 			}
 			break;
@@ -1464,14 +1464,14 @@ static int on_freelist(struct kmem_cache *s, struct slab *slab, void *search)
 	if (slab->objects != max_objects) {
 		slab_err(s, slab, "Wrong number of objects. Found %d but should be %d",
 			 slab->objects, max_objects);
-		slab->objects = max_objects;
 		slab_fix(s, "Number of objects adjusted");
+		slab->objects = max_objects;
 	}
 	if (slab->inuse != slab->objects - nr) {
 		slab_err(s, slab, "Wrong object count. Counter is %d but counted were %d",
 			 slab->inuse, slab->objects - nr);
-		slab->inuse = slab->objects - nr;
 		slab_fix(s, "Object count adjusted");
+		slab->inuse = slab->objects - nr;
 	}
 	return search == NULL;
 }
-- 
2.48.0

