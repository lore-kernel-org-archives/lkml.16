Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215321DF971
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608717; cv=none; b=isV9hgO+Aj30PhJOL9376QMwvHtTIDSiUVjDhXgTbpGmq9a9jMS5TTweEK4do2u1/fSKAVDAFzJ0YQV8HvkU5O6h+1xmFLtE5gwdq9FT2k+dH0EXcot1lQvNHgBahFrECnlqRHHTA+JTh5nxxJzmw/scmxHWwoXrb2qqpXfzKy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608717; c=relaxed/simple;
	bh=Zq5HVs6vQhexcjE3fPRZ53qXEqzpzPviTM8D/fiSMDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GDKyM5dVmkgZSUBgURcBbLEWltuN8ZalpBcfn3SpacziLPK1oYGZhrrDIqysW1Pau/MU5iMn8bNYQwwmWk8R+d9c00DHt88mgvvCniWnB+ZN9xtHGZaOsTX5KadIF//R9IWET4gB8dIJwSfD3w4tYJLsJtmgcacfcqepD/7IxnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VNgo4nb8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VNgo4nb8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtcN007900
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3eNxSzn8WLQ5vov8QNKQghOX59luaz++bJDtJ+81gU=; b=VNgo4nb8CDcDfhTY
	4K4KLR0PWIpB39pbhe8TggobGr0VpZVNhIUCNiHQnKTPwxB3Y/cSucHlBir3HKkl
	/vrDDu2FI8oIrOTGGmpeVIJWnFx3pDjl/OFRWypFElM/lHRseghVI+tE9HKRYqDu
	KIZy8B7zgyqxNQkxHBluTNnG0lhwg3Y/XTi/h1KPVPrrpsuhmhqicjKUO3lmnmKm
	yF1shlhqVVV7jVwoJ1Gk+F2+m9iinf40f/pHPb3b720Ymiz5bbMXaduKXk4VsZry
	QLMh8OOJHAFUrYN+PDYOMUxVATdPjTHnGwvpNOx1KnZcKAeBKOE33YPeewolRxG2
	2wKNsA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j59t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:18:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5466ca3e9so14118185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745608713; x=1746213513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3eNxSzn8WLQ5vov8QNKQghOX59luaz++bJDtJ+81gU=;
        b=oJ/A9O9skEttrdc727x8l71b0sYS8FWiTjwEMPIG059vj2O7a0eGJyt8YDD4pWmPhT
         AfzAt8mmILAtzOS8inOkm8edUqWsYlyAieC9e4rXurlkhggwRpJ1+D7Xh/Zq8AfEx+fD
         1c2W0McfguDrBvyqhjHbWXCGtSrYFEBE9Ew2svtFaTp8tgM+R2yO7W0vNlIDN7HOQX1L
         7ubxcC8EvSnj3zQ9eNGnoRH4dDFab7B3NC5tFGUv9xDEUwNbeR59Lq7qa1lo6hj7B9LP
         3QcJUkTnfs+i1TFsllRXbTHmaOghsw/Zjkp8ZoxI+IayVbawbZgmHtty8rBw0hoz4pdv
         J/0w==
X-Forwarded-Encrypted: i=1; AJvYcCXb1OyUcLHNBHxywGxr7JevwCb2mTR2fcnpmbnvkjFCWCs+JegHa2cNQO7O9u/H8+cBeVv4qxQ4ROvSCS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEZ6FcSz5rXekQNGdhYYuH9R/cdpHkWZUZbh0J15DyKbn9w1uE
	nTotoRb9YB5emylb/tPeh2+hoItU2EoWcWvTJLiGeeDQLvKJ7itsPtmQMsIF0Du5/YqGWB3huSg
	OBRvEJfB6SbJ1Ve4Nfxz5fpx9poiVXdtNweJwCCFScRt9IfSy+gzxweoAbI9TGvU=
X-Gm-Gg: ASbGnctFiq4ji0p3kGnPAknDDNDUTu2LDjgYMDacxGZGkEuqMk1qKO/Cz6hpUEljNZD
	OydtQTa9CIy3vp76Dt4btjdEx9PyIYCUwTphTsoJ2NghB6Tz+Eoh1XfHLR2Ey9pGU1w8F89/9Yi
	KmqCi5y+gKxYyX/180ov2UMJafjkI5ybObXO/vw0HWOq7WCmF2bQS/t7FbIgU0hdM6Ip+cxxAM+
	SzXV4m7fH6wkRBrGZuf0TIGs5TfQ0eZh+Q4oYkPuh0d5YO8ZMKslP24eQDaNWAb4qoyoUQcdFsw
	0W4m+JpQ6fstU8hEb+c5W9vyzJKs+Qb9hwMJOJ3Aw7XCcMllmzKai2EGaDQ27KWqRno=
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr216565685a.14.1745608712913;
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJVa9FA8nBwp6ryu4SRuNFm2d3hHuCDjNvkIKhicIY6i7Z4wC2GUw7RuiwzCsiGHbiOZ9nYw==
X-Received: by 2002:a05:620a:1a04:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7c9607ce29bmr216564085a.14.1745608712559;
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
Received: from [192.168.65.156] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecfa33csm175246066b.119.2025.04.25.12.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 12:18:32 -0700 (PDT)
Message-ID: <dc83ad6c-95e3-45f1-8b78-08af138a70e8@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 21:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] soc: qcom: socinfo: Add support for new fields in
 revision 20
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250425135946.1087065-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: K1voB4010VlQCh9XMG0HFS3XFcv9OSxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNyBTYWx0ZWRfX+usK6iTluBpz Ji4TpHCz9Gwh1MOAz8S4HOjvdn9f9++A+6KOEZOcIQ9MbdAoU3YcY5Ltvjk9pq2eIOq1h95iY6u Rw0MPR/1ewAe8p/nOCXBhLLcQK1A2AXMeDXWxfB+0BkzLBunlnRguxwm9VNzYdeRvqgioAe0N3T
 YbtLEswxPuPDZO259kPjs0I5CjhjIuckMD79GBVFydyitN06NYLCNTY0bpK+8tJdP5G2xkTnwyr 33dWCSt3Gpioa+98gGw0oBaNnC0TheRpwiGtkw5fd+nwGvsd/b2/zu/npTmcStVTbWvLcldxrsF iOJXssqbCziU0D+d62MeQalgucXp9FpfguSqL46I4Xuzzv1+uo9uX+uv2WqQoyuwbIw7/CSETw4
 po7sL9iNCIJM9+M4dfOgofiA7yKjFqR5/qdSo5BOjrnd1MUVP6zweAIZC9Pw0FbijKf9jcfH
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680be00a cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=y_N5iSi_J5k_ybs9BqwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: K1voB4010VlQCh9XMG0HFS3XFcv9OSxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250137

On 4/25/25 3:59 PM, Mukesh Ojha wrote:
> Add support for socinfo version 20. Version 20 adds a new field
> package id and its zeroth bit contain information that can be
> can be used to tune temperature thresholds on devices which might
> be able to withstand higher temperatures. Zeroth bit value 1 means
> that its heat dissipation is better and more relaxed thermal
> scheme can be put in place and 0 means a more aggressive scheme
> may be needed.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
