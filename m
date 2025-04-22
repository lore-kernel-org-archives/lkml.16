Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F89821C18A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366134; cv=none; b=pXE5eO+eeV1ZHTE4oXSiWWSvJG+HgpMQBHpl9hVd+XUh2i1yL5OKy7ygNUcR8S4O+arncmCr3JEFH5DEEtqObLFyi/GMrvCjMBAPCtJHbHc8NruXfxD9Mw72IL3Ie9pPq6NjCiUp6a0i23R/cBzaUDGC8YT4rsrBpuyF/qzJ58U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366134; c=relaxed/simple;
	bh=1uXwF1nWfvBIYeAK4gSOok5hMVJKS76PKakAup+bCLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G+DHZZzMueIpT3lPN8h+sQSoFtGeXVmO9z7fGR0h/BSj7z6+aJgQswBQQ1Ohgccfzd2NGTb+UCsvIdRSwMa84KUIjeJVDmtqYHtZX4J2/S4APFEaH4hTcld3/3plRPOg7zvVho8HbGLm/o3WjfFW9gCwYLQKNNcqsmOApXl7/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZC8qoxc7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZC8qoxc7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKppsY026487
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=; b=ZC8qoxc7CQdP2CNZ
	gjEvDtH4JxQAupCMm8zmFo0A9OnDxqQcN9EQhmxlNjq18u8eyl+1FLs9JVM2tTnW
	1Ed5xjXSFE11Hee/kETgt/S+iE+HKbjv7y4C0AF8fnPf0cHPaNxBhDiVOMUZZXOR
	YdN6sJAm5Ar3H2hNPXztuj6BCd52JFYdZXZP4pS/+mTG9cNtuyrVHVUCum7f5Fgm
	4qLouDg3BhBDzZycpLRgEIxHv/b7lpHAAR1gjJdhTEwzujwyP1JIDLJ8+C9KXAil
	/RnX/8LAIKXK+zVr4nXBEbw6XmQrd3w+IiaOcb8fAhiR9dhaX+oc1vyCt4UZy0VG
	JuU/cg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3ga50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:55:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476786e50d9so14159181cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745366130; x=1745970930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SibCIoJLPofORnNhgtOkaJm+Ip5k/Pjt+gz3fvgMRA=;
        b=ccpjUFQjTCkdxjUvpXWtf1h5BZQ01IEfVQtB08l77zlMNapkU3lHYiTKb1EFuCZp1O
         x8/vFL5VAoemeSfAHjeWztohA58YNI5p7Nu8tccq4pf0GZtOqLd6cjL6HOV/X9I1bgA8
         xdj6y/wArmpgh+TkYa9X3P1cmJAPsIoGUxh2mnsTTXpG3URYJ4Yq/9r+3EWVE40ByqEW
         08XAnXgveqA7YC/u8s0lwewX4RNMwOffKBGRk5r1MeqyrAMQwnfj3ejNJIBr5jnfAsWv
         Zccz3HZl+iCQ9MDaJmRPegvXzFUmeCN1oY8yvFwsk2p/jTmDfI2ugrN9o3P8JwNjBS5c
         /bnA==
X-Forwarded-Encrypted: i=1; AJvYcCUtMLGTiPH4Mdqth0xHlr4lUXKgBx12PwdQEdkcD+VpFUYzv2wqkNVr7T6kI0bnmvpYxZYlfCLmzABT25s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza8yjmDQZwgUXdRFZ/QWhwUx2FFRcyrV49vPNGUUaWPlMfNj4o
	ZD4M5lD21UC+eHFs0HOzWqCHSMPzeDAtSnAeH872+o0fse2bdkt6Hyo7lCKDNFGPJJjqGR0y3W4
	CdkXB+A8YUnLb0lkA/27fD5HP6zR1Idg0Jsv+hTSGpsjNI9JL3GKyxymw0TB7Imw=
X-Gm-Gg: ASbGncuVhJwlr63MQ3Sdlfpi0ayxHsyrVn8UN4hXO++YgpQO24kG3ynvoecuXSX4tcO
	vGUbNpBKMjKi4I1xDt0FAR2M1lMT+SU8kcMI4z5oTONV7OI64nX9yWfSJM0zNiO8t4sJZJoc09Q
	rkVNdkDA4126bC1v52TSjw/CRWyG5QFU5ehOMdCKyajcjzv2YXrQl/bTH+JS1uNRGRBKmvMMzwL
	uNEu/gaoGvQaJB0tWcsozHz58oiRNixNg8jMmEO5mUzVuQGiHXdsbDrrgPMy+3TkJ1pCzFq/JIB
	/UH0fifTC1bM94Af3JYBnJCjIaPo8X1a9L/O7b39wFmf1w4VHQmiylUBrvoPcK7KKDg=
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5273031cf.12.1745366130613;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR8WOuTeaBqmC8HY7gKGm3GRXoWCrCxlpeSTPYTgdFKgYeceHJhp2S7nDIq6tfwkx7ivcQ5Q==
X-Received: by 2002:ac8:7dc5:0:b0:471:ea1a:d9e with SMTP id d75a77b69052e-47d1d9cd5cfmr5272961cf.12.1745366130332;
        Tue, 22 Apr 2025 16:55:30 -0700 (PDT)
Received: from [192.168.65.141] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6258342fbsm6701884a12.49.2025.04.22.16.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 16:55:29 -0700 (PDT)
Message-ID: <8c0c0740-3f75-47dd-8f11-c03fbf8b1583@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 01:55:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add support for Sony Xperia Z Ultra (togari)
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BxvEIt_FEVKwp7eWRmytQes5Bbx_71l-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE3OSBTYWx0ZWRfXycxGYaxl0XhA LAgh+3s7C5uaeCUZk78ALi8DvrdyYGgRtYvIwKE26JlTsXTswk9xhKXd/6OEYfr8fH++ZKfsxvs snTb7RYPW9ki96lH8OWnlno7jI0RAfQcL7PXqR3DOYKbkIt/UssozeYdc8s3osfuPXR5bKrUqF6
 73oGKDoY0teTzflX4VcNMT1cOsRYEgy3uov5R+BvcE8VpvOOqDHVdOFKRnvck5QQeJiB72u/0OW UTiJfN+ST7ZCY4bhO4UK2SDOKpgLBsO8lzr9UKl8V10nH/7IP9YSaRILMm5qkzGC4nXPdGPZyaB k8FkMsaYeD+jF6SyTU6F2YT5ev4koDV2uRjjQRwyzkT45bpyrfsZTy/0P7W/lNQZG22EwI+dTyC
 A54cPrhmL283a0GBZusuJJjI5IaeQQjfE4K6+skXKnVFg6gA8CPGuoJotEkw5Z8m1AXX7EQ8
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=68082c73 cx=c_pps a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=Kb3nHg1V0brCK_6dO4AA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-GUID: BxvEIt_FEVKwp7eWRmytQes5Bbx_71l-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220179

On 4/19/25 11:00 AM, Luca Weiss wrote:
> Do some tweaks to the common file for the devices in the 'rhine' family
> of Sony devices, and add a dts for togari.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

I don't really know for sure, but maybe this driver could be suitable
for its touchscreen

drivers/input/touchscreen/atmel_mxt_ts.c

Konrad
