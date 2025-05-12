Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30D299A97
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083297; cv=none; b=turb7+mLsa5edhrZQxdxrwaW4lw58pRZA3gZCZn2UDP39TNUyYL+DuGIeeb1TtvNyf+JYbwkAMM5N5I/w28WkDbzKtfWtkbYHWWyfItmJMVdda1qMZQEvXKMbV5Ed69SntBpzz1WWUNw4jAUt8r+bVvQkC/yYfBu5sPHmjMScHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083297; c=relaxed/simple;
	bh=Y26Uhiax7G8sUEDMgjWq7ztl9VANn4jMjRayAOUnWFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gpf1fjcktOPlWGSr6ru4/VSGgBpGmPj6j23FJPJVxLqDwgZlizsJYoCMCj5F2xJLkBpnJGMxvviEQDc0wGL53f763+aIsz53iJXtXQDBajlTmTH+UaqGRmUFvFnzENsTqrFi69EA2DVgGK+tr069gcKqrk/w5o7BQwpdVRwk/eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Am0TAGUG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Am0TAGUG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CIZvx2029694
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yoy9PsLWgKeThBrkczbDdghhyIyxuR5eQn630g//EL0=; b=Am0TAGUGc/8STzRQ
	ejdTYobEjMA5od74RS6o7VZM50f/NJvEZtPQ52pQWh/O6A7c+kgKKu/FxGqQbrat
	jJHbpuoludIhTK2tUOqmrdhgJS6GX2z8dr9QLi9Q8Mx6ORRZP5dQjHJD6GcQvKqs
	o1JS/LC0LOe4Fx0lI69ILBAZP/nmvL3tZ3z/VqjdYNlZ8Hqur8EnpBlXzXxYPnMW
	NzdYVUuzGBS1qnjs5dj70Ekbog3x0yzji2mz/RVIG0eYO8vD3MdlorPqLN2f3xHt
	jipGNTGfUDCgbcfp6eg6Nsf9HkZZKKOKPPdyRivBhoA+/WtvBKYy/8gFesPk6EtZ
	LEGL1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghdtv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 20:54:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ad109bc89so5330361a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747083294; x=1747688094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yoy9PsLWgKeThBrkczbDdghhyIyxuR5eQn630g//EL0=;
        b=C6/0YHE7MIDtia4SlU/abkezAcdaIgWxLt7VP3Ng955gA+r8h8VTznZ4ZxpUY3JSW7
         w1efRSzWldqTF+PiXyfxKxhCvDl0P8EXAyBGyZVKRxW3kLB9uWVC7dP8lygVmj8pN7Or
         kkg3wi/QbGweXWsCE64jgpM3ywwa7ARoGib/BNC/IchfbB6kNsq3rzVlbZ0F+abpWi/X
         wdbkphM293WmgKX3W3pZMZp2tLtkwvoY37njNMKLhN3gxqHAGwjmlmPOHa7dAwOc4ab7
         xB714EVtD02OVSA9/4JsjFeDUEpDcZUyIoBLBYM3/UzCtBhrz0OGun55E1IJA7CtGVdO
         hRbA==
X-Forwarded-Encrypted: i=1; AJvYcCXqoz2OfrJ7wmDcvBX/CSgaTSamLauFO8tJ88EIXc5nYcUQEAR9CdLqAmgkUq5WDglppGPykcru4E2uLjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaBwtWPJiNg4KuobJNdKQKvyJ2T1gmRGXrKcKQBVDLKCrEqPxS
	F62qwl9duefggqKOdjpqfgNr7NeluVDQ/pNnoIzosWuHEnyxNuaVxb0rf4RJrWYcsyHU3lLn24L
	nCsM/efNAJ7LmQbn5RZj8quz8z5m1P7f5JbUKafWkBkIeR+Rld7z5Vx3oyTCjItU=
X-Gm-Gg: ASbGnctUd5Mez/yzpBFseZzENjUKf+hASOWvoP6vkrUZwNXaWjosVrty5Lsoy6CjAnv
	lbKk78ukRznlH/JYvt51rF80NsCcy0AUDZbcBADNIZ5UyETsAgq0OxwQrm6YjaHTG8mU3NdpGMd
	Rt19ag2VhITqyHJaLlvfT1ThC0bC0Ox9EPUuMth7XygAlBAd65ZfX+EJb+fReBKJbelkDFml7rH
	aQmjvXhC0j5tipkSVPsMIh1Zj6mSgR+LD9AO9HPhOjVDPCnwYEZK49fm/kuBFz8wqc+VaFkIkJi
	cXVuHtaSK3nnLe7Sdtg1LxhMiNfTxJII6iGAOyt72kD2a1sTRLdkFyx8LKy9WZJgqsQ=
