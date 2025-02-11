Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409424BCE8
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 13:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739282070; cv=none; b=PMo7OU79zbz4zDOJUiSKOOtRK80NwuFBNUVzOTmkWdfOW3//NQ56LAOJBkxesF8SQpzXrHIUkXH9GY2ZESBkchKVkh0GwhMFnPnIttzXD18IQQCiKwVou1aC4RE8U+r2zC/ygo/JqZ/1wwvelj8v+h1+bCD4AWmDJSiHmkQKP/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739282070; c=relaxed/simple;
	bh=6o/9/2TgKs8pt/4McjQPC6wukpGR/3SZFdK/RbcrO0c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ga3Ga0PofPYHyojOfbGFsr2rwFiaooNH1tU2fM/GEVaNobeAC7xgq0w4VsmaTogY7KURTeBuCbtAEBqwOnLbEXB9LwVB/NVM+jQ+bzfA+hgPcXm4haw2db627zm25K+YKNyNNQkCCNT+2S3ybpjTePqC4VUzJK5/nKDT2SE6BzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4YsjXV2LvXz22mvt;
	Tue, 11 Feb 2025 21:51:22 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
	by mail.maildlp.com (Postfix) with ESMTPS id 38C141401F3;
	Tue, 11 Feb 2025 21:54:14 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 11 Feb
 2025 21:54:13 +0800
From: Hongbo Li <lihongbo22@huawei.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <zbestahu@gmail.com>, <jefflexu@linux.alibaba.com>, <dhavale@google.com>,
	<linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<lihongbo22@huawei.com>
Subject: [PATCH v2 0/4] erofs: file-backed mount supports direct io
Date: Tue, 11 Feb 2025 21:53:27 +0800
Message-ID: <20250211135331.933681-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
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

erofs has add file-backed mount support. In this scenario, only buffer
io is allowed. So we enhance the io mode by implementing the direct
io. Also, this can make the iov_iter (user buffer) interact with the
backed file's page cache directly.

To be mentioned, the direct io is atomic, if the part of the iov_iter
of direct io failed, the whole direct io also fails.

We conduct the basic test on direct io and normal io, the fio is used in
the test, the results show it can decrease the memory overhead. It slower
than normal io in seq read due to erofs page cache and readahead, uut in
rand read direct io is similar than buffer io. The results are reasonable.

v2:
  - Reuse the original erofs_fileio_scan_folio logic and do some construction.

v1:
  - https://lore.kernel.org/all/47f74598-1b2f-4308-a8b8-18fc40bafe6d@linux.alibaba.com/T/

Comments and questions are, as always, welcome.

Thanks,
Hongbo.

Hongbo Li (4):
  erofs: decouple the iterator on folio
  erofs: decouple callback action for fileio bio
  erofs: add erofs_fileio_direct_io helper to handle direct io
  erofs: file-backed mount supports direct io

 fs/erofs/data.c   |  10 ++-
 fs/erofs/fileio.c | 170 ++++++++++++++++++++++++++++++++++++++--------
 2 files changed, 148 insertions(+), 32 deletions(-)

-- 
2.34.1

