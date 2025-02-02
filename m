Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412817C
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738458951; cv=none; b=e5u6Rb4u64DTHAXrTZ3S2HQgBNGtTw0Xiw0JQe7lPtDgXv2CyZiDhsvD2xdtwvPX6S7uCZVclq67vHSmtZMqbwy9fnB+q2vKeVMku1RqSl2RIYTRf8+f5OY0cuvYRqZ9J3Q7YDacZ3o9IHPKu+N7c+NH2NkPmc6JTNvfQmKmATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738458951; c=relaxed/simple;
	bh=1zOKNeMoFWJsdvXc9AFW5PjpOztclWVQyTcCssEGJz0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=aPe3ZW6FGrwY/DU/n9SjbVwH5AwVdOz+sUsHgUPYA0/LunGRtSZ2wZ/r5irLyHhgedS88D73OJN4fM/wCQyezTdm8EgFUjVZvS0j2R7X8tu1yK1Gt9TEjkFX4xdZg0sX2Ra3cJf1qrsrJ5eOGCAThsssfKNR8hqAXRXu8vT26zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=QekEnzpm; arc=none smtp.client-ip=203.205.221.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="QekEnzpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738458642; bh=+IIKEO4eGJoSyJLmFHrdsrozXcGG16ks6KwlwuLGszc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QekEnzpmZl6NxmBrrENQhFPPm+TVldf4hiETq+vi/Wi1ELJnHl76cM2UidAQLWLqP
	 C+488bupbLfigYBzVCPogEWF++scm51crOxiqIn9bAAAu7tlWB5y0uBrXyJJ/dB3ES
	 M5J4/oyT0eF3F10fhWutvYEMMV2xy82oB62Y79jc=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9910:799c:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id 2A7AE0C6; Sun, 02 Feb 2025 09:10:39 +0800
X-QQ-mid: xmsmtpt1738458639tmujbfmev
Message-ID: <tencent_AC7F66D9D37DE360897DA3A2445937625705@qq.com>
X-QQ-XMAILINFO: NafziRg7Bx69TiuMzEZJY+pBxdAKaZ+gNyySgFTV2CBrw7hvSbNqz3gjsxl1zR
	 ecd+1InxDdZrFU7giJIJW1TEVYUY+xH92SIINgjYNEYWU5tlRvXCrVA//YvQpv/XxUeYjI2XrcLF
	 X7wS1AahX11JwFl8txgipmpxI4qDwWkpPtX5SnWp75eMZavJtdp6F6qQrAGEdUVfPYEa2M4snnE9
	 uokSoQ+GSPU/5QghdfHRZiXsppg+Qd4TbUSHPxjQeIjizMAhuIbDRROqjwwpxcztfxRES2iJLDqW
	 ny1xdby+iUSWC1UIfrYieZDXMWrVMA0bhrcEP5rDcAyPSRnTRi5WDWtBgJH9nmK7DglYOj4LXgPU
	 sPc7tLf+6CegtAZIJm6Am2gmKIW8xjmeV0bTNGzUd+fgc0tXjZrJoZTutuByLolmyCTYfrReYtgv
	 mDtXP2OjgA8/bItCYu2QMPj6AX4Rl9oFzpckx3gi367XJsM0shapmCMhrtTmNq1jEIN3InfKh9i3
	 ehbKVO2vBuIHsufVfUCHYtefPsqtlwutNTa79bBDgftiH3ABj5Yrk3RXMoY/uVv9nyDKTdhzyUYl
	 qsoUtFJkRVLkm5yTf9gEO7jEpF9oLDUaEPtuTFZ9h27mIO8oToLk+EtPR21QzmZRkqt11EhyMTNs
	 vQWwbwAfC2hSh6ge1H5RZF/FqXUon2GEtu0O8rvCAuYq1uQSgOAOkY9lsrgb+snaNUEA+hpB2Zb2
	 Gl3YyfXL7y0+LAjA+GgltpUIFQsl9gLJJ9nm7u56pQJZqJ9sYKRCLgTn4keamee7MwrdVY7HO7ug
	 MBxvPhNBu9oGBGglt8qej+NOVteW4MaobRmWMxHV7QyujCndB57hXrMKf4g6ZB+5oSvFEfxFdEdW
	 sQ49Pssh2lt1d1klBleRmGEMCBhxb2/BlMThR30FSksEAbeqBF2QaJzNmzp2dAXw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mtd?] WARNING in release_mtd_partition
Date: Sun,  2 Feb 2025 09:10:40 +0800
X-OQ-MSGID: <20250202011039.1180483-2-eadavis@qq.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
References: <679cd60e.050a0220.d7c5a.0045.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 724f917f91ba..a71cd75858e4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -741,7 +741,8 @@ int add_mtd_device(struct mtd_info *mtd)
 	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
-	dev_set_name(&mtd->dev, "mtd%d", i);
+	if (error = dev_set_name(&mtd->dev, "mtd%d", i))
+		goto fail_devname;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));
@@ -790,6 +791,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	device_unregister(&mtd->dev);
 fail_added:
 	of_node_put(mtd_get_of_node(mtd));
+fail_devname:
 	idr_remove(&mtd_idr, i);
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);

