Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC8027F730
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751390940; cv=none; b=PEPwNcVpV/0zKLeHrmNUlVgcRBhGW8ZB/Fug6HEQR29OJ1GiEzAImiyE+Z380855ao1+buqD9I+joG6gH0YV3QlrLx7mljVoWfeGpfGtTmn97osRMimlw29iYc3EpBsQXxNCKolTXIq+Qi5/7D2oxiHwtNKp8f48vkFvvSGfABo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751390940; c=relaxed/simple;
	bh=OLa6CKz4Xs+1wTu88fe33/7qjTbNdeZhjKjIdN9j7Zc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LstarV9Cu4a8pvIS35XpHHE/0BSHzlsgFQvqJuBdb/WxE0pdy8fqVmlQ8Y+Y2EoDcOnfIdp4w+vuY+8re81gfpos+APk9TC54DOaogmE6sVgJ97UXKkqY1sRYxVuzwo7aRKu5PwQmXYLpocUBTvnuALATRsleoLx83NltWOSsn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EwrbRxPH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EwrbRxPH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d7b50815so26579985e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751390936; x=1751995736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pItM3Ix+BDw9/JSngNN7OicgJl0mdYEBGF4MKXl4ApA=;
        b=EwrbRxPHbPIO58M83sno3xDAPMn7Rtjy8LNsVa5UbbnC7osKqvW92dyUR9lhwuKZ1t
         h47JN88wNaBGh9TXp1xp6bLr9YkcqYQsq0ET+AdHmgzfiKpoBBrMJ1k+uF/jXgVMvRwH
         ZiRcHuXa8TMSL38WPrxXEkHKFRQWWvX4kXak4Jm3w4HbASA83TwEmhcs6tEXFWLFOfXE
         NMofBiA+cvRh0OHJSAf4x4fQSY0163BJX5T3tl7tr7hfRTanxXfQS1Vomzh7NhS0YCes
         fWl2TIs3FYkBsFsl/6xP5NiGD8H8S8bgkk9YjieHkxIGDzXXjbTcmztek5ViSesNR1QB
         Q7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751390936; x=1751995736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pItM3Ix+BDw9/JSngNN7OicgJl0mdYEBGF4MKXl4ApA=;
        b=i0xhnzEaJIfdmiUbbaIxoP6jc1tEkbJyxNEKP6F7uILWXT8DK4EU1ZdnN3vjrv1mtF
         xRe9qt6lv01zUocFbtMJrL2GoIHFxCOxbOvF7YIqHBzZvyLILHFIc8URwQel8ni+8Afc
         66CNIM94mXDsGuTakzWhT3xKamckRi9GWAyKLAzdI2oB1RIjSkqlkKAU8H3RN+3QpTuI
         Uq+o6pCN/+uiv19oJQrvw4PG6MWdMJyIH406vNBN28MPUBv1eOxzevfHvwk5onAxKINw
         Nqyn/S5j5V5NTV4+vor9CJbcbd5awQY7erpo2XewNBE9foKVfNyaE2ZI+WPEd7Z/PFPk
         vpng==
X-Forwarded-Encrypted: i=1; AJvYcCXGfcqV+gIFyFA96KnHl7nf1MDfQuSbrenC1dl1rQR9/QKLrh5h/br44QqX845z3OHEt2fKd15qbeyO1Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3dl7HiUCnp1vnJ2wOl0tN9ThLLRM6825x9TczKHWGp3gqonEY
	RpqI1plOWgaK3W5l8hhiq544ZIXtpBCAmmWOcHf+GyDrX2AY1du61WD+orhEiWEnHUY=
X-Gm-Gg: ASbGncu/gkhtYh1g2xB/AWvC7A06xVkSChAmpLqAnPEDYr9muGNzcUQ0LDzPy5qcV2m
	mbCyj5wz5u0WFb7yi57bgDCQn7ksaLzJppK8ekUHQaKgyWmzWPpIQ6jofMZpkxcAPbApYvngk3T
	HN19x4D7jx23PZPiCeRUdKrh9ITCXIALPCX/amtp8SgA9d3jaikr0k8VrkK9nCK8EiDxPyEYrat
	W2U95SfNu5HEYH0eKM0F+v5Ed5o2ssFmXMuOs2vPKbn2z32PLNsRFcY6zAP2D6C7gsfK05MvEto
	QaUQ+boWreOB/SNj9LpnAmACzqcwFBeyDdvQoZ8Y/+V6A2ZwUr5HuI5WWftno9vuzebncpkE2iN
	QFQ==
X-Google-Smtp-Source: AGHT+IFFB5ah+p+k2xTVqwWPdQPiTDaMINmyptlygkjwPQ2y+PhvqXL8U5LQdhDamfglLxAayP5PsQ==
X-Received: by 2002:a05:600c:5307:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-4538fadee1fmr165981895e9.7.1751390935993;
        Tue, 01 Jul 2025 10:28:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:1425:eda1:87ab:f850])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b1b9sm198716175e9.11.2025.07.01.10.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 10:28:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 01 Jul 2025 19:28:34 +0200
Subject: [PATCH 2/6] clk: qcom: videocc-sm8550: Allow building without
 SM8550/SM8560 GCC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-videocc-v1-2-785d393be502@linaro.org>
References: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
In-Reply-To: <20250701-x1e-videocc-v1-0-785d393be502@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

From the build perspective, the videocc-sm8550 driver doesn't depend on
having one of the GCC drivers enabled. It builds just fine without the GCC
driver. In practice, it doesn't make much sense to have it enabled without
the GCC driver, but currently this extra dependency is inconsistent with
most of the other VIDEOCC entries in Kconfig. This can easily cause
confusion when you see the VIDEOCC options for some of the SoCs but not for
all of them.

Let's just drop the depends line to allow building the videocc driver
independent of the GCC selection. Compile testing with randconfig will also
benefit from keeping the dependencies minimal.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 36d6e6e1e7f0162d53f02f39125f4593517e0dba..26752bd79f508612347ce79fd3693359d4dd656d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1391,7 +1391,6 @@ config SM_VIDEOCC_8350
 config SM_VIDEOCC_8550
 	tristate "SM8550 Video Clock Controller"
 	depends on ARM64 || COMPILE_TEST
-	depends on SM_GCC_8550 || SM_GCC_8650
 	select QCOM_GDSC
 	help
 	  Support for the video clock controller on Qualcomm Technologies, Inc.

-- 
2.49.0

