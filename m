Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E510C21E0A8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603251; cv=none; b=jpqcl2O94uXCo/TXz9vuf0zcCSUkrE74CUZZosof2f43aabF+NDqL45MsnHvHUyAr9+N6o0u1wS5FwIHXjAktcYPKqRs6oFDPo53BmP+aoVxOT7DjjMTVofEurrjDhoQRMt3ZQtL5+Ug/p6JUj7BBB64P9VWtjGomlwpqMBQDeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603251; c=relaxed/simple;
	bh=jeIMQed+uhzxiHzwczupq3qDXNwJFo7QnV0YFmtUdKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cNUiJOOj8AYneUBLsvCOFdBzLqeDslM1IjoBwEc26kQujm3N/VHldmtfqYSOhSLGgSIMFkFpifOHdTd45XhNu+bvfpQ/2XwnbbHA8eXUlnWdcN/lq6mOjX1HGNToIecaFwCvd3J++x+dP5YcHSFLShSUWLtvCYkS/8QQx+oXVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H50Jsck4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H50Jsck4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqWQ031934
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=; b=H50Jsck46/XBOyyH
	2uTn9Sg1nnIR+OX36sQ1VNWz76D/kIRmXa1660ZyZN7YM6RNhh9aoqIC1w7Sd+D8
	vKBwQYRLqz6ESuP7mCxzAfUWvqAC4ZIGd1y5bBQMGS4LMIgJtG4oM8SC7zkQTzQ5
	vg7BA9XspWQJiRosugXxYOycvh0eRGWlqSE3FIdF8OKTR7Y//saWMUTmuZuvmFOt
	9DoHs6BGLu3qFLxZ8HS55CMHqA2iZQVhexgoLdKCAAh52b4BlitdPWkFtXSGmP5G
	AH9IvJgWlxOZOcpJ0zsGhTmo6PmqTRHLZcTiFfpojTj1IcVGwCv9vkTgFalMlwJG
	L7ad5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy9uvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c7c30d8986so702207385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603248; x=1746208048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMt5GZOx7uYmsYsdVhTOVMnnLqkVcxRiQSTdVu7Zads=;
        b=d1qEvUrtSSfOBvdK6sxbHKNJVUw/6D2n8wtV5JxKPHlZ6TwLPDzbAtZSr2hsC6hXFM
         BqiT7bGEt0DteybI/b5omZCjC5/Dya1VPAjj8+YyP1q7CRxdovfuoiN/krTPz/QSB4fo
         9kiOTuM5aN/g5S5viP2w/mWtDSVNj5wSUGy6I+FS3VvkKKNWwwNIW7+y7QB4popf6J+T
         0+NrLRS4SEDP0Zj5lX/YkuVkPbKvLqMw+HHjjk+44up0c4a7zyAYMkg4t1s3b/1Alk3e
         gYhKdI53dgvcClF1IyKqrXQpdoHy09nrJwz21h9rSrv4OLtv5Dyf+KdIwdP9xV/qaVTK
         kp/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqCABcYx5Hblqo618bl6BHMMsj7LfXUXNd20Ewq8wHxBsUgtQ+uWLZgNfi6I/YHERR4LRqbWu5y8TJ9lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRamHI/NtoZBZO+Lf+JLLqU7XukquHFJAWpmU750sys5G9JvQn
	eTRysDXXEAvWW2/0D+LuLkFo69TWny1bisCcbCx/hoqTU1Fvb3TQQxl+G7layMt4BZ+24D4kf7+
	ReVLZL++5Cc0gr+vOGYBoEW5RPyg5S9NxswBlTkua/0lZj5d9M0VA8Yvpv0h8qxo=
X-Gm-Gg: ASbGncv/zxwaCElJ+rXPT1uLztQvIBmFbMCp85Q69lNhSXxbcKoH2mbTeRhGKRPR9Xn
	q+ZBCxkgZiPyx6HLnY/WZgT2h06xUd+4HzlRvoWJnv0TD50L9Kzm/viHes5c7bVNCW8973DovoT
	9hSpQJDp23WWmU85NLtyV4/gaPxv3HzNl5ME86iLYW1P/94S3ub4V3cQl93WSq5AaUx1wg3IxSk
	bxZgeblEEs7OZq73Bdiz7d85E3uxUWsT2IEAkrfGmfPZmYa2R5PTrQajqh/ZsnwiwQxjVFwGcwT
	VJ+CUCAtqj+QHpc4dZu7g506ht2x6NStLkPziYey4tLW4hRe7WpH8I5md5FEKRls4ZbSdgCXZ+y
	L0cTTvmHw7pR8gdpnQb3KrR3c
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74049785a.38.1745603247884;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3trC1FSJEN/SFa9CDGpvg4Ez7sMdjuNRyKbDHpwzGHtEBvX6Pm+yI5Y6p6KdyeAWMtca/tw==
X-Received: by 2002:a05:620a:28d2:b0:7c5:5d4b:e63b with SMTP id af79cd13be357-7c9668bfd12mr74045685a.38.1745603247520;
        Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:11 +0300
