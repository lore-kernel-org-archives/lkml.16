Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD2204092;
	Wed,  5 Feb 2025 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785720; cv=none; b=Q5xUkzdrqLvfFzmq9pUCSartk0udqwgkb4G2gl7NFFC1B/8Ecg1lbO2DuRcgzDvQEXJ9ERm7sADBGmg7qn1PpzFg3AezClS/9bsN1oLpIHvrCt45OZydBGuu0DwP8xca62OMFndXt4xFLzAx3KBQhG+z3MP1RCQMLDMPKTxn5WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785720; c=relaxed/simple;
	bh=7wwUorb8rETePDZ0h8NE7lubYmqErDbIH/6gl86gUhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JxbHlQ1F2SgGZwwjGIZ3qUzggxuo2EMBOIE3WAhrcRH8GTNGjX6uBwQpywE8raC6ljzaa/UR0JUCvegFF48/j3xdMRayjohGEVTjA4j3NOQYammFZMxmfxoiEADj56aJ5dtek8GWvOXA5ULrslnyFtnywyLPE8KrmjRthFJoU24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjOnotj2; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjOnotj2"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f0444b478so3100705ad.0;
        Wed, 05 Feb 2025 12:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738785718; x=1739390518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DGMR8TeLvI6i5DJJvvqSV1H5BnijBdUae/VI+oIoL+Y=;
        b=cjOnotj2BJEHwCECTz0GCW/g+sdAVSdFI3S0W5IkITpWAm+thMLAFXN91sQxNBgRqC
         yWCNGbXgr6Z58I4PV4VsY2UVftJQjemIpVR24en5Uqqdz1FTII1r2iKb//oU30ILg4sm
         dzUrG+/jk33cNEk6RDTo6TxjO/YBCx8PYvZtwHBOM/cD3G1COAe8W0waHI2qQbTdHFW0
         nr0NMWiswHOOnjdgWANV+NahOj3kf1mO/ipHkHuo/YWwFVg0MDW/TFfTGC/UctOOsuS7
         t/SERXgStMysjWGIl7954hb/SDVof0HZYfSDHfYyOFuEBEXh+nmSjijWdQz9dhwHP0W6
         bW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738785718; x=1739390518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DGMR8TeLvI6i5DJJvvqSV1H5BnijBdUae/VI+oIoL+Y=;
        b=vaRFDcFldGMpCCl55DRX6HCuc6T9L9fOMtN5G9TwXTqZyH89nMPGmfP4y1iXxp9KzX
         eweIpOeKhetpGL6nsvlBv1PlvRI3Q59XojZ/VW3Kgfy8jB4wSGfkMFSxtWrRKm6PAlYl
         /q8EViYo8Grhnsc+L9mGjQ06bP0fj6u4CeH4tpDAzdmmoMnfrSK50xRVICCpVhFZ5yL0
         AqZL1W5TsBlpVvRKrBry4tnIV1LIUgiUYE22MZaCM1jI+qzEmeEd155QL3L2D+H1m9An
         mL1s+C7b65xTtvDOHyYNNH38DVMkn9RzJ4ZKfl9P291bj2oc8hLWL8EE7KbHdpeaiT3W
         vHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSSGoaQxocOHQbXsdCXDsNRLrFzad4pMXE7ZFpZLVqrJbtY5cGTfz7o8mBmB3omdiKDpu9O3eQ3DiGTSPE@vger.kernel.org, AJvYcCWrevn9zCgiSNJK6ScSniWFil9eLFIcOrwI6tfsjYmwU2Y10kb7oa59wwhWG/c83WLrPFImn+sex2I=@vger.kernel.org, AJvYcCXrBO6ESpl/hIFAhJk+/72u0UnPO1nMutzTWYYujKy9EJ9tnSsMi/KrUinaRGcLL1g3KDAxOpXlLJNpzCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLZm1ulbMD9HB79iJHu9BuyJkjIB8NIIP+BcY48CwHekuAuoA1
	9ydLCKP0/NC1HLRSmmvdWo6bygsQu8lYmh+z7zHg7bneW7IKL3bo8zl0ZjSsA58=
