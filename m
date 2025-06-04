Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E2C270542
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749079557; cv=none; b=g/vpAT/A/Oac8zFpxOGTsUpRXf1msr6JHcgsib8nOy5fetIO73GV56NljqoT+NL7C1BF9O15DmMMQ0EL+z6myKVJDPGKmPVGAM1Y93vXW7vZFg6kcfPviuKQbxj96qhhsJ3ZS6dnK8Gb5s6J7To8JMiDZQNY9avibKkMLkDPDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749079557; c=relaxed/simple;
	bh=SOMXEMyfljyF0iAAfVBGlx56si47T0lOo/QgJ/MFF2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PopW0LX0qUJ/LaI+/08Cr39FaL9E2CxhHAFZbCNEDM0MI1bG/FWUKJfPOTT8LyJBSObEKDRfsIkz9t9IIDnVSQMxWCwHZ/gm4tjnBf7Iq0Q7gRmiSS2xQ7ujL+RnmuDyi7ousFraX2IAfzWFuDIUHiS6wZ9Tk9onhf9/XYM5aFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJHXDY0s; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJHXDY0s"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e7dc83224d5so1440865276.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749079555; x=1749684355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2DRd0KKsntFWDvsPq/TUA9Er2c1Qv95Qf8sEiaIsXI=;
        b=IJHXDY0slKKrP608g2cCJj8rml8m6MOhwmnPn7Zfz9obJD8n40DdYva2KZA+RDxSBq
         x6LfKJ2MShwdrJLIqR7RLZC/Se0tVfHzXs6AWPVSrI/FoLq7M5aKBtjSuSibPo5F4Ss/
         VDGlOIL5sjj1omXccapy0U6YN8PgLXI1PvkOW2dh1ww/I6vv9TMzI0w9DVMrGiVMtHiI
         bYnRk5g5itQLlEB0EksG/iz+dj4q/iDts+5yl513V/VJ87+EJl0geCfYqeOHolAp3sis
         kJcrUkAl/JPfwAj/ZAbuPmyfRdNle6zCE6/LbZpJAPDeZ1R6ZDG5o+mf/Sp4f1/ek6LX
         hsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749079555; x=1749684355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k2DRd0KKsntFWDvsPq/TUA9Er2c1Qv95Qf8sEiaIsXI=;
        b=XH/zFF00W3g8L6lruNiyCOK26v6wzH41u9Jro4futqS6r8icEZpwebpyp+K7GkK5TC
         s3ga2Jrntoyrs0U4fyqiMsnbrfzwtEseGk+3mUz4o5XluMSI7bVPyEfGwGfndU1lJ/Ld
         vpqslYD7CCp7888DEedEvTUnX51nbKpgIZDYRY53WaoD8IPGRNQH3Q8+wHzB07/NqBcx
         pAw//n8MVd+QbYPhv6qmyUPUNgxD58u/ZvMmQAXyUN06wWdaYGfLaBqVZIca1y7C0Z4F
         xTaUGQz1haSLIk5JmDz3AJN0QX51pQtYeKAqYRbtgmlilsFLaXWEPPKDBW8rP1Mi3CK0
         r4Hg==
X-Gm-Message-State: AOJu0Yxsa3Y9e2VNTDjve3kf7xbj7LoNGhmoVUN1IijhR9A1yVKHe06M
	onP0TH63S9nY8AT7UQTw7z/8cOAE6NhkDc2JHSKZPlV1LfDdx+aPCBtW4fFl8Q==
X-Gm-Gg: ASbGncta75RvSsEMS+y67t1X6g41ls1L+ft7UCJnVFN9P/Ydcvf3IqLk5ifMKQe7XBC
	8FLeISDyH6oxDw69VtuGpD3//wsVSDsPfaYKnaIl5WXqrudGsy5fP5L+YYA3SiakDyFmDzs5Ams
	iBNwutnrSysNfR8taQV5EyQjm2p3DXuoNa5beHXHA0coz95s0NsuE9b5wwjORyz38bnYOT7vAPX
	05in/xvIP2OdGWPzbBdKOEZrLHEBzPheAOAvhn6bEDk+G2dujojhbxcVtQdtjUlaSeR0tpZm5qV
	HkYrSCBtGcT4QHcDWCEInH8vCeqOOc6AIWcY2IO59lY5pZKI2EnVUfhqKo0gaaBdOXWSITeomr/
	KCsPvH2juq7tMRYM+SY2gKQ==
X-Google-Smtp-Source: AGHT+IFcPUsklFgYAAbvMkabCX9s6waLCDSa9y7wG/Zrs8h0D5zV0/LraLhKziO56+NkuiIVJF4Ygw==
X-Received: by 2002:a05:6902:2e0c:b0:e7d:75e8:d909 with SMTP id 3f1490d57ef6-e81882ab37emr2144633276.7.1749079555220;
        Wed, 04 Jun 2025 16:25:55 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8183c6eae7sm313987276.29.2025.06.04.16.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 16:25:54 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH 2/2] clocksource: fix opencoded cpumask_next_wrap()
Date: Wed,  4 Jun 2025 19:25:48 -0400
Message-ID: <20250604232550.40491-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604232550.40491-1-yury.norov@gmail.com>
References: <20250604232550.40491-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

cpumask_next_wrap() is more verbose and efficient comparing to
cpumask_next() followed by cpumask_first().

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 kernel/time/clocksource.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2e24ce884272..0aef0e349e49 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -584,9 +584,7 @@ static void clocksource_watchdog(struct timer_list *unused)
 	 * Cycle through CPUs to check if the CPUs stay synchronized
 	 * to each other.
 	 */
-	next_cpu = cpumask_next(raw_smp_processor_id(), cpu_online_mask);
-	if (next_cpu >= nr_cpu_ids)
-		next_cpu = cpumask_first(cpu_online_mask);
+	next_cpu = cpumask_next_wrap(raw_smp_processor_id(), cpu_online_mask);
 
 	/*
 	 * Arm timer if not already pending: could race with concurrent
-- 
2.43.0

