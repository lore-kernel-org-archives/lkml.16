Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F073D6F
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751256940; cv=none; b=RZbbBVeuwts2wNqo/F4kgrqMIM2onGicoPsr6FPBWRxkNJZwkqovM68a7UH1m+HBHWJ+CM5gulVxrvGMfhJDZ3HgF7wXHoIF4w33/OVSNbBVm/2/7Q/eOfioYC7YTAYpU41OD8lKGsUEEkHhvfVTq0O1yHfucQEBaLIEw172UTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751256940; c=relaxed/simple;
	bh=dpAMUqYYxK35rw+dfbYr6B3/oW/qsvP66eDQqd4x29c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DMDjalKsFq1gBX5KZBuY1vuH+p8zu7004m1hJyt3LvSq8neWaOqm+fgX0SMeesmrwauiwnBZhEN7U0VNcHycBwiu5V+HQGw8fzKWBldm3K54UmeNi8g4wB5r9DTsHB4DbPXujtYSXw92/ecL577GZo0dp3aa4Gwczh18ZN4IE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaqFnwHm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaqFnwHm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TNs6on018627
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qGzcms3g66ClBMUbAsGHzO
	LkXJSGY0Hq5IfiKugct0Q=; b=AaqFnwHm6yBQRurkcdNN6iPNLtySSvS+eMRbGb
	MQ4XVxHDG2f6Jb1qAhTo717ER5E1K8svP9YDRjmO5b74VP5lhRv7Q01SZ8Gwr8lC
	ZKWujMFlnf/WKJZ8z7ARj/yfVIP1V3IvstFRFVp3vQ6wfbAQlRl6ZvTGGnwKRJYt
	mLkQZl/M/Z2FLDHcKc3UL+DEsYoDIDYq4dn0B9Occ29t2fMT0XN87RZ5gZFUKOLB
	g/inyzDTpzCswWfmbR+PpaGBnbXx65/kIxurV2CTeP9pt+mjMuugzk/XAd8ghkWj
	nytkAcr8p/r4c00o4tpoKN1H/2rjFxUhNHBx2sJq5lAImWlA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9jpu6dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:15:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23507382e64so13421505ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 21:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751256937; x=1751861737;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGzcms3g66ClBMUbAsGHzOLkXJSGY0Hq5IfiKugct0Q=;
        b=f7DDY/wsWzPQ5Z1WltLpQB3HetV5KH4C5ZnjXJze9KeUztoz0byYe5MgvDFeNgYluO
         GQnZSCLxTGbZF3A7BIbFUDPoqz0wWEj2qkxRpewsj2QJtFHWyMA9i6ypl1RtgK6Rs28z
         w8atarKogzTRbUk3IDs5KiXTUfaWsuTfkok5K/4ybz1rQb5m/qH8OO4BjFz1aiauAuci
         FxJvo/lgDMwWrA87wEfF6anrAbgRyFzX/XxB3IKwqS40Ul1zLcAnb7AVLngOvrLZ+IeF
         uX4pB10Dh5cR8SADX8Zl1Oyqu9ar7eWbOp+Kvbjujmxt7x5R1qlWR8LYJe32j0a3avdE
         wzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUscOjwP01mzpo5OTuHivou/U7UBFvdnnUIUSHdvqyWVH4yX2TRKbyk/wmxUk28JzmVPSsq/z59xiYJatE=@vger.kernel.org
X-Gm-Message-State: AOJu0YziolpG9JCBb6Tf+IImLfsIz9ITiBc9Et/LXE0E2kBequaGMuFG
	2do+52CH+ZNZStU6xDcd9CeZL1ccLNaGMrTgu8Gc/N8nBcKwZ8MIkpxpmqK2odUuqcMauJNT/iH
	33HbEXsUA8zw6rA+l8s1T0S/jkmX73Uz8m1bNlbVccStF1OwkptJFk8VXhAKmB3gLQYg=
