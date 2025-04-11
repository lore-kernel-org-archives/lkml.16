Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F31189B84
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744357020; cv=none; b=OEYgEzV3/xJqyj6c+CDEmREsArosOZtzL1xwaVmZbj33wREQIwQYcEHx1US/UV3JQ+UC2GES6GLEJZqfpwf0N9fFJ3igxn3kjNityopcK9uBSATnXysJK3NyTb8oZ0Uz6LD+netZHyrLt0zT47W3f0qAKt8rggZw9rGo/gsKmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744357020; c=relaxed/simple;
	bh=Eot6P+KVGStRurl8Bhy1OmACevaHt3aZ1MNpvvOPV2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V5xvlXYl/poRYkWLjWmUd1WqHJS+8bXKla9/zqaTi1QCZyErhgxgdsjMNAWHWcPXwVKK8t9yHolzEOVxPBm+2YLP8PCXB7oAZANxtaYxcBEf8XfhwvhS1zCr3gijhWaeOqNZ5hUpgaLlCANh1opQRtk5NC+E78aZFTMsfvCLYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xb+RrrgQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xb+RrrgQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af9a6b3da82so1193033a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744357018; x=1744961818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7vdbBaoGrQbAlkZQgYnERkJPOi1id01r4Ys3QBFfKms=;
        b=Xb+RrrgQhzZTFqbQhVII0BNoiS5ZThECtE7uP5MnrFpb8mLw2clxwCetEMZveuQFzf
         wLj9kBoPqCxX6XH9CpcWGzEo5qknBSkHAkan0sV9CuPonJHobgguWNSd/Hpa8kG9eQvd
         VdSuCCHXeZLipTpPOZ7seCrpCtULPbJ0IGn1PMTibVP2LfbLRfTIl9Hx1RfECRpA0t2Z
         6tOrFPHVUItj98yMDnKKpCkktowciUJgaX6Tj2yKZC9E0ClmviF7WuPx9MDserKISp8y
         XxkH6JDGnnF41YwGOefFDPGkwMarCXp4Yx7q7mmOSrtebTVy8fOHA8NFI04pKlIVljUA
         lyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744357018; x=1744961818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7vdbBaoGrQbAlkZQgYnERkJPOi1id01r4Ys3QBFfKms=;
        b=cvE/vZpAauL0JxuyAM9s6mA3aDsYBWqxbNzkUP0D7E163f/qF0m2VS+Acz8AMLDRc/
         VwRpo/OwYXEiAjUCpFltfL62HELHESHf5U2CQgZc06vBHDKzj5pIAP1yge0P3n2jnG0J
         /lxrPg9GcU6r7a8I57XsikQzmkXo3yXyWV88KnFdJpQSJQeFHM2mOe09j8+BXjvRwbO0
         6CHA3LiJJ2fyTZ1ORbi8vqHLTutnNp8h8+HFxUvODPM4ZYSXbM+NWVCfNmjAxxQhU0kk
         WqHcEyfOLiSAMXFh0kxEc50KY8DOCNYxNKtOU4/kwAKGs+kjXdiTjCGKyvWN877D7zRG
         Xs1A==
X-Forwarded-Encrypted: i=1; AJvYcCWHxvbPe35SD1E5WMyBFABL2zWPDpr82u4dBp8Ela4IGRy4grfauRTVufHWlZ63pwsbqSPMQmx9WMNGHwU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyba2JYSDjQ2c5jKqpPCO03SIUswSTTEgm+eNKIvnnRAv+yFdM1
	ezNzABcdBs0zkLyBBDe2Xbj3g8hTWdP6/7CVmhOqp3vAMmbGE2Qg5cS0GHnBURY=
X-Gm-Gg: ASbGncudktzVG22gC8DrYHtjMjKpwowaYtV6fiu4J0l9PwqI+/IeOdIc3+mnjfuZnr3
	kKFFCOI9AzcmmUlGdSA3KgEwZwEcef2E0b9NKofnVzKMtFhSCVXZXRN8ye+KlCcC99z2iTBzAXL
	jZSacJIpYSswc1PA6fDB18Nwz3pL04NC/1YRrLaFiBfxkO4evT0yxVhF81qxFWtAS1Gp8VV6hIm
	0rS27KtvRjV1g1c8y0hFLnfhR0prrjJjHP7qdePDzMrlihf3uKJpHUckf+8v7BToBnk3UYHHg+N
	G3fWCjb0kyYZ2J4HdSa28khaXDz5tf9nL2h253zJ4bZkTrQVMg==
X-Google-Smtp-Source: AGHT+IF+2lsSFkWzcEluMF1ylRV9Yqv71iReRkzlwAY2r/XwE2sl77FRzSjVoleE3jvMY0xzl/MUDg==
X-Received: by 2002:a17:90b:1344:b0:305:5f2c:c577 with SMTP id 98e67ed59e1d1-30823675d07mr2671999a91.3.1744357018221;
        Fri, 11 Apr 2025 00:36:58 -0700 (PDT)
Received: from jemmy.. ([223.167.142.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd17192asm5018171a91.35.2025.04.11.00.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 00:36:57 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: linux@weissschuh.net
Cc: w@1wt.eu,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] tools/nolibc/types.h: fix mismatched parenthesis in minor()
Date: Fri, 11 Apr 2025 15:36:24 +0800
Message-ID: <20250411073624.22153-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an imbalance where opening parentheses exceed closing ones.

Fixes: eba6d00d38e7c ("tools/nolibc/types: move makedev to types.h and make it a macro")
Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
Acked-by: Willy Tarreau <w@1wt.eu>

---
Changes in v3:
- Fix identity of sender and Signed-off-by
- Add Fixes tag

Changes in v2:
- https://lore.kernel.org/all/20250409191436.75658-1-jemmywong512@gmail.com/
- Formalize patch commit msg
- Add subject prefix: "tools/nolibc/types.h:"

Changes in v1:
- https://lore.kernel.org/all/20250409181934.5589-1-jemmywong512@gmail.com/
- Remove redundant '('

---
 tools/include/nolibc/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index b26a5d0c417c..32d0929c633b 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -201,7 +201,7 @@ struct stat {
 /* WARNING, it only deals with the 4096 first majors and 256 first minors */
 #define makedev(major, minor) ((dev_t)((((major) & 0xfff) << 8) | ((minor) & 0xff)))
 #define major(dev) ((unsigned int)(((dev) >> 8) & 0xfff))
-#define minor(dev) ((unsigned int)(((dev) & 0xff))
+#define minor(dev) ((unsigned int)((dev) & 0xff))
 
 #ifndef offsetof
 #define offsetof(TYPE, FIELD) ((size_t) &((TYPE *)0)->FIELD)
-- 
2.43.0

