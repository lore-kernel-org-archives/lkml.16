Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FAB2877DB
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080795; cv=none; b=b9OUETeMf0QzXRERoq/o4WOnvAFE6n6ysglSyQFn3Jap/lSdn306Wj/SsrbEotmUvAY5znCJKhSvZ+SJn2urDxr3uOPvB99K0mBZm2/iiRW5Iuq/f9RtcPhM6Ru294AstjZb++byNPZu7gWG3DMgNAOynq1eghChuNVzQuahyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080795; c=relaxed/simple;
	bh=Zr0by00gzuLqU/8noVtlHXiuZTGL3C9qQp8UPrlTVhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jTIODMMfOIPZhN62f/D580GIZrj3YqEfkfVOfmaLTOjuS9Z7pn3ji2VcdFJAOQfRfVpy6wBhUdUaElHUL5VlWyhd3rzdT+EdUwlBW5Suqe8DrKOspNdVIcFKiV5oYDlVNifOnofPHQMV676Qa6T1cq3NZ6Ufg55iWxYxmynkCp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VfoyGgc1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VfoyGgc1"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6097d144923so497253a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080792; x=1750685592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=VfoyGgc1ag2hNEN0A+rWuPryMy2nRVOtm0KMNFSApU9jD38nzEfw+mSDyIkBIKsUjm
         Sz12FpO9L8M51ntJ//H3Te1TBps1xtc3U2pgKWcBcTM/Ci0wwsI8iEYbYqv8lQJYlJZz
         kZkB/vOThTJaK4BprrnKADL70eoVgYWqPThx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080792; x=1750685592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feDBvsCRg//C7YMonBlbgFAdDrxVjfxFzxxt26XS52w=;
        b=jcQ9PS3JsRr71JRxNFExRhxQPuzUHlqaSATJ53jHM3aTSruu6CHp73ynWQTIe2NCod
         5nRlxAF5NKEnwSdfSoV170TIUDJqEOiH1Mn3QzaCzu1kxZcY9N2bokGccx7GgJIhOaQ9
         afhJkjPMcELDM6pqSTSPplxRBh1ssW9yddg3+GnSaDmFCxD/uzz1Dh6k6nukLarVIEP5
         LCVuIXipUMZTgxSf4jGpgAG347qBdCVVd4dp9+VLh+nPN6QuTzkcvBSPoE0DwqGO9/gD
         lsY4nE5E6DHytI/OZnWOvtaXZtR8vftDdFuCaeOHlrSPL7RS02X58/XXm9ytuW94WiJV
         8xLQ==
X-Forwarded-Encrypted: i=1; AJvYcCU40SdAuYX5Y6Czx4QOYnFPfJQnTs+JpTuR6+mekJOEDOmeRDaqRY+GXXa6GbLaA0Yfjx68McGpdiKwsTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOYt2yMrW2q9u20+iRx44uQht6uBAvGKP7TNyqp3UX3vYbuNS
	BO5FB8JdqAj4nCBRpKh6Kdoka+5kdfOyXhFY6tdqC7Kk0hxAiHIU8l3pZ5RomdWfMA==
X-Gm-Gg: ASbGncul1taplFsxBkNCLa1gyyg2KB5V6bkDBA3JAyp/v0fMyP7K19TJfUuZW7Iv7lg
	HUrGM4wFVMuIBw8fjqCkTmhWsFP6RquxrZYNZ9pnkQRzL8VxPE3+69RB52pdube9iTetK6UKeew
	5Gkr98eJL7ndsX8cdFW0BdETvlwnj9FLo9HsZA+7f0X0osLb5LGhC+h0naXYq3PyRTa3AOztElj
	M2yfusIsrUj8IAHZpTbOaT7SeC0oLSg76vPu5tZVVKdDCbBm13bKhgXe/XektYLoBDApTYMtVAo
	03yOLjw/H26hsM+taA88eSd9zsoa6lzkGNp/QbHycE7vGSaLxtMLXI92utC3lLj4poY3G6v3OpX
	bzFMSfgD3U1IIsliU2PPudbHFWtz7+Rmf82O//fRPuHz+AKYPLjX4vSUomsuFkb73hoHV
X-Google-Smtp-Source: AGHT+IHjZH5bwhZ1Xd6IbpKopcl9AXhlpygAbGOG0etGiJyiXrgesebapu3fw6k5UbnpFpkYC/Jj0w==
X-Received: by 2002:a05:6402:5113:b0:607:ea4e:251c with SMTP id 4fb4d7f45d1cf-608ce4c0fccmr8482617a12.8.1750080791872;
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:11 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 02/10] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:39 +0000
Message-ID: <20250616133147.1835939-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 7678e3d05fd3..3aed429fde03 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -408,6 +408,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.50.0.rc1.591.g9c95f17f64-goog

