Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECDB295DBE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885436; cv=none; b=GajTErOCzDybPquLGuFXfM4Mn0dm8hshr3SHJ19U0LRXhTUL7RUnJU5xL3y4vM4z8ZTkCkz8oUKXdtJMf9IL/C1SNrXyNa+KMYRMVIpHyDw4qfko/OTKXjC6TGzOfZApsV0v3xVv6m96hTNCqO2rXKzkBjmTkqRwQfMAde2Oa34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885436; c=relaxed/simple;
	bh=0DjKBEEYRbVy4AQeYlNr37VxbcA1nPmfYINGRxp0EWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQbQa/8Lq/rVXSixEcrfsqQdwQBCsvOEDgO31SKyyY8H13NDiEsZmSuysikcUmK5JGdwJGIBV2XarpMcCjUvxm/H/6o/vkWOwVrWcf/NENMjabyoY9UO54JCsohCb6BNuJYa775xb1YdRqfEWVl+sIkcwvWzpcHfdnluo8voTEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qo0V5/uK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qo0V5/uK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c5b7cae8bso4634675a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885433; x=1752490233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M0Uhf9cokxwTL0c2ydgWGzKYaoyMWc7a0121SK5qMwA=;
        b=Qo0V5/uKxwkrRwOdKq7OurPUP3WxYLYRA9fAsn0HL2g0/qCLXYS/+8cq+C1Eiqvr89
         Lcme7YYj/zq2yiy0Sq7OlqDcbvd5HpaaDGXC5obaPPXw6AUBOm73Z2A5GkQvNxxfvyzi
         Q7+2O6AZARp8ybodC3yAg5pH7v1EV2NKjRSqCEWCeSsOXPe+uNX9HHwRI8lv84hFGL4+
         eeI9p4/SRYJlooFV9Cr3oZeYZpArQhvBhyKZZQA3B1q6LYhoPPccxznVQ/MGoect6EAJ
         it7eXo5DBofBc3RYH9dNX9PpW/NOxbSFQJxkYbZmYC9GgAS0UzYRgeerFAUERLDVm26Z
         XfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885433; x=1752490233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0Uhf9cokxwTL0c2ydgWGzKYaoyMWc7a0121SK5qMwA=;
        b=FH/AjswOsy/XtodfUIHBG+E5qjaS25FC+hbOg/HFPJunNMvrDZ4EQCEUtcScU6PUo4
         1XOvurlfwO8sYb74lutvUiJDabfFfjOFZZ3S7JIkq7pT13X8G0hw8mzNl4ByNM2uF2wj
         gVicOvgRqyFWr5Sme+7sA8Kusas0fydMJIHWP2qJutZ7VLZiUuo2YSqYvUAel3Tf+8nI
         YaKx94RuCaSlsxT2aLNo/X6Z1vnYd4RZlbdhBrveGIy/XmGPdWYxQVcsRoUMRM9S19QC
         md7vim1DNV3DIR0DS4uxGkAiY2DiH4bt7fv5QwD+SRrU1wTmNQ7uWQ9J40k8iYuKi5eY
         rX1A==
X-Forwarded-Encrypted: i=1; AJvYcCVlXWFntaJpJ2ozG/AYDlLbjQDN5KClnzAjlXtN043veFcxeBkdEAJkIKmL5xwVUf8740nKyI2AYTjiWSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdNKxNOKxQ4tOXRKRNZfHjxOcg+ZHecIi9Iu9n4YB6UpLYxDwP
	m5vDbinuPXCf+FOfCdzeDvYnYjeZ1/HyCZYYu1mKbRB94+v+NR6E2ZysuP49R5XmySU=
X-Gm-Gg: ASbGncv0jINZWDlpQDQlEYPOJeOsCeMH21wV1y9qmH80QKiWz21KnFiiPkuXP+ZzSVr
	wflt6zLHY8qszgnBox/F1ytK5zWS3/OZTL7Xa3cQVC8H2b4bv/gDO5M1/SsHr/1gk3r3FRW5MjQ
	eQ2fIwHF74Tle7wTH5Zp88D2y1Fem8H3+EkoPn9eoIz5HRbucTXjcWkrNL3Iv9ujnm57CLyCMP6
	8C/JG1wi7J+Cu/S0xLxSSMOCU+8Yyu0NYexu7Lo5Zt0HRuSuDpN02KPxDTHw5/1nPOSo554+qYQ
	VdjbMhKsfdgDWE7UsiuzsUXxwrVCCnFDNQkdOSYEINSaBxezfIYojQLTetf0hdckvmVcejH1swQ
	ESjozSIJpwwCBR6oOcx7J3v7kVWkjSvJf1pm2w6BBZK9xBw==
X-Google-Smtp-Source: AGHT+IEnDjsO6opm22lwjQu/Rj7KamWYfLbMulTjzO/UV9wnDWne15HveaE9d9M6MYNJffXab6eCtg==
X-Received: by 2002:a17:906:6a0a:b0:ad5:a121:6ebc with SMTP id a640c23a62f3a-ae3fb98bdcbmr1157384666b.0.1751885432641;
        Mon, 07 Jul 2025 03:50:32 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 07 Jul 2025 11:50:29 +0100
Subject: [PATCH 3/3] usb: typec: tcpm/tcpci_maxim: enable
 PROBE_PREFER_ASYNCHRONOUS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-max77759-irq-wake-v1-3-d367f633e4bc@linaro.org>
References: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
In-Reply-To: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This driver works fine with asynchronous probe.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index 43b0ec2d12ba6d4c1cfccbfd355af3e5d9ce1385..19f63865079658fb2a446dc390262d141b940e9a 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -572,6 +572,7 @@ MODULE_DEVICE_TABLE(of, max_tcpci_of_match);
 static struct i2c_driver max_tcpci_i2c_driver = {
 	.driver = {
 		.name = "maxtcpc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 		.of_match_table = max_tcpci_of_match,
 		.pm = &max_tcpci_pm_ops,
 	},

-- 
2.50.0.727.gbf7dc18ff4-goog

