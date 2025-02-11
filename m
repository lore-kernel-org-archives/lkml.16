Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309411F1523
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270431; cv=none; b=jBtEMBPHNS2Y//41CV2CXCAjL3Mpz+fE1pJLQ9YIb4Yfijp1mNgjh6HgCvnWd+NJzU7Er1kb3POqnN0+hxezcVl/YPinfAK7DXXr+J0OyvmvGEX43kqkcUQ07yzeAVdsIRkDdPIT7R+5LQBHpeTo+iZmb17BeEHdcmkIpx0zeRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270431; c=relaxed/simple;
	bh=OBPEOTjpU/SX7eCLQOaMK8EKlSkDkTGr2nRL2sJYH48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tj2n/ts66bmylmfqyObRKQ9/E1niB3cAUPqJiPJfKf5jDJscR9akLFTKcMFuOS4e4XFb/HAuS2hdYju9V2iv93wOjlxzcpE3Z0dGcXwgIgopO5h4rssP0SXfDllzm2snh6U7/FXYeuv6laeqgiOLHdg+uw5/DKsRkNpdCx5RfsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRVUQcv2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRVUQcv2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dcb33cba1so1994150f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739270427; x=1739875227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
        b=PRVUQcv28eUowqqoOjN+pyzvjYzTp2BhMlhB+H12SK7Tn0i7dVhUVI9jYQeKvOje79
         NzPrUtO04EYHutpnzhdeOuvqnY1UwDUKJVCIK0kveJAEy3Pa8n7NbEgpmsind+Otmlv3
         +VKSvptptO01CtNJv9fTuVmFrg2z3bD9zINw3fis+ZIZEHAR7oVgb58q2Xnh+PH6pEDt
         UEiEjaxL5i5coyvU394h+grbeY30xnf29RbP+Ux0CssWyTNUosVzbY6dZ2nSNj+ABXrn
         rtNSk3EPOWAqvsg/etqmKag1pY+ZaK/KfefEY2Y0w2wQIGcBuyjd1YwNLA0GDDDgtga3
         DFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270427; x=1739875227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrQhaC3gKZKDAc8Ce+Rq4JirL36T9Iu7HnsPcFoyuXk=;
        b=WtJ3rbpuu+dUp3rpycEp9ivXtndS08GHFtrWWLRBeSTtZbK3UcbmPgOBqankT6iruj
         tRKRUMTBdcXVLReHvCmthmvkjFWLGEsSgPUyt3TFaqZuogi9+FNavUr08T8civ3yS6zB
         fvjw6E0cqExrKxWukMnXcDK1BLL5O0F/cWTVjWDt9ArnXcxpqd04f/kZYdiLUwHlFZXi
         Ax+rUlNuLmyfxOdAeQPJNpHpGS14CjjxgLq5wCk9i6t/NGarjyQ8rI6EE4Q3YdHPc7GQ
         2L4p4IBdJG1zSsev9eMyl5fXSK+Ixy4ME1EkGGD6n1XzoMjHTpaTdyncmNZjxaIvpHMn
         z4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKb/3nc9QQkLUvwplN7m1zV69uX6R3M7fYRM7gI3vnbuDRFcc8EyteW24OU4gaRVeMy3Cl5GhMo74WivE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPDCr9K8fYAPvP0p3Bl5nBRkIlWZYXZJ50Yx3kfCFp1ylMepx6
	++m+250w9Owfb8CQN2aXxC48QcMfa0udqOLNaKMOLAZbFpB4oDP2OotZ+WCRACc=
X-Gm-Gg: ASbGncv9p9O8NGHLIUmEnB2jDiOn3OnWVtO0rY8r2CFW791lV40gqjMl2YRC8ErinxU
	EBSgnfAnQY4myh7wE/5TxCzIAjU6hAJKu2gG4pTArVLFVhUT/tzy72VT2lvWlInw5z/7xB9Y6nE
	LNsSl63xDu3bXTudRnO31CRb9LM9O/jjHtxi71i2XvMLT9j2Fk3hK0q8osxzzi9+hjzH8uNXc8e
	sfWW0A+0n9Scv27CWeGtSSNK4EoSpH1I90UobNM6SkETfA3JZUFVuTKgZypBqj5ogOXBk0x6jaB
	2Zmx6kyyokW3
X-Google-Smtp-Source: AGHT+IG4gEm4nSnw8t/iNqVVtVQKgUFA9cxJ4G6BsHMjOTxtxqqAhDt1o8nYwzMfYgssh++RTKqiSA==
X-Received: by 2002:a05:6000:402b:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38dc9374026mr13853655f8f.35.1739270427442;
        Tue, 11 Feb 2025 02:40:27 -0800 (PST)
Received: from pop-os.. ([145.224.65.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd02e2a90sm10456047f8f.98.2025.02.11.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:40:27 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: lcherian@marvell.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/7] coresight: Clear self hosted claim tag on probe
Date: Tue, 11 Feb 2025 10:39:36 +0000
Message-Id: <20250211103945.967495-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've gotten stuck a few times with unusable Coresight after a warm boot
due to lingering claim tags, especially when testing the Coresight
panic patchsets.

This change does some tidy ups, adds some debug messages and clears the
self hosted claim tag on probe. The last two commits are unrelated
tidyups but they touch some of the same functions so to avoid extra
conflicts I'm including them here.

This gets as far as fixing the claim tag issue, but there is some other
state not being cleared on probe that results in the following error.
This can be fixed up as a later change:

  coresight tmc_etf0: timeout while waiting for TMC to be Ready
  coresight tmc_etf0: Failed to enable : TMC is not ready

James Clark (7):
  coresight: Rename coresight_{set,clear}_claim_tags()
  coresight: Convert disclaim functions to take a struct cs_access
  coresight: Only check bottom two claim bits
  coresight: Add claim tag warnings and debug messages
  coresight: Clear self hosted claim tag on probe
  coresight: Remove inlines from static function definitions
  coresight: Remove extern from function declarations

 drivers/hwtracing/coresight/coresight-catu.c  |  14 +-
 drivers/hwtracing/coresight/coresight-core.c  | 132 +++++++++++-------
 .../hwtracing/coresight/coresight-cti-core.c  |   8 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   6 +-
 drivers/hwtracing/coresight/coresight-etm.h   |   6 +-
 .../coresight/coresight-etm3x-core.c          |  32 ++---
 .../coresight/coresight-etm3x-sysfs.c         |   8 +-
 .../coresight/coresight-etm4x-core.c          |  12 +-
 .../coresight/coresight-etm4x-sysfs.c         |   4 +-
 .../hwtracing/coresight/coresight-funnel.c    |   4 +-
 .../hwtracing/coresight/coresight-platform.c  |  26 ++--
 drivers/hwtracing/coresight/coresight-priv.h  |  20 +--
 .../coresight/coresight-replicator.c          |   7 +-
 drivers/hwtracing/coresight/coresight-stm.c   |   6 +-
 .../coresight/coresight-syscfg-configfs.c     |   2 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   8 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |  20 ++-
 drivers/hwtracing/coresight/coresight-trbe.c  |  18 +--
 include/linux/coresight.h                     |  32 ++---
 20 files changed, 209 insertions(+), 165 deletions(-)

-- 
2.34.1

