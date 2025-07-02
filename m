Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBD7280A5B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463730; cv=none; b=DpVrbrfOmQWlXpIavQ7ZYmyoBlTD7CbuYaV7f3D5yJ8zrrAptmmX+Jf1c1QVQpq/Uu5axFndk4lQT/A5ow1HSmeDFDMMXv6cdim0v8hsSwtA7zfSr6bCeXk82DtK3Bwmp2teeeL9dUky8q5VBdMmA4OHuJoiRiHArsgMraetauk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463730; c=relaxed/simple;
	bh=8jJX77fMwFm/xUmCW0r+3HoujzaMaMtZTgzsXj/A7Do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ald3THLIXY+t4EpcRqLir2OJmUztUwsj6kU1xrkbJt/NxlbHlHcWlwxuKk5YOgJ+FWY0j4Nu081lKl5w734uknigYxLCm01xdtKp4gJzK1ZE10ukBPdSkt/y7DeasdShAFddOufwwzpvR6bHj4ecIeycSOGwdMw2f+Axku/VeWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ejB0/v7S; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ejB0/v7S"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45306976410so2720365e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751463726; x=1752068526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxbw21eCjvigwTkxmQkjUBGSZ6O2pE8KYrbWd2bLkaM=;
        b=ejB0/v7S+X6O9bvUs71USS3sU9mcRalgBkEDUcePST1JR5JhhuuIJOP96QILKmL3QK
         LqnIuXwNuvfVzmrehO/JuhRvOprouBgKcj7wIXLweTITmcRJqJLaLMSCErC42Tev1U4R
         9+AE3oVhLek2YzREQPfH65NLyZz3hGjDQdbxNRCsGvexRQg/CWvyYdMFHAIUCX5ZGWXL
         kYFtvx6Wel1Mc2ReoR8eRHVMOnfh4iabJ/m62CruHUhynVfgVXQ/GqR3rCjuXvxzx06y
         H9CjumJIaho6yDUflLazJFD8FO0I5MaX9e/64XnTJpHAvGkB7iy15WGx7Kbgf+dLpuu8
         8u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751463726; x=1752068526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxbw21eCjvigwTkxmQkjUBGSZ6O2pE8KYrbWd2bLkaM=;
        b=k64XxV4ehPIAVbJiim3g2lbO2d264gy1TBbma4k0WZRWf/y0w+5IThm+uRxAyFt9Oz
         +o7q2iEU/wxfJoly+ssLi09MRbcoLDaXXhKlH0ezd62SE5biRrifx7lZPmK92Q+3N71O
         P0yOOOqAy4RfjcOTZ8kGriSoKn1hpPiGNuJ3rz4j/komYcEF+M/TfNOa45mJufPKE/fc
         tTBKIchI5pD+eqN0bpEFw6gKxSIGib7MeDLaTf0U2z/XZ5bMW0RtcmqtbTw/+R8d0Qx5
         N4r4MXo48Onjreej5mZIa6gMsZnZcuetEIjw+peON2hUKMG/2jImMfVjvw0tGF4HKTyE
         1ZRg==
X-Forwarded-Encrypted: i=1; AJvYcCWEQIYd3rphwTC12B2j/sFOTkMro4rjEB9F/kyPAKGofgIezlHKuDg5Mfn1gYViqqV1HYne34g2DgMUVkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFma4IgO2sk4ldaPVzZZzc0ND+FVpCLImn9KPiG/kwr+3GwpDR
	/Vkj6q+PK1pJ+LNK8/jomFpxXsjuYF9gO1mEUS3ZIyv5pVpu0CEsqeY4Z+OIvFEK4d0=
X-Gm-Gg: ASbGncve5744oINRiSNZaDbVXYQOlBPUf/+/RmBc8xwZhi3WqAzU/Io/ZpvckyPvguM
	RTVKFPJCWDTm7GzNNOOFy/Pu0+j5x6HGNVJsAYYE9kusruoOgMt/FjLy+Psbv7/DDIVh30I6p9k
	+wPk4nns9X4XeTiezyKZcYNba9Kbu5fXDB6YLu0F8SKaYyDy3ArBmqF0PWTFgiQ97YvsxuxHTMH
	EihankSGS/Kk1miKL8bub4VinNmkRAf9OC2kzCk2uAgEsRXIIrmnVdI/GMVPzmjkYrkNTZ4vNXJ
	dQM5r3VFdnl7gGFL4N6JKxUL/NlwK1stnLEGqSOOn25G6x2Us/Utpp/DdKZLb/sBsMliO6YLc6M
	=
