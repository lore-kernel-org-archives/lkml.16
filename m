Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B924E00D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686842; cv=none; b=SX5t/IfFqFMDC+r+LjI9v7UXspg0GgX3Gtogoa2xH6QNxjAyDSmYrtdcNAAVikJiz7pJ7ZAMHgHyUorNRu2QLY3Cy5+3DQorStI/XaUMUfJ+LxDO/Rz7VuQ2P09fIv6XMSPjdXq3a10UmOhnQs9LIBSjGtzuRzl3L1Ss+ijD5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686842; c=relaxed/simple;
	bh=bVf8sNtlOPiNtnb/QuJiBwy6O37jwESn47YYpAmQjV0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SG6OoXR32v27nwuDD8ZGbLM7ei/zTpe9HIaorQsH831DuYwE+I1JLl4YsNURoIr8U2Fx9Mw99e+Y2z+fNKXcA3YbtkxKXtNSjtP5VN+TZZVnb7bSw96cTLBaXUKBsQIeEcVKieKUphaXPk7E0u0hG6fLKyead9G8BHsdpRFT+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hp57XCWr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hp57XCWr"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9089105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686838; x=1744291638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtb38M7XPfK2ABPkqM2/N+HipjT3AJdIZ5Gc3Kb76jY=;
        b=hp57XCWr63CGrCvHtVvtukLEhVjR0/RSmvRMGeB8Rz4mmAKc5ZyelyYrfhtoYJLCs1
         55I2gHiJOiZ6f/Xorr3N6nLE88U4zXkdobKP6f/aCraQ6OybOViExfnRTRtSnB4Za/8s
         bWCe4azE23j00wZiYkBNBBw7EewMoWhv1P2Ovr1yVHk1aMWOnKh3/27ifOdLsyBiRrmj
         +9Uljhm3oFCao+PJU04HZx7ve2qY/HytOCTOkDBD/XTrGom3DYZw0L3OFcRVqn4mbg4q
         /qITDKfNPdVLH86ThR8jvd2aS0cutN2Kyb6Ns1LqbcCeJTcuFhjBbSssbaJ14ur4HPZT
         n4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686838; x=1744291638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wtb38M7XPfK2ABPkqM2/N+HipjT3AJdIZ5Gc3Kb76jY=;
        b=FPqWtdNtnKH6LS0OB3dYBaxzZBB2GBbObpdFnNTsS6ifDGkKcAeBUb8RoP0mKuGX7b
         F/EOxm8KhKG2UJq9F4e2tkI+Q+N03zknPljScsIuTLXsomSqrFMkmxT8AyYca03WoyeM
         rjGUWHwrycluTyiEOvVuWjqwmLqpXXAN7VzStOglfLgxhka1HCFskjTX6mUdvR6tMmpZ
         Qf1JmOQ9vjmxdIPoTQU70fiUI0hwi+c2fT0JYEvqKi/fEYZJECw3gAMR0rjzOO1r7BEV
         Y7B3pu98alBZBo3nQoUmeQOcDjhvoEZUmFM29FoPSWZ8wtITcBY9EqcV3z/ngn3YYiAj
         diCA==
X-Forwarded-Encrypted: i=1; AJvYcCXfipZQOKXZGzKHVl23INkEZiAva4VxvJW9q2h/CWiqZT3mb3YB/pO1m2KiS8osLK6eGpuUExkQQkSAEBw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JZbBl3lrq8Ts/2V+Eorfqc+DcMADN+A/cdvKEDtc5dldkw3o
	Vt1VTINokpR1BS9052p/eDylQIbVo4Vhi+uhdOUGMg2++tj5hZBC
X-Gm-Gg: ASbGnctQX7zEkpoClbfyzsF2AiAAfbHtr3XX5h2lICBhNYbXj+XlMc8h9SDUMtTgcVr
	BQSijH9SoBsvu+/QHT4UiviP76awd4V4dzQa/FyZVmh6bUWOxd2OkGjSQfzQUjN2IolHd82DJyz
	88T5Ghgsp0PFrL/PjbmP8KYgYjefcGet8kjdRQzvoCxyT8/fKv5mMz12o7ASNa/UqMvdZ56HC2W
	DI3/gWYzvo6xjgspbttmqSKRHMzIxSQqgZWcB/7lJxCjndXcYLlmgsWMeLrbFlgy3gzuZMZ5P0D
	NDpxLuHAwKZfv8icH7QvQpqEsJITrkSnTFuDR9I8llM=
X-Google-Smtp-Source: AGHT+IEWrpNwkQmaE+F7DT2RwdWz5IQFeLuSWWcZCSMqyoShcSaTPUbro2aUdBJ7nPmipn5q9X16tg==
X-Received: by 2002:a05:600c:35c5:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43ec1397af4mr26286315e9.8.1743686837648;
        Thu, 03 Apr 2025 06:27:17 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1f27a55sm20532075e9.2.2025.04.03.06.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:16 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 1/3] staging: media: Remove duplicate NULL tests on a value in pci
Date: Thu,  3 Apr 2025 14:26:41 +0100
Message-Id: <26990d4a9d4419f9d4155a40595bc213acb671a0.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e176483df301..0abac820299a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -1292,7 +1292,7 @@ static int gmin_get_config_dsm_var(struct device *dev,
 	 * if it founds something different than string, letting it
 	 * to fall back to the old code.
 	 */
-	if (cur && cur->type != ACPI_TYPE_STRING) {
+	if (cur->type != ACPI_TYPE_STRING) {
 		dev_info(dev, "found non-string _DSM entry for '%s'\n", var);
 		ACPI_FREE(obj);
 		return -EINVAL;
-- 
2.34.1

