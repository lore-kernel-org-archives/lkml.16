Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5C62571AA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745133; cv=none; b=YROQG0YPvBGG4gmizBHm4s61wkEk+eY5ASe//ADSFoTtHdMEcje7NXW1oxyK56vVUhgVQVDZF015hg/EGEvnuo1hPVMjHT3xNzMQ2v9ysnNx/sONB/1qSn5ZoDfQa7T8+iwxcFDnk3TaOTTxURfXD5cYuUBBVVBzQVWUjfiRZlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745133; c=relaxed/simple;
	bh=f30cw/8H4EXiyHfPv/hWpyXvXZsxpbdm/rrj/jZvh1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzQ/MSKSvJxyr0C8HynMd3HW/gWqp1ZgeUJ2acycVw0qAkY4T3k3E7XkR3HOZe+K6xtpgusN7xnUw+sI/IHRVnm+e3yn3fFSmaY5ihNgAZGzIoWtPlLxLXXXMhFfQ872mv7+5A5xhXEpCk1hI//MKW8qwP9ZrBWvf4Seaq67Wqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvNc3dEu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvNc3dEu"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKm1X9015936
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k+EDEHFqKkj
	GqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=; b=AvNc3dEu9OgdoCaoXkLzUHZ9gAj
	+LCOuG+Ek+3UbSK0O5HVWs3P7rPlKIuK06AzWOuJVuurAgScQlqx+6uwgqnbYwWk
	gMR4Xg0YvkJNPtddMgm3TeNbvjoXiH+14q2Uf6qbEqctSkKZmosPcQtH5SLj0drs
	O0LriF3PPIkkbALAq/zfaliTCFIhsVaP5e0rnXM1epymcQ0kSJY+c14kkr07XjdN
	DKHO1WLB9rjEng80kwup4oarH7sKQLacQRpFDuT6fNFiziY6DgeUIVyzU6dPqmiZ
	z0ykrvfoxoYX0De1qBYD9AqxSWXh+fFM+p5YoNHi1/57VuaGvimCWj0cppg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqheex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:05:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235e3f93687so77587375ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 23:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745129; x=1751349929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+EDEHFqKkjGqN2StGIjjiSlDJT77CrFI7R+bA+Neo0=;
        b=Ua6jtOC8Pqu1OBnQX77FZbl2eZoxK64ShHbYf3mqU9dfFbc3bQ/yWRIuM5A4ATd+Hh
         ian3qN9frHEQu0TTVb6uQy7gtTtGdXVMz41fC7p5ISAW6QElj0HW0w6BxTrhicQ6/JM/
         E06qTqvZ17x+vdyAn/OMLJpstcCvkoVTy2k8EEDOVw0b4GQXa9MeF/u3IRgW7N8NpuQw
         x7YylokhSU6vXKeJm3YbYZvY6iNsPt1C4lJhCZ8HMn5Eh0aVHmneORCM/CNYZXFNRbHT
         07hKktIlza90sDdwJvJiItFUdoV9HASDZy859tVIo2pfUVP8/RSHrzrtUQDJv1cQarx2
         g2Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVB/URFR5jQmMYIPRbgbaWlGQ6zSlC/lHArHvt8jr9mT7pR2t4gT4pzezDIRKFcUSClJA+6Dujm3h7vH8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx3leEWG1m1Kp94wjFXvaMhOdFpxbLlPvfGtE66MXf7MsBQuTZ
	uIzAp/qe32JPC8iYtW/K7ZppzZ3ud+Uxq62lyIOqudUamQJjJtkFjc7CPsALrFL+bi5CWXk5Ra4
	ZHYlF7G28K+YKA+osbNS2XUFrVMFa/8PrTZ0p1WAvuxRG/T8WKlld6S/aNfs1+dVStnQ=
X-Gm-Gg: ASbGncsRyFf9e1dHUwtiDRSQ7O0LahfIpe3s/8TbTk7pMge69FjlOaIoaRpYMZZ84ZP
	Vc26UWAlkLqXnyLIYV4qwaYwoq3CSCa3R0d1q7XIUfh4Jmhn1UtYCFNlr58wUQcouf7DoEFH1zz
	2b/dIKaqeoD3BXL99ywjlGR2zB5jFDowxPcmqTbc6lXbhfoQmSzoWEA/nca3z/xiaBReFAueTgz
	ZQy9t/NyyEVbDzkyJXwowbS6Xwy5rRM7IEiyKxrTqHBvx6dZBsgLMJlzmpKE+YkONApMlmZ3U/I
	6CxiFNJdN3s4Tjtik0vu4pHxU+x7hiW2s+6kk0xf3SEm2OVDnt0epl3VZtcAfxBq+wkO4me80TZ
	wCw==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249676985ad.31.1750745129471;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+8VGvDMCZ73CeV5AtTxJ9YBH3JlGYKE++/duwsSfivQtp9438F3OMf8ih+tv26WkZtIRFKw==
X-Received: by 2002:a17:903:18e:b0:237:7802:da30 with SMTP id d9443c01a7336-237d9a74d4amr249676745ad.31.1750745129144;
        Mon, 23 Jun 2025 23:05:29 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:28 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 10/10] arm64: dts: qcom: sa8775p: Add interrupts to CTCU device
Date: Tue, 24 Jun 2025 14:04:38 +0800
Message-Id: <20250624060438.7469-11-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IYGVQw-Rxb4KXzaY8GBHRZXO1WkbRzmi
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a402a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: IYGVQw-Rxb4KXzaY8GBHRZXO1WkbRzmi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX059IL3vhlNeI
 e/Wo/ZaDQBhzOsODxrqrvLqpPjnCaXmr23u2vcMRBbfLmj25rdUJSc7DGhR5ujS/EcG8d/IP5xH
 cPOmYp5cYTTQ85J+a/6oK80qeRcapW7ndwQxXhU+LF6I1pfhSfxdz+Btd64Q/asrQj8JJnFP0YV
 /eMX680Xpx5BPbS/MoZRfcAEVqyoy3TBxRwpIAk2KkqlQYBIE9mVQ84iR86FvlZYBpyD0zSVO8j
 SltRCJie+A3XYOnOvXUafJS56U/s7HCpSUMRPdDE3nzdOVZdooNBBl+wbFBNb/+Ru6APhI8/wuO
 9zFo+/+jd0MlgN80lzll6QgUF9oc+xZUWZtZwLKbtLLcqBXOC3z4h1Ordfhjc0F3wJOFvDdJOKl
 o4EcVn3Has69GK56Rd7QSVLLaDVcP3f/8ZocZvJY+x37bmxuwKpiX6EeXAjPkRjbaAIPLT1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=819 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index fed34717460f..44da72cebcf4 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2762,6 +2762,11 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "etr0",
+					  "etr1";
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.34.1

