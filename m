Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF2379D0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 15:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749916237; cv=none; b=ljam6Y331XltS8hRqxqXHqS2kzO9XiIqcZn0qNIpHccrrwogFKjYV2tcZ3OS25RqohbBcwrx3Lrjx3tEcErrLBOdieOtNpk8ZJucTHrQUGJ0ZS6dpG8JzcEmHhsfsdpiooR3pl2lOn2cK7/ChanZeg3QDD/5UGv2oq/5C5u6zsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749916237; c=relaxed/simple;
	bh=Zaq7Z9twZUJ5mV1KL5HpSHurHn8iAqvfYJNSD2xB1Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tZkfEipyHUIL7YXGn5vvQjZtx3RBDu4sraRIPHmCo1Yqgj/i0AD0qji2rTxYcR6L85P7xIy3tvMU8efsS0ux6wYNr6R/gRF7cbalZ6Wvj0I7Cv0kibYLpF9jo6lP3M63hmXyz6RmpM5eOMJICvzxJ8e9dBRdMTRS3liAYEc2CPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HE2XpTPQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE2XpTPQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-234fcadde3eso40224455ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 08:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749916236; x=1750521036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6flnCDdhhVLhqhBNFRNvuKlLddHAS5oqgW9XRHr26o=;
        b=HE2XpTPQkiup14QEhuDLDzBUpO4kC6yuCZnJ6xZu4mweh1SgBzxrojd0/fnObonTlr
         OpHg/asMXQAL3hUv3GVleEbrd7xqS85rMGPuRg2rcoOcaQ9+Sb3TCQ5ink3fPx1KYAS9
         94ZKbU5qqUCSJgASre6KdbqxrLaumOgt/25oLB3asexZFDPNtyAmZ2Kf9DFEFpkRSVe6
         yjGNE2DQVtM1O84LSb/qpcKF//iPQXJm4S0UrD2V5HZ6zLXgEw3DGI+bd4Ugmxq8IeW9
         umxDU4EzUOMsaBJzk4bBlnYEPIO5uH/jvYUzDoechbYg7O0kmMgUsW0o30/YkOsLsjtn
         LoLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749916236; x=1750521036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B6flnCDdhhVLhqhBNFRNvuKlLddHAS5oqgW9XRHr26o=;
        b=we9Fcv6NbzBAxLJLgo42m83CH2Ug1PT/1HVODcgAPtXuo5TvyqzV3UYS9YUDvPGUr4
         UshLcvxEg4c84YgBNZnKDw5cGxqKXvslP9hobhpqnPPYYPp2jzgc6czlwIJo1KFZ43bd
         8sNrcCLFXvng3P5x3fmUviulCMWZ4+SoQb6QoV18TiyB7xZyKHY48gmEBBwsazA1k8Z+
         16E1QuaGQKLA8OoXguM7wNJV8EEPhrrhJdArHbcoiB77jNb5ncTQ8ncNkKw7Z0tQwjim
         5TiHMJ2d2WqpwunhoyQGFmZ7cp1LhcCgsvCI/eG++OfEnVfIjChIqIElg1nRUPbKII/T
         O25Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaMgJ+ShhQl13EIestTTG3TXeV0UUtBDa82JZwyZZjs7P+v2RaEerBL82wC2m0cnyg5ZP9LbrSVKKsNhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6l4KB3wXpOWgWUtQvrC0JEdVNL9AqdsI6u9b3RTGeN+Pjkfo
	k+Mo87Je9WqH1s/J7rBaNYgYIXMYQA642ZmR5l0A8D9iq6oabtaxgdkx
X-Gm-Gg: ASbGncvypzxxqqxtwaGTBcnUDVxkG6acsu+eHPKI5bri1wA1g1BvCGcGrV/bR1umB/4
	DSGL0gtArr3PJl2xbFhfLcRClSOliFrmIJl5J1WIb6iigJuULwE0yqrbEAWSF7oa7prTHgSqnmF
	1AbXSHLhofXufZqBeSkC10PhbnoK7CFxuiq1CLSZAJz9KRySQ35k7Fsvo6ItNDM0dxT5CAbp6Cq
	D0Pt/LyQwVXwF2Y/O9Cx1zfo9ZzTVpepCkKYkSDokK3jzKRJmodiDGxsFDd+JZL/N0Jl1qJQCN0
	GiI/xMqzjXvqH73dZxvFKyNxNvFsROsR88OHB0yeW8uvQ7FG4EciHMaqneX/KQ==
X-Google-Smtp-Source: AGHT+IGJPauU9lyN9j7kFN+EfeejWwO7Uhp0JuIVx3fKRO4ljVsnpH/GxH6evBPPCoRzupHdkwCPMg==
X-Received: by 2002:a17:902:ec85:b0:235:eefe:68ec with SMTP id d9443c01a7336-2366b32a069mr54244335ad.19.1749916235534;
        Sat, 14 Jun 2025 08:50:35 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb0484sm31711775ad.142.2025.06.14.08.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 08:50:34 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH RESEND 0/2] clocksource: Use better cpumask API where appropriate
Date: Sat, 14 Jun 2025 11:50:28 -0400
Message-ID: <20250614155031.340988-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The dedicated API works better and improves on readability

Resend: drop 'fix opencoded...' wording (Tomas)
v2: https://lore.kernel.org/all/20250607141106.563924-1-yury.norov@gmail.com/
v1: https://lore.kernel.org/all/20250604232550.40491-1-yury.norov@gmail.com/

Yury Norov [NVIDIA] (2):
  clocksource: Use cpumask_any_but() in clocksource_verify_choose_cpus()
  clocksource: Use cpumask_next_wrap() in clocksource_watchdog()

 kernel/time/clocksource.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.43.0

