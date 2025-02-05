Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333125A63B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716361; cv=none; b=ScsqUPAey1FCR4SOrd9+seAIO+YZ605jxywPASHEXtQSsadKgivSTE43BwVJnbxSV1ikmHu2VMsAPUlCUt1UuJO4Je4GWskb1WOccKRLPBgJBz8ntsp2Uw3WnWF1bhz7KDu7qWAd6xT0+s+vngXb6Vw0ZGOufANZ1kyisDECXVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716361; c=relaxed/simple;
	bh=6kWC3CGv27rLHw7+hSSbZkgExgri2rzxVco2GfThIGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=L8FzB7679+WDWGloBeqAfZhB+ECPLhl9mwzGw8PDqVdC0333K8wXgiSv0sBJjA6+94YQ7k2t1Z/Nz6WotDCSwGuEyPMMmzKw8krsFeWbo18vGbzhbUyP/+VmRIJb3LdJV8X9hdISSKDNDglUHBGvN3z7TYS0LYKR5i6QOyfLjQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NorWGpPk; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NorWGpPk"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250205004555epoutp03e3f76e34e8fa990153026285573c9b23~hKVAZYaaG1038110381epoutp03L
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 00:45:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250205004555epoutp03e3f76e34e8fa990153026285573c9b23~hKVAZYaaG1038110381epoutp03L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1738716355;
	bh=gyAbp65BZY52OF7oU8PdqYwfCQHcrvg8FQL8gMrheNs=;
	h=From:To:Cc:Subject:Date:References:From;
	b=NorWGpPkwD0NYKyBwpXlNZwK99M482L+QCVtqmtu49kYzOiLQkR0EgzBLebiI+5ch
	 cgUgF1hJVknyGumcUjyAhaJfJf06FReVmlk9tbA2DWZGfxBoaPvuo9KqjSjSoTA14/
	 7n0EoKy2xrUUL15BnOH5wldOVM6QJsh7biXgcsFo=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTP id
	20250205004554epcas2p4059053cd79c60b4aa739ce79033bd780~hKU-WDTxY0853808538epcas2p4Q;
	Wed,  5 Feb 2025 00:45:54 +0000 (GMT)
Received: from epsmgec2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4YnhNx2kJMz4x9QF; Wed,  5 Feb
	2025 00:45:53 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmgec2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	E6.F7.22938.1C4B2A76; Wed,  5 Feb 2025 09:45:53 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5~hKU9yu8M-0853808538epcas2p4E;
	Wed,  5 Feb 2025 00:45:52 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250205004552epsmtrp1efe9ee9c5d06b7fc786e34d73a806b8c~hKU9x87ny0314003140epsmtrp1c;
	Wed,  5 Feb 2025 00:45:52 +0000 (GMT)
X-AuditID: b6c32a43-0b1e27000000599a-8a-67a2b4c164be
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	44.A6.18949.0C4B2A76; Wed,  5 Feb 2025 09:45:52 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250205004552epsmtip1b15038db9523d82f05ae9050a8cd4bd2~hKU9iGvz_1692116921epsmtip1i;
	Wed,  5 Feb 2025 00:45:52 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, chengming.zhou@linux.dev, Hyesoo Yu
	<hyesoo.yu@samsung.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg
	<penberg@kernel.org>, David Rientjes <rientjes@google.com>, Joonsoo Kim
	<iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mm: slub: Print the broken data before restoring slub.
