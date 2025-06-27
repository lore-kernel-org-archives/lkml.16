Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFA3F4ED
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750984995; cv=none; b=jytPT4uF9mWa7ZnJf6UcR+NyPiBiFIdg8MNmya65DMGI+TIMqvoVS0LqWvjho+zpcKbZvfQWZV+z6nXjJFj/T7bJNBd5Mf7l6EAHcnLjVkukpsNJnukVXjXj6nDy6I82p+ynSXQZ3OqFSQ5t1hPXQHkkV2Lok/fxgFrUyLwMXMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750984995; c=relaxed/simple;
	bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dieUluMWotY+FWndcpXg0SE7obXX9cclh+NtTgA49CI4VhYK6HibBu9NaDoYCRRoI8S5KCabQT5IGLKSb2N08HonlY18iBawaK3DXrBYq/2DY+X1WaoSsP3qeWXBY7Px0EMOL+sOMdUHzyUAGR2k/VVnnGmr9w11YZyNKzkA6D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IToItY4L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IToItY4L"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ384o002583
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=; b=IToItY4Lwzj1s6Kt
	h/IhEoakhEmsSH2F4muogJbU0iEA2QIZSJp4GFYOzx28PULeMwbikjBBDbFQlxOn
	WBd4xhB75QgL4tZtiZo+aXu33HyMrhIX//51Aq7Y5T5N1uxDMndsTsxrYnNY6qie
	IDb+isz4IXvJGZj53FlmEQzj6dqSCpuJ0+BugBN6X5EuXejtbN+UBjr9+KejVkGc
	T2kM2iU9h61Ca2fUpSvYPUHhNJISa2D6LYcNaGLoLqphqT3Mnv0xFAZdNJPzdD0X
	ks0t4jP746Z0nN3jltcYMqtI8C/xxWJHxwx2B7Z39htoJIrcgfIKcqb4Rk1VXnYM
	HTSeuw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmxrg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:43:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a5ae436badso3111901cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:43:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750984991; x=1751589791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RxhgcxNVID0sgf/oC6xERaF2gkjuquriALvaig0OY0A=;
        b=Rh98DBpifnrPjr47iJcvRGmc3r/EmyOiXuJf/n4c2QFI41xQNwY81q4yBxW2uduZXL
         ldxsMQgZ7sDTRD6+f+7COxVIo1ZKga6Nber6TXTXBlrFnocFKJcJU4cOZquoZh6Xggxt
         A1DEKkY8Zd/9LsuAnss5CNn8syj0TpYQRjC1W7FKn0qslLjxBLVpEzR4R4XUTCofW+qq
         ZTGTT/uNDrZfsY/Jz3kq6uZrJ1K/jNY9XkPW3kqY34BjfGvmvxhwP1eESlR9RTjRPDvX
         XbWUsZeekIEs5IytJ7jtdTRaEr+cPcWSnu+u5cOpelqRwpA55A3nVKi444oCCZAYFcHy
         VLHg==
X-Forwarded-Encrypted: i=1; AJvYcCVcjQBT1GzqS0H3+gX/fOM/2UK3OFaU5Kc2FZulsWhcAsxcpdKerjpWTiqzvVCcPcFCOf5xG1llK6k6FoE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5OepcdUrlJ/U+VdEnItL22Jph3pGRGhU87NHKN+g3ydu1f/WN
	bFPgznjSpbcY48oz0WKavT8xKsKcORriJ7L3KmSaoVjParhrtL7DEKFwz4yX66puzfhTdkesyz7
	ikYLW8ewnrs1oM5V19VEZK8BCE2tOVRkS7JBDHNX5Fw+/4boN3STqQVt7+L//hPeu397nRh1K3G
	M=
X-Gm-Gg: ASbGncvO8u8mUEJ/lbMNeyzsNp5Suy4NAdEOzS6V+JAZH/ROV3/e8fkpFxZqvpYAWpg
	05ji27js+lKY18qN/xlt3NxyPeXsDa/O+OzWBhWJcv0qcrlavaCwo/6QDmeXtmBjuyLyP5k0tDr
	dt7D5kp9rNIwv632LEji3owG8uLsQh7GVHATQtVMC1ppVKdMYsh1AS+JtoVkvd7J4NrgGz4Ccxw
	a+YDvYpPniFatywQHeA2Z/PYzq1gcXsVe8nexK29PPSuOdk401+V4/oTPw6dQ2LoB/Ks5GGTGHH
	KiJgPzh9Tv1/bjzQ7SqEjxhig+D0aR97gtkyV4Ht770FXkbxdjwfWmqWo9CpSZt6DoOrbqT08W0
	iAS8=
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320551cf.7.1750984990730;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKNXI92cpFXVO0lV4wZlSgkD56FesYlOoMlNbr8h9q8T2Ti999UIq92tdwTKqeE/60aWjs2g==
X-Received: by 2002:a05:622a:414:b0:4a4:35f2:a02d with SMTP id d75a77b69052e-4a7fcaae8b6mr11320421cf.7.1750984990209;
        Thu, 26 Jun 2025 17:43:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b35dsm24433866b.13.2025.06.26.17.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 17:43:09 -0700 (PDT)
Message-ID: <0975cd75-2363-44b9-8ae8-b2430799ab78@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 02:43:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove extraneous -supply postfix on
 supply names
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        vladimir.zapolskiy@linaro.org
References: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250626012433.261328-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IRMuK3ITXnyuGAynJMf3TujmP1-Waoln
X-Proofpoint-ORIG-GUID: IRMuK3ITXnyuGAynJMf3TujmP1-Waoln
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685de920 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=OGg3twXR7MAiZJUF5pEA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDAwNCBTYWx0ZWRfXxgVsvmdx5PXI
 XLFF9MXXpD2SL8+5yPxpocCbC34QOPW62EmUSZYIhBJSoqpPyxDGdAmGRGefFbD5BuwUpBhUCJQ
 faRGT0cIb/yQNyBgymuN312hNjhK+rqkEegyc5T0/WEDxVdG3OWWsUm2/yLgdDdJJqPyksFQ0W0
 9kvVvbbNSOxecMdfF1/GXLVFk83XY5FAw/BQxyMqSMGgt+2AgFAJqCV9t3E6odcg2Lm/oKxqBuL
 XeYxMGnmOkLSPv5mzBFiqzVcz56Bh61cpEdmkauiaygK7HnJsYo8WWk7FJebNGM9LAxN63iBM61
 QcPGB1rp+WEgRMOVoFgiJUNR3lzAghwJKT9C/mnHDJ3c7tqX77u0CnF2cx3kVSwvE/+hab6/LEL
 tms+FXcg81761B8KGnmp3xevB5+ixqkWmpFiUhoVF+WgbgCXdM9L6G9nsxd2ceU9HlGT7gCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=740 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270004

On 6/26/25 3:24 AM, Bryan O'Donoghue wrote:
> The -supply postfix is wrong but wasn't noticed on the CRD devices or
> indeed the Dell devices, however on Lenovo devices the error comes up.

Please give the commit message another shot, perhaps with "PM" in the
commit date above ;)

For the code:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
