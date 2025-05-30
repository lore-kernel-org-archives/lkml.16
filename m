Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6BF278150
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627275; cv=none; b=dUNqm+x7OVxRdKEwnkFx4EAGKhN1jRe3U9js17GSS3YbBaga3xAoQIDPBUTNZdnQNJbYoJJvdnSNGooD2a9a7JjHeSSxoSTmBxji5mbVf8v+/MjRP5cSntXK2wdYfO0TPzjrKZhzSxxoh01wT2JHX2+frnQAEOZmfP0Mg7kZvkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627275; c=relaxed/simple;
	bh=jtEjy8chK7vSy/5Be8098CXoqGuk29fN/utLUxu+ZOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GD9//HKpJcbJ4xJ5OFl4jPn+cbIm/jA7w0DVpIl0o+2QwPNSk7Qzc19agPPROGOOAnfJWp9BHnJnS60ypIwk8fmdQTnqpQNntqm7vxIzqczFw9+lTwulZzHKid1jjBEUdc3lU2yXMVBDrwx0ArwPY3O2Vc6ltun75xh8TiEH6hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FdiuEyk9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdiuEyk9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBK7Mx005033
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=; b=FdiuEyk9LZOIgG2X
	DXUeU3BG9YY9qaVl1cdSaNsa6h0raHzjJnOvQfyRAwi1PGybqKpy+xNQcBzrI2Ku
	cCY/I78JgkyLDEGlxOSTKSIok5xGOxShzI79PVEjrH3k2wb/sEiM+O9tllGeulOT
	ZK6aBtOgpMAXl0RJwE7JDITFKtj8Wrn9bo0pDhVABQXtvxQK9hclPIvehpcWxjpU
	ZV40DScfxuiDgLrOMSxT9NUMydsg88GqRH+UcTsUHike0XJdxMvkkG81blPvoPMV
	Ye/I7ScILFkV5iV1K/4PhU3SA1pIG6Oz6rnxjYu407IRukFC3iRaaEU59QfhBYT2
	sSNfEg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek9s3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b2c38df7ed2so1680790a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627266; x=1749232066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=;
        b=oNX6E0FIhrSduWHMmjWFPqaclqK3Wz5fmWrVJhyjc9ohB7ebGVQQch/5H01Eyw0XIX
         3a1vx7ISj/em0acLSpvhylU91x00Ugt9BSVpWOjIB8r0kRjWY2CFUptZTKrZS1r5fBO6
         /7vFfv5FUDIeoWGAhGFIxibp6RnPwrz5TXgmDXi6I5J+NF3gEbrs7vshoiFUZa+R/f0m
         RapBnvl3cxnUrjNeRuwuQD7RfTg74CRb5BXxIuYAnT0pD18WsSzv4HtMLhCMXyS6xxhc
         +9et+3D1lt64tLVqstN5Cf7B1mh928lm5h1RN5UXAeLnxxiUNbAx6iDlf0xf7XQG/uuD
         Xajw==
X-Forwarded-Encrypted: i=1; AJvYcCUdjc8oqQpfl3ovUIluvP/6FfKGmmSJiLiTME1/3urV9CL4C0y2hnD3paesn89R5otK27oqiJ9xftqJwa0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSvfQ+7oSPCg0BuEOLJvIGUqvZAJgUIQU67DSTqEh7dOKqFBQ7
	SuLEfNpDq6cWMbVawnSmpRDeAlMyospXeYlrKAnQqlrxWuvEDp9fFwYQQUfUQcC/kWtNsgTrEHr
	vnaPJq9QQBDlBozyV7uV6zk1t1XPeZZvL2H3XjS1h9qq0C8cpvSBhnCd2DbHj9JOMdic11pcyIB
	0=
X-Gm-Gg: ASbGncu32wt6gHGreJ7yFe2R7ciEX4CZCy9azuAF6n478WZvXhldFqk/Zn3I5CTr65B
	v1K5hx2jx24Rqv4sCqSHDLO2D7i8PMmkqIbV55gHnPhsAUbWBE51xrp99WxOV0w5t0vnnzgAtsK
	jyoXZukynSA341FM8frGHzzzMufH60uRW2+QEx4wjvkLITUjhJp/+hPOANNL7a2DhsgjQAwVZtl
	tlpnaEnyDrs730xJHfozNEQix5m5u2kBvrrLJg4uMF37JuBPrhXKsw+Kv5wO0+gRDFSDJHmBv4j
	k4yX9Vyxo5Z3PO5CDx7+2gLp60fjw7eHB+RoJszqL1XfEVFmjWeYlbgOXlGiS/cvx24ZzgD1NGK
	YDrXInus=
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360809a91.7.1748627266105;
        Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44Ez8w2kSkFGiWXJyTRDICpcy7Z7sFhIreQn9zU0Akkst+TmIzvezQ7ZxQQV4CDoSwIXaEg==
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id 98e67ed59e1d1-3124150da88mr7360740a91.7.1748627265598;
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:25 -0700
Subject: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=862;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=YcjeN4u37rChhC2e9vyygUDR5/9ourQp/Z4Vjz3aqaY=;
 b=4V+1vbUqjNallDMi4o5HtOHP1e5c2KVcVyGeo5DMGTjvm7tRoaV9zFs4DFYTtqTv+nTiRbwRV
 6bG9bGyWiyOA8qrekpoVJYMfqPwDIHSo3Bka5HIDElilp0rnW2u027w
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6839ef43 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: spUf9QmWhlN4blIXhoIuLhw0BPVe5CD6
X-Proofpoint-GUID: spUf9QmWhlN4blIXhoIuLhw0BPVe5CD6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX692hx1WMR6mi
 frNAWxwk0h/6Z4kv1Qd06t4xssvt1dHf+beqdjUSepU9risE0087qHRNS0XIvaes1/W4+LfzLzE
 zLG/QxBzJJF+AsWqgkn/2rQ4U4TljWMwiL9EAowxh3h97Yyl0RFg6DinBhuS5CqHa7QDCznTRuT
 GvuwVg1j4yMmPgd/ApmVf1I/sp3gxmdNWsAXA91PzxUqTh9aRjleujoBfMNtbbIPXo+VnUQ3Q3V
 QFZMs/NGomEUCHeLmHMi/9uROXEeiGBwmbw6Prq7Qcwt4WPux0FF60kloPuhCe16i1RZt/zgkTB
 zBpp7uuAggK6b5gPPQrFN2O8IhiVXl+dz8Dic1FFkzIamY3fZzu4ELhbkvkbDLmEvc83UQqdSjn
 S2uOVpGeumora+xGGY0ulVSzgVhbKSYm4/waKvDu0MS4QFdRBwJtpLPCd9o/+Qbc0H43hv4i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=844 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.49.0

