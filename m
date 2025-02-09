Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F011DE8A0
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739108490; cv=none; b=CBPCdczFkqzKBPQ4jjolgg204HOeNU5pY++mz5mfV5cAnnSy7uSi7c6PbGAv0vogCR0dmtHHr9ND+zZNgA8Btl71mJsrq6rG9vii2pPuB/mvsETd503CpJrR9AEQq6H9gQZU4Rr48lGBbUHhl2KKisl3jiO3U4dYY03KKsS7Jnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739108490; c=relaxed/simple;
	bh=i8AIajCFyJkuetYPgFIKKvSrw8Z3sFXPUR8DYbCT/Y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hRoqFJk0DrtrYrLFp5/EMYLBZii4WY7RkwIJarXYe2x5FblRgcOLFmX+9p8AWy40u/UVNbMvi1UhRh86Ns/KqJKtE53Y7YugrG+xpzm0FM8ueIp+liCvyeiDw9LDxveWySGf+1u8IGHHIEoqPbQJ0yu2//gqerXPNpxHGYxxz1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R/S2n+M5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/S2n+M5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543e47e93a3so3910883e87.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 05:41:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739108487; x=1739713287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWaltDjOoxflJCFYRxQATxzaFCp3PtCF169disqO0ak=;
        b=R/S2n+M5rAWqxlMnGIJVs0o96zeJtA4PK/Fh15o8+XMiC/bTc5pWbNXY52GntEmMpl
         Wcu4WcB/vCUedV55JchLmvpdbW+OrouFVTAFjppphMqMb6CdBxbEc8Fa7vxorqnbLpHM
         Zm8wSDN0YpJDgxrhs5wxPHcRQlrfZFOavmG7itpUqBcH56ptQGZswfcqR4c5Uki0bJfc
         Uu9PAQ4fJL9s2YBX7i3V4mfuSfC+8uX6Mb3lEdzP2X8CM09NUQFErx/o6Se/SCQouU4i
         KcNO6CgsxENtTfbtVXa+GSANqQ4QwONpduc6ATMOuVFCOoSXY3prItmm7mP5w9oxDvdN
         gV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739108487; x=1739713287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWaltDjOoxflJCFYRxQATxzaFCp3PtCF169disqO0ak=;
        b=TMGDeS6+Vk/MYDJWu36zyNMeaiHYyQxgfgkU/r9bEp4bql8EM+0Z8cjNVk2YdXOyyF
         zlSNBsh36iUwi8O9Eln6cEBiM+DSfQmEii9JQC4g6oMwDTPxyR6OUoesNmnBvllp7ZBR
         x5h0jYA/LNE1PTNtNSVvIhqddTjr/rH9hC/xXYooJlLKRwZDJ67N7jGRUdRKq+SBY54Z
         zmLFGzCkFIDGmvSpiJPR2HNpogylaVPLZM1PVHesHd+f0riNh6SoGc0etd1yCdCW+8ML
         9XRhVaUv/oEKuDo58YqjVJwJ4KA0SRrmUfnD1k3NPMwEHunIFHCgsga1/EckP8+wx0OA
         h0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOVWROWcVvTkQuot0jfDdt1tHOPqR7/U2AbaPuOTxCgPpHp9O+GYqbRvYw14581cJePJxLE9lcQNgQnt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/HXbXPJThZO45U9oPjnKpuoqgd+ozHU02bbZPRnYiAVLwcYX
	t6kKUaCF/It8DU4ht5NX+LFxKSkwgpwaWka3mvu8IMJvyDdkxqXAKPTWkJEuX/M=
X-Gm-Gg: ASbGncsxERY0ZiBcB204RQrlJghQIbomQSeOtmhfaFtmiPNc0RKsh0PVzXhlfCL4a5P
	NCQ06JjMiHxVdunGohcm504hUoFtQwcOcQKpAXIQ0vvjID/mW9OGhsLP3KygnvF+CuDDxYyvrP+
	Tu1gbqgKuvT/W9XVAs4w4Ng7mEnV++UwcrNzqwZTGk3ib5jDbbT/RWHeD+WzOAbPVsK8iDcaHEo
	JOTcYqQ58r1otS6oGD9wRhrEth5KzJ3dU/jBRqLaB/ZbTHosfpJQFUPyLfXU2yzGj03vhL0nLsB
	5/kE5kJkxAfYBjLO+V3lpho=
X-Google-Smtp-Source: AGHT+IH2+ci1FbKoITit5GafLqBixMvMYDNiadDVJBz/IabhQTlCodZTQPXgFXjD9PXiTXWIANayLQ==
X-Received: by 2002:ac2:58e8:0:b0:545:b28:2f94 with SMTP id 2adb3069b0e04-5450b283186mr306347e87.25.1739108486383;
        Sun, 09 Feb 2025 05:41:26 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545069b3f77sm362914e87.63.2025.02.09.05.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 05:41:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 15:41:19 +0200
Subject: [PATCH v2 2/3] drm/display: bridge_connector: add DisplayPort
 subconnector property
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dp-hdmi-audio-v2-2-16db6ebf22ff@linaro.org>
References: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
In-Reply-To: <20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Hermes Wu <Hermes.wu@ite.com.tw>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=i8AIajCFyJkuetYPgFIKKvSrw8Z3sFXPUR8DYbCT/Y8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqLB/ZhixkAWuIJaWneUEqNA+Zs8u9ybu7ho5t
 JJfUcchAv2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6iwfwAKCRCLPIo+Aiko
 1TlaB/9n/dtp6mZmO1VrIP0Hjk2PuuHdQGOc7BsiKtPR3dbEM9Xd6iJMEoMDKg5dhrmn/lfCV9J
 XjlmlgAmRsd/L7GuSfEKTabhgMoma5pTlYizJvCOk0mZJezCN4x2QFBJ8gF48CrzKqOwaH8ii3E
 /n2xBFYLzPQ+AljZjaeJffl64V0QONMpLe92Pz/Xv+yi9TBGZ2E53YNBT3FEi9chbdQiTfk733S
 +WvON9hBsj6WWgWfJCcJlFnX5aZXB9c/iVf8XoYFTnSllnDkG9260wpDC31aSKykYAKB0GWD125
 5KCIOMJVxL+lqo2j4MtObd6aH1xfJwEnASBCkoq74dvveXOp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Create the DisplayPort subconnector property for DP connectors managed
through drm_bridge_connector, removing the need to create it manually by
the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5e031395b801f9a1371dcb4ac09f3da23e4615dd..df9e6b46b40454385f7023310327c5c99d5c6a5a 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -662,6 +662,8 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 		if (ret)
 			return ERR_PTR(ret);
 
+		drm_connector_attach_dp_subconnector_property(connector);
+
 		ret = drm_bridge_connector_hdmi_audio_init(connector, bridge);
 		if (ret)
 			return ERR_PTR(ret);

-- 
2.39.5

