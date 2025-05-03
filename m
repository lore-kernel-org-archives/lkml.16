Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245E11624E9
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 05:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746250334; cv=none; b=TuJ+vZZi6zqsdRRwepIX9L6CASX0EoC50t4yU+uafmO8dWAw9iv4lulFxKSUNHn6mlrlq+xVA1Mf6IPTilvKnlN76FSxIL96nP3FFKSobBbNlKbIcPN+9V0tL1nNTQCWYPQai1FIO/WbFjMaHWyRImdvYE0MDqKranXeHnQBmxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746250334; c=relaxed/simple;
	bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K+QRTB9b+HcFNKXEDPX4/eRWVsJyTeJ6pRZLtPNIpaS9y9O4ktsQf/2s5+CNCzqFavlTnLHpbN0v1AYxRyAY2HANG2K0RlISuNHAB3ejZiv8MNn2jjdx87zSWzYsLcibVpq8cMDV1IxYyDZtkH3YypbxBgu4Zwgf/ZRBD6KdTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=obhY5nRy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="obhY5nRy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434e2MQ004536
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 05:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q3nDXSB/Fo7qumlTVFjSJM
	Bida7tzkzQifGisEtqZcw=; b=obhY5nRy9K1jM7Zg6ElsXwpMymtgDpqulOoqlf
	N/WHGaIGDYL8e4D91oNlsKD9REBQCQZaSrImfABWeRsH5Dx4zCF4R61mMIdWuQdI
	ASOn2zObsH5eZWXRNEQ8qd0oq3qqWhGh7sdmaHIXj/1CkNNO5xEoel3gEdU39thU
	0c0JznsnViGmfsnZ5BijCwgMhLMD7KSwCxoEIZ8QteiUPIBKlMq578oQiaQ1zn1b
	arYTO5DqQq8v3ioV0x7VAoy3EJPhATpmeuaFwzsJfaQ3HIBSRSwvxfjYdybqJCgb
	j5fE9tQ/ddwPcjRKGZwSlm49t85t2ihcsuhIY/4t611E6LPg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg1tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 05:32:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4769273691dso47974351cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 22:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746250331; x=1746855131;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3nDXSB/Fo7qumlTVFjSJMBida7tzkzQifGisEtqZcw=;
        b=PDcMYy8ySyuyl1rCRJXAuloX9E3+6gcrPR8JBx9k9D9NwMLV8858Tkq8ppKPcqHxhp
         lJMm6fpl9ycZ8Sp7T0DDM7Gl6ptjoXtTcYA15rzs9KMrHeqaksrcmviFu6JzvuaYaHfn
         jqd8I77ZLL3qh3cD/F5uY7vJUis69jDSNPGyDx4jnbscYT99WqNtAtxcC2NFjto4H0b3
         O0/U1PRELQzyFxro4Siw0rZqLk3gV6NhSnMnXSg9H0yRL6p2RDqWBfbXk/NwKK9PP0Vh
         tM8uwJ5ZvNFXha33CG5q2vQvlZ7ZiHE91hJ/fkpgdZTJ+H1B7PfGuHB3nUgo8gmpcspM
         cgQA==
X-Forwarded-Encrypted: i=1; AJvYcCX7AjXuE737H/kXi4u/jUDsebLV+tq00REkQ6NqXmxSeaLpnaUQW+Bw9O29ZaKai07sAUQ37zdDKnaXpw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyIxNrFeo5c8NrfbFjVEZNiM3Fmc5ZJe/r07fCEPp8rUT6dWL
	vxAcy7ZDMFQ62gtdCn9jKXNdSL/eS57yKSqJdaaUggVHnwIkeBNfWQwK7nQIJyi6M3zTQIV3LLh
	niJ6iZ8BYctVHnQeEGQjgHAcklNeeo0Bhwl/LAct+LWot4D6Z2jEwVropXv0BzsI=
X-Gm-Gg: ASbGncsh6TcJvRHc96vCviQAutX+TE2rfxLkS9W5rPofbMYukVSLb7F31Tc1f8hxDel
	dyQ2jOHQyCXRHxBFMhq1V5f4HmdrvGTy44npnfKCM85gs1IAJ9uEft7B+GI5FZmMwOBh4GN4A5P
	S+UYb/HK0LXetnnL/cOMCBVKmgriFGSytLLqOq3ZrG7Av6aRYNzzPOuSjLCGcQ35FJC1IJX+zET
	Lg3OVR8XvZJEqrptA2wv+OekPnPAPlXVeqV5HUo3PjDfNpsUZUtXaWT6WzJJM2NvQhr8kfLGihb
	0mVtinA3ybyNkNbmj1F2vFK55zlJCypt/mZpWwi8S2ULV7njsgRMI+cIFjg+0wFblxJDwAaKCKY
	l1nCm38anSYW7fIJKHABY0jMM
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87015201cf.33.1746250330819;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwkD4VFYgZqh++qJ1hdBjNHyXm/KsDjgLE3d1OOhTEveS14qB/5yiIqfYnDcNQLb6X4GzP+A==
X-Received: by 2002:a05:622a:248d:b0:476:6b20:2cf3 with SMTP id d75a77b69052e-48c32ac7d08mr87014951cf.33.1746250330357;
        Fri, 02 May 2025 22:32:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32029017cc0sm6165841fa.39.2025.05.02.22.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 22:32:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] pinctrl: qcom: several fixes for the pinctrl-msm code
