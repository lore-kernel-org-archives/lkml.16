Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4F82472BD
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748490473; cv=none; b=WgorNAoz6kYGyCLGFXYZqBxSPG5dnY3AAncM0rAxO1zK9trHOrxxswdj/+MFl5ZzuwEBKGfDASG0VsQ4OAuXnb4uZPcph8T1cHFT0FM4vsz97hfNMYwjsctjovMi/lU+CKkwE+kSNpjKzcSVyAevaVk2xmUdWUIo3YdAoyczWvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748490473; c=relaxed/simple;
	bh=EgXB3x/pd9k4/RXeT23731nZtfayd43VqrfynvLlfVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q6xmeqdyIoUK12cMRK9gwUe+vxq8AYg6seY9awq7szFhy5mwfoGyGDnpfJBklLCqri/EuXq6BvYvWJ2TkCpwLEryGHTUllqXVUjO6lM8DePbZlFhKWXmPZ+wPApHv3e41uoG4W+0edHt/8XHPu0R6QPyFZ9aLCZHuSfG9wbYba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RS6vDWsl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RS6vDWsl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SHTVpo022136
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ce54/ONkL+nmxbxtqQrOZ2
	laFkM+mMh52ESoUpvVOik=; b=RS6vDWsl7BCUF5i6JdsXWaR0WmGP4iAthLFI9w
	GNWV9db+UUmTUKYFMoT0CB8PcQGEqrF0FuXGZVUls5whqP8U8YLkecS24fwumO8y
	WGpVWTOAtCh8pxbJyGQ6lWcjy2580/IQ/h3mTg1C/w92ZujbjMZx6AAIQbLYd7Wj
	HIbbZhRkLoQ1cqr8cUcNYGXEwRHfMfRFVj8MiikXcIWehlik/fvgGQxXY9rvIDIt
	+wGgbgHyCrvw7yIpIsLtxIAo4e6t3KzBWm/ic9KX1j1sEsTElA9KjhpVDtumpsvo
	xorTyLBMjSDaNskzSUfpioqKhI4/FOFtvdmz0UXw1oPOHHmA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x6xc99vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:47:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3111a593ba9so751742a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:47:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490470; x=1749095270;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ce54/ONkL+nmxbxtqQrOZ2laFkM+mMh52ESoUpvVOik=;
        b=F1sMDcwL1z8tmbHWlndGWqcVx+h82m0vaUjI1+/aTPGsPaTyA8Gok18lDCLCfBnLKq
         Wt1UHLPCF6XesV7k7AEeA4+tyVklqteCZY2DuJL8lP7rAO2pGMye8rf9y28gkcptr5jc
         CC7rxYpq3QFRppTjQDA6NbUh55ZEKeGi0QPOiOfsngI9oYvgFMbnKidgldUswxssNl2M
         6p1qmmmeFQU8PASMKWK/pRKxn67rG+RFJVGgUWYY3tBJVvWybUKH+Kye41PCEWL0k1/e
         bjBH8VLv/HMmSZUhtXYYVoI5ohNNMUTAcB5JnxWsF3AhfsSGrd8v3gxd1a9pS3i+alnv
         bm0g==
X-Forwarded-Encrypted: i=1; AJvYcCWkopA5sBiNpBbaLF5GtNgjf/3tKwLg0Sc/usMdkYqmPA9Z2drnKFIxwOEo7wTTzIO9fY7sRB1ADdpZ41M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JAP9PGUuLDEzbDMDRJJ+ntuQB3LQ5/MSuER7RdChpsS0zLPy
	w4TdxQj3SQd2ogJ9tyZ5rI1NYCBX8S3l2t6fqxMf1Wvf2HAReuwM+wAQszYzTNm+PIRMwh+rD5g
	QSzNg8EmkE9MlhcyQ7420otpnRHKHNXmY4n1A28LCoIM4TZFE5pm090kWYjSsNHc98gw=
X-Gm-Gg: ASbGnctu5HrGNKq3a2EABt/OWbc5iETY6J7jb/qPBvVe8V1scEGgMqggXSxHp9iJTDP
	YDbLZ/NrGZWC1/QJTitO9uh94waMRq40BbGZ1wYbBbrCo/5yFQHvVCP76YCWAS99Pxxxs+r6X8d
	+qan8E+kRvFkwkSIXo7KU83PWp83Lh6u5ziFYFPXGX0WzazdkgP2fzUcqSRhQXMy7YbVGNdzOx7
	8pL+TkUhtGj4sv2VJG+5QZ82ourNu6Jbjv8ydbC77uYb9JS47CONyrk6on+wk81vBZcKCM3MBS3
	fvShzJp6Jap5Jto3YV8bOeliAAVrlQXH8HoITn6sdQm4