Subject: [PATCH v3 11/11] ARM: dts: qcom: apq8064: move replicator out of
 soc node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-11-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2411;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jeIMQed+uhzxiHzwczupq3qDXNwJFo7QnV0YFmtUdKI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbXu1dfN24xb8xCz+9ApPZBycXaRbf43SfV
 NPq6v9WU++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1cx+B/4tqUNcdPfM9qIM50AHK4Bh5wV2y38lX12TL74q7WhA69pbPY/ng1rmKHkq+xlaeam2QQ0
 Ut9y9dKOd8NDsoRDf15MTMxT7Uo89JpRyzVWMDx1KmsGOaBHMtDxti6rQYQ71iEQktw9z8k6/Yh
 czOdGxtrFF5dGQyc4DTfpnSGk3FgCvi6WMN10fApn1WmDhYu+rHFPSURkt6vYrjjfr6bJjcLlPc
 bWwVk8u3QVIHaeXtbMVIq0quw5ROZT/b4LFcRGG2ycPvY5ZSfVup+RNFy70p4N8abSUjKx+UYa2
 5917GzZUEO8I/WhvOcUANl9c0SEVRie6YtXoS+zzUUx3QHUd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX+yL5DCz834QZ lPth7ZnxGcn1DWQOYH0FcGlLSjBGORmTd+XkqM46kbHZqxkKQtwfdSxLQwMNY5aCSPdiHtZT4Al PuWbW1Eyoy0X+RREv6rjEYdrmrA8fuPUbrYhd3nMkBd23/PEIE1HXg2F6PvirGkcUbgsZF4Oghh
 Ki9zGcoQqoRbf2hlmW4fPxL+gmaSvl9G33yBixsZKLaxFOwZ61e2opqW6JLa7v4SAs2Uc6QIbV8 WA5ZtC8gqKV8M/QDyh32AWSpkqZr/ftioK9xuxqDKIb/llBPHG3sgYW7YLyjdT8eBMadzyjmRl6 oJIcmYIFK17ItEip7Aahi0lfU5dIQG9D1JBpk+ZsNDpn1/gWHPCBE/2ZDRN7KzllPcLeQFIldj/
 KsefN5x4BUuFu10TrJDqgCXA27oM73LDFGHAmbGei3f4A4C0IuWAsKa6ve8SLXYcDh+EKmox
X-Proofpoint-GUID: XOK0AaKWPwxvcUPFPa2hsHUKI1OimiCw
X-Proofpoint-ORIG-GUID: XOK0AaKWPwxvcUPFPa2hsHUKI1OimiCw
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=680bcab0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LFh-nz-jDHZ_m6HcgWkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=951 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

The CoreSight static replicator device isn't a part of the system MMIO
bus, as such it should not be a part of the soc node. Follow the example
of other platforms and move it out of the soc bus to the top-level (and
reoder ports to follow alphabetic order).

Fixes: 7a5c275fd821 ("ARM: dts: qcom: Add apq8064 CoreSight components")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 67 ++++++++++++++++----------------
 1 file changed, 34 insertions(+), 33 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index b6533630e347c8fc5e3f0791778cd05760b3f3c8..b02e6739ccb20a287095d8c3e212040e4ac50fdd 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -278,6 +278,40 @@ scm {
 		};
 	};
 
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+
+		clocks = <&rpmcc RPM_QDSS_CLK>;
+		clock-names = "apb_pclk";
+
+		in-ports {
+			port {
+				replicator_in: endpoint {
+					remote-endpoint = <&funnel_out>;
+				};
+			};
+		};
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				replicator_out0: endpoint {
+					remote-endpoint = <&etb_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out1: endpoint {
+					remote-endpoint = <&tpiu_in>;
+				};
+			};
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -1529,39 +1563,6 @@ tpiu_in: endpoint {
 			};
 		};
 
-		replicator {
-			compatible = "arm,coresight-static-replicator";
-
-			clocks = <&rpmcc RPM_QDSS_CLK>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-					replicator_out0: endpoint {
-						remote-endpoint = <&etb_in>;
-					};
-				};
-				port@1 {
-					reg = <1>;
-					replicator_out1: endpoint {
-						remote-endpoint = <&tpiu_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&funnel_out>;
-					};
-				};
-			};
-		};
-
 		funnel@1a04000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
 			reg = <0x1a04000 0x1000>;

-- 
2.39.5

