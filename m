Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB351A316E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 02:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751856682; cv=none; b=SrbZTwMwaQzEhLiq/dfvARLdonn6/zkQHn/VsB9jaE9qMeKZ6uMpUIuReh7QxifC+VgLHwWwUvLNfqaJMv51cpwLvmu611wuQ/24fbwOVzm/dM+c+fT95TC6vDPSDykNcT6XSan7gnS+ULIcwMIB7Rts2SursxuCs9O2ctDnDB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751856682; c=relaxed/simple;
	bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMEAtdLtK9au49LcumYmflEbqsztGNwFvVsg0XkmcHKh30eyWcUmBasHZPdU80Mkq1v9CQGBc1tgwzQnHZ+RZIGosp+gW7BzK5qjfBxV7M9aRcERxT0XhTf9QCKxoCTUnigwtZ+3XN3uH5iJ0vojUO/EYovxYdFh4AklydaBEkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0ZJvzJX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0ZJvzJX"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566LXOaX029585
	for <linux-kernel@vger.kernel.org>; Mon, 7 Jul 2025 02:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=; b=i0ZJvzJXbVDkPZBW
	+CPfZSBE6VhPrLKaCiagYHJ1z3TPfBsKC4mfTLhr5v91Mt0WaZfYhUXqvnTxY4bd
	zsn3f0bOrtAEBdlHb3ZifoXw6Fn0jAwjZXFuB8OA/7G3magzi9FnPfoZ+H0BVpiq
	mz1Htozuh7Hm1t3suXUa3o/3DCkTNp/LZkEm9WHNdTeI2f8HxJpJVDe5l77txRdM
	BnfKcx9u+jWf7rHAMMtrkfSrJyza8S1WsOwMuxRiPGOczWArmLfVl0jAjP7NPkoL
	am1MTRe3UwOFwVShZ1RO9HWuCscC/ZWjTZNn/jZBoa65Rhh7EXGKROwqKRLWj87S
	FeIVzQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd835d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:51:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so3121882a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 19:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751856679; x=1752461479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9lCHtaEWJJtL5rVllaD+CR/7jxFq0pVmlc9VCIqSOw=;
        b=BXfkp0nn1mcUacbrS2XyExwUGnA2J79a6gL96yQp+bODsU6Xq7QEdkd7xq+jAka2OW
         dZXlpW+ukBTddT7dXFE2xPSpr5Nmxx5iq3RoAl9vuhIyUY7gGLgsqYlOqDHWOIJ61iHK
         xEo8TEwKduRb2LgUWIrzBRxlIStwHFqyfYy1b8D5yp6mWep/7dhrRHkFm/ZEdEi2y6Wu
         ePViGLyWnRz13CXzAezGacAsH2xWksN0RKbQiMsO0M0S8rYqBtfXL3nypomZSBaGY9PV
         DTHPKmqxcFIPX88zEZuTFF4a0VaOLFpEM+625nkpDv94SMJVdAd24S2tllyy3ynm+zxw
         hQkQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9+15X5YOEetnVh4kz9d1ALuVQReeFqk4fEE6l1KnCiZ1dfy1UpKzZ2Ne7czea9azkil80UsTnduf1r2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0EDmiqRmKBtjPfZRV5yfzWm7Al5Ut/+npgl4Zczwqp4qiK3sE
	uW6mYrePL1OY/FRDysG493cnKPq6dLFuOgBopSFqMW28sroxERAz7P09AVb8QmPoVbiViZj6ppo
	0WSH9KVyATkb/eCOLiB+QSKTxIakboLCbw1a5ef2B2Mo9m+DckstmKTDGpFHic9QSOKUcgSmck/
	gtv6sv
X-Gm-Gg: ASbGncu2SrZEDxx2n7scGIxjJawwdGVMdKkJr5V8AqxJWMytJMe2OWpiLsg+K6QBTwQ
	DUqkuAQkvc8VBA0FWbPlnrkFpSmNLZSMX0mL5iDGNgohlhsD3RToM4V32pmXjsrXqdkb9LAkV8L
	IulTSFKBJd7fy+evcuCRB1GUb9wRLEtFDWj94Ja39NsK1Q7LC3ju5Vu0NrDulGvGyOOW+ok3CFj
	BJ82eBjr8wvNIDl+eCl7/UWQMOevbXIOAgZ6GojCUKtcqf9X5BiUZ0GjrFUJcDtzc5Ipmgx0Fo1
	9GdU4qlXvpaqjjeh+0Z+g6/XvgHmP88skHVSeaRJUrPIWDP+DIRa2ZYXxeiWDP0cOR0A5j2wIoU
	GD6q4Wp6uTA==
X-Received: by 2002:a17:903:2a85:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23c85d9bf04mr201496385ad.4.1751856678750;
        Sun, 06 Jul 2025 19:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc5s8qkeSZbv5wDCez5mkcb0QGqHhrfn4YDLFi9kCALY7pLII/zVBlA7LtNzhjAnxVK1Rxbg==
X-Received: by 2002:a17:903:2a85:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23c85d9bf04mr201495995ad.4.1751856678286;
        Sun, 06 Jul 2025 19:51:18 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c84593e0asm72478025ad.193.2025.07.06.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 19:51:17 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Mon, 07 Jul 2025 10:51:05 +0800
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-615-v4-1-1a2f74d167d7@oss.qualcomm.com>
References: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
In-Reply-To: <20250707-615-v4-0-1a2f74d167d7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751856673; l=943;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zsNDOxtssyyXKwrA/Xqhu6xlTQfQcZiumpCvpHLeiVE=;
 b=BD/wbKXjCXQ8kuvJ12mzIrI7Z2PnJYg+SAheI1K5cLqtEyIwlMBTiGR8eGhSwea1YX7HKVeCK
 sidzOQWEEiAB3iSVo7FZCWjunjmcm3f/mNb+Fxe2GjDh5FEIa9Wb6c8
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-GUID: QDatGWV4_w6bLwMOL0vUBlb2KM6tUgTX
X-Proofpoint-ORIG-GUID: QDatGWV4_w6bLwMOL0vUBlb2KM6tUgTX
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686b3627 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNiBTYWx0ZWRfX3O9qwH/Eavm9
 z/vdqdAjXqRnC0rQsSNFY3kJfLkac5i/2JQdTUxT4SDNpZEyKznzp63TXjsPbjhNx42K0Rf/hMb
 4k7Z85H3y5zFKASVbD7bD1ezz4jfr40CNRZtA3/da0jDWX7KngEGs/8JCer9mLx8aOvUKZW5bfX
 pdEL9N2TVRbIj4V9pBICOEJEyFgH9/AdF8mP26z5DvMjbFs4U325ZZy/1S6yXUkQoHjZ6nvzBdc
 vnFCXcdq/afsPjo1w+tbD/87f8VKkCHPdDg9xZrNwG9LheMVdKhDnuWqP6XlY1FGmqW4P4mW2e3
 c2Qau/b1jM3h6ypZz5jLAmdIppISBcdKrSmV1K5nwERHVPwb/MOuC3nYm5onqDjtH7TgQ2z/MCX
 usd/aR/rgNHYtPNkdo+HADo4Y/oxfE3UYMnIcesXYjZoTGyEyr6BxdnuurWSYE7PAsmlkx6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=968
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507070016

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index f4b51cca17de5518aad4332330340a59edfdc7ec..b4fbed517cde18e088096d182fe6b482363e403d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1173,6 +1173,15 @@ opp-5000000 {
 					opp-peak-kBps = <500000 1>;
 				};
 			};
+
+			pcie_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1

