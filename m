Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4EE239095
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150848; cv=none; b=rJAU6EqGr65NkB1SKuW8aiXGpKYhNHECQpfbJdlyKdlD4RID/2AZ5A4aiM8uNkovjDX73JVx2BqbwegdlOKJkuu63CKzYoIPtlX8MCmiHT1Mt3mIIogKraUbcv7FrTBoKn3mURSIOwXyqK/PYqwaDGltpF2KJQk+QAawJvDm7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150848; c=relaxed/simple;
	bh=cxWJJW6iOVtCV/sX6/XqOnZuW8EhpYkJUMrCYLKUeuM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nMRNVzZmH28yLhlITogK7ALV6H7vBT7JFkF3imkKBnVw+Tb5IeVoFi2wdd2C2oBedyomVI1KgB2YN7mlKD+MHeDIRYuLBAgcP4PBZAp0hn8IdxKESkL9WvJZM8+rWyiW+y70NyhTEkcBpQyHKvamxPWHbHF+GAeC4Nd2DWTk1lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=j1c9a/Rm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="j1c9a/Rm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227cf12df27so1081055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150844; x=1744755644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yhG8C5ejpfVpYqkFNhT98j+3YvAHXJ2l2yaD7JDk9k4=;
        b=j1c9a/RmxmHW4qziZj3/TN9eRa8HP6MuDRHovAPPRlNNwHWUpQkFOomC3vhjwvRucH
         VFSg+ey/uaoFAk/4sqSxgje2AQE0CHnPDYYuxZFOFujG7G45dBuMqCVNLyVLu88EmEy8
         5Oreno/EGm2mv8rvuHastT3L2586SiwfNh9Uz3pudl2S/WlnvU0guQ8dXCuJJQMcaGdy
         97MN0BsMPEof088IgXm6SxSeLtqrOpsGabtDUa1wOeSBtqWeQocew4ss/2Pf21QdzL1q
         6DpIM52EKKAJXif+x/InJap5czNvSH5RcM/H9+veIbwgJgwzlQNhw/aoBVneG7MUXBoB
         E/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150844; x=1744755644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhG8C5ejpfVpYqkFNhT98j+3YvAHXJ2l2yaD7JDk9k4=;
        b=buvSznM3MdK15dWIEpBjN6CG666UAMcO3ElAXssJ/AcOW8rZ3KB/nV4dU6rkK/8uDb
         PymsEN++uKv5hlJdssdDOKS8jIv6qlTo/dt4quWhx8z/xLp3pkrzLauRpPHgQzS0z647
         R+jR51PgB1tWH4RI2PSvuGe/67wyetbnmPoVawyMFetPQupzylhP1GvcAeg2fc4D7tZW
         ugw20NOb0I1egdhse2XDZXmUpDGxk2EI2rYwqHM1o4H/SKhimEFap+eTl++aeYPGv3o8
         Rd4waogijACuJLiKzfBniFlZdBI4xrZOtJhPVC55fseReECmG99BK4NboXXw9ycrSAWk
         qGLA==
X-Forwarded-Encrypted: i=1; AJvYcCVO5K3fG1xzgA0O3Y8Ck8Cr6FCGq+qe3MxZXbahErTjM5js33m9CwQmsvMSKZ7HlcX5MC94B73A2hi+R+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrHQF8vUOR8L0NeyNUBTbiI0bsOcxjSyDaRjWk+1vgAvkrIj9z
	NaavPmWl8H6W70tT67rqji2aCho3cOCXWUYdwjXXVzmsgx3q4zl07xnbsZAvfA==
X-Gm-Gg: ASbGnctXcRwbgZrBhdWprbfuQdddLBxLOT7JBs9nb145K6KVpzLQajetL1CzfYA5EjP
	e/Ick0J64DI+w89+tRmvFN0LkhBCHPGlHbwhfV5j5LMgpK5r1O29P6nEzzRwkEGkqlZX3eU82mL
	YOBaWgMmQB2at9gdE6yy8VSW+k0IYQYntnq4j0LK5quuSMfwwgqVuhZhSuRr3iWntv+WQjeiD+u
	YbtLZmHiReyf1ZZQYeywMM+wnIIE5iixqY9b/KINPNa6ZAJxVdJ3+yWl/VJODQT1rXZWbcjGvlw
	C/JkXyAlu7MTQWx7YdAiMcBoNoouzXNE8ayO8qU2w8lVOKb1JtgNHrp4F1U7Z55YwbA9dt6Xv0d
	r+UN28dYWJA==
X-Google-Smtp-Source: AGHT+IHLscTrVUYfDcQXA7Opeg2tJl7oeC/Viijv8pzgdRWjRL0M9eLCdJVck1yS1ndzNzFctgKKVQ==
X-Received: by 2002:a17:902:fc84:b0:226:194f:48ef with SMTP id d9443c01a7336-22ab5e382aamr75996205ad.13.1744150844381;
        Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f31sm11460775b3a.135.2025.04.08.15.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:44 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/14] staging: gpib: Adhering to Linux Code standards
Date: Tue,  8 Apr 2025 22:20:26 +0000
Message-ID: <20250408222040.186881-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches are cleaning up the gpib driver to adhere to Linux code style.
Cleanups include:
	* Incorrect CamelCase
	* Lines exceeding 100 columns
	* Improper SPDX comment
	* Fixing an open parenthesis alignment

* Patch 1 & Patch 2:
 * Fixing Camel Case for Constants

* Patch 3:
 * Aligning an open parens

* Patch 4 - Patch 9:
 * Fixing lines that exceed 100 columns

* Patch 10 - 11:
 * Fixing Camel Case for constants and having duplicate constants resolved.

* Patch 12:
 * Fixing Camel Case for constants.

* Patch 13 - Patch 14:
 * Fix Improper SPDX Comment

Patch
Michael Rubin (14):
  staging: gpib: Correct CamelCase for EVENT enums
  staging: gpib: Correct CamelCase for PPConfig
  staging: gbip: Alignment should match open parens
  staging: gpib: common: lines exceeded 100 columns
  staging: gpib: nec: lines exceeded 100 columns
  staging: gpib: tms9914: lines exceeded 100 columns
  staging: gpib: ines: lines exceeded 100 columns
  staging: gpib: pc2: lines exceeded 100 columns
  staging: gpib: tnt4882: lines exceeded 100 columns
  staging: gpib: uapi: Fix CamelCase and IBA Dup
  staging: gpib: uapi: Fix CamelCase and IBC Dup
  staging: gpib: uapi: Fix CamelCase and IB_STB
  staging: gpib: nec: Fix Improper SPDX comment.
  staging: gpib: tms9914: Fix Improper SPDX comment.

 .../gpib/agilent_82357a/agilent_82357a.c      |   2 +-
 drivers/staging/gpib/common/gpib_os.c         |  22 +--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |   2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |   2 +-
 drivers/staging/gpib/include/nec7210.h        |   5 +-
 drivers/staging/gpib/include/tms9914.h        |   5 +-
 drivers/staging/gpib/ines/ines.h              |   3 +-
 drivers/staging/gpib/ines/ines_gpib.c         |   2 +-
 drivers/staging/gpib/nec7210/nec7210.c        |   4 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |   3 +-
 drivers/staging/gpib/tms9914/tms9914.c        |  29 ++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   |   6 +-
 drivers/staging/gpib/uapi/gpib_user.h         | 146 +++++++++---------
 13 files changed, 121 insertions(+), 110 deletions(-)

-- 
2.43.0

