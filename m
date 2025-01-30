Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4E9475
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229702; cv=none; b=BXiKGK1dLrcZ06I+RtAIhsHyky+B9Onad511Zax/sCb3KbuvSN6XEQUgRfbjLzAEPaFK5ukmaJtQTNgAkZa+Q4xAQeJ1200ONkCN1dj7izyHh3IQpX+eNXtqlSgF7Ymyxxi52pX5uS1wk4PzPxKpMmlK0oxV/ahos7ovUeQ8uYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229702; c=relaxed/simple;
	bh=xc4ELH0oFFibv3guQwRbvL5jq5ER+aQUIwoOEf5VieE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oExinLQXsgkitQXY8Oe+80sLGFwYOIPLQYcvT0CamTTGb/c5Uv2TJCNDPOhJxyl+W9MEWKeuCNk198hYBnbNzOkv1W1ogsuMqZM00uD9qyPamAqwsQ3PS+OEZ0lBBttEB+cpUVPk7ApE9AM7bjxOzqyYAvZuZBSA1d/rMM+pcIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b/rwV8AB; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b/rwV8AB"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso10906855e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738229698; x=1738834498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCSZkLmd87J+p3Gt97ywpEqoOmcq5P4BFSZvxAfGIHM=;
        b=b/rwV8ABI5nYr/4fiX5v88Mn0+25O6xUxjxGVipfVcNj3zaSWNycyDSaeScWdq2JGv
         WImdv6dd5Pnt+GPEHrCsJHNPxN/Fb0xAmaZ3rnp+kvHkqNaxqj0a68NF5Wcvc3PxOGw0
         u/6Rm50EUPrbffdMIUM38OsW5+SEt6nkEGxY4Iu4AT4PeRd+6bzrvyaPXxKxhN+XzHl7
         A6Pu6M4Rj93247gzH98ctOXdQlfncjYbqDLyTae8bE0uralKMmjO1B65N/tEWZL/jkVc
         7YoBZTS/1criRf5Kaex7JSDlXzrH7hZDakOUimzUC0hA1ias7BmHcf3RvfbHxzOICVDq
         HKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229698; x=1738834498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCSZkLmd87J+p3Gt97ywpEqoOmcq5P4BFSZvxAfGIHM=;
        b=IeplRzwOhtpMFNvI0eJn8L3heTokHkqX857S2sghc72/obRiwdLh//OlkmSO90xuXP
         U/QL85fpG/qyX12JADL0EtmAN9cSUoyeeER6Dc968tzKSpekoof/IV7YgMU7vr1WzUzc
         d8dHFdCgTYjmP2JTdP9XGKseUVloG7N3cWQBv86lwD2d/PueBFPOfS52A7T/fxSBeTaG
         j6UR5O9MRZutpk07n1heZ9DvPxj4dhfiXMuzo02RozbGBbVpTtdUlVKyEL7HDKTdpSLU
         fuE5Zdf3KC63AMvNacyyN8g9UTA4p/n5mheOjXpr1UrnlypsouTVCfoKsjb5lDD7ht3x
         sPeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsQ2jr1Gt/U4YhQm7HbTHNKWPGQiVal6br37ZsIajG/3YInclj/seN/af3mZrUxf1+7FS5opFX3n8uvqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzetEYSk/Y6bo/YZ242Fn86zz+OGxZgP26U4J85SsjAxSGRxIEt
	nMBEvHjmdqx0PBE2ITRlwxSB7wx9mGHDLt/Mwrro23bxhx08BorlktMdd9a6hH0ALTS/RtRWu5r
	0AH8=
X-Gm-Gg: ASbGncuRH14w70eERY/aqDfQpY/bwNPJQHRs4TBaCWeIdg56BIdt5O/EZFBMjnwYyjf
	m9oyqEYUaVsIGrf8J7gKMMD2NXtQhMh+ftVXQKRT9fAIMsLf+FLp0eQsmygg5F6A2GfUrV1daiX
	2sNvR9a8fuiXaP/ms4B+jsep1Hk5A3NNdQiT80gZSM4q/xf2ULDCgMo33rmvMceysD97DTRCd/L
	8TeeG8TIPKsb2rYusXO0xxRmMfQAMUSxBnY9f0gHN/60EJs9BpXUiQBauMxlmi8JbqEfEHTovd+
	s6+wiqVK7hAU1dM=
X-Google-Smtp-Source: AGHT+IFzBjXuzrIBGDmUC2JKEWFepdBNmuLP1BuRm1yt6BvEzzR/DXv8vtpiKd7cVq/Tc/3hfJbxQA==
X-Received: by 2002:a05:600c:3d0d:b0:434:ff08:202e with SMTP id 5b1f17b1804b1-438e15ee1cemr19665025e9.8.1738229697826;
        Thu, 30 Jan 2025 01:34:57 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc6d:e56b:f84b:f494])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de35csm16705785e9.10.2025.01.30.01.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 01:34:57 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [GIT PULL] gpio fixes for v6.14-rc1
Date: Thu, 30 Jan 2025 10:34:54 +0100
Message-ID: <20250130093454.17264-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linus,

Please pull the following set of GPIO fixes for the upcoming rc1.

Thanks,
Bartosz

The following changes since commit 4abae5b6af811ab2b53aa761bf9ae2139757d594:

  Merge tag 'gpio-updates-for-v6.14-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2025-01-22 08:47:54 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-fixes-for-v6.14-rc1

for you to fetch changes up to f8524ac33cd452aef5384504b3264db6039a455e:

  selftests: gpio: gpio-sim: Fix missing chip disablements (2025-01-23 15:44:48 +0100)

----------------------------------------------------------------
gpio fixes for v6.14-rc1

- update gpio-sim selftests to not fail now that we no longer allow
  rmdir() on configfs entries of active devices
- remove leftover code from gpio-mxc

----------------------------------------------------------------
Ahmad Fatoum (1):
      gpio: mxc: remove dead code after switch to DT-only

Koichiro Den (1):
      selftests: gpio: gpio-sim: Fix missing chip disablements

 drivers/gpio/gpio-mxc.c                  |  3 +--
 tools/testing/selftests/gpio/gpio-sim.sh | 31 +++++++++++++++++++++++++------
 2 files changed, 26 insertions(+), 8 deletions(-)
