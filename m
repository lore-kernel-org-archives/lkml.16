Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A3614D29B
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748233994; cv=none; b=BewuiIxDAaECFP5WZabVUZLbKnzFFKofUTbBSffEMv0aBwL1Xxik6unEFM9DBzrdSF377DgF3pgfmuDD1tFsG3RfvswSnK6yRKETdP76en4Ru9DYcw/0Rsl2GknwPeUXYkLNx0zC8DbP/+iLDC87wPbpgmXuRn2GjhOSo22Zwyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748233994; c=relaxed/simple;
	bh=vfujHF/QZsbAY6fnZ8+jww7Il9C4bpQWXm3/AJDvH7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjA45z+b0aaYbvtruSkaJIzEPOTBFq7MEZwskC/vkwW2DxTGq1IUSB8pWrUXSbOjKaXIoo8KiMzcBR0kHO+mfcF9dAqI/od04DKh+vY0o4zuxsa2wiHn1iVeebjc0eyUZmTtYc4en6aFJG7ojMeaiXd5unuLv4AxL50qO16/X7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+sUIg6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+sUIg6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38908C4CEE7;
	Mon, 26 May 2025 04:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748233993;
	bh=vfujHF/QZsbAY6fnZ8+jww7Il9C4bpQWXm3/AJDvH7A=;
	h=Date:From:To:Cc:Subject:From;
	b=p+sUIg6oF6uoDy7lnoT7KDyVlp5gnf6WXQyIu+m5sAP4dK3wP7+K3fEplPRo7fom/
	 MIYmS9usdK26pPu0yk5GeStBUnngVMh9GD10W0e1bB80Dnoo1DDnYr2RkylXgoqhBP
	 qaENmp76urv48UHvBRKcj90TxrM5DqalAffKY+6KmMXRHB85uEh1CiofkPqT0aIf8S
	 Sj1/zU1M3wGFwX2fgbXogpCsXXpg9bOEFkmZ4Iz1u0WhAuAk3DO40cBKtUTzFYN1Bb
	 I71Sk2pcAzoZG3niSrkMNV6jPGj2LKQO0ZPaXeoCVOyVY/mL0kTb6NVQzP5DerqYq9
	 j8dNYccKu2edA==
Date: Mon, 26 May 2025 12:33:02 +0800
From: Gao Xiang <xiang@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Sheng Yong <shengyong1@xiaomi.com>,
	Sandeep Dhavale <dhavale@google.com>, Bo Liu <liubo03@inspur.com>,
	Chao Yu <chao@kernel.org>
Subject: [GIT PULL] erofs updates for 6.16-rc1
Message-ID: <aDPu/jffhb499L49@debian>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Hongbo Li <lihongbo22@huawei.com>,
	Sheng Yong <shengyong1@xiaomi.com>,
	Sandeep Dhavale <dhavale@google.com>, Bo Liu <liubo03@inspur.com>,
	Chao Yu <chao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Linus,

Could you consider this pull request for 6.16-rc1?

In this cycle, Intel QAT hardware accelerators are supported to improve
DEFLATE decompression performance.  I've also tested it with the enwik9
dataset of 1 MiB pclusters on our Intel Sapphire Rapids bare-metal
server and a PL0 ESSD, and the sequential read performance even
surpasses LZ4 software decompression on this setup.

In addition, a `fsoffset` mount option is introduced for file-backed
mounts to specify the filesystem offset in order to adapt customized
container formats.

There are other improvements and minor cleanups shown as below.  All
commits have been in -next, and no potential merge conflicts are
observed.

Thanks,
Gao Xiang


The following changes since commit 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3:

  Linux 6.15-rc6 (2025-05-11 14:54:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git tags/erofs-for-6.16-rc1

for you to fetch changes up to b4a29efc51461edf1a02e9da656d4480cabd24b0:

  erofs: support DEFLATE decompression by using Intel QAT (2025-05-25 15:27:40 +0800)

----------------------------------------------------------------
Changes since last update:

 - Add a `fsoffset` mount option to specify the filesystem offset;

 - Support Intel QAT accelerators to boost up the DEFLATE algorithm;

 - Initialize per-CPU workers and CPU hotplug hooks lazily to avoid
   unnecessary overhead when EROFS is not mounted;

 - Fix file handle encoding for 64-bit NIDs;

 - Minor cleanups.

----------------------------------------------------------------
Bo Liu (1):
      erofs: support DEFLATE decompression by using Intel QAT

Gao Xiang (2):
      erofs: refine readahead tracepoint
      erofs: clean up erofs_{init,exit}_sysfs()

Hongbo Li (1):
      erofs: fix file handle encoding for 64-bit NIDs

Sandeep Dhavale (1):
      erofs: lazily initialize per-CPU workers and CPU hotplug hooks

Sheng Yong (2):
      erofs: avoid using multiple devices with different type
      erofs: add 'fsoffset' mount option to specify filesystem offset

 Documentation/ABI/testing/sysfs-fs-erofs |   8 ++
 Documentation/filesystems/erofs.rst      |   1 +
 fs/erofs/Kconfig                         |  14 +++
 fs/erofs/Makefile                        |   1 +
 fs/erofs/compress.h                      |  10 ++
 fs/erofs/data.c                          |   5 +-
 fs/erofs/decompressor_crypto.c           | 181 +++++++++++++++++++++++++++++++
 fs/erofs/decompressor_deflate.c          |  20 +++-
 fs/erofs/fileio.c                        |   5 +-
 fs/erofs/internal.h                      |   3 +-
 fs/erofs/super.c                         |  65 +++++++++--
 fs/erofs/sysfs.c                         |  67 ++++++++----
 fs/erofs/zdata.c                         |  79 ++++++++++----
 include/trace/events/erofs.h             |   2 +-
 14 files changed, 397 insertions(+), 64 deletions(-)
 create mode 100644 fs/erofs/decompressor_crypto.c
