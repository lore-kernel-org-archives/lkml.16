Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25508188006
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738219922; cv=none; b=P4GgOS3G4xSGjz2v6XnD7P1re0Dcwnw1mA3/1kqiQZOlFI+A8X8qruneohbPw3LAp48evuE+nuGvcFNMn/mycQ+risPsC0/9Khz2NMcpFMRFDeTtQlfv1wsjXD2mVV0CxCq2QiiwIOHQGjluyZ6OTXfXY+IFZY4tF2UuAfmGpEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738219922; c=relaxed/simple;
	bh=hK/DdI3nvpji7S4abtGnzQR44iokoozZE5UR/FP3hXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fo6Y2xsbea6LETR2dpOsm8UwD4RmPCGtAiNblV4KW9Lj/4JVV4qRyFrvrq2cjEoTEh05V2s3/rWwuWS3DyG9rk6ybsmGato8FE3go9iswiTFRkypuSMINPnhYFqXvA9Zs4C79VpaVt6CkUAV+G07sBwkCfWZLB4ZLcitaomOSiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fe5XuuBM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fe5XuuBM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U645xV004544
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H23WwSFj9O0uWJFt/v7xnWizAiddo1nd5E9CRkVLZVs=; b=Fe5XuuBMaGq6dFA7
	fJ2iB1Enc1qXrRiOkt7V9ab07gqMb1WGSgxoEXb7zfqDb0o1CjjKPYhGP1gzTlKY
	5mMQRMLXj+R5LpAbm8PhpfBf1rvWtpranbVzdtp/U2LR2/7tg4Uoag+tPTEqp6by
	iTKGt3eoWh5F3psPT/ciojmYgKxoNMDnPESWpHhN/lYrRXjyK+VoOt/O2nFlhkxC
	m/+FPpI7mK+meHG5Y2ZfsFSIDKny92C1gpNJnaXGqZNsp7bc7BVbD7Kxrn7KcT12
	MF424vsdZOo1gjzOJFLaQRMs6PEXzP+9lC9kp3D77eV27j/y6PWNH3yazNalzlaA
	OI5V+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44g3u002y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:51:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-216266cc0acso28376675ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:51:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738219919; x=1738824719;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H23WwSFj9O0uWJFt/v7xnWizAiddo1nd5E9CRkVLZVs=;
        b=MhizyEInI276JYxwLWLC6pQAA36nMKDbeEtS+fq16iYy+ETK80F6yq+rSdnWOp5rgv
         XFd2s8EICWz7OwquUNBG2y5bxu67LRqDQoloHVH9Dq2MbHsr4NiGyxi4AL6QMGa3G2qJ
         K87ny6BYS7hU6xCZ7rjDfqXkGlc5mjguv1/T8kg5+LO1/zGPcQyzdBqgA7RCb6WwMnNv
         O7CBAHCBp2wX5wgTbHqdPEy+m5FhYARywgNz/15PhqAU7TyKpFgsCk8VCoQsC6goYB6i
         k7vndMC+5hmyxumUEtDtVkfCixMc+7jLsQu4yvA28aNnr5nWVbUTPjMgY1pn3zwudANf
         IQMw==
X-Forwarded-Encrypted: i=1; AJvYcCUcmLw8ix5Tp+y8H/87n7xTGlFf29IQf+y/oRrrTuKUnvWK09nSL6fPEq/7v1hmEUGZuqlKopl0pUaYX3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvIjOjP1CNCFMF7T0nE8vzPNZu0OneEIEmbiF1oNugVnwyf0Dp
	w0/Vhs1VOJh1nx8OqG+pqc980ZyMqplNIoYW3YCHBI2gKvMxzgDEl9mZQDN5xeTdsV3ihZaNaH6
	YRVUtIfc0lgnGY3Iggja9Il6na/1hOBspg5vWBHT8Dp6kA/wSap/gyAjTXY5THEE=
