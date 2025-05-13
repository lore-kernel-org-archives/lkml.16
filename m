Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F100D12DD95
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747113507; cv=none; b=G+k4AkD+IRSwCjiqw9KoJL3rSSl350Asd11yWQd/0njZ3jlhQ2mHkdnvrjzzLeWuMYTJC/YcBW4bsbbojlw/vDktXd0Abi4wt4pj5W3P7GUBxY1+K8856tZzvaeFpyKCk9/kjazFtwv5s/m6Po3A47dTfHCs0q15IcOB74UUSNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747113507; c=relaxed/simple;
	bh=TbWaJOoWlWsrstw22SjfLYW+lLOas+rg4NEQr9OUqBI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lcPpeLdcE6gip8wf+ilr9j+GeGv26PSwKWC6U1kro7kHV/XIJo8bDjyHCN2p3kflY6rDbjWfubzIgHfmWzKLOPedkx5vQ2g66ZFlupb66WXd8HGhZ20ngTRMtLbRqx2V8j4Px1PPIBmOxEKoTkyXOuW2E3UOedRAzSM88SfmbeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9Jk6tvA; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9Jk6tvA"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b245ff89c99so3004027a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747113505; x=1747718305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdJUDpbdb/wOJBZlZySRKLEPN389jtk6jMDPKmkruHQ=;
        b=I9Jk6tvABWpXHeEa4F92kWkOfRSuKO86R9RTDhKBrO9RGZemQxCZx8VBTHjW15kNgM
         QQ0NTwXLU7ANX/LkK9EXPBX/1S1KqsRkBzaBUkAKPl6SiQ3r5IZ9gbSnQ+YMBcHtkWbr
         M0x/bW8szeUznhTCwp5OXRqySIQMN63ssZzrKM4wRUih5kW+CIDjJkQbhPHpl1byYhZ/
         lwC33APNiPw8CO9GUgbVn+4OenwFqZMvl3kGabuZV9qHBMDH12TewaOGOBSyhLEpM3vr
         0a73xa7ZiU7K16qJjZ0HpLt6RTt07wdOmtUIrQree2kkoGltGTi+YA/uyBIsft8Q+V3b
         saQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747113505; x=1747718305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdJUDpbdb/wOJBZlZySRKLEPN389jtk6jMDPKmkruHQ=;
        b=uX6c0SadndXqN4yldnPgDyYW+Xx/PpmHshL/o66pQtG/ECEUnWqjHBc22bLLW5VfcH
         Alor247wYeJstUhBS9zeup7/rhdLR5Nj0vA+fdS0mfSBkEcm7uchIY9zWWgkO85J+gqe
         ne7Dqz8dStTiEpmX/EkaV05ohCBJ1iWREY2S8CoYzI4AITXIs5tS5bgRyUlMEiLdZu4l
         Y+cRhGsNWX95Hf2F24eNAAmRRuPwmzclaEXqgxU0zC6xPlUE6pImDWu5ISNvrNx+M8p2
         w+TUS74pJt2TG9HhGkvykZ9L1jVV2GNWQkKsxLiU6YuM1BpT47KjeHAWkZfbDm7sg9qh
         G0Tg==
X-Gm-Message-State: AOJu0YzX/Fpj9BTU+uAPBubX+31h6RPdExAoZdzSwtv3M/tWj8qD/797
	it0fKnqIkYOFeR8AYkM/rAY/SYyY4hhS51C9zygnqzu80ZtKBUYGfoe0cw==
X-Gm-Gg: ASbGnct1z+cSRCXu/g9BRdUwD3bStMTA7xe9zGgeXs16Imh7LGXU+bu315kuRvDCNZ/
	+XQBY4iuXqHt1q6L2NchMkJVuZ1crRLxAiNKazoNiCqUuxqQtm5sCQi/ryaRWfeKLKEMgPd2Heg
	wXu/nchlLuynoVfNpep9n41uRU2n0cmKvFHO2FV4rJTlO8vVHeobo+wK1FA7oJ9lcsevJ25eAfD
	XjEUadeAcGAz5Tat/0tFz05LEX4p3NwebfnmyTXPBoX43sgVpnTfRgAljuRr50ey68nun/MGDln
	rkoTlmkLVLCM9KeF4bpVeufxvfanDtfa29kT2RMM14xZfaBf8uE1Lokx/htv
X-Google-Smtp-Source: AGHT+IE4z047sYg79CCZ3Wts8pgUTwrrm6J+L50i+KktfOuifWUw3r1I5YIwxALHOBdGBYG6skBP9g==
X-Received: by 2002:a17:902:e747:b0:223:fabd:4f99 with SMTP id d9443c01a7336-22fc8b0cbc7mr261044285ad.5.1747113505010;
        Mon, 12 May 2025 22:18:25 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc77420e5sm72618525ad.82.2025.05.12.22.18.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 May 2025 22:18:24 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Lance Yang <ioworker0@gmail.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] MAINTAINERS: add hung-task detector section
Date: Tue, 13 May 2025 13:18:11 +0800
Message-ID: <20250513051811.43397-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lance Yang <ioworker0@gmail.com>

From: Lance Yang <lance.yang@linux.dev>

The hung-task detector is missing in MAINTAINERS. While it's been quiet
recently, I'm actively working on it and volunteering to review patches.
Adding this section will make it easier for contributors to know who to
contact.

Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1eadd0ce07c7..c5dfc80b2ae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11100,6 +11100,14 @@ L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd Fixes
 F:	drivers/tty/hvc/
 
+HUNG TASK DETECTOR
+M:	Andrew Morton <akpm@linux-foundation.org>
+R:	Lance Yang <lance.yang@linux.dev>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	include/linux/hung_task.h
+F:	kernel/hung_task.c
+
 I2C ACPI SUPPORT
 M:	Mika Westerberg <westeri@kernel.org>
 L:	linux-i2c@vger.kernel.org
-- 
2.49.0

