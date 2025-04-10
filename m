Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEE5A47
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744258977; cv=none; b=kGlXbhtLLxZt/QMZ++VOf+qdwjOVJsU9eL8Nb/B+Z5be6ZJq7mfMaviF76SGtdMPibrc+iNKrwxQ9SYynphT7wQvbdw8os5WZK6zSJZb8qcJPaHdqK1vXz+xcOrI9cJrrIPc5z8As0N37KBAmznorg6XrhWQdW0EHmxARZ7KkLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744258977; c=relaxed/simple;
	bh=u2g++OlvdPtqQWi380MO3vZi9vdTWJjl2lDtMfKiV/I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=itHQ3r1FeMtRQNFnhQTVr0sJeTCx0GpenuJi55dkYmQsKJ7Z5lo8u6xBTq3NNiKjX2PRgWc9K9I5XPxodkVpGtOvN0i8vAIXTvES7q7cKqa40zDs0fu2JTMxJVoL6Nc6WwcXMsGf1g9DfAq9pNtqvVjUOeryiUFPVDqTaqSTJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from jtjnmail201622.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101222467137;
        Thu, 10 Apr 2025 12:22:46 +0800
Received: from localhost.localdomain (10.94.13.146) by
 jtjnmail201622.home.langchao.com (10.100.2.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Apr 2025 12:22:46 +0800
From: Bo Liu <liubo03@inspur.com>
To: <xiang@kernel.org>, <chao@kernel.org>
CC: <linux-erofs@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, Bo Liu
	<liubo03@inspur.com>
Subject: [PATCH 0/2] erofs: support deflate decompress by using Intel QAT
Date: Thu, 10 Apr 2025 00:20:46 -0400
Message-ID: <20250410042048.3044-1-liubo03@inspur.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: Jtjnmail201613.home.langchao.com (10.100.2.13) To
 jtjnmail201622.home.langchao.com (10.100.2.22)
tUid: 2025410122246b0df1532b0f6c621da8f7d37d98b692f
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

This patch introdueces the use of the Intel QAT to decompress compressed
data in the EROFS filesystem, aiming to improve the decompression speed
of compressed datea.

We created a 285MiB compressed file and then used the following command to
create EROFS images with different cluster size.
     # mkfs.erofs -zdeflate,level=9 -C16384

fio command was used to test random read and small random read(~5%) and
sequential read performance.
     # fio -filename=testfile  -bs=4k -rw=read -name=job1
     # fio -filename=testfile  -bs=4k -rw=randread -name=job1
     # fio -filename=testfile  -bs=4k -rw=randread --io_size=14m -name=job1

Here are some performance numbers for reference:

Processors: Intel(R) Xeon(R) 6766E(144 core)
Memory:     521 GiB

|-----------------------------------------------------------------------------|
|           | Cluster size | sequential read | randread  | small randread(5%) |
|-----------|--------------|-----------------|-----------|--------------------|
| Intel QAT |    4096      |    538  MiB/s   | 112 MiB/s |     20.76 MiB/s    |
| Intel QAT |    16384     |    699  MiB/s   | 158 MiB/s |     21.02 MiB/s    |
| Intel QAT |    65536     |    917  MiB/s   | 278 MiB/s |     20.90 MiB/s    |
| Intel QAT |    131072    |    1056 MiB/s   | 351 MiB/s |     23.36 MiB/s    |
| Intel QAT |    262144    |    1145 MiB/s   | 431 MiB/s |     26.66 MiB/s    |
| deflate   |    4096      |    499  MiB/s   | 108 MiB/s |     21.50 MiB/s    |
| deflate   |    16384     |    422  MiB/s   | 125 MiB/s |     18.94 MiB/s    |
| deflate   |    65536     |    452  MiB/s   | 159 MiB/s |     13.02 MiB/s    |
| deflate   |    65536     |    452  MiB/s   | 177 MiB/s |     11.44 MiB/s    |
| deflate   |    262144    |    466  MiB/s   | 194 MiB/s |     10.60 MiB/s    |

Bo Liu (2):
  erofs: remove duplicate code
  erofs: support deflate decompress by using Intel QAT

 fs/erofs/decompressor_deflate.c | 145 +++++++++++++++++++++++++++++++-
 fs/erofs/internal.h             |   1 +
 fs/erofs/sysfs.c                |  30 +++++++
 fs/erofs/zdata.c                |   1 -
 4 files changed, 175 insertions(+), 2 deletions(-)

-- 
2.31.1

