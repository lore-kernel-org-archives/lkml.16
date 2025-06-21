Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3721E51022
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529657; cv=none; b=i3lgAx9A8lwg+8W5SS3mCYC9caliNdUJSwL4hH+cU9Z2Hb9RjH1twbbaPbBjZgaf9MWnbARYagZyZhilWvnJ6PsqjOOWhEwMG+D6SzRRXS/BtbABD0xbgu8pGEcIxwNXfT/mBnThsyoG0Y1ojTBIwVYqGHplNYJctktfRqo+K+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529657; c=relaxed/simple;
	bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OSODQsGuud3LIV4njt5j1Rr/U0xKHNcdxCcRMYnFpQYjKQeNHtbQWMLbvWSXLbWZ3HnO7Mqt0I6qDxqcqoTgFpJPk6fLdXauEDEGtUoXtfZWAOp4nUWfCn1myBTvQkUaReSNa+qnejcMsivVrlLrspSP7L3yT1Ts8Ht9TQUzRO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATLg8MMT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATLg8MMT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L80jJ7030014
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hAdBnAWfYHpwDRvHbFjfO3
	Wq7C/rufDq65LmjSJW3fQ=; b=ATLg8MMTVIUMiJHrj7DwfuaTtO5ROoueIRdoXj
	/TFIlcvjfkY5+xwXKPSOX61R9iY6+3mfMP56dvleeSMNU+Jt50Aa/XKpW0olKy/H
	XY/C7tW64cXHxjaxnOnOQ4Po8tCkukn4KTEYWTb2CmsdmqjUGt4SVmmQ0z+HKisC
	8erR5ByCjAZIguCZStnab58WEhK+sdEx7tJtsdwyW83L8Ill6zOnHzu0tONZqwXD
	VZsT/IJbQ+n6K4/y3uKI2Pa4cZ8m/hTlkTLP11nElhgsXO+jGkrkTgt6U5loWduM
	kw8J3nHJnOoe1Db6OllVNRy3cVbtKNq1k9DZRlLqKy/RI07g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dp64gw60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 18:14:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7caee988153so466507385a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 11:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529654; x=1751134454;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hAdBnAWfYHpwDRvHbFjfO3Wq7C/rufDq65LmjSJW3fQ=;
        b=oNireb2P75eLqHMk4v7MwD4acxQbprCUp7Dvu24egLGa1NEnKVuYqe88cYjCpjsF+x
         vlM7q/gTamZZBTmHcGFzY3lRkp2dkwPwUox5ou39qJwa3q6m35KRCwNqTOY3jVEL23Yq
         Kn4OY2EzlWCF2+GMOLE8suBVNDj9rpMUeAywLDSVEVPzGqE4Nml7YeFA2j+7CFAp/A6j
         6zTZBChR9hGZ8OJz6QCFrF0Zr6xKk6iHAkdg3MDsS6pDuZVwXnqUXkGWt5v1a8VlXXAC
         3cKdYviPgMqqe7BOVmv3eqV+hEiTqYwJrxxnF3vqX+EXnvPAw+Fj/805WqBOn+4WCk0J
         gbig==
X-Forwarded-Encrypted: i=1; AJvYcCW7bp6mtAq6h3VdhxlIvJHm8jL4KRxxkBWfb88FHgbRvh+V1MsOK75Hj0lPybbqL8fltmEYqCfoJyP/iOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzct8vD7+68V9Yqgj69ziRzTzaGDQNmEv4AHUQkghfivBtzrRlc
	NPVk7dz6uI9v7Fkmnl1QscHFBzDAQjIbsVf58gkumkXXX+dXfa+fuCkSMVrNPGiW8e7HtSXq8xO
	eRUNvj+fmF4DfOktCShBfOBZI5QnZAqdqyPPiX849Yxio6xiuci9b7HiPfSnxb+8NjaavYzr5Wa
	2JqA==
X-Gm-Gg: ASbGncv7Uqub+7HGsMUwFwLJArb6XmNAmHTVFn0RTknjWC+hvpSmes1BwmFiFUad9tY
	E881N/oKi2RJaScN4fNwHk2CsiXg3+slawxN1dcdycPzRlttoCK2mH99Y2vhbiYkfi6HzP0dhYK
	87llO8e0HGhzfWSgZi0toRvW6vRAu6czsIRXYwZwy48ufk6jZagrQftTEGGfoBU6tw0yJsk/v2u
	muNMCsWUeoraRM0DzQXBh5NF1bvdC0O3c6N+pvjR1+iBLlMOSnIIqVGWeKkbILVc2/OK3OvHPPR
	6qyAMxHvmrIGMxfCOlV02yyvlOZkJZ0kxnQ5i1WFib/AGE+dg14enF4r8Sy2l4r6se6l5AcdjQR
	I4w/UtEBiE31kPfaJ91yKqRd1OLiELTtwYO0=
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894899185a.29.1750529653758;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh/g8hREMqWKz0vNE/ALaXmeIFavld/Ji1sFTgDR73nzP4ito7bDNyvb0IHP/cPqQq22K+EQ==
X-Received: by 2002:a05:620a:f10:b0:7ce:ed86:3c53 with SMTP id af79cd13be357-7d3f9915ea6mr894895785a.29.1750529653328;
        Sat, 21 Jun 2025 11:14:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/8] usb: typec: ucsi: yoga-c630: enable DisplayPort
 support
