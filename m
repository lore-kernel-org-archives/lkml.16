Received: from mailout2.w2.samsung.com (mailout2.w2.samsung.com [211.189.100.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F3128B7E6
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.189.100.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632998; cv=none; b=QDN4BRFJ7Xzyp100I+5gHk7SZ33LEuWZFhWjpcDNeTGnGOv+Ygwclbq5qhTl8R0J9CqR3Z3gAt6k+tOGn3EPCpgaHfmhVecgLQfDuwAFCJHij5obJL945YT01N1TJTxGY+bw8V3jd7JuDDUkLYvY+E9GGFUEdqpaRyL+Id5ZeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632998; c=relaxed/simple;
	bh=a/AUeT5hJArBP52PLtrIadNueqL+AM2Z8lwiI3FRbfE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=aa8NGSYMBnT0nCBPdnqlFhpwbEmOx43w5Ip95QKJZzLkIDCEH6UlmT9qNyv4sUOP6EzR1SniV2Vgc98iT9KJsxctKDCI8JOGnL1JzeaOQWcEormWs6bP5h7syjmOJZ9bWUFnL7Zd2pYfYkuaJCQ9UpTxwwAIS9GB3VyDDI5apqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com; spf=pass smtp.mailfrom=partner.samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Wq85GrEl; arc=none smtp.client-ip=211.189.100.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=partner.samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Wq85GrEl"
Received: from uscas1p2.samsung.com (unknown [182.198.245.207])
	by mailout2.w2.samsung.com (KnoxPortal) with ESMTP id 20250507154119usoutp02da7fad72f0b802cac8bb0d13c4ab8b45~9SPx-M1bf3209432094usoutp02O;
	Wed,  7 May 2025 15:41:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w2.samsung.com 20250507154119usoutp02da7fad72f0b802cac8bb0d13c4ab8b45~9SPx-M1bf3209432094usoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746632479;
	bh=i2+hxfRpq1YeRWUJuUR+XxecKat0PSvfwB1L0Zom2ZY=;
	h=From:To:CC:Subject:Date:References:From;
	b=Wq85GrEltvrdEjF/ebsbY1X+O1FbtZRVMB+I6fgG2eUvxyGMBTsWWU9K3cg/5qqsf
	 woJFk3g76UwuVPaIXx5SbbhGusXGWpt71OBpXuw2ixejMRS1ckirSkA1ZUtQiF3/fC
	 RB80CMmPwKMHOD4ai1twgrBSNPLhDX57O6guAGB8=
Received: from ussmtxp1.samsung.com (u136.gpu85.samsung.co.kr
	[203.254.195.136]) by uscas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d~9SPxyGeP32745527455uscas1p2R;
	Wed,  7 May 2025 15:41:19 +0000 (GMT)
Received: from ATXPVPPTAGT03.sarc.samsung.com (unknown [105.148.161.7]) by
	ussmtxp1.samsung.com (KnoxPortal) with ESMTP id
	20250507154119ussmtxp16f09982c5c707a43153896627c23d355~9SPxpCgJ81490114901ussmtxp1m;
	Wed,  7 May 2025 15:41:19 +0000 (GMT)
Received: from pps.filterd (ATXPVPPTAGT03.sarc.samsung.com [127.0.0.1]) by
	ATXPVPPTAGT03.sarc.samsung.com (8.18.1.2/8.18.1.2) with ESMTP id
	547DqSQo050757; Wed, 7 May 2025 10:41:18 -0500
Received: from webmail.sarc.samsung.com ([172.30.39.9]) by
	ATXPVPPTAGT03.sarc.samsung.com (PPS) with ESMTP id 46df5wb1w4-1; Wed, 07 May
	2025 10:41:18 -0500
Received: from au1-swbuild-p19.eng.sarc.samsung.com (105.148.41.22) by
	au1ppexchange01.sarc.samsung.com (105.148.32.81) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.2.1544.4; Wed, 7 May 2025 10:41:18 -0500
From: Pantelis Antoniou <p.antoniou@partner.samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>, <linux-mm@kvack.org>
CC: <linux-kernel@vger.kernel.org>, Artem Krupotkin <artem.k@samsung.com>,
	Charles Briere <c.briere@samsung.com>, Wade Farnsworth
	<wade.farnsworth@siemens.com>
Subject: [PATCH 0/1] Fix zero copy I/O on __get_user_pages allocated pages
Date: Wed, 7 May 2025 10:41:04 -0500
Message-ID: <20250507154105.763088-1-p.antoniou@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: au1ppexchange01.sarc.samsung.com (105.148.32.81) To
	au1ppexchange01.sarc.samsung.com (105.148.32.81)
X-CFilter-Loop: Reflected
X-Proofpoint-GUID: Uqy8Ifu5S6IefbyZ2YbQZnVuMW1BmdD4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0NyBTYWx0ZWRfXy9jK5XmlwJK5
	TAbQbuSOBEVkdhpGhCK+kjkYuEwMnti8seyiihFKv1wRy6Gs4ZOi6cw5AlXWDz06yRiCn5YSjWs
	BbtbY9mTixg9A05SFHjY6kukPQ1qkbqYdwjhtKQod/Ha0zv91TW2hF8yLIwn8R0kYevfC+6eBa/
	UV7ge1EEZULGzAqET5ddmUcogbc8iQDp22L6+izutKdnb+RfFj3fmqifhjUqKp3hHt2KDM9fbZt
	SNEoAXIh5ztrOwuX4YYI5UYhj4FsceYxcnBSrWjYJVp2O3Yx9ZbYbWPauHv8MAlRHmnsVOymQOr
	Fk0MrEEye/wV4n0za7Su++FjwKY1Qsw8vICDPvSug7rj8kPoetWYf1jS6vTL/8o2+BYV8jY2NQp
	YoyQ+1V1
X-Proofpoint-ORIG-GUID: Uqy8Ifu5S6IefbyZ2YbQZnVuMW1BmdD4
X-Proofpoint-Virus-Version: vendor=baseguard
	engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
	definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam
	score=0 malwarescore=0 clxscore=1011 priorityscore=1501 mlxscore=0
	lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
	mlxlogscore=751 adultscore=0 suspectscore=0 classifier=spam adjust=0
	reason=mlx scancount=1 engine=8.12.0-2504070000 definitions=main-2505070147
X-CMS-MailID: 20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d
X-CMS-RootMailID: 20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d
References: <CGME20250507154119uscas1p2a4055d14ab111fdb94a6378789c38d9d@uscas1p2.samsung.com>

Updates to network filesystems enabled zero copy I/O by using the
netfslib common accessors.

One example of that is the 9p filesystem which is commonly used in qemu
based setups for sharing files with the host.

In our emulation environment we have noticed failing writes when performing
I/O from a userspace mapped DRM GEM buffer object.
The platform does not use VRAM, all graphics memory is regular DRAM memory,
allocated via __get_free_pages

The same write was successful from a heap allocated bounce buffer.

The sequence of events is as follows.

1. A BO (Buffer Object) is created, and it's backing memory is allocated via
   __get_user_pages()

2. Userspace mmaps a BO (Buffer Object) via a mmap call on the opened
   file handle of a DRM driver. The mapping is done via the
   drm_gem_mmap_obj() call.

3. Userspace issues a write to a file copying the contents of the BO.

3a. If the file is located on regular filesystem (like ext4), the write
    completes successfully.

3b. If the file is located on a network filesystem, like 9p the write fails.

The write fails because v9fs_file_write_iter() will call
netfs_unbuffered_write_iter(), netfs_unbuffered_write_iter_locked() which will 
call netfs_extract_user_iter() 

netfs_extract_user_iter() will in turn call iov_iter_extract_pages() which for
a user backed iterator will call iov_iter_extract_user_pages which will call
pin_user_pages_fast() which finally will call __gup_longterm_locked().

__gup_longterm_locked() will call __get_user_pages_locked() which will fail
because the VMA is marked with the VM_IO and VM_PFNMAP flags.

Pantelis Antoniou (1):
  Fix zero copy I/O on __get_user_pages allocated pages

 mm/gup.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

-- 
2.25.1

