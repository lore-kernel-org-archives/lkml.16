Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9661E3772
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749103731; cv=none; b=uhrMGNDomEnEVzcGm5o/vgWrd9zgjvpE/3ZjiEOe9wP7TzvBFeWZTZfwo4MDp86ClAI5KUlnr4ucb+pRh0fopvNqzxGbq5ixucudwL23VjrXM14u5X4EjOkLQ7tHMWIpJwMymrzGARxUNLudx98g4PbtBCjJ7M3mF8PcXZQinNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749103731; c=relaxed/simple;
	bh=obxsLj+ybBp5DKxbHvEzq7j6OJDIdAWkKYrH0UW56Ek=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IZq5ER31xcHqU1xrCkRRbx1wj0B/NHxAecs7sfHd1fWfFY3v3XuylLkmyRS8Zc9FsGWzOWLo6HERfE7D45sfOPHPRwDD5EjSN2vKWY/igDUwsVLnfIvOCzPBdlPlSCvdw4fU6UaxXkQltq4ts9c5OxYRtiqZP3X+f/nzuEsE1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdpBg1Eg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdpBg1Eg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554GZWEB006669
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 06:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=; b=HdpBg1EgCCkGTopG
	1I6U3YnyLIXjqCHAHCBALdMKIhi8SopUDmIeIrQRUDIlNqP9gNDdxrqobDV/RjWW
	GXlFKNG5UzrcO53a99nd2WxgUG29iPXdcEyyvmSziUAWk5M4GEzWi9xR8GIvWNU7
	8t0I85Jp6GxzSkFaOFBV9kmZM7YMhNAVArJQceNfI1mwv65iqGNgWKaGkkKJJSx8
	9VbwXsa6txAajJXK5xxvdm7wZ1qckie+8Y8bNIEeMOpy936Aureydwovn0fA158j
	7syJ8SvibACynGseQowcg3acKMUPn2mIU7jTMIdcz1Gb8EUIjN3viw4J5ONyTSeB
	0uAFmA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t09sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:08:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-742a969a4d0so650819b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749103715; x=1749708515;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yuUom1uLViLFA95wFkHWrXsNJPx+f0un14vZ3UUQFxc=;
        b=D77UUdllA3C1BrW9FRf/Qis7D1DhiMCvuf2Bmbrh4cJXMw17Gvj5IXB1qdUifzfNL+
         v+kU8UlFOQU6zxdFUv4vgpr6ITUN/4sCCUyJQkckIpbA2PdoBknI5hQiQ/wsYTp50pId
         uNNcB7Gufhjz0da27x3afDlpA/gNmVDCuE0bOUSVQSD8d1Oc5h02BvTiQO63lprDNYkj
         7CPHt4bGeuradsQ2japcIh0wWgEnLUvSvq3SwXwn6CA83zTa7BVhMKeyOGQoVejmYJNp
         vy3xxThK0JVPNDASlEER7AJMgSxu+gldIRLmbeFHpOZBCZMtiotTUMRF5wC3Dchcqv1j
         4cww==
X-Forwarded-Encrypted: i=1; AJvYcCXaf57Gc3bwMgOJ40LX4B80KETisbwLtvBYv46KiTNBT+Pm2BgX8ndxqP0baYB2F+MeXn0J6vcDIudzFYk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9hjzzehTABnW3233wF0mg2YKP/LY4gV1M7YVR1LK8NDD1oRu
	DrkzHdmoSZ+eJMT2YpS/iI6nsKEz4LwVd5qc83LWbIrqVuGDVv3UF0MqBzbGSEWwJVX1iIdVNCU
	Zlpoe0zX8/+WmM//xJyk7UJGplItvEV3ZWNEdSA1BaDyo5khGu4wFc/E6wqfrNwzEgiA=
