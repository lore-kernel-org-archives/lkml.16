Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88E2212FBE
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750276222; cv=none; b=dLGrHTn+IkLlSRKMYj1C5iZOqrtvJl9jQXhIxFJoM21XjXwzwVqGSBdoNx7z930vSlrUHhrA1JjjVXrvq0acJo1ZBPyuBHbjQBeDuVAf59aAc8DIo5xVls9lb7lefnMUEw5IqoEOXdadHIfCe6p9S/oHIfY1y8d+vGnt8rJorms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750276222; c=relaxed/simple;
	bh=ohQZorVYOM0YtCJqiJcBa1mft+MNoH3QhgUQVZcK3Xg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B7yndPWfKFeX5paEqEb/JdteZD7WIHSr/ByQp3kB4rzyFtF6Hs99BblfrI3gbHHtVQ09Fk6AZLeDHQlzhAOfOPG46oQL1QkGrtM13UIB1wDZL1QU1uHPKWWQ1msci0HipL0pV9Xbi3tIziiAbY9JIjTIZFUy5byS2zew7hyOKK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M/heW6ey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M/heW6ey"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IH9Obk010361
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Ljc/kXCXngRvy5Fgg33kD8o8huQROVV7GWykDyAjSo=; b=M/heW6eyenmG9NGp
	URO22lJQ8+l2FJG+R0JKn/SeFgIT+6CviqwDppRt8KF/p4plmmyRk+pSbI4MbyUB
	rlPdPPRXp8RXN2kF2LosHP7T+vKycy0lhU+Z5Iypw/CGcXuKMsB1pfHGUnqrYBfK
	2hKoAtokXQqHMvEPOsiWlj/Q6RLIZJX0bsx1cjYSow7Lie1BntDYcfyz2YCi/mb1
	C0ubdx5YqFSGoKeLbUpxSxrsXJfX3UwBblwo1JLlNfKDKOAPGr4YXbhJf2MHujAg
	8jqNbg7UyNc+qql3cn/c6vzCCCO4rVe3OrBqLweORAp+w3ZZbC9QXa5Ol2zRCIGw
	oXSmog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4792ca5jna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:50:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7cfb7ee97c5so280385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750276218; x=1750881018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Ljc/kXCXngRvy5Fgg33kD8o8huQROVV7GWykDyAjSo=;
        b=KL12riYn9eD4vbkkhs8dRY6H0KWVMCs9I8BCeZCXd8L4A1DkSjfLlO7kX29y7eOFhc
         r3bJw4DoYRQuKo/P+ISmFbSK+6xTnBB8aXyJSB7v83fta5TDsrZu1dN7aFIpQAoDHbHt
         owp1jQJsnRMmj2lo+1B1rw2RNvNhoF9rH6VGvQ3w5vjBoTLeDFv84jG2p6NPvo+6OAsx
         n0Ffgnjic2LWpn9HbqsmvfhdhKCRpjyqelaTVS1TwaUhIerC/RAHo15xL6S12og0b0XG
         ylin/ui37cT44F4vrlDmj1HSF2xAb7uGb/cuzU10b+Cor7SPi7vw3bkE2Hh2uPM2SbFx
         vDAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLcGAFRsypmIOAs/fa03Q4H79BiiWZxjCD344DsKcxEe5zv+BR05TzFUw6bq/y1AG7fQ4L0JjNhhTa1Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiPs+MxHGmyGAfIEVEYjFEkDxl69MtIZ7tgsyP3/j6u1Ei25a2
	jD56p646qDcUzAWluiiutMLtcl2iduHLbyM3VthxZr2naDky4H38DugbwZ6HsFjHTN5DQGI83s8
	MChWyUbyDHvPTuDrn79SUPm8pTdG7n/CwapuOVnao9i9Xs2uO/zm0RfH3gwBqS1rZMLg=