X-Received: by 2002:a17:90b:2e83:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-3121d2d197emr1271619a91.20.1748490469776;
        Wed, 28 May 2025 20:47:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoNb37NFxXvc5+hVGbX8/Z9d57NjtMj+UMiz4MmRKaNVbzHDw9efdCTcOWzb70HNYIIiX4ZQ==
X-Received: by 2002:a17:90b:2e83:b0:312:1d2d:18e2 with SMTP id 98e67ed59e1d1-3121d2d197emr1271586a91.20.1748490469405;
        Wed, 28 May 2025 20:47:49 -0700 (PDT)
Received: from cse-cd02-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3121b6fb2a4sm417949a91.9.2025.05.28.20.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 20:47:49 -0700 (PDT)
From: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
Date: Thu, 29 May 2025 11:47:08 +0800
Subject: [PATCH v2] arm64: dts: qcom: sa8775p: pmic: enable rtc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-add-rtc-for-sa8775p-v2-1-f06fd212c0e5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALzYN2gC/y2O3Q6CMAxGX4Xs2pIyGD9e+R6GGBwFeuGm2yAY4
 7s7wLuer/lO+xGeHJMX5+QjHC3s2ZoI8pQIPXVmJOA+spAoFSrZQNf34IKGwTrwXV1V6gmVLHs
 qKc6IIjafjgZed+u1jTyxD9a99yNLtqWbr8AGZYZFjjLNG9WUFUIGr5n1LbAZx9nqy0ZsdKrtQ
 7TfQ+0opp7D4Rf3zhPE/YPDOTG0Bvj/WsfG9wc1JWKi4QAAAA==
X-Change-ID: 20250529-add-rtc-for-sa8775p-726de6e77500
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Rakesh Kota <quic_kotarake@quicinc.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748490465; l=1478;
 i=tingguo.cheng@oss.qualcomm.com; s=20240917; h=from:subject:message-id;
 bh=EgXB3x/pd9k4/RXeT23731nZtfayd43VqrfynvLlfVg=;
 b=QIDFTBtYRn3d7gb4BWVaIG841OnWDXNL9eUoqXnKeMxtJ83WETc4MTH/qU7OA8cbVxBBmtXOc
 3WeRrzESWuQD1UBTRLietoNVAB/WbftstnIPNfiQbGjQzGHvSRjt/QO
X-Developer-Key: i=tingguo.cheng@oss.qualcomm.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDAzMyBTYWx0ZWRfX4xwG47/vJ7tU
 vF93YhgGJZxKtcb2jmcaCuMb/OEk2sjYowbVY3Ek1wQ8sbIY3uRrdZxhlW54oyrLJ0xZhUmL4Tu
 neogiNn/PewWLwuk0K8q/7WzOYe3eroBAIC3XfiAI0mPwft04TZloxcmIvC0eI1/MOraQpAsO2u
 icGYOU2+uPbT1St48ex/gT46t/o2V9122OO2pEwPylAlYhTlywuZPA4Pp5hLS1GgtMqljtVwPij
 sQm6S5mVa/fTymSBmdZohKPwgputk1sQz4UWcYhuuMk99TxdhfMQvmlLxfVNafM23f6/wOtuVTM
 iVmD/PmyQrlZaIdG7Z5wUzWPvog5MhlPRsFEz+VkQvP83IJJUc8BNjEpdas0fL4WOiU2co/pIZD
 4pNUeAaRuNjEsGqJM4zjPfsKvUpZIVN2Hw0xi7QJuWyDFHHED2pZqMVbuhI/kIXaw+HTv9KV
X-Proofpoint-GUID: w70M3cRxo_Mx5HLtT0BfyI2rXDpiOazU
X-Proofpoint-ORIG-GUID: w70M3cRxo_Mx5HLtT0BfyI2rXDpiOazU
X-Authority-Analysis: v=2.4 cv=bupMBFai c=1 sm=1 tr=0 ts=6837d8e6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=jWSs3TtdNv8aAmf1mZ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_01,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 mlxlogscore=921 phishscore=0 mlxscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290033

Add RTC node, the RTC is controlled by PMIC device via spmi bus.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>
---
Changes in v2:
- Changed the Email address from quicinc.com to oss.qualcomm.com.
- Removed the 'allow-set-time' property because APPS is prohibited from setting the hardware RTC time.
- Rebased on next-20250528.
- Link to v1: https://lore.kernel.org/r/20240902104302.3959670-1-quic_tingguoc@quicinc.com
---
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
index 1369c3d43f866de9d8cd5cd4985241b99c0a0454..9e0d05c1b39ce229d5d4310ea1df1bf02e689178 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
@@ -132,6 +132,13 @@ pmm8654au_0_pon_resin: resin {
 			};
 		};
 
+		pmm8654au_0_rtc: rtc@6100 {
+			compatible = "qcom,pmk8350-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

---
base-commit: 4788e5176e2ae85ec6d2022a5a79aae0da083154
change-id: 20250529-add-rtc-for-sa8775p-726de6e77500

Best regards,
-- 
Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>

