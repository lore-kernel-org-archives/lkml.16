Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646BB27602F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749144450; cv=none; b=Xis5RFaPH+p56pSu78vJdAX/ki+z743vQfvUf521GF+VdaLyEIAyao35VkSB7eBCY1AQrWDofHAal8wG8AW6/Nz6nquqld185iHgqmLvKcbAYXPhjGA9sM+8p8uqS+gU8OhWVHFntC7E6zFFNHE5T+UcmRcwJo6kAUe8NC1Mhqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749144450; c=relaxed/simple;
	bh=dhkkN14WgrUSmUyToafAh2FH0ICjxxpgvf6bFXL0f4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LZEtZXe5sZBgqL2EyyksRoYTAF74Dq9EHEisU14MQvSZO59PQoH8TR5izZfENWwnQ7LXWwWmnnX/jx72ddks5HF+UDxLnJH98ZpSxW5AV0gNyPXPa10tt/LjJKQHTdYl9NP7qXgHMdfm+JJvzN2Y8KbkHh1QVCJZv7BRtkl702M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAN+pzXT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAN+pzXT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5559DtDO013323
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:27:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xm6VfkW3b6R38nakzaF1b
	bb+wxJ3bDtlf6fYnH8p0s=; b=mAN+pzXTJGnZmz6vpc4N99ETncv0WEUDRZfqIU
	1D1gSo9quyNrZmgOT5xChLi+cfSz6gqeaWO8BSNjGw6hgus75I1tGQ5jUP2Lueo0
	S2V7lRjr6OzVucm26L9jQ378pBe4xNVmFy+ijV7IWW96VDho4/Yx58IKv63MLzSF
	lI4yRMLai/jhLly5duCJwJB8Gb57FeWmoNH3e1OWq36p6I0L/HLi2EOpoUZOx1i3
	jWSvOglXv5QozxII9s7lfK9VfF/LYF5maf10rQ36FoB7fPZh63YOQmZZ5EBWmGyB
	jHdjibXScpRMy4UecsX2UvLG5jY7NXeTAbV+JCWhojo+7mMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be85uhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:27:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311e7337f26so1019723a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749144447; x=1749749247;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xm6VfkW3b6R38nakzaF1bbb+wxJ3bDtlf6fYnH8p0s=;
        b=Vc7MjaMrguaGmd6tm894sbIV3Inlpy65fLg01h6i75NW60iXbz4FHVRjOaU6mCYmK8
         PozIsBhqKUta4yg3TEimRmUfV6xOreIq4kSnEtVSGWuwtvkd9wJKzf9D6fXvJM9VvHEc
         UfATh5LrCBCfgZpfUxgLWwbhhVIQCD4/WceV11Zjo9iJU4bUpZP16ctmIw8hhcV2+Viw
         CLIzPf11kcVn/foC4fd8FxpTvXpsZzvtushREPzVD7udyRgm+8pQjUbSdHoTHf4v/Ggq
         k7tFYIrW7rv3nDwhKoaP6ltxa+DGteDvfb35q0ZKtrT69poZGK8dYB1EqfXNEm0fEfhR
         ubZA==
X-Forwarded-Encrypted: i=1; AJvYcCWgyyhIZlehrpD8hK186O2rcbQc9M1pkt+L8RQqhVvUDYjyf2/WGIKFw+jLLpZq1t59O9tWLEtGV0W2ix8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGZt98qCGoZuxXPcaGqomI+GajtHIgCfU0CYxH61Zud77Hh3H7
	7Op5owKJFbkexMTvIoF0TUg+LZQtu5Q0+yhPzD2FBkvYd35kTWl8YoXx8vRkEyGqKjunD/xr8iU
	1OshICnhhG1cBMBrwS+08F5BdPh8zUOgiyufySXBC5wH0OKaftruCi7lAK/xvhoR43QTQt/mhgJ
	c=
X-Gm-Gg: ASbGnctVx1kFPVLy5055t6ZVtJE+JoTWCAw1svtbUrsU/rr2C2JkrTKR+T5LaSoAGHC
	xgKHHdkYqcP9SPR1t6vWTEv1LcWTsYCXd2hV6KvelcR1/ZNQknC3bVxzNptqqH0q/9vWX7vNL8p
	g/u/+lNVQ2h8tG0vqCm7au1tgMHzUMffPLoUKrEitNDFGUxCvtI7CNDuswEZkGd7uz3RaEheEzk
	9OTaAiT4P+VL+W1+W5BhTyvWCB2jRaiEWRQVnz4QGw1WSpvwnhjh8wF0bCfyMFolQLVryQXqjDT
	aPaRGaYtU1gYE5RE9ACDUmpJQODhHluhXAqTFtDlpYy6Kwtx
