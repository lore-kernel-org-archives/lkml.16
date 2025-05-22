Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC30299A91;
	Thu, 22 May 2025 16:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931538; cv=none; b=feyqblDU9+8ucN0id7eTiQ9MfPDIRDH+b9Ek+75p5FveWaMoM/kRvOkEa3rcWmWTwJfJz66nm1IzQlya/vFEc3FuWttp34oRrc4PjisKRRurLxYTM1AZvz8VwLP0ejEpavzSCJK/SiBi+K7xxvGB/oNgdpCERMD2DK9dat0ucHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931538; c=relaxed/simple;
	bh=ugZWyd+MpiEbRrvATX3tXiaqFMwOaMpoKNTpv90bqRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p4kfq0La0EyWCFvrQ6C1WEI+8H9Y/tPANd01WUectw69xOgMG1JgDdfH6t0D+TzzcMUfwEv4zjQf+PhBSrzwzyywX6lW2uiSZ9dMuoPpgZuXmifSzKpa7+a4pXg0jisnaSxhtCkCIyuA5SKpfo2hY0AHnU8fXYjFpT8hGM6rpRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZR4VBNGu; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZR4VBNGu"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dc6945e109so40768555ab.2;
        Thu, 22 May 2025 09:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747931535; x=1748536335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PAxpSYKdkfgTyZH6GURFgmBwxsusiZ10fT+8H4MQeGU=;
        b=ZR4VBNGulbeVrYH6QkhTtOCD+zDP0avHJPD/yQeA/NR7hUi3m5zfzN0DCvCXV5IKve
         ErxgMGzP5GWtkeFEMJj5qWWe9YGSTag+AzRczyCILqjeS0612FNeseo8vreMgHVFS+l8
         1NC00ULKxGrg+m1x3KCoO/FZo8aeHyMxnnLDkrdHFgOGXWqTsVbgrBYMKdX7h1e4RonG
         dGFWHqcey04EW53IB6EOQCu/ifa8F3bK/14R16NYo5Eh69y/w7XCFS6y1wzppi1mu77Q
         E3XE0orbq4+XB/R8lxMySSgIMXgSBp++CoYBmvJnEBCwx7kUqM4ap00Xo0vSvGex9cSG
         RH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747931535; x=1748536335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAxpSYKdkfgTyZH6GURFgmBwxsusiZ10fT+8H4MQeGU=;
        b=u51TUAWrbot7bxvCNwkZo0FqY+FTY4ZuvKTE+L20tpdI5UpRRUX+ARMDqpF7d73RnI
         3rQCEbXSDgl+prOCMACdtSHkYGRZfUu8AoYQ+sFYym+9FqCZj1hiQT6UAcqBpI3TktdY
         6/JINORtaFWsWhfq5nlc7pxbZzXuY7l6p/F0NuDKuJ+owoVEGqgDGtbxz8RtAeto30Su
         XWvxjURspJrrMTNwziy23NDUQs9pmdGrpaeW7m5pIDcCxt2DK6etGbL147hdxquJO0Ry
         fGoSm29LdZXp97Gncne6N3uOYhj69fmmacsxrL2FFxQF7g/0nF8a9UCOmHgT4aRCilME
         64aA==
X-Forwarded-Encrypted: i=1; AJvYcCX2NqHMYPJMtt5ycSJui7yDjYacUjgiUf816QJ2unXmf0saLPuaYvpvNurLqX4Yvk7MlAQMn6duoW4db42z@vger.kernel.org, AJvYcCXlnWxxawu2VG3McSEf411/pKx5n93M6NnTQ4xsjr3Xi8cYzxRWW8C0Lv5ix0wcsXTeyj1jDBs/JXJQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99UPID1APaOAD5gdR2w4cMncD0xEz3RILjZ21yJkigtv7PEns
	GlaoBLvr9kpWKFtJoAqtyJMgwgCUXIfR0q/rUEQQgtIqLdOxgOZjShAH3CT2j9a/
X-Gm-Gg: ASbGncvTMiNfWvmQkjGUnYv5hAN7RWqMyZtOUleKX8HaQeCZyhuC9NWGXhY9BBcmV9I
	5CW8qcypiZrPrh4ULYYFQqHh5962+3x41+fsoOwwthUZc8OO1C/iz05nroJiaBngqtpws+RXoAT
	rqIVBYZXgpeedZ2rO09sONmU4F3hsGzJzqDiRnrhkNeY+4xYLRF9nxSO3SsDpC9mm2hKmKEHjBm
	A9ryom6nmk0yjzF+VvcEGVvvCkYhZ46HFNgjllD9x6wBe7jWBHG/BLFxLxtY48ZOIoDq0MwhCWH
	ALwXUW1C//5Guls/ykxswTZJvWcG+p2Zz7HFo9l0+qQz6Nk5FcSd5BQrtdNjQB3emwxZ+ZsWJKL
	tWoGR20mFSXYdKtNmxrqF
X-Google-Smtp-Source: AGHT+IGfALx19+p3iAKUN1K3JLgHy3CFPDh/VGZVV4poOdRe0ch1cjL0wSFQaFQElQj9VhFBZIlxxQ==
X-Received: by 2002:a17:903:2345:b0:22e:1a41:a6de with SMTP id d9443c01a7336-231d452d109mr382806645ad.32.1747931524838;
        Thu, 22 May 2025 09:32:04 -0700 (PDT)
Received: from wig-Precision-3660.. (125-227-154-99.hinet-ip.hinet.net. [125.227.154.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e980c0sm110750145ad.126.2025.05.22.09.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 09:32:04 -0700 (PDT)
From: Wig Cheng <onlywig@gmail.com>
To: robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	onlywig@gmail.com,
	kever.yang@rock-chips.com,
	manivannan.sadhasivam@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: vendor-prefixes: Add Mayqueen name
Date: Fri, 23 May 2025 00:31:42 +0800
Message-ID: <20250522163142.3421893-1-onlywig@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mayqueen is a Taiwan-based company primarily focused on the development
of arm64 development boards and e-paper displays. They will be working on
mainlining the DTS for their boards and e-paper DRM drivers,
necessitating the addition of their vendor prefix.

This vendor prefix will be used in upcoming DRM driver patches for their
e-paper displays, such as the pixpaper-213-c and future models.

Website: https://www.mayqueentech.com

pixpaper-213-c e-paper:
https://github.com/MayQueenTechCommunity/PIXPAPER-213-C

Signed-off-by: Wig Cheng <onlywig@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..9207c25a3490 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -916,6 +916,8 @@ patternProperties:
     description: Maxim Integrated Products
   "^maxlinear,.*":
     description: MaxLinear Inc.
+  "^mayqueen,.*":
+    description: Mayqueen Technologies Ltd.
   "^mbvl,.*":
     description: Mobiveil Inc.
   "^mcube,.*":
-- 
2.43.0

