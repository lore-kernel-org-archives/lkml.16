Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D49035966
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940867; cv=none; b=k/5WH7PjjTcyVcR5SY7JyFiAq/tkSP287kd4vWBlL4d1W3ZOk1zZUSaduOtOhtNFR87qlDT8NM9Fe5mvo1s+d9bs4kKZldsPQKxx5bXtD/ZI2WsuFcKBo/AZKag6s0nZ3J2YchZQFUeoi6QR5DbU6H9ypUio/wl2GOzwJ7Te/Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940867; c=relaxed/simple;
	bh=tibaVybjpzAuYiRZ5j1Pwnla0w4c8ydA402MSqNDJfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIlZ/o4mj3nRTZNHq3e93bZBIkzKaB2vD7myCbjR1Zix6bNsD+jZGC+uadrOEHgLFWWBKW4Fn3VpeI2qUgf4GENTL/TlfSJRrGLFPWUUB1uZtXmhTcG5nuciXsvje6k4s5Y+HjJUYhQy0ZAiZAAuR6S8vLS+S+MWm5LaP/oImX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=sor68NNK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="sor68NNK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so6164927b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745940865; x=1746545665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jnUkSyi8yoyA+VJzSElKzGl7Uo741FBMA+bn3K0dXP8=;
        b=sor68NNKiChgj4VvxGhv2gl5ymcwCbyEiJkUcheG+cA2QI5Kqn+ZH5yrFh6ah4nP5i
         yrC++RbclnwVqD1O4jaC/5OtLtZseaiH7jO3voiyi4Ix0SzvY4GsQobIOSgT6FqPEWhu
         1Vng8tF2uzbi6A8SKNzBolQ3o1UIhMysBUdFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940865; x=1746545665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnUkSyi8yoyA+VJzSElKzGl7Uo741FBMA+bn3K0dXP8=;
        b=cK9HSIbvur4BQb0ynsAPpNI3sf3ZPeJ5wAQdIdSnj++LVXtmB6bLX0ERS3OJ4My1Fz
         aF7rpURgPIhxQ2YI4b+Buf5PuADiWDRPxfmJ01li/i9gVE9IZCWTWLS/blwwF/DU6XsD
         xbQc5Csydccb4b4S+1sEEX373/wjSb1CSOB354KKy120NpPfT1tUUL3Rq1r0sekpwLIP
         theDC9KvwZKpW570Xv1gocrKhpPIctPT6BD3m65bhtmbLyDiye/CyVwo8oEtI6b7LLio
         9TIAOvi4drRjVW0Sr2sNM5R7jbdCXa/mVNnvEXYzUfYlb+nxzNzm8LNriygPOHFj+iTk
         CtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+/3i2Lz6fcz9rH4OqIBbjOW9e3FQuWLSbam5UC+ymVZMOik1xABV7egXX2+NCBkhw8HgfKyDBfyfrdIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJEHHrq02M9yMPJdDeozCIpCz8HVYO2BY6oH57BxuBUpUR9FG8
	hZD9K/sgLxHtwranIbBH3mupVonG5mcjDDzcSD1Z+aFEVXfuc4S/Ek2bobl3wck=
X-Gm-Gg: ASbGncuI7CyqsG6VwhEiKqQrPANx5YiG2PuREfRkj1v0slUl+VTk+AeVSwPGVO++AKt
	8TX1/OKgVww9oj+Pmqve3ghaWIbzMSFevi8I4ibjUXfVP853Bxb3/3cRO5EvhEANFX2GOi3cP7r
	yWZoEkBX6ANx4j/Jvn1ViDzRw2T6dDkmgsK09/dnSDySTIlu7BKQQkEjkvRekqUD56ZT5LD9mfk
	BgKX6sNwIdGzDLIyfJ25IbC4DJbuzO2UzueojZL6aEShCnNuD2G+S7ec6siE6h2PIqiSap5FI/z
	BsqSvLQsbekZEOToEl/tZrLlSPPSoYe97cHBuisEXQf8SZUO
X-Google-Smtp-Source: AGHT+IFlgfMl04kK4KrlY2CMQdov14qWDEOc+SHDYw5ScrR6I51QGMaBXsx96/yH3hBue0l8iz318g==
X-Received: by 2002:a05:6a21:8dcc:b0:1f5:8a1d:3904 with SMTP id adf61e73a8af0-2046a402b02mr20763355637.7.1745940865516;
        Tue, 29 Apr 2025 08:34:25 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f7fb7e54sm9135581a12.30.2025.04.29.08.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:34:25 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: linux-fsdevel@vger.kernel.org
Cc: Joe Damato <jdamato@fastly.com>,
	Christian Brauner <brauner@kernel.org>,
	Mike Pagano <mpagano@gentoo.org>,
	Carlos Llamas <cmllamas@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH vfs.fixes] eventpoll: Prevent hang in epoll_wait
Date: Tue, 29 Apr 2025 15:34:19 +0000
Message-ID: <20250429153419.94723-1-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the
future"), a bug was introduced causing the loop in ep_poll to hang under
certain circumstances.

When the timeout is non-NULL and ep_schedule_timeout returns false, the
flag timed_out was not set to true. This causes a hang.

Adjust the logic and set timed_out, if needed, fixing the original code.

Reported-by: Christian Brauner <brauner@kernel.org>
Closes: https://lore.kernel.org/linux-fsdevel/20250426-haben-redeverbot-0b58878ac722@brauner/
Reported-by: Mike Pagano <mpagano@gentoo.org>
Closes: https://bugs.gentoo.org/954806
Reported-by: Carlos Llamas <cmllamas@google.com>
Closes: https://lore.kernel.org/linux-fsdevel/aBAB_4gQ6O_haAjp@google.com/
Fixes: 0a65bc27bd64 ("eventpoll: Set epoll timeout if it's in the future")
Tested-by: Carlos Llamas <cmllamas@google.com>
Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 fs/eventpoll.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 4bc264b854c4..1a5d1147f082 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -2111,7 +2111,9 @@ static int ep_poll(struct eventpoll *ep, struct epoll_event __user *events,
 
 		write_unlock_irq(&ep->lock);
 
-		if (!eavail && ep_schedule_timeout(to))
+		if (!ep_schedule_timeout(to))
+			timed_out = 1;
+		else if (!eavail)
 			timed_out = !schedule_hrtimeout_range(to, slack,
 							      HRTIMER_MODE_ABS);
 		__set_current_state(TASK_RUNNING);

base-commit: f520bed25d17bb31c2d2d72b0a785b593a4e3179
-- 
2.43.0