X-Received: by 2002:a17:90b:1b0b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30c3cff61e0mr25897045a91.14.1747083293707;
        Mon, 12 May 2025 13:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtSgsc3fAzqEn4+5DUFx+rHn0Vq/09BHOt8ZUoac7ndBSRyefwtbPMB5PCX61w305SR4ts3g==
X-Received: by 2002:a17:90b:1b0b:b0:2fa:13d9:39c with SMTP id 98e67ed59e1d1-30c3cff61e0mr25897015a91.14.1747083293346;
        Mon, 12 May 2025 13:54:53 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39df09dbsm7084867a91.26.2025.05.12.13.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 13:54:52 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 12 May 2025 13:54:44 -0700
Subject: [PATCH v5 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250512-sm8750_llcc_master-v5-4-d78dca6282a5@oss.qualcomm.com>
References: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
In-Reply-To: <20250512-sm8750_llcc_master-v5-0-d78dca6282a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747083286; l=1338;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Y26Uhiax7G8sUEDMgjWq7ztl9VANn4jMjRayAOUnWFo=;
 b=yXbfnjFs8Zlj/HOkYoDoXpHHq7s2EfLz4FJyHF4GEOSsr06+W0/m/bX+cVuRZnhoUQbypY/Dz
 kPwXmcCR1+WBupZbPqz70X+qjxEmKc7Ja9WeXrMXqtjK8wDmqGqPe3+
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-GUID: v-62NMNE7-bjfKAHs93BjYyrzIeOhr3G
X-Proofpoint-ORIG-GUID: v-62NMNE7-bjfKAHs93BjYyrzIeOhr3G
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=6822601e cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Gx2GX35Bv4c8b2S2wRcA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDIxNSBTYWx0ZWRfX2noMm1txVB2N
 3nPcJOWLSPYsxVmKuOIeFUC7FdzC+X7EkGjwy9vxi5DOlNjWZW5jiOJAsAumB/UYbX0KTN8DXYi
 i++8EZaGZ4K+5rRkHmMHcDBEhlq6SVT7+fS/V4Ob2nQKLzdJFY9HLODoq1IcQlGHE38QxiyF18k
 gE7oOPR0m2q4MZHj++/CaDU1s43nQaiE4dAfnKbFGeczJVTXi2n1jgea1uVa03pf/9Exx5/n4t9
 3o/vnHH4EUrzwk+0hyDRFrF9SIq62kTUR+1EzP6XvRdSvqOsRxhmw1iTHbv31POHGbCQgsfT2+l
 98qgn39LRjyYC+lIjrzRaC65CmLppseAYfZ4kSVrAsJ3ekjCKPPn8SYhiE54fntqeQ8rPdHI4j2
 CXIr4PLe8MPf85gfoGbU6o73qMPT3ScJpC7UIzksLUK2fU7J8EDYhx9g/m/O/EM0VFRI8oJ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=701 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120215

Add LLCC node for SM8750 SoC.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..980ba1ca23c487b9225b73872889f02c2611e68e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3402,6 +3402,24 @@ gem_noc: interconnect@24100000 {
 			#interconnect-cells = <2>;
 		};
 
+		system-cache-controller@24800000 {
+			compatible = "qcom,sm8750-llcc";
+			reg = <0x0 0x24800000 0x0 0x200000>,
+			      <0x0 0x25800000 0x0 0x200000>,
+			      <0x0 0x24c00000 0x0 0x200000>,
+			      <0x0 0x25c00000 0x0 0x200000>,
+			      <0x0 0x26800000 0x0 0x200000>,
+			      <0x0 0x26c00000 0x0 0x200000>;
+			reg-names = "llcc0_base",
+				    "llcc1_base",
+				    "llcc2_base",
+				    "llcc3_base",
+				    "llcc_broadcast_base",
+				    "llcc_broadcast_and_base";
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		nsp_noc: interconnect@320c0000 {
 			compatible = "qcom,sm8750-nsp-noc";
 			reg = <0x0 0x320c0000 0x0 0x13080>;

-- 
2.48.1

