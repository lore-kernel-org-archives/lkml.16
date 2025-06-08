Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02269881E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 19:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749411941; cv=none; b=Gkw2tVs6dYx5SBzg26bdYpoEjFKPVqrwKK3PKZZzq2KFJCK2TYUnf5shDcai5/vjnjAiZzD/UQHI1KviPg/txBozA+CWhtRkIozjFhWzrFxvfHCQJ16MTtk1moKYyTTsxDv23BY4bdjpjOhqYzBwZ4VJ7htIoFIQKY3byWIQJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749411941; c=relaxed/simple;
	bh=WmAaEb4VeYNHeF1gyX0JUNJCWncSI3EkWyeW3BTFygE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=h8iLiA8g8yEu2RtoYKKD7qS40Cd5tpndZhtX9b0wjLuKiAPfWwYHWHOCoqMij9T3Qva4MKBTnKcrgE24VUhnaGQsoLNU/0mxZGXBm0BsQ87hqyw6vMTWzg408vU2/KPffyaeWOXhV8avRPXRaCRGoVTBjM5oI03LU00viA+aBAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/EkfK6d; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/EkfK6d"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-70f862dbeaeso36331577b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 12:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749411939; x=1750016739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jA5lUcx66eP3xLue1ImK6xlFQSEukVcCS898XyoBxYQ=;
        b=m/EkfK6d7/+DIK2mhBWCB6mT5DIMtlC9IKGvZu0fCmOY6Jc7EzKgxcJiF2KaPezK87
         LCBEh2ELlLLnwRfbsNXqGQdOBY4ZnyCbTikH/KA+f8TNr/Ngs8YgyLtC+HuEQKG2rgDG
         vx9NzjevEPLhCXMto/QUstRi2gzX+TNDRlHHs6Q1/5sPVIMhBoPBVZYNRZomI/ng6lxE
         L02hvALIG1dHjs6bnq2Z4t3aCSr8nhHx+I2txkME32CyMnB6f8++QXC2BQwmoqjUkm6x
         GUXqe8QU2ZLZjBW1j/C1k4yP5OCzHD8dgaW5g4tzMd/yDVkGnEg08+UEXwsEaO4Ay8jb
         2cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749411939; x=1750016739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jA5lUcx66eP3xLue1ImK6xlFQSEukVcCS898XyoBxYQ=;
        b=fqLurxkayamHzBMQWGnkKQnFXa/TX1g8tlI8+SF2oA7xoeliDcpLIDPJ1UP2AIFVsL
         kZF8HXgeULH4/D26+hNd1EZScrmygiYZUTv30VK54VXsUtAwYVT0tniirHFQzHm0LrDS
         +pb0r/uMYuFgJbanTHmbMF/cih/F4gZWbECLzbyg7yGOTwmSvhIBrNL7aDxmompOEREI
         H1iXgEZYYxItprmCUJvbf1kiRwLaNjs2rEECPP6HXrUENmIigwVimDao9i02Nek/I1IS
         MrseNDlhXqLdv2ol6noLvJYsRHoMjyhg9Np1knDN3ecYv4cUduJmzcSxXTV5kQ3EYf2I
         2NdA==
X-Gm-Message-State: AOJu0Yz96ZQ2I7VsAYdphPah3DZL7hlOzw82ZM2KsXWdwoobCgv9mOC3
	B1JQA6CqrgDwHCAU3Ok68IaIpk5b1hi6VKNwDgwxndRChR37+ySmBK2awGbOiw==
X-Gm-Gg: ASbGncsQ1TWXrCfKfeol/3TBrbEfiXFDCRaQzv3d86tP6GxP9mBXkhOv7jYgUHDVQAF
	p/QeQJRPgMTdXGEsbEMIvkt0xfg3QFAVSZcZ1Aua1Iym1a0qYMn1mZlh1QP7kxLDPJootQstK8m
	JIKwsCP1JMfJd7MSpkBPNpDO8CQ4XEtnH3teLXcVcWm3VmFefpsF0mpgpsu89f/N3iLcGnMp7Hq
	Dqpqfki9MZrMrSELQBtb1VjHMjH4azikh53FuAVOXPmNWulTzhQ7wc8Q+ALojHs+lusKo1sbWk8
	FJDmSx16X1BQJgh54WAkC0BNn7caFU6pu1GGbEVK2f/+SDPRoqO1852l52eLnViKxaSxU3SG0ou
	06zGMy0ufKNQ=
X-Google-Smtp-Source: AGHT+IE1tEhrUs+D+/4UFyemoz8VaEoPyuLM7iY3z6XbjTGP8tD65BBW6wcgyUH928THyQXvqHnVow==
X-Received: by 2002:a05:690c:fc2:b0:70f:84c8:3105 with SMTP id 00721157ae682-710f772b208mr144006757b3.37.1749411938756;
        Sun, 08 Jun 2025 12:45:38 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e8f15sm9856377b3.71.2025.06.08.12.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 12:45:38 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 0/3] bitmap: introduce find_random_bit() and use in clocksource
Date: Sun,  8 Jun 2025 15:45:32 -0400
Message-ID: <20250608194536.28130-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

nodemasks implement node_random(), which may also be useful for other
subsystems. Generalize the function, and propagate to cpumask API.

v1: https://lore.kernel.org/all/20250604212125.25656-1-yury.norov@gmail.com/
v2: 
 - fix typos and patch #3 name format (John);
 - add comment for find_random_bit() (Andew);
 - explain single-bit optimization (Andrew);
 - don't include random.h in linux/nodemasks.h (me);

Yury Norov [NVIDIA] (3):
  bitmap: generalize node_random()
  cpumask: introduce cpumask_random()
  clocksource: Improve randomness in clocksource_verify_choose_cpus()

 include/linux/cpumask.h   | 12 ++++++++++++
 include/linux/find.h      |  2 ++
 include/linux/nodemask.h  | 17 +----------------
 kernel/time/clocksource.c |  5 +----
 lib/find_bit.c            | 24 ++++++++++++++++++++++++
 5 files changed, 40 insertions(+), 20 deletions(-)

-- 
2.43.0

