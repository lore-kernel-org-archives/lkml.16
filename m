Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0AD2676D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744223661; cv=none; b=MTiN/HaSdxGVGwDwaB9Bm5FVk2LzIfSmPEGhYFheBeX+Y2rAS10UDG1XbHGuFrBcBjkFVa4kHB6twzT8Cz3v9yBHz8tTJz65EA6y86k4JRZ/ycdOunlUbvGqv+JhbjVQccnHkZt9S4TiHT8oLe7UD4p8NzOuaw34m42Y4H8hw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744223661; c=relaxed/simple;
	bh=QFB9r7z5dMdlFE+zQao4IfBH8uhmLX9OrvnpVlAWGnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYVmv69/XukeaDuXklRREvk/2049qxfgOllhRhuWuifEcZEUY0jAT2wBA8/ppivl3NIixIPwwnvRMfMS2+Bi51HqGZOsi9m+DBQ8QGz8sCmLsbI8uyMEH7VWRVDUU85yGvLcEaE5KEANcNg4QGJklAFFJ21pOUv0+USPs9g0j90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIfyPnCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIfyPnCW"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HENZp032317
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 18:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0FeNQoeOgTEfF9ey7V9m+Rk9CoBm7/BgK4wKzyg+To=; b=CIfyPnCWyOqCKAD/
	F/snSCxaK/zCA19PbByK9nd98LJ2JqaZLBihQQv1tcLS5g15WoHbqY9M2HbzNCvR
	CNPs/HbHuJPVzPIXv76WxAxvjxz1dmRy+HUyajlu1qKzCuRzYvjQFOLPgN9Jfh2v
	c0opIGU2tlJF+/+w7ndflFkHrhR+8ilJ5M9r1AxPBai2FuWgnD46Dhbj8SJP/ohT
	Gb8u1U3RXTt/m1GJYEtqS8QtavHb8XwMmSzD0Zwu0XuFqXvMsQpUa2Tk9X17zewu
	St2LjnXmH1KecLa+IKopcxsgoJpA8VrUhQaKRzdvoypFvOQk9WsNWfCsB3KNCLpw
	EPFNFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbecg0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:34:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5841ae28eso235885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744223657; x=1744828457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0FeNQoeOgTEfF9ey7V9m+Rk9CoBm7/BgK4wKzyg+To=;
        b=B+Y6EyBSpR+JDf9pfSXQk0Qoh5ZcP1QpFciEHIPY/hxJ83U1EWJCS5dQ2IJ1Ex0slE
         aUOE9GpdcoKkD/+4+vbnYnZ5dDJIPX+021ao3FdxSgm8RMUf6obG6kjwc0Y7paXRmjmL
         O+YHFtTPaWXIV8pucRDhopW+NdUnCBPuWpQx2oyeE5r8EVYH0rztn8rKymvJm5rn+wZC
         782OrW6sZbpP6pgdH9fHVwG4xYAvbO6FZ+gl3GJezBKnK9eANL+UTwDFc+A8yB+izfhc
         n8KGMsEgSQeW72bIO32H4l1UswXzz77lhBS6j/O/czZ2mzjyRrVjyO5vCCn88EvStYhs
         HJmg==
X-Forwarded-Encrypted: i=1; AJvYcCXf0F6GIHICAwdsplbnRBCgeq+GOYGsUN/IpSsNE5/1bW2hom5sjFTJvyw+y8qG09l1HpTu6U+pcAAcUxw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0vePIaw9sj1DnczIS/Ywi4loACK47Uc4ZFQ/FkUHkRvDNLU5w
	gjMeM/hngULM3qLBTzjUK/0SFbpGVn/ZJ5MguxHVSqcDZPqiuqjxejumFOsTLQRP3EMoOyBY53o
	BGm/GdRSIkfld20BEYSKDoIXRXDPKF0Unl3IeD3x16p7Z38n+g8/w3t0yUCn15K4=
X-Gm-Gg: ASbGncuS55pycmcCxWpXIw+XKV7JpC6sA1iJKNr1XwdY/PA3A4iQEHkJFaTFXxAMID8
	4mAEwqKBFaQLLZGr/q2rWASFqqLO5dwdTC20k3JHUdLAAC4GFZhhOEOGFCBBVErIhlT1WIQkM6r
	6oST5tL+A//ssHKYOn5khSSpo81RPLRi/GJGgKt3v20afN3Mt6l1uw8w5ImgxObnlD80YtEm1/2
	mEFMzqhEmxEQKCJ8a+x9/15X/dY8AqDrTuH7mi9p5bBtS68eqyxwxHfQ6MZ2ZA4vKevzxLop9Sn
	KSXVC3lO8Cbkjgjz9LmQx/8wl08/TLKyj90Cnj1xxVF0Grf0yj+9sKgEO5l5kgfXmw==
X-Received: by 2002:a05:620a:2703:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c79ded4340mr169119985a.15.1744223657374;
        Wed, 09 Apr 2025 11:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSFUsI0lq0CHivUmmOGJxEdsH9s34vTHIa+QcttBA4nANZHeV7gUbk78k257Wljic2w+r2hA==
X-Received: by 2002:a05:620a:2703:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7c79ded4340mr169118285a.15.1744223656999;
        Wed, 09 Apr 2025 11:34:16 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbbac4c6sm1108553a12.13.2025.04.09.11.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:34:16 -0700 (PDT)
Message-ID: <95a8dbc5-c759-4e4e-ab5e-4fd6b9eb4625@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8998-lenovo-miix-630: add Venus node
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-miix-630-venus-v1-1-771c330ee279@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M1BefH1a39Bt9Q8ncTRy-uV8y-SwHtN1
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f6bdaa cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=CBGSpeRjDxRW5wpHoFQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: M1BefH1a39Bt9Q8ncTRy-uV8y-SwHtN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=718 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090122

On 4/8/25 3:10 PM, Dmitry Baryshkov wrote:
> Enable Venus on Lenovo Miix 630 and specify corresponding firmware file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