X-Gm-Gg: ASbGncuBpzUpE4DCrUJx44iOnSSyv456NlLRel9FCh8n3vhOYUwTRsqwf3+by/6mk2x
	vqBKrJw6Mo3g6rtfVK9qdmq0bOCpyL0QRGW8ztOahOgxUXnWxOYVeRgZTaMViTApbHUKAdaWtfQ
	hCCmhw2fVqluIVAZ+II+gzkDSsWX3HVfq//CYg7MaD4IQQ/InQJe8AoSlOE/WFpGiU+cebBQu/A
	MfzwYway78gT++nuZrfeIBUvd9TG+xeeRFO207qPavVQ6T7RYVXQAsjhf0g6Rk9LkCiHmCR4sXy
	3B6RJeZMMYXYORJudI0ayt1U/ofU52gxcF4KSbGGs3loiRPW
X-Google-Smtp-Source: AGHT+IHjUQyw9P2JcwATnPhW9s84WlBsUC6Bvb04L/Wpl8liMC+OaCK6unGgKpIOmka4KGUwmpKiSA==
X-Received: by 2002:a17:903:2301:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21f17e7421dmr65554945ad.27.1738785718442;
        Wed, 05 Feb 2025 12:01:58 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:101d:c4fc:84d7:253:f453:251e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21efee35dd1sm40048545ad.36.2025.02.05.12.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:01:58 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH v2] docs: hwmon: Fix spelling and grammatical issues
Date: Thu,  6 Feb 2025 01:31:34 +0530
Message-Id: <20250205200134.12006-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling and grammatical errors across hwmon driver
documentation files.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
V1 - https://lore.kernel.org/lkml/20250204134806.28218-1-purvayeshi550@gmail.com/
V2 - Removed unwanted changes and split changes per driver, creating a separate patch for hwmon.

 Documentation/hwmon/abituguru-datasheet.rst | 8 ++++----
 Documentation/hwmon/abituguru.rst           | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/abituguru-datasheet.rst b/Documentation/hwmon/abituguru-datasheet.rst
index 0cd61471d..19ba4b4cd 100644
--- a/Documentation/hwmon/abituguru-datasheet.rst
+++ b/Documentation/hwmon/abituguru-datasheet.rst
@@ -6,9 +6,9 @@ First of all, what I know about uGuru is no fact based on any help, hints or
 datasheet from Abit. The data I have got on uGuru have I assembled through
 my weak knowledge in "backwards engineering".
 And just for the record, you may have noticed uGuru isn't a chip developed by
-Abit, as they claim it to be. It's really just an microprocessor (uC) created by
+Abit, as they claim it to be. It's really just a microprocessor (uC) created by
 Winbond (W83L950D). And no, reading the manual for this specific uC or
-mailing  Windbond for help won't give any useful data about uGuru, as it is
+mailing Winbond for help won't give any useful data about uGuru, as it is
 the program inside the uC that is responding to calls.
 
 Olle Sandberg <ollebull@gmail.com>, 2005-05-25
@@ -35,7 +35,7 @@ As far as known the uGuru is always placed at and using the (ISA) I/O-ports
 ports are holding for detection. We will refer to 0xE0 as CMD (command-port)
 and 0xE4 as DATA because Abit refers to them with these names.
 
-If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC an uGuru could be
+If DATA holds 0x00 or 0x08 and CMD holds 0x00 or 0xAC a uGuru could be
 present. We have to check for two different values at data-port, because
 after a reboot uGuru will hold 0x00 here, but if the driver is removed and
 later on attached again data-port will hold 0x08, more about this later.
@@ -46,7 +46,7 @@ have to test CMD for two different values. On these uGuru's DATA will initially
 hold 0x09 and will only hold 0x08 after reading CMD first, so CMD must be read
 first!
 
-To be really sure an uGuru is present a test read of one or more register
+To be really sure a uGuru is present a test read of one or more register
 sets should be done.
 
 
diff --git a/Documentation/hwmon/abituguru.rst b/Documentation/hwmon/abituguru.rst
index cfda60b75..4a5ee16b1 100644
--- a/Documentation/hwmon/abituguru.rst
+++ b/Documentation/hwmon/abituguru.rst
@@ -40,7 +40,7 @@ Supported chips:
 
 .. [2]  There is a separate abituguru3 driver for these motherboards,
 	the abituguru (without the 3 !) driver will not work on these
-	motherboards (and visa versa)!
+	motherboards (and vice versa)!
 
 Authors:
 	- Hans de Goede <j.w.r.degoede@hhs.nl>,
-- 
2.34.1

