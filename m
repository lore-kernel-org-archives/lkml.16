Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7675622B8C4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744129048; cv=none; b=BqDf6Zn5GXcNEwEP21eoyzsHVyyxc3IX0Hgn6QOIxcnrjEHApnLU3QRtmnDZ1u8Rlo7rMoqCUgO0/nFR02++79/yxLl4Q81FPSsLrJT8p+kJ9EuJXPg+7QztVgfBFcSCNYgj9f2GSWTlgJXlKBkau9g4NywkT7CL90xVnQvkM8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744129048; c=relaxed/simple;
	bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=og/V2cetiFiWXxFXiRXYshIFt0UHvCr5Rn1jC1h//3K8Sbw+5/mKESiMq0Gn79hm5cJI1aJF8rRJBcBZBY099x2C+FThbA0+LTdySdBLdXCJ4tO6xkI+jNy3wdjij4qs6jCirMeBLpoejEwBOH3owg29Dw2B8IflHPYyKC5tg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pr/2o+T2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pr/2o+T2"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BFdZ5032655
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 16:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=; b=Pr/2o+T2AJWIANUB
	hjsOWEzg+ENYbQZivXpM2TYLiXT/RVIy29I+nHMncuoSHYwGtXhWebERD/e7u6Bs
	RV+nPlUUZRrD1Ie7VtOaakDn6ukjL62/jEFprIlXCeHp952Ew2yUubGvEuEd8eZc
	5TJSBf5lTkEz+3rwjNDUPob723OXg+iKFVcEZk9XOpyvPQvyzf9HMAkQlOhi/YOs
	VZ11asVQT1G34crFy08214QgV0EK9b281mc708FV6GaxwcCAsFEx4enhRtZwg2zD
	7BVRMxqSFnkGcwTvuw8T8PVmdFfdpNOUsrwIfmPyzgmfUf3ICJddVVMAT46aFBqz
	h/LKlQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkg9n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:17:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-736c1ea954fso3070730b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 09:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744129045; x=1744733845;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18Jdjy1lIDqxR48lbXfj7ebOVzAt1zWbyiJblhbXmrg=;
        b=Cj+bwWiX4Lxd9lZEhD+dkoHLV1+CYYGCZ4KQ2mQxJLsZtpTAyHrhcQKtf6H9woXqVR
         lsBOhSQbetsw8Cy9Azrg6x45GinyaGMYyyl2PP20je6XIAwIzoftQjERORG1tpLv5TbV
         yJK+joHpFFI1sB0HsmjAEq7Q6o2Xu+st3IovRafl26tiNtyRiVitSzA3ObMm3nQJRtIM
         YBghQ3XPlhV6ZT3wbwQuIa5K33zLWFOLOGopem+7BXKxzg6VHsKStC5nuSAUuYv9Kd2D
         Mb79Q9+booan+GzP9JH9ooN8uQpXnw40o1hFLimhVflNmRsOnRiOK6uwAVcYq2sEn/Is
         EVDw==
X-Forwarded-Encrypted: i=1; AJvYcCUbaUns+JbT0FGysH/Zs9cc0MaF2a7Qn8oLjXfDKilXyLyyERp3PeHL2XzxMSWlMRHnonFunFUVAB2zbcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgdqbt3hOzJ3Mrvnk8ewZqsBiqUEknxRK1DyvdwwGMFzJyVWon
	aPZhwaW2nTS37l1JAXGg9rjCDjcomWGIoJSn8Bs9lR6AiYb8SO1jRVStLW8qEjHvxra89vBu2G2
	QCXKQzuzN+qfCaFxsE+JSZYOfgapWpVbo0wKH8r6WGrJd5oPUdnfV1TgDrZev39I=
X-Gm-Gg: ASbGncsPRefg1k+Z4sYbGtzpcLwDGMOwgkwPsCVqqEjdwaj7IetDEjKtXW5TKCXcqAN
	QA/tEXChX2jl4R/p49BFXTVoEVHuLPquunUiOSO+F3mRDs8V1J6+ZArPBemQWGzbBwTq9I4PGqC
	OGXAraE27kzxLSuqXWAg/9XE3WjJpcqIbIM1MITC60nk2mOOgYs/VTUbm7XLK4nhTul54fDmjGG
	KdIB7vXEBtSNjv6E8BQH+xyYbnONIX3lz+J/JlKAnjLfeMC/x3IhhByHgVUgX5/nEGVYD3T9NI0
	n9hEPCKbnA/1Q5uqPO5je0KhKTwrrJz4WDcRSQF6VLRA785X5yDyZWxTO08I7fmV20S4yqk=
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526631b3a.20.1744129044297;
        Tue, 08 Apr 2025 09:17:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJZdKS/o6NN6Q4KWocquKtvYVNzy+D0M8LQwJcJbyDtel4rJpvz67ulbdOI7/T5HoHSsQK+Q==
X-Received: by 2002:a05:6a00:1411:b0:730:927c:d451 with SMTP id d2e1a72fcca58-739e4c0ccc3mr24526570b3a.20.1744129043635;
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee6besm11119301b3a.54.2025.04.08.09.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 09:17:23 -0700 (PDT)
Message-ID: <4ae387b2-0dd7-413b-b66c-1f136455e23f@oss.qualcomm.com>
Date: Tue, 8 Apr 2025 09:17:21 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the ath-next tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        "Dr. David Alan Gilbert" <linux@treblig.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250408105146.459dfcf5@canb.auug.org.au>
 <Z_R2lEVjqn2Y3_sP@gallifrey> <20250408113747.3a10275a@canb.auug.org.au>
 <26cafcbb-6a94-40ab-aabf-3c9943cfb925@oss.qualcomm.com>
 <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ee51a503-6580-4f46-aa38-77f1b9ba6535@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OL5yNCeU1AaXR677LHsxPm1fDNm76iDg
X-Proofpoint-ORIG-GUID: OL5yNCeU1AaXR677LHsxPm1fDNm76iDg
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f54c16 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=vn2k7iJgzrTi_hPdtGYA:9 a=QEXdDO2ut3YA:10
 a=-FEs8UIgK8oA:10 a=VxAk22fqlfwA:10 a=IoOABgeZipijB_acs4fv:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_06,2025-04-08_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=482 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080113

On 4/8/2025 8:23 AM, Jeff Johnson wrote:
> NM. Since the timer_delete_sync() API is already in my tree I can make a
> one-off patch for this.

please review https://msgid.link/20250408-timer_delete_sync-v1-1-4dcb22f71083@oss.qualcomm.com

I'll wait a bit for any tags to accumulate before I merge into ath-next

/jeff
