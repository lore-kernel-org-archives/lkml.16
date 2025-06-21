Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2AEE13E3EA
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750490124; cv=none; b=S5S7Tke4533a90C2CybnoXHsIKO+EGawixkOGILIkMyU9f1Tf53WUirJwGK0dqK0+6PpfDQuXYedLBqZarsQdrGsiRuFwnku6WbNyc2aJUDFoa01KkUnipfg28SbguRch7yucf/Nw6T14mQzDyFNFobnywcEKGiOa4Ep/AmNTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750490124; c=relaxed/simple;
	bh=BFQom8CRsfX5+9eMLCdrsz8BwecPF8NjpitltozJt90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxFfZLi1SkUHqVOMqoKPeC/LFHjI/6kax2jzF6J2AtJPzXyVrmyqw7pgW/XEWDEciCvrcAfkXatBU/ZVpcT8EGPY5i6btuq5wsI78+6BeYCPaIexDiZ6DO/EwqY3QCSgrvw3Ct/SqEmK6VIWLo8DtTiD2ZrlhzrTXo7Mpf5QSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BZy+UeoJ; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BZy+UeoJ"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so1985404f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 00:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750490121; x=1751094921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=BZy+UeoJYJzK4Ua2i11GnaneTi/DLi4ARS7Mm3TfqcZs9hEcHCdCjXkjlbSrFTpPSD
         JNLOubXUSzqFo4STUlTNaZSFfT/qEsfCjhUc42LNam37jdVn85vQ+Fk/nIyLkkmHE5+n
         1wjgUnzFib6vDJPlvXkBKuJbf3LVza4gAOO5BkpMdKNHSkuLPcaRxs77D24xNmg2n6zh
         8RaoGZcrKI8Bzd3eXiQMLh9v8xFHYnEOW7zQTqZvv+nW/+Fl3p1tfGzg5bu8aQ9PzlVY
         BdTD2vR9b1n4DPBxG51u8ziXN2hTP9LqGx3EBcnRuYA/Z6Ar8e6ayY5tBlD7Gf+S5cCR
         Gp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750490121; x=1751094921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=M3QFSWxlZEjaNSEqsQnRrqWZfRv61Z6miXnS2FeDkEnNbDPKnQFpDAaoBnfUBAcrkd
         pHqDO0FDsyzgJXUfENslZiwH5D9V9D3Haje9bvpgqMzbhkIXLeYSQrKkzup960n+mqTk
         1KfWAUctL5cz9D6wJu5JufZhz44UkjLb+VZuKS34RJQ4hYstwpdZjvIQpP0ysH9+kwau
         4KAMLfDSo0VmOfyDVHF9rV86d/7/NMYdBQzS7IwaoHEeHqBiAqtLJaRO2t9kqjUAnueV
         +0KARp6VgGXYhcgHGaS2hwi3zDlkJzziFPI3NFhT2UAGW8dMjqYSYoVIF22LEsWTxQjM
         PZhg==
X-Gm-Message-State: AOJu0YwA8+qJf+YdGA8Np7DfYHjOltn/NQrXz/TNM5G5uu95OEplHXeM
	Qpq/2l9g0PwHLnvf+pBhjhylqWMbnqArZfxShKQPP8lKkxO8PuU0pjpK
X-Gm-Gg: ASbGncuI9m5uHDKJhk9Pc8Gf/Aju7daBWlV8CfoSrbIlTCvuvjn/Z658kk6vIm6V+03
	htcJYCybH9gJb/Z9URcpS9x94q+ji5fdLINfW98ZcDVrkpPbMy2zA3LtUFxTyuDKsTL3cssKRtx
	LiI+7SJH0yxF6HKIobTLNf9d66DMWvpJN09SlmUhtwyp/qRwvs7BPEeg1XoLPrfBB51Xui80O2Y
	eYWmSYkGvvLZaLN2jf60oHy5EEZupnMhTcEfjbZzjWz+s4sVDytHb60sBy6RWbnHux1Ruj9l9wY
	dlzAjPa5Fm/xg+JEFdoR7hF+vaHBcKZu3n/kIjpQwuCcAaM5QllUg5BhRm0Srjoqye4NZO90/ru
	a
X-Google-Smtp-Source: AGHT+IFfXgx7lah06NyheeDAnh3Gk8GdcQ0K5aVsddNSMKxUVYKTdrBzg4dhRAuURYPXoEAEberEpg==
X-Received: by 2002:a5d:5889:0:b0:3a4:ea9a:1656 with SMTP id ffacd0b85a97d-3a6d12bb683mr4835525f8f.10.1750490120924;
        Sat, 21 Jun 2025 00:15:20 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c663sm4053775f8f.64.2025.06.21.00.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:15:20 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [PATCH v2] entry: Remove duplicate function documentation
Date: Sat, 21 Jun 2025 07:14:36 +0000
Message-ID: <20250621071438.750-1-khaliidcaliy@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move exit_to_user_mode_loop() documentation to "entry-common.h",
above function prototype for consistency and remove duplicate
function doc.

Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
---
 include/linux/entry-common.h | 2 ++
 kernel/entry/common.c        | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index f94f3fdf15fc..dad1f257e3dd 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -302,6 +302,8 @@ void arch_do_signal_or_restart(struct pt_regs *regs);
 
 /**
  * exit_to_user_mode_loop - do any pending work before leaving to user space
+ * @regs:	Pointer to pt_regs on entry stack
+ * @ti_work:	TIF work flags as read by the caller
  */
 unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 				     unsigned long ti_work);
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index 3e9f2d40230f..67df77732fd2 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -81,11 +81,6 @@ noinstr void syscall_enter_from_user_mode_prepare(struct pt_regs *regs)
 /* Workaround to allow gradual conversion of architecture code */
 void __weak arch_do_signal_or_restart(struct pt_regs *regs) { }
 
-/**
- * exit_to_user_mode_loop - do any pending work before leaving to user space
- * @regs:	Pointer to pt_regs on entry stack
- * @ti_work:	TIF work flags as read by the caller
- */
 __always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 						     unsigned long ti_work)
 {
-- 
2.49.0

