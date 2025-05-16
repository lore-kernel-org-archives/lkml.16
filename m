Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32925CC77
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747417248; cv=none; b=D/YbTpMW63V79eQ45Z+Fp29MB51pUP493qjJi8a1xsFELdVAXJj8FLLIqBx/9HkgH0Y1+0GbTPi5fz3Ig73HY6y7DyUzSG0Ku9q76sCUcFc2JpCirNV4T8ieA7rbU4nYyFihmES1MidegWQhpnarxyZMIC8uuTonujKB1MeFToU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747417248; c=relaxed/simple;
	bh=Tos35RepTwKsg6lRWVV0I0oCv2o0Gkr/UxlzX2JmnaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IluIGjPLomg6f977MNobqiTJINRCVkU2OUkQbAEuUUqU7I63M93N2Jxav9vxEezJeRu3aNVF+aVeLGWv05aUa0y0xUNO0Ou7DZ8gA5GoagdPU/kBqt6/b14lO8dNChyY2gJULt1yzKGvK3ih2QcYv2bHwNjCjVbRiilmo8z/WWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwxMplWZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwxMplWZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBfqsZ001798
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jlubvvj+QDGnJHz9jHk3yA37ZHRIx4oKicrzEoPiFHI=; b=JwxMplWZArwNgHhG
	7YwqqaVar+OFSV9yZQ7GmB4TQbzkzFhxHkvUlxAukEX5ubywrM2W/zCUrDPiDBVZ
	ZQjURRXjGqLy2OA/woFn0hqMe5lkSGx/E4rFyOXVKDWAxDKakkXI6Ayudb+WHS4i
	CRxZGXU+V59+mnMp2KOKMcpA/KUWvqoXYgC99OmtE5p98gC/6U9/eiwpYtCzUaI7
	W30JH38KHtJuPNBbOe4dDK8pGt3qkC+UHwqGj03vjbGqgISAAa0CRR/L5hhaoYyp
	24R2kVECUe9DFNp9XGpAb8ici3m1UzerQ8A3Wjz7p9tbgRmnkWxKOc/Knx/TRyyP
	JQALAQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcrjk7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:40:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22eb21a2788so33199425ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747417244; x=1748022044;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlubvvj+QDGnJHz9jHk3yA37ZHRIx4oKicrzEoPiFHI=;
        b=PuvU365MIQpLSONK9lQpigBglFGhEhFwOiO5q96xDZj4MoqVK+YaopkriDj5otQN/f
         DBNYBD5YIPLotJnvOUVS+VsgfJh8Fatne2Bb1oHY07jDd9hVrC4qRrX67WZKAWuzgVkU
         Z3QgT9QltVlzPCs3lQ7KRgDhAZnNnUe7PgkmkJfxfw+VILXegYi7sfFj1z60w4zo5Mnd
         GmsFYNwuYw1LeBZZq1eqPcc5i1HgKmT3DDxRsLvZXVPXE0YV9+9mcxey9Zr6rXpfuzLU
         Ey/xyLRTtyjHOY/7WCELXdZXq7OuQ3i6RQIwT4GjnfHhaCGNfgxAWkHoEUkaWU8zhLgV
         5DBw==
X-Forwarded-Encrypted: i=1; AJvYcCUJNVjKHh8minFL8D8EtjHT+4jEQ9EwvQYihiuN6wxzO55pxyKgeVEQTb2u+xgwb5yN1/Bd+PbB7ONC+jk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo4tWvgm9EOC+Qu2d5YE9LfX5kxg1KC3XunzQV0r3zflR/Yky+
	QXy2nU7Qx+4qmB2ioiIqNDWRk2pMaTsmxvDq1drhHT1Nj17GEfX0odTvPIowkbDoBonrUnDHHU5
	B0fZ1oqtRmjay3Tfgv4gfpa45rq4KxkFx+kYc7iez1sSLnrSmBaVcCHvR4gQDvwFyieM=
