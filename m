Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE123645D
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879027; cv=none; b=m+Q/pukyyS2gYvEl4R6AeA7Wbfl4P5c7SCrACu6J1iTmlaA0Fg3iPqN4f0ns48jNFrFcKhGTv+D7Jrj39UrpBFfWC3NFJi+WbXDPbcG+6olko+0gVl838Y1/ohH9hMfhpD0SH/vZln5yZO2pstcAA+wXg6M54NZVbeLH2z1WG5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879027; c=relaxed/simple;
	bh=fCGps71ExS3xEFEZS96sdmBBtj4gTo2oNtyxnmOZAHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V7wX01gzwFFmUEHfvN8D9EMvQsjlE2LSfoT3B8xiDFKUWqgCN32RhQgJ7QCexRwlnm6Vs0zVvcstNGjTu0jfocr7DKo2J29ldlt9kV2/H3PZkqDG809t5/8vHb02JMgTsMzkbSSLJI3MALcQoA6bmJJHoNNeldznxPK+fnvDA4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oB9siOYW; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oB9siOYW"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5fa2a2bdde9so415681eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 13:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738879022; x=1739483822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3toZZ5wmMiBdVoGCpQ70K1bSeRr7FsLK1fQOBhlIeM=;
        b=oB9siOYWb+Zq1WCC0HAQlGFLyrRzjdB4reej0rVp0iggtMpx7PUK4aKwD2mEgyRia3
         YJ7TOaphLscnX6hhG72u6Zyib47YLrswml43/Vi9lU9xaAFnanGxAGKsI6Oz/Ru9cAUr
         GGu46Iw4ymxlxmxwJuseNK3qADaFaoqxxX30w+YlOVdnBCTbRl94JSxe43TRJyh6x639
         CuhfvRrmXFVzRtlaHo8APWO0L8bkTNXgt393xR4r4hsnTBezs4TMG2kvthYtv5kRzEg6
         vAi0g9dOEgwqkvbv3DqioNXylCPmf+YUFyYodEUtjTIkMCtr2GSkrfmr2qhOP6srofou
         5mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879022; x=1739483822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3toZZ5wmMiBdVoGCpQ70K1bSeRr7FsLK1fQOBhlIeM=;
        b=gXr1L6EPGPSCU3QUpL5pQcob5grLJYYNFyWGeLs8btT4e02v8AIK+TvztE3xu2AB9t
         fqXDPuJCKQqrKPAU6jyawlcxE+81Hltg7LG3UGlQ1I4qC184POmLXiTgcUVbeLOk0RY1
         Vd7+J84oMsbC221I1h8XVGFLKTN1GJ8j3IDXjkX4dtv/1rvfzdcAE0ZgSAHx1yy0KfW8
         nSfj3cOtLEbF3T8RGFDPqiU1+xUQH3qZQ8ZBb670W73+kwy56B/lHhbGLdDGHIC11fse
         sqs2NEoOukJ6k7MuV9vZousDP/omDFcTk0wAO+gbz0grHvJ4n+EgFkhZVxzOA2Sy3BjW
         H/cw==
X-Forwarded-Encrypted: i=1; AJvYcCUecPjiiK5I7/8yH235DQ/jJXPRUxAIV83g0EGyIqMz1Qdy57F/LzZU3be2/dhIPmfkAUcWU1XiQ7bIwBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5loWbxHlzMyaXYDZ4K2ZqskhSLdWDlH8E1K58kGE3QdQN0HzG
	7LzlLLPYaIuLkSAf3+EBl1iMNo/hVcEYTZ2+NQkq0zmQ0c/9sH18PGYrY7GGMPc8eHIZ8Y+iTko
	P
X-Gm-Gg: ASbGncuB8kjzm2GPORwAxytgV9E5qDvoscFuvg9U+y9F/BNXXL7fHSb1jxKVCfqSPR4
	HdjU4hnTP8hguCkKfO13Hl0O/G5DEqUi5c6sBJh65W1F5mlUVMHXdGx26mzJAyRI97RvNyuLOWM
	Yd1f2hzBP4qWOKADvHNitCq15OvLXt2xdtymOmRRfCdu5IPWLtFnnHxiMY6vkIUFTQB5so0k8vN
	9E7eJkY+A3B9ao/KLSo62BBVfxHk76xWYRBoSizVVq6efjP9bPVT4kID7od85glha1BpCsQ10Nd
	c+APEqTd+9dEr45fqC7fQ2Cd9YzRjb5zbFtSO4bfVBs53YSWcBCqpEaIQEc=
X-Google-Smtp-Source: AGHT+IFnJdQ/ccw+KIuBLF0Fbom1GPawpx01R24tEd9AGsf5ipJlFwPqCo2QQQmGrn2+4mAWrKyuWA==
X-Received: by 2002:a4a:bb07:0:b0:5fc:5f46:2893 with SMTP id 006d021491bc7-5fc5f4635f2mr300810eaf.2.1738879022445;
        Thu, 06 Feb 2025 13:57:02 -0800 (PST)
Received: from freyr.lechnology.com (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544ec855sm452948eaf.19.2025.02.06.13.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:57:01 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] spi: axi-spi-engine: fix missing bitfield include
Date: Thu,  6 Feb 2025 15:55:13 -0600
Message-ID: <20250206215513.2842270-1-dlechner@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix missing linux/bitfield.h include needed for FIELD_GET macro.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502031224.wvHipe06-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202502031250.64gElGDs-lkp@intel.com/
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

Hi Mark,

I know you prefer patches like this to fix something in a patch that has
already been applied, but it doesn't look like you actually picked up the
offending commit[1] yet in your main tree, so I don't have a commit hash
for a proper Fixes: tag.

Do you want a fix like this or should I send a v8 with the fix squashed?

[1]: https://lore.kernel.org/linux-spi/20250113-dlech-mainline-spi-engine-offload-2-v7-7-e0860c81caae@baylibre.com/
---
 drivers/spi/spi-axi-spi-engine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-axi-spi-engine.c b/drivers/spi/spi-axi-spi-engine.c
index dd6077d3ff7b..da9840957778 100644
--- a/drivers/spi/spi-axi-spi-engine.c
+++ b/drivers/spi/spi-axi-spi-engine.c
@@ -6,6 +6,7 @@
  *  Author: Lars-Peter Clausen <lars@metafoo.de>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
-- 
2.43.0

