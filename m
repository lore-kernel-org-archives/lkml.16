Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBE44C79
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750463469; cv=none; b=LwkXu66Ca8EQ1Otk59fJl1S0YBFtd4aBW9/NcIyvS8rcSPTC44xw+0k25/6+RKSMEPkOo4Tlwm+B16EY/n9cam8i98emPUNnSbUtqqJEpywtuNmT2VULK2W5IGHwBUHB3kKvMGLxgfl3IrxmK2sLrquRbo0tJVp/sct/cNr/bUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750463469; c=relaxed/simple;
	bh=UG0pHJ+uAqJPf6laJDHPPgB1ToxPm2YcWHQ7iAd5Oh0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=N+zRBTimuzlwHvOgqIlF9JssUZQYUTkVA7QdxGtbJZgNYmmyNBdxYJwQiqnWNNubYQJ95eeaA+kNL2wNtH9JriRClmf9H9ZhUR0UnIUFTuP/LvK/9sH7mIwiq2UTx1Xb8Sk0ImxsmVDDofB63QCZey4dPesr0TCZE86uMa0031A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTsP5BqW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTsP5BqW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742caef5896so1936846b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750463467; x=1751068267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=waNy4ez4bEWiFAi20kf5V6Z5gKcc9dgtrDoRnH3Tvks=;
        b=bTsP5BqW6yAqxoN9F5NDQrUcsY8Trxc4pkmd3DTwblnNqnjKCvIdru5+C6w8poow9n
         //GJLBGiZrBgQeakzZHTyEB+pR03lf1TSuE+286I62tMQFlLOhSQ7MRsm2sVUZezuDv8
         g6i/wD1kxYgoLxyk5xpyZ275ObPKb1pwoLVTExT7cj7uBCLhShjMSb9ZA+YQsJEixSKH
         iymtnGQAT4wQY0CveT4DwnkWh3FRajqheGtxf9LISo4Pe9ROST9bCkNZnEBMT2OlMSrz
         oB8Z9v9i5m5y+2FGkCkjQXnvIxqOVx50o0ArggSJAemq3b+dwhRtWnMBqrZX9CayDa1a
         /QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750463467; x=1751068267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=waNy4ez4bEWiFAi20kf5V6Z5gKcc9dgtrDoRnH3Tvks=;
        b=bb7QtRuSjtVja3XToHZoSFHlfJV4RMNxFDnnO51QeIbePrEYRg3ZAcIyStw7gwmHwl
         LBTpLjcAiOUqfE10mrDunXVIlaENtVfP502hHumqau6bW6EfmJHqGgT9N4tIRzrm929B
         +4twp+eHMhNfaVO8oH8In9CxplpsivF75x0HiWsrQj3EW+1Vy0sO6aIXI3wXavmvuQ0b
         BZZFXqIpBLBt3HX5PcRwvAu97prhfFypdhSxgfZxr8N1+SUKr1LgOttpchOZ2hc5TmfB
         andT3fJyds4U0KVzJIoxfKqUTbVQTBN4+x7cdWwjQ9vf9j4N9ley1cWLO3hXan8nhcC5
         6wvw==
X-Forwarded-Encrypted: i=1; AJvYcCU3B3v9XPgJy+yfHDjVLCLcZvq+BJXTKtlaaAr29Mda+EtkjgIwe5/mw0Rb/pFLCX9PzgoaDwDvM59Tvng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaQIiM4GR3vh7VLOPVAyeF7EdqgDTjAFk4kU2E7Pf/0GxKPHUj
	vSXg/PKZwZl/kyYrhjislWBwz592PQak4efFrKcj00qMz79cyZ/3DOBf1qQOYpmL
X-Gm-Gg: ASbGncsDqJG/CA9VLwclT9neWtGTv/j4KslWDOAun781S+KcjNNY3GqPzBMgCaw6g1N
	Ge9RZUR3pTs6zTGqQctLHcYjYbU1O0l3ROm//Y4ytsxY78kXS2LA+aDQKT/AS4qAOfPwrXxN9gr
	S/nUB6gka9D2+PxxeyVRmHP37UaqxiKd/sj2yuA83pkJwXQ64r7TXIZhcIAkbD4YI/f6fg2HVSp
	E2CP4Ra1lH6QfXUksQXOqr/FWj2z8zSTCx/gmft0qEXbOOysANercwfitVT3X6989paB3QdGKiF
	1eHEiwMxj5EieRzGyNkkkQOOLMDp3Kq6IlbhdEwlDFzwO1oBc+ICAO5KEWTGULtG2yapK6ev8iq
	c83z1kKoxd9G5lOuGP41e
X-Google-Smtp-Source: AGHT+IGXhlS4EuNUY1DCvllWMfs8pL3PnyMNQSQDD+Igpi3bZ08W8gV4hTscMjZcqVGIThQOQyrTXA==
X-Received: by 2002:a05:6a21:44ca:b0:21f:751a:dd41 with SMTP id adf61e73a8af0-22026e2a41emr8617432637.40.1750463466892;
        Fri, 20 Jun 2025 16:51:06 -0700 (PDT)
Received: from localhost (212.18.125.34.bc.googleusercontent.com. [34.125.18.212])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b31f125837bsm2146049a12.56.2025.06.20.16.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:51:06 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] panthor: print task pid and comm on gpu errors
Date: Fri, 20 Jun 2025 16:50:49 -0700
Message-ID: <20250620235053.164614-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series saves task pid and comm in panthor_file, ensures panthor_group can
access panthor_file, and prints task pid and comm on gpu errors.

Chia-I Wu (4):
  panthor: set owner field for driver fops
  panthor: save panthor_file in panthor_group
  panthor: save task pid and comm in panthor_file
  panthor: dump task pid and comm on gpu errors

 drivers/gpu/drm/panthor/panthor_device.h | 22 ++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c    | 38 ++++++++++++++++--------
 drivers/gpu/drm/panthor/panthor_mmu.c    |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c  | 31 +++++++++++++++----
 4 files changed, 75 insertions(+), 17 deletions(-)

-- 
2.50.0.714.g196bf9f422-goog

