Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834928A700
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923260; cv=none; b=qkF4xRAKdMQlYMtGNL7/XXlMBouXB6DwmPvW+MvTXJJz4zI2dhWmdkxNFPPwJHbLugP0Jm2EGW3Eh/ijeAt2Q82u8qaDgOUpk9j5nERLQemRAX/h4/xGEoCTS9zjLB0Qulqnn7jBGX01pi49Db9H5EOBvFuM8HalYr2DRY9vjGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923260; c=relaxed/simple;
	bh=NjkTfzFMyAGXuhOgKQ109s7ClQHXKV1V0DZBGG1rmro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=juHnaFeRGD6VRAhGc1Bmj8wFMrUa4sUYxjI2agxVaE0yWMYUV+nq7ewM9LQUck/THVyDHFIdjK9JKIkfn7KaopynBxnoTDqoXcAmgPp4VhMAB4oTdddnAhNNvI7AHSU1GYLum6ypDVDoEhOTQSYxiH9X8SK5pC57kGNT5IpmLR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=VBbe1Rxu; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="VBbe1Rxu"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0618746bso66113985e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747923256; x=1748528056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U/uSymK2KQolRGNG/Zro5bwOoIkGZ6ivjeaFlFxOB+M=;
        b=VBbe1RxuogT4M7dGw5g/JO+q6uFqQQjq45rIOCEPBobNpjeSt/zkOF6wleASLMktpR
         bIJczm+Helt1zdrU08kASnyelExoeJGAt+gO6rIM4fMie0Lkhn8ngEYFpGfECyICgFW7
         HEdts/JRwNQGKuGw8DN7nfukmbGJp577TdJOeeotVP2MTERpCGRmL/B0GSWBoNk5ZdSV
         EhyKpdn7jehwwwyM9LXl1ZHaRk5d08GIDcbjOmUL33nYFVy2Q+9mQ7Q9iMmQsnKln2jk
         NJ3/nPXT+8B9lzMrVLpxK/o61rX2/0Fk5hGEppxESLhzBwp+zrY/LLQoDp1X1z6NQvjC
         pzVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747923256; x=1748528056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/uSymK2KQolRGNG/Zro5bwOoIkGZ6ivjeaFlFxOB+M=;
        b=QmUqJxNTVroQObanx51YH2lSl4eZWetBgXi/YVDWcc/wqzVg7H0/ZW4hCEkYqkYRCS
         ZSMAhv79yiNODmXHC/SewnBZFyryICS0Gn4bIhgd9aKkd6SayLn5VoveZi+p86iuyOj3
         o9Y24PJgWDWERPYFrf+c88Jf6t6QREy8o6mzwVoQhkCNgR0HNjY+HBPvAsQE62sYD405
         Xx4kqieAnkR5NqWl8XKPYzxNelfdYdhGusQjYzxhJdGi2SneA7xkEk1vZUKjGkvnVs3J
         1nyXKBFEYI2bMdPKlVAjOBOpbMXa707A4I+w9Pyow5V0Rrb9ECHOZHNYiaS535Iv+ByZ
         9plw==
X-Forwarded-Encrypted: i=1; AJvYcCVtx0/qIwWrnzcQtd47BbSdn9fBkIKBTwe+ja2rMj2eZZCvOj4tlqTmmciemgYIIebT/WaFlP76XgYj/JU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM2JUE22GleLWOeC8HfYyR5160JJXBbaY3UKYqp9WBtBIYmjlS
	I1XNSh1KRZSNROuMnusrojXXeOvfSXVsVNyx8ykz7Pg+H9w+aYqhAE7GZvFkgbwiXc8=
X-Gm-Gg: ASbGnct4a2/yDfSe4ZRrN7fmg5gBvnWuV6IPcIikmVcycTCDsXtlYSB9ya+Whi8SQD/
	u7AIfbIfy8KH63I3R2TSaRvmkFH8st7jx6tij/qY70QoJW/Ra4EQixuNhXNFspxkfCgxB+IL5ex
	XY/gkhy0VQ84Dyh7j8OqJOp29DlAPVCpo5u89DcmD2VrqmI2tcjz5njrz0ZbmU14DRXzyeEDygS
	kjKHzWhihPkHob3Cen6yURbPGTainpOgJE91xePGRFb4yPNvJDf3xwXxRt2/D0lnnP9kS6LZABa
	m0U1rSXvY+mLCqDC2vZThawh/tI/Q/i66ktWJ5xq5kA6f9ZBnzyoymxuQtC2/Z3stqyaiyvOx1r
	e2l+DFw==
X-Google-Smtp-Source: AGHT+IG0f08eYuSPxr3k77OUaqNYl8jJN0PAzE7LLLCfL4pu+eoqr3PWdm1MbbqN3+STTYtiLTQqeQ==
X-Received: by 2002:a05:6000:26d3:b0:3a4:7373:7147 with SMTP id ffacd0b85a97d-3a473737314mr6667933f8f.25.1747923255863;
        Thu, 22 May 2025 07:14:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:a754:c956:d8da:801c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caaasm22910191f8f.83.2025.05.22.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:14:15 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] drivers: acpi: Fix platform profile driver on !acpi platforms
Date: Thu, 22 May 2025 16:13:56 +0200
Message-ID: <20250522141410.31315-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The platform profile driver is loaded even on platforms that do not have
acpi enabled. The initialization of the sysfs entries was recently moved
from platform_profile_register() to the module init call, and those
entries need acpi_kobj to be initialized which is not the case when acpi
is disabled.

This results in the following warning:

 WARNING: CPU: 5 PID: 1 at fs/sysfs/group.c:131 internal_create_group+0xa22/0xdd8
 Modules linked in:
 CPU: 5 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W           6.15.0-rc7-dirty #6 PREEMPT
 Tainted: [W]=WARN
 Hardware name: riscv-virtio,qemu (DT)
 epc : internal_create_group+0xa22/0xdd8
  ra : internal_create_group+0xa22/0xdd8

 Call Trace:

 internal_create_group+0xa22/0xdd8
 sysfs_create_group+0x22/0x2e
 platform_profile_init+0x74/0xb2
 do_one_initcall+0x198/0xa9e
 kernel_init_freeable+0x6d8/0x780
 kernel_init+0x28/0x24c
 ret_from_fork+0xe/0x18

Fix this by checking if acpi is enabled before trying to create sysfs
entries.

Fixes: 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI platform profile")
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 drivers/acpi/platform_profile.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index ffbfd32f4cf1..b43f4459a4f6 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -688,6 +688,9 @@ static int __init platform_profile_init(void)
 {
 	int err;
 
+	if (acpi_disabled)
+		return -EOPNOTSUPP;
+
 	err = class_register(&platform_profile_class);
 	if (err)
 		return err;
-- 
2.43.0

