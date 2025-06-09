Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE343F9C5
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749438504; cv=none; b=OzG99G0FgmOWRKITBHu7zFNu8JlC9AruudpZd0rWJ9jA0y0A27sDv+g9Cds19kJlb1tNZ1SPudm6yPJrU+xQKpIaBIvmEa5WXxtvoFuFORyFShF4qsun47hSnfvyP91E+K8OTwbxLW+M5e1r3HT6CAehUeiTavuo0bjyru8EL3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749438504; c=relaxed/simple;
	bh=Dz4BZOwoG735qXr2NNfV+1SB9IWMabweHe1jjafLKJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k1tdmk+kYXYPhWg0CAm0dtQCu4/WLSkcdRR6jE30uxdRuEitCNpAD0QfV3bWDOLiaLkBe1Fq3sMHlEUdospn5NdmDiZ5ucUmI5myxiw4dzwLHj6ZrM1h/Oqn0mVnoxBXpx8Wghyi7oxv362CUxecgb1TRUxwnGHzMjZHA9x4ObA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wse6I/X9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wse6I/X9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-747ef5996edso2832676b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 20:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749438502; x=1750043302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJ5ljUqUtBgUphPBwqwQSdecLwZyYNnXtwMirJ7OhPU=;
        b=Wse6I/X9xYMqeixoJ4K8q+Iay7y9BU/jgq7klubxhKbW9OLhyTehUqB0Fqj8EDKK2c
         DQi8RxDnU0dA7GJcOFcIANKwzs2upQLVW89jSZvazsjZEzFdZ7sbObBIJKJysPouR7f7
         qkF0bX0PHuva7GYu/+dLuUDTsoFIYqHXfkHIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749438502; x=1750043302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJ5ljUqUtBgUphPBwqwQSdecLwZyYNnXtwMirJ7OhPU=;
        b=uPwnv0MADY+SbB1cgPWvPlpqfxVTTQew7GByDUrwY6pkNJYlrJ/VvJB0axr8TrtozT
         QuMTaPwmsObQcTuQUqKAjNQft0TFFfrRBx2PbaWDjsgB0CmEyzsKGTWQbceFk+frsNQZ
         D8T+3cS1f9msS7oy6TRImbbtrTljGwDW1CIxzSKoea1M/GgAmJPeLJiLO/6AkIsNr2CD
         ZTgVP213QKYHVoqHUnNBAjFnMZDTa2CBGUNHOKsTgtqm6A8NlcNDgFGQMq8n9IUFJAGQ
         nWLgu85HDcz9g7qgtr/6AqNlO5/fUBIIzsuny0KhSQtioVKuRXKIrLObyT5PYzJXZWzx
         Pkag==
X-Forwarded-Encrypted: i=1; AJvYcCWgSK01fB6ni+kJNihfCGH55q/zlGIVhHQ2xkV1D0EfZ0qzgDgJItg/2UOj/sVvnb4CrnvrShyWocxIxG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr65J7HScY049KJRmns3SVFaVgTvX2W9n14gE4EwOAgks+6soI
	fiLYNrEeOCLaW2XP0t8Vw6NzhKKENz0/jF6ZxTjyzPSVv/4H4162wW4QBhVkheDwAw==
X-Gm-Gg: ASbGncvIaJ2QtqMeGWF3dP+ZHf2njRzfGcj85N1bCJIxoUX8NOw00i0YSx/EkucxNZx
	Cbu06mDcsYl1Yb2V/8WmweKzl5ZBbeu/95OwUqV3IQTOehvwxmtFsCQFznlElQB79yhu6hEHgAT
	BVSCTshU7p0E+cUIDlmC1hH426RCNQGIDUMjrjXfnOZkvbh9+gKXHTlyLTcw/lfbPr4gmWiWNPv
	bQ7nZOb5G3mxmttIv+h08saK+xzIEEnyp/FW21KmcRLO03YFT4thXxY0GD/zGtYASUKKerQPujZ
	71BuPckO9Ka7EeXQZZ9bOMfe3OvMbNq6Zr47Ct6icz50aSfr6LE9dM+ZzorrYtg3g9KaEHoBpU6
	4OA==
X-Google-Smtp-Source: AGHT+IEZ/QggHpe+SjR545m8B1DjwJ23ZRKmlr+YvhhI7qVFUYft9GGSA1OnQ2N5skZa75gmHXfC2w==
X-Received: by 2002:a17:902:db07:b0:234:a139:1203 with SMTP id d9443c01a7336-23601d82d1bmr183050245ad.32.1749438502124;
        Sun, 08 Jun 2025 20:08:22 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:eb64:2cdb:5573:f6f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410716sm44649645ad.199.2025.06.08.20.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 20:08:21 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Tomasz Figa <tfiga@chromium.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH 1/2] wait: add wait_event_freezable_killable_exclusive
Date: Mon,  9 Jun 2025 12:07:36 +0900
Message-ID: <20250609030759.3576335-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a freezable variant of exclusive wait.  This can be useful
in, for example, FUSE when system suspend occurs while FUSE is
blocked on requests (which prevents system suspend.)

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/wait.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 327894f022cf..b98cfd094543 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -657,6 +657,20 @@ do {										\
 	__ret;									\
 })
 
+#define __wait_event_freezable_killable_exclusive(wq, condition)		\
+	___wait_event(wq, condition, (TASK_KILLABLE|TASK_FREEZABLE), 1, 0,	\
+		      schedule())
+
+#define wait_event_freezable_killable_exclusive(wq, condition)			\
+({										\
+	int __ret = 0;								\
+	might_sleep();								\
+	if (!(condition))							\
+		__ret = __wait_event_freezable_killable_exclusive(wq,		\
+								  condition);	\
+	__ret;									\
+})
+
 /**
  * wait_event_idle - wait for a condition without contributing to system load
  * @wq_head: the waitqueue to wait on
-- 
2.50.0.rc1.591.g9c95f17f64-goog

