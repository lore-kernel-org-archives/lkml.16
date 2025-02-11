Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3D1805E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739236118; cv=none; b=QN2t4nHegsWkuAY1qm5nOmYpjHjwdt6xHPZLK8xhzRQZKLCw98s+xhMOQSZoRe8R3CWz+tdFVXAp9zZpnKDXE2h/KT2g1SOpe/yq7+zGvOwhbttC1t/nbWDH3aQ+hmxWdSUmxzpcVYDWbZy76zbPpkLiQjJ/UzXGl5NJBsO/tFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739236118; c=relaxed/simple;
	bh=5gZSMGQXg8tquDZUHTjwonp9XgiymACki5PrRI0VGQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NjAdBwFd8wFIcj5nCSUula0v4lPm2yD9eXh2vL3x37MCCdhQjIe96YrCc071MQAbR1Arr139ky8DzRjKca8dO67bWSiv51R8tCPYG50Z/SfNYojmI4gn1jfFvxY63kRrEmp61pAxD709nBaTrqzqWFr56W2JEFzQv+K5DZz3M1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvIbudgq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvIbudgq"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AIH5Qr026431
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=; b=BvIbudgqxtCpqPJw
	UctRfJH+t4FfLmbBS6DWZo9mMKVxF5V7lzk8yXZYKku9oAy3Nf6ldJRHQbz2kPv8
	9vMUCZeAWOvVectx3FNt0oFFcDj0UShnLZ8Ky62Fuqf288E/Ros9Hs1eINEyzOFh
	xxiwy10rL+2G8ugX/42G4w/ndw2vNLynDlZ+EY6g+vHkm+pa20AT7if5kCstvjPZ
	awy1/cXk0qNkAR34tEpPNF5zFTWw4NtuCUYcDce9RLZjLgbf+NcRzyJuYNrtlbHZ
	qkYE8gQOMqjoe0aVzNBa91jSEQTJCovtC7UntEA0FHevXah6jlcC0Pgwtj/19Ebt
	bo73+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0ese4pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 01:08:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-21f6b2d49e3so66791365ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236114; x=1739840914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpKCKjeAbIqONMFiJVjOlSnMTDfFUoERYTpc2AfR5UM=;
        b=g+4TLBmeDUOrEEHeW2emZPi3R6cCuZ+CaztXL4gZQl4pbeuPzapPaSwvmJ9zQFqPlC
         YphvPd3JLXOLhCNiJyfciQA04/LA7qAryT0cHdkweNUQJBdDQiJySoYwdRQ/nPO5m2bv
         vUT5FHbHpr55z9h4H9NZgVk2EuZeBsN8oQu8ZktDVBSb9PxJw8h1Diyh4CEv/apcW+L+
         ThwzOUmPu9U7B+0Kdv2ycrHugX9lVbLHOMrXW/tIk6tELnap4n/UbN4NDGqcyZmKpBBY
         XRTThZAWRcdx2ZPtabsJqNDvIdiGC47HUwpFwix7QLiCZg2Htkb9wIg1GT9rHz5HvPsZ
         MxeQ==
X-Forwarded-Encrypted: i=1; AJvYcCU48JtNnmCdEaNLwJTfEGBYB62ImARDcbicvnU4ZMqD1S6v6Kwkwhk9rg8jGnr07mb8DqO0Y2Hwt5CYlBY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2b3MxwCekY40FzFRFbx+fSa27buH8TIJxvDUH4JWeuqnGdqjB
	AeRmkDTervRic5I5yIUxHgJul6s7YBLb9WlKDRGyHTcOu9Ksjd8hvuWD5hLsLYhP8Z3bb2uBeYc
	0qoMQV2A5H42kMy8rWvISHomeA5YpexzlJu9IWaAyf3cAV4082+7Vxala3D0okqA=
X-Gm-Gg: ASbGncsjKZkTI6bW765vPLEZEW1Q2oUYG6g080hlgvFRqMEmcKCK89GavSVOJb750pl
	g1XhytlSBBX7a4PzOOuAVRMLzlx9o2PDkbTLGzolVzk6WZeJIklEyCISXrK3IaBlShepFcHxwV5
	E7jznSk+VWnMWZIp0/OyL1zku1O3rVxBAZeJR5r/Noj0+Gwxc2bNOc5mAZboilLeLuEWgmEPY+a
	soSG7pK3zS+M5RQkov/2FMTXsjLgqwvcnkpFmgpEb9MkdS/s7GD0YSXbUe7syDwhxfg4iLv63D5
	wv2Nd7hsLl51/s+Tgz9uJopNeabb3ajtQfVfXLjP2+NzaEzYWUpihjbP8wlpvZHCOXt6X15WMA=
	=
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr262295855ad.48.1739236113886;
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/lVU6NZTzrLR3oJdGFyeLKiV8JfyCXjnYy2BiRewTlx0CpGjULYWYSq5eGpYAPKlbHbIRHw==
X-Received: by 2002:a17:902:e74a:b0:216:4064:53ad with SMTP id d9443c01a7336-21f4e7ed222mr262295425ad.48.1739236113498;
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36560c94sm83817485ad.91.2025.02.10.17.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 17:08:33 -0800 (PST)
Message-ID: <a7ca4e4b-c432-4f2b-81c6-c7b06cd12de1@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:08:31 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix uninitialized variable and remove goto
To: Ethan Carter Edwards <ethan@ethancedwards.com>,
        Kalle Valo <kvalo@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo
 <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250209-ath12k-uninit-v1-1-afc8005847be@ethancedwards.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4nJbFmhYnSE2aPUc6SGfmTzzblCH9nG3
X-Proofpoint-ORIG-GUID: 4nJbFmhYnSE2aPUc6SGfmTzzblCH9nG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110004

On 2/9/2025 8:36 PM, Ethan Carter Edwards wrote:

commit subject should be as specific as possible.
suggest you at least mention the function

> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> This moves *ret* inside the conditional and explicitly returns 0 without
> an error. Also removes goto that returned *ret*.

ath driver convention is to declare function variables at the beginning of the
function -- please do not relocate the definition of 'ret'

> 
> Addresses-Coverity-ID: 1642337 ("Uninitialized scalar variable")

Is that an official kernel tag? IMO the proper tag would be

Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1642337

(is there a shorter URL?)

see https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes

> Fixes: b716a10d99a28 ("wifi: ath12k: enable MLO setup and teardown from core")
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 0606116d6b9c491b6ede401b2e1aedfb619339a8..ae75cdad3bd6b6eb80a35fee94c18d365d123cbd 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -908,7 +908,6 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
>  {
>  	struct ath12k_hw *ah;
>  	struct ath12k *ar;
> -	int ret;
>  	int i, j;
>  
>  	for (i = 0; i < ag->num_hw; i++) {
> @@ -918,14 +917,13 @@ int ath12k_mac_mlo_ready(struct ath12k_hw_group *ag)
>  
>  		for_each_ar(ah, ar, j) {
>  			ar = &ah->radio[j];
> -			ret = __ath12k_mac_mlo_ready(ar);
> +			int ret = __ath12k_mac_mlo_ready(ar);
>  			if (ret)
> -				goto out;
> +				return ret;
>  		}
>  	}
>  
> -out:
> -	return ret;
> +	return 0;
>  }
>  
>  static int ath12k_core_mlo_setup(struct ath12k_hw_group *ag)
> 
> ---
> base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
> change-id: 20250209-ath12k-uninit-18560fd91c07
> 
> Best regards,

replacing goto out with return ret and unconditional return 0 LGTM.

can you respin a v2 with the other comments addressed?

/jeff
