Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167372AD0C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750656099; cv=none; b=m65ZQSnbOyajp2dccBSmP06pK/S8QTpnFxdjGb8lIrDWGkts45YK1YsV0La64AT/IeMg4nHnzIiJqaHgvp7bxNFlcMnQvKVo0xJdiFFXJl/MYFdcEA/wj5cRcis+X+q/mtJ0Z9C/NGp52iszq2sajDJ1/5IXZPSGEqZo8AGHqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750656099; c=relaxed/simple;
	bh=UTR6HOeh0slhKRM6sTG45oSnGpzthLh4z9wsfrd+xGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2nqOcwKVQ/lOWrFVU650JAfd8LX+cAF376ZvChTPOHuQ2kC05UPhRRYkNaDxTPME0XaBFNbPIUVDfhmnsHi7LArABH/T7c8TMzzFfEwUahKvYm3mLxgnbRWF6TzspDglDa+8H21UgP+KRWdxLAV2/MeYycA4NDmA/l9/BbrPPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k7r51ujp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k7r51ujp"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMOegm007962
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=; b=k7r51ujpJXOuQlZ6
	COM0hvm2AuUmIXlK0QHRh1ZLaLNfpi1TQJb6m8Te4hiiotx5iDE0KgURTooRIDxr
	4uC2AkRRUT4gUana6dqki1XFAuLL1yRE2OnM+4+0GoACJpyjv+f9rw0yy57QrIOb
	JfGlalVp5hwb5t3oBk0zOKjjc/k0+ihYXw5swYhaqDj3qQPzQtgOCwxNExi2nzEa
	VQIuvgjW6FjROHXL3y9dGILPKMsRNklbpG+yHKQHgkuX6QQ+6OWqMJ5/hfyF+uQ+
	QaEiAX95hN3gUgmZ/mcGsEvJUkmfA1v/+T3qFOrU7leHUfAHm5XQlp1qaSMyiFFd
	dpDTVQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eah7smat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:21:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3141a9a6888so3501498a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656094; x=1751260894;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l0WaXKSK8b4eq+N2P1B1qUpB3QaJt1KGeeB9Kc3sMA=;
        b=eUrVMJjj/hNX8bh4k8vriYzT9kVR3H6o/X2apkBM/Enui4SDgBNZ+7DZE2JLU6E6ml
         3j5+hNacIB/LancmTy0DAiGFyx9p57zESrpadf23/wWRo2vCMN0s8xHDETeLdZSd5g4X
         iPtBMitVqXuWbmS+QAiJ/KDf8cES+LKIkHxl9Czwl2eksISfNAfkjTz0ZExjOzRWrIyr
         3lJZtebZt02O/q5R8g/VygDv6sSvj4+9IgYKXruAn1NTxlsfEHY/YN145M36kF6OwueC
         LuMEM2an2Tsz+i/FM5B7sopZXUp0xISH6fPAX9+DAjGglaZpKGvvvSjCZ0vUo4evtGHU
         rx7A==
X-Forwarded-Encrypted: i=1; AJvYcCWUPb3+LCox94yTU+ZMY17FZzURNiDVO6UOD11R95PDQXJXzuWEtJTBLpjkcJ/r5W42Iy0f6AMYQb4b37A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaEIR0Kt9epTKIcxIUICY7LLiJywvJ0hJda4mMjYKvyPNSbco+
	1WuTN5HP5gjGLeOPRZbchEO6SNfj4aKahsrmfuKtyWrW540Ng52r9Y8fV2VqrJAvbsijjj4qBmu
	d0ALY5IP8k2nEiRBIU8rEhktJQWy07Op5Jwo3YWFBgLwuNsfR9mQqs2pNfW8QQsQ0yUw=
X-Gm-Gg: ASbGncs0Se/CXz3VGHd6B86R60TAMCJkQLishVBt72X2pi/7ezOO/6cvz/vg68hlqDf
	v7XoyRR12Sfkiel+QfWq39JTJzbzrdWDBzrvuHrw26KHYi00R+yDZ8p/ME0dF9mr4A/IuIhYWue
	m9oY/f8Mp0E88oOrwi5JcKf3mbS7V4hZQ0TNhrNZy4E9yl2gj7rfmJw+9FgaRhH26MQAzbSMUP3
	uxBp4iVKvCrvdatftTua4XYxmneDxPe60/qFfkOnQr4jZ0KTtTnCPIeKsO636BEDAB0CKZqtQRP
	J3FDU6PDdlrtezVGEIuANQOx4js0uy4X6uNDPj3zPy4hI70uHWWiOpoOkhIsS+U+
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146370a91.12.1750656094577;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4lgU7KFjffMXbhjmtkB6X4i4vuMqMFcgqOcVorProC4mPzsKamEdzkFloaoYhhYFKhVV7Hg==
X-Received: by 2002:a17:90b:268a:b0:312:e90b:419e with SMTP id 98e67ed59e1d1-3159d646d0fmr19146339a91.12.1750656094214;
        Sun, 22 Jun 2025 22:21:34 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a2f35e9sm9629365a91.24.2025.06.22.22.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:21:33 -0700 (PDT)
Message-ID: <f30000bb-cec7-bd07-3328-1f11578cd1c3@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:51:30 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 4/5] wifi: ath11k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-4-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rQB9kJf6GMBnOsNIwj4MJ9uejL2TDP1c
X-Authority-Analysis: v=2.4 cv=PpWTbxM3 c=1 sm=1 tr=0 ts=6858e45f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=U89tM0JWt6iRefauG40A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX4YehbBfcCXBE
 oRjIqjhJ2ZMlIfp+gC6E3gbxz5Wc0ZVlu0zfaqcGoDa5kDvNr/ClEhG+cdcbSZanHGAtVjUYjHZ
 n5oQsK+h6NoNb5dhnMxHRORhMyQwTqvOAZCCqm8tsaDzrwBfpbEP9W2PNRpJWD5R8k2wB0CQlEG
 Js4l/zU3jhztKwc5fpWqHbYLVxoNkKWq0HK1Q7WfdWr8DIMZqokSmVAm97N9EcrE15FhfB7x0CK
 h4QGHFLVbS+muwbQiq6eOVVqZ6caFoT/dbogQXvUdlfdonUqBLKF2kDdzKs8tuxAJFmwMNx+ptW
 6OvuKGhoroVHwRhNRktZD/APdcJCqfZeJ5QBGnKjyefZ8vs7YNMIh00e+j8ozcnmNVWPqlgRHJ3
 S4Qi+mvSvPL257h1HN3KbRt6kPsGK5UTIbszgIHuCq6WteI03+L+k5mdES+F5oQJXVQ0VVlz
X-Proofpoint-GUID: rQB9kJf6GMBnOsNIwj4MJ9uejL2TDP1c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989 clxscore=1015 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warnings:
> 
> drivers/net/wireless/ath/ath11k/ce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/coredump.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/dp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/fw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/hal.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/pcic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/qmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> drivers/net/wireless/ath/ath11k/trace.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
