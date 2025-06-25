Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0125BF1F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750853334; cv=none; b=R7NxzEjAxX2B6/Kibwcz8KPuA5kUEaHDtjrfVoO8N8jDagta+GJynuMpGa1vOc2IrTKeCDlfUKHi6ypvnD+tk77dOX8LDhoB/fyxAxBxTT8wz9dNlsIf3UlPIv1L5VUOiy0p7tZaOZCMFvxkFlfYm9zUxS16QtxkJ6wzxW3wO9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750853334; c=relaxed/simple;
	bh=XjUv8TaY5yIBH6/CItLrdw8sZu5ezM4kHakd8j9DWGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C4jsjKt6K98WbC59RDPwjDq1l7qfVPycwLA0hzQvP6KDHynNWcAP5ReWHP218QIivE+426WC8Ht4IrFb3OPgNoKgNiMQCn0uAHj3W1ZGCs8bOy6v5kuufTfn4kZZY7lpibMGFpANAD30W+ElFvv0iPqjE+Zb/Q55BOJmR9pdAVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNBD/mXc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNBD/mXc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P4Xjia020776
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MCaQnVyE91f9iV4YWIF0jVhUsTexB56Na6nrOBLs+DI=; b=JNBD/mXcTUez4djY
	XllbM8spH9REuFkvl4zfaE8jU+BdZV9IO0aa8ATHclLiCyHA/E24N/3DoHNB7IgJ
	k0UU6MBhmMHn10NsFiqUmIiKBMVXF/X9SPy26jn5n1oC7C6BmXai+E9jMTr6D2+Q
	QeKe90bcHEtYZcWZ4ZoSwdWwCIuJP9BT+m+RD0tDRIhzedwkeVWA75WtAI8ajAGx
	jSKKGqwuH9F75KEaL+JqI4bbmGWRPjpJH01G3f9b7j94er9uNNXJZObIi253BAGr
	46EMIER8LVhUVSHpBfMd4us36jmSr7TZP8snOlWOtrFc04k1UMxk/F7vYt+KjLLp
	sGEiaw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3ymby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:08:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0a9d20c2eso153868785a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750853330; x=1751458130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MCaQnVyE91f9iV4YWIF0jVhUsTexB56Na6nrOBLs+DI=;
        b=Pg/qHt8OnZmoYU0qrGMElruFlYbfijNBnb3hL9vwEBs6/l5FFeZbmbzaqT5Uz71M4y
         zUqLKvlPn5GKjl3/PG83NGFuD/jrolZn+99+B4h3wmz4gYu1u/B9CJEiwTq27cI/CJm7
         lnPEPx7sohj+jpiuvbbzc7nMa89KgSwGxQ8d0aVLQ6VUp6u0voiFbR2HGZEmJytrGm4n
         eH+pY0njMhA34NR1LRRq22TjhdmgVixmu/e/mOFWkVVO2/I8ghlIfDciqOtqG1zApc9m
         8wzb6RQyVyXEPxX/DMkq9unYMr93uwVQcz8JEkLa8mLCCnX9w/UQUwIN/cXklvheF/xC
         zFfg==
X-Forwarded-Encrypted: i=1; AJvYcCX8/ay3vn0rRjkIVj9eRN1AZAH5175Sary4V1LmCigOz06mdwN9PfvgrFMEXrX3KEbtxe88P4sXE2cYWOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNPmHQnvuq9zBL8nbmBJgHlCMuArL1/djImtamK+uCAW1CI29C
	OK9c6DD7ZmTEHCtrYN3ubrt0kE5S4GynQ4nOJ6xFGEFDY48WjYBE4FFLjPK1+srQUnlW9QHrcWj
	ZahO4d6GgelB8kHUVHfXTIQ+IQ9GDrPuyqZ8QZtLa1aDamI61SYrwutsl9WycSdrHsDg=
