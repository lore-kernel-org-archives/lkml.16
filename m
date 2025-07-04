Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14291260573
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611284; cv=none; b=fRBcoDP0nN2Gf8ntvHF7GmqkAdzeUQ7ZCVWh3bbktNQyPgrezQsmO7y7y5mNcqf1yWX111Ph/pbtR7NNaDI0QhjCqI/NKRJMUdDBbkiDstI+klOrCfAdTmIXpopQQs13xHia4UatUHmNlab/s/h+lIk6jnVxv0JOCT+LcyeGB4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611284; c=relaxed/simple;
	bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHwt9TjOJSMxJtVeYNVSewRPr+BIK7FToVOIIgmG0F5EiidF7VHPBi08R/TqqNW/4zBBiD1buTWfxoMxCrXjgANrVekt6J/X5xLbdvdNSd//Nfk3XuWrYMYPWztF+5NxFQ6L3ddshbabR83JPCtho0DdprdEcTIJ9sbOxiZ/5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D1ZZzbLs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D1ZZzbLs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5645U6Jr007345
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 06:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2XKEYcroMPJpNNqAp+mZe5
	8vSDLDJjE9DwyGFdh30rI=; b=D1ZZzbLs6a1Lq85FSu0ahlduCwYAZTLHUIh5dd
	61TOJ6/se2ZcLb9HzwOhgIbXmhw0M++OPks99shrmiuAn75FtZ25vPBAq+VFdWEo
	CzDjrogwuOVmMUEWMNujgJxjOrMeaak07lboT8yNaOROEszsIKZjEBkwE/uBswhM
	NA3iL555gsfKitfp97nQ3hXrfbzG9WJcLpPmRlnUSoggnpd9A4XnmJE4c8wrJ+BA
	ZkrgVS4UNfrUZtXN7nt1xni4SXlRNE9Z+13mwd02/UQ5qPYLmA12348FkAxigaJE
	h1CCfvf+HKVpz5EUA56wwbbevK05cnJqSUMxs5rG7mgUiPDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jqa0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:41:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso601841a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611281; x=1752216081;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XKEYcroMPJpNNqAp+mZe58vSDLDJjE9DwyGFdh30rI=;
        b=gtXojt3B7f9vBWYbVs8vnf8L0TMPsZ8P5NrmmZiB41t9J19m2ZMqru7gbvobAIVZRH
         n9YMJ3nptzYlNor9CVTf8sNwSCQCXpUyi0LnTv3epTyeCqnqDn1Gb0D35lXcNILKpTb/
         qo55txDlh0iFIMeyV4zXyWpI9rjhM/ttTox+r0xk/xNLod/yuGR5Alr1mXGVscnRoNF/
         b2qv1eZtciC/E3FlYdYFPFw8LgMFUXIbfDP0i31oGbK8XJrJJnX5qfCfk8nuAoiBOeUV
         3sU5OY8/kuS7yyNoPwhgg4zocUiFZkSCjyMY2+4QWfz9AtoS/ZNM5n1Kn6gCNxqtGVIa
         1wFw==
X-Forwarded-Encrypted: i=1; AJvYcCX2q7oZdVZ8CR5CwMGZCN9IbLnhjDAzlkjgrKtMmkRUK02KvNcML+NRu0I7XyuseGHrxU63ptlsdTEQWfU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0bOG4ylpC/oJvPTy7s5QoT0loALnxAya9om9XyoMTAD2LfrJm
	0oQzYX1nDFYuljB0VLRYKVRu1otOBbXwGlQwS6CKtLfJP+PMLfVRGbT52uotQZn/qQhBohblSrW
	19+wvu8IBc7CB1lundkWG809Dmi+K61B0PaeRh4SDs02xzj8iYNr7KHxxxnF6BAJ7o1tz48mFUh
	k+hQ==
X-Gm-Gg: ASbGncuajoutEN7gInuab+2GqyI+A03W4HhTDHeBTxfZRGVZrKGZcy9P/jPm+TM+IK6
	jdwQwuqnsz3QkCZ5NzmOlaVvxr6kptwPY7X6ry1YWB+nuIgbGN0xgaEc8AKqprdCyExE7oBiwcD
	7MpA+reBtYJPNrGQ1BRKK8D9f1Wn2Is9hTIuQk0+SnQOT1b7M2sdm53lc2sneRrRdIVEWd2dn1W
	No0/UriDipRkCJPMQFpCwKkc6x0PJ8ZVbnY4nlxJxJql5/fJXgXgCM3GEODvIoIoNjbUhh1iQnn
	RRF5ek7UnxoW3jYh0CCCYaAtIyrgLA6Fg6cjTMHlPLGJGQ9FtcJyfYTMCRmg0au81XXpAaLnXrd
	flfVXcif1hQ==
