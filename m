Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37F28C87C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134533; cv=none; b=t8U0i/chZcXtUg58m0+6G6uY7YT8dZH3pFHVxT3wNLHhXiiqWuw9I4oE/eG5Tjp4tXH+q1UU46D++WmRwoxV0tJ+uBJc2Z5aZWRxy4KbnhVmWC5IkoRmDNi/NqLJ8D1Znwe0n3pVtX9nNq0n/KU+WQg92JxdgZ3cwoV+d+ckKk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134533; c=relaxed/simple;
	bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=spdSDXakJqyW3FrgOBReFUnlsgALFJH+cgCXiEXXZbirMPsK/05e3VV4lmSTRuqSy8qRq9DStwJGGYVFKR5b6maDKyCRxliux+lC49+S+IIlXhrT+uRnwiYwBSnoaJiZw685a/7C++D9EHu+4/QcyGf+HaVnB40/nDNQXuk2MdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll0RsFi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll0RsFi3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D72aok027758
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TdcskCO2K/Wyi90DbkJBCc
	6FCyelyPLh1fYHTqrysmg=; b=Ll0RsFi3Z1nYvX2B6WtHFLRhJFf/frMjBJf0QM
	egtXLOPCcB/nrv0CEZF3N91IiA/pdiY8hHv52Up+7Kepqa66gBBBOthKH0YMN+zy
	y0lEJSi2tvX6XvzrKrsUJwzQVHyUgax+Rew4qreFo/aSoLNt2aEvGd6CTo1HADQA
	Dquth35rwQxKa4+boK/7vOpCaSnNqJWXc1qD3rfcR5c12mhExYTOr7aGu+I71Cqz
	NrSQGEQzkjlxYLmzjnlZd1H80Y3mfzSYhjx+LMBQRyAoBgUyuaYf8cg3Dygh3V5J
	6aOoBIBzXZT6uRIZwGzBfsaF4kmSZdklZT/EnZv+uf762LKg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hwt97gr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:08:50 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b20027d9ac0so3130995a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134526; x=1747739326;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdcskCO2K/Wyi90DbkJBCc6FCyelyPLh1fYHTqrysmg=;
        b=at9PfM2+6TDAUFG3nZQzT7SxaVhrP3gA8sy2u0risU1E2Kti0bXx6TNX/O2GFwYwdA
         jIVth68UlCD9haFxwGIkPQZcF8VON1T1UIp6sWDbyBoJ7EB6vPxIs07EzDE5LIdByzga
         ry1RQKKwgj+juqqQ0XBxvQUha1LgCtyNYxhgdPcY9kVf6RAHe/jiiqdtvWBn3UNdMKwQ
         WrBWF8SGSGu4d7+xTo8Dk1FXR8nmje5cadQVmnyVMbLKxzWCfjhwOhImtQKezekWy/NF
         yu5vDD4anR8YGIJuQxj/yJaG4GNQvBNsjxjo4nWSKjBjRlhGLqdafaO1HebeOz+hK/DK
         4gOg==
X-Forwarded-Encrypted: i=1; AJvYcCXvbUBlf6nqz4u4/RRxbABtmu9JZxSl3HlUh8bwfjJNJKxW6L6H2FlyuVjALau1bHsJFH3EMslA4pGioGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfzPhMnGbTXNIxOCf/lAlm83RcxVCOu2OsVTSXOrIRD+HTbhe1
	t/s2hHopX75kl6tlDepcaa1qhepl1b99oP2ga/O6RTxKwzv+Rmuoys803mkFy3Z4/U1ZjLWXWby
	YADwkjvB5tswqhyI1QwjL/s5KjHK6TirvMSnxG+4bGSg+MOs3En+WyAcWagT7z9c=