X-Gm-Gg: ASbGncvg1Mj+2PHqtEiKOeJ+7qT3be7875YOvPu8GwJ5I2koJRvs1gG/Z1adkrgcdoK
	9GQLRoTbulTg2n+RbhMGZeJRa7ySpeLy99MLKZzJ0AsMGC0u+J51WNCuUWm6IyxODEVszf2/exM
	Ut5tj2yg/3vNEjLp9mTIhUuQUdTYYj1oK/QFEorusf1i6rexm4evjf1e/q2Lzpjr68sPPE2zpVi
	qHFzsFYltn34aToAHQCsIv6flTsEtTUwPro/4HpB2DiSx1QF5inU7zPsxSqIEavys809eZ13c4M
	BuQMdHMrFwYOEaosmu/Hw0i96iBt6Y0gAZhJMwskHnM7Sg8GRaPEwrU3ZoySFbSt3Jr1IuJoTLG
	BN8g=
X-Received: by 2002:a05:620a:2982:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d42973eae3mr124361085a.14.1750853330621;
        Wed, 25 Jun 2025 05:08:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3HJQWTbVAQpycWsnZAHVSDsKtE3FEka4f1RNXtv6Ih1VXbB/6c7F/YrjduVB5TAz9qzKGHQ==
X-Received: by 2002:a05:620a:2982:b0:7c3:d3a0:578d with SMTP id af79cd13be357-7d42973eae3mr124359685a.14.1750853330227;
        Wed, 25 Jun 2025 05:08:50 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b40c3950sm220037666b.141.2025.06.25.05.08.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:08:49 -0700 (PDT)
Message-ID: <b1db543e-f33e-4162-8de1-257084d282de@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:08:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] firmware: qcom: scm: take struct device as argument
 in SHM bridge enable
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
 <20250625-qcom-scm-race-v1-2-45601e1f248b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-qcom-scm-race-v1-2-45601e1f248b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OSBTYWx0ZWRfXzX2bUAsWow6f
 vy6QJlCo6ngN9Diqm6qJJi6OoBHBFEtlAK3noIZMK5q0RJqIBc8sC6hkpMnaQjEh4IN9eDTqKMM
 OvKTC8wveqax4E8b7O/T58dnAUhZwdyHgCjfb/m+IyrqrJuCdUr0tqHEJdsDoXN5E0LVjwYI6Et
 nJCQ85WvRzZDDcQf0cqttlBsXWGs89mC5O49cBUgmUA3nqny4wLNARXdCXlt+1DyEpemY2zuDxY
 w9s8/CN8gc11RqxROTdTFB1g6c8JejXkg1FIs1t/fA1JLuYHmknE8X4JRaH5loG295uUHgyIyJ3
 W5d8z6fCPPuob1s6tL1TnI6RSxgXeuByyek6LE7VyUgiw22XRLcedd4Lh2uqptOKFTKGqtwHZxr
 g1sY90kEa1U4THP/Y/bftvVtUV9rlKGAuopIcHSCUxQ4E6w+MkwES6XqKVfyQJJnMdAEyiag
X-Proofpoint-ORIG-GUID: h8jxqziPvF2_EnthnMF_J9Gvcx81Hkqx
X-Proofpoint-GUID: h8jxqziPvF2_EnthnMF_J9Gvcx81Hkqx
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685be6d4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=a_hKpt2S6j2HhseFbdwA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=845 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250089

On 6/25/25 10:14 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> qcom_scm_shm_bridge_enable() is used early in the SCM initialization
> routine. It makes an SCM call and so expects the internal __scm pointer
> in the SCM driver to be assigned. For this reason the tzmem memory pool
> is allocated *after* this pointer is assigned. However, this can lead to
> a crash if another consumer of the SCM API makes a call using the memory
> pool between the assignment of the __scm pointer and the initialization
> of the tzmem memory pool.
> 
> As qcom_scm_shm_bridge_enable() is a special case, not meant to be
> called by ordinary users, pull it into the local SCM header. Make it
> take struct device as argument. This is the device that will be used to
> make the SCM call as opposed to the global __scm pointer. This will
> allow us to move the tzmem initialization *before* the __scm assignment
> in the core SCM driver.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

I think you'll most definitely want to leave some comment about this
intertwined chain, or someone is sure to break it in the future when
doing some sort of refactoring

Konrad
