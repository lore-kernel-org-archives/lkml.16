Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5786427D771
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 11:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321544; cv=none; b=Js/ceUNBUBmO6kXIQACVWk5MhyKes0UHmycY9U5eb+JziTf0mX7xf2MWhLI8pI9k2JoT3rG1XTlLr2Lp5LG6SUzaZ8jd7e98icII0IuNS3FBWO31h7lrmQOirCImtitcqwMQRC74uMKXvSmTaGHfpxDyxG38pC0bXKwpM6O8Qkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321544; c=relaxed/simple;
	bh=ZEfuO89SqASiM7GrCPCbp+s2T96g+unLkUU0ynS0zgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghhkVHdTIC6VS6vkVURqaTPrhc8UtREhXF14nXM3GsrOrdg6iqvC4GHnNX6zAQHOr7eYMd35jK/8AytoKFS5+LYN/UFmpryw4VoTxhGPfTMeTXgLvydWBIPxSRGRWiMFQTzab/bv8JjsvIuM8iTB7shKHpLjFl1RZGKeWXZcEm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GU7LQMgm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GU7LQMgm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso48339335e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321541; x=1745926341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=GU7LQMgmVIJUSoeSNKjC7TGDQUXttCYFRYCb7dKAB517LiucoTqHa1XD52VppNUgiI
         k9WitxHy7GgbkMEkvLBQ1Pw4hQpkb0LVC6pxCgoD6n7xlSlepDZLunog2+WIH/HGgwFV
         LwBxkQzSP5SjEz3RaagwxzxlHJh8oXFcvCosbzmTdlLSVMdEQk92aNWK1z7aISTcENYz
         dqoMlzowXCbN1kcIcYpeythaRyqehNbVDS/8t2wV9A97vfvyc6jGuTph8ygJxdUFMaBx
         ub+eohfH4xUBSyvOutGu+E3tE2nKEnXywM5bw+50I+8nxd1Zx6Wx61fznsDgen2/BtWI
         kaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321541; x=1745926341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9mhCj0ekrSAhKxeAdIDKoiXrDacQrSQO5Vuilr0jZM=;
        b=QNqfhneS70VtmIR43ALX92CmvuOw9LJakpNT+EmiB3X8gVN4D1a+zNDXnDc2g5QA31
         vfGddzQa8Is13IOM8SSpkIajH2KeZaDaa0mA69vb3c2AWsVvXp1RMH+Tgadl5gyrsYLp
         Y3Wa9krsX4P9B+YX8Gt54PWCvf5xPSOkPk4AbmJQtxGSKEl1KOPbECtiliweQmTp5Snz
         uU9jD2YYfoJWu1mqZsd6K6KLI7NBvDIh4aujSLjKOG7sXQ2vpTdqKAgAC73Xj76vhy0k
         YDZ6HxQ+4bgcihajUQ2P6qstk+AB7tKiDXW3UdoVoZjEOjCBvlEHEx0TTrkNgkvo/Ndk
         KHwg==
X-Gm-Message-State: AOJu0YwbZSVgHAP+/8zViIKnLXqxmq8srCGnCRBzywCyV9HIHaIQqCA/
	15qtfhsK/0P3y6Me5C5b8k1VyTZjPGOCUe1hRPPjJwHu71wrnsQ1TmAG+AW8BMKlMUoYgZcSaXD
	I
X-Gm-Gg: ASbGncusQHBwvTaZv2buK/EmEh0GO5ws/T2txVed/Ix2agwEaQf95bKrpiCUBaLrzf4
	A7jCGq7PnlqpF9mhBRiwnQm57W+9gq2WMMfTlF3niE5X/qrpAjRBfP8rpAWUFelW+mBNdGI1Rkh
	OXVDHnyQi9jseEQNY6m7fsnF2OLPw+30U3yPw88k9V+GC9brah4bn9vtDmZpDXl7jERtfUIsQAs
	fbMlz8a9n5jb/+2k94FfDs2ULaY5s/PvRpRGGMx0b4mOOVX37aBZ5csD1dxqeAFLXC6LX6qqqA7
	5OrCqeewNb6s528IkdGQbbgSqr4zB5WtScH2VYq9MVYIyN/Vt07t
X-Google-Smtp-Source: AGHT+IETnKdGNbtMn7JPOPRBj99xAT5wJXNpOwUNB001P6TYN6eu4ikfra2LHHxXB1sLzvhGYsSz8g==
X-Received: by 2002:a05:6000:1ac9:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39efbadeb66mr12760697f8f.36.1745321540656;
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 07/14] printk: add kmsg_kmemdump_register
Date: Tue, 22 Apr 2025 14:31:49 +0300
Message-ID: <20250422113156.575971-8-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add kmsg_kmemdump_register, which registers prb, log_buf and infos/descs
to kmemdump.
This will allow kmemdump to be able to dump specific log buffer areas on
demand.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 include/linux/kmsg_dump.h |  6 ++++++
 kernel/printk/printk.c    | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 6055fc969877..cbe76c94710b 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -80,6 +80,8 @@ int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
 
+void kmsg_kmemdump_register(void);
+
 const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
 static inline void kmsg_dump_desc(enum kmsg_dump_reason reason, const char *desc)
@@ -112,6 +114,10 @@ static inline int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 	return -EINVAL;
 }
 
+static inline void kmsg_kmemdump_register(void)
+{
+}
+
 static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
 {
 	return "Disabled";
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 057db78876cd..cf4aa86ef7af 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -48,6 +48,7 @@
 #include <linux/sched/clock.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task_stack.h>
+#include <linux/kmemdump.h>
 
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -4650,6 +4651,18 @@ int kmsg_dump_register(struct kmsg_dumper *dumper)
 }
 EXPORT_SYMBOL_GPL(kmsg_dump_register);
 
+void kmsg_kmemdump_register(void)
+{
+	kmemdump_register("log_buf", (void *)log_buf_addr_get(), log_buf_len_get());
+	kmemdump_register("prb", (void *)&prb, sizeof(prb));
+	kmemdump_register("prb", (void *)prb, sizeof(*prb));
+	kmemdump_register("prb_descs", (void *)_printk_rb_static_descs,
+			  sizeof(_printk_rb_static_descs));
+	kmemdump_register("prb_infos", (void *)_printk_rb_static_infos,
+			  sizeof(_printk_rb_static_infos));
+}
+EXPORT_SYMBOL_GPL(kmsg_kmemdump_register);
+
 /**
  * kmsg_dump_unregister - unregister a kmsg dumper.
  * @dumper: pointer to the kmsg_dumper structure
-- 
2.43.0

