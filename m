Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F10B1A5B91;
	Sun,  8 Jun 2025 03:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749352409; cv=none; b=P7gDUrUOSlPCGzhLnaWhqvD8pZ8c+zEfS4kJ9+hZ1huMJKDA05ZBpBXrCZxtk7OIM7XNycbDSB8zhxSXWL7IbWMsRNMh5lpwExaxA0OL2z7kboyEeR2Jp6rh9JdEJy/YeKqFzxGYlOHVtISGITGIK0+JUaUfOxZGZy2SbI3DFi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749352409; c=relaxed/simple;
	bh=q/ijn6XHVBljhwA2CLc5BC3r4xzvdZcNfhyiTiNyb1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nKe9mV16YfgAsCPpJhmkf9XBZYGgaGUCHJrlAYyOdusjxeuIGFKK3A+oMCY7ubiXUAi7DtE3caakOPAPzB402H2kv7C93oqmfSbUaU34DG9sLskwVR+rDxeE4pvswLG7zxPtt5CelPqt4LX5pViL5e8ugau7oIGFnv4X1aUBSdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4qqgK/k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4qqgK/k"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c73f82dfso2600448b3a.2;
        Sat, 07 Jun 2025 20:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749352407; x=1749957207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Unzys59GZnSt+9KUjqVpwf3uqEZZHYRJe643+uvb5Go=;
        b=c4qqgK/kPMXjtoqMsiKyrwETyvc7VSnoC1Ctg6+xYWbgCcE5VgBhyDFnuLUU4JpALx
         0HCN1UNYJ7/BY8TtNbxjeN4sjw3NjNe0tdMaPSKkusB+fwxHccfhoQ/ljjSqf+xbL8FB
         o3UNHL8qJmZgbK2tZl+b5FMVig2uyzkOgtKIKspSuFU3155Nvau5olCnx50szImZt+FL
         OfUQ1FV0sIRdDADEq+WkkzcX6k908yI6rtKBeWH1HubWLmd3gfnpPBFnT4WXtuqxISdE
         pgHI+I3iA5QVq2a98LHbQAuzv5CbiTIlO76/K/5BLHp4y655kzjqBjc0+mx9q8Zr7VPY
         DKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749352407; x=1749957207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Unzys59GZnSt+9KUjqVpwf3uqEZZHYRJe643+uvb5Go=;
        b=qVzSDEPruexeP296BO/1cThiVDfJ8rS447x48hWnAPXcOOE54gwRbJkYAJlQsN3z2c
         zYownfhp1LOXRj04uFiyZptu50KHSB4FI6OEedbtTWsxbK0Vmq6yVa22pOttg5y13s8V
         eYGwKDKfnmz9KyWvj3GySS5JXQLobgwNGc7g5GqS/RHXTM6ZinJT8JoOC6xn56TnZPAo
         mqFui/Eh5I2ZKURYOgkK0+oQC31aHinMU2qBcjZghEx0YNNXt1OuRYgqT9J0exVC3ayM
         P6D7XgMHaqyDIUKrNP+cxVhHwLgay+S8DcCzhR79XnYGo+C1WWzdwioZOda+gkNmbz8W
         H1Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVsVHRRuCAEK710LFxwP7oyyt4l++k9KRIyDqIEGvWLtzXXQJ5LCRU76Padf3hhQ/emY3ZjSqQ/5mI=@vger.kernel.org, AJvYcCWMapC+O/GZ0BfqnL5Rhmkq6hFoQMeszj4u59+B7TcEr3gPfkXgNExrDqtX29HujiiFLkvRe1bA0yrmC50i@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr7QjoHE1Y610vHNvSt5jL6y0Uom5JkOSEQleMUXlInHJnIzG2
	mY1Bwo++jy7qDeNag9HfhUZzVAcADtCDuMrMlSvtMt9t7B9IttQN/FKLg6FXOg==
X-Gm-Gg: ASbGncu83JeUOP1OJNzLCGwHvhWfqhrt8uLOG3JgW0/QtKmxvKn8r90E/rcalqVo160
	o/aRf9x2gRcFdJjKgqTxkDRQakQYMwZSc2L1aLSRvDWgfxfXn00jg9Cc81zZPVVIkGWxAjUL2gX
	rjdL1khMGIomBSWb3rh+3D9bNCr3tRO0HWy4efM3PFD14C8/LCFriNNTKPJAJKSKgl20sYTTQtL
	3gksms5izugGVMWpsWN7nwO9nM/1ZR7Z+DRk4v+8b4fiMPDf7G25sLp8Ov1IzTLBPBwZEXD82LZ
	BekgYizofCdIYGfhDJdKu9JS4T+SqkdqwA==
X-Google-Smtp-Source: AGHT+IFoJUY/JCU1GQYPTqrb70WtRKZZBvb1Qq0s8nBiAYUVDhsxMc/kCfEBolyYIq6kiELEMwSaQA==
X-Received: by 2002:a05:6a00:23c5:b0:746:1e35:3307 with SMTP id d2e1a72fcca58-74827e9cb7emr10204359b3a.14.1749352406786;
        Sat, 07 Jun 2025 20:13:26 -0700 (PDT)
Received: from fedora.. ([2601:646:8081:3770::f55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0bd815sm3531714b3a.109.2025.06.07.20.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 20:13:26 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: corbet@lwn.net
Cc: workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Collin Funk <collin.funk1@gmail.com>
Subject: [PATCH 2/2] docs: Remove reiserfsprogs from dependencies.
Date: Sat,  7 Jun 2025 20:12:40 -0700
Message-ID: <2d6b194b33e8aacd12999b6ddfe21b5753c1171c.1749352106.git.collin.funk1@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <4d9808b5e3a87eab41d5d0417d453800faad98b1.1749352106.git.collin.funk1@gmail.com>
References: <4d9808b5e3a87eab41d5d0417d453800faad98b1.1749352106.git.collin.funk1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The reiserfsprogs package is no longer needed since ReiserFS was removed
in Linux 6.13. Furthermore, the package is no longer maintained.

Signed-off-by: Collin Funk <collin.funk1@gmail.com>
---
 Documentation/process/changes.rst | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index b14bd5b7cbc9..bccfa19b45df 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -43,7 +43,6 @@ util-linux             2.10o            mount --version
 kmod                   13               depmod -V
 e2fsprogs              1.41.4           e2fsck -V
 jfsutils               1.1.3            fsck.jfs -V
-reiserfsprogs          3.6.3            reiserfsck -V
 xfsprogs               2.6.0            xfs_db -V
 squashfs-tools         4.0              mksquashfs -version
 btrfs-progs            0.18             btrfs --version
@@ -262,14 +261,6 @@ The following utilities are available:
 
 - other file system utilities are also available in this package.
 
-Reiserfsprogs
--------------
-
-The reiserfsprogs package should be used for reiserfs-3.6.x
-(Linux kernels 2.4.x). It is a combined package and contains working
-versions of ``mkreiserfs``, ``resize_reiserfs``, ``debugreiserfs`` and
-``reiserfsck``. These utils work on both i386 and alpha platforms.
-
 Xfsprogs
 --------
 
@@ -493,11 +484,6 @@ JFSutils
 
 - <https://jfs.sourceforge.net/>
 
-Reiserfsprogs
--------------
-
-- <https://git.kernel.org/pub/scm/linux/kernel/git/jeffm/reiserfsprogs.git/>
-
 Xfsprogs
 --------
 
-- 
2.49.0

