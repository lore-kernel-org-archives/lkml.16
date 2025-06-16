Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB212EACF3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080808; cv=none; b=CeWmFMBft3oR022vYIGS143jUfJgeuaLU4RtOFfUftr2w+12teRvYYx1ftmtMzYaaiqXbr7rJ+oA+XnTAmjpGWy+XzJstQ5dItitkI5OOGAV6ienzR9uaY7b4yXja4tVMviraNCMH3Evznj9A5TeK6cjNKKVxmmjBLIZzASYqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080808; c=relaxed/simple;
	bh=cMKsJUotDdosJ5GgRT61ngKqLnwH/Sc2vQwUb/JvwaQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IgSMVOrXLbdEkfsiQND/f348gHi2DWU5WQ3gHhXueFxLynnyABajBVaRVZ+HjDhIEzWbp6rFrhg0QsDqPw2/kTyg1tzZjc4EjukEceTUiyNaSO4YKXhGF8FE5wgzwvM3tOgRgCQm46ieU61zZ+45A+YF+oTBRlyUZYEBXjHrju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P5ba32G5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P5ba32G5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so6437275a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080805; x=1750685605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=P5ba32G54XHUkHVqSLXc8+9deIRH3Ms0dsz+RUhfkLPMi20QlqGv4YQl1SIgT8bAZM
         OwdoTo8TYSeerWtM8Tc67/+Kn9DTfmazu1tcQ6cVi5wwSuWcDZAP55wUqmMh1O1JejYF
         qbYsCUyTFyXQGYzoj6h5JQjsFnjwxi113I3DI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080805; x=1750685605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc1xa9XGYazZdbig9CQp0aaqg5/Q33JTrH3v7YQaNmY=;
        b=Or1Qhr3ncv9xegI/jV+S0QC2mi7niJ5VvWPpfNIvy9IXoIvhbG9v6BxbfloY/yyStT
         3RHFESU41Q5kjadO7uIsEGD36oCt3LhcDWm+/OSVSjhe696CZTFN94QAXiekpDwgBo33
         wmft69qcETIM5oIY38vNLgZw+wh2yl+6nRFCRlalrJhuNA/T1gPgDvQevOFhRmKsAGvt
         1i5t55AHFMBi7o7H6lg1FdIOk08D6Ao92ZMd0mFfOxM76ZEXXANoV8NF1PkOZCaC2SlE
         W9xf6eX2rrAGBkN0kmH2VnscR7hRjOrvbwRwdCPlHwDa4urtSyDLO+zj15MXFm/4fXjm
         /jyw==
X-Forwarded-Encrypted: i=1; AJvYcCWJXIp2R3iElJJ50/MxS7Re2+txkBgf4KRHeX+3lbHPeddInvjWFYaUORL3SDvnEOqEKYiUiKCvjiK3vEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLp/jEfhZNdLKHspJ9D+vHWzW9IjPR37ffl5hz29zRXaFn0EHY
	RepFzDq3jwP8w8pB5jI+/PuxnSm0l8BfDNyuDCtwbNnYutrjHPXd7JL3LIfZX79D6g==
X-Gm-Gg: ASbGncsbVR4kV2QyDMto+HDs24jC473Z6Xa3BR0j0jdpJN+jOApMXctI6Iykuo07vxl
	BJzOZSRpwPs1NHXB6gKjt3T+T3Dsl58fuS1LEjCGr+5gHd1otbR1oGAojFhOzKR382D86uZxYno
	72GkXO2SNcptcxYFNhLQfjjA5H0w6EXLj9DZprjhWC9m5+f/yfUxl2ZL734+2Sl0UyC6Cn0RLZ0
	mPAxKmDK7n2nlI43D5AwIM8F4swbClVJl7vKb/ntEjKYlV7A3+NkhqaIgXVnCViD5/RbSWEr3A1
	vRjwQG66amUIMks9wfupOEYLYR2+ruosXxDsy7fpd/BrtpBEMVua6niZ2Lp3fOtb5PShXJ47sUT
	m5xpO694RzgeVZA50/eNIFkjYdN6QQr0Nhn8V1cgnZFw9zDCm7FeZMrRN5Q==
X-Google-Smtp-Source: AGHT+IHw6+ZqjUiGtijKP7659AHwRHhXUfja1QVHvIcjre79jMfTDQp7kopiYwQiEAC5sFmbVRn9HQ==
X-Received: by 2002:a05:6402:268d:b0:607:2e6b:47b2 with SMTP id 4fb4d7f45d1cf-608d0979e84mr9154566a12.26.1750080805113;
        Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:24 -0700 (PDT)
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
Subject: [PATCH 10/10] platform/chrome: cros_ec_typec: Report USB4 mode entry status via callback
Date: Mon, 16 Jun 2025 13:31:47 +0000
Message-ID: <20250616133147.1835939-11-akuchynski@chromium.org>
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

The Type-C mode selection logic requires feedback on the result of USB4
mode entry attempt. Call the `typec_mode_selection_usb4_complete()`
callback to provide this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index a4f338771094..c5a7f42ffb5a 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -698,6 +698,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 
 	if (port->mux_flags & USB_PD_MUX_USB4_ENABLED) {
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
+		typec_mode_selection_usb4_complete(port->partner, ret);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
 		cros_typec_tbt_status_update(
-- 
2.50.0.rc1.591.g9c95f17f64-goog