Date: Sat, 03 May 2025 08:32:05 +0300
Message-Id: <20250503-pinctrl-msm-fix-v1-0-da9b7f6408f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFaqFWgC/x2MQQqAMAzAviI9W5iVIfgV8aBbpwWdYxMRxL9bP
 CaQPFA4CxfoqwcyX1LkiApNXYFbp7gwilcGMmSNNS0mie7MG+5lxyA3zkQ2uI4nTw60SplV/8d
 hfN8P4wELvmEAAAA=
X-Change-ID: 20250503-pinctrl-msm-fix-b225fc7ead2c
To: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Josh Cartwright <joshc@codeaurora.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3565;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JrCjArC0bzr5FFuhkLAmoTVoBHpDGiU0BzbLirzY1hM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFapXh4/UJUC1gJg8vS5V54U5xFsk/5ULuz06t
 IiHdTeF9f6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBWqVwAKCRCLPIo+Aiko
 1fCrCAChmY9npXN9et/ISZqhP5jTh2TPOyJiYp2wBbiUjcoKodg1RhEyTA+mV2BaZLhzaste95b
 TZhroBDFA8gUg6YhhJ7xK73orFbwH9MEkvMxhcepmgk1LZjRqFNSEz3ZdgRzACQBSMDtLfXxnej
 y5y8qZdNYW+P9E9tM+/Ietdpu5VCd9vg2wUvqwn/8HTIOMHyM14bjKHMmOrRrnaApZpPXTIoJoq
 GJwnLz81OwKE1qH7f7X6SB9tRY1ApCtfRKW7uq+Jylpi7AMSdLwFw+zjJFNCBOCEKFPsDtmSm3I
 l8jAcOrxEnp76xZ2clHeWTIpwQDcfm/Uaiq3K1/4WjK7vO8n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA0NCBTYWx0ZWRfXwtZZgwglgtXq
 5h8FW7AX1XCAcLKsFlz/3xjpHJZMY4GKt8k4PBTe8T8CapCPkU3kD2XFLqKmQG0xTcN5+AzrNOm
 gw/E2Wnei4/R2c4QJIHGEeK+7O1oVGbZ00glrY8BhRvHdyIU9Ol5hIe8MOOiPPdFJNUHbpU2/iC
 yDXpdEzc7JnTSMeK2AJ7TDVofRHnDKJdk2o6kxcDP5JQOp8PckPsU+zakj2LovPwz9BPhSelq2i
 mqrQ+uTA/+fi3Sx3BQxH61b8nBombYKDKDajC+IdJe0f7i10u8kIApytt7BHvjxKBdrEMOgMUOR
 BkC808OzK2gutyAde3hZj6CP63WLuOTFUKXmQNU/QE+I1VC8lHnuoDIVSMjvuqLOSb2b1vNVtWB
 PoH9XPDPtBeCW9ttzQwHNeoTxsynhIThUt6P+RgbMWwXrHO9OgtKCHG0PHO2xyR3BtVE1J5w
X-Proofpoint-ORIG-GUID: VQ9MsDkboyxjN95vco-BG7ei07oQBe7N
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815aa5c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=yL6wTZgN64zhq57P54QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VQ9MsDkboyxjN95vco-BG7ei07oQBe7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=631 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030044

Fix/rework several issues in the pinctrl-msm common code. The most
important fix is the one for the gpio-hog handling.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      pinctrl: qcom: don't crash on enabling GPIO HOG pins
      pinctrl: qcom: switch to devm_register_sys_off_handler()
      pinctrl: qcom: switch to devm_gpiochip_add_data()
      pinctrl: qcom: drop msm_pinctrl_remove()

 drivers/pinctrl/qcom/pinctrl-apq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-apq8084.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq4019.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5332.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq5424.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq6018.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8064.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq8074.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-ipq9574.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9607.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-mdm9615.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm.c      | 41 ++++++++++++++++-----------------
 drivers/pinctrl/qcom/pinctrl-msm.h      |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8226.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8660.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8909.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8916.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8917.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8953.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8960.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8976.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8994.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8996.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8998.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-msm8x74.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcm2290.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs404.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs615.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-qcs8300.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdf2xxx.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-qdu1000.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sa8775p.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sar2130p.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7180.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc7280.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8180x.c  |  1 -
 drivers/pinctrl/qcom/pinctrl-sc8280xp.c |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm660.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm670.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdm845.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx55.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx65.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sdx75.c    |  1 -
 drivers/pinctrl/qcom/pinctrl-sm4450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6115.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6125.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm6375.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm7150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8150.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8250.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8350.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8450.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8550.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8650.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-sm8750.c   |  1 -
 drivers/pinctrl/qcom/pinctrl-x1e80100.c |  1 -
 58 files changed, 20 insertions(+), 78 deletions(-)
---
base-commit: 6ac908f24cd7ddae52c496bbc888e97ee7b033ac
change-id: 20250503-pinctrl-msm-fix-b225fc7ead2c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

