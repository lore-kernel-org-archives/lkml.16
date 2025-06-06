Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7D1F9EC
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214122; cv=none; b=ON6fT6lfoFRSdfonHfEN1T+ZuCNPssYOdaz11HRypjINBkZpVDGlj9ny+S+ctrnh9Q1W8Kgbp5c46WFkLWpS0wxmJ8Pa6mHctEefoujswnyP8Txz+1SZr4HlDWOiq0N3R7XjgbAvq/vVNkGhrQL8g25hdEtRVLpM4MBHwzY25fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214122; c=relaxed/simple;
	bh=2HB+nihT3Nm8MQl3kSttEpQoMlmBegXXaIj27Z6mSug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a2QfHgpdktRZMzBzK6VIyteiVBs5TYikgm9sOo6GDy/3TU/QKO7QnvHLlOnKgQJJSnhkQoLn1vvG9Q2hqE96A8InhlgkC78IPjxQdwRMR0VvsFR2Isn1C46d7y9Oc6bXvr5KAMnxObH3D7ln22d733y8r8jXLXz/ZAQUnwfUb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aDGhk55T; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aDGhk55T"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-607780f0793so159329a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749214117; x=1749818917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpUqMhsZTHJI42QQBRjXJzNugx0q67piTAy1meBqflk=;
        b=aDGhk55TVxIgarw5o+kGGNIMIA7xvIUc/WDpNAzaM/cYdCx6aS2Owzr9Tu1tYVxk51
         Dlql4cB2FPb5i6VTdzwAIbqRvv+dva/wmc1h2R15FTHWopce08GXeTbpzMjG2DsdEwQI
         UjuzvtX0w/tefsnYCEy2lCFm+u7iUO2oghyR7gXHPWUtT6Hh5LqI9f8xXspxZY32+D1g
         5hZ927RLNNh7iBwQOUfwoEubmA/3jGP+6pFWqMNlXw9FIHtXaej7U23ziBbtgYokP2fI
         4zJ+l8etcDgL5h4k3slWN2yYRNcVSWL4x9I++aSGxS97QO9Pp5TXxivmkBjprAgwgbgz
         pM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214117; x=1749818917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kpUqMhsZTHJI42QQBRjXJzNugx0q67piTAy1meBqflk=;
        b=EYXq8Z9VZ7JK+ZPyo4EB04cinFttdnR7hdtJbPFn5kL369ULxlcBcXROGcNayk9CKR
         pA45tZuSJoD287+7XoSea0FE49yJd3UbBYD2HhIF83z9UOtyyF1JKImJd7/iNLr++k0j
         IZY20Gg/874kBji8bcaha87SVjECQdKKE6K5vXPRaAfQ2jSwvWWgEMYNrJvcSAdsZAkM
         IqffeIJ7LMrVXk7a0Jq1GaxL/KbfcA9gYDTGBpN/hkR47BuVB7hPVLI/jurRn/8M3Fx4
         xAfgXv7qPBlHSM+VDJrTBKYEg0JFNy1ULMmUyYtZIim/R4fiXe+QmZec8uOKS5Y++LEd
         DDBg==
X-Gm-Message-State: AOJu0YyqW9ae5nFmuvlnQ8lEmngJis/7D5Yv+Lqt3jYKy7Laa3q5x2h+
	4CrEOtFrx4d16ftsjVo3mqMLuztjgbMr+RJxMCFq0vQW66agOXYRrD7YXBuacy/d7Lk=
X-Gm-Gg: ASbGncuYh7lSdJ26q7zqteevNcV8KUCCIBOuZUkeOEFrP+X8GgPzzk5ZgsMvBhz51Ub
	fG5zSnKJlovZIA3oMF43+qXCewmr0Lsr2pvbUvKLiSLy7O1la2jZZt96PLi0TqcVXcExNVOnJrs
	Sna5PONx1jEtPvjzz7eqOor3nYgLYAFO503qVS09DnNrhzBK11G9iGw8ChttTVtcgnICJgqjI+t
	TlfebAOaaQ/cxY+rGIk/8ZWd9PaLo2Qa3dgCZzzCCVbu+DfZ6OJkwYgTxQ7P2gFWlI/vGNwIvkp
	cNp2tJwa4t8OIMWJHEzwPuVXiCUs+L4qeYk7A/8BSBh4Wil8+17NMJYGqr2GSzxlZTvYTiP5v8+
	SG1qCg1bZ6UaWYX24ZuqA3lSNQi3vlA8OqDU32vLG05EJEv1h4hKNDsTRSyHaFUQ=
X-Google-Smtp-Source: AGHT+IGfkY/cWFUz3uxjjqfrkQi+wsAtTay7BEqR9YU15tg2vfGsXF5SrRy4HIfv021FDjhVhz+kmQ==
X-Received: by 2002:a05:6402:358e:b0:606:c63b:e330 with SMTP id 4fb4d7f45d1cf-60774b80030mr777774a12.11.1749214117024;
        Fri, 06 Jun 2025 05:48:37 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-607783c053esm984265a12.48.2025.06.06.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 05:48:36 -0700 (PDT)
From: Petr Tesarik <ptesarik@suse.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: "(open list:HIGH-RESOLUTION TIMERS, TIMER WHEEL, CLOCKEVENTS)" <linux-kernel@vger.kernel.org>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH] timers/migration: Clean up the loop in tmigr_quick_check()
Date: Fri,  6 Jun 2025 14:48:18 +0200
Message-ID: <20250606124818.455560-1-ptesarik@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the logic easier to follow:

  - Remove the final return statement, which is never reached, and move the
    actual walk-terminating return statement out of the do-while loop.

  - Remove the else-clause to reduce indentation. If a non-lonely group is
    encountered during the walk, the loop is immediately terminated with a
    return statement anyway; no need for an else.

Signed-off-by: Petr Tesarik <ptesarik@suse.com>
---
 kernel/time/timer_migration.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 2f6330831f084..c0c54dc5314c3 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1405,23 +1405,20 @@ u64 tmigr_quick_check(u64 nextevt)
 		return KTIME_MAX;
 
 	do {
-		if (!tmigr_check_lonely(group)) {
+		if (!tmigr_check_lonely(group))
 			return KTIME_MAX;
-		} else {
-			/*
-			 * Since current CPU is active, events may not be sorted
-			 * from bottom to the top because the CPU's event is ignored
-			 * up to the top and its sibling's events not propagated upwards.
-			 * Thus keep track of the lowest observed expiry.
-			 */
-			nextevt = min_t(u64, nextevt, READ_ONCE(group->next_expiry));
-			if (!group->parent)
-				return nextevt;
-		}
+
+		/*
+		 * Since current CPU is active, events may not be sorted
+		 * from bottom to the top because the CPU's event is ignored
+		 * up to the top and its sibling's events not propagated upwards.
+		 * Thus keep track of the lowest observed expiry.
+		 */
+		nextevt = min_t(u64, nextevt, READ_ONCE(group->next_expiry));
 		group = group->parent;
 	} while (group);
 
-	return KTIME_MAX;
+	return nextevt;
 }
 
 /*
-- 
2.49.0

