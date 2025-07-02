Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC7A2E498D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480696; cv=none; b=XmXVVnrE3KRs0rtXF/kdoI3JmaGQT5S/W189Fw5Sx4ccFMNrgwyjKRGKIQFoP5vPHy7QqQhnnKa2OgU4bjAape5cB4XdJi5jpAWoexMdx93J8g+VFjh05aRR1Ov3wWBRiScMpAz5yZULVBQaf4TIs6dk3vgb2ptuwyNdgpfneJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480696; c=relaxed/simple;
	bh=gyag0GuSpmrLWG3YHnzuZL5pZQEr3eq32tUI0nk4uiI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FixZfLDy1n+8PGkjfwbjeytXoMeGBIICY+7V9IbIvH486pMMAkq40mfcK7R/y8AGH2+sSYxvoINxzaFzfwBstwdxkXu60l/KLOk9qcbvXFvarQSPyw09p6GCkh8N/+vBbEVwFb3Kqkcuz/L+OkfR+eWkEpTw2NktKW1Mtw9OQu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nUHemZbK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUHemZbK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-747fba9f962so211082b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751480695; x=1752085495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8M2HZl18Q+8xVh0BAI9bQMFHHQ538GxGAd1O7AbamsE=;
        b=nUHemZbKb2JtCq8XErGIBPorte8r8h70Cw40HVgjJmd0kG/CnMFlZn0aHdeRviRL80
         fXdkf09vjEyJVMO38iS9yTVasKSeSklWaN12mg98VgikckQGw6qGKahfSkJABSqzUXKH
         wxEtf3FN+SnHyCKOK0jm66vLNZl759UDMdb7DV/uDu03AvsV4BztrlmrvXiDiS+eLflj
         dnKuwOd5lr+d2h0XS/WU0gWqgpe6UbkfryrSiPeNDnyh6r8qjwUuRyTsikRyJWODcUc6
         qkqfPL/yWVxzac+U4ZtFDG6YyKkVWu7vViat+hKDN4GrWeZHrn4biw3tCRnGL/g3qcae
         1ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751480695; x=1752085495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8M2HZl18Q+8xVh0BAI9bQMFHHQ538GxGAd1O7AbamsE=;
        b=vpKdwh5+LsRX8vBLGAusMmOMuh29urmD5k2nsjXMhxQttjn3TV4JlDAhNCqU50p7sn
         CIjsexMhA9fkFhGZ3xGbj/TGCMGmPqjUv7A5Wkky8L1IPQ5/U/CStzIodZG3GFzn9vlf
         1P60BuCt/2emFEyecX+XsFQNITl8jvCEL7iTkJ4SRvAv7MnrjWCAR4fCzmVTV9xmmIQ+
         Eu2XVp53nzb7Ddjxf5KU2ncMoZ+YnxBo37L91+maD75Ywcj+wvqlbYm9E7AtvLR50P91
         96PIHZQ6hdLuvNaH4O/o9KoLbyfVOJB4RBTY8RxDNYu1K6hQ/7q1UkPbBimmSu3MtSt+
         jmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwX6kgLrogUOiVFkgt0SI6+dzcy5GaX4X8OCW552AVKBK58nfnI5Te/xLZSXbQlwJAqVuc8RaqJRASxNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsWU+ad1l8GSy4vSsYcEA2TwGCBzyvZkl0WUINnhfa0EfIBM9y
	OjpylLatXm4GTCOgvcRkBLDLLhapf12DL3OJg462TQ0qrvFurwdzgV9F
X-Gm-Gg: ASbGncv90Hq1lb4bcIHp8xmTQN9tZD0ssyW+rsGANw2budP0KUtreL/w1oK0O2ntXLa
	CncNF4JLJBPxuZNU5f7m8yinTsXjm66RKj/19HEUJaF6J8LRFGPjvKPSGm0NzezS/ys8qDKEIdW
	NAumvMc7/PUByKf7dbzNTxTA3eZo5nlHiB+G6nwH9NbMmV8TMX9LkWqJFUr63lzglM1Us+ktgqs
	iwBiwWPrilQ1KIDcqQhsGuLZFrlniy0adsTnd43s26t5SvYU6yuWzTuARvhS3471phujrmxFhzj
	6biXS/cZ2vTEEaKFF2kvd3BIJOV5Gt6UOYXdkSQ2fAdyBVpbqZI+O/Yxop/9spxXfY9G0I0=
X-Google-Smtp-Source: AGHT+IE9p88j4OoG79XagAiP6rPNpRZmBWzj/bVM31WE/CtYOj91yR7TtZ4HF6G+RjVH2DaQSzSXFQ==
X-Received: by 2002:a05:6a00:3d4c:b0:746:25d1:b712 with SMTP id d2e1a72fcca58-74c998526ccmr600678b3a.7.1751480694555;
        Wed, 02 Jul 2025 11:24:54 -0700 (PDT)
Received: from pop-os.. ([49.207.223.16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af541e5c1sm15119028b3a.70.2025.07.02.11.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 11:24:54 -0700 (PDT)
From: Aditya Dutt <duttaditya18@gmail.com>
To: syzbot+30b3e48dc48dd2ad45b6@syzkaller.appspotmail.com
Cc: Aditya Dutt <duttaditya18@gmail.com>,
	syzkaller-lts-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Test: [v5.15] INFO: task hung in jfs_commit_inode
Date: Wed,  2 Jul 2025 23:54:21 +0530
Message-Id: <20250702182421.62557-1-duttaditya18@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5.15.y

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 27ca98614b0b..cb57d4f1161f 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -835,6 +835,8 @@ int dtInsert(tid_t tid, struct inode *ip,
 	 * the full page.
 	 */
 	DT_GETSEARCH(ip, btstack->top, bn, mp, p, index);
+	if (p->header.freelist == 0)
+		return -EINVAL;
 
 	/*
 	 *	insert entry for new key