X-Gm-Gg: ASbGncsS6FH6wq7f/IsutUct9DD8WYLRLykQMlr71nD2O+dkjX1BErLtsIcWdH4bJCq
	HGOCaeCytNxIvxmtuM/fCA43TzKL1TGTRz6VDikCrqazgNUqqu2LUggJBAbbbugl4zX2TWFWsEQ
	/o47f4AsXnUg/MlWWHcM5UdVFgafk1tzi2lSWOF9nyiJyZHEg+HOpNUBEokkxftKkotXefYUYeS
	AnXCz519xQtwNjXbHXpvmao+c1NSfiEZGV/qMmPxLKG72TR9A1qgDRmi2LE3P3bJJEtf7YPmzs7
	MTNnsy0MsCfYryQW6ZFod45z0D5BwT8h/Awj3YxHS1KOuDmL
X-Received: by 2002:a17:903:2ec3:b0:231:d0dc:f2d4 with SMTP id d9443c01a7336-231d438b4efmr54555425ad.2.1747417244213;
        Fri, 16 May 2025 10:40:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnpX+C79lbNRgRAwyYYSWhQTaoTAtNOQBrn+O1L/WMYLap06IU/0tTdtq79z9bKxFd0l/g3w==
X-Received: by 2002:a17:903:2ec3:b0:231:d0dc:f2d4 with SMTP id d9443c01a7336-231d438b4efmr54555175ad.2.1747417243837;
        Fri, 16 May 2025 10:40:43 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ade573sm16994125ad.80.2025.05.16.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 10:40:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
References: <20250417-fix_scan_vdev_handling-v3-0-9ec42513d26b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: handle scan vdev
 consistently
Message-Id: <174741724241.2935573.13251493111560682392.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 10:40:42 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: X2hY3-Gtt0ly9nObN4-gLwOrS4V8KIx5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE3MiBTYWx0ZWRfX61EQjcNAXCVN
 IBhjGrh6Xpg3n/F89tDZAC4uRDO6dCV4Z77L5DtHEWcbdLrxqg0Pw/eqo+9DDJJ6VHGPT0gevBe
 0T19rkC5jusQrr7y4+lbJPCq15ZdaxGXWTvkMD8NgZs+qOdcqG8MnYjLPBWz6qxhQHgKWehwqSV
 WhZQ9tU5x9RJKx1kZcxFiEoESxju11BndrJ3foNuNbtPFV4MKUxy0jnYT6bSUioTycvlP1ExGdT
 jFGeDBBaV2M/1fQGe33ECyTsbLNvRH11QEG3pe03Z5Qsq1GKXUcETRiaYUiBBn4tSsVonr6tJNH
 N+oCKA42vMzstI0c05KtJtY2kfvK/OggRUgjKjuyYS3uxrgCTQcNN0qhMDUDiM8SjR1SdAKM7el
 KUkU8Ms9dhyIo0xEJ/sqfNDuXZFsaYKrazDU8xYnwbvD24+Jn49iFNEZbfcawW3KLaDz0mQX
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=6827789d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VtwFg9zR_83gxYRZV04A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: X2hY3-Gtt0ly9nObN4-gLwOrS4V8KIx5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=902 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160172


On Thu, 17 Apr 2025 11:19:12 +0530, Aditya Kumar Singh wrote:
> This series of patches addresses the handling of scan links in the ath12k
> driver to improve consistency and functionality. The changes ensure that
> link ID 15 is correctly used for scan operations across both ML and non-ML
> interfaces. Additionally, the patches prevent scan failures by fetching
> link_conf only when the link ID is valid and setting appropriate default
> values for scan vdevs.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: handle scan link during vdev create
      commit: 8dc8340c197854bdd7aaa4a1b0f1a75646667596
[2/2] wifi: ath12k: Use scan link ID 15 for all scan operations
      commit: 88c3aaf46ce8878a8314b791b99b8d621f7badeb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

