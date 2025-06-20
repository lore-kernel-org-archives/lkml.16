Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4FC28E579
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430607; cv=none; b=W6w3Hh7UqDwq5qro4VoB5Nte7gh7VmzoyyG070gdpIYm/wODZgN1wAtCJrM6Tmu49CRStEMHHiH6TfOB+hvKZ2xvLQuaXMY9c/8rpCx8rKwaRYfDHuc5W4HgfCHxX5w7rhLn+1Dw+U6Zhxwab+Vki7cSD6qDV4S665pHus59Rjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430607; c=relaxed/simple;
	bh=S1RTIuvrxbs18DrRSrBZV5jFdVvNctny+MOIL0Fxzuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WMl9aQh5+zWd/VyxFp0WLi0iSKsxzrnJ7rdFhVwPNb1Us8TnxzQUIP159jQtfs9wfm6b4ZyA0bwTFyGUiQWqNIfL0ODd4KHWU4+eKSLea8pNvIa+kbDDnYdm6S0yRaaD5LPqu4oqCCLUJJz/TE1yJjRxmXlGnXmOSAQ/5IXyYtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NCA1p54R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NCA1p54R"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8dDjn018217
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=J+2lD+C9IWf
	fZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=; b=NCA1p54Rd2ZCYrDO02fRdPJ2iGl
	IfVb7zMuZX7p50zl4CiuIno6CGD6xuRSScz6Bw5s+JQGFyS25QIZXVlIK6FMi41h
	lM0uxwQr9j1q8L0COi7Cp8WURrqQ2yuJZXXcoDn3Lo9rKVy6dMe3MbPqe9ROnA77
	hvpzs4nasF0Dne29rH9WCKDlfeDhKOku8Gy4OO8/rpzLLD4uFbd48UgLMI/w5GBK
	QLe4LvLkEMZqyw5kEun/FPE+RQyIoTmXt7N6GZ3OgnATlVqVzQw2FuL2Qt9CQS9W
	aTfNo+O6srT2ffCF+qUPKiLgbnNLZVxCU3RHeuCXc6uTogewTYIRQXWsLzg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mug0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:43:25 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31ff607527so106618a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750430605; x=1751035405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+2lD+C9IWffZ7fGhqdCKCWgMv52ErT3dj8LA8hqs/4=;
        b=d5uzLfCY6dnBI0LkFHZUjWQTsHclJO5hSSMG2Laf9AG5i7tvF4i08R4I4hgY7dn/ni
         HAtOmHYEOPG1uDnqF7g8ODHKeMa5muDuYstlsBrVrvOXlU55KYrLA6o1la2Pi9SxVRw5
         2h0R3/oubJ3hNOVSXHOopGfTQMA0ygQJAvBqX6Ic6m0o5pD2JojF6ZWgWkVcfnl6xDuM
         Yug984vCqzam/lfEcTT9kP/G7BAwNgthRJ2T9JcEtdAsb/t3z/6pUCZjK7Uxs3VXYz/A
         k456Jg72XKmP1d7xhggeGp/c5EC+ST64wLd87SPFKipASpboJlNwORv4IDO0/H11UNfT
         pMZw==
X-Forwarded-Encrypted: i=1; AJvYcCVxJCXyb4b8IICbppJ80ii3xBV3CG1VaFca7HFwHX4SmRrFGIOO1ZnO3cgpbJDaiFF0Fw8m7M+mn/eC6G0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWx0cefWU/IN+HqbRdYEQhpjiEnegmsyD3aTX27mbZmPBObDHW
	wug/JFZjuoJhvTP9VEI+GdMrFCdvj1ovCPkv9jSo1hZse6uccmByJYRwALspLG6Ww98ThjCQ4to
	hwGZ07IsjE1EykYr3V5bwhzHYcrFrL7v9Sijmme6G3qpkPZ0GFt39TF33Jc51Z5aKmXw=
