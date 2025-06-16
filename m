Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AC27468;
	Mon, 16 Jun 2025 02:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750040269; cv=none; b=Rla9aKwAoCo8IjXSIfuGuV2R9dkHkqonPsCc++WGs+ExhSTr70WOhUh6Y+XKcbZxK5SzDOcIvKrVZIYCHT56weCG4I6k2tXeZ7PmKmLQxp7pozuNG/N2xkNUDPn7zBhvSFbI2X4Hcl4mBtYluUfNTxKa7KF6bR6bIJiRcLGetws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750040269; c=relaxed/simple;
	bh=SWPLtRw++Kkvx35Sx1XLcecpx0VtVmVooRZvcC3nzy8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sd5Aqou7/JTWz0MBBAarmCecZx+cPak3BeHgVfObKnIxM6wF6wXgMjsGpPvZbHjQhtCkUlKEv5NbS14BWkWwU9Ts+kG+PWBcshgEIWZMIlBAAg+f6cJZFEyFS3cLgpHB+0EgvGTU4KoCs4i5Q7l09iJRBfqtfjp8VsfV6ae4wWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNytxkVe; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNytxkVe"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b2fa3957661so3283451a12.2;
        Sun, 15 Jun 2025 19:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750040267; x=1750645067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZMQS+IaNs/xpTUGHSm25tygrtlj4jikbdPrhHwUj8Q=;
        b=aNytxkVe0v93TLsaV9kBpWWv61XVUNo9IK/bmTif2WQgCTZrzfhoPaL6oz+rY3Gv6C
         ulqkIqB1/sVmi+asre4ldwCZNvcc7XXEoJ2r51waw/hFXjWjI5x+zV808+9cV5LQlq+N
         349pN0GqeWOzBRR+AE6ymOHyzVyjNCtzskkAjvMPYzyNR7pm2nxQdg8wx9fL6UPX9wA1
         MIEeDprDz8sUqERHfvW2/Qt8RxcQaUO3KSUNPQJSNoV6Fna84SGce+KBLxRFduJ36Q5q
         RDlVd0ptE6PM49bbIWhSBeGYqa8H7ooz5AvE2ywA4MM2eL+pCGQz4xA07xpe2XCuYC1E
         DMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750040267; x=1750645067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZMQS+IaNs/xpTUGHSm25tygrtlj4jikbdPrhHwUj8Q=;
        b=mZeqj2P9a/7Lw836h+FSyS3rGyLNjQyCs1qWhitjTMwGIvHio9Yag1EKKvtGCNl6Cy
         yfAtyhCiv0DWP0vPu158pRthj0oOBOMnnqfMFIUT/TGHmq9ICHV86gzZrNQHSqePM/lm
         y8SVj0xDPsov2dKf/am/363+dKlOn7Zla/CN7Smf6UZz2s6Buu+iYnwpg7xZxan+uPtH
         QPEvKVplwdKGVBwEzjFeqzw4XOPhYikjwm0GfDxFWAEt2q3ALbAgQVHFPv5SpCKEjWhw
         mBUXnCytkNeYIAJoOCtKk3ITI0NjNRYsfGrsdk8kPEszxinymcHA7GOt95znAuKeF+k8
         uaQw==
X-Forwarded-Encrypted: i=1; AJvYcCVMAupEzO8MbCU6b89knKE0dZ/fuAmJizF6SV54uV15m9K/0aolbQbitvxiM7Uy/JDR/xhp7vUZwF5K4cVZ@vger.kernel.org, AJvYcCXVOVNq1E3JDsOOLnKw1vtd+RWrEv6a7tI1rpbQTBvNgDRw//VTBT4Fit3iO6z44R3lYLwwTxMYOGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxujbIGMsiumdXGONLvXLCKGIBrpkczqP9EOIIkYKuMaDxue97X
	BXYYZSqJqEe65FfyxVk48jjQrprrK73GONjeg/3urkhaiRHQtC27LAMe
X-Gm-Gg: ASbGnct6c1rjAN+XmON1xynNqkoReMv69QzWumPur9r9N3DkEsYFTVo3QrXiCZg5g9o
	x+dsP8wOFYSzum/MQACQI2/gDCIb6rkRHUQwN61QaSKXtupGeGtjK2U6v8wA9F/y3Iy2JjTO+i8
	VXyNOBOS+iLu8Udl0PwIrXMFa6BxuvqCF4NKXdeWzfUmawcjFLiTtQ+g2MGCW5vQyGOACsMAi5M
	p56CvclnNvItHkopbBBd6CLCPBZPOKBzYiA4FIjNKnOurLwdNy2E3r2SiyHelu9s+kGPZIxvlvT
	BuTvaboqbMnaBaZWKZhozOYbsbhnyN2xpQaNzxRm/UAmNj8d472dEhOuZI9QXkp0IqgYJDSYc4W
	vy+Qkv/Ln2FL5S4MvUgz027mWTIhvrhaQH2Vmi7vDUzDGpG1unnZSsiks8oklGkA=
X-Google-Smtp-Source: AGHT+IHDsJZGj+lDxZG5TgbN438rJtv/FU3URTV5UDwqjTi3dIwneqJsEiiTD8dmycjHVTZ+/dQLfw==
X-Received: by 2002:a05:6a21:648b:b0:21f:53e4:1925 with SMTP id adf61e73a8af0-21fbd523a1dmr9778681637.10.1750040266910;
        Sun, 15 Jun 2025 19:17:46 -0700 (PDT)
Received: from hyeon-Virtual-Machine.mshome.net (syn-172-089-148-138.res.spectrum.com. [172.89.148.138])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1689814sm4718037a12.51.2025.06.15.19.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 19:17:46 -0700 (PDT)
From: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	corbet@lwn.net
Cc: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: nouveau: remove invalid kernel-doc reference to r535.c
Date: Sun, 15 Jun 2025 19:17:42 -0700
Message-Id: <20250616021742.8304-1-dev.hyeonsu.jeon@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c does not exist
in the tree, but is referenced in gsp.rst via a kernel-doc directive.
This causes an error during the documentation build

Removing this refernce resolves the error

Signed-off-by: HyeonSu Jeon <dev.hyeonsu.jeon@gmail.com>
---
 Documentation/gpu/nouveau.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068c..cab4a8eda850 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,8 +25,5 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
-   :doc: GSP message queue element
-
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
    :doc: GSP message handling policy
-- 
2.34.1

