Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5A26B769
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803389; cv=none; b=i89ICIGe6fuBK+lXLRr17a9kFjboWskFHsGqO5DpgmYiFGuu6my0oH1skLmrWO7pe5x0YxI6O6PM1PVObalB75i1kT2XLZOYBnYlNRKkwx7kagCjJ4iCGyeJ+tmzfz0y4dfhQEedb12CSfJFezj5P4oziv7WEtxswOQYhPcGoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803389; c=relaxed/simple;
	bh=J6YZxriHaTmvz6OM5J/vKP3i63y+j8fechcV8d+0YjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gO3KoMWm+bZRAqwIACfr+YSrGm3opntvGBPPcpg4L/iUU3TpwAwagCE9kbDPfYeN3Gf3b46sPjdQdjRzhp+iVIkVoLrSQ/hXCA4dusSRMKjfgjzoGGEm7vrcQ97/V/PNfRPQYJIs3Qszbuuy0tk19+SCz0Q/TPpLZbjMivDJx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsNOyIeC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsNOyIeC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23636167afeso18667765ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749803387; x=1750408187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=td07OU6/JzFFs4bmH5Tm3DQk5V9dUyw12AEZ8RsjVnc=;
        b=RsNOyIeCXAs2kky5OztzoC3MX15yQWcyYg8P3ha+ko0z6trwkdvP2THDxcyhmx9rX7
         8raaK7HIasxLjMXmf6jJvJ+jey1vsgNyU1HE34G8c9ufIno2xBn4wPH/W/saXYp0BIj4
         BLuzfbyP/86dbJb1SEEhmP8xk7v/ihRHAQpMNCLcfvqTdHJ90EpvY5fTSGu0kdcfEuaY
         oNUOhlZUglbYfwmOINOU3zjZK7zDhyFHoYLcYUyF90OqL8b1GnhVzRdZaqk+JytZWG1u
         P7h6WfEYiuHtlBlyLFGaGgugueKw01v4+opYyV0qN/fl2arfT2QOX4kQP6DvCVoX/L4t
         L/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803387; x=1750408187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=td07OU6/JzFFs4bmH5Tm3DQk5V9dUyw12AEZ8RsjVnc=;
        b=kaU6N+4m6+gR9OjCvPpv/7KnCEL/tH5Tt4iid3kFiG6A5bCej7NSToNMAVp7Yo33lS
         eizaVbcaTlfrWAAu0PTuxN+i6hwuAUOcNg65U8F3o4u2kGTQNsYsRyvAtfLxt3e9pust
         YjPeR5qMPNdj7chvaiWydwPhOVLliQQmkA02fYYKfKwl8hs4ZpRIVZsO3FA7w4bzOw3e
         SqPWNAPeaGf4yT8CYNLi9gKdP54LrU8wpuaLKovamSgj09uN2Ng5Z42wvumM4vR7FNpX
         F/DchojpMW6Kpx5TpxCf1NWS0Brk/2NA3tFWYJxhplmy2QsAVbXe9TLzYesBi+3k8zul
         ZDWw==
X-Forwarded-Encrypted: i=1; AJvYcCU9YGsli5xMxSG3w9ASV5kCYnZTUKa9JxGvvYJOVrZmun7Z0bxAQtm7/PXU05D8Be+V+88bDUrolgYJTk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5GH7Tf6uB4khn9lymHyZuRjZeewrrQL5Ama4areg4QQpsjFR
	gcJxSV+l0Rb4bMwGERLDZ5yFeguSR2pFpCS7XwrScoTVGhFBY7bddxkV
X-Gm-Gg: ASbGncuJE8tbIQh377Jg949a8WJkkGLKjNxeiaCVmJR/QJzSlKdovtDoOuvGUyMDTIt
	kTQiYmUm14o3UuF4aKsGWdAmM3JXAbZusRsILDuAYLB8oVhO5dLyNVrquNdU/n5qMpMvRd0dVEX
	Wxu60KvYvTUcl0Tfx6EPT6b5ZKA2dudzTuaE4z0SLsSLhKWWWH2dXMWRJ6HTHtloH6+F6Nskx22
	+F6O/1V2z0BCiQEEQ1Nrl84UDl5f2OWcUsSmaDbglLgrSUTgmwzl7vfdr3+4PCyTPmgQMmpCa6V
	nuYV6B//VBJfl2SFEktPo4JxpC2OFyjY/tMr0DCfIHOP6PgUPkla0obVkG0WMTfT
X-Google-Smtp-Source: AGHT+IETz9S2vC3DeAV5L/Z/4+EDQPLntlfWleDBPPajqXQm/k03d/6YVkB6j/50621Nj6VxoLsLwA==
X-Received: by 2002:a17:903:1103:b0:234:c5c1:9b63 with SMTP id d9443c01a7336-2365d89ebb3mr24672145ad.18.1749803387516;
        Fri, 13 Jun 2025 01:29:47 -0700 (PDT)
Received: from localhost ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb4e27sm9324335ad.176.2025.06.13.01.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:29:46 -0700 (PDT)
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
Date: Fri, 13 Jun 2025 16:29:40 +0800
Message-ID: <20250613082941.18129-1-jemmywong512@gmail.com>
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

