Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C1421B9F7
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747567312; cv=none; b=h3Egg8fiUCBPZglf4tfXJ73cU3LbAb76aad17R3Cj+LNGvuIuULsM6heiKgpk7ipOP81fQOMazfEwStDgkaS5o0KYNR3VFjBWOhg1lounODbfdys+L4fEFU5dvKnd6YhCo0b7SpaPYswAFR6bg58VVyfmZw65+F+4iVNq9jHpzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747567312; c=relaxed/simple;
	bh=LaP71rAhnP3brqTX9+5CNi7XMdiN4kJvsYomsCq4Acg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrdruPrsvDwtrs73cRJhTprTqS5JwxyXzhWWiLYS9knahmM76XsyF8Q1MyBJL75XyDyzJX8MRch0Wn+gzLzboOfLR0OlE/zm3MqWS+ZCpyAeOK3MGeF/srg5TTKBuHKr2yhPashEIxicurcJhvpIq3bUbubjMDTuBg9m0PluX8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OodUe/hl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OodUe/hl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I8fIjq006273
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sABi6XhGs1bCKlXNTPScG9/B+zCKEPoTGmnHLCriUr4=; b=OodUe/hlFeZR0iI8
	27skqlF4fkSxD/eGSDkoKl2gS/iP3HtIxt669r0KwOuYTxLgSVNHv+Z3pRzSneq0
	1Zt0UKJllt96dACpMOle246UjcoJHb4z38k3bNmLO/DNntSwA9Q75j0JJh0um0OF
	YjuSfBdXs2OOCRuxcqSs+NxLO/Xho9ZrUSSo5UPu9jH6WXQaec4YXqEo/QRoiqgS
	3T3CulEBR85NC1wDdFAWZJZ6vvxR+rhgSa7zHLULv9MDeaumEwQezmIkganv75BF
	re6wTnuPm369/+kqEmEs3ZR61QTptA/KezuIVUnVOWqYhkiNb+cgjGsQvAo8V/TS
	4t9kWg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9suf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:21:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8c0a83f9cso34605416d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747567308; x=1748172108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sABi6XhGs1bCKlXNTPScG9/B+zCKEPoTGmnHLCriUr4=;
        b=guhUZXZkUdJdnYTZRkYwuLrcKCqndIJLp+4f8DXo6Z9k5uSOGBVmsLu1p0tawYGNoo
         ltJHJEo6Fy5F9QFO4qI83ZHTtGxpXqSzVUIG5A1591cG+P2dDJxGiAgHoqN4tpa8U/vU
         dEvSjt++4IYBg+PnPnKdCJfqvbnhHPWszZ58VVDkdc/Y0PwMQ+LDQbMOUp8Q75zrG8N9
         Yn7MwHtHn85D5U4CXVYCRAIneKhwWO6WRtnS0bgrqK8uy4dqNpHqhfr9EOFpMxbfggCD
         03zAMLqH9DK9H/W+R8FbAiE2BLXKpsb/Hw6VI6UvzbpAZqbqBZh17tdHUvYbuEOLWdOs
         +Idw==
X-Forwarded-Encrypted: i=1; AJvYcCXT6HCl3tq9SyqhtFTBu0fflooi7EZjFxTrctqtnNOGbVp6+mxdfzcHTu1r0NBm5DY+0IGHRe39N85+Yqo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+AxpkL6ovt40B/7Yccuq8svp/JpZC0Tq84va11T8FpKSJiE8u
	YeECP/HSWuhe5TbxibyUBV7EwHHzj+jfwYpJDVECbwyKhHE4rMtSFkKyDKIUNpQGACtawYhgfan
	M94AUYkyP91XusqlG6iiHrwh5M4pq9qyp5KtdXwAR92iqVx1vKVFJxZrOZCeutbYXdGw=
