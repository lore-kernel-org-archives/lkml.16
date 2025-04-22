Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D970D1F2B83
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325923; cv=none; b=AJK1AoxqhNXeRL6awhGK0t6TBqASTKJm8gJmSQlz270asX4GiBK2B51awh+4BBqfIWNP/axwGhslgXykDPtRyzG53h3trURaLIWBPlnZxAsJ1TY/D6u/Uq4aM8hIhg6+jyV4Wa1FoTF2riSuzwj1SVmNQ3yYt/NgbzszvnHTa1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325923; c=relaxed/simple;
	bh=wWEDt570HygBwpRK15+thk9Cpqh2/1oMStxh91ZqZTY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fq0CbVkGogCpDxi0jh8WaXVLe3h2YFWsDXZ3OF7uaOIiSEdEDxryPU0+lCE8oD5t0N9/nX/KCT52tONGJCYyvDpujTtBzRw3pTaslkmJVeiPyMuajiOrXzXzBXhTdZxs3esXtM3VaGKcog66kPh8nAoRKIKW3iifcwN182W4cG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Zhhlg3S2Tz1j5wk;
	Tue, 22 Apr 2025 20:45:03 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 69CA11402CE;
	Tue, 22 Apr 2025 20:45:18 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 22 Apr
 2025 20:45:17 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>, <huyue2@coolpad.com>,
	<jefflexu@linux.alibaba.com>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH RFC 0/4] erofs-utils: Add --meta_fix and --meta_only format options
Date: Tue, 22 Apr 2025 12:36:08 +0000
Message-ID: <20250422123612.261764-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemo500009.china.huawei.com (7.202.194.199)

In this patchset, we have added two formatting options --meta_fix and
--meta_only to extend the ability of EROFS. In the case of using OBS,
we can convert the directory tree structure from OBS into the erofs
image and implement on-demand loading logic based on this. Since OBS
objects are often large, we need to separate the metadata area from
the data area, which is the reason we introduce the --meta_fix option.
To accelerate the formatting process, we can skip the formatting of
the raw data by adding --meta_only option.

A simple usage example is as follows:
  1. Build one xattr with OBS key in s3fs.
  2. mkfs.erofs --meta_fix --meta_only data.img /mnt/s3fs to format
  3. Implement the loading logic in kernel or userspace.

Based on the above logic, we can easily expose the directory tree
from OBS to users in the form of the EROFS file system and implement
on-demand data loading for large OBS objects.

Hongbo Li (4):
  erofs-utils: lib: introduce --meta_fix format option
  erofs-utils: lib: Implement the main logic for --meta_fix option
  erofs-utils: lib: add --meta_only format option
  erofs-utils: lib: remove the compile warning

 include/erofs/blobraw.h |  29 +++++++++
 include/erofs/config.h  |   2 +
 lib/Makefile.am         |   3 +-
 lib/blobraw.c           | 129 ++++++++++++++++++++++++++++++++++++++++
 lib/decompress.c        |   3 +
 lib/inode.c             |   6 ++
 mkfs/main.c             |  49 +++++++++++++++
 7 files changed, 220 insertions(+), 1 deletion(-)
 create mode 100755 include/erofs/blobraw.h
 create mode 100755 lib/blobraw.c

-- 
2.22.0

