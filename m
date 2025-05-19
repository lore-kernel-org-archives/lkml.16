Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A6E26B0B1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643674; cv=none; b=LLsOya52xkUDk3ZzvhEqsGsxd27unx97ip30i2v0FbQro6708Bhv47RWbnlbJl0zGnEZtOOEZnwJHYGxXarUsidN2DmHnIsfiGLHt5v8jgOFb7KRmdv4kvhmf0VRvGs3IAKYYyf0kPMtXkPHi4Y33OcazP461awzBX3NGa+33sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643674; c=relaxed/simple;
	bh=LoYhVEORcNdoRG4Cv8JP1GsIYuNzXKNHE4ebg2To1e4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E1FzvAXkcZf/C6Zs/Bxgm0n9fzKCv+C6fI4W0cRdcOdg3kqMRJO9b0ADI3wIFlNMWI2o3hGnaWdJKfjS2fpdD+A/s0Sype1Cr16HYIs2tVtVBUYq/xfSz7Qufsza4OleJWj8qMP6fvBj4jctbxAVw7CYhLbSTXnGSVdKC1QAGLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwB1CTWJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwB1CTWJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54INEFj3026316
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAhawXMXCUU8pDWEvZyvc7zJc7iT4tJIcjRASOLZ2pw=; b=AwB1CTWJ0j8BisG/
	v18d95fz1OCIAapECLlSYz1tgUbLnyX2qHGYy8rlpkfh3JyZ2gIJYGxBdud0Q1A5
	gdybqDqL+MnGrZc9nb3GZ8+6CIYq+hYei8ti+odOCXd5bIu4scWWzClUmAF6WTBj
	JMQ7ovtFjaiwUFOUOIG2kWBb4mUMFm4BZeBJ7z58j2RFiN6Ph1BSLH899UO7eJ9m
	/hnkXP8sTczlMvA35AiIRu/Ck7fMp+sx5+yIU8PCdDU4ZO3TY2KEYKkORNBdAzFA
	/Gh7X+KnVIZ01E7jiUltfSqLFwLtbjtDicy9wim7+OgrvCCZyrqAvkZs3myykDxi
	TxsIjg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnykpdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:34:30 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0f807421c9so2448249a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643669; x=1748248469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAhawXMXCUU8pDWEvZyvc7zJc7iT4tJIcjRASOLZ2pw=;
        b=FWoNdIEglIHB9iGWzgiYae3tS2nQPpQ9DnqAoNuJs8wdg3EJLppbpgrnnzZsXfgxxr
         7c2jp41aD2G4mf+4cK2Sk6pd/ioVPvrGsiscCu54kWSpMECbt4ThmSXnZaYbXHuLEwfm
         x4WJEmTCd9xeitzgSwbFBCIiuLPaJEM98r+oJi/wbjHaBIqj/Y1lS5V6SLABCOZVZOY9
         FDa3mEesf5J8TLN4y+peF/l6fFTclkX+zdClG2/OkXjeF8jh/Ilf/eysZ7tqCi9txwyk
         y9CuRZcJqF1kqYDpIQSmd78yC6w/OJ7f/Q2G3bhilwnjRyWEovnOUkyJkd11wRkg/OTa
         JTOg==
X-Forwarded-Encrypted: i=1; AJvYcCVIFhjwYDZvHnYAOh/2mY4SkNyztry6y+rN5NoBrlckrS+9iVpwmIz6mqlMbZXQpldP3HLFU9uOc4z8tnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2DQoMk6hArxTrAhpcl+fNgC6rJFKvSgC5GKT1UBl90Unrw1gR
	185oIDRFzkhTs0TjGdfrlcQN7lYcZwXSfs12AfcZzEcxa8/bW9Kv0kiDFZIgQGSSrGsUyfqEhXq
	FjQZql7hzpNIKlKdyOb7cu6ykiH9Ayc3yXP1rl54yT54qv/T6PcYJFgFlc67yfx+W0C4=
