Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CB64A8F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849971; cv=none; b=t9qezzmYTmFzSxvAI9o0hFEoShPMw1vpFVjGuXMzZbuiPAHPeVqYBJmpllbpocgopVKmc/D1Uzz3INSdx02Gd5YpeVkewECIU3dFApbz+U+GY+ndH2iMhviEkj56XEDK6RLDadHLwwTx9NKTq22DZlgJR46MIU/sT0icYHvZYgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849971; c=relaxed/simple;
	bh=gZg7ExtwzVi8qHlxeB/XQGuWE8A6lNlGG85RQ6h6e+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P47kSa15sOYM9u0qfyB6rAvv06y1ljzQvEEsVPhKb1Pm9hHtxathBvJq8BCQqYVZVkAMSgvmRq/C6heC3549Uu9XX7dm65rYHQug1XbJtpa6fjRW8cA90OflZfRHXqBmtBJTy/zBsxgY6/yonyyGX0q/mwtV/xbYzPcm3ZdLEms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fpsgfcK7; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fpsgfcK7"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2264aefc45dso4198405ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849968; x=1745454768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ak1ahp2Tq7ZyV+BSi9SIxZRZpMgOKt8zB/5bQj7OZwg=;
        b=fpsgfcK7pN4ykuZt7LS03cS4Cv/AEqtJXX5sLuSq9/vjilILU4SHy8Bwkoa05xTNHw
         w3n0XEoSBdsmcR/264SUVGRiQy9pA0xGgRGUlCOemqqQJxJG1pYsJlnWsIdroVmki8Ex
         XomRZAfWHvp7PfoO8yzTIs8XfRr6tZNcPD2/lWfgFYskL5esZDTZwlo82NxAQQcXvM0n
         Bw60RhQAMKUrOARV4YBys4o28ya9/1y/iMPLnbLwV7QLftbPWDAZDi/7vqMJqtT3u5iZ
         oD6igXPeMj9tD2+ka69mzX9nkJWD+rIRYVoz2uchY4m6yat0aHJLL36fDRWEbT97P+GB
         ZH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849968; x=1745454768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ak1ahp2Tq7ZyV+BSi9SIxZRZpMgOKt8zB/5bQj7OZwg=;
        b=foIOD2EYy1mbG8pcRU8XUHyPajcahZJcb1ZTVOldAorHQwx4j3ZEv/1MCjpmBeec1P
         70zMFjtomHeTyM5tcZEp+++cGGNvxV4eG96uWPU0Bl/Kpz2TRENspvccqMaNuSBlrtUf
         CO3Uy8MM8ir63Dk3tVopS8ubuMnwQ2vKAzz4vMEWLlxY4QkcPPI+fzmCuCX9BvuyCb9K
         kzeYG9MvBs9hR5NB7dV9XnoC/2a0YyxKqA51/vxI/LCoaE5sANmCZkD4RnWe6NacRqFO
         3EUh6E4EdFpusPJW7C+UJYJ1th2Iww9TaXEFCgph8040ZWhPD+ABNMGsEcHORgeecCUz
         poQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOCujKz6ss/Qcu6qxgYcaW5+S7QarcfBFNz6s+/lTYCHrBvfBOO+5kmHsKdPU4v+TuPtZIwWRamDUB/n8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQMQFWNZ7mml1SoI04A/EUMEUQ9UaefMsm0GQ4M17uWBHy3O+
	L9WpDjeAcUm4swtUJjI7G4iQn9cpYfP5Hpq5LZcb6edB/e2JodQf8n52vLfPPqRmGsSz8BBMAO4
	=
X-Gm-Gg: ASbGncuhT6aK/LG2Q2MGIlT7CAHCx7/OhvuALQhz4PUjfPU6pm7ezPuMwGZxbptZfis
	QhLd/1YWw8as4R9HBjAmxdl3nNdLiRLiNG9kmOWj6MFBxWIv/scl3ITVzG7XuOtdTtVfM8kP4D3
	COgs7koUMyd/zAQYmpgjx1IhK6woQJ1I/gmnuR1p/yOm3CCGIKvDJknFoV/fIBlXdA6Wk44W0TT
	+ko1aLxtqFhVfxcCZIpnQo3un8J2dVJUf+8SoGSAbwbrtCT6SQROFr3VX6ooT/TH8yrDDC2KwE6
	dVuP87jnLgmyhlasMRLgVOR4hxEfoUxNI2N/ccI1n6Hm8ydbhLPrYF6r9WOk4yW7480lrz7aWv5
	fLsdF0Q==
X-Google-Smtp-Source: AGHT+IGqOnhzpxzDOfpZ4MDlp3/8xKrBlwAoq9TNj+xd1FHD/d338q5V+HLL/ZJTbmo1XoZvRNdRVg==
X-Received: by 2002:a17:902:d50e:b0:220:f449:7419 with SMTP id d9443c01a7336-22c358c7fe6mr52801375ad.7.1744849968699;
        Wed, 16 Apr 2025 17:32:48 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe8ec6sm20786025ad.247.2025.04.16.17.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:48 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Thu, 17 Apr 2025 00:32:28 +0000
Message-ID: <20250417003246.84445-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: "struct gpib_interface"
	Having the word "_struct" in the name of the struct doesn't add any
	information so rename "struct gpib_interface_struct" to
	"struct gpib_interface".

* Patch 2 - Patch 17: Replacing gpib_interface_t with "struct gpib_interface"

* Patch 18: Removing typedef for gpib_interface_t.

v3 fixes a build issue in v2 "staging: gpib: gpibP: struct gpib_interface"

Michael Rubin (18):
  staging: gpib: struct typing for gpib_interface
  staging: gpib: agilent_82350b: gpib_interface
  staging: gpib: agilent_82357a: gpib_interface
  staging: gpib: cb7210: struct gpib_interface
  staging: gpib: cec: struct gpib_interface
  staging: gpib: common: struct gpib_interface
  staging: gpib: fluke: struct gpib_interface
  staging: gpib: fmh: struct gpib_interface
  staging: gpib: gpio: struct gpib_interface
  staging: gpib: hp_82335: struct gpib_interface
  staging: gpib: hp2341: struct gpib_interface
  staging: gpib: gpibP: struct gpib_interface
  staging: gpib: ines: struct gpib_interface
  staging: gpib: lpvo_usb: struct gpib_interface
  staging: gpib: ni_usb: struct gpib_interface
  staging: gpib: pc2: struct gpib_interface
  staging: gpib: tnt4882: struct gpib_interface
  staging: gpib: Removing typedef gpib_interface_t

 .../gpib/agilent_82350b/agilent_82350b.c      |  4 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 18 +++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           |  2 +-
 drivers/staging/gpib/common/gpib_os.c         |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  6 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  8 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpibP.h          |  4 ++--
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.43.0