Date: Wed,  5 Feb 2025 09:44:22 +0900
Message-ID: <20250205004424.1214826-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBJsWRmVeSWpSXmKPExsWy7bCmqe7BLYvSDXq3CVtM7DGwmLN+DZvF
	xjOfWC2uf3vDaPG38wKrxcruZjaLzXOKLS7vmsNmcW/Nf1aLts//gMSSjUwWE9eIWsxu7GN0
	4PXYOesuu8eCTaUem1Z1snls+jSJ3aPr7RUmjxMzfrN4PLkyncljYcNUZo++LasYPc4sOMLu
	8XmTXAB3VLZNRmpiSmqRQmpecn5KZl66rZJ3cLxzvKmZgaGuoaWFuZJCXmJuqq2Si0+Arltm
	DtD5SgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC8wK94sTc4tK8dL281BIrQwMD
	I1OgwoTsjJe/ZrMV9CtXTNq3iK2B8bp0FyMHh4SAicSWO2VdjFwcQgI7GCV+nV7DCuF8YpT4
	cr6NHcL5xihxq+cMSxcjJ1jHn+k3GCESexklzp27zQbhfGaUaLzUyApSxSagLnFiyzJGEFtE
	gEVi5ffvLCBFzALHmCVe/9nIBJIQFvCSmLhyI1gDi4CqxIoLb8DivAI2Em2vDrJCrJOXuL3m
	JAtEXFDi5MwnYDYzULx562xmkKESAgs5JNbeug7V4CLx99MWqFuFJV4d38IOYUtJvOxvg7KL
	JbYtPswE0dzAKLG54z4zRMJYYtazdkZQ0DALaEqs36UPCSVliSO3oPbySXQc/ssOEeaV6GgT
	gmhUlti/bB7UVkmJR2vboa7xkGg+NhssLiQQKzHh2H/GCYzys5B8MwvJN7MQ9i5gZF7FKJZa
	UJybnppsVGAIj9Xk/NxNjOAkrOW8g/HK/H96hxiZOBgPMUpwMCuJ8J7eviBdiDclsbIqtSg/
	vqg0J7X4EKMpMHwnMkuJJucD80BeSbyhiaWBiZmZobmRqYG5kjhv9Y6WdCGB9MSS1OzU1ILU
	Ipg+Jg5OqQamMsFzDjc7+Zfvu2zzZdf+zVUFE/6rv937Tu3eFmbP+5tWLj18SS80pe0I74HW
	fq9XpzS1LovqPmrTqpv9mIv13WT1qKchQktiDot9NWVKn8umnVjgq5sbOeGNpxunZNbc0Amx
	v1uXpwpG2YjLro1q02P6/fXv/mOvV6wM+iodXDa31EHEX3pZVa/cKxkef487fNNZza40NEu9
	c9cI2e51UE/kvGiN8U1hOdv3Zs5RURee1QgkHtD+afV6p+TsuJDX27q41XscKsMWzImsWdyd
	N+O0V0St7LnVvxyFp++zuH606PY9vZKrKSk8+e2fJ10PY+tJj3xf13rr7pq+DgenVVH73qa3
	N7ycI+Xym1OJpTgj0VCLuag4EQBiwH7kSwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSnO6BLYvSDfpPcFtM7DGwmLN+DZvF
	xjOfWC2uf3vDaPG38wKrxcruZjaLzXOKLS7vmsNmcW/Nf1aLts//gMSSjUwWE9eIWsxu7GN0
	4PXYOesuu8eCTaUem1Z1snls+jSJ3aPr7RUmjxMzfrN4PLkyncljYcNUZo++LasYPc4sOMLu
	8XmTXAB3FJdNSmpOZllqkb5dAlfGy1+z2Qr6lSsm7VvE1sB4XbqLkZNDQsBE4s/0G4xdjFwc
	QgK7GSXeX5/NDpGQlJj1+SQThC0scb/lCCtE0UdGidbvJ8ASbALqEie2LGMEsUUEWCRWfv/O
	AlLELHCJWeLC+/VgCWEBL4mJKzeygtgsAqoSKy68AWvmFbCRaHt1kBVig7zE7TUnWSDighIn
	Zz4Bs5mB4s1bZzNPYOSbhSQ1C0lqASPTKkbJ1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M
	4MjQ0trBuGfVB71DjEwcjIcYJTiYlUR4T29fkC7Em5JYWZValB9fVJqTWnyIUZqDRUmc99vr
	3hQhgfTEktTs1NSC1CKYLBMHp1QDE8PBmiUcV8QOW/477PPnoglzGtvV+x+YhV97h5/675XE
	2b9VUv1XwJkrU+bM6jpgWr/PgOvMD/UDEnXKtlN7JVazccsVx2nv3CRbknAqfpWzo9XikzJP
	iif5ntUr5b36aI/7srtlHL9N1GoLc0WVrz05xCqx9ITv9XJLd3HFG4mJK8KNv+rl9D2559xV
	73jn+Dc+p8R41r3/ymzTV83duyxoi2vpZVafNzHcrpUFb6Uu2Vu3miWu7s990f54+oFZb1SU
	p89RVTuz8+An7ezHRss+3xJ5v72w8+eZNTtMY6/s/iURv/N4yv+fm57O4fD2bz103o792soj
	f17/Nto1Yb9D59aP4e6zLi6cmvv4vLgSS3FGoqEWc1FxIgB4DCaK+wIAAA==
