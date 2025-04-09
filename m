Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AD923ED5A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222784; cv=none; b=iy2dPmvFW85PC2reg3Zcrs8NCS8y0SgU8+BXeArHrjUBnfIk6/D7YIWs7t6msIRTTYxI/gUEuyYBkZ4iy0uRLRlwJr7EzJoP9+bpP5kJjmVLGDsfLWRRHkMSlzyVq3zQw1qZmOUvWXhgBXyBAMuffjBQ2GG4y2iMbIXfUJdHeVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222784; c=relaxed/simple;
	bh=Dk0oNqQlJsRC8fpG8QpHzgKezNBr3oi19rt+WnEfW+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brQRHZjY1u/hFuGbSGsSenj5Z+8z2bxUF7XLmj9Qg5rPzgGT/Bx8n+lsPJF5Wf/57DsCptm5JLNtLzJkZ6UmWZxoVi7M27gyMeytFZ+WoGfc++XdY5gpD8FVpH2zBTuMyfCqvWxJuroftV5nA5ApFJB/bs8UOHUlAxK1SdtyepM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRCSofaR; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRCSofaR"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-730517040a9so8809436b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744222782; x=1744827582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRkdAw/O8yrVTjU62SZ7m2qGSTADfRdfbRSj5I/AWsQ=;
        b=KRCSofaRqnDnz3mJ/Du9bE8oHyD06TQdcapmU67l15lmej3THEIg+Uk7tda4mjqnJ0
         bDZyJBqA8EfL35/f8nA/Ai2Qjk6Xy4WQMV4XJlra2wQQH4iUBJ5vqqTANwg6sAf2vUon
         wHrJjdc6mogui8lRnSdZNvS/VK6b99nhmNBNQqpB+eM5AZSfXdpaqGbSEg28VXVl40JW
         Abmz7NzMi5WhBilQ0g1/BmKrjQ/HOGVUeu9AqeOIUhLx4Qbke0IAF7RvBrUJBjY4uDOB
         +IptN4SWnr09omwY9xI15f2H2jPshs1QCkrmn5+qzzhyXn6ybptCd6ifNC7wpaL0nS3q
         Uvtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222782; x=1744827582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRkdAw/O8yrVTjU62SZ7m2qGSTADfRdfbRSj5I/AWsQ=;
        b=Pbirj5mmnr3LD51STCXA90zn6CX+ZKwqp/r0/oXDvGYK+e7zOlLoOrkpc4JXo8Ed0S
         IHbtVhgWj+S8JyWezEvabexsbLyHEYCORk5bsj50Mrkip4nYPnNjnKqrNmixO8K0z4Vd
         vSkYiSt5VZTNrRZnMKhzsCpCckFGPH0d8XhDlT1szBymwYaN/7opmo+MEzh2wuLIyAvH
         Ai8ZxC4XgCBGxb2rZyBcm5qT2BaZejLO/GY3WR15pSurznQUQ0hvE99mH5Ox8dxl0mJv
         ID+RUrJjBOIf5Kt6zAFt+OpohMx1GXMwO+EmzEI58jwGIzm1tqNFRUhMs8iA6FCEjpCU
         XhCQ==
X-Gm-Message-State: AOJu0Yyorv8GZ0IbUYKid3Z8KQE68VNNQjPi0tdZlklTOWAdHoucfhVF
	07lwN20F6bZKKniLDk1BRAsfZ9ibByvA6v2SBO9o3CDJnvEnOGYq
X-Gm-Gg: ASbGncsqj5TNMMQr8XdlVs0ZEBJH6mX0cMiMd8XOpgRggHi/X4opcYGHRhnzc3gSzX8
	cVvRzpDwRRqN3ca+Wr6/TUqUZcp2cU7+TKU1C25fdZF+JRg/WVu9hcWb1FIiDt6uwKu7sM8WnQE
	uJ+u7wTPHwJKX9IfAqc5sPNFaNWCSBVtoK987//wcaLzPSjbYwfUghJPkRqK4/3pN922bQTqNla
	ThHSw77BPBfnUQKj5h05XNuDzZOrpQ0g+WGvk+YWlefITV5DUDKqS9ulxi5zmoKpmLHb5OA8i8d
	txUzKBUGoYsfBpy8M6fCM8VoIk2zm4023HXTnak=
X-Google-Smtp-Source: AGHT+IHuqCMwGTRZ+yF9I/abkMoPMuD6/UCG0kZznYiwYzeSe293GLaO0jKXZs52wL+/lth5VNRcKQ==
X-Received: by 2002:a05:6a20:9f4b:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-201695dc392mr42764637.41.1744222782166;
        Wed, 09 Apr 2025 11:19:42 -0700 (PDT)
Received: from jemmy.. ([223.167.142.48])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf2571sm1564472a12.19.2025.04.09.11.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 11:19:41 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Jemmy Wong <Jemmywong512@gmail.com>
Subject: [PATCH] fix mismatched parentheses
Date: Thu, 10 Apr 2025 02:19:34 +0800
Message-ID: <20250409181934.5589-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects an imbalance where opening parentheses exceed closing ones.

Signed-off-by: Jemmy Wong <Jemmywong512@gmail.com>

---
 tools/include/nolibc/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index b26a5d0c417c..b57e054cca82 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -201,7 +201,7 @@ struct stat {
 /* WARNING, it only deals with the 4096 first majors and 256 first minors */
 #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
 #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
-#define minor(dev) ((unsigned int)(((dev) & 0xff))
+#define minor(dev) ((unsigned int)(((dev) & 0xff)))
 
 #ifndef offsetof
 #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)
-- 
2.43.0

