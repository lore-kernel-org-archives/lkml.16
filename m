Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB97F28EC
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404100; cv=none; b=gorDcILL+rEgT1IU9KlS54Zr2et2VQA9k322nSm7hvjtIz2fUDtgwFgffKZ7Om1/qnkBwXl6z88HH1y3icvN44dWlrRUvfA0ursCGCLk6yL84SMhtrcvrEQP8pn4eaTQu3op259m7q2roDFUTb3GT1kSazndTIBe6Ay7tcfQUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404100; c=relaxed/simple;
	bh=7Pino99IS4gxmEVNtT1+Fg674jvsTFh8QsSqJonlwOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IHNyKuGNj4hHYUHw3VvSAhasGGxZRCtS/8PAAG4drTU93wiREtT6PH2ZFpdq4thqQU81QrFZ3m0LPETGS18/uwH3GC3aYIt++HVzA47mO1UgJ+44/JQQdXMa8Hr3nFCGo23Ptrpze0XOIq2GUJCvzwtmRnUo4xc1JZMcbLlVksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY9I134T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY9I134T"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NNP1N009423
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l90h0HGpLRpkB0qNvwdUHZ
	hYMuIvBrbptPLn9QIs7xg=; b=jY9I134TbSePusW2ZUmNzl90f6cO3f74Ixjv7u
	yI8bgMxgl8HLcl+s5jrsf9P7q0Rab5hFw2FFPoNeVXpTCFeb8dR5E5U0yhJsjIyo
	qYG/mrCSNLGTZxnmuoYIgmE60zUR9jQnxpiCUV9Mq6qmp212qr0TcHPoKE03rpvk
	Y15L65dvlVGWfAZZxo6merFAtgYPrrvPWM/uCIyDIz6pj0QuLQHWb/UU/oA25F92
	vt14aSTRPPFP434gsloK2g4wsGhdTcqLytE/Jj/mJ/Nu+b2uVv6gzQMi32CLwkvw
	xCrvJS0TZFFay7A7v5yrhJJ6Egdc/GaRAiK+8Wo3ekXC1J4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbc5an3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:14:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so888291585a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404096; x=1747008896;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l90h0HGpLRpkB0qNvwdUHZhYMuIvBrbptPLn9QIs7xg=;
        b=Q6bWP/FlgdXOZYJXDnR00g2GqZCkVxougjUoxlEztzXkW3hfoAewcPJxcH92Kq/uhi
         jqquc46uTP5+lp6XQxjmimBqdjfZ/qZB56H2ZE3LQdHwLgK5UIXfiAO3fM5NBCVKV23j
         +66ElFYtG4Dngi5em5BuaD9CUjYyHPnKS9fanuxnvDvMnM856YX0kGProgaXSkDNP88X
         lGahnj5rXUZQ3nUtUXYhENiXqZi89QCUoqUnEJFRTkHgCZLMbJRTQROMx2CPbNUJN4ob
         RAddNehC6rbEYjRLEPQHW0FbxIV1jBKI+gKv7gsdWPoxqm4nTrH9PodsnMxN0I9x18fs
         V1tA==
X-Forwarded-Encrypted: i=1; AJvYcCVflSmK6ehcweYiWaxe7Ak3q+9Tv1QEUrLbi+d5pfBK/RnRD6Zt3BFdZAHr0PKzyCB5PGtUzb3gZfQcrMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy92GCxZzo9GHvM00oC3GXo+j9fUDcJUys3xuNtu739T+Ctwy+m
	FKNhkCMAR8UNOQ96zOl1nosVc8+/qx/dDWGL1lG/hYjy01rb+E+UXz3/vJs//by2xkOrWiN9EPu
	9saG8zgngBSfl/t4jhGXxjdpohM2wvU5BrJxABaF2WB1ijk1kBYHTaYJwXwRTQdc=
X-Gm-Gg: ASbGncvRxT7Y2ecmCnTweZb8GQKlcWHnUCYckKXv7YjkuR+6tK9b8cfueM6TQ5gzAi/
	0W3VkELRViO+gKwKXSGp8iLIFYdwg+N6T4PWcc32UA+SfDTyJH6l2yIdyd0gtk/EOYfkEoX62j1
	Sf4twnAlcAOiYt9+6VD0czP9OcTadUTke8a7P95A0YbMN3CNUr6B+bfOfKh7z/r7SslPGxDDKUd
	hLMfTtcE/EzcrXBU8Tel2CJZdTsf4hviWowGDZcFsH9pPrPL9jQGUJyrJKDL7df2pA4ftk94E0P
	SmMSZp8pPvYxuuHe7e4fBxntGHSg++xt6kHUHSMzWHkazu4UtHqj6CGnKHnT3TvMoXxpLJP2jtW
	ta4+iBWjViILq5f//ckZlxEbj
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7cace970621mr2280186585a.3.1746404096375;
        Sun, 04 May 2025 17:14:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtGJXxyiZuVoheTixj01E/WidOroFmG3EK+TLgG2+eb1c8BMLiBCNLo1GSEwRMtdW96uybvQ==
