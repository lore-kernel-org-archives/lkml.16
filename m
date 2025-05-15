Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796BE264619
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333427; cv=none; b=KFeggH4/aDNX/uUkhz3AKmxpX4JdeQA96yE/SDzCjsJRx9d4FrAnTpM+CEQgFx8fevtKoFtKWRKN/ut16HaQBq2N9UWbMB+lC48D8f1lhLkTD7vs1uMU5nkKIE3MveRmLau5NfUY6VYmpNJRgdX42lm7Jtr/7glnTVBG0IdcxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333427; c=relaxed/simple;
	bh=lWJrKH2ewgb0eX1vkGmRIsvKb0JKgD/qXbGK9GoZ+uo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=imnjCO6mRxU2iqNm5jDGf2/JCvDIECHlZwwJGfg9OAXljaO2Pejw/4KhZAD5rQeUoAacqPhy5quK/S5p+D0y88Vc93c9te5EYqQJQp4Rcw0N3qsNn1/teHFl41e4OTQMbSyQOIaDVR3mwci5d54WTIrjWewPG8fga/txM6OUOD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=D0Eqp9zJ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="D0Eqp9zJ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5c815f8efso113959785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747333424; x=1747938224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEniED4DkTfmCqxmyCGUmyvqBa7+e8K9WWMdUYmkBGg=;
        b=D0Eqp9zJZ7DicQmHcbwa5jPlUzbivYzyCqww5b+c3hGrh7TApxjAqYkqjrAcTeLyX0
         XcNnSwNxcJSEMFLvUKGLjxz9j7G58e5eiiP07CoNeD6/wjCbg4fUn8Y876rxemK34YCI
         x2gZ8aCZ3MVJ5mzsbtKCd5IHYPeArjQDcJcVZZeCJa9Ti2sHp5abtwICdl3W/vm/HNQa
         VTbZKVTngt+9VHPC4COZWoreRiPZbBg/pq5xf/sKXUYu3/Kf9oF0WBx6SlBMq6IZLImY
         pA9gfAJ0TPYkhzzvp+bwxAUzY7Kt3/M6xCgzUfHhXaL5W5UOBTeif68NOHQ99jAVuuUW
         mYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333424; x=1747938224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEniED4DkTfmCqxmyCGUmyvqBa7+e8K9WWMdUYmkBGg=;
        b=BZ1JujaaXJfzrtTpxWZYr1sP5vVV1LYdnL11YrNw7qXXD8+VRyAQLJGgRvnsgU2B4d
         yUcWePUVip6+s2oia7CyeoLR4Jk1+4jMMNIMtAqpeAmYvVu8pDWv2794a2X81nqgXZ7H
         X/27t3+7JzidHgaIgrjM9bNAc8cgkZ0IigcfIR4TniW+x7Yafi3+hIzEPflm+WwGxNzF
         ZOzzQBDdtGOgjiBT245/nlZmZt2leIb5tVtjshZGmauIgoelE8tx76EE4nHaF4gCZPqY
         UEHYVH3JzYBuAzBA7R+51CJfKB5a3YKeKRRp0A8CIHVQDGSIAC5n0vx9E68YVLlT+x2k
         aW8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUG7Gj3wxTVStpQMfX90TJ527uheGuNn1GXUejUTcQrC6j9RDSuofqL/Gg14/AMYg7L1XhgPCxc2arvdJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wlDi/GUKViCy4kBW5TCJJbWNmCiM3F7wEKXWwU3rMkyC7W+P
	dIV6NSStGLzoJ9DvKJOfgtyQwQKIFudV3/8c4VZfhL9Gi+ax9RLALH7h+KMy41ft0yU=
X-Gm-Gg: ASbGncuy7FP5mSuN99/ReCK1knM01tT9mfpzR0tb1glCsLL3Xw9xw9CWMKwPl43xi3w
	ecG31wZs2WTkGEdm1xkGwQxIrPLHPNMWL9x/9awWoycWWy2mBU2IEnvrIfdZDVAt8F1ONIaqdZH
	EUZXQxiT+e0ERw0EQee1BNf+lX5gLfmlxX2mFAJ1dzQXvtSbMewFnZJzYU/iBlqpGN0PZoEXfcD
	EPedyDzao7dgc4hQ07fPwIumtApRDfIif5PkDJLak+LnNuoGMcIODymTorR8OtXibaw/78Ou5UY
	poLhentS41TreoB0W2z/hjaExr3DKy2+EgzZUNbUVRUIkz75Iut7ZETyRCnOfUVP6QbuhqatxMU
	Gst8KuhjQmMekcCVsbSJCD57wlZF/vGgMLMi/+gUHMDcWk+/R0VVmn1U=
X-Google-Smtp-Source: AGHT+IEEvhDcK0rfSEs9ibsvsuoGoyD122Q4/XnrHONMAwVJ+f9mAQ9x06PYH/dTETAU7jGtExspCQ==
X-Received: by 2002:a05:620a:240e:b0:7c5:4c49:76a5 with SMTP id af79cd13be357-7cd46718986mr65234785a.12.1747333424033;
        Thu, 15 May 2025 11:23:44 -0700 (PDT)
Received: from soleen.c.googlers.com.com (138.200.150.34.bc.googleusercontent.com. [34.150.200.138])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd466fc2afsm18218685a.0.2025.05.15.11.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:23:43 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de
Subject: [RFC v2 12/16] reboot: call liveupdate_reboot() before kexec
Date: Thu, 15 May 2025 18:23:16 +0000
Message-ID: <20250515182322.117840-13-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
In-Reply-To: <20250515182322.117840-1-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify the reboot() syscall handler in kernel/reboot.c to call
liveupdate_reboot() when processing the LINUX_REBOOT_CMD_KEXEC
command.

This ensures that the Live Update Orchestrator is notified just
before the kernel executes the kexec jump. The liveupdate_reboot()
function triggers the final LIVEUPDATE_REBOOT event, allowing
participating subsystems to perform last-minute state saving within
the blackout window, and transitions the LUO state machine to FROZEN.

The call is placed immediately before kernel_kexec() to ensure LUO
finalization happens at the latest possible moment before the kernel
transition.

If liveupdate_reboot() returns an error (indicating a failure during
LUO finalization), the kexec operation is aborted to prevent proceeding
with an inconsistent state.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/reboot.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index ec087827c85c..bdeb04a773db 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -13,6 +13,7 @@
 #include <linux/kexec.h>
 #include <linux/kmod.h>
 #include <linux/kmsg_dump.h>
+#include <linux/liveupdate.h>
 #include <linux/reboot.h>
 #include <linux/suspend.h>
 #include <linux/syscalls.h>
@@ -797,6 +798,9 @@ SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
 
 #ifdef CONFIG_KEXEC_CORE
 	case LINUX_REBOOT_CMD_KEXEC:
+		ret = liveupdate_reboot();
+		if (ret)
+			break;
 		ret = kernel_kexec();
 		break;
 #endif
-- 
2.49.0.1101.gccaa498523-goog

