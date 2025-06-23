Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04E724728D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690855; cv=none; b=AwwRhyHPkJCxA6Hx+1hXsS0A1HWeCOwLlXqRrMbnHzBsjgiVdsWkqRT51RLIh3GJdm9r3Ad0Jw9ja80QYGcJJHgAOu3Kin34aefSZKQZpAIYLEBtHl8o3siv4NBAYabN3C0o+S6bRgvWY046ykaC+h8emB606mSigPP0b0UBGG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690855; c=relaxed/simple;
	bh=IeITghrJP4iPSsALB9poQfKO0wZfiG/sVqffHWQCkRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjwRGupP8MDT7T+GWfnkFgaJ6j86F9m5grz9nHlVY9YLIsORq47fjgFuJutbWV/yHh0ckVzCLCSLpdpJbrmUdZsPFhIwIB746cf8M2cPVkgKYCLXF/K+FgSKeI43oWKLlQBabgt5j+jPZfboP7DD4S2rrywvQtL3Pv3SLRuZRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=muv1LrfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="muv1LrfI"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NEkDN5024857
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jSlSLiXE9ML5oVRqrkn0OwhaNJ+Eurdiuji/Hh4dp2A=; b=muv1LrfI6fQfE/9N
	bU4Ebn3xwqoNrav6Ntazr9z+L3QR9eeaVAlZuJyO2ZshGr7/cVVrOtnpaePK4rHl
	CxTsCbxNlyj+9E+Fo/YZa4S947mMa3BC5JzypOt5fYsSekqczVIYTnVgDkm1j89h
	77EZQCYiVJNt/+spruq+ySYXEm9OZ/1tPo69VAwyxV/GbaXD9hwsqTEUxpzlUy9m
	IRQht1z1zUQfmTWL2T+8OnSqTquljQvx8X3uiNQV8QnvE2fKdKCtcz/oKEYGktjh
	ctKXjJSUSh5T2lIQYFbpshob1qWDcmGkpxQGaz6YhR7lBfns8K+P9pZ1CNVrtCeg
	zFZUBw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymr18c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:00:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso3210572a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690852; x=1751295652;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jSlSLiXE9ML5oVRqrkn0OwhaNJ+Eurdiuji/Hh4dp2A=;
        b=ZQ5pdlZ0fSG/QWGCVspPATA93/Pl2e+WNhYPH3zLj4yl2lQ+EXnTbVY6wchtEaofSl
         Le5/EU7d7s7LcEJZyfcwAfqiYEbqkv4r77kURrwgw5WexCXC3VcFk4X/xMxlVBxtam15
         3X+9xLy9Bn0yZh3830S8idmBYoSQDbF0B41Afc1o8mYn0VFzHns3oGemTasgdm2uGRtL
         XJdeVfkRMZRifznS2CZBT+BcinpO42lGcVDBdllgR6N6vAorCXysjevjdKSs1k5FopHT
         kQGHNPg5HVuqJD7fYUrav8h5dFUjqvlNGRrFG5YbIklaWjsr/mtM7k+dlHHRHnkm17YZ
         733A==
X-Forwarded-Encrypted: i=1; AJvYcCWsjXMsH9Vq8k90CwiUznKZqCspwVCCOkAA8JuKyKzFZF8Z+TsNm4rm/v/ZvE48ruOSYnXUxfB8ehhZ/w8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/iPs3kvAWla5+rE4oxe6soZytzYIH3jD7OKWPzCoJ7X9GgPGG
	8eCkapFcT9nRHAsPvYUs24a5QCOt2XDH39GtwR3Q0s20dMpDfzpRge+cIBnytSeXWGOLmuf8GTJ
	OKTdivQt0b9byZ1pgbRtF9XS0bh6th9hgid2Ab2+K5LKsrQKX1yLycqqY6NN1rYeYxsY=
X-Gm-Gg: ASbGncvkrKCh69jhPSusyzAenllI/sVb6pmU/3LjjApW2rm5qbbttHebAzOWZhajXMG
	ZYDW/MnlvNzKTTCE6vtNPW8imKupdivLr4CvnQ4ZEt4BOTeW5/df1lEwz+tvnMATHZ9+4001tvQ
	g2Iqd3PAgpMX5dbCnGgEf60MGDvWPvvg7UIep4+KhYyxLbAePzc14b881c/MguOH/g/ZNY8RzVR
	jiYNoUaofR3ROW5aErctW/gJUw1HX6j98lB7icUBtOvtjI3SWanEemdiReBmL14gkLGVaEDvKNd
	NqLa1vo5MfAZygCrAIPEfnPk7t0//dZCkH415lCGCSZl0DjzjvqmRxcaj+GAEt2etpSK7Ysj0cJ
	p7Q==