X-Gm-Gg: ASbGncvwHrdQALNeYC1LRTgB7PZ3MCTm9co0JRn7aus2cS5FyT22Jw/A1vtgwDngs9A
	DSldrxEkNAe/XsR9fLE2zUeSHrEmdCC8pJNReJhygUlpg/XxMhK8QmtKG20ATF9oJ5OUbGdGKMo
	wigp5QdKTImam8jR/Rl2kKHvVw528wxMeftAChp+sA9a5r5hEHhrZpY+QF4eT4GBPEhR29C0Trv
	ETNzmWztxxT2eOtoz5pVSZ7fChAq63LLk77JPKUwXreo9LGtPsYqcquqGXuHG1wf8k5gvlrIupM
	cvHj8ItoCxiSWCRnWodqp88sjam+Dh+qdKcNNa+Q5yMM8dt0+5ZldtoXdRPi9+t/4H/xquWr0L7
	FxQZLPK7uANDeYll57LsoSTzxOT7UBzhuFbyjnS1g7Xa1gUw=
X-Received: by 2002:a17:902:d2cf:b0:235:be0:db6b with SMTP id d9443c01a7336-23ac46072cdmr186350285ad.45.1751256936645;
        Sun, 29 Jun 2025 21:15:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqeRKfxDY/iKMYr5DMAalZ4UACgTDBd3pi1SPietxc+zp47vSCTe+s2PWEi7FrhvcHcloqnQ==
X-Received: by 2002:a17:902:d2cf:b0:235:be0:db6b with SMTP id d9443c01a7336-23ac46072cdmr186349995ad.45.1751256936247;
        Sun, 29 Jun 2025 21:15:36 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2f069csm69366955ad.59.2025.06.29.21.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:15:35 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: add support for Tx Power
 insertion
Date: Mon, 30 Jun 2025 09:45:14 +0530
Message-Id: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFIPYmgC/yWOSw7CMAxEr1J5jaU0ERVwFcSiog7xJgmOW4Kq3
 p2ULmee5rNCIWEqcOtWEFq4cIpN9KcOnmGML0KemgZr7NkMzmCZc06i6JOgVszpQ4IcW422KDo
 3eN9fJhqvFlpJFvJc/wN3GDVgpKrwOIjQe26LeuDdDFw0yXe/s23bD5rnrcWeAAAA
X-Change-ID: 20250630-support-for-tx-power-insertion-336ff18dea92
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAzMiBTYWx0ZWRfXyzYDYK2VgRH8
 z16Uo+BTK2tRiCEsBiJGltt81WrJ0kodW3c4nEHG2voocEHXpwx8IlUKI+GW2C43Iuv3E7HsQK/
 JkUyBDrQkpCXyc8yob2bz5fLUlnvoiqYP3W5F1LicohxHozFvR/3z9pfEJyDgx3iwSNzEYGykzh
 gdmkw2igXCjRDf1CWbtiPtnAYo61EQm+ezCy5JnxTlUYqv01DizFYTrMauuun9diZ8CuNqmo0oW
 bwbD5P6jliBq6SUFpS0ZkrJY4JtdsXCVCrLy8UL9T6yR6kLnbLGwCct7DcOTJ0CAnVEtjmapOmO
 dlgAAi80wchCgb1RJ5UYlK60e3u6LQB3efjRyDJMPcsh3hbaV3w6j0XGeB/u47pcsS/DrvuppNF
 MFMsWUvuD2Vftt+BobUzYDidiYG12H8TMYy3kNauWAFnX1nL5oJpMOd72iyIXilu8BpsNDzd
X-Proofpoint-ORIG-GUID: Si7IpBJakzoW9xUuV6hRMIkCMbdF6VBO
X-Authority-Analysis: v=2.4 cv=Tq7mhCXh c=1 sm=1 tr=0 ts=68620f69 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=j-PG032osGwMdhHMkLkA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Si7IpBJakzoW9xUuV6hRMIkCMbdF6VBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=953 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300032

For certain action frames like the TPC Report IE in the spectrum management
TPC Report action frame, and in the Radio Measurement Link Measurement
Report action frame there is a requirement to fill in the current
and max Tx power of the device in the packet.

Add support to populate these fields in the relevant packets. Advertise
this capability from the driver using the feature flag
NL80211_FEATURE_TX_POWER_INSERTION.

In software-encrypted cases such as PMF, skip insertion since the packets
are already encrypted and cannot be modified.

---
Aditya Kumar Singh (2):
      wifi: ath12k: add support for Tx Power insertion in RRM action frame
      wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support

 drivers/net/wireless/ath/ath12k/mac.c | 184 ++++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)
---
base-commit: 391a83d0c8ebb1e476cba73bf4c010af73993111
change-id: 20250630-support-for-tx-power-insertion-336ff18dea92

