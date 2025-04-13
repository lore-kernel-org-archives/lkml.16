Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD9E15990C
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529565; cv=none; b=d0yQQblsOJkDufVqaj5mpPSL6vABES3hznmPnIv5fKg7d25Lg795EVILfh8ZK04darUl5EwiJdAvZVJL/dM4QXifCVJr0eaFcLokqKmq27puF48jthRCV0/HVm+GaowVeo6pfCiQYdsMfsrK8CZBZXFynbemc5chNp+G0IeHD4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529565; c=relaxed/simple;
	bh=9Ijdkg6jBIROp0oaiFxxY38TjJl3H8rWa18W89bmf4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+74CMJyqAUKawCP2cZ9+A9AzRFc/C7ccu83G4+QT4Ih1n5aMd9UrcRraWaBeyzZ51v2wDHtuRiobvCvdelETGlZA+g9q1VthGJKQHnFZPCgJf6h/BDSMwHat/s7PL3P1N9a3O9HbqAgvVosL14qoInYGnmzaA8EbNfa+GPAU6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khwCUbuc; arc=none smtp.client-ip=209.85.160.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khwCUbuc"
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-4775ce8a4b0so55173921cf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529561; x=1745134361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=khwCUbucX0V+sD0FR0laYMuGte6RZqu7kSv7WkQyeq0uTSYxFAFwZbKuvoGS8pkN1W
         BurOgBpJgEGAS46ejMRI938wxzIIjrGWmMcIs/uRzbQu9vcFbSorP+yFoVChhqxiL6Yv
         f9zHiIpbbfv09q3/ZTVa3uGSJDwBPgMFfl99AAmoQ+zkvftJDHBw8wfD0sXXKlhrEfJh
         Nr6F2S2N2StcbbA8x15ABLoQr1LIw5aIkJ/EFtx+NXqKkGdYglD4FPIRDO8RucbL7zaQ
         cc7eYI9W7vRU56ur9BQYdexa/j89rKybqQvL9M/DmylPYlbVazsaljPDWkWFbcjiArjd
         PCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529561; x=1745134361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=OyK6NIu6L33RP+AHDptmjMuEAo4FDWdkHamavJEGCNYJXabiGtajnHmOwrPOr97MGO
         lyRnua0jHgCmn75tqHxrvycFs3dcneNJfYAuABC7uuDxnDe7z/GH7JNWp9+uP/h//BMh
         i71EwujE1vzTGvHTN2UqJ8pPfMNvGytIIra3SrIA+bnyNkfpUL2d4xWtN5aku7ezFyT/
         yiiROFe29vwNRUBwVPaJiBYkq6dAnmykUDmKSMsS4lsGZivVtauZcn2V3WOYUqZyPupR
         GWC2IwJrFO4uEXyKPoUoeMogVyW7b8qtQnPk3mflqk3a5uhUXJNMjyg38AaW6SqEYDdJ
         shSw==
X-Forwarded-Encrypted: i=1; AJvYcCWtYpDAeHdoowOdgOFFxkcqXtTP9AsdB8WXu/NRzIMr4VOJis4J6pLogG7oBtV2Z3G07e5wGOLYjTMrLcI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/BMxZeWizBEne75+PGRNSyx4qEU1424U7UcPiq8fJvgBYLYm
	AwtnJNrZAzE2i24z0U0LbDYdBg45JJqk+5BuRL4HyUjEwOCFCMtLAXfRgjd5MJRp5Q==
X-Gm-Gg: ASbGnctS/vL+b/mWTWmFvM78PZjknnccB9Whf0Xcyj1gi856tTtxbP5kYpE9nXSdHhy
	vjZjfqwjX25MjouF8z6xUGrJTL1+hizz/L1hA9Ii1Dc/uq9PUuNXZv0PFthBirNMk6XbK6BYe2+
	K/3pEiIMwIcWNTZ4nx87Xn2BSWz0Ey+pFHbkEbUMx5sOKMHbcfq/McUbuvdc1NxCFH7ymho7UcC
	jenD/VFhEHhYlqQlILuH82uObwQAUueXZi3UvBPtFXXjGskWFcP+o4vaCIhGOTBaxUzQTLfKnXp
	ga/iXO+78/4S72bqdVJT4YQEz7O1lLMScOLM0/2TAJTgjEy89g7S2siKvuBNd7oUS9lhyXN4K/k
	JPzgUpmnNAXaLTTIXIA==
X-Google-Smtp-Source: AGHT+IGOP+2OtvsS7YolVOB2aGg75agobNToUGsbXzhY2oPmkrtUdrL5JFKn/GUT0mDN/OPwZtecvQ==
X-Received: by 2002:a05:622a:1902:b0:476:964a:e335 with SMTP id d75a77b69052e-4797755aaacmr88773491cf.24.1744529561246;
        Sun, 13 Apr 2025 00:32:41 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:40 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 0/4] staging: greybus: cleanup, API migration, and refactors
Date: Sun, 13 Apr 2025 07:32:16 +0000
Message-ID: <20250413073220.15931-1-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series splits and improves the previously submitted single patch by
breaking it into four independent, logical changes following kernel submission
etiquette.

Link: https://lore.kernel.org/r/d683962c-e8b7-4adc-9902-483976197637@riscstar.com
Link: https://lore.kernel.org/r/5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com
Link: https://lore.kernel.org/r/4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com
Link: https://lore.kernel.org/r/202504010829.vIzweYue-lkp@intel.com
Link: https://lore.kernel.org/r/202504011217.iRb2Bbls-lkp@intel.com

All changes are isolated, reviewed, and tested.

Patches included:
  1. Replace deprecated strncpy() with strscpy() in firmware.c
  2. Replace sprintf() with sysfs_emit() in sysfs show functions
  3. Refactor gb_loopback_fn() into smaller helpers
  4. Fulfill TODO by splitting get_topology() logic in audio_gb.c

v1 feedback from maintainers highlighted the need to split changes and avoid
unrelated whitespace or formatting edits. These recommendations have been
carefully addressed in this version.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>

Ganesh Kumar Pittala (4):
  staging: greybus: replace deprecated strncpy with strscpy in
    firmware.c
  staging: greybus: replace sprintf with sysfs_emit in sysfs show
    functions
  staging: greybus: refactor gb_loopback_fn into smaller helper
    functions
  staging: greybus: split gb_audio_gb_get_topology into helper functions

 .../greybus/Documentation/firmware/firmware.c |   6 +-
 drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
 drivers/staging/greybus/arche-platform.c      |  11 +-
 drivers/staging/greybus/audio_gb.c            |  36 +++-
 .../staging/greybus/audio_manager_module.c    |  13 +-
 drivers/staging/greybus/gbphy.c               |   3 +-
 drivers/staging/greybus/light.c               |   5 +-
 drivers/staging/greybus/loopback.c            | 167 ++++++++++--------
 8 files changed, 145 insertions(+), 107 deletions(-)

-- 
2.43.0