X-CMS-MailID: 20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5
References: <CGME20250205004552epcas2p43c15afa1e9c3e290693bc4921d46b6f5@epcas2p4.samsung.com>

Previously, the restore occured after printing the object in slub.
After commit 47d911b02cbe ("slab: make check_object() more consistent"),
the bytes are printed after the restore. This information about the bytes
before the restore is highly valuable for debugging purpose.
For instance, in a event of cache issue, it displays byte patterns
by breaking them down into 64-bytes units. Without this information,
we can only speculate on how it was broken. Hence the corrupted regions
should be printed prior to the restoration process. However if an object breaks
in multiple places, the same log may be output multiple times.
Therefore the slub log is reported only once to prevent redundant printing,
by sending a parameter indicating whether an error has occurred previously.

Changes in v2:
- Instead of using print_section every time on check_bytes_and_report,
just print it once for the entire slub object before the restore.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
---
 mm/slub.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index ea956cb4b8be..7a9f7a2c17d7 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1182,7 +1182,7 @@ static void restore_bytes(struct kmem_cache *s, char *message, u8 data,
 static pad_check_attributes int
 check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
 		       u8 *object, char *what,
-		       u8 *start, unsigned int value, unsigned int bytes)
+		       u8 *start, unsigned int value, unsigned int bytes, int slab_obj_print)
 {
 	u8 *fault;
 	u8 *end;
@@ -1205,6 +1205,10 @@ check_bytes_and_report(struct kmem_cache *s, struct slab *slab,
 	pr_err("0x%p-0x%p @offset=%tu. First byte 0x%x instead of 0x%x\n",
 					fault, end - 1, fault - addr,
 					fault[0], value);
+	if (slab_obj_print) {
+		print_trailer(s, slab, object);
+		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
+	}
 
 skip_bug_print:
 	restore_bytes(s, what, value, fault, end);
@@ -1268,7 +1272,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
 		return 1;
 
 	return check_bytes_and_report(s, slab, p, "Object padding",
-			p + off, POISON_INUSE, size_from_object(s) - off);
+			p + off, POISON_INUSE, size_from_object(s) - off, 1);
 }
 
 /* Check the pad bytes at the end of a slab page */
@@ -1318,11 +1322,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 
 	if (s->flags & SLAB_RED_ZONE) {
 		if (!check_bytes_and_report(s, slab, object, "Left Redzone",
-			object - s->red_left_pad, val, s->red_left_pad))
+			object - s->red_left_pad, val, s->red_left_pad, ret))
 			ret = 0;
 
 		if (!check_bytes_and_report(s, slab, object, "Right Redzone",
-			endobject, val, s->inuse - s->object_size))
+			endobject, val, s->inuse - s->object_size, ret))
 			ret = 0;
 
 		if (slub_debug_orig_size(s) && val == SLUB_RED_ACTIVE) {
@@ -1331,7 +1335,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 			if (s->object_size > orig_size  &&
 				!check_bytes_and_report(s, slab, object,
 					"kmalloc Redzone", p + orig_size,
-					val, s->object_size - orig_size)) {
+					val, s->object_size - orig_size, ret)) {
 				ret = 0;
 			}
 		}
@@ -1339,7 +1343,7 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 		if ((s->flags & SLAB_POISON) && s->object_size < s->inuse) {
 			if (!check_bytes_and_report(s, slab, p, "Alignment padding",
 				endobject, POISON_INUSE,
-				s->inuse - s->object_size))
+				s->inuse - s->object_size, ret))
 				ret = 0;
 		}
 	}
@@ -1355,11 +1359,11 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 			if (kasan_meta_size < s->object_size - 1 &&
 			    !check_bytes_and_report(s, slab, p, "Poison",
 					p + kasan_meta_size, POISON_FREE,
-					s->object_size - kasan_meta_size - 1))
+					s->object_size - kasan_meta_size - 1, ret))
 				ret = 0;
 			if (kasan_meta_size < s->object_size &&
 			    !check_bytes_and_report(s, slab, p, "End Poison",
-					p + s->object_size - 1, POISON_END, 1))
+					p + s->object_size - 1, POISON_END, 1, ret))
 				ret = 0;
 		}
 		/*
@@ -1385,11 +1389,6 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 		ret = 0;
 	}
 
-	if (!ret && !slab_in_kunit_test()) {
-		print_trailer(s, slab, object);
-		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
-	}
-
 	return ret;
 }
 
-- 
2.48.0