X-Google-Smtp-Source: AGHT+IGv3cNHYzlxR8z+2wi0VwPFwKxWuKoNTeM+XJGhBONAP5AO5viuU1uDZTJIBZ8gfcjyNdNDvQ==
X-Received: by 2002:a05:600c:c11a:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-454a37325b6mr9016165e9.9.1751463725959;
        Wed, 02 Jul 2025 06:42:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85ab932sm34501915e9.0.2025.07.02.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:42:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH] media: iris: Call correct power off callback in cleanup path
Date: Wed,  2 Jul 2025 15:41:58 +0200
Message-ID: <20250702134158.210966-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=8jJX77fMwFm/xUmCW0r+3HoujzaMaMtZTgzsXj/A7Do=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoZTcmIxPfZouqTdHL40xqaJC9jb8l0tBbdCO9d
 MDDmwLZIWmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGU3JgAKCRDBN2bmhouD
 1380EACX+G21CH2i8gcOLwT48jxrhqbSIa1xmnGJTgN9en0VFj2iquKAvw8Mi14okHzwJ6tbnjS
 xGE/38rchqAyjmN8PApxTcPwOD4hvDBqoQlpou2p4JhygUmN7HINLO7yfaUfd8IQ8V+xe7474zS
 ZbRMvfWtMPkpqqwYLPNeLrYjvmpsDcy7KjhRAsTROAHjK5DQwvuiiKMX8UzhdoHwcGYoXuoryWo
 A5X3/IrQKcHuUljUqOxZZ5utjjY3F9ZAxPvMm/yD0yP1fiTMEgCVt/mvAK1b8g4zIVw0mHmifJ8
 2ciQWA7TJw0F6uG+8q1MX2WvM3sQYm3PMF1z4DnksU4OaL+9lTDk1BBnTvVCglP+Ksl6oAJs3JY
 CEHseCXtyMmvA4aUrw21u8ycY3wMpsdti/F5KXk16lGwAPRAWKUH9SwNdYlPJNSy1Zt0+/2SpHF
 fL97svpN7IWk4jTL79jbGr10ZDVv5fPDQSmSxpGsSW7C37+CE6DAuTPIC0ipvsqwIhz+zc/dWu7
 nIX12Xu9xsID33ZgylyrRKkREbmn2m+IAcubA1TjhV7rcxmE+2uriwI0kThNik+oGYO/LwikPHm
 z3F8KcwvqBKSrrmJlpv8cv2zM3DnbEQGWw574YNFZX+AGgqh4+Mg+JtoZ1bFbbMTPk/B1pSQCSY ELndQ2z1yTLoYyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Driver implements different callbacks for the power off controller
(.power_off_controller):

 - iris_vpu_power_off_controller,
 - iris_vpu33_power_off_controller,

The generic wrapper for handling power off - iris_vpu_power_off() -
calls them via 'iris_platform_data->vpu_ops', so shall the cleanup code
in iris_vpu_power_on().

This makes also sense if looking at caller of iris_vpu_power_on(), which
unwinds also with the wrapper calling respective platfortm code (unwinds
with iris_vpu_power_off()).

Otherwise power off sequence on the newer VPU3.3 in error path is not
complete.

Fixes: c69df5de4ac3 ("media: platform: qcom/iris: add power_off_controller to vpu_ops")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 268e45acaa7c..42a7c53ce48e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -359,7 +359,7 @@ int iris_vpu_power_on(struct iris_core *core)
 	return 0;
 
 err_power_off_ctrl:
-	iris_vpu_power_off_controller(core);
+	core->iris_platform_data->vpu_ops->power_off_controller(core);
 err_unvote_icc:
 	iris_unset_icc_bw(core);
 err:
-- 
2.43.0

