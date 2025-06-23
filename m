Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96262517AF
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693770; cv=none; b=LnIdYx21n2xZBdKVznAvoJ4IbjDiQcXSZDfoDzUuBkixykZ47Ew6TLb7XKeNYvRTGaUBTUkobe1fK6z/i9xtHH8IHrnUP3ta2TCAfIcqUo8Ac/f1Op7+X98t/Y4MOtmW0WoERUOxWM5JtprRwCjqSUys0wjwqObBCTCTRiU/eS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693770; c=relaxed/simple;
	bh=X/bAF2TNbXnzhe4oF4P3tu5+sLD6uP/XlevngG2itCg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DfLdaLby4Exr/U/L8g19jDXUbPSAz3ImJ0knFSjHSi5FLBR+EsVh1ttIZoe8ZY6uhW2wpdMgPb6Hpjdc+sataIYp/KE2H0TgbRiMGtr60kDOE4g25w//fXXGFRTWZ+KPiqAlNSVOBVFle4fvqjVUHYFAoBTkJKkN8knmDShSlB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAbcCwwt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAbcCwwt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N93A4x015471
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/FTgFQceHzcn7zExBhEXuf
	yVW/RSqrJSAUW2RET5N6U=; b=mAbcCwwtEl2BoT6Mzvs1Tce5Ddd/Nxtz/G8bl6
	3SJ1nsske2+PYv3q5X9MCuVJP70KoqV7OxQaUPZIhQTp6tFxhxpYMDAMQvDWZ9Ws
	gzexT58bMSLndUEcUNSyaRJyJVEguoluo/ldXHpr4PWtfJaKI28MCSs59vzAQZA1
	053VLQtFGUlhPU8TedZrxkRqjvp53IL8UcA/WjQjwV3YJhhco+ugnC2IocCbGAJO
	96HtsyBFlmNDdk89LJYDZb+JmbcLtZSdGUp+NeCWgVUHqoDtiPjPhZfcBUiOjCTj
	bh2SXDkktksHS3/Ixw/aURJkR9yKrGbAp5VjrdcIHj+xgn6w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3xu16q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:49:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2356ce55d33so63252035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693766; x=1751298566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FTgFQceHzcn7zExBhEXufyVW/RSqrJSAUW2RET5N6U=;
        b=VVy1+wEizJhNmIy61addLq22N6bO/zwHOYPg4q0POuCSJ0NJsTdNYml/5lWtqTQ4as
         0A0W3qKu0rHwqqAYhDLpx80iOMPq+0EPfndLc4RunZlPf6eT3NqkCAKviJ5j1btScwIS
         25KXzHu+UoSnct6pTTLTK+IaV/E/b7GnMuQLyo+LHv6d8YazUZWYLP77MIxQHTGhOxbD
         AfNQXN16NNCuCI5BZunaoFyMrPSeqmKWVrSOeDSz81wheBEQ6dtU7AwxRxVpMfW5NvTE
         Ody9B4GlcqUdsDIq0FE5lEqQFSoiIycvxZlyYGV+3+B/6RvoE9oW4u6hQW7jqgg8/hwn
         BmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCULcFgsT1LNrMUuxgRFXhvMER5mx9/Y8YPaQMVSISgawdJoDLeKwtfaFuGsIWKVjqdicqPIaBYc7vpvTaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN866/WeOiU4tYWiE+OU4ky6miByG82Px+AvJDe+5cxU4Xzmtk
	4CU/08HdxSN6Mp0uhRBnjTWLuRq0aD0RS3N2UDvVtVEplFinTw1e1noty0rg0nPvO+xP+ejmW9J
	uX7grcB70G4tN9mzhndNq5zssa6twATkZb3k3h1coMbNJtTD0+FW+0P4BCdmgfMOVurw=
