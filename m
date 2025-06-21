Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4953270EC1
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535783; cv=none; b=O97B6IxgClmQKxex6CEjiDtBkwPkdj02gJpOOQ8etb6Lpe+Z/jVEjUzhbuKMCGznE2m1uWySBeMMUrEjKEQt0FwqoL+CGkSLJaeLmr7BHcvc4Di+7OqLQVhrT3SBftMjhYmQIEqCogCsuq8WxIJm5QyBik1W+vYAfrs6RyUG3rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535783; c=relaxed/simple;
	bh=AYSfUnf3azSTwr8HS4a1h8tLgNaLSWarihAu5oMzWwg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NaJ6uxLFN9guc4W+GAjE4Ur5x5fqKn+OQ0Fyi9mghsbE77MWEM1fVSe2jICxzW/7jAevV/iZFzo8/pAkoqjVy497yaDS3aaUnZc2+dmzCvelJdZiPwEoV3/2Ui8V4P/7wJAeNQyU20M28kUQMEVl4tCxJDRENKLpKcUMLIbmuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJyQOu2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJyQOu2u"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LJqZt6032416
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=isn/W8cwEUUIzjTZ5KY4r2
	avohw6snmCFaBU6U7CMAw=; b=OJyQOu2u7vk3Xk11x0naIZPix1aiyCLDnraGMD
	84oXg2pCma6J6rn45lnCByCL/9xYK1dmUl171RkU0MjRUISgdAlt5hQ0do/F6reF
	HNIRtUzC3O8HEwGCr1ObMTW3aEMB5lV5lfActmDEG9+5+GHaeInUm+M82o7ajucD
	aX3YGqeGAKa0l8CjUvXbySRtnY+0F2yHdztHvKFMyC86rcdVZQQi3uANuiSSYm3I
	+V2VPEj6+koY8MI8sGZTXPzrNTTZOmv69Ziz2I/gPO6d69kaRq41Zwq4yefn0Ota
	EqmBu2ugNm01VqdCYSHQrK058dIVPQyoaVZs3VVm+5O2j5iQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e2pbr19s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d399070cecso550311085a.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535780; x=1751140580;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isn/W8cwEUUIzjTZ5KY4r2avohw6snmCFaBU6U7CMAw=;
        b=aGdrQ2iCRtJOXxQRgIm3VnAsia0iL1GCnusmNue+hBueH+A2cimD/qLWxmCUt+5Qf6
         LfXYpDggAMfVaDcQIJKEtml32qB6TT9PnU37pyccd02/nahJt9oxgXnKeGKinPSb1FTw
         VTpP7Y61JOYkz3d+w3pjpOkHaoqB/pC/Q9QxOA8HHpMZN5tmvW/cr845WC3N0xoemp2a
         5DWMN32ro5Vzw1tDnh1VZlJECQUNKg2nYsjnj3Agc8WQuhar4NIi1LX6VqICIrk7QtpA
         ywqen7WjO46ncXTFyFquNAZRWUkRq0Jo9lOL21p9y817PJCLqT9CUO459ZLxbzjC16hS
         qhsg==
X-Forwarded-Encrypted: i=1; AJvYcCXb5Dp0C+2AVi7fbYr4zoLZFe+q9sQd5yWSKPhddT0yiNf/Nc26j2fia5mmhxAoojHsnSzJMG2d/EiqPE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyESri4mbNQnKNUpEYTGCnj8JNldBCyOZ1jnYezWgn6gQfmC/Iv
	+Yuf3WNfo5Tw511Y52kgsJgYdd+GDBDMAJy4rIkhG95z80+K3DKldxqaltu8GhO5xULKNqqBhuy
	ZZPrVj1dzPPfHM7kPHR/B11DTLyz3wVVbvBHrnrL8MSQq56JLkahTWWGarNr4zigHL8c=
X-Gm-Gg: ASbGnctBirvjNzVofXqMLuvtRwFIg/nIZigP5xNkPDUl55DGzqn3C4w5ki8FkhS6s91
	DFXAN3VsK/zIJ9adZYnFhEasRtYFMtSMSg6iMzHq1D0t8ve7xuaoJQRi4/sgRzIanMuc657KlZe
	5H5gNK0Ed023vlAD7px89HSL5nBE5g7ZQpvzmcvCZXeqCtbd0bKcaNERFFidtC27SDWAPnEEJRw
	JM1Uc/cZB/lmlE7Emv6NNwmYcIQB48kdrg3+jtFM/3jYWqAQSRvbCMXjVWpslbaKKkaeAISXuAj
	e1o4nG61/XzF0BSzZkBYI+L51sZKGD4FyuiEeaE+msAdmSM0gPgm6c66sTzVYXBFNEtRGzYZhb/
	wMTHdFmX9UuZpoBRhufLjlH1MtOeMvzqjUtY=
X-Received: by 2002:a05:620a:2628:b0:7c9:253d:f226 with SMTP id af79cd13be357-7d3f99566c0mr1331360685a.51.1750535779675;
        Sat, 21 Jun 2025 12:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERP4dOfuvlZvRZ18Ykf0hcFojMw/oS/Z8vpeZuvTGzYmAPOx7N258o47CTz4ptG3mAjWaw6g==
