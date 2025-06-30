Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA823ABB1
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294174; cv=none; b=Ej8W8dWTtWLhXMXYWNeYG+z6+WwmvzTUI9yozkpul2uOqxq4PZzhr8dsegCQIE52F50gGcHaz1bATQaPGRtzc4wb2/qDVu5fgbJ2pMPv5DQvJlq00LrS4eV8b37NkFxDGvdEDpEpmwFK8CFZgso0qIZ8mAjGmiiq8Rwv4vPJ2SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294174; c=relaxed/simple;
	bh=ijmcaIoa3T+v1e2tSEIgWQRy27wlu82NxAcWi7tyNVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWFbbBhUrYn5P4S3r3qGPgpmzQ8e6uXhCK82DQ6A/ZUsilz1sqJncDw9SdZ0DQWIRhtB0f3Bid4i7WvS0pVxVoyySA5S50044wO3rNkr43CvqDUyJxlrNLQxXySgpT8dkHOdq6H01xWRAXHYi2wXL07Iue21uG/x1Dl+kHk/YfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KNf3ykGG; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KNf3ykGG"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4f379662cso1843938f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751294171; x=1751898971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yrJ26ovUMBn5wPlmSYUHRqvSgt1eO3iWTStApxaLMIE=;
        b=KNf3ykGGMUGqTEfmMNqWc/Pg+V2g20cXO0Ux0R7q/JiV8yVqNfDLt9XIAQw+zqSfCU
         tU0p1QDmUeJhoPTxlzALjMqJSYlYk5HiuDQau2MHnzRfxIdIeI8ZInEcjS2n6WpHN+Jw
         MSH7k2kpJdNEISWkG/poRVqNZPXoofGgxWiWMViEsR1vGw11StkNga1p3AT1bIi97pG4
         t5Ft2SA8aYdM7G8DRTtk96Hm5/sbiDcbtkvoEFxa+P4NNBzTqcuQugjPWIcqFn+zZd7c
         y4kW262o6qtpSEcNMEks0z3IMd17zVwXQNvp5AkLGAwXT466NccH/d6U9Jccs/iG4szB
         WA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751294171; x=1751898971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrJ26ovUMBn5wPlmSYUHRqvSgt1eO3iWTStApxaLMIE=;
        b=qgV/W7d5pVrUgCE89KNOE3ce7dkOOuELK/yXlBUEsAUJANUGEWf/OH4t6uFrBDSao3
         56U7KSEeCDr2ux4vKdkHaailj/23Thp6Ct+kXT82ERZBJ4zyE6OR0GnAYZpS4G6+f/ty
         FCiyQ1ymWbay5IQS2oBWntPPa6qk60ABjz5Drua8W6jm3pY3Q+zsOoJt8Qg11V3x1A1A
         I2+0w1aVkfgk0f33gnD1dMpJKSbpI5ykXkeAGB5qPgd2yZ+8H1YfBwKg8jhp0hXQAQ7f
         g2TkLqkDClInRs0zz2XPfkmHNrnd83kMZidLb15Hv/YIEty4ppUu8/3Cjgp1pxuiHTl8
         nupw==
X-Forwarded-Encrypted: i=1; AJvYcCWSXmin5oEvrbZjZUR7jEAOr+FvPfNzElJo1N7Dyh2DCCGk5UoCRIeYX2WwUDuF3nJ5SjitGqtsqHgL2PM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvp312hdwj3BsXr4AF+tdl8LlRGBTeGmyy/SSy2n7uw7jcpKr
	/tYEC3T71frd6QNqpXkQo312MULdh2lnpb894GmP5E2qPKf9N0jFQ2W40X3unUGu3hs=
X-Gm-Gg: ASbGncueJlIUL/8RGdJtVhu/MMJ8dhuRSpLfcJIxDtEpNaOCazXktqIr6mBJjKa0IGY
	RRpB9PhxUHP7NZH3Do2vSISouzaZHs5Btv9OHYZ6xGxx/Ubm7nmiCtuk4J22SBP/n8GUTG4ajec
	XgL9Hxp1auAMqVIGoe7hpKhfrsUPzhKawJp0iKcReJkR9yzqTJyZsCTSr4Vh4xdX0bkPQGaVQAb
	WKYwXNvYdDKBeXUhOtYGwphGbwrektKtGei/ILLosr1qzqLGPIrm/FgzP8qMz12yQCaOzTtNVm0
	KwxcrWETFeUCkml9fytBBnDdNEvIY9mm+phTnh3u143Y8e53F+cyDsWj05oyVQ==
X-Google-Smtp-Source: AGHT+IHmF91CXXbMG1elqcOHyJHe0oSVxoNF5JEELyTlvftZNeN1Qp2AI1Kgqc2JrBLSS9DwFOwyMw==
X-Received: by 2002:a05:6000:2d81:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a8f435e16dmr8103859f8f.4.1751294171089;
        Mon, 30 Jun 2025 07:36:11 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4064b1sm139691695e9.29.2025.06.30.07.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:36:10 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] module: Fix minor problems related to MODULE_NAME_LEN
Date: Mon, 30 Jun 2025 16:32:31 +0200
Message-ID: <20250630143535.267745-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a few minor problems related to MODULE_NAME_LEN and
MAX_PARAM_PREFIX_LEN, and clean up their usage.

Petr Pavlu (5):
  module: Prevent silent truncation of module name in delete_module(2)
  module: Remove unnecessary +1 from last_unloaded_module::name size
  module: Restore the moduleparam prefix length check
  tracing: Replace MAX_PARAM_PREFIX_LEN with MODULE_NAME_LEN
  module: Rename MAX_PARAM_PREFIX_LEN to __MODULE_NAME_LEN

 include/linux/module.h      |  2 +-
 include/linux/moduleparam.h | 15 +++++++++------
 kernel/module/main.c        | 12 +++++++-----
 kernel/trace/trace.c        |  2 +-
 4 files changed, 18 insertions(+), 13 deletions(-)


base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
-- 
2.49.0

