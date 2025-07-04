Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D5D260571
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751611418; cv=none; b=tbPGSE3pFGnm7ltq9OlxdwwhDQdNkzRsXnUHRX35J7XCpQ/jp5DV3WRBj7hGF/Rd3ORCLZKsmAi8fOWsVQaJhUUZOmsfGBqdEJWvhd1XIP04bO2RtBSSDCmcx23vThRrHv1XZLbg3N83tHAmJey2n7oo08W7dyH7/yN65Vi7uuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751611418; c=relaxed/simple;
	bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=juWf5H/KNx33PRIA57V3MtosTX/+yLdTK6/meTesPDm1olH5+JJqVfgVWl5lh6N+7+ZeuBv3Xdxv68Ur9XwB6AA+/ix4K4Z2ijGy88gR6q6+NMUZl/Jpt7YXIGqkayk+ia6ZUtrt/po+FUkbSFTuhh9CzuM6Yf3cQGzHjQot1c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K//zEAGH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K//zEAGH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563HI9jB022002
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 06:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2XKEYcroMPJpNNqAp+mZe5
	8vSDLDJjE9DwyGFdh30rI=; b=K//zEAGH12LDm4ottBih6fb6i/liqmGQzNiEkY
	1avkUqw9E43Ig+b+RW/mKgImOQAn1pHK78fy+c9soke0n396+RcQK3tPFBqASZxv
	kiocjyu/laBEApsmJsqdUVKdhzGcd1yXH0kciOmlV7wwtAlkrCT5mIrkXLwmJCus
	/9H/35kjeLRso0AQxw8GFYBHSLQnLOuEnfBJ1n/Z3Bne3Z11ANH+PAGJxKhUo3zc
	/jPST8xDVsFqD2YoKRq10nG3uRUK3IHlx30qSQbp+D1O7w7ojHxUI82oBbn3n6yF
	gwU8zWH71przlJ4C/2YbZg6/ZtAcAmcJEBeVmO3N9PLDgfqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxtv8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 06:43:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313ff01d2a6so713809a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 23:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751611414; x=1752216214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XKEYcroMPJpNNqAp+mZe58vSDLDJjE9DwyGFdh30rI=;
        b=QokxDZAB7gH8Lwtwakkhl1Mm63x7zvXjm9SuQp/CpXZeIHlPgurK5oV9zUwtacOeLu
         hU0yWpywP65GqtKkfsKK/1yLazvr9V2zsEtFiE3OOQh+sZeiyA9r1juPfSgNO0uh04Gx
         THJnpnQB6IONvQEkHnfy6KofMR3+28xudDUnRVngTvH5v0DPCbSK82PaI9eCm2hnFm70
         tln6FWYCS5x1b1md8wQxIZbOr0YhbewGh4VmHr9AzmANm5DVx5INlMmFF5zkhjAvhGIt
         t00a7eZuKIf8dR1FkLAM09FFY35SwwavDUcWxX2/hdjhhS6u2K5FkDacH1s+pOW2xv8W
         TqJA==
X-Forwarded-Encrypted: i=1; AJvYcCX9Llh6kIbdGQeOqYeFyJASQ0ryeYiOmB2pBM7v2ZBY6Pe+U6G17GVepg/KSGHxh4Gk/PIojvv2Df+OuhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jvX44fOmNckpKwrXRhPiZq3FLsfHjq3tJdV5VkClkypS0qqW
	X6U9588DZPySj+EoFC6MrSnTZIjPitgIokGzKJuNdxHHG5xBSEGX8wLsmz7RrW0vp7B3KNDP2I8
	TuJgJ6C3TMUu3toWI/PhmPSGbIaGH2vxp478MMduR5aPRBUpX21B81qkKNSlTWSjxddw=
X-Gm-Gg: ASbGncvfsw30F6OiaO3+lBM54foWOC7A8C8RGqHsVesQrIwuqtnDTK8EtDyg4cF0295
	+0TJIZmXNSAA0MmD2f/Z6m5PLB/Kj3KEYpyB3a6+h9R7RzNx3qFOJzfm+HFYJjT8T0kXITL3bZQ
	uNepQpAyjTNdceWwJAW1c27FAvrYIkOf1zbmQAkEr11xixwjUkf26J/pWtZRbOIZxI/8rzhTOKj
	JndLmcVZmh+d7TAF5tF8bkhRhvj/oCri4993O/qJMR6UZPtWJcM81k1mruBCTgBkZ5lt9Ipd3jl
	EqkjMu3rhKqfvDtlxmlbij25jKa8GWmj0/MNTgqieI6qcxp4/jBusvSMOMRBXWVXW5uujIgG+hk
	ycuwJu7Hfzg==
X-Received: by 2002:a17:90b:5205:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-31aac43e002mr2637657a91.2.1751611413984;
        Thu, 03 Jul 2025 23:43:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTji2b7g7CyyIxHemh62b65s7VRcn5dEfOSvtJ3uANGqEo+LW+UVy053hMzPuc8XBnv5oONQ==
X-Received: by 2002:a17:90b:5205:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-31aac43e002mr2637606a91.2.1751611413412;
        Thu, 03 Jul 2025 23:43:33 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae3e24asm1260338a91.5.2025.07.03.23.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 23:43:32 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Add WiFi/BT node for qcs615 ride board.
Date: Fri, 04 Jul 2025 14:43:19 +0800
Message-Id: <20250704-615-v3-0-6c384e0470f2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAh4Z2gC/22QzWrDMBCEX8XoXBmt/mVK6XuEHmR53QjquLFsk
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751611410; l=1477;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=jty4VCWzrjoGz/VBm938Vlu8XxCsF0DbU+pvnjj1hug=;
 b=AkusZETtP4gSlZHAz5lfczZAYTe+yL8YIor+o5MI7IOpL6AVON3IlHmTHvvjEBMJcu1dp4a2s
 OOHO/ZozS6nAIWrqNs9SKMql4H4nFg0jmbWdLKfg3sW/IGnw5sw7wS2
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA1MSBTYWx0ZWRfX+kB9UEm4SXKb
 cpl8J5o0LSvDW9AwnE0PIIBwQRyShSfcHYKukij1TS/09cD7vXdWdQ6wpcozUmcawmWDDkQ4Vzu
 fO2s8GAsIiVvwJkLXz2cua+bAcEpbSt9xrDYIo/8LYZADryydLwjKHScxDcfgBkLxyfozTuk4xa
 5m5Xl8DuApTPBPEE9BXatBF2I4tD1jW1W8XOyogm3WePv0JPvB/iURVyMWvJPk+C2wCJ2NEG2Yv
 hpJESQLaG8SCe7qq8El1a2ayM7AJaRD7ge3yqiFH0n0xmo5xqeFUQ58daLaK+HvZdH5ULsBUTCi
 NppEzn9/AcciZknbjDQF3H0vlLgbM8XeLeaH/3R044kKVmtOZlTlAxzDkeZLVsgG/JssiaoGh11
 wr11NyvxzqvOzYBZ61nB4IymVRENlSs/syjl5nKx3hT1l2INwpEHgDwK7yuD0Zi51RtCVQ9W
X-Proofpoint-GUID: XLwYy9fi2WE-MKm_mZ5obBLOD-arXtKu
X-Proofpoint-ORIG-GUID: XLwYy9fi2WE-MKm_mZ5obBLOD-arXtKu
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=68677817 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=TmzUbGvDyKMaPb01JRcA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