X-Gm-Gg: ASbGncuEvgiD6YTUURdwq7hVX7EAFRtq9IDORwUbiECuZoevYf3ISl7LMxY4EJB0nYV
	GQw32KsSgOrG/SMSvP8Kgqfz7QCpLpntTlR/5rI6tREdYgKC09RzuCvENCrMroLSobaQc2drHkU
	/r+NbCFatRZckohXjQMHznX9+7vHZWc4sICEcVBqcI9MjDHhveDiLV/y5AEC2vgiRU1uWMaOSTq
	bkTcnV5FGPiNvxWoLSiSMrMBvWtDDSm3TSp/G65262bawxSbQ4lVM8T28JvzGApgrVirbHx9vNH
	RygEsXq+Q63kMMsxUqZSF63Y7cCMUlCR
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id adf61e73a8af0-22026ecb493mr6302525637.31.1750430604721;
        Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH4frWgXICqPFw0JBjaV+WPfDhCyw+89W/qX0OyG987B9ALxAgWvGk3pHM+gFofmw1YVoc3Q==
X-Received: by 2002:a05:6a20:3d83:b0:1f5:9024:324f with SMTP id adf61e73a8af0-22026ecb493mr6302481637.31.1750430604342;
        Fri, 20 Jun 2025 07:43:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118eebdsm1609718a12.6.2025.06.20.07.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:43:23 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/fourcc: Add 32b float formats
Date: Fri, 20 Jun 2025 07:43:09 -0700
Message-ID: <20250620144310.82590-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
References: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfX6TX8s3sC68XK
 P/4cQLG4rA31KhoXHY1RrH/zQqOA445cJkVrV49uCYqm//9Z+g1KwKLsFL2xeZ/vUwk68B49fB3
 +/sKiFymVg/lxUDXEkVU+/r7F+QB360WBu45nCo7CewSYy2EjoAHPMzvsUk1zVQzUehN7kHQO9s
 ymXaVsjksC/OxrzKCjpydFIl7X9sx8R0eVMM4bkIsQ8kIRLyZ49oRFbkiKEhTFRUSIz3FUcM7b1
 0MaBLlZlCNROvzArmrv9yvFRO2tjRbNy2I8T930VQwnaRBR13vPhMTMD2a/3yVZxkkluRb+1Lby
 HkgFMn1WT98TlfajhkKdabghcNzM11R+h+ybRTv/ophYQ80XQAiBJVQV/BheC01PEI+yz9BrRGv
 +gg3SdgTsFrQMjEESLDtqvyJOlOGQJ7mq/iFMzIKClG25Js2/OC8l9TrSvc7G2fopEVXkRBR
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6855738d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=n6CFGpYek-_V9AMlogEA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: psmjGhBkUiIj5sbrTmNV5fh8aX-ytHBU
X-Proofpoint-ORIG-GUID: psmjGhBkUiIj5sbrTmNV5fh8aX-ytHBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200104

Add 1, 2, 3, and 4 component 32b float formats, so that buffers with
these formats can be imported/exported with fourcc+modifier, and/or
created by gbm.

These correspond to PIPE_FORMAT_{R32,R32G32,R32G32B32,R32G32B32A32}_FLOAT
in mesa.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 include/uapi/drm/drm_fourcc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index 3560ca1ffb8b..abf47dfcedc3 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -232,6 +232,16 @@ extern "C" {
 #define DRM_FORMAT_GR1616F       fourcc_code('G', 'R', ' ', 'H') /* [31:0] G:R 16:16 little endian */
 #define DRM_FORMAT_BGR161616F    fourcc_code('B', 'G', 'R', 'H') /* [47:0] B:G:R 16:16:16 little endian */
 
+/*
+ * Floating point - 32b/component
+ * IEEE 754-2008 binary32 float
+ * [15:0] sign:exponent:mantissa 1:8:23
+ */
+#define DRM_FORMAT_R32F          fourcc_code('R', ' ', ' ', 'F') /* [31:0] R 32 little endian */
+#define DRM_FORMAT_GR3232F       fourcc_code('G', 'R', ' ', 'F') /* [63:0] R:G 32:32 little endian */
+#define DRM_FORMAT_BGR323232F    fourcc_code('B', 'G', 'R', 'F') /* [95:0] R:G:B 32:32:32 little endian */
+#define DRM_FORMAT_ABGR32323232F fourcc_code('A', 'B', '8', 'F') /* [127:0] R:G:B:A 32:32:32:32 little endian */
+
 /*
  * RGBA format with 10-bit components packed in 64-bit per pixel, with 6 bits
  * of unused padding per component:
-- 
2.49.0

