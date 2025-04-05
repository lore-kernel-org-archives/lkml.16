Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7A72E62C8
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840341; cv=none; b=fi2rBGpIqQyfIg05aa6oUWFYpxZgTtXAnCGhJVnIWO1wZlcvkZGQclcK32HGhS1fToDgbBCoKJk4cdnb1jHjI9TXVauP/J5pyPZvY4mEXU9y37eXTGCHfJJvt7LfKaSsUi2wjT8Q8zq0ZHds97hSlxii0mjxXSX17URYhe7OKpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840341; c=relaxed/simple;
	bh=9fRuxTFU5oLgs8XD26/uTt5ovEGzMUiT1mZ4PMzsLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fOOY6EbFrWYWkorh8VgpewJ4btoznl+sYmCovVk3LwjM22b/3loo8PzgBx62KJJCPoxe8lNMbj6rK9ZvpfgSs2j/SLnI6GoXqRKGD5UF+yLXVezyz5G9YLL/YsbOPF9grR/8Kl5qUJSuAPko4t9TGdMSNWSVkHVgwWS9mJm0CDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mrRWNW2f; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrRWNW2f"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2295d78b433so27092295ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743840339; x=1744445139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=mrRWNW2fpaQsarDqsqbeG/k7FxfJJFW/ylKOaMeOWYmXBtk3tRIwufHjorkDLK5lyK
         Vt3BPyD6GmuRDp3+YfLSzvNgP+4gPcoWHPNdLOKjoyWV9A/uWoXfWXTddCLR2un5Uabs
         /IsTckElAEv3dEkRX2ImrbLZaNy4yWKPcp0VZGdziQGlGm+m0kyDWIp4A1mnB6Q0yuE+
         e0S1MLON4r7AJouiR40tLPW5+JVBjnHeQY0cPOX2utAIYIQyMrObD4Gp8nOtGZ3dQEn0
         xvlRvK3f+oVeoW8/2vOcZynqzU4mOkOrD97mOTnX6pgwszJCPkizjjN4Zr36V1z6874g
         XXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840339; x=1744445139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=vY+9A+8WXB+QSreg5wMkeaFjeRMgo5Vw8z38kysBT+ew9FX5bZ4ZXI0ndqnQuN6FMO
         UBQtoTMBXergVm6y4tgOlObq+Sr20ZuV8nmsN9bDTVmiAQ5C25alYlWcLhaUBSrDsl9e
         cf0Uy2LTOknudOHbXOpF37JQHC1QQp/uyX11GPaKzfo0MyLCzrR+4JmKA3BLVnMplOcV
         sdAocxIid4n9xGg0VKZ8cVAlTmjd7n3Row8Ce5Cu03f0TodIa3BhGhtGhsg2xZPgbFlB
         nY7dpzrOgTUkTXrqFoEPMgZzV4xZhdWgZJdcxMDCts4fSebEAvTxzy9uvJAkQi3prwaB
         WUMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1jMeWtWl7YD7anQ82Edaex2nViIttDAwZD9vq8EPRhSV8WZPGRp8JiZxEirMh+6wsY+5gJwYyDuyFrXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlnyFADRGBC2KT0IrlK0lS7DpmxdKlF3osInGXl1Nf+3oZc1Ov
	w7JymJvu8HoF5j1RKIYA+NFuqdUNdFMKRp6YTpE/LRr4zikZPLQb
X-Gm-Gg: ASbGncsx+N5XJvyc099uLoIil1QpfHkiGN6uYO4plcYp79Q0SngkAPD2J5ECvgNC6k7
	GxA9o5ys6c8uWrEzQCpFF9M9B0dxju2HWRN8tg3rYlJC3aDZTIasktAQ5YayYkavcGkrHCuh/1z
	1uY0kPWlgMaTUkg/6uwihWX856yGkCtB1leUcvL5YbVaOQqgUQsjHSfIf7l/418fEysUKuxznri
	oGMAtoGiS8yf/9l5EboXco2NWPUEUyZ6iZHdZaNv1rKlySIzX+9UIXDUydk4gZHIshBdicb8xoN
	Exm5WuFa4YsOcr5SYQRKR9zsp3/pw2fcPPrRGs4T0ROZ1xo94rdoeamJUh2xiDwvkvO+3LAIBPY
	=
X-Google-Smtp-Source: AGHT+IG62rRg4p8BBxkBYpaofP+J1OF89us4nRxT9kjfJNoJk3QZJxsWI5NfrFxqwGRxJiLMHHMsCQ==
X-Received: by 2002:a17:903:1c1:b0:220:fe51:1aab with SMTP id d9443c01a7336-22a8a0a33ffmr82796885ad.38.1743840338948;
        Sat, 05 Apr 2025 01:05:38 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:309d:74e8:7ab1:1579])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0901sm44607305ad.58.2025.04.05.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 01:05:38 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Cc: anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH RESEND] timerqueue: Complete rb_node initialization within timerqueue_init
Date: Sat,  5 Apr 2025 16:05:33 +0800
Message-ID: <20250405080533.519290-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67e52451.050a0220.2f068f.0027.GAE@google.com>
References: <67e52451.050a0220.2f068f.0027.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The children of "node" within "struct timerqueue_node" may be uninit
status after the initialization. Initialize them as NULL under
timerqueue_init to prevent the problem.

However, syzbot doesn't have any corresponding reproducer yet, please
let me know if it makes sense or not, or any test can help to further
validate it, thanks!

Fixes: '1f5a24794a545 ("timers: Rename timerlist infrastructure to
timerqueue")'
Reported-by: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 include/linux/timerqueue.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/timerqueue.h b/include/linux/timerqueue.h
index d306d9dd2207..a42fdc83f694 100644
--- a/include/linux/timerqueue.h
+++ b/include/linux/timerqueue.h
@@ -30,6 +30,8 @@ struct timerqueue_node *timerqueue_getnext(struct timerqueue_head *head)
 static inline void timerqueue_init(struct timerqueue_node *node)
 {
 	RB_CLEAR_NODE(&node->node);
+	node->node.rb_right = NULL;
+	node->node.rb_left = NULL;
 }
 
 static inline bool timerqueue_node_queued(struct timerqueue_node *node)
-- 
2.43.0

