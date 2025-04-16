Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7663188735
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781495; cv=none; b=dH+BA894eRvFvHafT/PZqY1dSDocquwzb9ARDwFSgqpRtiyUMyOG1Dr61pXCO1fRKvVHrbYwz28LZS7ul3PNpGi/8HqJACsFITFBEDXvnE2O5Fqhhs+OZGKj1DHUGOk0/fpsvmHGvuaiMs05rxXhAgmvkN7mh8hP64yqfS2XxXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781495; c=relaxed/simple;
	bh=vZmMqwCoPGEpbjlYgVrbWq7PQvmeQqOpFND4sSyhKNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oTFg6AzS/RZrWPkKXpEysZNm1batPdHJwD0U3cw7j+7QdOSfTtCO0lzF08AyXKp4X3nsqy6sZP4oEMVCIe8vFI3y1zC3xz7gIZittLivb7gjO32bG900ex3KWJy9kRrz0EEbcjEAc17oCt9Ed70sbYxkDCzzX/DyjgZOBztF5wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKjZ0ihS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKjZ0ihS"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-227b828de00so59088225ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 22:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744781493; x=1745386293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=kKjZ0ihSAE8qGYg5ECxJmz0/XyTce4ao5O+kVMpvorfnQmi77eXHtkyKWn+WFBekzD
         9F4AV2ESPxj/yPH6fw3av2Qi4zEkuank0blPJE5K71fmTO1hY2U4TRiOAetCj0IH8LeF
         OyOCHcaLqo6RhTLJvrG5PJNqiID9u/2bIUuFsHIG0thzAQsFS5MZM+lVyQ8X/CokI6RP
         866uxlSUtwuFaCrlZy+i/E2BEJn7Z1/pc4tV7OKkOchrYSRQyCX4AwQM/EDcaZuymToC
         DXG/fkpsMQzTASPsIdFbIxFwoFoNWaVidFME94zdbazdS8oD7j9Vs7IVQCwWeLYcEM/t
         rorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744781493; x=1745386293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00U42ZzUOxNRO4D8XKQxhoyIsJ3n5fks4Eku3muMMVM=;
        b=lyrUPm5U0ne7UfEyCaRJ8U01t7JNTsPzPy4Q3IV+CH2basKYOu+yhrjAEEKptPGQf5
         i2ah7+C0cFYAxpRxZt6R0JTg7dM2iglm7KLDa4qJb9AeVrJNcHA10phCNIBSGk2wNgzI
         Uaz3zom5JCJPDS07sMqG40hhfGjDMZp0kBDaHZ7pBJb58ocPD6wuuOquf3RhHNvMCWe6
         bjPmFkZDJQS6WqXy5SMCLnZ4OoVBL2ud/XhkNPDcxPGVOLb87WvMVDtQBKqwj9TK70Wz
         aSa/eDHutdiY5+NdaGyp9x5SMWAa2EyqRupUGJNAbZytpJKA7Fgm92gHOqvWd8M4oCky
         APnw==
X-Gm-Message-State: AOJu0Yx/9Z7wUAzxUKB8TcW+VyOtvbpyb8MmCGrmtVX087hAgfQwgwrV
	KoWiQzck2wgdk1D9CAiO4FE9B0aanp8u2BjXqzDwwxi6Hjj4p0IcdgHHrmQf
X-Gm-Gg: ASbGncvL1fMx6hrk913COMTIaCUKkxJyTetRfX5CFMa18ilkhW+ZJzEy7enOEXXfBHH
	jr5NwUt17Q6hWxMgEEMVOCIe9VmbEtM25zWq+TN+bqeiRt502yazb/abwGmuPUdtrnXXRWE9Y8E
	jrLhliQRrlIoCthz0GnXAbDHt0euaRfrUbBmzg4H/OCWQGI4IM/Vc90Pdp7Xl3fuF8sYJAzt0Dh
	MLDy4Eilp9H7vphkXQyeM5xLrokLWerZWb1YVFblFJYVMDY0ICtaApzkaowiFSSj+vSrlVJ6V2e
	/+XlhW7RnJz4RavTlfMBGbaqB628V1c1PTut1yiZOYDw7FnNEM1MtzN7
X-Google-Smtp-Source: AGHT+IGzBezkIxVCJzUUB+qdYid6a8gIORMDZApggDa4nKeAbIQxX3qnx8Tko90P0qOPsoR+muKfZA==
X-Received: by 2002:a17:902:ea04:b0:223:5ada:88ff with SMTP id d9443c01a7336-22c3590cd65mr11156435ad.24.1744781492715;
        Tue, 15 Apr 2025 22:31:32 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f1bceasm5212715ad.62.2025.04.15.22.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 22:31:32 -0700 (PDT)
From: Shankari02 <shankari.ak0208@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org,
	skhan@linuxfoundation.org,
	Shankari02 <shankari.ak0208@gmail.com>
Subject: [PATCH] m68k: replace deprecated strncpy with strscpy
Date: Wed, 16 Apr 2025 11:01:14 +0530
Message-Id: <20250416053114.693917-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of strncpy() does not guarantee NUL-termination and is deprecated
in the Linux kernel. This code manually terminates the buffer afterward,
but using strscpy() is simpler and safer.

This change replaces the strncpy() + NUL termination pattern with strscpy().

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 arch/m68k/kernel/setup_mm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/m68k/kernel/setup_mm.c b/arch/m68k/kernel/setup_mm.c
index 15c1a595a1de..48ce67947678 100644
--- a/arch/m68k/kernel/setup_mm.c
+++ b/arch/m68k/kernel/setup_mm.c
@@ -243,8 +243,7 @@ void __init setup_arch(char **cmdline_p)
 	setup_initial_init_mm((void *)PAGE_OFFSET, _etext, _edata, _end);
 
 #if defined(CONFIG_BOOTPARAM)
-	strncpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
-	m68k_command_line[CL_SIZE - 1] = 0;
+	strscpy(m68k_command_line, CONFIG_BOOTPARAM_STRING, CL_SIZE);
 #endif /* CONFIG_BOOTPARAM */
 	process_uboot_commandline(&m68k_command_line[0], CL_SIZE);
 	*cmdline_p = m68k_command_line;
-- 
2.34.1

