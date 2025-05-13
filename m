Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB37A1E3DE5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747113764; cv=none; b=Ctb9EHzu2lDdDEVGk0tvU+y4rHMPunjqWL2I1si9tQtheYO38AORxfbjBBpbgvgV9cZ784WVjLUP1hhlmX2sT9vHrA+g22/DfB7Ps72vfUDIZ9or8r4tEQL77vQhHQ8KthKrvKFQ2e5Rxwuq4wn6jPPcw9PtT8xI90NhKIH0OcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747113764; c=relaxed/simple;
	bh=Bz2ovNpllZ8puG9cL+swucB8NsMoDpfljmil3ON+w48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFKnDLqNrKc/cIemjFOpbJKT+JnancTf+LXeP/qT0FIrTDCPPQS8P9/nvAyRoifM5GbHRzAy2yTa6ijVYXfynmBD5PjuAiQR6hRRnd4U89EL7DZgP0MXjAArPxdlmNC1v0P2A3UNUQF/vebJWK9E8cY9CMJu+SK/jF0UlhNommE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWPbGxAI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWPbGxAI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74264d1832eso2310612b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 22:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747113761; x=1747718561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A7BrxS1qzFSmjvkcHvhlTOR5s2jHtzrUvT+M8HebgX0=;
        b=QWPbGxAIyN3yAlYiNLVbSPzBZWDpnu0746BESOswuLW6Niya/SchXQgEOnVzrqL8xj
         iDBxBCaDS7zRwKcs4aW2U6LDD1TwXemaOt9PyoYoxJHl2PvBT8Fm6TBW4cZp0U54Bc00
         OThE6HnMeLHUWoMnZjBIcbBiyn+mCgM+jkJPWbvgAjqs2dASIXEloZkZL2SwHRy9nKOG
         1TyYfh3KBs9vOgDuCLHkfCX1IDAkmzmjYvcOy4JvhjdpG0C6wDNntfPpBNgmPjxd9DxT
         lro1LSh7aq95j5jJFcbQeo0oUFz4CHQIXOSsXskEQAq0QHJpQvsEBJnCwBwoCqrFkezw
         6Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747113761; x=1747718561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7BrxS1qzFSmjvkcHvhlTOR5s2jHtzrUvT+M8HebgX0=;
        b=r2Nu0dSHDhRb4AnmLw3envybg1nLS2/ow6dt/mXi1yr7QnstYtvj751b1cDtyMqQcC
         B/Ty5YP57/CnCqd7ivmA/oCl7Mb4tdAl9eadkjgm1I6X/sKo5QJCZhMDGWD7cHEuHjsF
         skUkBWgBZneyu+GweMqktNiq1aUW/xr76CLWmao8sUgllKkw7hmwwKbNW0WPTuK9Ryu1
         Ms3p3ZXeLJyuXmnHjz7EtXZcaZbLFG85l1o4dIDOMf5NNEa4LFuDAOTX1ebiVNFLLxZg
         Kjp+MVd2Ik5rX+R5FleKFs3SY0lPmB+oXArJ4gUSiMjpj7PhFxcyhgy5Ox+YyLn7yYtH
         AMjg==
X-Gm-Message-State: AOJu0YxvC6eg8T2rbiQqJePbJwiifbeB30zbW8uSGVVfx6+/3c3SwEcz
	mi/aUcVaUrtYzZ5ASPPW5lCjSZPw6Zkq5F5Q87aOlwD+Fe6BKzl4KE17gg==
X-Gm-Gg: ASbGnctUWrtbElr5+CX9GI2OqmcNMm7sUxJs8LR7y6BmrUqro0P0wyXbOVZjqpP6u+a
	v9Wof+9F0WUzFZSwH0yIIZBbtY44Mydnh2BFXTrym/rzlPyCEYWzUL2cXoHbgzGwTn6/yceQRce
	EGTgIQR5FY3QM7SUxquH1mfc5gdMQIIJ9G8Zr8DIq+ENtRha//a/JLd0a/YM7UxpIsxnx6JCR11
	N810opKcmszuYuXMtlvjThOLBKtnOkubQpFxe01FDpadIdS+kwFD1QWjmah3/sS6b1CcXdhUA1P
	WQqScb1bul9tMmQyYuz7HqZ1NWHfaMwAyFnorV0uNdbnbFspmDyQmss8kx6E
X-Google-Smtp-Source: AGHT+IEC2SlbhIx3qOjgKJ0zQKgxMlba3uaaYu8W45SktcX7LCS1aDq8zDsulteUly/YJWvmjNk9sA==
X-Received: by 2002:a05:6a00:2313:b0:736:692e:129 with SMTP id d2e1a72fcca58-7423c0421e7mr24074573b3a.24.1747113760895;
        Mon, 12 May 2025 22:22:40 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([124.156.216.125])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237727a1asm7281898b3a.54.2025.05.12.22.22.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 May 2025 22:22:40 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Lance Yang <lance.yang@linux.dev>
Subject: [RESEND PATCH 1/1] MAINTAINERS: add hung-task detector section
Date: Tue, 13 May 2025 13:22:34 +0800
Message-ID: <20250513052234.46463-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

