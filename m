Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24792DA751
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803839; cv=none; b=B4T51G3znOTmLzlrHea4AWpeq4wJsbmMlrzVIq4iaE7iCnaDS0gmA2bXUQ4eeYXGWf3OkKTVy/Sr8EBZcxoutCRUMCWzeBLeBMmcvcpR/HR9qRaflVGniKxa2O+wQOS32tviHFZCkNibjRtUyi7BwmIvCbLcuz6DYuC7CRFl9w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803839; c=relaxed/simple;
	bh=J6YZxriHaTmvz6OM5J/vKP3i63y+j8fechcV8d+0YjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DF9VTrcflF4CTd4ULJV8swHRcR7AV5aLGnttRJFiZHnkvi+myDQx3Yby+x+CqTR4szBfSzCXJ/cdljBdn6d6VvgVekbk9UE0KvUnYONT/SxxXEge6Dga6xNjyKBGoYy2ERZP54DQbQPmfPGiJsHauBL2ziUBAU3dxGQCfv2ZL7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz2LuCVe; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz2LuCVe"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350b1b9129so13834995ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803836; x=1750408636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=td07OU6/JzFFs4bmH5Tm3DQk5V9dUyw12AEZ8RsjVnc=;
        b=Xz2LuCVe0oi0+qRg6KXEKJDiF0hYSuFT6v4/PFjqJ88ZmGbdV6zG5ya1ZqLKHMovw6
         8szRjHWmN8rNtVMA4mFFk2nL5Z6dK4izUHMH4eWl5msBe5HQjvzDnoV3xKRaA6gj4kKs
         s54ueg6EQ5urc3TBRGdvdoO3Qilc1OEdPvYo6PTfOanZWQkpEDPuSPVxCEKGbShjZW7F
         du3zh42kwY4NbATBUX3B7CBPgGWujPv3qREztBhvsoEFNesfnilMwewKPKdjTfCFhbXN
         mef4RKu1dVZZ6trV+BQ39KHWKYfulcvsU1u1rZMTzdImbBCZPPtRwMl5cWC4DeSkwBLo
         LAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803836; x=1750408636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td07OU6/JzFFs4bmH5Tm3DQk5V9dUyw12AEZ8RsjVnc=;
        b=p23/oH58cwusoP2iwWaJOB68yVpWgRqqyAguZvFfM0wJSShHXDtZjxnnm+4Ois+L6i
         bw3GXvoymr1mQWm5pBaqOpdTfDkV8tEq5j6Yc03Uj8DpBqKpsiXFr5H6zrh36UJppxZJ
         9JGUwPMYdQxF8W+wJj5r/1L3+diAiDwgv8qsVGS8DIH4xbkSn35HqXBx4Zf/tFdNYSAK
         HwOtdy2o2XoRpixubtZE69kyXnr3BiSByltINs4Ht9Q+gbiQeqzrr94X8KGMXr+2fSV4
         0DORb8+3Mxat0ReSAlA4dQtWRB5d5XLOLqcebV3/xAfzqXirJ/qtIdX8MJNCW0pE4dGY
         6nsg==
X-Forwarded-Encrypted: i=1; AJvYcCXZo4bSFL0UYyW+X4+b+yf5vwY4iN6kr1rnPHug0PsbzRzbEeLBo9c924QFjn12aiQGvlkSJRSFdyNMnPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoQx+WVVD9mtD25BiDyzQyNuQmClKV/iAtzhuVe0zxeL/VBUIH
	F/tS+ORx7dvA51jCacIqT3zILKcUYI8UMsfE7c/Uy/AAzal9H2W2/sHK
X-Gm-Gg: ASbGncsmMD9IgfiZnvd2g9IvFs2F1yPsJ+0HN617B/4YulHkBW6kcNoz1REzUgZOJji
	b1uB70lfOY0L36+8k8wL279zVM22OyM2J+Yvw4Yq0mViJ+BFJZ77dYfmXyGn9Q9gMPHgR+d7Vbb
	UqImPp+k+lvD90AUfzbdwgeAD0FIH062UJocew18beKFBjeRLE+SGM7doiLYOXJCkCjMF3U4fOY
	rwBV4jI3hTOSE9n9HxD9DDOdmqzn9XdL5XDu93sDBaP4WTpPZhl2JsJF8N1VJL69qoHx98Q6UzW
	nuM3Z3I7LRK59mzDM8dvkfa5JSppheuFca7SZ41VPdJh3OP7vFMHzZV7D9TXdYJV
X-Google-Smtp-Source: AGHT+IFeCggmsbB+IPv7PKRqy3w4QniSZgpIqDpuR+Sxpd80rDo5PTiIrM+J/CbH0+3GDHd3HyOm/Q==
X-Received: by 2002:a17:902:db05:b0:234:c2e7:a0e4 with SMTP id d9443c01a7336-2365d88c276mr27084835ad.3.1749803836206;
        Fri, 13 Jun 2025 01:37:16 -0700 (PDT)
Received: from localhost ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88e5a5sm9532375ad.14.2025.06.13.01.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:37:15 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: kprateek.nayak@amd.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	jemmywong512@gmail.com
Subject: [PATCH v2 0/1] sched/topology: Add lock guard support
Date: Fri, 13 Jun 2025 16:37:08 +0800
Message-ID: <20250613083709.19071-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:
- guard inside sched_init_domains instead of outside
- replace do{}while(0) with sched_global_validate func
- wrap commments at 80 characters

Changes in v1:
- Convert scoped_guard to guard
https://lore.kernel.org/all/20250605120424.14756-1-jemmywong512@gmail.com/

v0 link:
https://lore.kernel.org/all/20250604185049.374165-1-jemmywong512@gmail.com/

Jemmy Wong (1):
  sched/topology: Add lock guard support

 include/linux/sched.h   |   9 ++--
 kernel/sched/core.c     |   2 -
 kernel/sched/debug.c    |  13 ++---
 kernel/sched/rt.c       |  47 +++++++++-------
 kernel/sched/topology.c | 117 ++++++++++++++++++----------------------
 5 files changed, 88 insertions(+), 100 deletions(-)

-- 
2.43.0