X-Received: by 2002:a17:90b:2745:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-31347077370mr763369a91.29.1749144447239;
        Thu, 05 Jun 2025 10:27:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1HoQdeZlqYAmREaJI3cP23fIbpezAsHxgeEHIl1GsrF8SpIDQpOWIH7S6MY29Twac+yzaog==
X-Received: by 2002:a17:90b:2745:b0:312:ec3b:82c0 with SMTP id 98e67ed59e1d1-31347077370mr763341a91.29.1749144446832;
        Thu, 05 Jun 2025 10:27:26 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31349f44c28sm11096a91.23.2025.06.05.10.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:27:26 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Thu, 05 Jun 2025 10:27:22 -0700
Subject: [PATCH ath-next] wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-hal_reo_cmd_status-kdoc-v1-1-e59f4b814b88@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHnTQWgC/42OQW7CMBBFr4K8xiix40Sw4h4ViiaTMbYgdusxE
 RXK3XGyZdFuRvr6eu/PSzAlTyxOu5dINHv2MZRQ73cCHYQrST+WLFSlTNVWjXRw7xPFHqex5wz
 5wfI2RpSorQZllO7QiEJ/J7L+uZm/BGQnAz2zuJRmACY5JAjoVvPaTeDDCjnPOabf7Zu53tA/h
 +da1tKiaq3t2iMOzTkyH34ecMc4TYdyVvP/NGQ63So9NsYcPzWXZVneNmhgMTEBAAA=
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841d380 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=jmxE7Al2yye8V0ZPzYwA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: HkoRUUAAlHw_VlWAty6-gmMJIX1Sw03a
X-Proofpoint-ORIG-GUID: HkoRUUAAlHw_VlWAty6-gmMJIX1Sw03a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1NCBTYWx0ZWRfXzCNg1Tzp1Znc
 Cko0zh0In+y362iKR0JYB21CpDMnN0ESaIGz3fjBsKdhbcFrBdnhb9YDpChrLiGlkYfnc3u9uQb
 DGmI9I0450e1rFPvl6IPiyYuNP6oqE/++gtRDuVTBp6HzIo95XHmrSj7OlvbBAIw2AMhOWVnrvz
 eTLF0jlYIUWImZzHMhI9ASE1E+BKfqTfhHew332C/EzFMSiqzMv0bRhV6gsO7a33+Hr7Sh3lYTX
 7WX9ibGGbuKfiKZYjgOm37ydfuW975jenSI8GRyD4UENPxTNCG4ls4x4ldp6H5eJkio8IpnHpnG
 jxJnTVI6J9bSo9hPOu1HxfySIsSBFt1edeGsvG+gpiP1BVfM1U8YEUbOz7Mn2IPPcw2eVfjXd1+
 5vzLKN/4rSser9G80CRF0baszYQ96vI6nBJghWPPqJx5QMeYnCo4Wn2hsKBlAANLJh3K+cFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=780 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050154

Currently a warning is reported when running:

% scripts/kernel-doc -Wall -Werror -none drivers/net/wireless/ath/ath12k/hal.h
Warning: drivers/net/wireless/ath/ath12k/hal.h:596 Enum value 'HAL_REO_CMD_RESOURCE_BLOCKED' not described in enum 'hal_reo_cmd_status'

Add the missing description of HAL_REO_CMD_RESOURCE_BLOCKED.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
Note that although HAL_REO_CMD_DRAIN also does not have a description,
kernel-doc isn't complaining. Furthermore, my analysis indicates that
HAL_REO_CMD_DRAIN may actually not be required, so after that analysis
completes I'll either remove HAL_REO_CMD_DRAIN or document it.
---
 drivers/net/wireless/ath/ath12k/hal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.h b/drivers/net/wireless/ath/ath12k/hal.h
index 0ee9c6b26dab..c1750b5dc03c 100644
--- a/drivers/net/wireless/ath/ath12k/hal.h
+++ b/drivers/net/wireless/ath/ath12k/hal.h
@@ -585,7 +585,8 @@ enum hal_reo_cmd_type {
  *			 or cache was blocked
  * @HAL_REO_CMD_FAILED: Command execution failed, could be due to
  *			invalid queue desc
- * @HAL_REO_CMD_RESOURCE_BLOCKED:
+ * @HAL_REO_CMD_RESOURCE_BLOCKED: Command could not be executed because
+ *				  one or more descriptors were blocked
  * @HAL_REO_CMD_DRAIN:
  */
 enum hal_reo_cmd_status {

---
base-commit: c3910de7bab78afbc106206aed5ec8e79458fbee
change-id: 20250604-hal_reo_cmd_status-kdoc-c3f3a25237c5