X-Gm-Gg: ASbGncukz0wD7Pl1HS/RYc1jD2mLgJ92zO2SW51aXyeyo4bm+1KXFNl/rR26aqpfqCz
	BwwSRXCN+z6MPNVUjXYK5nxNyArHKdtpb2DCsyOYy3eDJTR0fS0lNF+UxWSLM7Nq+HsgNCKPQQc
	Ac8N1Tdh70KG7aq5UqtbauomXddD5R7yORf1tbcXKgxWNnKYJviqfXRrxqYhDVFiorjod7W9xsi
	MUSa6Sg84LML7f6FP+YHCAZqqoPg0XO3bhNhqN8soJXJUY7I6zPCahmnbsxuBnNXZaTcOFJxKO5
	hQp6e0wPFYmvM5v1x30XgsxxVumvTZ68mQQCQF/y8uchp9QHn0+nnPhYZ3/c4TsA0yQnp8ts5K6
	Di74c2uBlDWthKc5USykWsMzfVhKabomAXlcZ+U4CCHdpKYM=
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr197474995ad.11.1750693766007;
        Mon, 23 Jun 2025 08:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFU3ABXiRqt3xUYh9w8TVC9FxESy/q0q0aSkLDt7c0OY6Y6oqyIh13ZrozUzjpmduHLQDZTg==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr197474645ad.11.1750693765598;
        Mon, 23 Jun 2025 08:49:25 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83f14a2sm88447095ad.80.2025.06.23.08.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:49:25 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor value
Date: Mon, 23 Jun 2025 21:19:08 +0530
Message-Id: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHR3WWgC/3WNQQqDMBREryJ/3UhMGrVd9R5FJGqsAc23+VEs4
 t0b7Lqbgccwb3Yg460huCc7eLNasugiiEsC7aDdyzDbRQbBheIqk4yWeUYfam/0WDu0ZOp+RPR
 McHUr85vM205CnM/e9HY71U/QYWDObAGq2AyWAvrP+blmZ//Ti/K/fs0YZ/yqeNF0smmL/IFE6
 XvRY4vTlMaA6jiOLzdlUtTRAAAA
X-Change-ID: 20250513-support_real_noise_floor-205986936cd3
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5NSBTYWx0ZWRfX+h1XpMiOFBXG
 r5efQTgSx4GhVUbXD7iibop/UOpcseJaQwpumm7m50gjKa01Ls4jeowkCX/N4walP8kLw689u6Y
 Nko9p9G1qMnoJsFdBEEFjNDKfo+LOjzctkEGbvd2Vn7c8czmwIFo9amzX8PY6ZGouBwgzdkenFY
 pbKijrmvu0/daQawSNGvkK5ini3yb4hQwWgpmUzTAWSJus0GGj73to7NHjLF46dObNGUZjwEPX+
 ITtoraJTBJpzNW0O/JcdtK7TsP506ncwWR2c2NF5xN5HLgL95uzhoIr9Qh3nCzL1gp7ETlBKZPH
 M9RtDayyAMbDk8C5yQlpVn+slU25K3ssbN6Wp8befkhoUNLn2PJPvsVEIIAw8v8nOhV9zfEEcD/
 wGbrvWJTUPQO0DXNTn68GG9KvePqHD+Xpd5VR53EmJp7BVD6P1WOGyXtCP60Qotxq2AEkTvI
X-Authority-Analysis: v=2.4 cv=SvuQ6OO0 c=1 sm=1 tr=0 ts=68597787 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oo-PE9G31wNHbytkz5MA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: jBkRIQd1R7NiIC5T5c817jrRttb5lAVU
X-Proofpoint-GUID: jBkRIQd1R7NiIC5T5c817jrRttb5lAVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230095

At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
value, providing an estimated noise floor value. Consequently, the RSSI
value is also approximate. This works but however, using actual noise floor
value will enable the reporting of the true RSSI value.

The firmware possesses the necessary data to determine the actual noise
floor. This data is provided to the host via the WMI event
WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
runtime parameters needed for calculating the real noise floor in dBm. This
event is triggered by the firmware during channel changes, temperature
offset adjustments, and hardware chainmask modifications.

Add support to handle and parse this WMI event. Use the received values to
calculate and store the noise floor value and use at the required places.

---
Changes in v2:
- Rebased to latest main. Simple conflict was only in wmi.h. No other changes.
- Link to v1: https://lore.kernel.org/r/20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com

---
Raj Kumar Bhagat (2):
      wifi: ath12k: handle WMI event for real noise floor calculation
      wifi: ath12k: use real noise floor instead of default value

 drivers/net/wireless/ath/ath12k/core.h   |  17 +++
 drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
 drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
 drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
 6 files changed, 324 insertions(+), 9 deletions(-)
---
base-commit: e9efdcce074c55be396ca45add336121549bdcbc
change-id: 20250513-support_real_noise_floor-205986936cd3

