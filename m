Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526C21A427
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746521040; cv=none; b=YVZ4u4NGPC5VUf4EmBG8YQtrfz5wcwSFySakpBPK2bWR8mGFJZpk1oqP5/wTuEORpMazDYo16aPb94QbeLy83yu9NZcb4+gL9yMHYp7otBhXg1K+4o3XvDK0Cnyo4Q58dCfQ1sowP6xAGwMi8yf3+G4/hhnxIYqj4NdF0QdIQ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746521040; c=relaxed/simple;
	bh=GDqdWLvUxQ5sZaZpzIINaEq6cjYVuEXEjYzDVGeYBXQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RA6OdiYonvaTXkPnFK6rYJ6OTKqrZperRQKEfetqBMUUsJCV1gFTE1BuhpmISz+2ZPr0kNRvtQyWaf0xMvxyaL5SBSyadPAlF8bkJmLVRWmRAteZ48bvOY+z6rao2dAhwLxaWP9yLidEZwu54vTH9+3QHcNqfLuXfIaIcftfcEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=DoYJ0LMp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="DoYJ0LMp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224341bbc1dso69605135ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746521038; x=1747125838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=DoYJ0LMph9MMkSy37BTvoBvuhTNDoZPZMWCWFj0B/8yLgye0BnWbpDWhLHLYh9KsKh
         D6XbhpVXm/Mmzrx4eUETKROJXR2F9PCiPmnQnR6FwWogLTws68l+Q36i9hs9+cCByffF
         sb4nFMzrMK0xDSUxLkY2hWHVVaHVYLBoaaZhJkR6cX7T3o+9R19E0G4IL2E+O8gjOPEp
         R85f8wo66ozgROtwN/8ycvJbVnrm4uR7qpiaFezGWojzFaIPDo3Zt2HaDQSnDKuzSiQP
         sPjotTUAJhPuCIKxrgZ16qbdGdM7N7k2w9VHuOOPQGlT4sNG2vmqyYS6Rs6Q+TzB+CIz
         PCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746521038; x=1747125838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GW2TmlIZufkROHQCZxMHYL6iXxykJ3m3xvGeglUqwWM=;
        b=Mk23aNHJkTOX8ZYGEzg0BFd1UEvmy7lKnQkKP49tWr3L5bnJgb2c5reKGDfX5rVsha
         SE9kMJPVw2EqXCltUdirkrkEWy5YGWxjtnB9rZKOy5A+ljcqB6ICwE9yhS7nBE87a6In
         Xf16wJY302jG3icQFBQZDdZYRAvcNsonArqDW7uoFE+DtGlX9KgfqU6mGh7VtHlXyitW
         rFwTAnTJ7K8Q6pFKszbEhe4/vWW0/Fmgiqjb2oA/4Ujvxu2t2YKBATjox2BHG4tWVy33
         8t9VsYGmVbALMRrpkH5vChPL5nQTMp7EyRnXCHpMXdBqYqlJk4YaDRfKsDTqUZTxDIjX
         8a0g==
X-Gm-Message-State: AOJu0YyTLf5cwifgseNLxUkILPMu9f/wToerEyPzCoQ3UQ1Y3Q0kAbbL
	tyNOzTQHOLCB6aICABCkZpMeNxzlJHmtkvohYzr8Rkx7oXcKZOpUzNuWTANJmMsCcpkBmPTlR5i
	PQYg=
X-Gm-Gg: ASbGncvmx7uWdJX4How1bYcBtEqMXqWmUQ9EcoXxKVfi2bZEGlIrxoRh29D3IT8385k
	2epElcILLa1dzUi3wJtk9hrnr9jC8CzdEakkyK62VlJKnT+0Dar5CWNkUgASmDlceQckfR3AvFB
	4fW1WQeAJdYi/LorOK++MLbyDdXCsrwhWJvOgEjah1Pt2a3kIRjy8PjUlSj/m3YB4hFSDkH4OAq
	/0j8f5gQt2Lcwar5HR4pWtR094O87RxOE62jZiaEfmeW9ePeHUgoqV29AxsFSYLTxl8709J5m9I
	+zbbTlTCjT046ME9/BwOLhtSAZ8GA39JAH8iMlrcATyqtiCbq6XxdKJe+fmFT5iJgIQ3uk64GQc
	6YJdbQNzye5iEJFCWS05tPMC/tYVy/QtAb2R/KW5B4mVY0fyD
X-Google-Smtp-Source: AGHT+IFk3mHr2xZ6xTjxZ/wIRc618+Ar69pkMBFg8cgeJ5yWmwYmGkUh27jGm4sfdv0XmyOg5nKHEg==
X-Received: by 2002:a17:902:dacc:b0:22e:17ac:9dd8 with SMTP id d9443c01a7336-22e3633a6b8mr29134445ad.29.1746521038464;
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
Received: from kells-Predator-PTX17-71.lan (211-75-10-161.hinet-ip.hinet.net. [211.75.10.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522f1d7sm68406215ad.222.2025.05.06.01.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:43:58 -0700 (PDT)
From: Kells Ping <kells.ping@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: groeck@chromium.org,
	Kells Ping <kells.ping@quanta.corp-partner.google.com>,
	Benson Leung <bleung@chromium.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] [v2] media: platform: cros-ec: Add Dirks to the match table
Date: Tue,  6 May 2025 16:43:02 +0800
Message-Id: <20250506164224.1.Ica91496a34ad5c3f9330c1a7992f10eea10e471d@changeid>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Dirks device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

---

Changes in v2: update ports
native driver cec is port 0.
bitbang driver cec is port 1.

Signed-off-by: Kells Ping <kells.ping@quanta.corp-partner.google.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..81b4524c69f4 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -298,6 +298,7 @@ struct cec_dmi_match {
 static const char *const port_b_conns[] = { "Port B", NULL };
 static const char *const port_db_conns[] = { "Port D", "Port B", NULL };
 static const char *const port_ba_conns[] = { "Port B", "Port A", NULL };
+static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
@@ -329,6 +330,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Dirks */
+	{ "Google", "Dirks", "0000:00:02.0", port_ab_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.34.1

