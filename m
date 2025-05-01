Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FD20EB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135043; cv=none; b=tNL6oMvLP8lAzoS2stjyR/s5j8hypyoK/Aex15a5hPwOIkhzxUiUO6Q/T0LJbS4FmNryAhB/3hqbOETFTHt2h6CsG/uM3qpK53MKIBX+uxYMzhADkkbPW2bPnjow11tHNGMXLSm0uXzgkhqTcuvnQseEXacJIjEdcLFeQt324P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135043; c=relaxed/simple;
	bh=YyW/COy8u0xSHkNYfU0H94CrJ1LP/F4ydjWB0Z03IIw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GkQsNFGxBcAPOYRjejT0dPlO0jLjdWmc9may1z4okI55MLGmmhxx+E0QH2egKQgKcGV39PrW75zBSn/eNOJ77zwvgLXwDMUZ4BSzXTgE6TOGfqFEr/2X2d8siJ/BUjOrcmHayEuRByxdM9v2Wz8bvNJDjPwk6c28ztQoHVCAdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DieGXnmo; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DieGXnmo"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so2441885a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135040; x=1746739840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iU/SN4E12P0EznwvjosLSqRTc+oShnSCyWHNdSLiMcA=;
        b=DieGXnmopl5rLvgz4YkvnvvmRT+QoHC6faRrEBHULKMlcx5z/fMX6FvqdpNvfUV50z
         zQeDUFIMuZ9TVr/hKnFdMp8Dg+Tv4Kpcf/enaT9R7VI+/VDhzm13mpAz6lFMcPO4qciV
         +XQd9Qa+6CwslFdQ3fRWJ77fbgGyV3UbIg3sgRPrXE5zuCk/OUq1wm4cW6coTLC0+bEE
         IWDm4wF02vPj0ZhGusvUbI+dwwKN9gXATZfgs0FQfrM0gOBfuvcjfqMYR1Y4h/3qa8pc
         I1UY7gTCR8IrGtf4RZOsv8O52+lOeOOJpQOwjf65wobcyaJJdbw0R7I1UuAmzOnmHrl5
         vj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135040; x=1746739840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU/SN4E12P0EznwvjosLSqRTc+oShnSCyWHNdSLiMcA=;
        b=vnAGrqDy1ipX6dtx9eEi5Ffw87JBB0tiSw0tf02FWYYwe1DIniJusAjky47ESihaZl
         fMiCMcWjHB1snUB8mPGl8bcbyXLqIYgOgzlweO+9pTD+ckNzwerfDz8czyTBtaNLiRS/
         EQ925vN3BOOhnCs/eHxhE4FBLBt71y/LuzPAuK5Yl/YfJIK9h7wG1oawp1iWIMOH0HHO
         GxJ+ledhyTlluffNdAMICZFAlEMd54hLrQwATQm8RwR6GGBzBKW93pGDaE1eZh0XBtMT
         QViXuT09epenZappcKyM0gXgemqPd5UD8VdDEj0qMaLg7fx6CQnZ9xsDD7Hvjy06QYWh
         ZOcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMqdSPneHukfBjTNBhJXDwZ1bP7MybS+6UKGvpzaBUVG82GJDTPMT7Lq9StWz2CHQJsL3mz7C4IKCgVZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjSe+9pS32QqC02PXyAnHjTgGbN8aiSujihq9I8LroKtRfrCYH
	ZMFcetlfvG32SclXt3o3hdx08aozaDm1UzstxuM3ED3wjqr9KwSu
X-Gm-Gg: ASbGncvv8DTEQg0oc89JtiGRQTM14GKkfeeBdCSnMeEMVryhIjmQ09XTf0gnvMX968I
	Egj/DQ/V0vIWtl1xtjn33ssWLbsiOSq33lVHWQFSU7Zdcg3nljDEI2IraoLIJbsz40e2odb37mZ
	KOqxZTX8/nUOjUS6lgNCoYGVD4Ahf/Owp6A+d6Xi9q5MzvI3c+3t0b+yEqN1MAu1XOy8EESiLhY
	lGbu8GqLDMB5AeReOZTSYBGTj8cVuPk1D9PbHfrYV1zIcT3hiuS8Y2zTI03cQ7/vzzkrEqJLK2X
	AcBv5ct53GxZeLjvVTD7aPSFPymhwAmNxl3AtoVk1Oq/qMjcToOtPHIDEFKEbM4UjC+nbnB9ZKY
	9s82zCUIYINGp+kkCoiExWkZ3Xg0IYmKqFNy4xkEt4nUsZFMfRiV/7AKGKw45SR+uai7US6f4nJ
	V1ng==
X-Google-Smtp-Source: AGHT+IFBTxdVdQrLfnEhXg0W6c/Yj8/PyvkL5d89UZu3/fKawbDUQB7kLSAVoeyo37fJrpZwjPTuBw==
X-Received: by 2002:a17:907:728a:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad17acfda03mr73271966b.3.1746135039633;
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 0/8] Staging: gpib: Update return types and error handling for request_system_control
Date: Thu,  1 May 2025 23:30:29 +0200
Message-Id: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series improves error propagation in the gpib driver by changing
the return type of `request_system_control` and related functions from void to
int, allowing proper error handling.

The changes follow these steps:
* Fix the FIXME comment in agilent_82357a.c by changing the return type
   from void to int
* Update the function prototype in gpib_types.h
* Update all implementations of the function across drivers to return int
* Implement proper error checking for the new signatures in the resume function
* Improves the mutex unlocking path process in the resume function

All functions that used to be void and didn't had any intended return code are
now returning success (0), and the resume code is refactored to ensure mutex
unlocking in all execution paths.

Thomas Andreatta (8):
  Staging: gpib: agilent_82357a: changing return type void in int
  Staging: gpib: Updated return type `request_system_control`
  Staging: gpib: Updated return type for `request_system_control`
  Staging: gpib: Updated return type `ines_request_system_control`
  Staging: gpib: Updated return type for `ines_request_system_control`
  Staging: gpib: Updated return type for `request_system_control`
  Staging: gpib: `request_system_control` error handling in resume
  Staging: gpib: Optimize error handling in agilent_82357a_driver_resume

 .../gpib/agilent_82350b/agilent_82350b.c      |  3 ++-
 .../gpib/agilent_82357a/agilent_82357a.c      | 27 ++++++++++---------
 drivers/staging/gpib/cb7210/cb7210.c          |  3 ++-
 drivers/staging/gpib/cec/cec_gpib.c           |  3 ++-
 drivers/staging/gpib/hp_82335/hp82335.c       |  3 ++-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  3 ++-
 drivers/staging/gpib/include/gpib_types.h     |  2 +-
 drivers/staging/gpib/ines/ines.h              |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  3 ++-
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  3 ++-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  8 +++---
 drivers/staging/gpib/pc2/pc2_gpib.c           |  3 ++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |  3 ++-
 13 files changed, 38 insertions(+), 28 deletions(-)

-- 

Best regards,
Thomas

