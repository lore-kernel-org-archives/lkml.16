Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85DA1A9B46
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738873216; cv=none; b=Cu02+lvSkF1E0PchLc9KRlFnqffrqkRstSMYw2KqBWI5CUtc11+GUY+KfOA02BQ7cSQmlixYGF9ou+ghiySC0e/L+h6jpH5SQbhGwxSlLZYdg7ieaTZa9og0RXLaxG0dE56xQEXognGrfhKld1hWICFZ6Q6Ywj/A6YmMzvDJRvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738873216; c=relaxed/simple;
	bh=R907X0gfXj8PsrQJ02ZgnNI0Qbk93x7osFTrqEy0AkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kf2HLEXqFpImm7c17EfLOh9d/q+Q/cU9LrvmDFyHsPnNzUnv9YlUVDOM4TgyyKrF6ojKrd5LsLinejsGKg3ztWTPWrnAlB3IDvXDxLYM9BRJDzProIp0tEyMji+jhE0wOq/f5VUH160M0OQpPbjodMAUpCk01/HhQ3UT5AmKu8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqj6QO1H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqj6QO1H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5169mR8e014789
	for <linux-kernel@vger.kernel.org>; Thu, 6 Feb 2025 20:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/YWPeioWos28sbTecZUcxdXc63PtoRhPc/xKOoRZm4=; b=cqj6QO1H4I8l6PE+
	gFRlfgwzFwkbTuKnpfeB3U8qQGFBCP3Yg3Ixr1uzo7esQDbNbHcdvmnjKZy1HMzm
	KVdPpbWc2Le43673Qd5QqbB08buiE+qQ/SmbrvDLYUytLe6c0oUrcmBdSDBrz58F
	FF5G3fAPT/6eH3Qsup4bIBhsxzlN1CHH2hkhKZIfEilQpoKHMPoBNZ+QtW3BQxlQ
	fsIbUnOpdQpf5VDMvtxI0kZ8r1Qr5jq22IvoYIJaUQ5Qx3TWWgRX4xTW2ZP8Kpli
	7umqVf3ZzIJBMe3TgrN+1wTabohAS/hOoxF2CqwYXe6omPhLbt8vU9dgN2Xjcci0
	mgUbmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mtsa1h5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 20:20:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa0204ad21so2565771a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738873211; x=1739478011;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/YWPeioWos28sbTecZUcxdXc63PtoRhPc/xKOoRZm4=;
        b=l7lK+NggNc4Nw+HY2AaVRKlCUcLtHxEY8SF1u8h9vHythcapOm32L9N0o656oTNRjq
         ov6GiXHdfYwKiJTXyEnuAlyX4Cy12CQrEGcspOuO9NpyuV+YTRgikGjf985fZMrfjgVF
         rDQOVQAY2y3tU+38FxRfJt5Ji73XfoiacFhxwacIYu1BNJW7ZikFlNBWS9jodazgUlq8
         wO+OwvWMEjQ7d6CPSWXI/6YvOMuZ/cSgxI0blWGzihWD5V+c+6t9jiGluY4UBhgincui
         WwXFxJ9fMWSJ7Uhd/Xtx5eEen9yr7EeWucgmn0TnO1i+ItQ9hUC1J5AcZpw7BYp1kW3Y
         gpxw==
X-Forwarded-Encrypted: i=1; AJvYcCWx8zZSlKeoF+DyNd4G/AjOlSEn4pbOPBUHy624sHfGClvzFR5RBVEHm8aD/cjLhyTZEmrnf7vD/rt7iPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YybvWsvxPsz9tw+EMoTe/+ug3zHq/Nd4S0cNyCnqpCrO1c3TJat
	3a7Q2BvjBPowpkS0wiqEkQT8nUYOblWXKx3v4vIEQJ1xZZogdk4vsWKv1t+JvGSSi5VASlAwxVu
	NHx78pC7V0YGrk8Wvi+hCz74yp8o0RoU4jKkademH9On8e0mM1eS/GeRKcm/I1RI=
X-Gm-Gg: ASbGncs7W1OD3gWM87bKVW7dScPFBEJ6Nt41G3v6u9IDI+2p3eW/0tiVyZpX3ZVR4zg
	UFQLq3JhX7DjwlA1E9BA1zLyN5wRt/NAHi2VYwYLFSHRJuO8Azq9UUOCqzxUwqVhF8i7V3YQPlZ
	TuLfKCZidlefTDBA+Mt41PwI7kZSa/dmUxLkmqqvvFASIwYdxFmRJN1veyop/89x4q8QYc+q88F
	IIV5N9zSZ1K3l4BgFuJ6HhIFnqpeVlfssxPh8bBscZ+yr9kveMoqkZNCa052lkcGFivkvM3/bwY
	o9k/t347vDFSN6pRGWzU43EN1RVVdXG0lmQolkg+q6zh6/QQoIDOElSUQOxRGJNjgBmJXA4Veg=
	=
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr611805a91.2.1738873211209;
        Thu, 06 Feb 2025 12:20:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElSAHcGf626LkkVoIHzh4kNyUtTtCOoY7OWplVqiZDIBb5g4fjnG6p3Sp4zx4Gg9+YhyO26Q==
X-Received: by 2002:a17:90b:4b8c:b0:2fa:f8d:65e7 with SMTP id 98e67ed59e1d1-2fa23f43a0emr611761a91.2.1738873210809;
        Thu, 06 Feb 2025 12:20:10 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b5ad4esm1828174a91.41.2025.02.06.12.20.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:20:10 -0800 (PST)
Message-ID: <2b52714a-0fe2-4c85-95bc-4a6c0a8a0b60@oss.qualcomm.com>
Date: Thu, 6 Feb 2025 12:20:09 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: allow APs combination when dual stations
 are supported
To: "Yu Zhang (Yuriy)" <quic_yuzha@quicinc.com>
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org, kvalo@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <d410576f-2fc7-4de1-af51-29fbe8b14948@quicinc.com>
 <20250115130359.138890-1-jtornosm@redhat.com>
 <748a5a75-1385-4691-85c1-e9cc5eb4ffc2@oss.qualcomm.com>
 <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e1c9b030-8a6c-4aba-8bdd-853113bef396@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Vw0K-ATWN_egFacmjCFBhmxD77sFjQ9D
X-Proofpoint-ORIG-GUID: Vw0K-ATWN_egFacmjCFBhmxD77sFjQ9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_06,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=651
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502060161

On 2/5/2025 11:46 PM, Yu Zhang (Yuriy) wrote:
> 
> 
> On 1/16/2025 8:31 AM, Jeff Johnson wrote:
> 
>> Kalle, can you review? You currently have this deferred in patchwork:
>> https://patchwork.kernel.org/project/linux-wireless/patch/20240829064420.3074140-1-quic_yuzha@quicinc.com/
>>
>> /jeff
>>
> Jeff, can you help with this because Kallo has stepped down?
> 
> 
> /Yuriy

We should avoid having new module parameters
Is there a solution that doesn't require that?

