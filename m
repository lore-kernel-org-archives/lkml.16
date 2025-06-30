Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8681DFE26
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312114; cv=none; b=klpJVILX/LVKprrRp+FxLZJn++QC5VoW+bDsr1NYJec4JHU4l5C56M24u72B0s4MP4obo3+x5y13n1ddESdsXqiywfFCFjwsRwwHx6RwK3Qxf+mPlK/XZTNPk2U68yyvmNZ5Ekbna6v5iSXUB3X9PeBt9AVzwVov02WhDOtvOdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312114; c=relaxed/simple;
	bh=qXtzQduWyG1nnENxyFhaOaAmJ0Qdb9v1mRc0A8dmTZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M+X6kGSo40eZLN5XmzBO+bxJIUC9lSCbyvL/6w4OwuHE4PuihsMWU7LlMpc3aV0AJpcuttlo+RVrU9R5ixRdUyC5DefYM1H4/kr82bGv2THoZNxH6hPG7dHOrsr/z3VrlaLdRmClMAIMSNYQDKycg01an4jTSHg4VI7X5Vhi0a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ni09lOP9; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ni09lOP9"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so2289801fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751312112; x=1751916912; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=ni09lOP9WqOG72I7EUutge3hqeAKr/ONT9wPjgPqDuFihxEcrVV+ByqoR6m8qgrFnY
         mj6cEzq8EAmtUz5Sf0N8VaS0rbAHAdyJnnHZXS7bkzv4Gt52+9ll3PAiVJrwSdLX4/EU
         uKvcpIE4HT2BKhfKehD9Xr6AaKxWaHwwaukJ+1Y6PeaFY7pbS6SMNM3k6plh1ljRD5/+
         C0DgUXTb2f+229rNesHsfiylKNgKEtbrV4P1/KMeIzSYWioYlMgcMh0WqxdxpDvYlX3F
         iMITN5o3dQPclBAssLJgywiRTAQJt6j9h+JnN/yd/C3XZfU05+xEDEUCb07eKPUuIx7+
         NjUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312112; x=1751916912;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXsvGPzWyN5t9Z1gnvLwhC+mL0nu2lbnJlTwsulGJGU=;
        b=mHQZYTaCLuX1r86DigKChqWCrdd/alAVM/KiwkRerWcyDlOlI5tILw0kQZs1xikh2R
         12ab3LjbSJvNDSlOy5LQKUdbXmSCyW9DHAUItZi1gc/rb/PWW/bZZC/qnlkZgr4c0jD1
         iJoDvWxQtJ9MsBQ9Vmo/A95TcC/q3C66S2Y/I5GAy5AW5IaZi8ftInNq5fYcFZd2Dwec
         elcGhlUGoRN4qkOrNbADkRNkNISzjnAdA+w8w63DiFzBFj7UALTmc+MRy1cBgbx/K1pZ
         3rIKq5eWoFax1TT+BaBxD04bmkm/uCz8/RPTSSZ9t1RiGKYb6fOkXeXYBQmiklHVQw8y
         2K1A==
X-Forwarded-Encrypted: i=1; AJvYcCWUhpJTd8MOGfXIvmX7SkBe8tkjQMPp0Gn3hSHoOVF7cdytBzS10M9IGqTq27hoiss/vVxuUjCFJuPjDM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1HTVC/SF3eMqPR4Q+iMXyQYBinX6PkSbfq1u+SyAEgV9UEDo
	YXr9cZ+wOfK04ZpDO4zhFbnouQzQBgD49ym4O/FaXky6cBf8V3iYHpU9d8Ntu7IHoW88LWMwfe2
	RlsaIDrA=
X-Gm-Gg: ASbGncvV+fxTwoPmcezXN7KtkKr9NZ8oHwYLo+RGhFaY4yayYggSzoSkOy1jNeV1vGj
	xuZBO/x+ZUHYr4gndsTjiJzjGycxKc0vX+Htj6jjrLIFrknV64+4pKIqwYpLWOTpPKhSyM2CCxX
	PY8NCtnNVFH6O7VtP5YbgQ/iqZ19FW2ozm0sqltSdIwolhxwpfv87mQrzXZJI704WLO69AEygmU
	5WllRNLiJy4QKkYS0HouP7ubFuUVqvnYdiYM7JaVmu2ssIJP3kxa+0YsUQLVcNLWaJCUbai5U2H
	GWVv8mmA+jlcvxAn42G4Bc0dcXnzwaqpAyL1Pp4AYn6nf9IC84UOplRkwWEYvEGsXalc
X-Google-Smtp-Source: AGHT+IHBfKAmf1lqnS2UU9I7hvaUGYYEqpqLvNDpx99U9Z8tqVzOU3X1JHzaOOJJorbDRYRHSHPO0A==
X-Received: by 2002:a05:6870:f721:b0:2c3:1651:ca78 with SMTP id 586e51a60fabf-2efed4b5be6mr11398659fac.14.1751312111789;
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:49cc:1768:3819:b67])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd50b1b2fsm2876906fac.32.2025.06.30.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 12:35:11 -0700 (PDT)
Date: Mon, 30 Jun 2025 14:35:09 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: rp1: silence uninitialized variable warning
Message-ID: <748d256a-dc9d-4f85-aaa4-d480b7c4fd22@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This default path could probably can't be reached but Smatch can't
verify it so it complains that "arg" isn't initialized on this path.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I didn't add a Fixes tag because this likely isn't a real bug.  Plus this
code is very new so it doesn't need to be backported anyway.

Also checkpatch complains:

	WARNING: ENOTSUPP is not a SUSV4 error code, prefer EOPNOTSUPP

But I left it that way so it's consistent with the other return in
the function.  Maybe we should change both?

 drivers/pinctrl/pinctrl-rp1.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index d300f28c52cd..f9cc6b28994c 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -1524,6 +1524,8 @@ static int rp1_pinconf_get(struct pinctrl_dev *pctldev, unsigned int offset,
 		case RP1_PAD_DRIVE_12MA:
 			arg = 12;
 			break;
+		default:
+			return -ENOTSUPP;
 		}
 		break;
 	case PIN_CONFIG_BIAS_DISABLE:
-- 
2.47.2