X-Gm-Gg: ASbGnctPEL5aZIUtP0kRBmpvLONgNeZJ9fmc+/PMNCjhg+UX6xp8KajsrWecFnRmNsG
	4rwlT2HI3X2+VVjnUaEmTcA3OHuytvJ/nQ2cDeczqe9nMDky4TCg/uDfikuYZRT35DwOHoxvPDS
	shajNlA7qBk9X3qFvQJHYupPMSUtjiGqnCSHELnR7phBcl8qk4e67FB8UkUtvaZfoSNcRpIezUk
	I/+1LH+ZnWlDy0LSCW7VGFpuhKBpRuqTQfSrSzHlUBtERwqYrrBtg/ny4YlTBwcei89Kl46YIUO
	tPy3ALnb0T3Hi4f23AsGbnJEUha25Ty7ADuX+eWFkEixdh5QS9AFhMIcBUEOMsyNxf9evRex+35
	6q8UAp//rfT1F6KVJ1OCBMAGtoPiYrp7gySzo/089UtQUjX0=
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr15969849637.17.1747643669211;
        Mon, 19 May 2025 01:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKoTJNUEJROXcOMHLacxfq+rhAzAVq5vhHTPrQtAU4RvYCSnth/uPG2GCGaVDZ7D6nDALWmw==
X-Received: by 2002:a05:6a20:a108:b0:1f5:882e:60f with SMTP id adf61e73a8af0-216218c6475mr15969821637.17.1747643668859;
        Mon, 19 May 2025 01:34:28 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:28 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:02 +0530
Subject: [PATCH v4 2/5] arm64: dts: qcom: ipq5424: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-2-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=1480;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=LoYhVEORcNdoRG4Cv8JP1GsIYuNzXKNHE4ebg2To1e4=;
 b=tAOpTDapw7pz5ivYWLsg4tX29Q5nVDoeSSfZaRF0KFwzW+depFffVI1FTq2CXmfzXas63MO/K
 T4rvtegHi7XCvpKnaqU4jGeVo2vIWOg0H1l/CHyejD49tbDgMY8vR0d
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX+y4WLWZOC6jF
 hJnYcCm1a2jlZf7ovZxy0NoYisbs+iBnzDcviBEifMCEILb213aXk34G/Tpbf+sGTB+Og4YWeqg
 5KzV8qIMzT6QB25iSjZWei3q7SFTGSC0c/AE5JvnRwvYJP2DWb+FJut3aAOa3KRYSc6MFh0HF7/
 5mbCF5B+jwslExm/bj5Sww29Y09UkYd5rlTgRL5VJsZfp6AZ1FV0/5+MCpbqDUq8nlm6MLZ4B3c
 kH3QLb8Zn8Ca/86mb/Hw4yJDaUjeTozv77VuzhTRCzIWr4c3z+JgmessCFBcyakE4h6oLuC+b5j
 bwcnagZ+RSRZLta6cJnuRIdbvJm9X9IJ9XmZBFQzA57mpBfq93D2oRt5DuHRcVzDZWDIGAGM33u
 sxhAGxlSmCz7rouwjMMsfiqse0gmA44H+7FdVZZbXCTHq8tEFUpap0/lAgQLReUacD2WUiwB
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682aed16 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=QDJorwyCwNfNgOuVDpwA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: GVdqlxZzsjQqgZWc9kJCbSufP5xhH7oS
X-Proofpoint-ORIG-GUID: GVdqlxZzsjQqgZWc9kJCbSufP5xhH7oS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=977 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190080

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 112KB but only initial 4KB is
accessible by all masters in the SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the R-b tag
Changes in v2:
	- Describe the entire IMEM region in the node
	- Explicitly call out that initial 4K only accessible by all
	  masters in the commit message
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1bb0a57c593f121f387ec917f42419..4f18ea79502738c2b9cb4b13e8eb4ac4ddd89adf 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -486,6 +486,15 @@ ssphy_0: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq5424-imem", "syscon", "simple-mfd";
+			reg = <0 0x08600000 0 0x1c000>;
+			ranges = <0 0 0x08600000 0x1c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb3@8a00000 {
 			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
 			reg = <0 0x08af8800 0 0x400>;

-- 
2.34.1

