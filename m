Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B098726B966
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745393444; cv=none; b=SBIeC88va4Do7mbz9SsVi9ERQvm+5J1rMAWC/5ptUiEqny5KC7yd7dwVJ34YAJC0khRNlZwRdE8L1i3Zs3GQdtfp65K6o6bJ5sYh6hB6Yt/YFs2BgMzM0fYrB4rDWo9axJg6MBzfUkq+0cEJxD0XJB7dcxMaBb5fv0g4RX5Q+p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745393444; c=relaxed/simple;
	bh=mk/A8Bh9qTBLy1XZnf66VNgDUYP6yX/XX4i8sSGupyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmOe1a3DRBpfpcltPmwaskXl9W75q109eCdeP7nK0qRStOJMPE/7tVSAU+wPWdNsrSbLIwL4toX2edRyhp4Jd/StMFfglDiJdpSQ7WkEOpdF/+ZMjPCtBRbcAcFp4Vuqz8FLMA1kQ7F/N5qOpu9Bi7m2vU/lPVcn0K9Gc9mQHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fC9DZgmb; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fC9DZgmb"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3913958ebf2so5353012f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745393441; x=1745998241; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+qLQE/G5JgFe5SKAZGwIGMQLlSZgurNA9t7PIViak0=;
        b=fC9DZgmb3wmcC+XBVMStOlPihV1+DwpaZOnfhbaMHkQc1deMxUdTxa54g0gdf054lD
         JXdix3ymf1hCJPbnmkXlXdoS+cnd4vRJk+MYGKbwAWbUnEJPWiaHI4HnkA0vdG3PhJ5A
         773Q11zB69R3/jNBmoVd+Z0RAPhmhzhsoCNW5siNtx7mjSHQJE3qv0ZsRISyz4qII+vp
         te59BnlgZLjwPHFoDMrlVGPh8oBZLCM0YlXLqwIgKch1SMBbOgDNtYML7TXmSR+IueIT
         OX5H8fx4eRXxJXhEUNDw3rsg6/YiQLW+9stwAAS3hnJMsOah2tyZXuD4GAYw+AQSbbZX
         EFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745393441; x=1745998241;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+qLQE/G5JgFe5SKAZGwIGMQLlSZgurNA9t7PIViak0=;
        b=N6qrDRDsI6hUl4jmEmSur0/UJDhtFmQRoeqa3UZZ606SLNXRnLlYIK9mY9X2cf3uTV
         uC+l/R+1USRFGlR0YTkoSnKGkRerttUbGupS/PVKDU7n5qFbNOwLB8be0eua6nmMLuSt
         XibmItDrBqs/g6lyA5v64vB1wTLWzI6dDdVwCNn13SdeWHQP4sFy52J6k5HmC7jHjqE1
         3ov0ub0FAmpPLq8/TUCWeGb4O9lFSAoGsVa40Ifh7EfxN8fRZnMAEZl2mO6o/UexpKbp
         XMBS1xJtQS3U5VTtxrvrTHkOt01+rBIYjy1A4zBiPk1063iapoxCkG9jFgCnPurbjcFj
         ifVw==
X-Forwarded-Encrypted: i=1; AJvYcCVTLvhGivwifEAEN7Jkq6eFD8M2sjgrnf1oMvRqea1YxdOOB7D/hLr1SVxy/S4Wdu/Aq388i4zptWNMDHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1pVbbpR2RtWk8hwUckHfuu+KLSCrkSbj44E4VZzw0M73lQXg
	YSgiiQQgRg4XOqmptst5Z+Xcr+30Dk+0/4pYtPTtNxEz8/DQnKl/3sXICu80NVo=
X-Gm-Gg: ASbGnctPO3ZTqtzIn6KNY3sSNKTIYNpZjuLtF9e/rg1rkJZAOG5Nj3oxqy6FkvWfBQh
	g6SEyQ9dqFVjpzBlXY25lGg1/0tLjN45j3WDUUmg3KkctcH3zut3vkAQrpLhhuavWudAmdi14Ib
	i8DixxFIUaUQBAhNB4WSi3Ss4Vjq0xcTfEJP/uSzQcUbrYCC1cbX8xWU+wH1S0MWq/cE76b8L+W
	SuzJUSJPhIUmS2nrQ/kkqAOXwTl+cIlb4hKIdMyryHMLkXX57Hhs7k21STSrD9ORZw7vTCOKF40
	ARfKLuaxfKGgYG8hQ9AtT0x1uKuQeQh1A7+RYsdiNCi+YBnhnWqPRDkWXWarGfPjww==
X-Google-Smtp-Source: AGHT+IFFmBIBiMdI4ipN/PT3uCrXPyibIHVQMt4aTnQqtk0cM/d0KQT5NIHS2HcuMIYJAnnUAckFvA==
X-Received: by 2002:a05:6000:4287:b0:39c:13fa:3eb with SMTP id ffacd0b85a97d-39efbad2ccfmr14484726f8f.39.1745393440963;
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:67a8:3ed8:e19f:5eaa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa493115sm17761699f8f.78.2025.04.23.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:30:40 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 23 Apr 2025 09:30:11 +0200
Subject: [PATCH 5/6] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix
 vreg_l2j_1p2 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-x1e-vreg-l2j-voltage-v1-5-24b6a2043025@linaro.org>
References: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
In-Reply-To: <20250423-x1e-vreg-l2j-voltage-v1-0-24b6a2043025@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Marc Zyngier <maz@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

In the ACPI DSDT table, PPP_RESOURCE_ID_LDO2_J is configured with 1256000
uV instead of the 1200000 uV we have currently in the device tree. Use the
same for consistency and correctness.

Cc: stable@vger.kernel.org
Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 445d97d67d325853b7dcd2060523e7469ed4e6ea..9fb306456e33a16db37522b3ce9099cfd58c14e2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -513,8 +513,8 @@ vreg_l1j_0p8: ldo1 {
 
 		vreg_l2j_1p2: ldo2 {
 			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
+			regulator-min-microvolt = <1256000>;
+			regulator-max-microvolt = <1256000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 

-- 
2.47.2

