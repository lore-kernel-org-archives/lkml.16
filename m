Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9A425760
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 00:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404103; cv=none; b=DPmpE8GSdie3VpFwAZg2U+CE6TXdVwYnbV/9N8SazzG3fMZKz+rt46uVNpdHUGSgmAIdDa5PQ82y3l91uqW9E536v6IIlR3RUzRbRMaCQu3zeUY5JP9x9jAulq+wHDziwlzxZRTmTODfKi8zOac68f6076LmQV1Yyq+NtlA/XHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404103; c=relaxed/simple;
	bh=qPjEnVJcWHzZbV3EVkbm0vz2YVbx//bPP/IZKQShGaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SNQSPiKuty/soAOrjMKL0Az9z1L5rSDQo3RcVRkRO62YYxnHOOAk9T7MJUT+av10hjcd1IfcTamzW3DwUoC08QPHIwcLeVX751mNdC6rKBhAoW7/vVZIvPn38VI1fshqqYn1wL5aGU+V+74R2h9rrMBE6QoYzzn/05OUfwD0A8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iqQr7IVh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iqQr7IVh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MunD1027975
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 00:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=; b=iqQr7IVhBWyGuD89
	Kc7IIiWFNIJyjp2lJ2lUfGhfrSq0c7ps7d15ZlvSUuLYl0KDAaxfNKyp1ZsEEoLJ
	hPqkAMmlKiUtEtDsRKDs6PMNix3VrTYBULTpdSx2vaY6PXhD5566ZJShGyhyhRq0
	vc6PnKQFyG/vlgVpKsnl+FrQkdY7F9Bwm6lR0/SAVlUY7sCPcHugCp71Jn4EF0Q0
	KORFcHAemuzQRNoJ3ps6oeG4cxWJEGbRU8OsGR5VyI035vkF7MJB+H4EDJHyeNsM
	W0VC5PACaPQEhZ8bdB39mHsD3rGS/3DeKRXt/CNbt2E3+AWGaXaY6WseR0UZ8Y+N
	Uip2RQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 00:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c790dc38b4so697816985a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 17:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746404100; x=1747008900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70R5N83II2gknlMbdIhEMERE7CMg2dERyKgyccEkyWU=;
        b=crlICfnoire8ZRO2FHImW7L0ESgJF3emKqFYHRxcRiswJqDZOp4wtkNZdW2KEclnDz
         AJj2Llk3EfA4sDp55ptXxblgBhD3eNYj82vEzUYsNwKm0eqEUoV4xaX5PafxBSUr3mwG
         PKTBctvjX5UB2PcFu91Sc5Osf7ZHyKuRDElqUcmrGoQDBVgMO5PIKmrN4gkASE+PWuwZ
         hz4MrP6U4unDNKcAXqw8NVmYGr1KcFJ7BAg0Zkp7gWQMf7M1TibDHGdugtq9ggd+rGTG
         DWnbp9lhD9pQ6soLaTtBt4brxLeW5OODX0wcRWWsrpaj2VD54BVUrC20rk6phKBK4ZyQ
         UmIA==
X-Forwarded-Encrypted: i=1; AJvYcCXfbxSNs8fy6iGz/fegGsL3L3K1wPs0XQfMl6vdQC2iWKokgH7h61uMBiQzVA/ex14MkF7qalR8ITWchWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEro1s2M+ljEMXHRetggTOucfWh1YwGpgMMOljvmC+ocHYQYqP
	OwoSUKWV/0zZMb9vV05WtSZiGuCjii6D7Z0cn0Pi0F06FBP+VTl45Et7AvsQ/99XOOILp+vZLVU
	+h467tLc3EIFzEefYYQBlWSAOC9qegXnk56NQ/k0qA6NEwERoTTE+rrcnoVUNfxA=