X-Gm-Gg: ASbGncshkWpWW+jjdaWVrBWUscW6MD7cPuHUW3PTrNHFnFYKYAawLcMuOKFDavAl2lL
	8zi7xUdWQ71ZxqKofX819VtHXvZ1m+6fIts0C78llFg+IUq/YDKQxP3rXyWINk5P6IBLdNPoR7v
	IksanYmStYCEsm4WolaedlX4NrHCNA7TEubY7RY0rxIMm+R4e1bJpC9o8v91lrVwbq1uOFi312j
	fg5BhmON3CABB63yeK2YhhowjNKqsN4y4h6VLVCDo9+WBZTZzb1E5OccReP14LBahSylHcOJnlb
	f6N6GjUczpgRbKTek9tIHgFbYS8FdAHvTSXX36PWiYCITx22cteZGkrS+4oKOLi7SM95NUc6WIF
	lhtO9SNbetUae8nU+OAKCDkJ0S9wgzBwyO1ntl0fIkVuylQg=
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416462637.35.1747134526287;
        Tue, 13 May 2025 04:08:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwN2TRFlFW2UrWDD2VPfw/5b4OcIVv3/BEHBl6G3cH26syPZhvz9HpnkVuSopGz++v8+1RpQ==
X-Received: by 2002:a05:6a21:9982:b0:1f3:2e85:c052 with SMTP id adf61e73a8af0-215abc613a1mr29416412637.35.1747134525847;
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b251957fef4sm6051656a12.75.2025.05.13.04.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:08:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 13 May 2025 16:38:33 +0530
Subject: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADAoI2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nj3UyjZN2k0mLdtKLUQt3EZBMzYxNjCzPLRBMloJaCotS0zAqwcdG
 xtbUATUlz714AAAA=
X-Change-ID: 20250513-i2c-bus-freq-ac46343869a4
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747134522; l=1564;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=rdpI6SyCzEcz0rHhDFC3KBNtrPw+BnurZ+tDNY7GaGg=;
 b=LCHz9YCCEIlr+bjBQdea52XKoMJwQDH+j2d3dmop+sliEw7Fqh/3EA9PeKXG5vTE6dxR5fRNo
 jw2wBTtLHrBChGI68l+LbQvNJi5gGwM3e1IJJpS8ktEabI6RyF7Srtq
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDEwNiBTYWx0ZWRfX/eeVBlp9O2n/
 g9bJMqsvLNiCfO+JFJKCbt6GQwTKvpd86oxR0KWkq9eLTeWGLlsY+2ZdqyqkbM8/78gUlsR1V7N
 oqoFv6cW/1TVExIxzf7nDntHLRVQBi0tPd1eAwyd1X2d3/dJRXjfV4XQDtUqnVobHSdC54q/dli
 4CPYJXlwvVmhYB+xZk3zl8+owohJs/ecB/6HNYRnsQnmCBBqAmHY3TcIr/9M2ULF45zBY4vPWr+
 iY9KSIRIxJzwDhIJe79IoyC9P3MktDBtae5nIp67vHQbHpp/WodTKvIs6+CohUl/JewyD0WY3B/
 tt9XsWLcIRpDGSteK2M/A4au3scfgGMPIyL60cRHarz0an6a4PQ849I7PDP3MyLCR1BQYEwqPtF
 HJvEoPQVEuWSWmlw1u0ckK3pW/Tdrt5G1HCMnZkXmuqluE6qebrefV0x/KK/dMZrSOQXpK5w
X-Proofpoint-ORIG-GUID: n5_TA4d_M-y3zOUM6I1mNVKEyWykkRbK
X-Proofpoint-GUID: n5_TA4d_M-y3zOUM6I1mNVKEyWykkRbK
X-Authority-Analysis: v=2.4 cv=a58w9VSF c=1 sm=1 tr=0 ts=68232842 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=c3nHYIS01CY_1xjDKk0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130106

Update the I2C frequency table to match the recommended values
specified in the I2C hardware programming guide. In the current IPQ5424
configuration where 32MHz is the source clock, the I2C bus frequencies do
not meet expectations—for instance, 363KHz is achieved instead of the
expected 400KHz.

Cc: stable@kernel.org
Fixes: 506bb2ab0075 ("i2c: qcom-geni: Support systems with 32MHz serial engine clock")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index ccea575fb7838db864ca4a2b21ebb3835b2567b2..2fec7b44bfc1baec68e321a9f57de4156120919b 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -155,9 +155,9 @@ static const struct geni_i2c_clk_fld geni_i2c_clk_map_19p2mhz[] = {
 
 /* source_clock = 32 MHz */
 static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
-	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
-	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
-	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
+	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
+	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
+	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
 	{}
 };
 

---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-i2c-bus-freq-ac46343869a4

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