X-Received: by 2002:a05:620a:404e:b0:7c2:f39d:d0e0 with SMTP id af79cd13be357-7cace970621mr2280182385a.3.1746404095994;
        Sun, 04 May 2025 17:14:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:14:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/13] drm/msm/hdmi: rework and fix the HPD even
 generation
Date: Mon, 05 May 2025 03:14:44 +0300
Message-Id: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQCGGgC/22Qy07DMBBFf6XymgnGr4Su+A/Ewo9JbUHiYoeoU
 dV/Z9KqgggWXtzFOXN9z6xiSVjZfndmBedUUx4p6Icd89GOB4QUKDPBheJaCOgDxDAkiMcAKDv
 TBXTGImdEHAv26XS1vb5R7kseYIoF7d0huZFccK2FbFrTCQlPQLapLI2zZanxPc8vH2m0JTe5H
 FZpTHXKZbk2nMWq/r/MLICDl9wF13rtW/ztWdvM8gc2dHkDS4I7o7Q1yrtg5B9Y3WFN/Z+3sCL
 YCKG06TB0bb+BL7dhCn5+0brTbR3mbEXweaC/73dDHR7pwYiniYDLN4Gi1WOWAQAA
X-Change-ID: 20240522-fd-hdmi-hpd-e3868deb6ae0
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Pino99IS4gxmEVNtT1+Fg674jvsTFh8QsSqJonlwOc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7k34CTyL+GciS47k4GgyjUDHX+AiePEWZZ
 PZu+mKeY1aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1d7DCACkX6diSixrEFcrvdjBBsobYTaNgNHevK3bgBqUR79f2pfonOim2y8lJLX9Fg9goVbj1qW
 al7hSm6nEwi6XSkld5cDVhg4U2y6DgZDOVwGUtre+qLRAx/Cb84RPUhUmpYsZyn2EEDke7sgoNl
 nSqNbc5I+gGdXVKsL2NUyZ1EwLtwKsivS+5gt3TvZvhwsSWdi8iFuXAAVICpIhMq0RHH+qLm/pJ
 Yb3ZFzWt8++wR9qcVZRjufl6hFe8/zHs0PcHaHLqtjtC7y2Qt6mTlATiNLn3ijqIRVgYB5eWZw8
 C829W9kv/t0e/7vdGOcCuEBrjBLc+Vy/WiUfCSOYEL0XhMA+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qgDT9CFBO1z_hge9zKuo_qKUYKaflyJi
X-Authority-Analysis: v=2.4 cv=O7Y5vA9W c=1 sm=1 tr=0 ts=68180301 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xeEy2NUaHwTvFDDSPagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=pioyyrs4ZptJ924tMmac:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: qgDT9CFBO1z_hge9zKuo_qKUYKaflyJi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX29icrjs2nJOs
 qd8zWEpbie8zJB/tJgPlH8x9WwcOx7MgEw2dU9SI8Hg9Ri5DMNn55PCPoZX4uGcMbWftlk+UGyl
 9Gm5eb+XtD1vt6qps2ngU+6hhvo9wZv3b5J3jEEM1TEol7LLRxGvxQN/UqvuymdE5oOmcljhj5W
 Ldu2ZeEhq8Q1jbjjx1ZWsEm0qXqx8mCPGDhn3vNwN1D+uqo0808jlmeHr/ezwo7DZq75/jr5WSM
 mX19zy/L/kN/XF1+6K9bbwej9dNSO+hp1c+yuomQ3Zpg+AxyFKI5vsVQP8xBt/yhB3E/qRjMq8P
 +E9RWuEus1Wyt3ZM33lRg03eWhAejw5g45TIgvoW0uJKvQKh7o1CaEB/UoHFJOtqBfa1u8FJKvN
 BU40SesvXNxLy7bPEJI9LpXYqYF0wWckFPLYKElJYf8eUSlsc5pNWjMRnFDdbidZjxQkjafz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Changes in v5:
- Dropped hpd-gpio patches (to prevent ABI break, Krzysztof)
- Link to v4: https://lore.kernel.org/r/20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org

Changes in v4:
- Added bindings patches. Dropped hpd-gpios from the IFC6410 board DT.
- Fixed checkpatch.pl warning about non-const string arrays.
- Rebased on top of linux-next and the MSM HDMI patchset.
- Link to v3: https://lore.kernel.org/r/20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org

Changes in v3:
- Rebase on top of linux-next
- Dropped the patches that were replaced by the HDMI Connector
  framework
- Picked up the mode_set -> atomic_pre_enable patch
- Link to v2: https://lore.kernel.org/r/20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org

---
Dmitry Baryshkov (13):
      dt-bindings: display/msm/hdmi: drop obsolete GPIOs from schema
      drm/msm/hdmi: convert clock and regulator arrays to const arrays
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: ensure that HDMI is up if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 .../devicetree/bindings/display/msm/hdmi.yaml      |  15 ---
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 133 ++++++++++-----------
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  26 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  55 ++++-----
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  89 ++++----------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c                |  14 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   6 +-
 7 files changed, 135 insertions(+), 203 deletions(-)
---
base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

