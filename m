Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAC51EE014
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785696; cv=none; b=Usi/M6mMD7QiWSnZvp8BW9VZIaoTPOvA7gmvqfzUdfJlYnTfla9MOZ/FNCzb/GRw/n39ETO6/bGcss+GWC414MiYvSlew26pwb0Qfei6AjzPl1uD7JXpY4WT/Gp1oUYShsCcQomM3mngJsQKRmCqT/UQMYn55BclyY4luSphWKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785696; c=relaxed/simple;
	bh=FpD4wwubMc0fL6XWCCErw5r2dsG/NeLaImzcOMDvjmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L387VlnFvK7DDWwBGHuTN47qLFmPaLFNJ2LIxWkq9mx0/FaxoxGfdVPI0QbwqYP8UPxR/3X2sVd8+vFyNzyjX050xNxKsIj1RakTjpEj/AbXbXlnAkAQAhlWTTK89PmkW/0AxtRVHzk52lUO8HeyHwGNv/ofvlo7BhtFIoqLkHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBY8ZVRe; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBY8ZVRe"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3109f106867so2289380a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749785694; x=1750390494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oh76012cmxJ3NTVwP7C3j18NZLE+AAnhKDkHiE+sAeg=;
        b=GBY8ZVRe0OkS8WGiIszTPas/hoHNKGq7z8A2L+GjFFd/sYGYwXj/TOFkn3I7riSWC7
         z1HHPi8x1TIIVMef4CK8FvoY+kcga01oHQxZ69ac9mWR0KMznSRuJqyKR4VTSEIJGCIS
         tZAdjfKOAW0seM3eyttuntVmuf3rq2IowbNkaOhvXdvgiZSiiu/EJiyK5KkD319A2LKq
         lshiwjWT6cn5n5zC1HmQ3mukhW4fhHoHuQHUN+gNGkok4PUC/9krReqHIuIpCHx3oSTb
         j5Y1eozVEVyC9r15dOaoUkkRPhgrOL0BSfXoSxJSBEVqj5aGqkqYFApZis6pyMpZHcI7
         o3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785694; x=1750390494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oh76012cmxJ3NTVwP7C3j18NZLE+AAnhKDkHiE+sAeg=;
        b=O7eHhjjZGjuo9bMqzzgCO6o7m823o5Msd9QRBEG6v5skEMkH+B4ImLKem6avcGohEg
         /C/TK3GdmoTKaXSPCuORpC/blhyUk0KhPLWFSqaNEsiCJuSGg3L/Jzt4BBDjaFVIB2eo
         7usDNAswfZleTtaIu94+/q8V2fGNevaCF2HN6lKF9vXPJEvZy8YBIRbtFMzCQxgYs9q2
         +HrWkEZyvrNJfFJWYK96iJlU1whliSakOzjqcrkpZ4jVc6THEheZXiHJrCEmJgScKII0
         yoU/rdtwSC1qPTpQcGoGiOA4etaJyG0S4EjSTcVJNwdK8RF9DWsoUHh+vzEUdpXUEqRz
         LO9g==
X-Forwarded-Encrypted: i=1; AJvYcCWcyJ014jFPGz1BAbcqVHYkQk/E2Mhdu5Va4oByCUDXsu4t6Vy+sNwjFTOifOkGxaOGZ0/NWTE8zNinn84=@vger.kernel.org
X-Gm-Message-State: AOJu0YwI4qBcMxjHjgsmx/OqK8zMewQf7/EOmJtltWbvFkHyVIO3kR5d
	qGoesiWlAab9EW1jkuhWMbBXpf1hhuIcqSETVdo8d3KVcsyU82PaiAr9bZk7+kwb
X-Gm-Gg: ASbGncvnUciJRZlPirN20BIxmkVsW4v0BPvlntd5ZqYwZfxpqNEbP+7y0qaZOin1TUf
	ZtPFy9uJOFnIfJgpDPcpkI8uBgQd5LIYO9Si01MubkHfFbCymNHvAfOHoIeDhEZ3GA0Df+9d9lb
	HYfj4rcbUeopBTcP9/DrDsl1fGyFgcKpKt2hyUevZJSiClxcJzI2LIbFZEmI1iSA3a9war+Lg9S
	Der8FQqjgl0Rj5bGEZ6gTiy9av6WdSlL1wO21O2BpVHUvb3PrthuSgeMvM1p8j4dFwmvn05yob1
	Qu+nHF2HUo9IRaqgTWUtQmr3CVyCunDyVLTyUqJMCoY+bl9tJIjbffbfQIfjyNoCQ3sSegfJYfB
	Jg49WHtHIivpukbQ=
X-Google-Smtp-Source: AGHT+IHOuufe4CQvc1BCE1L8Rd4qCJR95BXpD9Vgy3EK1zdiYvsdX3GgAEmHJMXIR72cM/pSk6zPgw==
X-Received: by 2002:a17:90b:1c04:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-313d9eb63b0mr2164949a91.30.1749785694357;
        Thu, 12 Jun 2025 20:34:54 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm2339081a91.13.2025.06.12.20.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:34:53 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: linux@rasmusvillemoes.dk,
	jstultz@google.com,
	tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH 0/2] Introduce cpumask_first_but() and use cases
Date: Fri, 13 Jun 2025 11:34:45 +0800
Message-ID: <20250613033447.3531709-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduce cpumask_first_but() and make cpumask_any_but()
a wrapper around it, just like other cpumask_any*() helpers, they're
some wrappers around cpumask_first*(), except some special cases.

The patches are scheduled as the following:
1. The implementation of cpumask_first_but() and some
positive results of making cpumask_any_but() a wrapper around
it are attached there, including performance and code size.

2. Use cpumask_first_but() in clocksource


I Hsin Cheng (2):
  cpumask: Introduce cpumask_first_but()
  clocksource: Use cpumask_first_but() in
    clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 22 ++++++++++++++++------
 kernel/time/clocksource.c |  4 +---
 2 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.43.0

