Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF441FDA94
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324444; cv=none; b=C2Gmh7wFVKR/Fh7JtGtT08AUY5D/BuFu2xEkTOzXBPmEL7EoTcIGv1QdVdFbW64KkAXMTPTMwTaTi4VHreGy89GuQ6h55+bPYYEjRp1dKdpndMfiPcfAEChaklqMzxlHkH60dyRh+U8TQmfNWFag5YhXW4MfcjJ28ZYHNFy1Mo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324444; c=relaxed/simple;
	bh=0agyOukoGRm94VWNyqLFSBxmZlyVUx0kX7jQMQPjlZs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNOn0rGQPaMYgsMPNm6LUCxiGSiG9IVu7u5y2Rf3aP1v992EafK2w0uA+f9XWJZoe4eGEicvRuaKEb708IkJNMD6mXjB+g+27sMoa6NUHMwpmNeyKOy5QZyguT5ht0o39h7glnBAI9pr1EakRuNp/wj4oQXby6gxGH8ONT1NI2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YeERTYnr; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YeERTYnr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1745324318;
	bh=5SCNpT7fxknXxFl2jrf1TuKGByQegnZorIene7qFnoQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=YeERTYnr0iPBwxxu585clwjh6tne9u4UQOglhCHm7R0UmmJ/e2yRmV/kyLl0a+3/P
	 pZ+pyWJvGsKBWJ5HykWHiiK18r+D20E3JiswMrxfcZmo+jHjyW3XO2p+aApJsfG5uI
	 wJ1I6zDmaEUaaS8gFe1mCsyHRqoatyijJHKbnxXU=
X-QQ-mid: zesmtpip4t1745324305t656bd8bb
X-QQ-Originating-IP: hg4RPvjNFuLrioiProjFSc49eEpyxOtoEar038BepTs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 22 Apr 2025 20:18:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10097217200537655222
EX-QQ-RecipientCnt: 10
From: WangYuli <wangyuli@uniontech.com>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com,
	niecheng1@uniontech.com,
	guanwentao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>
Subject: [PATCH] drivers/nvme: Add quirks for device 126f:1001
Date: Tue, 22 Apr 2025 20:17:25 +0800
Message-ID: <5AE9DE3EEA7F8772+20250422121725.162229-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NSFPwCZBl/JL32ntyGBy9Q3mW9UddCZTUV5t+1cCxs4qJ99NqCD2k8LO
	tQADOJH/tTvmcQ9bi7Fi8Im9BJP4vYVLgoVYyZ20bgmm+Yqe+1zkD7+RxwpSQYReuzgkexZ
	26ZUrue3/gyvmijbnakwcMlWVRPlNVY/KV4H3WF24oWLYkZDu5g+m1aOkRdbb5whsnYJE2C
	Sp6zi3sfQTHtJ7TspJu3YuxsaeueLyuQNjyLWYykr/7CiKv2byJGW/3cFwEMyf5sSMQbS/X
	KQBioXB3pSGRNQuXgXPas0wSg1a6cGwd77Zp0bWUDd5gxc62ppIBpkMUXx+KBenVK8cNK1R
	4DvARuYhxvHbOBe34xV5v6U3E6fnSlfp68qT9J8kJDm+tgnkZ6x5CkjLBuO/M71G/aYVfmT
	u8bz1DFh0ve6iSXv6lHAGnwpJlY/mQ3SgRAke9YIXOg4QJNvvdmBeYt6OeQlL2BzC10XZIO
	9v7zpcdEjoB/F1O2duMgTDIugSLIDLSQgTpAWPyLN8nyAgB5VFLK7Y8cS7XPQzSmPX/PF5i
	ecpSPC2yFJE+Hqf+qV4MGKVc+vlGtRkccwxt8EQMJLy+EEcrVIJo+qfkf3tr12BUjgK96DK
	TNG5HYBM/JL2V6nhw+mqaKdkV0UHglQpMK2r3aBmG2nRv7L8aW70J36N0n41L8/kr5lX70u
	WsP4bwef4Y2/Ni+symA0C5gQAFJPehsNkGuWgXAa8btFgoszNsQpXAp7wcdv+ZWEA8zDahl
	DRZHq6jzaAt/Y65WiT+57Ocxu0slge342+m1oXAKisAQbY0y8Rj7dDYGFcqNhVigTCnujoW
	W8B89CuiW7+IcUbQQUcyatOlwhIr5mmrEYDA90JbgcH5MPO3ldK6MSUH/sSgBhtq+Zm8EdT
	RIKtkHTFSPjm2CZKRxKilmis3YMzQjYdjHiSX6jebxcfKvtu2oju5uPhfMoczJddT0nFVoV
	1L6aI2h7akpCkKlGky492wk6WgyUUpkxBJ4qHq0UaWDmydIa1cyP++JbmHpK9lVB9gZX3x9
	h0fC56/Jji/Ou/xocvch+8ZLZwwQqrOcmo0no+89vEnjrfGUQ28UyInYdgN98=
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

From: Wentao Guan <guanwentao@uniontech.com>

This commit adds NVME_QUIRK_NO_DEEPEST_PS and NVME_QUIRK_BOGUS_NID for
device [126f:1001].

It is similar to commit e89086c43f05 ("drivers/nvme: Add quirks for
device 126f:2262")

Diff is according the dmesg, use NVME_QUIRK_IGNORE_DEV_SUBNQN.

dmesg | grep -i nvme0:
  nvme nvme0: pci function 0000:01:00.0
  nvme nvme0: missing or invalid SUBNQN field.
  nvme nvme0: 12/0/0 default/read/poll queues

Link:https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e89086c43f0500bc7c4ce225495b73b8ce234c1f
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/nvme/host/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b178d52eac1b..de0ab1da99c8 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3623,6 +3623,9 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x1217, 0x8760), /* O2 Micro 64GB Steam Deck */
 		.driver_data = NVME_QUIRK_DMAPOOL_ALIGN_512, },
+	{ PCI_DEVICE(0x126f, 0x1001),	/* Silicon Motion generic */
+		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
+				NVME_QUIRK_IGNORE_DEV_SUBNQN, },
 	{ PCI_DEVICE(0x126f, 0x2262),	/* Silicon Motion generic */
 		.driver_data = NVME_QUIRK_NO_DEEPEST_PS |
 				NVME_QUIRK_BOGUS_NID, },
-- 
2.49.0

