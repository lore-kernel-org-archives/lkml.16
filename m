Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30622A7F8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746175223; cv=none; b=dFsWDjZmlJxRKf0WYjoeClq7wo0BgdDHC75wqMXRBfqNmvgJWGlfOZ85vi+W5Ouzddf1QkYjNYNXEK27m9MCTGjl+57ODZjtk8J3scoWVpPsFPJaaw6KdCXUHV7f8HPGZkf151CIi0bTn/JX7uTxmEr34JjBcHHBPJIcdlOH2u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746175223; c=relaxed/simple;
	bh=4GwIMV2g6kYQJfYrG026JnY99HzIdumMHujNiN5PFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SyeZLDmuw14f244jW1JbD3hwrrBPSqN8fYPyj97h+6yJE+GN1xrPEfbfpM4xBVt3iNyV0gq5FPFRvr2UX/MdGiYehBMxIsZDSWUmVCCy5d3hj25V/g0YXcVbUOHV48D+ov+xxqTQfBvjoSnQRjq1E3TPccaro+5ko1+y9vpBjAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e59c++Xo; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e59c++Xo"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1200394f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746175219; x=1746780019; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=e59c++Xolau9uKv5LXFDx7H/lPOQPzpuTp6hpnqxJpjBP3r/6dkH7pML7nyqFlfn7l
         Jk9/LaWBFyRpGjwX+0y252PGjgU0fHW9O+EAnDdsKcS+/ptq/AcWcAXVvAtbdsIJDb7Y
         vVomeIxKb7xYf/rNXMt1cj7WsGh8vVB7QzHDCZ+ab6x10LRy3eE4MyAFi+5k84PIfmI0
         ONasA/QKpHbEb98VZfvj2oGw0VVNU00wT6jhsF0ZuXm2QBT1NFCNA52O0JedBVmOzIjz
         K0U9JrMW1BJxHD3SeCos7d84A6Rb2oW0ayxKd0j7Y5nZSDVcmFYB0qTbolcKsLYoFZvC
         7sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746175219; x=1746780019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfPxHK34iqz0YjaqRlpXE1B0HpLY07y212OEUguH+Us=;
        b=jYZjMMwlfXPqSGq/VxIsLy21FX/An061RzliweCbzGv81UD9x/2ROezSXJRXwYJBe2
         qXieeD8FRFoDr0ksgObtJGUjMgoxHIi2mSFdu3MCXsBFa2bFHnj5ILs1FUZusEqPVRvC
         jrOog7mR/846wwRUKV0jRH4cynYy3CehOag0fsPgB5GhZlBqrw4mEL5s2TD6iPBf4OPs
         gCo+FwyW9sBAHPsx3yaPFmcHYJleT0XE8eTDmnasVG18v4Guv5a3ftPwaVA0jlIx1hvN
         68c4I0Z/gmeGmIV8EoViLnzTCv/2eVAi2ZiDJXq8LV6jlvluk1TF4bTbllmQL+vqfWte
         P7nw==
X-Forwarded-Encrypted: i=1; AJvYcCWJfTTFZH8W8k2K3R4wTIzNh7CiiHwJkjZieOUMfdRLXElyH249CzH+t3Oes8+pf0oyI7quRMOSJfAbq+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDIzzgccA6SEflbHyD0DzWugOYXpfCt7zB+yUB+w7espr8uhb4
	aPBnmS8VkHs507aQVCyQ8AJiguzLGraty4wjyU5yWHX9h+SNzQ8F0u7/dCP1Gbo=
X-Gm-Gg: ASbGnctKC30LyFjkJCWFkqF5OaYKjIDoHlCFEPvdxGuXQpWHp6legwarbpzu7FE9SzK
	rKFF28liYG+Ld4WszGWBt36o7z7IK46u2Zxe3mXsN0p21/tOt/k9snNKwfYbfI1VgXEWqyiicsl
	kMWp22KDbnCDun/gFtuRT3QChlsqtKIKWMzRkoRfjmROLFboaNYFok15uIVA0jW4kktKiVlDDKk
	6zWXL22Jp7qOpEx0SaD5G3RZO8HgYIt0EDvpZNollza+8sUJfSpublj9L34SVpMXNDbaHIJqp6A
	Gp80C8ltEMne6I/tSudhT3G/zJI2SHmdeCHH0WcCzBFt2g==
X-Google-Smtp-Source: AGHT+IHreIZwzg9TVSTEmBpk2mrA1QNuEKFUEw+ZtdCxQ4dopKGMwZ9mLqKa2D9lb6EAzaR8gqchzg==
X-Received: by 2002:a05:6000:1446:b0:391:2f2f:818 with SMTP id ffacd0b85a97d-3a099ad46a2mr1385443f8f.9.1746175219587;
        Fri, 02 May 2025 01:40:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0f118sm1482225f8f.78.2025.05.02.01.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:40:18 -0700 (PDT)
Date: Fri, 2 May 2025 11:40:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: oxpec: Add a lower bounds check in
 oxp_psy_ext_set_prop()
Message-ID: <aBSE71VKfBlQg_fZ@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "val->intval" variable is an integer which comes from the user.  This
code has an upper bounds check but the lower bounds check was
accidentally omitted.  The write_to_ec() take a u8 value as a parameter
so negative values would be truncated to positive values in the 0-255
range.

Return -EINVAL if the user passes a negative value.

Fixes: 202593d1e86b ("platform/x86: oxpec: Add charge threshold and behaviour to OneXPlayer")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/oxpec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 4b48f4571b09..de70ca7e8493 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -582,7 +582,7 @@ static int oxp_psy_ext_set_prop(struct power_supply *psy,
 
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
-		if (val->intval > 100)
+		if (val->intval < 0 || val->intval > 100)
 			return -EINVAL;
 		return write_to_ec(OXP_X1_CHARGE_LIMIT_REG, val->intval);
 	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
-- 
2.47.2