X-Gm-Gg: ASbGncuoO69HOpUbmXIxtoPAYKeEhP7Wwjx6rq50sgkPu0Q4vhKzC1CQHd3o++2zd2D
	UG+Dqp7JW5J0w/BCHG2ea0czgP/oQ1VyZbq8wFs+sNkp/HyohAc3myvDltBYZaD+y+0BL6mbfC5
	teRSNqWIXzmH6QloBKKMPiwzJLlFSQFYULAiso0SKWByaN6EjwGJkJPr/0/Ri7QDjpHc/Rl9hzz
	P2iqxX+TMIn3jOBI08OC9IbJjjOYfwwsYNHm27rd61WA9PbPOG4F1HN239Qp8IxAYRZRaGZGM4J
	Q4h5J8ZwfsL3oIpvmqo2t7OIJoiKZudDPrANsiqefDV6Vs1RokMi+1HLO08fvITjP8UrJ09pkt8
	LkRaiFefKawSygxXKb2HYD9UB
X-Received: by 2002:a05:6214:194c:b0:6e8:9535:b00 with SMTP id 6a1803df08f44-6f8b2cf260dmr128257196d6.12.1747567307781;
        Sun, 18 May 2025 04:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFcUgho/JLy5cG51c3oJ+Z2XejBZAfxIZXNbtNajicQ4dVPRbo0expzkxmWH9oNfAsjXqHIxg==
X-Received: by 2002:a05:6214:194c:b0:6e8:9535:b00 with SMTP id 6a1803df08f44-6f8b2cf260dmr128256856d6.12.1747567307378;
        Sun, 18 May 2025 04:21:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:21:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:38 +0300
Subject: [PATCH v6 05/11] drm/msm/dp: move/inline AUX register functions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-5-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11841;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=APLj4YqcLlrz0cIrvDAgRzbbCjjVjcoBaObsvAKwngM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/UFwbb8dw20EcxLdT8R9l6r97G9d/8ZeBH
 ZB80Ar+iL+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1QUdB/9/8KqRi6U7axCK/gJQRDR8KDmmkGfGVAnrNgb+HRC2eyLy39j9/Diyr0cdn75g/GDP7j3
 33ooYPAkEDPQe3RNy9bzb3HIKKL1DmtocNj8gRdN6rCEWZW7yl4zu3ybdjLTW+7hh3DpZPgeR6b
 28A6/YKlc8XuSY/n8QJ7B/0inujcOAyuW+0tcqNeURI45fPG4m/GUB4ey2Hp7yrn8ZjHSl8PSbk
 Hw8+Av+4AF/YVRKI9T4kEgVtSZZc8Sxz80UXXTs/YCPJWmnaMYd5kb9AxiriQeu+Lo3yPWNw2Kw
 T/WUtqpy2OeVoTa3mS3OcDKuyUYQ1tYB+1j4HINRai+XJiiJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -tV94625GGWXJK-P1ILKnSFlh4J20RUs
X-Proofpoint-ORIG-GUID: -tV94625GGWXJK-P1ILKnSFlh4J20RUs
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=6829c2cd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=WKIoFzBS6WuvR4LobtoA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNyBTYWx0ZWRfX8N8W2yCbQVnj
 ojCQNrXrVfS2DiK6ntVbWWVAaahaycfhw4bd8NVrB0+tA3PKrFoU4oCFOdkwLYQqznEOcjsAyBr
 Q8lCRYnQkUj41/blOt0hImu/3Z6DIb741I5ybj8/2c3SuGMKYEoFbB20yrfscrmMedmXBQoOHy1
 /ME+vUTH4969uKeioVEDkM9F4BNercZa5bn0zMtUBsjuSJj4+2RLFG7LViWe1huTZJHjGNOzPz2
 j8QREHYRD0JZL+aVdLMZh1phANO1LjLuESOSqbyQQd5+GZezNufcShnE2SrU+M9DcxL+f66NopQ
 DCkjlHPylSHzzPbOSXMOWQA4gHD4syqP1oYOZ3ReeQKCAVt6AC2hgjgmXGjVTkJ0q44vs23WlZM
 YfG+0eQhdUinGyj+SR72mR/WjwIiB+jbmB4m7Hbt/vnX0RYx2vD4JVunGBfUvuqDwmhtaPDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180107

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Move all register-level functions to dp_aux.c, inlining one line
wrappers during this process.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_aux.c     | 96 +++++++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 96 -------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  9 ----
 3 files changed, 82 insertions(+), 119 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index bc8d46abfc619d669dce339477d58fb0c464a3ea..cdcab948ae7086964d9e913dadadacc333f46231 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/iopoll.h>
 #include <linux/phy/phy.h>
 #include <drm/drm_print.h>
 
