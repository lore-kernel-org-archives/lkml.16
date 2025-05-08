Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFFC22F3B1
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692546; cv=none; b=di6njH4K7c00fouF5yyFEc/iBBmyiyliF8EcCiEs+CzMNQtzKYFgQxwaM5rOW7bE4vHY8FwChzSp0NihR9TTDa5SuynU0tzOGhswgcusvRkdgn6bmkqntvrwqPgDLMav0armbRrLZs1ipXZM39g+YyJoYu7FnZs0E3iEx16TYH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692546; c=relaxed/simple;
	bh=SbW5avzHaWU49AR278z0p1QzFkuzF3Da3gfRm2cmijA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oJqe5YD8tSd/KirP9m2Vv7UcbFmZezFH2XEHzcL4aE8IrQujJrJJ90Si4yX+FnVwB8D0jhpAwzaZVNpR0iAob+dOg/5BseJpDEIONCduh1sT1A7IT0qoEjzMhrtxrIw13ZE7yO0P3AmO+20SjKOF0RiXDSyIvOgI4e4JJpcoVAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=GjRV9G05; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="GjRV9G05"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-739be717eddso620410b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746692543; x=1747297343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=GjRV9G05LjCNj8YPmPBklF3N6oxzfcmN9v+Wo3XtzvHFJwyWMRHkx2AjLZg1gT3hV3
         b7hvPePNwIrAFZLL+t+eR5nXOgo73bo+I1Im5RyYgrYjuCR5rfgcl4ztrn2LgzDf0gRl
         IdLDU6IzgG0SrsGPAB5UmyO6/XqUU64geC+zHqwk5kqbqaCTE86XnD2l83LOq0m+4g0d
         /ZAWp5eDLkTaI2pYDfdISPKBdMbti6YubwJJoqh9lsxKDkVzjzNfg3uiuaT4o33IzE3l
         /Jupd7LoqUrsX8C55nlXBDc2y+mGpxAC9YjMoFlqf4oklqKqgfKKqZvwzpOLm8eKEWTH
         F02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746692543; x=1747297343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkgycOKsn9rzANw2ASc26EEMyuH1deYSroQ2oKDRKiQ=;
        b=Wn6Rdiki6gUEFEik0ecCHLoRk5VTopApVRqKX2xUp7/kSljsZJfqFQ3ZKeBublYaol
         VhOk+zaxQpN30bWYUqxKH7XBHR2AV4ThU3IoV93+ZbRg3ShucoH7FlVTQvFq5z9VfFmo
         /2l/kKZhL/+x0FIJ246wWrt2EIuHWDOEzTHZdEvxZyG86s9zdEEF513sthGe0DGRGZqD
         hTrVkXTwJ3lPww4Hz7hwST7TiYRXnNH2ljb13bqFpQfvh91DDGKiBuEs/MveKZgNPEcW
         vTMPStJTnWc2QDlu2fnHsQyo18b6m8Fo3dwAjHZoq7aone7DeenABo3icBREy/rVjW7p
         iJDg==
X-Gm-Message-State: AOJu0YyomB47WACOYGbwcE27Vkkx7CxhE7QNy4B2PK0Rp8tNNF2Fff+P
	kf0XB3hwX2I2DWAaUzjL9ZZz1+H13NKqiXaFWTM85ew1LAcIql7d0PiZ0IcJLztkPjirlmaDlSh
	b
X-Gm-Gg: ASbGncvsRATNS3mouFUi7NeEoZqbeaCkg4WTCF9tWrSiRo3+M8GwK6Ed3NVgCDqk4QJ
	4Mq26NHtDcrN/Nk54Zi6FajkqRgyhV0LyllkUW4MVLAJyyTTv5w0VO50W8VCW7fAPnUi04mhtj7
	KFBanrzjSHhkO2qSEddYTpT+H050/YCJgTocOIwcpZSGhQa9k/9FLc0N9xo/N57jaZpqOWnxMiY
	TuRGlS2CthOKkFXzjqwoMHLsmGL9zaK4znqE8hhaiVOn9SpPj0g3HhRNZxYkvSeOabB4wDfcLiX
	cO1mYkjmSCVELCY2fI5/4PUsF9LBmMRqLAk7T6cg3gyOPE87+6kofRmFO6r7fvBxoRsDQvf9XEm
	BdWJ3RfyPLEt81braQT/Kb80xBk95wlwL64+s+X8p2STL8aAj/xRScf1ZaCs=
X-Google-Smtp-Source: AGHT+IHh6/dRcAY4q4e72XSHH6l8kN5iTSUPT9veRBZSGN5lb5me12RT1bksMwi1d5S3wjdA19MU2A==
X-Received: by 2002:a05:6a21:3946:b0:1f5:56fe:b437 with SMTP id adf61e73a8af0-2148d21d093mr11797135637.32.1746692543562;
        Thu, 08 May 2025 01:22:23 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fb3c3d6bcsm10879881a12.61.2025.05.08.01.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:22:22 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kellsping@gmail.com>,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: platform: cros-ec: Add Dirks to the match table
Date: Thu,  8 May 2025 16:19:03 +0800
Message-Id: <20250508081904.632442-1-kells.ping@quanta.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kells Ping <kellsping@gmail.com>

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

Signed-off-by: Kells Ping <kellsping@gmail.com>
Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..a8d31c3126f8 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_db_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

