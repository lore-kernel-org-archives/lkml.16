Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46623208
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750101770; cv=none; b=Aj9vGsMxJAN55OLdkJPERcz2SQzgkzDoNRecKF2YERquxEnm4yKm73D3LyigSHc7SZ1GEDkW5zmM3xCXvAOOcc5Rzr5xJV1U/Qw++wJrPup7Mr0xff2A1x/Qtw/Z+90gBgyZSWvlMYc6uXdjB6nS4KH2T+tirM7bvDXHV4/U6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750101770; c=relaxed/simple;
	bh=9hhxjuVHW/AMec0AvMeQz2st0zAcM8k8nnpI9fp5XI4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=HARNpBvlHkGZIj1kdVEqxGOOeMmA4vDr0p+f7PfhjEX/Tze2QDRfua9MHqQxh0Qhs00K5z8t1+PU2TtRCYLFlu+U11QaXrmlWq1/8gYx49YjExfFEGqK2NLHByTPgdq6yFoUnZhNs4AFKSn0r96D9Ialh6m8HqLyuZfDsd3PEJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fyD7TudP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fyD7TudP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7d20451c016so275800685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750101765; x=1750706565; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K6BJ/nlNasBh+BLNr+Z4o9VCOjIdVxsUue+aQDwQLqU=;
        b=fyD7TudPyJPLdKR7i6oUdDVgGQ3yKPzD8Ji11wd/ICHTD3WPDDxj+ofgx5dT5I8DV/
         OrC2Z785Nr5V+v8lV/vLEeeOCAm2ytcd3Uj9878jH3EvApVyse28KfNEQcU7xbL9s2N0
         5mb5iZ0ueRpzgGTmBdOqao5MUe4pN/KASSHmEkr8dbtuO2QAp0wkjDfVQKYSciuTxY8H
         gwi31AaHXirJbGPVgmebq57jdePzPvhuAREvxn06PL1dwQWrZEYhYQNXagKjQ+kpq/Nu
         0JF3peKT5HqtKK4DxruZFh5Nc5Nuj4FlU6OMUbewdJRDqjX66mJIa0EOrFUBGJNlhodb
         RyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750101765; x=1750706565;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K6BJ/nlNasBh+BLNr+Z4o9VCOjIdVxsUue+aQDwQLqU=;
        b=ZeQ27yIwkmdRsQAvlI4DZ/9qJRxmSJtMcjyXWHTYke3Drkpvw/IHD67dG2HFqeQVKp
         vNyxJX980e7EkDBHdwcRkdLfE4SFCBuAtmSYpcqNoBvXLU/G4CKvgyeCJ17DzSViPdbM
         QTrtEJ9KOO9WxpBgQUR/BnwMGHPybK4PRxBjlLXzf1ZbJzGwuFEZRTySt6uZ5SAcqYux
         CzhKH7qmI+OQWbBDRLiiE4ejSnyfQ4WN0zqTslsAiZ689Ng796m02MKMmI6TVrPLUhxA
         3Afa3S3TmIxUaeXeYAzEnmkB1YsR7pykpWnD8LDwPJUllgrW3p4p14SPPcKT6S0FLGsb
         cDIg==
X-Forwarded-Encrypted: i=1; AJvYcCUd9Q/z6fm8hhzqKKl4y8GWJD0cZtXlARDg2f/k+s+eikmktQKfaQ0OgLCAo0V1doh/24TyovKUeebzJow=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxe8PiSubT2DiyGgEg98amcHm0XUuBKhiaK0As0rOE7WCu2mPy
	9IiSvFT/c3b2eTeyecNQVIwHfJzumD+Qo7FiOizzme+pIOsgM+fRHCh0Ez8y7/TxHNM=
X-Gm-Gg: ASbGncsereQesSAdziJiiF92WyNMMRccN8ykk2tQn0WPgokJd0d+wodkg7IRr5bIXk/
	MUhLK6DSvAiDVAz1NBAc3Y2/8QYjq3zhq2Euj6DMseAJD/SOLu/8xq++v9+/az8c/3TppGDTV6P
	cDDMvs0LyJ4chsHP243h70SB/2uBhtLyoGU5KOV33iYVm5JpmyOxC3CODRbfZL9jqfoywyhAJgr
	D49Tn3YAdFFjztiVYfKbqQIt/WZClc27mAY4dEEe4aWwZ6r0Oy1Rex4nq7UNfzEJTsYv4Nf/a+M
	J1OxEXLsKqkbcNLdeeGsg3T6cj1BLkEzh923FUEYXGky1S0BBz+776m6YKy8ErIhkKf+Z5mpdz5
	f4Nm11lh1UN4A43RQXELlTnUIMg==
X-Google-Smtp-Source: AGHT+IHb/GH9T1CiNvMsdab+0Cf8gVtra2bbl1wdt8ZMgUruj8awkhnsgpBmwYNIiLHY5/28R00avA==
X-Received: by 2002:a05:620a:25d4:b0:7d2:1199:d850 with SMTP id af79cd13be357-7d3c6c20de1mr1540632085a.24.1750101765490;
        Mon, 16 Jun 2025 12:22:45 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4b0cb9sm52789391cf.50.2025.06.16.12.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 12:22:45 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:22:44 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    David Laight <david.laight.linux@gmail.com>
cc: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Oleg Nesterov <oleg@redhat.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] mul_u64_u64_div_u64: fix the division-by-zero behavior
Message-ID: <q246p466-1453-qon9-29so-37105116009q@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The current implementation forces a compile-time 1/0 division, which
generates an undefined instruction (ud2 on x86) rather than a proper
runtime division-by-zero exception.

Change to trigger an actual div-by-0 exception at runtime, consistent
with other division operations. Use a non-1 dividend to prevent the
compiler from optimizing the division into a comparison.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
---

Change from v1 (http://lore.kernel.org/all/q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz):
- use OPTIMIZER_HIDE_VAR() in place of the open coded incantation.

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..bf77b9843175 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -212,12 +212,13 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 #endif
 
-	/* make sure c is not zero, trigger exception otherwise */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(c == 0))
-		return 1/0;
-#pragma GCC diagnostic pop
+	/* make sure c is not zero, trigger runtime exception otherwise */
+	if (unlikely(c == 0)) {
+		unsigned long zero = 0;
+
+		OPTIMIZER_HIDE_VAR(zero);
+		return ~0UL/zero;
+	}
 
 	int shift = __builtin_ctzll(c);
 