X-Received: by 2002:a05:620a:2628:b0:7c9:253d:f226 with SMTP id af79cd13be357-7d3f99566c0mr1331358485a.51.1750535779318;
        Sat, 21 Jun 2025 12:56:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] firmware: qcom: enable UEFI variables on Lenovo
 Yoga C630
Date: Sat, 21 Jun 2025 22:56:09 +0300
Message-Id: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkOV2gC/3WOQQ6CMBREr0L+2iptrQRW3sOwKPCBJraV30owh
 LtbYe3yTWZeZoWAZDBAla1AOJtgvEsgThm0o3YDMtMlBpGLa14IxawnZFNAbL1lsihLKZuyLW4
 lpMmLsDfLrnvUiUcToqfPbp/5L/0jmjnjTCulpVKy4z3en8Zp8mdPA9TboSac3ulgPPzQ6IAsj
 a2JVeZwiRerQ0RK/e0LaUxyGtgAAAA=
X-Change-ID: 20240725-more-qseecom-379933b9c769
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AYSfUnf3azSTwr8HS4a1h8tLgNaLSWarihAu5oMzWwg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVw5hF9UX3mIRKDfBTebI3y2vQZ+9Im4ptracj
 DlHsCUzlnqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFcOYQAKCRCLPIo+Aiko
 1X6AB/0W1msrqbi3bGtJtcsiNmtWWnBnxE2Aaf8J5qbtuiA6Il41Eba1Ergn0bN46CKdeWtJHpB
 Rp/G9J9+K+XEFDwXSHLm0Ml4NAB6b1bqrlOJwr4P/8ZVNmHXYYzhqBYIvcJdtklLxqIjD+JUB9W
 4uwlpLnjfAYdN87CqDEyvdbMdoSMXpob344QNfXrEzpc+buuX1HQEsV71jipr65ky+C9hSjelfI
 s1Ucw4I2jZu+QVluFS0BQJZrLqvshBBChmVB07rH4wvuCkyQ88b3z9a6+B7oYX1vJSf2HIDHOE3
 sL8ERKUJm0e4A0pWyUYR96BO3smFJcd8efxivci+wHQCr47S
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX6Bb71mZREQrY
 euBQzgrZ4byCW8FvkPfgLz/t4wmgA2EIkLq+bCz3XkK+3u6aQSpFCR7rReyasI47sQy372EiZQc
 EY1ckLfJHb3eqgVCELuN6Ljl4+Pi2piatBNvvrIh/E9Ri3fJ+ubQhDdLAp4fgnAPFzDb7GiZdlg
 x+PUiQdNX+kygul5+4uxdBhhY9tKSsgYeKqw5mmPpHkJxiAQcIiDIpfvFHRn1yRHBCFe9cgEyeP
 P4y3gE8ue/VFtiohCio2ruzvaOyiYqJwneywTQyWPBKNkPecDNYl+r2GMq3wf1RdnAs8SksFW/H
 WCJvdCto/9TPShF1GcGJxYeznaKrRXJXP0IWoUs/GyUoLYzkHNM0aWq/Alu8cEMTOd3a0ioBWHP
 oAS9MATJ3KPEV9TVgV8OwJ18B84GbHcTqW9Q30K6Ul2AGZpF/wPXax8yx5QiHhJ5iSsRxKnK
X-Authority-Analysis: v=2.4 cv=C5bpyRP+ c=1 sm=1 tr=0 ts=68570e64 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=VEriS7FlDOdm1ho_yVcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: DDbHNXP5y_73gs1pIua6I9slXpU4Aasg
X-Proofpoint-GUID: DDbHNXP5y_73gs1pIua6I9slXpU4Aasg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210127

Lenovo Yoga C630 is a WoA / WoS laptop, which uses a "standard" QSEECOM /
uefisecapp application in order to implement UEFI variables. However as
this platform has only one storage (UFS) shared between Linux and
SecureOS world, uefisecapp can not update variables directly. It
requires some additional steps in order to update variables, which are
not yet reverse engineered.

However even with the current driver it is possible to implement R/O
UEFI vars access, which e.g. lets the RTC driver to read RTC offset,
providing Linux with a correct time.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added QSEECOM quirks in order to make UEFI vars r/o on C630.
- Added DT patch, specifying the use of UEFI vars for RTC offset.
- Link to v1: https://lore.kernel.org/r/20240725-more-qseecom-v1-1-a55a3553d1fe@linaro.org

---
Dmitry Baryshkov (4):
      firmware: qcom: scm: allow specifying quirks for QSEECOM implementations
      firmware: qcom: uefisecapp: add support for R/O UEFI vars
      firmware: qcom: enable QSEECOM on Lenovo Yoga C630
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix RTC offset info

 arch/arm64/boot/dts/qcom/pm8998.dtsi               |  2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  4 +++
 drivers/firmware/qcom/qcom_qseecom.c               |  6 +++-
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c    | 18 +++++++++++-
 drivers/firmware/qcom/qcom_scm.c                   | 32 ++++++++++++----------
 include/linux/firmware/qcom/qcom_qseecom.h         |  2 ++
 6 files changed, 47 insertions(+), 17 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20240725-more-qseecom-379933b9c769

Best regards,
-- 
With best wishes
Dmitry