@@ -45,6 +46,71 @@ struct msm_dp_aux_private {
 	struct drm_dp_aux msm_dp_aux;
 };
 
+static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+
+	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+}
+
+/*
+ * NOTE: resetting AUX controller will also clear any pending HPD related interrupts
+ */
+static void msm_dp_aux_reset(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	aux_ctrl |= DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	aux_ctrl &= ~DP_AUX_CTRL_RESET;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_enable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
+
+	aux_ctrl |= DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static void msm_dp_aux_disable(struct msm_dp_aux_private *aux)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 aux_ctrl;
+
+	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
+	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+static int msm_dp_aux_wait_for_hpd_connect_state(struct msm_dp_aux_private *aux,
+					     unsigned long wait_us)
+{
+	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	u32 state;
+
+	/* poll for hpd connected status every 2ms and timeout after wait_us */
+	return readl_poll_timeout(msm_dp_catalog->aux_base +
+				  REG_DP_DP_HPD_INT_STATUS,
+				  state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
+				  min(wait_us, 2000), wait_us);
+}
+
 #define MAX_AUX_RETRIES			5
 
 static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
@@ -88,11 +154,11 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		msm_dp_catalog_aux_write_data(aux->catalog, reg);
+		msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, reg);
 	}
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, false);
-	msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	msm_dp_aux_clear_hw_interrupts(aux);
 
 	reg = 0; /* Transaction number == 1 */
 	if (!aux->native) { /* i2c */
@@ -106,7 +172,7 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	msm_dp_catalog_aux_write_trans(aux->catalog, reg);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, reg);
 
 	return len;
 }
