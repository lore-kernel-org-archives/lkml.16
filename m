Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48310223327
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359760; cv=none; b=HgsKr91XE31l3eCQ0QBmhnDCo4v7FDwgTgNhDh2GMBjNg38aqe8FFzzOwGSiHjug6XTWke3Ji2isXFZdop/VE4CHAiSdSFpMZeZYeiHQEkkkpspp1IZBix8R+RKUx/rX9vSuC6P3cElnqqtECRQKjeMYWwV/bu6yheoDnl18Y54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359760; c=relaxed/simple;
	bh=iB9wQsnPFnjA+FsBjRsdlB9P/ugucnogCQlOU4I8V7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyJyC6dF6qiR79glvDqIQhXFIpWRxRRlynkv0mdIPhiI6TlMscyEJez0w/0fE0i6zK7UrcaoVNAgk1t5nqflNsO5zLO/arvL6hse9YOAUQtFerndgF2naj4orX1tWDmbLUO648Ic1KR6FGYzVMB07ct+jP6zCAWQbC66V4AOokM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpGP7EZK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpGP7EZK"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5612Pm9w008147
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hn9BEc329/VEkiBC8gFvy+qU/a3O+eBhve9KTPKFkSs=; b=YpGP7EZKiwDmWvwT
	Pe/c7qYs7nKJCrc9EKXHIKEdTOCvKkH2yOfGjPBLjXZq1xW5bVWGJy2UDdULOYZw
	JqoXjkUAdzm7TB6XKkYs2iSQK10NGMFh/TUA1t8quEvvI6QDgSFicFp1SNmWU5Sn
	9s+5aPVFJ6HobKvYVXpoHTbvcVZSnfWx1SYzjdvUZhJs94aVOFFKhdOwoCR5G1r2
	mEOrVrYqjSk3279B8Y8OnQtagO5eGqc4vTDujpMS2pz903rPddmOR0yNAxObYR8T
	iMHKGdXYE3Aj8AqkIhgZJXtYeFnPleKcPkVIUFY7XqkaDRPpWwYB9Oyfuzseg5nc
	uyqeGg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmvk87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:49:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-312df02acf5so4625068a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:49:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359755; x=1751964555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn9BEc329/VEkiBC8gFvy+qU/a3O+eBhve9KTPKFkSs=;
        b=YnIecrOqwKoX1z0sr//hkjDktWyb77mbGH3F06o5PqtCnZPUwwpZ7YtpyXMihp2SUD
         91jqj1QUhfmhS7E1jcihdAHOEY6cQdsysr+g3DJ1Uh9wuiGJa3E79x0CfXZ8+0M89fuX
         MjZqxYpdLGj9j8FS8pftP9X+ax9lofi6F7c7cYaBYbQuFYlIvBFCZ97Msda76KVexsFD
         imYJoCA9PG/PptUm8drarRVhP9gsc8yeM8SndG0RwRUnXQnfgeb7chDeAqjVm2TttSIB
         M0HjfX4B007VkI0mQjKTvenmtitI7dON8N5YI/AnSCDFrl67HU6RcJuDL9C0yPOV2p8I
         yimQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+gmIcrpwsZ2qVBZcFcCPjGfy3o1GAa7jX/ihNlXPPOKwUFtKw2cfU65pGXgKMC0iAsNUOqdeYpYUfIsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtJTNQ8bPwFyqxhJbP9ZU2r+cW8o+ejVjy4PXJoDwvrmQWkMG1
	EgMAKeh4O9Pjvaom2yj4ctDjw+RI4NVwofNa5YqO7+UB1Rvl+lyojlsMOGM2ejGVyW/ZYMn4Feq
	Dwju1Br8Y0BmE9NHkMugwi9KUg/jMKUt9VPPpSKBa25AjdO3s3BS0V12ZF70p0I4QA7Q=
