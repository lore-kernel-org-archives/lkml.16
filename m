Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6F88C0E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966382; cv=none; b=ahDPF4rMnJQeGp4ZVO0NAX9tKAKqyGKUe1rStT5EftUaYRKwDlSkIt7+uk9f949T55rMrpzNRXlEkJaxV5c/F/mCf6o3DrF9HvyPcua0hlchLPk0uiC/eBffRuOLHo+Ik27JyNlruD01DtgVYeOTblGqTrwO752pJ6+sCJ+AP0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966382; c=relaxed/simple;
	bh=dGPAZCJAO9LH9k9+kARVr8e1BoPkjZVxOA21Pk3pjJY=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=h+ZX4E3YUBvS5CunlUJEHI0DL8NKqrbOJ/5aI4xxYHUjCt8fG9b1Qd5BLTrCPXQsbrGkg+o/D7oLyYnzlifIwNxgU+2eHaKyhj/UOBVmNTE0w1jd3yTSzsw6y2QDe524tyQQ8EMrXRKtcAG6wZUNBVw+rxlUJF90GDyQecPu4uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=cuGRZyjK; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="cuGRZyjK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1744966373;
	bh=Shfyo13CoJP0LZK8BYiEvTiymcxKJVPkg/SIqQkMIZo=;
	h=From:To:Cc:Subject:Date;
	b=cuGRZyjKefEmY9JUPCf3NVCVd4QElD6JB6m0Rlid3Q2/nevfpPZvdebx2ZSufjBF9
	 bmGUBECl17TWffntBk5X5QC2ABfvaNXf9Nroe7DNLQN/dRCblRltqyML+bWUK3hw1v
	 twj0Fy1VIpsbig/XJ4J8ex9xe/IFF5+berJlrMcE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 8CC84448; Fri, 18 Apr 2025 16:35:12 +0800
X-QQ-mid: xmsmtpt1744965312t10mud38m
Message-ID: <tencent_A513B1B90557A0084DEE7DAA51C831AF9207@qq.com>
X-QQ-XMAILINFO: McQ2ZMlMYdZ83/0a4mQtvhXIPjb2aFzV0s/wNz6UqnIx85A1D3UDVDmgk65wEo
	 yHWGpSXDIJy6CCW0bkv++iV56yl5kxpYYyY8Ebh9NONwiQt/bjgBJXkxDni1+ekbFInlbvs2vnyu
	 GvnWlM5TZajxlcga1CY7wSwy/anXIEeOmo3aMjby+J4IgMBK0qE1EJf3Bpi43nHZNatkNKzEgeab
	 UmZWe7MfJ64U2Y1IPKc8V9+py792hAmfUXWZu4jYmvgDDewnLfEXHHVieQVo5kxb/OuSieeh+o1d
	 SJFN53cnlPNTFnsVfubXAXWOzQLFKa8/yyOOigo9DW35Fker0nIxxhTbUmwFDbbrkJQJYobdLShW
	 sroHXheDOnxvtIO2ZixiGDFmKIvulEMwNwu2+BrhUg/KGDW0qe8kkKOMYmWotydmMUxVAjvvzDqZ
	 gzc+ifDhEx9iAV+uDSIrLGTLjcVaInr9s+3vJdIjTJ5A2N4MeTcZK7kuFIkW04CUShyO8fD8GipR
	 JKsSVpamjb1v9wW+KYegla9GYWcfjybWCitvp7gYN8LrMro7oDp9xHOliRiMkdTUn6Xwf9Hkarss
	 PgIbdbnVn7hPgx/5OqgqA0a+C4lFBFvS54JI81lyK+iz6FixTsgy90ovjgtlL+0FN/IGhPz8ts3r
	 nSXenJFFkk+xX8t5BcAtDDJm9vVeFCvU6lD4qQWW8UgV/F5kCIgNfLXhxB9DiMEJMRTWJW/cvv6N
	 8DbY1OEAgvLjGgnkMEfb8KzQkvaYS826kR22ww2oLqYojfH0l8ZhygT0S3xdm6lSrztQFinxRejh
	 HmonQiRgxxip6XRpUnBHvoU4vqRucTcFTpG00kSWohlPr49FFayvBISshnf3t8z4GIYayZkZa/Fo
	 ki3JlPJG0PRJBhKYCISMqN/m4CG0u9YuUoxb8HFStGHA2K/G+3+M2J+f7P6kiGs2UTbbVgCRFXFG
	 dYResjft/SbkiEf1fmICdSoh73DPvKFsYLhRFVofBKEYT0+GYlo/8PczevbLeXrha2lTpgbUbemu
	 NgeijRgmP64K4IWqTzkoCqJ2Qt0AqMCKP6rlk2pUpl6MqNDtkL
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: xiaopeitux@foxmail.com
To: linux-kernel@vger.kernel.org,
	f.fangjian@huawei.com,
	robh@kernel.org,
	john.g.garry@oracle.com,
	andriy.shevchenko@linux.intel.com,
	xuwei5@hisilicon.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/2] logic_pio: clean hisi_lpc and logic_pio
Date: Fri, 18 Apr 2025 16:34:59 +0800
X-OQ-MSGID: <cover.1744964101.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

This two patches for hisi_lpc and logic pio.

1.remove unused head file.
2.add comments for logic_pio.

Pei Xiao (2):
  bus: hisi_lpc: remove unused head file in hisi_lpc.c
  logic_pio: Add detailed comments for find_io_range() and
    logic_pio_trans_cpuaddr()

 drivers/bus/hisi_lpc.c |  4 ----
 lib/logic_pio.c        | 16 +++++++++++++++-
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.25.1

