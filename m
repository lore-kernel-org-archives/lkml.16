Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C2E25BF0C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749640565; cv=none; b=DyMljSiGjq2WE9MVfn4fMuphHmSJ+Gz1vUpZUl/q9KZH10j4SFDyfvfng6hVrdrV/eM/MxIYfKAv72uWMQYShSe0wXpjq2uxS+bgwgDaOq6ecghxyUBfrzBOJG7nEUlEJlDDlwnCWT0uuFqXowtbHbXu16yusjmnsKHcfACcvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749640565; c=relaxed/simple;
	bh=lHxIg8z3r4MYFlwLi2deHZy4r/sg9/34BnWytVOD0js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=chZcw80QtW1nkF3EZPzQrG/tn8gxeerwcW7MIrmNmRx/UtAt0qn5YpZ7qkHvhgzhURr9pv4DjxDEbuLit04fc0Y7flI6HUjYUG6vFSFmEreSGPbQsBYi0HcPCtg7boZjNclpvcWzi6F9ZOa2wqXxI9tANsGxblh9RPXaWoxtCsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C0RsGiU/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0RsGiU/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DOsP030455
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=; b=C0RsGiU/UHg7iW0p
	svVWXkU0RudSs9AO5l1NmCI7crNwyH2hWulQoF5yVRPLU6Mk/cf1sutTnEBNBlfN
	8vp0rUukMbBibpHBnVWJof2ELlPAWbMYV7Gzl1Xw+aHQMu3A3KW08zVCrj19JWtH
	PcVLqZqq29NMMKHEoStPP27WhjyvClIOI59gF0su8zTychqWCIgDWW/fAFV+F1Yn
	8bmjzOGSzucXTq9bwnNNldkyRkuqeSt/9DxSarOUaYi/lhZkfRjr9ngVPuLyyTwx
	30fXizmPwOi11Ue4ZnJOe+08ZYVVTDYvlJIIab9Ty9+ULKPC1Y19hwOGoLM2JoAA
	E8WQoQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d124rkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:16:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-748764d84feso347823b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 04:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640562; x=1750245362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=;
        b=cL180AlpAM3wv9xyRPaxyfrf5FpmotKw4Q/1G/yFuorKbxYA2LvTZVd8oipiEqCgm7
         +J0LpP43W+s4cVHSOTqeW90VuVdzmgOPA7GByG5aH7BW3au8e2k9lgrgzhLIOlRTWq/1
         OSSX7nkF5GJUQXFlE3nv1p9ZebLh4ekyYGUEWlFuR6/g1b1qkKVTUk5UiVGb1lfQ/r70
         xEuiJz1nml6BVgGAwBd7XRFrn+Oo2Qi0xNCk12TSOw0L94VzK+WeCQUHX++ge3pH66BY
         Vuq9/Bo5eE4+EIDd3T6mTJabM+zYy0H0I2aUX3wW0TQSY95PJGWjIbPBqkoFRSto2cqs
         2/0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzlqoFCRv8WDQhP5mxdNJ2K/OBSjkmZJz+ExShbpKTWZecZuOHEmzkQG7aPA7x6IGnawIbE9HtTPmKj80=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGf4L52eDQB/X504NmpgVL0bRvH2HS/SknnxKVNOOffBcexSU4
	10IiPI7aGTyogFVFXc8kqvToPXullcKV1Ox/bUwuF3SdfIMWZNfIwYJRZH7151bzVKu7EUF2Ctl
	svxzeFA6H1NlnBy5at6OCiMQ+g03qDDyXjcWbgp69Asn/6CCD0zPuQib5XDLNOVK/RoU=
X-Gm-Gg: ASbGncs4Ccg6CNINZvVXZ+kGalI7T+nqVHSirXRgNM7HYCFWQs5e/pWTQpieHTvCfV1
	7wGC0NUs2dZCjYYbaFCONo4NpAt7P/LzY998spMnqA7wZrCjfSZY2QYpZudo3463+1YUNFirtO1
	L+vlRaI0jcoE0UI3GxSCoupxMfuSLvs3eP6u7hhmAVosQpGlFs/2MaXGJ+TNZR6tQaz+uLcJVCV
	za6GheiZDbHrhob/AwKpkgep6cVK0z/SL3MJpnReD3cmCbYlXjD3OMFpCFpntAiOlROUOgaEBjf
	XTa1OePUtuaxcUo1umlb5i7EOB20MLn+
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id d2e1a72fcca58-7486cba09a7mr3858966b3a.10.1749640561969;
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHROg37CoLQX/gpU9C5YtRVK3WyqImgZyCmQYBDNqko/4jqswI6HbSmNXgi+XM35/6CERVSVQ==
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id d2e1a72fcca58-7486cba09a7mr3858922b3a.10.1749640561603;
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:31 +0530
Subject: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lHxIg8z3r4MYFlwLi2deHZy4r/sg9/34BnWytVOD0js=;
 b=ICq0mXqikfLYi6zoSoY7dUbF11OEkSXzvry9bOOUpbQi4bPFyVr+Va+GQM0kxxwrsM2sVUL3o
 J5HOSoxdbY9CddPxQ42d6Jw8+7mjv5B7uHLuEWJY1k8LDyEMdilimZ4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: IfI5j_x8fbrvW3f8Gtj5DLWuuBPmZFVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX++Fsf3bI40p2
 grzHRqYmnKbPWFxa2wLreNKXba+8FySqjISAsT2TX0bPKrfywHheQYjgOOEJVnqo6UTs4XgjHad
 0853w763mr3rKsm6txyBOciNQyPR8H+OjRjRvx0uxut7yV6plzO6HPnTIQ+V7P0ENsQyf2EsQnL
 xFxM+rSXGCxJkoDABGLR1WzVRL21X6QR8BNUJaPE4HEMdv3PRn16iwp4/n21ySO8svnjSemuuZY
 rQWZ9253BuqQvwyneBYdsia4Qb7PdyMAsK20GtLgKrHDK+gHkAzFnmgCdDIMIoKf14iK+cyVNbV
 wV9QVpDx5bzU4gFUvhIoDVtmRmTcNQIgWwnSt9xSpQKhIxPlC8UkIFzGDw91SERh5GplTZkU5fd
 QP4vNRxurtrOH/PCil7t04tjFfPwyzQR2KFOR/YvGIGGPeFf8I/fFewImFBmulNg5AFmeadN
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=68496573 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=j--r9fh2p167zETY0CYA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: IfI5j_x8fbrvW3f8Gtj5DLWuuBPmZFVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=889 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096

Update regex to allow multi-worded OPP entry names.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..bba95799919eb52d12afa42354ed909d0ef3c627 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-?[0-9]+)*$':
     type: object
     additionalProperties: false
 

-- 
2.48.1

