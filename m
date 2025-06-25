Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF5F2DAFC2
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865011; cv=none; b=VhioNOEJNZPRChZIiJI4TJN/VD5gOS+NEIC1OCaPXX53fkg17olhmYDRaIo2yQIvUamcfeSMa02vnJem4rZPI72L+/vm14I1juOFgj/mq1B2m/zDO2+qVDa4K1KfMiClorV3F2whwX5FHx2ueo3+mMdHZOG7S3Alnd4nV/iVpck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865011; c=relaxed/simple;
	bh=5XtjxA/sFkLGx0MrFCZy1IwBNpCsiboRk5u0NA3i6Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIXfrA0FptgJkouXl49MhImj0XkmsTmHRyj28BMDBI6y216UV6e6/EUi4kZZTs501Qv40gyf4aduQOdl4HIOUv+5/nK+vjMk/VsrDF6EzyyXE4YwqwlbqMnwC9qdIXFJNsJrdkZmBqEr5xjlLHMrYNpfgc2YXgdKabEWMbPTe6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=djEyL1xf; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="djEyL1xf"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so17979fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865008; x=1751469808; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URcIX0mY/nhVqSMfP55/sPY1bEZRgky9TRvamUcBG98=;
        b=djEyL1xfKYOING1WtmLgBb2CQjgtw+l0VS+mQT9NGVtVrWq7fVe5q8QhJilw/lHjhy
         Rv9+UVrP1j0q+IK7Pp0wE5REhl9RwHWfp+piIoMFHJxzbs/jhWU7EVFj4lJC48YtzO/i
         06ZdqCnKE9WnzaIlbF6B4wpkUd00+yQHf7h8UedakoW/R3dXiuNqKQblcvviEltAg24y
         wEM4932hr72dNSo+3IySjx8yiRohk295du38bGvaPc3+EuGdMaBsBUnPd0kMrnNhzUDK
         UP5RtZMziWuSVdyNkRRrUOmQvE13xs4P60eeNJRRRAmYIIcLA8+CUZLbpcN48ECZODIS
         XE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865008; x=1751469808;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URcIX0mY/nhVqSMfP55/sPY1bEZRgky9TRvamUcBG98=;
        b=e8wL5J1cQU3JFHgap5SMCPdIOgIJsyfaNE/f5TVWkS6pN3eJvVlxeyp10/p/ha91tt
         oHCLC/8c20dwRdZSuvN8WYITvji19RuE3J8WqyOIoPLB2tLC3/nji7b187KPeMPKHaZg
         b+zp1Pzwtn22G6rhUAA2f1e+IkRPSj3g0uFFA+pTn0n0zrM/S0rjCepjQvvmi1+ukho+
         m/fJ9OfGBoRizLQ10pvHzS51kMyj4sFMxW+tKcwGYuzwirSN0h3JURkEXfVhChr7Tmg1
         LEAn7sIltBkjt23ZIuohV8H1ja25/lDEZpJebkdvhwMmkkenENIyT+FYRqR3xmLKty7g
         fCdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmNMF88UGSTeflxve8zVaJwDR8uwnSau/qgANt/SZmMwfMCf4czH35spQUOfqnOfpksKPa8W65Y8hmovY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeHcRjsr4lZJYb+mhsbkEFo6adnnu4edcgDETitCbDXlo5Q9G1
	fjw/qOhOvE2TzstqHYCAP2ML/TZmGAG9UlN8rFR5bkRiEGHgCDA/1z42Bkqig02loI4=
X-Gm-Gg: ASbGnctHCTT7n+/om8Y5a40mzSugMp7PwpE3QsGlldD3j6vO6hUQBZS0Ppuo7egSruP
	G+ql4+5Y7XHVb0pkxUDH1DSxt50zFz/RtLFrE5zSxEpAEvwNHnIgG6O6+d2LA5n1XrMOAJSUGiI
	IqsOTVkqpMQKEwRmaiiDM1R4RssXd0sT6xZr5OWJzPPtiRpuqxgBjMNXw3vZ9OzDe5Audc/k2xT
	rf+pGq9K2TJZUcMUz3e1MLBUBSufhPOPngQ8rAZBUsYnVH0RhZUAGdPmMqzB8SEH5iTDbW1UMY/
	c66jtJBSWLuVKjhCcPRt1VUbKhPMFm/0JX433vg72lyQKNH/Q45vzwejC3vIcDaQsyYK2Q==
X-Google-Smtp-Source: AGHT+IE78ssGm4pxFnUIN1SeZUSbBSiN255lPYOdn0sAye7rxVXzd1Y/pn+8ekMWbb/p+HqcMVQI8A==
X-Received: by 2002:a05:6870:b015:b0:2c7:6150:fff7 with SMTP id 586e51a60fabf-2efb2459f79mr2603151fac.35.1750865008000;
        Wed, 25 Jun 2025 08:23:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2eead8b1a05sm2570977fac.38.2025.06.25.08.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:23:27 -0700 (PDT)
Date: Wed, 25 Jun 2025 10:23:26 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zaid Alali <zaidal@os.amperecomputing.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>, Ira Weiny <ira.weiny@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ACPI: APEI: EINJ: prevent memory corruption in
 error_type_set()
Message-ID: <4d800ffb-fb1a-464d-adcc-2802187cfa9a@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "einj_buf" buffer is 32 chars.  Verify that "count" is not too large
for that.  Also leave the last character as a NUL terminator to ensure
the string is properly terminated.

Fixes: 0c6176e1e186 ("ACPI: APEI: EINJ: Enable the discovery of EINJv2 capabilities")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/acpi/apei/einj-core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index d6d7e36e3647..e77c0d4b4ee5 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -826,8 +826,11 @@ static ssize_t error_type_set(struct file *file, const char __user *buf,
 	int rc;
 	u64 val;
 
+	if (count > sizeof(einj_buf))
+		return -EINVAL;
+
 	memset(einj_buf, 0, sizeof(einj_buf));
-	if (copy_from_user(einj_buf, buf, count))
+	if (copy_from_user(einj_buf, buf, min(count, sizeof((einj_buf) - 1))))
 		return -EFAULT;
 
 	if (strncmp(einj_buf, "V2_", 3) == 0) {
-- 
2.47.2

