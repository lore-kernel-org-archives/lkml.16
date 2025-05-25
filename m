Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0957627713
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748188476; cv=none; b=APhg1g+sVlSV827KTxHVh158QskGCnS5r1EPpi8imwkUpPvV37ir+H7v21UzbhCk4+dSSLMEDnMtOeRwjlLuCvt5qMtwT92Rkb8AWlvNFriItRbdh/aTzMepuk7tyM1oFNZ0glcSXgLUtyMKqSzrDgrfhBnY4f6Zyhel9d0DQQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748188476; c=relaxed/simple;
	bh=5AKy5fjWPhJ9QV2LypCv6sCviDz3gCv1vUKjaactCNI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SixHe0F9piuJ2mtVVUrQQHGi/ZV/Oi2/tphf5npaBuCy8SdO+FrBG1EL7iXweePsm1c/2ws2L6NWRBUDJW5v93A12voulw4EKFxe7n1r2B9JXngxGGMVl07srw1OlPoPPKlpVEQCsk1zW8wP48db8PjDgrtU0NfRdasd7KCq2yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVYKBR3M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVYKBR3M"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54PAZpL2017311
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sJKcDUQVcORFj9yrTysGK1lUuony76p+nyO
	J++9P3i4=; b=UVYKBR3MYIJln6qRIRSkf5urCOc6c95DyvL0MXVdEPSHL+mUslH
	JprE/S+6qzF43rhJm3xL0ydyyk5NhBWnnufjfv22ZGmK2j1ZFjH/v57fIdMZiIXC
	AIe8idknqPFvpnQaGuProELpvEUuuOUuOiPJCEWqalG94GD33BjtLE5kpbCFDq1g
	RvBtbaFeLZX7NFPBO4FFl2GZN2vhdpLSf95yYmg5HShhsTTyGU7hxS3/iRK8EtKH
	e2Lnby1z6aM4K0lEoYluOla6F3IRZL/8Lhy5EFBsH+P/JNI85wpKOJUSoMH7JZfy
	dWDAbM7P2Wk1A7uV4zURLD2njRG0QB7eEOA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52ut957-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:54:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e0fee459so935483a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 08:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748188472; x=1748793272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJKcDUQVcORFj9yrTysGK1lUuony76p+nyOJ++9P3i4=;
        b=WFfSrAqgNF5cv/BkJTCFla1G3KGX+ISN37EKp95AuTi7ittKOVi6HX3HjxU4ba0V3U
         a5bQEeypGdRue8CoXAQjqLRNpsEzNSexcx4lctYL/rgx4ZrxRZ143foOcw2ecZJydttV
         RX2ItdqSeErKGPLP47Miw9x2htMI+ZpwqOs2Hy3cJgTpSHM1A7jt3VTT9OOSrGri4kBc
         86+RNHAgxeNpvB9/7bSdy5YBuJtuOearktZwcHIWmfZnzVatKH2jOFjcrBpQnNCBntYp
         oK2lsOdhTSsQnIWLqQ4W9CFmcpvLGvLd2Af8ATLXJ4T6IIXdOa7PzDBRngNFP4VUt1K6
         eVqw==
X-Forwarded-Encrypted: i=1; AJvYcCVZJTVOrd/sf+vombiwUJyvgIoTRka3ylDFcedXkfSCfVsoNfCuRiqp6eN7GzyMpQD+2C7K/XImKDlvTV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqKh5T6mgRzzmixYqJk/n6uGnp+VIUbX9jA/cNhwlgA8N3uJ2Q
	1bxGP/g6VrndlUTapPJXjRJ/4Er/nqGY28zns/OnQpYWEinlHyBvEBcf+gxrPCzVlXf43JUeo7a
	hfXjz0iW/rATMbnxFUzWrcg/lGFkT07SVnVW3hcdArblWvaqAE1l6gmoqIlGKOCi5qIQ=
