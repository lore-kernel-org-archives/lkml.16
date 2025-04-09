Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB181DDC1D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744224582; cv=none; b=pvg4IUt93WT0STUUGl97Afkxdd7Rn3KCkHjSUXvbiOAKHCqYKgU1+la4QkugwJ5SBoHGG6D8jL+HkDTHm4T79OLFTPo+wgIrm6KZTI//GbPI9aoZBVyNRpXAwXE7KnsWr6YaykYOLfSt5mivdGGjtsYXYZ8wx3LrjHJLcyuh61M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744224582; c=relaxed/simple;
	bh=d1HN9Tr6UusnWUDY09EuhHWuXvJFMZU/PC1RTqx388Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGhcakwGfCib+Tp83ehmuGwWEeewxKT3ltctoeRTClW9nbAp0qbNFHSoeZrGpqVyxTBsBghuNQvnMXlZ1EYMGFUdPqKyQVcI+ZJiHhzQUpVWnefLomt2AdySfC1DFAZCW9et/EWjIt7RpKYIwLa6G+sb3aSdXFMN8j1NSXHxa58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tg+0WnMF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tg+0WnMF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539Hr1ZG028991
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 18:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=; b=Tg+0WnMFbMdwmdAe
	jGAgLCxebue2pQoTHclz7XGlGQ2+BfZjw6B2C6PYKO6E75IOcmHWvybq1HGmJZz/
	8/WKj/sCbOT32dP+eiLNs16mUaE7A85D3H/wH3o5wtr/a2kXlAYAlKWqmSbEJ/j5
	k/i1DOM9PBnkotkmb9LYrtBhtjYx+YoZBepNGFQcGXfCxKIkMddC1O9unS8u/MW4
	xtNZnyV0Wx1yuoclavN6npAop8c5H07iRhdh6CBcqLmO1P0TAidcHuFTF1UrVJXt
	8pY9UnDzK1S1qzUo5dMMlOHqK+KrqirG6aawVI0P56DXG1/V8mWeMoQAdJ+FC8EG
	Obp2Vw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmccr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 18:49:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4775d024d0eso11244321cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:49:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744224578; x=1744829378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G1H4peKA3lpmZuEmoeg3zh5n+oBKM3YHIRLcwt6Bh4=;
        b=D6WCuXwYAgY9ZEwncL2FBrG0BSjDge3xM7S0t73e4PxWhnkg21UQh92+IFcTLXiOP5
         WJBXvxGdOWe7eY9aAdHHLUiAmrEclw4pMWMe5tT6kHsdlfKRyj1tROmIWEfJFs7w081c
         b61cJvMVKsbe9HKSNlvl3dG9wSYzXh/uefkO/Zrl4cBfxZYOSb8VlVzcTjEBmH1abU6O
         u30W5JdnyuCnho9MORFYUaAZ19+5kGKLhmAHGM/uakkvPSySg8mWnq4s0gw/2Th83t+X
         hbUP1yTXzUPDNp/3NsA89HezGBuBAMOxOCuWOOgOICrtMgdYpImTSgYuuFphz3+8FD+N
         3R1g==
X-Forwarded-Encrypted: i=1; AJvYcCV7uiNzpy9dMgY+27dLsWzUSUxpRia1AfA7Gy52COdUtWDe6A7IcjpCv7uT5yljc2gV+ow47oHxHCNy8Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO1FoDiD7oUJqVtfbNxhwasD1t5vwO/F1Ov6ha7+6hLDGyUyQ/
	dCW//6nMg5NpDqDnjnqONZ3eyCfo2ORgM+M/PaNkDYFr8Ui/1szSNZX7irv3cFkA0IPHpMB/8nn
	mxobNj5UR0nBX8qOaxOWJPUQQ7heLbVYC16VI6Ova3orQTOfZaNpGTiNCL4S3k26a7s84ykQ=
X-Gm-Gg: ASbGncuBNX9Y76g3sHXeoal8MVDLuBeYDHINvj/otTDTBEOPR3p3PDPCET5iHoQbgB2
	zQvlffMHijlpBVBADu6Sfr0MEVc2r/jRfaSMPdIw9PDBjWMlvQMxwTdmfLp9ePtlnz1o/oiNiCN
	X5AL5m3ptZ1Xl5DcoY+3aWertefy5QWG3CDGnI0M7n9EQB9KjXR7T+VbnEqoBH64bzUJCCZDJR8
	tN6DozPTDoDd5R/e5jmtxYtxRefmASilheeH0rMwxTHtvu+/m4MCL4Gcu/DjwtpoifsfF8qFc1J
	HI8ISxqKIQ0YEZ3mAOnJebf5FgDPHXMw2PhdtGpl5jIYxZzPZoqJdGStRszuQkDZ4w==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18667001cf.11.1744224578463;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4IsBpqmt+cYnKoIaMat7rtolFSfys581Xta6Gs0Qhv7H57/HFppjF3Hi21BAzmpJ//NIfkQ==
X-Received: by 2002:ac8:5a85:0:b0:472:1812:23da with SMTP id d75a77b69052e-4795f37eb0fmr18666801cf.11.1744224578139;
        Wed, 09 Apr 2025 11:49:38 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f2fbc0d2d9sm1138649a12.29.2025.04.09.11.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 11:49:37 -0700 (PDT)
Message-ID: <07426a13-7897-4fe8-bfc4-549730717e85@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 20:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/6] Add support to read the restart reason from IMEM
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: wypCwtQSGJtHysU6HMtLHMm93vi6HQUN
X-Proofpoint-ORIG-GUID: wypCwtQSGJtHysU6HMtLHMm93vi6HQUN
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f6c143 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=5K-QkYO3ZFZSxnrS5XMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=807 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090124

On 4/8/25 10:49 AM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
> 
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
> 
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file. As of now,
> we are handling only the non secure watchdog timeout reason.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

So I think it would be easier to model this as nvram (something like
"nvmem-rmem" with imem perhaps modeled as "mmio-sram") and then consume
that value through in-kernel APIs (or write to it, as necessary)

Taking a quick look at mobile, it seems like "reboot bootloader" and
friends use a similar mechanism

Konrad

