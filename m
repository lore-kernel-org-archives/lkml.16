Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7F1EA91
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364861; cv=none; b=ep1EV3i3rgLP33yCC1MZ9KAi0oCWe+EYKp6nH79Z1xE4EdFyhbSo8/Y38x/BYjSkilek521djBWMwfcuDWFMajP27ec6Knzjr4fZzJLLu2+zePakZ2E+JtNggzPXuy+6aX6l1ScJ6i46oKfpXRXEgp05gAKTSVX+G5GQq4K1y7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364861; c=relaxed/simple;
	bh=A95d2GIq0LGINxNTQ0X0jagdj93BeIbcxsmEXG6311M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVEgMT/8lxQf2xSk+M3niehho0cV5C5071IKVJBev5llbkbDlh4vCTkSBVDsc0TiqQC7buTCXy5D0dE5GCtZt7G0GoY8cK4pMoCIgXd8g/jpl2/G9h6WBKRlIevcjeZ1F2+X4OdVeNXDKfZEMFAfIc8DMrwTLRjhAmCnPlzQbcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OZx1aWw9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OZx1aWw9"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-742c3d06de3so3718501b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748364859; x=1748969659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bzYNkPFcMltrg6TL9/1vuS1CMZo3Xbc2uegEKuHwEG4=;
        b=OZx1aWw9Qp3F4wdqn8KVKtx0M/LyTOddJcZLMbCv7Rg6+ljj+swDMDuMowa9YUqNJ6
         06KnFZToxannjWsc6WgtJnBHOXDUNfXpZEL/Z6CoTwEurJj4tNGY/6mjaQyMqawKh18G
         iHlGFP3H4y4bXFzIH/TTTJyC7ls2lBtBEZaJCaP4xXT7v6Cw/+qRj9LDu08298ixS6dp
         cQGf6+OXpllfglYgabvtIRcZ+b4RPFr3VRno50tgjCShrutaRKT4rIPG22D6CB6D3AjH
         votiEWDYfabsBkiJfd0bwM8B4HGRj2LOwYkzVtmcGP+lsXIoq/NPQD6ce6mjMWnC8/8N
         /ARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748364859; x=1748969659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzYNkPFcMltrg6TL9/1vuS1CMZo3Xbc2uegEKuHwEG4=;
        b=WEXYkAel33EFslu1NfoJ7H0FgkbSnwg69b80ZLvhIY4HuG5HZHoT60OJx7avwLey0F
         XOFcUirZ3vt9Uce//cspNIxgyO7u207JHaSGyFZXlZfExPeP6d7RawUFyfodZ6Z9pJNK
         5Aydt4f1tX4nCvNIetyp8cI1wpV8yONq+HKgGl0yeapaXWYwP9WU2NK/g8Hcl2bDUwx5
         IBQHbZQUV19F/UMGSpZi/aPBznQKAuuzK3FmmLgGqQnTGMpAegvSHAOdmrTSo7EWtwIC
         phGVF2mF9x/TsBdaGD+G7ttoBnXMFH0eV452Q7bJaAr3T40+MAzc57kCVKde7k7laR7/
         NLLA==
X-Gm-Message-State: AOJu0YwJRIKx3R1bLM13g3GNgfid+sBXtQfvenyk7+7TOxcHgo6qMXp4
	LrXeVEztceBBVvWJYIdSHnBhPZ8LEtEinMuuvR/02TZyArzZaa0ksj6+VfvpQg==
X-Gm-Gg: ASbGnctTFcqQjeD8kq6Tlq/U2yucpNDLIjeEo5VOUNVCkx/CRGaWY3gjfYFP7lMqQv3
	biReC5C+hcJwBQBYWQvz1GV0mn0TAZlg2B9+kIHSB93yqQ1pO42vwO2pkDVOQIxs8B+xZ9FtNC/
	6T/gOKAemI9joAxd6e86fmbSis9/q4a8c51QPS38PPoKrZ6worg+bjP2hElHNvSjnho+L4TblHI
	9uBnwkUm+LHDf9N6ghQYGrIJjy5Cbu5K/ADad1Adp1OpBWTOKNfmMTlshqfe+h+r0DaizZgEiSh
	6ofyYcu/0T1vzMPHGxztb/Qxms1k18NTQEGoUybeqhgW+c9UzWPiTCFwKFbcz2Sw+SOnJnCHDSb
	zL0tRCCrousA0rGEP7TsEgse+HQrRA21wJHm0qnJWHPY=
X-Google-Smtp-Source: AGHT+IFAEB/+zE1/tZp07UbvN9K23fTJlwCsIOkdRtfStGH7X1oSnvSjdzdlzt+6dEvD1qydvxUmKQ==
X-Received: by 2002:a05:6a00:3d15:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-745fe0701e2mr20685892b3a.21.1748364858662;
        Tue, 27 May 2025 09:54:18 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:76b7:939a:4a34:9771])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74628cc6b74sm1463827b3a.135.2025.05.27.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 09:54:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v3] mkfs.f2fs: ensure zone size is a multiple of segment size
Date: Tue, 27 May 2025 09:54:11 -0700
Message-ID: <20250527165411.3724453-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Otherwise, it doesn't work with a crash.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: make the condition to be a multiple of segment size
v2: relocate the code
---
 lib/libf2fs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index d2579d7..7a9245e 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1347,6 +1347,12 @@ int f2fs_get_f2fs_info(void)
 			}
 			c.zone_blocks = c.devices[i].zone_blocks;
 		}
+		if (!c.zone_blocks ||
+				(c.zone_blocks % DEFAULT_BLOCKS_PER_SEGMENT)) {
+			MSG(0, "\tError: zone size should be a multiple of "
+				"segment size\n");
+			return -1;
+		}
 
 		/*
 		 * Align sections to the device zone size and align F2FS zones
-- 
2.49.0.1151.ga128411c76-goog

