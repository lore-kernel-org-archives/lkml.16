Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38725126F0A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750033721; cv=none; b=YLdXMX1rrm5dl3R1zHr1+px7ZMqi0VFakkMvOPCtcAMXIB78ZEpnzIJKrxim/6exqy7p7ITwrpilei+lst5rCSdkFJq6MC5qTaen0wntw7u1lfAjNlw1EV9Mp7tYfSwft7GQEqKFljmOw+WDEVXmP16WrMb2NRU7mXcbBjGmAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750033721; c=relaxed/simple;
	bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lORr1D6vfqi2Y16+xXmNA5begJoUTJPwrtFXXf46DfnfXrLdS+oCX7VecACJRNYkHHx8JrrRnYzwAuqOVMGWxa2pyQzFt7ZaaK1SzbuJMQ8zacePS2YiVOOgKq7qmHBkTym3EiBXJUN10hJQoN2jGjQMFVgfVWxIEZBYwkfHQOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6jM/syt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6jM/syt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55FNeh6A021721
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=; b=N6jM/sytFMeGNTKD
	ARV7N7bz0CnHvGuwbMJWaCFnWsoosqBcivtvF9oegs3hu+bbzwNYCciHpWRzm8CT
	irW55+qQuZPZumhJgqPGs/dyVKicn7cW4Fd9Kw9YS6JTNeQZ9tz2vG+Znqq9iAno
	yUlRDKzvofSSG+DWoZCiIKFIie36AzovUgushf2aNuBELAEq8+k+J9pd+RE7T3s7
	C1coJw6RBJtV7hQTbXcuPhTP2X3zlNMaTmxU6n7kzMht7874e/KVv/YbFBjec9kh
	Ux1Gt4g8xL2tJ2/PIctCwHubaHSG/US7hpKd+UAlWDQwJ+P3irEmKAgVrdkx+iiU
	HOMb9Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792c9thn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:28:29 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faeebe9c5bso34738286d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 17:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750033708; x=1750638508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDGlOHr4NgcDVCXG2RQ6GCKnY1CV3e4EG2J6GhifJ9w=;
        b=LEMvqrUYC1GKP5ZOHPZLXp8URXDW0IEeigs+Qw7djMHEPoH3Awz0oxJCmK01hLQI1y
         dI6yc3zFq9j2CpW7wL7mGnwekavD9T0lY8lVxQtwlvVQtqP/BjXGakH1eD6RKEzG4Q80
         mvj2pMvIQigVJOIMhRt7BztjQeQfanrL1yVmq8jnjM0HwhZ9ErTxaebIBA33ayTBNDWn
         1Paab3vc0c0wQxHE1jLGd4Ptrf04tBlLbip+z/jvCWUsB+gSrVxv7VRap+PWPY+tbm7+
         HxItQPmhOrcvnCM8Np3vXAyf0ihHhA4rJWtpbtSbblp2s9d5l3FGzRQEkS3Gr5qKkL1D
         IeOA==
X-Forwarded-Encrypted: i=1; AJvYcCUEvoAWR1VRhJNIGnGyF3G3U04x/FoH7cDlh1VnpYIHKiQfudg41XOJWrRljCdGUFgHADlfrMgeIYV23E4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw78JD2zbE0pRoOBpxhH0TETeS4Hl6LDxyr8sAKRY54gsGpFzXi
	CvVeHpE0nwVsWizSF99uCPHhUVRq7ubEbXFiSqOXehGIJE7USl8BbbZujc8mSXlIQFqNHOjZi7c
	STyBO6hgdZx7niEkUUNoEmUanO8Vjkwfvx9DxR6byAVxlGGfcYLkuuGmfmt9kwKJjRsBQFAKyXT
	Q+MA==
X-Gm-Gg: ASbGncuaGFyFuH0YNkEutXYrZ0gVPLTpkrQxlvZUjz+vL1lXpYF63YEhz69gHBs6vbu
	hxyje0m9whlJwOVXPIemAebe9kzQ76PS4k3Ujiw4gju/n9VHGDyuEOTsYFJQGIFlH+VC4HcV+t5
	6vZjgHW9JpmO/Np2gkFGnG32IyHQtSgsvC0o+4Flx3gKy6GWL8tZUe3sYtQ2L9kob2e0EjIqyWg
	NRLAy5GQZcTuVE7agfoFZC5F8jbp2A+OG9Nxewrelkb9iOs0eNmpgZf8gvZgijtR2aAMy5oXYpx
	o+fFXTgU7TUY27xpXQSnXGq/VtyvxveXH1d+IDsM5KThEmhpsaBRvrMrU0S1c1L7uZAvpy9UR2V
	AYlorwZuXoe6aqODOGqHVfCXrllwz3SyWyOE=