Date: Sat, 21 Jun 2025 21:12:55 +0300
Message-Id: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACf2VmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyND3WQzYwPd0uTiTN00Q1NTg6TEZNNkQ3MloPqCotS0zAqwWdGxtbU
 AdcC+uVsAAAA=
X-Change-ID: 20250621-c630-ucsi-f1550bac5c17
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NC+6CTFgMLHdg6+g9HBcQz357cKtQj1mOKzQB55FZWY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZy5+91uni4dIEvWlsETyokE+iLrZe3p2SWk
 r2J2MUuLPGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cgAKCRCLPIo+Aiko
 1ZFSB/sGqadIrErakavmv4ZFhj5lCWmrgf2rD3td8keECibDmPBJBiL6pHfkwduDARAEGUEUA45
 Fwe4X6zv5j/But4gkNkVk7W7wn7fWvtJ0yAA8psRi5Yrq48sHosoaTxKJYopz02YAtP763lvulb
 3drpzCTQog63ygqEMtuxFH3b96LzVW4dq1NVAMp7RuMDcAw1W2SFKifx7AMtwPrrZ2o2Y3NPOmk
 EgI5LPccSfiwPhEqNF8m1/kWfC30xCRw8qBTn/EK2fFts05xBr9C41ZeWGLgp56NSIrsX1tzGFG
 dhFLG4mHfjtsF0hTaoIRA3KWUcP31Tf4MTrh6Xx5RtrjTnNb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: TJiCJqJINMWOnUd6XNjSO7f7RCLE7X8E
X-Authority-Analysis: v=2.4 cv=dPOmmPZb c=1 sm=1 tr=0 ts=6856f677 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=LFE4Rb7r-JuClWV4lGUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TJiCJqJINMWOnUd6XNjSO7f7RCLE7X8E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNSBTYWx0ZWRfX5hWMUPyl4sR+
 DQYWymucV7sZJDnNp7WyoVTlYfcKrtvRBCnuIc0CXnEZ0BHJfd+Y+0HoNzYxS5OoCC3g8Ku0T3l
 w21VUIKpung7TcIItbT+qTaGlKoC1B5FUsaWC5pIRfjuTscEdFFFftH2GFL/1bcpnrmEM/ZIcE5
 MzgZ3/LL0nMe6JyNa2ol9iulgaOTE5BddB+KhHAeyPfzc2COOp+N6W43CN4pSCNYANckai68j0N
 cUAIQ4Qwe3nNJ6oK3i/z1/68GoEGgbzGhZJNk8DxKARL028wsqLoyRzCynVy8ufNvBKhg/Avqpp
 nt+2Pthx8MwnxnzxI416dQrR3IqqU0GIHm5LYxA/04cqzKIMN/1+vKEYiLLzDGp+fumYvexDd1R
 IrWBvarbxGPoYPNlMOGR1EkgEmktkO7RxaxBlfNYMYYQc04OKMcTOk+P57Sus5JZxdnqoTEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=615
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210115

On Lenovo Yoga C630 laptop the EC implements UCSI support. However in
order to properly handle DisplayPort AltMode events it requires
additional support. Implement several workarounds, fixing issues with
AltMode UCSI commands and also handle out-of-bound DisplayPort hotplug
events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (8):
      usb: typec: ucsi: yoga-c630: fix error and remove paths
      usb: typec: ucsi: add recipient arg to update_altmodes() callback
      usb: typec: ucsi: yoga-c630: remove duplicate AltModes
      usb: typec: ucsi: yoga-c630: remove extra AltModes for port 1
      usb: typec: ucsi: yoga-c630: fake AltModes for port 0
      usb: typec: ucsi: yoga-c630: correct response for GET_CURRENT_CAM
      usb: typec: ucsi: yoga-c630: handle USB / HPD messages to set port orientation
      usb: typec: ucsi: yoga-c630: register DRM HPD bridge

 drivers/usb/typec/ucsi/Kconfig          |   1 +
 drivers/usb/typec/ucsi/ucsi.c           |   5 +-
 drivers/usb/typec/ucsi/ucsi.h           |   4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c       |   4 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 176 +++++++++++++++++++++++++++++++-
 5 files changed, 182 insertions(+), 8 deletions(-)
---
base-commit: 5d4809e25903ab8e74034c1f23c787fd26d52934
change-id: 20250621-c630-ucsi-f1550bac5c17

Best regards,
-- 
With best wishes
Dmitry

