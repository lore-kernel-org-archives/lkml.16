Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2978926A0CC
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643602; cv=none; b=hq+ncrURqNSWUgdK6OP0GFRVCRaOq36pDrR7+G1pZl8VOclkRruNeiemtPp6Z5QtoXkHyxFvthNdhh4q9/Bh84KVDWn1Z26Qcon0m/Te9rDyAOuAde3304DeymGaIBj2aCz056bFMy751fFjR+tNe+buCL+OzSiT1QKh2Sd7yJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643602; c=relaxed/simple;
	bh=BCY95S5YwyhuN7eprWN+F7brDc0QM3mQom5N5iyKPjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HwFVJudlKotPW0pqc8daWRNs7/eVz9+lpVwhnmc2xeLTuTr54/DgBYOrAH+f6Yfx3VjX6UGzg7m8gGkBBnwza2IKiXf9KhNew8grZ/Gd3MmMbpCril4+lq6iwIk9pU3Y0s9q4BmoH2BvXbLZDsci7d1FKWT+7408xKKPE+prkTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGF4TJCO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGF4TJCO"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IKmKif021031
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BsvjJCHHiTx
	Tor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=; b=HGF4TJCOB58H8VfjEUyt3c1jeT+
	1veTtGVBFp3jqXFjZ3dSvBryT1efjThfW+8F9V6WEPTE3+uRbVGBVGxXSicx64ui
	QjsGh/uLNtrpWvvc/NebhrpYK8tfKYXBzsoEDQ92aB8XUiGgM7btkbwncg3vGvYl
	2h/YPF+HtO/z+D+u6Cx/q2fo/BoQJcJp+njhA8LyeymcbPOBGRqp0k0so2dReK3v
	MxUvjMT9oWmc6nerR36QYl8BWx0A8J1Cdub1RQikNheSGIbzjUDxooqhkuboMCP5
	dldKV/+MDa0b2Kgu2MkCLjYvdVv6ZuDsdvPTkaZncAdoLKK7TLFc/XajRvw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9umt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:33:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b16b35ea570so4090271a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643598; x=1748248398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsvjJCHHiTxTor+DpQ8GKlT0ZZeN/JEv0ETifCmbtVc=;
        b=lMSI+sWCzW3oDOu5aa1kp1O22Y7jxS1OHiqDaIv0XQb4nQGTc+7QBmiefJsTe5HF/G
         RjWLTMvgT408pADyAvA34zlYyBYeRz/bG5dl3P4z1XLsjUdRlsWmaMVikdFStqWkNz3h
         PGgFONojUiBm3bHbWzjgC62UWoD4j2LZnDYQQcELcyYgrm55OsZrgt2WUHVmKEx3XXQL
         EqTG81XrrcK6n1NcDC0iRkXnZV46qbcDRHOxObN6SiV+8O9wzZwxaxsp6OvdYaJHveEo
         Z2Ef4Q9Et/gT9k6g4zHecRSL53y0O+5HPYusxDfZfNUS/D3IN6R7nwQmu9p/9HXYYnI1
         l7/A==
X-Forwarded-Encrypted: i=1; AJvYcCWCwZqWDLPkP3slmfeUifyn8XEme2yW+1dDP/IJ8vawDwEfZkUP4P6NyyMbAl0eLTZIuCDBZkPZEXK9CAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnuYLUkaqKw1OopR2Q+7VQb1s67dsjUKU88Apo+tyfaw0pVFr
	DjdGPA7diTSYoWK4tc2EDR47ZZ/spUZ9xP+EqUR0mrKINC9Lg5F3b9oWjcimbHZ00ymcrGFnFff
	xwe5Zkneu71Q5DIo41FM+0gjA4uyPQcD5s+a3bqrOcW1/EHa/ZVHYN+Y+ESC0VpMSth0=
X-Gm-Gg: ASbGncvhnwidDIopjkv+8Og7v6XDOSj/4wTOl8jU0Qlq/E7s0FWkoIsEf0tu2+6zMc5
	R4RZNepdKFOiOFrEmdUN3HGgQATWgh/livLZmkqTB+S+biGNpOXYHU7Fjji1mJrocuDpCtmEEii
	LM8ZyJvNs+CXbiM3yXdhT9e+tgzwMxcwi/986/fONn28mJKpOrzXoACuGrf3x1KNq7KNhtG8oCc
	U5E8NTcb1hKjSkJhfyqLE8cWEpKyNkw3Z/XQoBiXmCHA6W2i/MMy2E5v/VfqylNCTk0o84KBpMz
	VAPDoXq4MzwJXLbrX998gBDVad4m5rfY9VBNsXO9YTJBQwgM
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199424a91.0.1747643598427;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGK16vnqAO96Pzvim2OZIqPkjJATrLQNDQbP19YpepwUrlpJVdSfxpSAk8bvv0p3I37g+7Cyg==
X-Received: by 2002:a17:90b:28c5:b0:2fc:3264:3657 with SMTP id 98e67ed59e1d1-30e7d2ded9bmr22199395a91.0.1747643598063;
        Mon, 19 May 2025 01:33:18 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6af9d586sm7003887a91.11.2025.05.19.01.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:33:17 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com
Subject: [PATCH v1 1/2] ASoC: dt-bindings: qcom,sm8250: Add QCS9100 and QCS9075 sound card
Date: Mon, 19 May 2025 14:02:43 +0530
Message-Id: <20250519083244.4070689-2-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250519083244.4070689-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bWDyk6E-KVBNnbtRD2ejWBKEM8zpEXxU
X-Proofpoint-ORIG-GUID: bWDyk6E-KVBNnbtRD2ejWBKEM8zpEXxU
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682aeccf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=kbphIXzXdx9KadpZM_wA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MCBTYWx0ZWRfX+c/xkkVHpz0C
 qbCbdsNq+p2VAkmujE5VbzBqgfuhEZd/Ne7EhtMIS6WWlGZE4w4Ts1Mq3oJtcucrLcggzFvO+CR
 QqspcLmJqIQks+tUj7CNaa+RMrV8hoWNI2IG9OMpr607CRhzto5iYJ2wwSg1drUgX8TqOevouwt
 K7KVIwwT+vznG33Aj2EbFDItm9vQyy1uYxniiSWfhMgA/hRgQAHwCtsjvr0YjypofV6lF8uqrfG
 SKrfnZaAL0WsCIIVyXFsEeAQ24Tm3RrVbVW5LJr1RfNzVb/3Iq+EXr03525Evb0kJuwAJGWfsGG
 woCNILQkV97nVTAr4hWMGPqMc2/KiysZfQrSeK1YXmugEfAZxN0flEh/e8LWa9WOrHZmAAZC13C
 ve2B4Sr7lK50O/wSJ7KFwC3cUq0QcCrb5R9SPkkYB+pfHGNJais8JO+DOyIZDUYZatc2krvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1011 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190080

Document the bindings for the Qualcomm QCS9100 and QCS9075 board
specific sound card.

The bindings are the same as for other newer Qualcomm ADSP sound cards,
thus keep them in existing qcom,sm8250.yaml file, even though Linux driver
is separate.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 4e208cb7f6c6..5c6e990dc55c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -31,6 +31,8 @@ properties:
           - qcom,apq8096-sndcard
           - qcom,qcm6490-idp-sndcard
           - qcom,qcs6490-rb3gen2-sndcard
+          - qcom,qcs9075-sndcard
+          - qcom,qcs9100-sndcard
           - qcom,qrb4210-rb2-sndcard
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
-- 
2.34.1