X-Received: by 2002:a17:90b:510b:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-3159f51aac2mr17078300a91.14.1750690851312;
        Mon, 23 Jun 2025 08:00:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGdABP063Vlk5OVUgONkfYW+i6XNH2ryukyv215HD7e7TxM3SjPrhrNyrPInpcakQhC9K4cA==
X-Received: by 2002:a17:90b:510b:b0:311:abba:53b6 with SMTP id 98e67ed59e1d1-3159f51aac2mr17078205a91.14.1750690850497;
        Mon, 23 Jun 2025 08:00:50 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a318733sm10835361a91.38.2025.06.23.08.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:00:50 -0700 (PDT)
Message-ID: <500a10c9-c56e-4192-818e-8e07ef6c51f4@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 08:00:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: use real noise floor value
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
References: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA5MCBTYWx0ZWRfX5FXn60VjaOrd
 iWsifWxQoEFAXCZNojQL2UpGWSj8uc5lzFSkjy7mgbumJihc9jviyyzSu7jCsDRWC0EEoWzGEQt
 LieVN+lOvZc3oRBYtdhbyKxJZrpRKCUQj6rEe3DVKCJMGYVoJHAwPPWGzE1SMb3RzfgSu6QOiqn
 QPakz1qpFQnwyMEB6WzQ7zhn9JlEjK730qN090iVglSS8ZjB3Dm/ffmfSjxnvZSR+Ldfvqw3W4Y
 e9pAT/qEdh25gI9LWlz/dN0qMjgGIvrh+42w/d+PkcsTxb/ESimDmy14eWoUKnJ8CK0qRX4+LLe
 53/ZGuwZ+gDyLaC/WJqfEYHK//BW//1iYVZSzDR8SzBJ1eEarA6kIHuREYcbbwtjFI/ZcudXigB
 SuM1BriiwaP0uB58+achoy52LvNd/mke3jwqpHpPcUfjjvHuI0fyHqctJuK36SN3tMXLcj2D
X-Proofpoint-ORIG-GUID: _uM12_EI3XF8cydHt5OFWOSzAyR3y5DU
X-Proofpoint-GUID: _uM12_EI3XF8cydHt5OFWOSzAyR3y5DU
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=68596c24 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=ksen3YYlDcNkJCCezrIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230090

On 5/28/2025 4:23 AM, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> Add support to handle and parse this WMI event. Use the received values to
> calculate and store the noise floor value and use at the required places.
> 
> ---
> Raj Kumar Bhagat (2):
>       wifi: ath12k: handle WMI event for real noise floor calculation
>       wifi: ath12k: use real noise floor instead of default value
> 
>  drivers/net/wireless/ath/ath12k/core.h   |  17 +++
>  drivers/net/wireless/ath/ath12k/dp_mon.c |   7 +-
>  drivers/net/wireless/ath/ath12k/dp_tx.c  |  20 ++-
>  drivers/net/wireless/ath/ath12k/mac.c    |  14 +-
>  drivers/net/wireless/ath/ath12k/wmi.c    | 233 ++++++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.h    |  42 ++++++
>  6 files changed, 324 insertions(+), 9 deletions(-)
> ---
> base-commit: 3d933084a072fd5fb5da54c06a017abc0412c86f
> change-id: 20250513-support_real_noise_floor-205986936cd3

This series no longer applies cleanly on ath/main, please rebase

Applying: wifi: ath12k: handle WMI event for real noise floor calculation
Using index info to reconstruct a base tree...
M       drivers/net/wireless/ath/ath12k/core.h
M       drivers/net/wireless/ath/ath12k/mac.c
M       drivers/net/wireless/ath/ath12k/wmi.c
M       drivers/net/wireless/ath/ath12k/wmi.h
Falling back to patching base and 3-way merge...
Auto-merging drivers/net/wireless/ath/ath12k/wmi.h
CONFLICT (content): Merge conflict in drivers/net/wireless/ath/ath12k/wmi.h
Auto-merging drivers/net/wireless/ath/ath12k/wmi.c
Auto-merging drivers/net/wireless/ath/ath12k/mac.c
Auto-merging drivers/net/wireless/ath/ath12k/core.h
Recorded preimage for 'drivers/net/wireless/ath/ath12k/wmi.h'
error: Failed to merge in the changes.
Patch failed at 0001 wifi: ath12k: handle WMI event for real noise floor calculation

/jeff
