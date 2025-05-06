Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326EC27933C
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746542239; cv=none; b=G+Z9EInNyY0ALrCP4g9WbTOzBfKwTVKYy5z7pqxx7y3buDDpmDVDp3gye+F84kRkdf8rLmKKHCmdJ6T4uznTZbqTDG4iOFjnVrNIAFew1o6SNQIz2HxGkV+ytDOsPDiHYq36wEgXah4KbKtywrPRxXc+ZQc7XaMAtRkcrpFiZxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746542239; c=relaxed/simple;
	bh=gAp27/Ze9e2YYINIy6xUzVwvaYKKwzKkfB71FlkQexs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmQZEj2XU98sLGnaawnt4JRKd3w/ecT/AzB4LtbrZJVfF3nbXtuAZ5FtucKYcp677fQzSDxsxfDHLLk9RtofaykwqW0FXia7RK5GWzWQSR6DEQ1uIKXszkfOBAuDEMNc73m3gOgQW0NJG2WcNAK70zFyrXnIOdiIQF8V9pwUlps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKeAzIjF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKeAzIjF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5468cc0J010433
	for <linux-kernel@vger.kernel.org>; Tue, 6 May 2025 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9LpjmrGsa6KX7k5o+XqftqcUhIlGQqLrDOSXLFqivg=; b=FKeAzIjFZSe8hmlV
	Ag0PCJhlwM9BmaFqKV924BjtHgi71yLZlu8S9bMkQm+EhAZTVig1ZOYpY/itFboq
	AhEli06XAm47ojMr2Zzfa67OFOxozoMgMwkqYRoatbXAK066ddIvxCxQbf+QQscD
	fkDUT+F3xapbdjZVnFbLjnrDH78unaZ9iy28Ns1K6kL52Nr8NqeDVwq7hYesJH5V
	daCBhleLPDSnReNRb4QjDgMFjKiZFCbR88cRNnWHntdJil1lSdhIlJnjeTIJ4PjQ
	6qSsdEByiu0seq7cZ5DOzdfUTzI9LBbsJxyUES6FveA6nGfL/Wkcu0iZKMys3qSY
	bSDuhQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5tbam2t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:37:15 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso7986630a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 07:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746542234; x=1747147034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9LpjmrGsa6KX7k5o+XqftqcUhIlGQqLrDOSXLFqivg=;
        b=t9DjfbsMhoROgY2qaHlFDXDipck9fQZSTBBAS1PuJ7PGGNmVEs+j25L+jQamFnWExV
         kOHrTOylIl1QK+t7LkmY0dSRALG8YVf0PLgdPHqsKPMWEwLgUj/GsWRgzy7VMtHnQljX
         xR2JYp90kOfy3r5f8dvdq1sbFR3qP0UxlxOCV2JzOdA/6ymExmm+VXaZ/BfKPQLHhIBB
         Biu42J0yEDVE/T5SNwnv8h8guGW6uMsXm6fYqERIyxX2bPqdDBQRoa6113UnKXc5zAHI
         Dfl0vbUpL0E9oQfefYtgO62N3QOLRjX6VSqgMR1wip5qn/igVMOLcZh0+37vxY7Qc1pU
         UBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgtNjK7LrLFs1AYUXJI6F+pLzwzgBGyZjh2WERU3+yx1DwrufpQygBH9ZaAiAt4LCna3cKurLz85lAUu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YynUuiESXqhzgnr4zxHnbDgOD4laMRuATbGrdnbas1KKSzm9oVU
	bKg8UYu8A4LLtHz9uUQDjuwjpDfEy8vmDruWmtMxa/hgiHPJIgkRVrK5Aink45mdp1CveT9XaaL
	2tqrWxRXz6Nm9c1fqdrGz4oI5OoDc0h1toFL0YrEktVTDFlv0L9JdjgztoUHMCwI=