X-Gm-Gg: ASbGncsP7gxQToF+RvRgeLzouT5wJbspuX04iDQDBytx+lPU3niFLE5hwcxPDxNMD5d
	wTnb2xOfyrVKnWt3raF83iJwU/9+0y3yMKvgr3QUcx+kRiht75bQ7Iz1IjO4DT7NjLf9K5rTRx8
	+5n6wetY4Rd/iC/AQ+O5VDQr+WV0MA0QSVBUmgskyOTsaMxvZBLz1szsd53U624VeeIHDuCO23B
	9MasMfhDwCiywje/G5Z7+N6curSMu4KDXMnAKmuXoEjqoF+zAfIqJkDQ43oJwhnkdB/n3HI8sE+
	7VDx3/ccyipEFEsamKARZZ+nW1bLtuAWKQ0NjQwX9kfAjqrd
X-Received: by 2002:a05:6a20:6f8c:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-2188b571a1fmr10112529637.6.1748188472114;
        Sun, 25 May 2025 08:54:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtYN5afNoqrSTBdKB0G11sEGq4ECVlIT30ApclIhLBIdZNZzcv9oS8JRiOcaZHnxsufMmAxA==
X-Received: by 2002:a05:6a20:6f8c:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-2188b571a1fmr10112505637.6.1748188471733;
        Sun, 25 May 2025 08:54:31 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a96de11csm15634488b3a.31.2025.05.25.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 08:54:31 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
Subject: [PATCH v1 0/2] Enable audio on qcs9075-evk board.
Date: Sun, 25 May 2025 21:23:54 +0530
Message-Id: <20250525155356.2081362-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDE0NyBTYWx0ZWRfX/6oJ6+SgMnCg
 EWrREbYJEVrDunH99ftOk9DhYnJ2h081yVDvTU3ekTdMfBpm6nfUCRfgHoxn1TZ5bgbkCcwOk1S
 Q+lOdEUmSgT/pbnuwkgJX5M+JiVP0vYdbP6BIPeePtThGO3HCgqcOGXlVRtatWRYT2fbluQiA0S
 SnNYbCZrl6T03z5vqOz3BAABLEXDmzNnt9cjKjDJfUHx0oTFvzf8FtKEvDe8VwEO6VZ61mQkNAj
 Y22h5b4vyvKjHo7BDd91CaGjv8ZL4yrHu3FvGMwwQpYF5vubP+onrTdxMtAm5nuNFxFQNgkswlv
 vHwvfsrjWTTUR+Ps3VASDtZx4+GOXJEJFI0yxNLs+hRaiZaxiHF61gW73job08qRSYULfKAE9bx
 tTU73jfcSuyyrfrAyb7RAyKaB+U063EljOBRqX7u1DnSr5prpHYta1U8ba2h25Kve2yLg3Ms
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=68333d39 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=YkB-U3mbqUf8DnNMcaUA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IKFC6lxWKQeHJqMl_RGUPbQbFd8QEm1t
X-Proofpoint-GUID: IKFC6lxWKQeHJqMl_RGUPbQbFd8QEm1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=909
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250147

Enable audio support on qcs9075-evk board.

Introduce HS (High-Speed) MI2S pin control support.
The I2S max98357a speaker is connected via HS0 and I2S
microphones utilize the HS2 interface.

---
This patch series depends on patch series:
https://lore.kernel.org/all/20250521140807.3837019-1-quic_wasimn@quicinc.com/
---

Mohammad Rafi Shaik (2):
  arm64: dts: qcom: sa8775p: Add gpr node
  arm64: dts: qcom: qcs9075-evk: Add sound card

 .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 52 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 54 +++++++++++++++++++
 2 files changed, 106 insertions(+)


base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
prerequisite-patch-id: 853eaf437b81f6fa9bd6d36e6ed5350acaf73017
prerequisite-patch-id: 6d9fd3e0257f120cff342c287774454aad2be2e8
prerequisite-patch-id: 736cbcd47d5e7cfcc53fcaa7da920eac757ce487
prerequisite-patch-id: 4eddce6daeaa125f14380586c759f8cb8997c601
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
prerequisite-patch-id: baac180e8715b5cf2922f79346440d92569704f6
-- 
2.34.1

