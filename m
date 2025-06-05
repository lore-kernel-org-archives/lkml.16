Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4717B50F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125080; cv=none; b=ptXea9jeGpC6y01UcR8bDmrarzFM2EKcNT4cBQp2Thb1joGUVfmnR9Zm4g3brw3ogo1cn0U8Qm0w+lIWPcS7fbHm2p3P3QL6eb4w47oaCa728fMG1kyEa3rjKQtpS8jiotZNUWNz/4t3WPQHhn031cxng+qmDf6sb0tVHmx2mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125080; c=relaxed/simple;
	bh=CcnmeEIPKBV+kF5AePGaDZ5DGEcvtTCP3HIM+5BzO9k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkuNfUHuHoJalYPh20lV1F/1c9RELVhHNyS8MKkNTe2CTWV3PGlNlgJ4XVweidZJbeFTXqxJOSm9STYv7n0vL5/FufpOJrA9W7yjwz6zc2IikmdM6TT89SuPerJMDbWVpGbuALHX36O8mDr/p5yEtCSRNB5DFY1eBkHvdjUFjcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBfMkKnJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBfMkKnJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-234b9dfb842so8214635ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749125075; x=1749729875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJQmFW5Z8GCLV79wadAqcm+DhU85/dyUVQp0/Ag+fRw=;
        b=HBfMkKnJCfUk8Ve6NW5zXIJTgfCoE+azEeikexv/LauvR6lI383IVZrNI+5q8mGTK7
         WX9FMel9gQYtu5R8QYWqndAm04R/swOkeufwzXReehuv1JxXiO5PTUz2j+SIfqU/ovqr
         4EqgQHwhz4XMxR/gB76lCEqcq6e1STCKeaZkNBh0YfGlpOgIJCudffbLy5vE4RshcbGa
         OKcJx3TLRiyEvQj9+Wrlv94EYFTi6VaVnCJpAH9D83jnKQtjV+TMhNsamBfckach2e+R
         pb3pBTWXLuE3oMa/9/igf14osSFKJiCuuE04PADlEAJGa1FeiOtMl/th7Fz9fXXxbQDx
         KdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125075; x=1749729875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJQmFW5Z8GCLV79wadAqcm+DhU85/dyUVQp0/Ag+fRw=;
        b=cc3ofBYpD3CQunCVhV/GXUbtSjEHh0gp6HCrhw8edg/ERIKn4pxANl8vi8z+aT1wI8
         3243cRjrzlTjnnApPklC1P2hRAIrNGYtppk8XRRPkDyKI39AHaFW0qCoObAbnfmPM3ft
         V6kcwZxLZh5UH00nx32aorGLWiV+B7ZFj6FYmtO54hqIoe9m3gu7ccVXQbCpe3mLW5B4
         r5W+exodjvNkf10f59nm25D0pK5P94cWUFzddkwgXTlXdZ8VCm5d+xWnBOH3DpWEBRNS
         bG1nDMEnnGbRHukxraBdBi6koc9PifGJT2jkp4uv7GoRFZKZ3mgcC25uFAzX7gaGKqTE
         aZAw==
X-Forwarded-Encrypted: i=1; AJvYcCW4s6CkKB5NcCOEcxwR7aRSQHdyBERYqHiGTTbB4l+BDuJ2DUg7WzdaP+KLMH2TZjyT7TwN33ThQolfPzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFTlN68j+VmwGQeYEskGCnwRpvIb7m9NgspWKmwSDIzaBEUW8G
	R6riv5caRpriJE3GnTPSEphVDflUsZHI5bVoMXJNhkD3sbGPj5mgx2Sx
X-Gm-Gg: ASbGncu/4ow40Je4uc2APfnVPtSBD/9+Oy24iANVPMYzw5SeKmUYLKluiiceeIZxP/Z
	avnfSb84MKvuTVFXcHDH9h9e76WMuzDWsMglV8ceSup99HpGatcF0iIKaBF9HsV0MUNSAk3SIFF
	KbpHHpHmJi2c9cehJncjBXb6bR/UJqdEKF+D44f4odQOyV3uJwLnDZ7b+9lGPEqaon+8HS8xKpi
	rRuNjA0+Z1UBp9X75EqTYhJ/CQA8gnfX7UUphs9xgqwGqdXzIpdPOY8tEw80Wb7U0jYiairFSd8
	k079/3n4Ouz0Uht8yyA0uymzHhrk0Xt7KVwiDmBIARwNH/tYy2RP4b2NfL7n2Q==
X-Google-Smtp-Source: AGHT+IHCT8dYOrXVi/+Xg757CRqS20cLpeeDywxgxweKp4h5M0a4WGEZ6RbtkqXqv5QHA6OTDFB+Fg==
X-Received: by 2002:a17:903:32cd:b0:235:1b3e:c01c with SMTP id d9443c01a7336-235e11e6804mr97018515ad.39.1749125075109;
        Thu, 05 Jun 2025 05:04:35 -0700 (PDT)
Received: from jemmy.. ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bf330dsm118673755ad.105.2025.06.05.05.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:04:34 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Jemmy Wong <jemmywong512@gmail.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guitcct <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] sched/topology: Add lock guard support
Date: Thu,  5 Jun 2025 20:04:23 +0800
Message-ID: <20250605120424.14756-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v1:
- Convert scoped_guard to guard

v0 link:
https://lore.kernel.org/all/20250604185049.374165-1-jemmywong512@gmail.com/

Jemmy Wong (1):
  sched/topology: Add lock guard support

 include/linux/sched.h   |  11 ++--
 kernel/sched/core.c     |   6 +--
 kernel/sched/debug.c    |  13 ++---
 kernel/sched/rt.c       |  35 ++++++------
 kernel/sched/topology.c | 115 +++++++++++++++++-----------------------
 5 files changed, 81 insertions(+), 99 deletions(-)

-- 
2.43.0

