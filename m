Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94160320F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738457234; cv=none; b=MM6npPU67HZjHRlN+NOhSRAxmZi77rW7sEkcUxDmT3bzKNZzVizSjBoPoEt3jE2x0A0sY9pBRIPE4YIjNMv556KgoWlLMLpa2/38fkGtHYn+SOTiA5fsgP4Syj+czlbSEApY6WElsv/g/acGAr70ow5Ikt8Imps1rdXCMQQFxGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738457234; c=relaxed/simple;
	bh=aHKU9cNNcfk0pvIv7DCjlc117wVUityxc58ZhVHShV4=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gBYGCHasqqFCt2q6cVHlmIf7AMyaaOSPIrbb2CNNYCTuahhaX8y+sx4AkKnmFc5T4lz36wI0a/MgkgeZNDr9cTC5AHBrSdJx4pIJ4dPg6szT9eohJBDNGiUngERS3ICFuzusivu6MHM0hOz7t9mbN6LunJPade+Gy4tmkmdHf7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=t6mWklP9; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="t6mWklP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1738457225; bh=cpYXEnL1PcDdg6ndFtXFEUGcZYdWOUVa6BsS4Yv8EUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=t6mWklP9pJjV1ebcj2BkdRmvAsAVB+/dND6Eycldz/DTBf9hyr2Q7jYUtjpPPuquo
	 ySTHYRP98pU6MZCGEzoG3IcnzgKxAi4eTQMBTb4rzpVS6cPdxBxl7+51HHUkY6uRlV
	 dfHwG67H2FrXea/jGURfY4Q0f5voflESFr+7l8y4=
Received: from pek-lxu-l1.wrs.com ([2408:8435:9910:799c:8cb3:3b5b:faa2:1ccb])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id B6E38228; Sun, 02 Feb 2025 08:45:46 +0800
X-QQ-mid: xmsmtpt1738457146t9nk6kdlk
Message-ID: <tencent_59AE5DFD9908CFEC0DD3A5D50DA69272DD07@qq.com>
X-QQ-XMAILINFO: OC0C8720A+YSmvbxvbJPv+F8muv/IZOifUs1tx2aRORdMNXeyB4VGuQh/ShBTV
	 5dgQ5OCwWpuFtX+NG0mOZE09MbGlQ4NQB3NHQVxINJ21r9ppQfUOBh07A05sB+dtnZOGHNg1yrGM
	 QZKcJg+WS4W/LcqVv70fmDcVvVthuQTxLGlXOqh/pgAR37olWWDaoUA+5bTfdNNcWp3Qo71nHudH
	 tSoGlTpp/gOJncT4XY3kkK5V5BEdAlSkM+BI8uNh9HQWOmW6oN748tPRjPyU/maDTJ0tHRM8CdI3
	 yWffjJQuqfhgYrGuXW63dmsWT6ry3RuyfkMxJdQKGSDppKZC4iHGBtwMs8Z94uyyGixgSp2xBuGL
	 LOWb4EjgRlvQP8NOdXmXrsXRCjhY11fhsy4RFCmOYv64wXieerROv4SVDNO/Ot7DUQwg+/PMHV7o
	 P6X54XxY19NvIrBuLXFfUjukM7CARztZoy8ZJ/vn2acbTvBO+5yWRD36dk7uBiXaORbzlwORxXop
	 RC+Q7VsJaDZWUJ8NBrKF+s68tYuBftwVvy7bMsVyLjBY/cDP+yopZaJdM0uIGMDf/OXuBfJGZg8G
	 mk49bka+x3oi3LJK4IvUlNKnYhFFmh7u4T7FLNr8b5KpFbzjXf/aKLWvgf5xrIkwunZ/O1VqZaLc
	 +VyonIdHNOA96Qpxx6cf6iaWZNfK4ySoZFY4x17zyqpwncWMsJvBeUxwD1b+U3j9P0KqePvZtaqa
	 Cs9Dy8pCDk7MXsJTC43KxIDnmNpjZcAKslmc+ZlCGD/eC/+1BzP9Qc0U75mVSvaWq3Z5/PeeG6gy
	 zrAfwWJ4kW2ahN9liFfkHbRptOr3VFNJCE8my5ee5suEOuylNQd2txNI/2F7IzCdEbjNS4L4fhto
	 g3nIg4blNTmZpOVLOMQ1kYcG++sH5OinD8kozcPrn21rzXgp9yVSc=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+074732af3fc6c528f8a0@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [mtd?] WARNING in release_mtd_partition
Date: Sun,  2 Feb 2025 08:45:47 +0800
X-OQ-MSGID: <20250202004546.1163166-2-eadavis@qq.com>
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
+	if (dev_set_name(&mtd->dev, "mtd%d", i))
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

