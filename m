Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC182212B1E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929389; cv=none; b=ir09ss1rkCub11K9pZZh6AFM+LZeTJXJ5UWPXgLycMwt4s8gcgigQsqfq0txIWoWo+34pjpuiLjQAZczIarpDYX7hSY+OrKJDqyBv7gbP7fG9C/XWauhZEdQ3v85WLu+xndVulzV7cS2rgZe3RZRNipvtxkfJ/zzXceq8Qmh6F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929389; c=relaxed/simple;
	bh=VpwrkXiAZX4MKlWOQYsQwdNbtcHHKMCeVfeOKaPRVzs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nxsHOpTo3E8nUHlFC/Bba50DyUw2b4jSdTbpvrkozwtJ4lIdg1M3G/uq/zwhUz0YHf80BPvMoaJOq2ID3g5b4bF4doDgGO+d5TzC0pDVqVEH7wbO1U/0adlfXDi/A1X9MAE1EW+hRLFXCdWeZGL3MoTADblDpjhMbiZCongW8LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b=gIu+oA2I; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20230601.gappssmtp.com header.i=@dubeyko-com.20230601.gappssmtp.com header.b="gIu+oA2I"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de12bso20174365ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20230601.gappssmtp.com; s=20230601; t=1744929387; x=1745534187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gATUdrY0YUPgHBAdvSA39vTeHox2hGlpCUFV0ZghK1w=;
        b=gIu+oA2I8e4KidoLNUeWI6rJKW0FRYp/hDsBnuEwXZ9Ksip3ELYWcFJS+ql+tDIvPd
         7BiPaxGc5IwpTiA0k5JkpqhVYVS0ElsV6vDHWjomvA3LGGMfQabGnP7oZZaGvUyonHPr
         jvHfikKKwT7YgpaUTmLuQBWehZRURlyZgwSigZWmoBSKnPsJqdCBg97gwDROFBW1zkrH
         Ap+II/6A0LCkeVskc8Q4RW8syxdfeCzn3xHK2wiI3bCJJpTwtwTmsVf699bBlOFSwK+m
         UFTPdOKEKBW5QOKD+ENEykR//vtFfn09QpJMzKo9MJKnvqwFZ2pn8UairlKIOz7jlSp7
         kEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744929387; x=1745534187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gATUdrY0YUPgHBAdvSA39vTeHox2hGlpCUFV0ZghK1w=;
        b=CmLeAswV3zgTFdeyk3cTOEWXyrTLc0agtEfALlMu4qzbTsMwXYCDPMQNPsnkRTO4W1
         Z7PM5p1nM+CCEBkFe6v4U5Y34h8pfKhOl8DBQSNP3aQhrC2mP0KapB7+cN+Fw203EC4p
         LBDRQLGtLPfdmT48APiwAV8feRbt1rnJ98RBceJ0bj+MjiZgrAroLwa++BzTKeKoNw2H
         Xgwsr0E4sHIQuggVmdkLp6wWCjjQo8GO/9d3Q3xq0sMw+aCaKfF6ufng+Tja2S3Azylq
         x2/CmsDTMRNLHgzlWvKuJQw5Xnb8JIG08sl8o5gJFUXMSX0U/mhnG/zF1fNOFTjd8sjF
         s5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXmxh9bMzZhsNlbPtDnaUoynUjEMVXnwVjwmvzj7lbT4Xm1S3TkhhZ4oXF1vxH7WHVJFvMw5PBN34TbTrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz22z027ecpZLVX55+s2PJjpbID0tASVdqc6j6m4EP7PDqlT0ds
	Q6G00ouTaU2EbUg/1JaB9EhQAe+ek+mYCPRjSUdw6qe+m8U/zNET2XfycMAJyo0=
X-Gm-Gg: ASbGncs/EbcdtArOigZCKxnka2wEf7RSLcI4Aq5sZHs6w9o9HK0e/W4J+L4MbsOmpyW
	a5poDSC+OpEpno/5pcewQX+xGreZ0v+E7Cd92SaEBYLBxAEJZ2xuFDusM7RDtLTbyflNJ74WyVP
	yP7f4dIGd4qAOxN4hj6xbeci/z4VZXy/4csWJGtGkgynbkeuZgFrqgysnPzyLwRLYIk2XSlrEys
	ss/UL+zNYCBryXYmbQUtEPXb3hdi6zX0Jc4thok7p4xsmZn1iD3U/KLYtnoB/y8eM0wspaKSi40
	Vs0M6KGYhA3o8VUhy4/x8Bsxd/wJFtaoWd0CSM5Bg/w4THdXoBWD
X-Google-Smtp-Source: AGHT+IGC46B0miyvCSa2FdgnvgXQX7iY+ZVnijj3FQnGNTE6kX953PJYm8Ohx0W9IXTyjdPT31Rpow==
X-Received: by 2002:a17:902:e747:b0:220:cb6c:2e30 with SMTP id d9443c01a7336-22c5361bd3fmr8266105ad.49.1744929386746;
        Thu, 17 Apr 2025 15:36:26 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:b516:590e:a54b:461a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4622sm5265265ad.108.2025.04.17.15.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:36:25 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	linux-fsdevel@vger.kernel.org
Cc: Slava.Dubeyko@ibm.com,
	brauner@kernel.org,
	dsterba@suse.cz,
	torvalds@linux-foundation.org,
	willy@infradead.org,
	jack@suse.com,
	viro@zeniv.linux.org.uk,
	josef@toxicpanda.com,
	sandeen@redhat.com,
	linux-kernel@vger.kernel.org,
	djwong@kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [RFC PATCH] MAINTAINERS: add HFS/HFS+ maintainers
Date: Thu, 17 Apr 2025 15:35:07 -0700
Message-Id: <20250417223507.1097186-1-slava@dubeyko.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both the hfs and hfsplus filesystem have been orphaned since at least
2014, i.e., over 10 years. However, HFS/HFS+ driver needs to stay
for Debian Ports as otherwise we won't be able to boot PowerMacs
using GRUB because GRUB won't be usable anymore on PowerMacs with
HFS/HFS+ being removed from the kernel.

This patch proposes to add Viacheslav Dubeyko and
John Paul Adrian Glaubitz as maintainers of HFS/HFS+ driver.

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
---
 MAINTAINERS | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c7d796131a8..1f63cf0175a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10456,14 +10456,18 @@ S:	Supported
 F:	drivers/infiniband/hw/hfi1
 
 HFS FILESYSTEM
+M:	Viacheslav Dubeyko <slava@dubeyko.com>
+M:	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
 L:	linux-fsdevel@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/filesystems/hfs.rst
 F:	fs/hfs/
 
 HFSPLUS FILESYSTEM
+M:	Viacheslav Dubeyko <slava@dubeyko.com>
+M:	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
 L:	linux-fsdevel@vger.kernel.org
-S:	Orphan
+S:	Maintained
 F:	Documentation/filesystems/hfsplus.rst
 F:	fs/hfsplus/
 
-- 
2.34.1