X-Received: by 2002:a05:6214:470a:b0:6fb:4954:846a with SMTP id 6a1803df08f44-6fb4954886dmr91519726d6.3.1750033707809;
        Sun, 15 Jun 2025 17:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/JZjdIkRHjrhbfDSHfCFDPji9PWUnBm0HXDcW0iTYfjKMfPKMxD5XA4I6dTHJmHeuaSYxQ==
X-Received: by 2002:a05:6214:470a:b0:6fb:4954:846a with SMTP id 6a1803df08f44-6fb4954886dmr91519516d6.3.1750033707402;
        Sun, 15 Jun 2025 17:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac136104sm1334990e87.77.2025.06.15.17.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 17:28:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 03:28:13 +0300
Subject: [PATCH 01/28] interconnect: qcom: sc8280xp: specify num_links for
 qnm_a1noc_cfg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-rework-icc-v1-1-bc1326294d71@oss.qualcomm.com>
References: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
In-Reply-To: <20250616-rework-icc-v1-0-bc1326294d71@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=814;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CyevXooayJgTRHhip0Jc/dJHXf5dF8Ulyrh+9bR9yQI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoT2UheJCO7+4KsyI6UefPVpkp7eVLHpsfkW/8Y
 gH6QLOIvVSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaE9lIQAKCRCLPIo+Aiko
 1ScPB/0RAK0//iNxH/4+6HAe6bd22Av+Lttd13V1+oqzqJ+YtOIhBJSwlFRTpgY60SRhmWl3mdG
 QHkyMdPnQsVVdWn/IV5O6IH6lC9vB86u/mG4J45dwCFtXfw0F3ERMM3woOIDJeAXlIL/sLLUc/s
 SzG1/fcFTrZsrpPbV5yqHVpkwyBuTaHaIZsUyuakeF0Xa4ToMCFFbnzClf5nTCBOl6ml9rRwp1c
 Y7odSPsFlopOrEP40b/z7XnDx0uznUz6fbqpBCLVUdpCEM48QGcUlec2zF+ItRuGSX1nCwN2fsR
 zM0hX3g6NP7Ub2fhp0v+J4YUKw6GAmWxneORcdBI2GbQdlC0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: K03E8mmPBBkxTcb214089cyo3i5ZmuoA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAwMSBTYWx0ZWRfX6nMhVjjK6j49
 XgGsB2TSYTJLirVwI2AuInCJ4OuQ1fZkOIuy047RLdQVpIJ2K9+OWr3fDso9DayYwq0ZTsaDWsF
 eQCdKZczzXXrqC1qJK0fCQ+iwRj6NUOrcwmimCOysnlatsU91jZwSrExEVzPCQOE9/aQWosQiX0
 I6STUbEWRlfQhoxRkJTIrYJEH2qMnKDm0StHBmneDyy3Wc6uoKOIiRk7BXogY8cvfN6CQDenRFc
 CA2ganVX0vdFZQUVqpH34VZ+OCoIz5p0BVuHT6X13KI7NoeiyVxLEJGrLF4m3V0/RKuE1Sj9tDc
 5ooLVDMUBI7Efxj5E3UtqRhy/EmELd23c4IjRRLkBQCzEdp4YdUwXoQg+xff9fwK+Z1hawtxKbJ
 Sx6eixowelQ8HteSiZuOFwRO7wqhnn99rknxYlp/WRkewYrGuaesTGCl2bjvKwslXIERC49O
X-Proofpoint-ORIG-GUID: K03E8mmPBBkxTcb214089cyo3i5ZmuoA
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=684f652d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=lLMxHPiN_djQrzgEttIA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160001

The qnm_a1noc_cfg declaration didn't include .num_links definition, fix
it.

Fixes: f29dabda7917 ("interconnect: qcom: Add SC8280XP interconnect provider")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/sc8280xp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/interconnect/qcom/sc8280xp.c b/drivers/interconnect/qcom/sc8280xp.c
index 0270f6c64481a92149cb19556acdc6e2fead39c9..c646cdf8a19bf6f5a581cd9491b104259259fff3 100644
--- a/drivers/interconnect/qcom/sc8280xp.c
+++ b/drivers/interconnect/qcom/sc8280xp.c
@@ -48,6 +48,7 @@ static struct qcom_icc_node qnm_a1noc_cfg = {
 	.id = SC8280XP_MASTER_A1NOC_CFG,
 	.channels = 1,
 	.buswidth = 4,
+	.num_links = 1,
 	.links = { SC8280XP_SLAVE_SERVICE_A1NOC },
 };
 

-- 
2.39.5