X-Gm-Gg: ASbGncsVu+K55uoQskaLvaorJ34YoH3XMYgdheoVTfMzGUVxV3CaIOuQIYxmc6mrRQI
	lL8CrLbEgHyF7A8FBPXL1JepPkiOGEva8KPLXxNuq9QRQWLQYnnrKmcoYwWE7B5FykHeWNv+CTR
	J731+VBfqgp+t1w+JqYb3tz98UKjTjzNONkqQvQa+lSgSK2XPTu0DO8GARLgMsRRZOAwKa2vg1s
	veD9kT2G8qH8LncVKL96neDpwCChvmW5V4PGRbDSAWVQWUwQgRpiG3az8i+DQrxpYEKnVbpXBdK
	4WmtoIh+sUfXp5/ig68VXXuoQ7U9eF8ToFyNMaAqfaEFukdA/wEV1/ng3x4/+Fpc3zk1r8JT3Pf
	N
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791386637.4.1749103714906;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEu82MVDHVKpp8Ta6NIo45ITXBkJKjQdLSDIXVXjZuHMYFztmtVjRfZs6jpP6ebX+etviRsgA==
X-Received: by 2002:a05:6a21:3282:b0:204:4573:d853 with SMTP id adf61e73a8af0-21d22bcbc4cmr7791349637.4.1749103714526;
        Wed, 04 Jun 2025 23:08:34 -0700 (PDT)
Received: from [10.133.33.140] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affafa64sm12497732b3a.93.2025.06.04.23.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 23:08:33 -0700 (PDT)
Message-ID: <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 14:08:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Language: en-US
In-Reply-To: <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZZRF_9D-C2kBxjlKo7Wu_zn9T1VFn1sI
X-Authority-Analysis: v=2.4 cv=EPcG00ZC c=1 sm=1 tr=0 ts=68413470 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ocYFPldkPzyi_qN8VkkA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: ZZRF_9D-C2kBxjlKo7Wu_zn9T1VFn1sI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA1MyBTYWx0ZWRfX+tKqzILu6Y6M
 UbTGOwGc4HsYfI3bo81cZg8cHWFknzYysph/fjMivgXYS0nQlR5xzOfH4waZpEIHwW50h9a5Ywv
 kR6NxCqIGjPBMgrBsl3Kq2pv7ecClnJFqgFcNjiGFM+KrlHZ3lcWHAn2v18fQZ71Rs6JzTeTaE+
 BA5cU11wYxSwqC+XwufkpnqZ16etlqjyqZNiynpR0hKiWDPyD76TNKLnSFOMbQ8mkf7GfOLF/RF
 2zmUsaRD8zBAoxYoyyysPhp0Ztdi8OMF8Iz33Crtrnrji/s5pL80UYkbqfcjoNj+SNPDl1nOv4h
 LniYi/0EU4voxI3zdXRfC9Qkv1fqc268YLguGCxrc0FTtIpklr96BeHFfkSUv7ld+N/ggrBk2IY
 76qj+nbXCh43fPbW6HQf/TZKLHC4kf1VQEAbPgDPBVgmATTsUqaLGF2aOfKwlm1W7F5x7cq7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050053


On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
>>>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>>>> +Date:		May 2025
>>>> +Contact:	linux-arm-msm@vger.kernel.org
>>>> +Description:
>>>> +		Reports battery power supply state of health in percentage.
>>>> +
>>>> +		Access: Read
>>>> +
>>>> +		Valid values: 0 - 100 (percent)
>>> What does it mean that battery has 77% of health?
>> I will update this to explain it better:
>>
>> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
> Which basically means that we don't need it in the first place, as we
> can read capacity_full and capacity_full_design (or energy_full /
> energy_full_design) and divide one onto another.

Hmm, it is true in general to quantify how the battery performance has 
degraded over time. However, estimating and calculating for battery 
state of health is much more complicated I think. I am not an expert, 
but as far as I know, different battery management systems might have 
different algorithms to calculate the battery health and report it in as 
percentage. For example, in Qcom battery management firmware, a "soh" 
parameter is provided as the battery health percentage based on the 
real-time calculations from learning capacity, resistance estimation, etc.