X-Gm-Gg: ASbGncu7Ki620t3+saQFBhEZEgUyeRdpcSMWGijo4RtITwGDYRr+sBUx1fixbdDw6NA
	Mj4fsXpv8rWtJ4cOLGlCwaIB/9z3DHUoi2YnKAo5lBGkE5NSy8ySzf1tzSkduAjzk5vZXycnP2c
	63tvGMcQDAKfXdt006LSiEV9pSqwHckG5MUjtm2oebXTGUT6uTz9OmAtODSRYens5T8Udniz9vA
	Qiwktr8GtRDtWJCb/200LDbernENhvCnJHna/tl7f5cV6/gA+GefzQvy9lc7kIsBlQjOFjFsOu9
	xownj/4dF12klMybwaHUUah7kPTkkzTBuHazPCPIOxoGNcZYDvVnRnnWPaMoIwVvUeQ=
X-Received: by 2002:a17:90b:5748:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-30a6196eed0mr17318775a91.4.1746542234559;
        Tue, 06 May 2025 07:37:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkwRQ3DLQif47yvq8WNL5KJa0f603vHTBjUKMr03pjsCSwYyfE0Y34FL2epgwqjP8ZEZIHlw==
X-Received: by 2002:a17:90b:5748:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-30a6196eed0mr17318740a91.4.1746542234093;
        Tue, 06 May 2025 07:37:14 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47477a3fsm11334008a91.20.2025.05.06.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:37:13 -0700 (PDT)
Message-ID: <b21ced75-b239-43ad-b4a1-293300b00eb4@oss.qualcomm.com>
Date: Tue, 6 May 2025 07:37:12 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, quic_bqiang@quicinc.com,
        Jeff Johnson <jjohnson@kernel.org>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250428080242.466901-1-usama.anjum@collabora.com>
 <f58075f7-f643-4e47-b774-dc529aaa01e5@oss.qualcomm.com>
 <ec0bb100-4a70-4827-86b1-e4a7e8867a2d@collabora.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <ec0bb100-4a70-4827-86b1-e4a7e8867a2d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6-A4LhAcIfiAvoW4bl3HMGc1NpS21kYf
X-Proofpoint-GUID: 6-A4LhAcIfiAvoW4bl3HMGc1NpS21kYf
X-Authority-Analysis: v=2.4 cv=doXbC0g4 c=1 sm=1 tr=0 ts=681a1e9b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=SFZV7YdHstKF1boNYpMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0MSBTYWx0ZWRfXyfbOzu5L1sbU
 9C77yOAf7mzBy3K7C7r5uOHYb5itFIOLrVWB6Zpq1hFV1P2xmTZ8wSSC41qWPX20GmEmMgkcMjb
 vDwPuTgTR7gg+kBhuITeGUnS/srNZghOvEI0oediMBjbENOiNzs5hX/cinCr8V+wOylxxgY+Fdf
 MxS3o/r2ZN65vnPwxRYLNWjmkvgxiWopbAF6ZzUMPGiVHiLE4brdLjW2ruTt/hNGUTC3c5Rj1IZ
 dre7Hi5Hr3B6PKgNrZpm9TBROzABVKVd/LN1i31QGt01e/xP67K4k/om38xC886Zu3nU9CfyPaK
 FuQvwWSQlgjoeC0TPsJ3gW71MG1a8e9iHEbPICr5/g3VaelqU1CtlPENacZrxQ1DlMBhclJLCBQ
 9cHYNGLEzr+AKlIUZbly6GKG7l3vL8uKFVvnB9W24OMcOy6X4cS+TC8aEcSUYpYP/vg3Zpnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060141

On 5/6/2025 6:10 AM, Muhammad Usama Anjum wrote:
> On 5/6/25 12:17 AM, Jeff Johnson wrote:
>> v2 feedback was not incorporated:
>> For starters, can we make the subject a bit more specific, i.e.
>> Fix MHI target memory reuse logic
>>
>> But don't repost for this -- I'll make that change in ath/pending
> I'd changed again on the request of another reviewer. Please feel free
> to change as you like. I don't have any opinion on it.
> 
>>
>> However, does ath12k need the same fix?
> Looking at ath12k, there is similar code structure in
> ath12k_qmi_alloc_chunk(). By adding some logging, we can confirm if
> ath12k requires the fix or not. As a lot of code is similar in both
> drivers, ath12k may require the same fix.
> 
> I don't have access to ath12k. So I cannot test on it.

Baochen, do you want to propagate the change to ath12k?