@@ -139,20 +205,22 @@ static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	msm_dp_catalog_aux_clear_trans(aux->catalog, true);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL);
+	data &= ~DP_AUX_TRANS_CTRL_GO;
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, data);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	msm_dp_catalog_aux_write_data(aux->catalog, data);
+	msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = msm_dp_catalog_aux_read_data(aux->catalog);
+	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 
 	for (i = 0; i < len; i++) {
-		data = msm_dp_catalog_aux_read_data(aux->catalog);
+		data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -336,7 +404,7 @@ static ssize_t msm_dp_aux_transfer(struct drm_dp_aux *msm_dp_aux,
 		}
 		/* reset aux if link is in connected state */
 		if (msm_dp_catalog_link_is_connected(aux->catalog))
-			msm_dp_catalog_aux_reset(aux->catalog);
+			msm_dp_aux_reset(aux);
 	} else {
 		aux->retry_cnt = 0;
 		switch (aux->aux_error_num) {
@@ -403,7 +471,7 @@ irqreturn_t msm_dp_aux_isr(struct drm_dp_aux *msm_dp_aux)
 
 	if (isr & DP_INTR_AUX_ERROR) {
 		aux->aux_error_num = DP_AUX_ERR_PHY;
-		msm_dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		msm_dp_aux_clear_hw_interrupts(aux);
 	} else if (isr & DP_INTR_NACK_DEFER) {
 		aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
 	} else if (isr & DP_INTR_WRONG_ADDR) {
@@ -444,7 +512,7 @@ void msm_dp_aux_reconfig(struct drm_dp_aux *msm_dp_aux)
 	aux = container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
 
 	phy_calibrate(aux->phy);
-	msm_dp_catalog_aux_reset(aux->catalog);
+	msm_dp_aux_reset(aux);
 }
 
 void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
@@ -460,7 +528,7 @@ void msm_dp_aux_init(struct drm_dp_aux *msm_dp_aux)
 
 	mutex_lock(&aux->mutex);
 
-	msm_dp_catalog_aux_enable(aux->catalog, true);
+	msm_dp_aux_enable(aux);
 	aux->retry_cnt = 0;
 	aux->initted = true;
 
@@ -476,7 +544,7 @@ void msm_dp_aux_deinit(struct drm_dp_aux *msm_dp_aux)
 	mutex_lock(&aux->mutex);
 
 	aux->initted = false;
-	msm_dp_catalog_aux_enable(aux->catalog, false);
+	msm_dp_aux_disable(aux);
 
 	mutex_unlock(&aux->mutex);
 }
@@ -517,7 +585,7 @@ static int msm_dp_wait_hpd_asserted(struct drm_dp_aux *msm_dp_aux,
 	if (ret)
 		return ret;
 
-	ret = msm_dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog, wait_us);
+	ret = msm_dp_aux_wait_for_hpd_connect_state(aux, wait_us);
 	pm_runtime_put_sync(aux->dev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index a22efb1e83d04cc5c9bc768a275df9cfb4752a2f..10dfbe94b627855b5a0e3cd4a3d77498d8d43ab8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -81,102 +81,6 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
 				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
 }
 
-/* aux related catalog functions */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog)
-{
-	return msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_DATA);
-}
-
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_DATA, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data)
-{
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read)
-{
-	u32 data;
-
-	if (read) {
-		data = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL);
-		data &= ~DP_AUX_TRANS_CTRL_GO;
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, data);
-	} else {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_TRANS_CTRL, 0);
-	}
-	return 0;
-}
-
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog)
-{
-	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
-	return 0;
-}
-
-/**
- * msm_dp_catalog_aux_reset() - reset AUX controller
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * return: void
- *
- * This function reset AUX controller
- *
- * NOTE: reset AUX controller will also clear any pending HPD related interrupts
- * 
- */
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-	usleep_range(1000, 1100); /* h/w recommended delay */
-
-	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	u32 aux_ctrl;
-
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
-
-	if (enable) {
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-		msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
-		aux_ctrl |= DP_AUX_CTRL_ENABLE;
-	} else {
-		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
-	}
-
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
-}
-
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us)
-{
-	u32 state;
-
-	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(msm_dp_catalog->aux_base +
-				REG_DP_DP_HPD_INT_STATUS,
-				state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
-				min(wait_us, 2000), wait_us);
-}
-
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog)
 {
 	u32 intr, intr_ack;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 10fd0086132092be88bb698e53124f87a906de70..d120a4872d444a4f8eb1e638d0e293033bf1334c 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -114,15 +114,6 @@ static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
 void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
 
 /* AUX APIs */
-u32 msm_dp_catalog_aux_read_data(struct msm_dp_catalog *msm_dp_catalog);
-int msm_dp_catalog_aux_write_data(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_write_trans(struct msm_dp_catalog *msm_dp_catalog, u32 data);
-int msm_dp_catalog_aux_clear_trans(struct msm_dp_catalog *msm_dp_catalog, bool read);
-int msm_dp_catalog_aux_clear_hw_interrupts(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_reset(struct msm_dp_catalog *msm_dp_catalog);
-void msm_dp_catalog_aux_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable);
-int msm_dp_catalog_aux_wait_for_hpd_connect_state(struct msm_dp_catalog *msm_dp_catalog,
-					      unsigned long wait_us);
 u32 msm_dp_catalog_aux_get_irq(struct msm_dp_catalog *msm_dp_catalog);
 
 /* DP Controller APIs */

-- 
2.39.5