X-Gm-Gg: ASbGncvQ2a63I7yjvoivJYMI50Ra3WkL+YvI7A6rhCz5MTtFYm/axgqK26cDkJZyXqz
	KPoEL1cm235Iw6jzEQJRvTx9MP8lzSbra0X4OBq4SJfQ/pQKU+3rAuuRr5KZTBgR2v2nxWbDoNl
	Tdmt2AYUSnecPiInawebtkPYLqofjicASF5IHpzH73iaW2s8pl0QYt0TkGQxWeq2jHg926X2+jn
	mVXnyxs4RtZ90agdgPVzhVHF9TbaqXAwjPj0dkle5XEKZoYNC72vnUcxOJU7l6y34MG4Ip4CiAY
	CRz99y0LNj12fE20sznuDNXQp4t+EcR4OGfmK+KbPtDmAcWL2jn5Hi6yuxzxzD+d516afQsoCIe
	GwU3PICQ2bAshuOiGe+B2uFfx
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id af79cd13be357-7cad9e8d908mr1091029885a.22.1746404099967;
        Sun, 04 May 2025 17:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRhCRNcvKG5ymjFE6pX4ZnRjXc7dZtbqrZKKdZ0iDjLTptYnzUJfbnAUIC3NcigRTH0B1TZg==
X-Received: by 2002:a05:620a:a4a:b0:7ca:d9e8:d737 with SMTP id af79cd13be357-7cad9e8d908mr1091027485a.22.1746404099646;
        Sun, 04 May 2025 17:14:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 17:14:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:45 +0300
Subject: [PATCH v5 01/13] dt-bindings: display/msm/hdmi: drop obsolete
 GPIOs from schema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-1-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gcOjyAZkXuR3SrOQQtUEYQYbb60rDFhov+Xy2NtQ5t4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7tA9sxa/DweHnrlNpCUZI8ErVU6X39GuyJ
 8xVcAVW1ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1ccPCACgPWq8rM5hryfozxB2ZWetX4xJ24yyrKuD89yYi6VrlRNmyhCy5tuIwVtGlxtPWIPNhQB
 dTWXqSpX1rjDTAELM4B4E59M4ZOn5EMf4QASI7RjO1QxJgvB/oh0RISwTAD41x/DhwsAZW9SYsT
 7HujJL66j41R4uEvXSC//FCkBhJX3lq7m4V2hohlH9NDv7XrBFEGThI0sEM+nzA31Baya9aD1ML
 YEeMypT4BBlpR9/viELikD8eDcvX9mdZ6jxJ4Rq17H/+xAqxGakHWKGUSD1ELIUKf59jy05URF0
 TWRcURDtUuVLJJwIk4b1XLXof83szgUS9+yy+Nf+hHiy1l8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EL2v91LqAaXS3Zn3YmZMSPunWiHZt3wh
X-Proofpoint-GUID: EL2v91LqAaXS3Zn3YmZMSPunWiHZt3wh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX7UJvJaE75Ged
 yR9iWzE4NFLJMZIRjmAnM1drb+4TIopNirbFVO/TTKG8PD3AWvw3N/DFPhTySNjehPkctKTn7Cx
 /2TmmdOHpBxxwRNiNVaoziYvVSS/wblzC694qOUPnL1zI1FvHeKESZ57K3mWeDKXumMe/EnMPqe
 Be2lCGLDefVffsyWV4q45RniSjlZJqtFKj9xe17yBo9/mZI+4jw5D5PugsoUXfAqZgh+HPERnux
 1bbIoXDdyDpdEQKy2QI3CNtvJwnsh5qjWej77viDVwXgjoIot0DFNhWx7lYu5apSFN6A/gQEztM
 Kzm9NS7r8b+Ih3gQ0HF8dEByoOafMplNr2rDsnMswWaAayElUoEIrAPnV7xcEXZBD8DqIChzjb7
 xTHnVbPIEgZZWlgD/z/Uw4FDVe9Ej8RofAQh1lb4Mvl+tdGwETO9cKj9riCsZ7FCJF/2jzmO
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=68180305 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=Q0eG0X4qb_EmYOw2QsEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The commit 68e674b13b17 ("drm/msm/hdmi: drop unused GPIO support")
dropped support for obsolete qcom,hdmi-tx-mux-* gpios. They were not
used by any of the upstream platforms. Drop them from the bindings too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index d4a2033afea8d4e4f83c9859f8840d30ae9d53f8..7e6f776a047a00851e3e1e27fec3dabeed5242fd 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -66,21 +66,6 @@ properties:
     maxItems: 1
     description: hpd pin
 
-  qcom,hdmi-tx-mux-en-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux enable pin
-
-  qcom,hdmi-tx-mux-sel-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux select pin
-
-  qcom,hdmi-tx-mux-lpm-gpios:
-    maxItems: 1
-    deprecated: true
-    description: HDMI mux lpm pin
-
   '#sound-dai-cells':
     const: 1
 

-- 
2.39.5