X-Gm-Gg: ASbGncuMK0tH12JzvHcUyWpZlS5rnXmj3O/C3GUTz3mRopIvy7RZXkgBwCIgFC01eoo
	evKOAG075S5qYOMpAoz0EpXDpFmqNZ6G6LfffitBRQVDirPbhhQyP3lSES1x72H1SmGkFlj2Atj
	PrIx1GML4YpP2FSe19O4MFObjrh9ND4wP0vdypaVjeWjo6o33Ys5BA8d5Vkn0kuEWdbHz7BSsI3
	HjcJFchZsSw9XXr5mjRjF9bPcudAX1JNhEsf6jo61BtiDdWxlFlw37rfmDK2GyubkVwIZAVVK3c
	MLaGUIDgldf+GgFabMA4G13BSHkR4cwSHBaQC4U=
X-Received: by 2002:a05:6a20:c78d:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1ed8730a904mr3511362637.7.1738219919016;
        Wed, 29 Jan 2025 22:51:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzG+DogYyZ4oCV8O4Q9rbTI5YcJ0UW8zYZUFnb0DL3QdqmDelnZIfjmzVNjsQlG0V809uVRw==
X-Received: by 2002:a05:6a20:c78d:b0:1e1:ad7:3282 with SMTP id adf61e73a8af0-1ed8730a904mr3511341637.7.1738219918596;
        Wed, 29 Jan 2025 22:51:58 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0a666ddsm508683a12.73.2025.01.29.22.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 22:51:58 -0800 (PST)
Message-ID: <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
Date: Thu, 30 Jan 2025 12:21:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
To: Remi Pommarel <repk@triplefau.lt>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qAbxdyenSiv82j03Tg0Kzj7Ww1YgEsOy
X-Proofpoint-GUID: qAbxdyenSiv82j03Tg0Kzj7Ww1YgEsOy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=946 malwarescore=0 adultscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501300051

On 1/29/25 22:25, Remi Pommarel wrote:
> Currently in ath12k_mac_op_sta_statistics() there is the following
> logic:
> 
>      if (!arsta->txrate.legacy && !arsta->txrate.nss)
>          return;
> 
> Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> if it return for empty legacy and nss of arsta->txrate, then the other
> stats after it will not be set.
> 
> To address this issue remove the return and instead invert the logic to set
> the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
> 
> The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
> remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
> commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
> mac_op_sta_statistics").
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

MISSING_BLANK_LINE
'Tested-on:' tag missing blank line after it.

You missed v1 comment? :)

> Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> ---
> Changes in v2:
>    - Rebase on ath-next
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 33 +++++++++++++--------------
>   1 file changed, 16 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 4fb7e235be66..e9663c6ac72c 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -10170,23 +10170,22 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>   	sinfo->tx_duration = arsta->tx_duration;
>   	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_DURATION);
>   
> -	if (!arsta->txrate.legacy && !arsta->txrate.nss)
> -		return;
> -
> -	if (arsta->txrate.legacy) {
> -		sinfo->txrate.legacy = arsta->txrate.legacy;
> -	} else {
> -		sinfo->txrate.mcs = arsta->txrate.mcs;
> -		sinfo->txrate.nss = arsta->txrate.nss;
> -		sinfo->txrate.bw = arsta->txrate.bw;
> -		sinfo->txrate.he_gi = arsta->txrate.he_gi;
> -		sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> -		sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> -		sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
> -		sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
> -	}
> -	sinfo->txrate.flags = arsta->txrate.flags;
> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
> +	if (arsta->txrate.legacy || arsta->txrate.nss) {
> +		if (arsta->txrate.legacy) {
> +			sinfo->txrate.legacy = arsta->txrate.legacy;
> +		} else {
> +			sinfo->txrate.mcs = arsta->txrate.mcs;
> +			sinfo->txrate.nss = arsta->txrate.nss;
> +			sinfo->txrate.bw = arsta->txrate.bw;
> +			sinfo->txrate.he_gi = arsta->txrate.he_gi;
> +			sinfo->txrate.he_dcm = arsta->txrate.he_dcm;
> +			sinfo->txrate.he_ru_alloc = arsta->txrate.he_ru_alloc;
> +			sinfo->txrate.eht_gi = arsta->txrate.eht_gi;
> +			sinfo->txrate.eht_ru_alloc = arsta->txrate.eht_ru_alloc;
> +		}
> +		sinfo->txrate.flags = arsta->txrate.flags;
> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_TX_BITRATE);
> +	}
>   
>   	/* TODO: Use real NF instead of default one. */
>   	signal = arsta->rssi_comb;

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

-- 
Aditya