X-Gm-Gg: ASbGncviS22U3tzNn7mfvSZwZ+hxQlfmhPg7AtGQvPs46mM0RAnzRo96BlYTGrl4EWV
	uHAZP0FUFWq/RBYqt7QfT6w9VX9Kw6XU4JgnS7nNjeIJWTTXjMOc3CcKegzCiKlKkIEniJnvS0A
	2RezEGNDNeplMNcXh+lXoBWtglPNV3le4PfTPL3ocAY42DQmYvHoMTGMSI4SSXpNpdgvgOMrXbd
	u2CHOc/Hcv+a9K9uJHcCH+sr/z+aInnFONQmaS/vNeNjA6b8KaSh6yhGgw0PCXdwJniMs52qj1y
	5rGHyDFs8u54zonE17TMezi/9u7vz96Wpvzbp1JntDg5bv7mvQuij4xxs6OpZ/aKzQQV3tl8v2G
	3p4Y=
X-Received: by 2002:a05:620a:4710:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7d3f1b5e5ecmr37443985a.8.1750276217806;
        Wed, 18 Jun 2025 12:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfcZRcccmShP6R9wCLOiDGb+StS8GFq53kzUdhUK587RcojJ2gKh2k+QUntxieK0dv2VRsMw==
X-Received: by 2002:a05:620a:4710:b0:7c5:e283:7d0f with SMTP id af79cd13be357-7d3f1b5e5ecmr37442885a.8.1750276217384;
        Wed, 18 Jun 2025 12:50:17 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88ff270sm1106349566b.77.2025.06.18.12.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 12:50:16 -0700 (PDT)
Message-ID: <13431db8-83ec-4fed-a6e5-3a6d173176ef@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 21:50:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sar2130p: correct VBIF region size
 for MDSS
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250618-sar2130p-fix-mdss-v1-0-78c2fb9e9fba@oss.qualcomm.com>
 <20250618-sar2130p-fix-mdss-v1-2-78c2fb9e9fba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250618-sar2130p-fix-mdss-v1-2-78c2fb9e9fba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XFMo0pW0XCwXp9Iffp3kMAp9pVD7Dqta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDE2OCBTYWx0ZWRfXwQyEYfuaaqC/
 9hZSGvO7iVEQ2VNhuMdJz1ZvLmJYBUa1DAEZSOUvIoQIOy8UN5G2Tdjshbhel5rwVzTKj5+OCk2
 7H8PNWnCf/ryXARhhi0Gf2vgBNdHaIYRPGFVOU5Js/wbLPryfaAiz4weyQfwxCrFtoyuZSp83mT
 ZDrNs2DXb/WJW/IDEX19S9QUNKToCqDv3KsdDlofh9OaoyKBK8cBglcDoji8LRr6FuUfYAm+9xo
 WmZTxLWAAqx+0Rw84P2pCzNOdkielVE9cDPjqJGTvZrXUjFkX0OvECayFdL6dOF5p7pW2EtWC2L
 4k6clHaVYfvPrDggiKHHtLG7Y+VMvesRExEMXgV7iznU/REels364XWP8pNqYbKiCvSxsXr1TXA
 s0VFmY2BIpcCOV49PXt0q6AG26EwY2IXtxgZEC2qFyk3HplXYsz5IR0ELHk7WxVu3FEfJNzC
X-Proofpoint-ORIG-GUID: XFMo0pW0XCwXp9Iffp3kMAp9pVD7Dqta
X-Authority-Analysis: v=2.4 cv=etffzppX c=1 sm=1 tr=0 ts=6853187b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=JF0wo2c6fDunmc63d_EA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxlogscore=675
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180168

On 6/18/25 7:49 PM, Dmitry Baryshkov wrote:
> Correct the VBIF region size for the display device on the SAR1230P
> platform.
> 
> Fixes: 541d0b2f4dcd ("arm64: dts: qcom: sar2130p: add display nodes")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Closes: https://lore.kernel.org/all/c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com/
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