X-Received: by 2002:a17:90b:54c8:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31aab039e26mr2940426a91.11.1751611280927;
        Thu, 03 Jul 2025 23:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEM6kR2Bo403wYsU3oVcxfndr416uAho4dUpgNjxtmlbh16wgioPyf1W4TwF2j2D7ijs2t0Nw==
X-Received: by 2002:a17:90b:54c8:b0:30a:3e8e:ea30 with SMTP id 98e67ed59e1d1-31aab039e26mr2940389a91.11.1751611280457;
        Thu, 03 Jul 2025 23:41:20 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae6b6casm1304746a91.18.2025.07.03.23.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:41:20 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add WiFi/BT node for qcs615 ride board.
Date: Fri, 04 Jul 2025 14:41:09 +0800
Message-Id: <20250704-615-v3-0-c5f6b739705c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZ3Z2gC/22QzWrDMBCEX8XoXBmt/mVK6XuEHmR53QjquLFsk
 x/87pWVXkpzEcyy882s7iThFDGRprqTCdeY4njKQrxUJBz96RNp7LImnHHFDJNUg6IcAlcAFh0
 4kje/J+zjpVAOHw894XnJsPkxJAOm5AusqV5/WYI5pQWrtXZMSgr0Fq8L1rc99n1MqT4v/iuMw
 1Dn523PaX1Cuk/i3FS200FZIXgw3rY+M/vQe6Otta0OwnRtQKeFIHujY0zzOF3LmSuUSn8uWiH
 nB+dAOil7NOJfgYJZ+RMrz9b8GZ3RLCjP4Yl127Yf+6Ax/GoBAAA=
X-Change-ID: 20250704-615-21c25118e919
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611278; l=1477;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
 b=grlLrVJ6jx/TTDEJJuwgYqbqX7dX05ZxdRVsdgQleiXqmHnAtNBP41M88XBTIPP3XCm8zOXD7
 3qROm0MR4D8CFdOQAQ4YJy6X6H0kV3YMpc/PkljCiemX+QBOmQMbk5P
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68677792 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=TmzUbGvDyKMaPb01JRcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: a8vhZNLLr-9IriLuGCj-ZeSlcMT6wtiX
X-Proofpoint-GUID: a8vhZNLLr-9IriLuGCj-ZeSlcMT6wtiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX+C96MgwD9F/0
 SGYB3XCGTS/P1rDqGMP4/GaRdbsvkIu0MpcQT/qFrUJIVa8pBuNSHlt93nF4Y+tvk4t/jmhmRft
 S3LZueZczaiKE00KUHfmGUmLTD+Vk/RyZlK9TnA+te62PVUZ0daBNt/xh4Oizm62zjAwv302YvC
 ERID0Goqi4zwfpnEvFqX/5IGQwtRNb2DnVPleWezJx6MH2CockIPykJaa/IG4l7X74xBIMHfNUP
 grFZ0wzgg+0AFHMxIEnP2Nd0JkYTel8buJNSplMm43bQsLN25XtEs9Xz+CnR0/BflvO26ztOn9u
 n7phl9wuyiUuNhiPSPgZlPm1cysZnV/kl3l/4MCpmG/Eqz2A2i3vTeKu3g/O8BLekAUzwdwcH+a
 Dn4L8Z8SJVEi3ZPLcVQul9AZ+35dWdUM6TYCg7KGfgw2oPsS8Wi/TxE0m65LfDDZ1pzq5rLj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040051

This patch series depends on:
- PCIe
https://lore.kernel.org/all/20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com/

Changes in v3:
- Formatting: adjust layout based on reviewer feedback.
- Fix DT checking warnings.
- Link to v2:
  https://lore.kernel.org/r/20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com

Changes in V2:
- Correct the version metadata of the previous patch.
- Separate the modifications to the DTS and DTSI files into different
  commits.
- Formatting: adjust layout based on reviewer feedback.
- Updated the email address.
- Link to v1:
  https://lore.kernel.org/all/20241203060318.1750927-1-quic_yuzha@quicinc.com/

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
---
Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: add WiFi/BT nodes

 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 135 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     |   9 +++
 2 files changed, 144 insertions(+)
---
base-commit: 8d6c58332c7a8ba025fcfa76888b6c37dbce9633
change-id: 20250704-615-21c25118e919
prerequisite-message-id: <20250703095630.669044-1-ziyue.zhang@oss.qualcomm.com>
prerequisite-patch-id: 37d5ab98a6918dba98ef8fd7e6c91ab98aace170
prerequisite-patch-id: 1693faa1e23bbb0a37d4fb9cbe13e5dd43148ce8
prerequisite-patch-id: efa688b2ddd5744df7aef40182787ee4ceb90c98

Best regards,
-- 
Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>

