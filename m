Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C852E36F0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653751; cv=none; b=mtYxx6THy6PS2DUd3tjaUllfOqCahwGV72dqiRoSFKSNzXIu9a7hitDgK4+i00qUUO1YB4pdNbtztWIGwBWlXPw2oOwPhFmVlbH0KWWmMLEdD+t9lCskKdV7pR6WIMVPeTw+DzjnITEqbONbVFYlRqb67f7+uilNdMiN478lxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653751; c=relaxed/simple;
	bh=BFQom8CRsfX5+9eMLCdrsz8BwecPF8NjpitltozJt90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=afELqqqOwX6JoRynxowv9xw0b9vbNdknwBq4EPBDzQSRKnQ3ckWKWX6FPV97TxfXoy6oZQmiwSwlGM5PTJRI6DcU8Xgtf2rYW77xsyKHeoExbBjke0j1vtp16Sx95a0q2p2MObO5059quJ5VlM6BjF3AmCMrxpS1u+10isnUREY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXFZdIoz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXFZdIoz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so1524649f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653748; x=1752258548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=RXFZdIozgWR9jM5ug7xgS7VX7+mg/5sR1hvAnXmVci2DHUYIVSefCt+J+/D7a0zd/M
         aknzQPWt+pGrfVOYb0LRLnUaDNgsmXC7sCelg0t0vuomzVCyns16fNn9H7ltm3AH5fNO
         cMrkGZyDVCpfBQq+dyzDuihqChRDu5GNdgoJlMRGBgoWWRdTzzcv1S5jkMjiXYXix4gl
         Nndm/f/+W1rKc4K575O5kGUSa2NkAofYnEgR6BZOGKh7Boa1l7lXcOAUpxk2rfSz+eIK
         IPyWFWV0tPiYkcO+YQoTeeDi+rpWSZa24iXi3DeO10FnFe/Hf+v25I/JHFTZQejfYtcX
         o46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653748; x=1752258548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Lv+MSsgBNOJHMMndsvJGs/aVKU1C3SCJjVTZh90PrQ=;
        b=eUcicVArMvsu6LiJk91FW3ZdfdMT+EF9RAXpyI5ZMAI9+F6DWrj9d+lI/PgazCkhAj
         kI8xarrH3gnbaWqHwO+I0e3QxUUKmnodofH5bGlvsDLYTN0dpAIvOyBo4Jp1/J580O7D
         jHrdiabgqKrldBREUmMO/XxpVb+X5yNssWkrCqwhtbm5wU/OR27nCuLGTv/qsI5RKueV
         L8CI+waSWgKdQpEonmKuZ5UGnle4Sg+uVxof3Fqn/E1XhOckaIrKACP9q1QI/6gywnWM
         3cPSQghhKS8tWXyC3nZ/6bupdwlMuDg0hZWjcK4L2gSPmYRzFU713P2RlctZcfvKGnog
         bl5g==
X-Gm-Message-State: AOJu0YxX67o0cxEF2cLiZ3iiCBlQ8ZEnQq4WC4V0QT5c151z+Fb+M5fM
	M0BpSTbx10tBv9uP2jx+fpi5j7U0v7oPTX10Xz2sGMZkteCjz4zIqr7+
X-Gm-Gg: ASbGncsCv7BA64lAkAJeQGoA2srCblw2UPEC/DB3ftW/VIxoerWSzo/vQozyncUu8Pe
	p9EcYMYaoiJ0iGlXvByYoyBDf/zN1zJwS6iwre0TnMmHx0NFXETNp2QPBdBTG4PlwMOD8FRx9Xb
	DWjfkz79bqZNFDj3lEUvO4VbC7qIR+MQnRJMSpFhppm5qIhu/LZEI79aPPVH4X3zmKwmzahhEaz
	TJAfZTEUEAHs4QloLbgc+H4UJzbKYzWpd4aNlF4hMkRzL2P/zHRji3dA5Jim9hs+hoO++wpc9hS
	T80Q3vReeVmAeN7jZwGiSTWDWItFu3d1rLqwIqAl1h310POqOlKzImp8RLcEXyiPipOmNDGSrf4
	6
X-Google-Smtp-Source: AGHT+IG6FMLPTE4t74XLa+BVp0Qno+bbrHcLnfkSlRNJ0EcC9XHV1LYUTmD7u5wza4YrSO+znhKFaA==
X-Received: by 2002:a05:6000:20c5:b0:3b1:a735:e6bb with SMTP id ffacd0b85a97d-3b4925845f9mr2418479f8f.4.1751653747407;
        Fri, 04 Jul 2025 11:29:07 -0700 (PDT)
Received: from localhost.localdomain ([41.79.198.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b168664bsm33761875e9.20.2025.07.04.11.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 11:29:07 -0700 (PDT)
From: Khalid Ali <khaliidcaliy@gmail.com>
X-Google-Original-From: Khalid Ali <khaliidcaliy@gmail.com
To: tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Khalid Ali <khaliidcaliy@gmail.com>
Subject: [RESEND PATCH v2] entry: Remove duplicate function documentation
Date: Fri,  4 Jul 2025 18:28:02 +0000
Message-ID: <20250704182815.978-1-khaliidcaliy@gmail.com>
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