X-Gm-Gg: ASbGncvlyEzHS9xwNQ2u+B4gi/Cml8y8E9XGiN4hzbmVG7XDjh6W/E0gnvjLOMsq/5S
	NkDNq938E25dj2ok2VXyZCP+9hei3l85rxllmSDFy5IgQCn8DS+Vi01yCIrSedQNeuIjXOgtg/M
	3oR317HUzfYgZPTxmKBNac8yVy+dsV4yzj5BMT+vFP1CxuyKabzLShbUvN2Y+Y6PdDtykbzTIvt
	o/Ct4wS9zHDaG4aSBaKgDEw0aPZoEy7vHGuXn4PrmMoj0UQxNu95JafSl2hpjHXil86D7BfQGui
	HDHozsPbqlsQlNcgEDgPqE8cjERHiRbnotjJmEmHnRfpru0lQzJKXWSaBt2KRTx2
X-Received: by 2002:a17:90b:17cb:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31939b7bd6cmr4341840a91.14.1751359754380;
        Tue, 01 Jul 2025 01:49:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9SVO++pDakVFQGfgX2YbbH28UoOwYoVlF8NEnQMTAWH/CWI6y7jHxZv9hiemwIBciRJOZKg==
X-Received: by 2002:a17:90b:17cb:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31939b7bd6cmr4341792a91.14.1751359753847;
        Tue, 01 Jul 2025 01:49:13 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-318c14fbebdsm11440292a91.33.2025.07.01.01.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:49:13 -0700 (PDT)
Message-ID: <58ae0ed9-91fb-2ee0-73fa-321313033a74@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:19:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: add support for Tx Power
 insertion
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250630-support-for-tx-power-insertion-v1-0-77f45484d5bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zJgtBjbBp3FHwVKcnrNQc0MXCZkAlU7q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA1MSBTYWx0ZWRfX7p4MjjVRpVcL
 2JGcN/6xFK6J2CSI82MXKoMKT2eBgk7nzU5lViGqZjvswf6IM49/XY4gf0ZtnMCppUljC8WpQI9
 z+O4SjMlBMz75OnCt+xtcYojZoySiUkWo2mLnRlw0E647EDooigffyfHqQ4LByUFzaqLmFHSdHQ
 bwxxSiW4PGu/ggWuI2JmXSsd6S97GjXYlXXcv8CqKOloaxmyZXdSiCfexkhO9ZrdqSa0+ELiZte
 gaWKYKAQzvYY2luEQ5P6wjlddkK3RNDlHZD+LinwNCYhJAmP/Ltd3eTcjkPO9EjCyCOTdFIHO+d
 vkk8tcFcaZ25DU/vj1bWiGL27FBmU44yIKGapcV51Y8H1PxHtN1sR/+6M/s0qP3Ei3MUcgfdN16
 neERjjPYlRNhBUlOnIqdK4CP5U72c8fiwhGjbGbYLbmTKx1kKIyaYWUg5Zrv3/pu+A/hscC1
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6863a10c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=9jhMNZ7qWXdoG8tHMgQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: zJgtBjbBp3FHwVKcnrNQc0MXCZkAlU7q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=988
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010051



On 6/30/2025 9:45 AM, Aditya Kumar Singh wrote:
> For certain action frames like the TPC Report IE in the spectrum management
> TPC Report action frame, and in the Radio Measurement Link Measurement
> Report action frame there is a requirement to fill in the current
> and max Tx power of the device in the packet.
> 
> Add support to populate these fields in the relevant packets. Advertise
> this capability from the driver using the feature flag
> NL80211_FEATURE_TX_POWER_INSERTION.
> 
> In software-encrypted cases such as PMF, skip insertion since the packets
> are already encrypted and cannot be modified.
> 
> ---
> Aditya Kumar Singh (2):
>        wifi: ath12k: add support for Tx Power insertion in RRM action frame
>        wifi: ath12k: advertise NL80211_FEATURE_TX_POWER_INSERTION support
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 184 ++++++++++++++++++++++++++++++++++
>   1 file changed, 184 insertions(+)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
