Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586501A83F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416325; cv=none; b=a/6XFRnCA/utF8YjR1z/mSRnlRwfSj3jjweeud+N0fkUybISd4mt9pm87VHfg2KjNla/gWAfny6cLYw04V9IU6PLfejMxGRi7gg5Q+koEwzlI3FhBIYpR3kgJhvRMP7Ju0oO3VwXuTTAGl059MlWNnItMc2mfZmJ77pY3he2zCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416325; c=relaxed/simple;
	bh=0bAnqI40qy76MCtFlvAvA88DQRF63SAr4EXXQFTXYnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQiHBhOE+Be9lSZYzTmNmKTucBt+Ns+n0lDi4HyKcvlyzIXYgoZgIX+z5xmJa02FzKx2ZeSQyS9qt7SUqhg4HWg09OYFEWcwfnJMVN35yVOgkL9M0n6ePhmNRXI/7BXIaF1fBRYcUltKagbQY+WlwBbbXlDUFc2TBaUtdWo/K6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7yFIYaR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7yFIYaR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApTs8014265
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkJf7kOWyPXE/bAYrd0wNfurykT7yQdN5XAbkQzQbAM=; b=I7yFIYaRltaS8kba
	rOOsTY8k9by6Ol4ONAO4ulcraS94HwCoOHibcZi+u2y1+RgDu15tNcWY9qWPOtgL
	mmftD44RzR7+KquS39u6NqtItkeEY8Fo8UGRujXjYkvlIgjUW3FkF3cmVJMNv5d5
	6uoiGH4/gE4IdU1ejhBdvTTLwT2gg8a1sQ16uq2D4Mbb60UOweGfzrltX5y0ODyI
	vH71BzVnj21YzCaawcVXm3P3J9xuUZIY9LcPEizXnqaBJbi/QJgBUdyYRGevq03S
	HHTIqmft6gzee6h/CTtOUToosGmZV41CPtPLykb3nSjf70r6HMAkaH7YJy/cgbKJ
	irhe1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a9pt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:52:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c544d2c34fso870506985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745416322; x=1746021122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkJf7kOWyPXE/bAYrd0wNfurykT7yQdN5XAbkQzQbAM=;
        b=nbkCZmdV/nK6FYu5x9m5r/qaS18lOwSIHBlzF9z0cqNG3v8hZtLkusM/3DrBOBiYgb
         BwUa+JkcptYLPhwOt9ZmXh1qFuyF3tun14Yp/NT79Di1FjdakkpDrs4hrdSkGycunJ7w
         ANIjotQiLRTarY/CfizWkvyXUov1uU9ypa+zn9ukzatyK1/MDWInt3+jD33NkSX1UQm5
         rNOESSv4UeHQevdcoM2Km/u6sbi73TGhpe9Nlca3ep5cGsNgNIb8TyBFMro6dfNwLZ6S
         1+N1NjSTyBA6RMXYLL+uOO0bVgjRQtpeNG+EPjj0UwQysvBYGqW3tXqDSOTQArmkhaia
         G+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCX898y6glDQJm+PITgIuTJ0pC6GyzcWtVNER4VzVBz80Mwnoz9f1V8ZEdw0gSkBNR6T9ixZzp/T1xXW12E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUQZFHe5EDWQPR6vLocdxbSuNfN5vHNtDsZV7hxwwIS+YKYBl
	puvJb4e8UOihsLv7TMEez36EL30U85Mx+/MU3bwkLsoo1WUx5jjBltcz15DkoYOR7z1UxaDVDWo
	0UpNekGgFs22uqUOp+pR9Vfle7voMfu7HWOTmHgkbJK2DopbqqXdwlO1kN3fUs2k=
X-Gm-Gg: ASbGncuoSQElK8cacMb30tWSmfIQiV9RO40V3CeybBH5Lj6Lb3MifCqqtr15/KeWWNu
	yQo9jbsMJyWKh9UErx7hjlddDelRKG5dGM8LINYj1Uohr75LhcNG5pYEuceGCZ87WJIJy+Ymfh5
	bIwBzl2vFaWwCdwHRqAvy7czRaUMz1fhwiodXnspcnaMs8WsoUF7PkMKchzB1VMQjgoMlA1eMZq
	tYnlO7hXtxryeRwGH+fZ5EwRa4ea8YvsQ0MVEgG4panqJdPX42goKRRh4ZwokwMtmTClKiGAsZE
	f8xkCelHLYel2P7zMNqLc+0yLI8R3Ys09pyiDA76xLsNfFmHcN4sEKi6EdT5td0HPmxyvM4jvtC
	TYfvDowdYl7swAA8yA8M+PvfwvQhrQfyi4yBNL0sjgMXaK4DAc6R6zkGE77o3am7Q
X-Received: by 2002:a05:620a:248d:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c927f6b2b9mr3017557385a.12.1745416322118;
        Wed, 23 Apr 2025 06:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrD8GKWDiajlXtRlhCqQokXaChDX0L7FWqOCEuiK4S46NfWfbpwHzSXWRpOSxjfqEHecTieg==
X-Received: by 2002:a05:620a:248d:b0:7c5:43c2:a8f4 with SMTP id af79cd13be357-7c927f6b2b9mr3017555185a.12.1745416321797;
        Wed, 23 Apr 2025 06:52:01 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ce:6a0b:adf3:3f29:4dd7:6598? (2001-14bb-ce-6a0b-adf3-3f29-4dd7-6598.rev.dnainternet.fi. [2001:14bb:ce:6a0b:adf3:3f29:4dd7:6598])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907a8416sm18673731fa.63.2025.04.23.06.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 06:52:01 -0700 (PDT)
Message-ID: <7ff824d9-5d86-4d63-a8da-5d94cc489ee6@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 16:51:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/9] phy: qcom-qmp-ufs: Refactor UFS PHY reset
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        quic_rdwivedi@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-5-quic_nitirawa@quicinc.com>
 <pur4y63xhfmqlyymg4pehk37ry4gg22h24zceoqjbsxp3hj4yf@4kptase3c4qp>
 <317faeaa-3130-4e28-8c5d-441a76aa79b4@quicinc.com>
 <CAO9ioeXnnbNzriVOYPUeBiWdrPfYUcMk+pVWYv0vZpJbFeByoQ@mail.gmail.com>
 <1adda022-b5d2-43e0-8cf1-de8e72544689@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1adda022-b5d2-43e0-8cf1-de8e72544689@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NiBTYWx0ZWRfX90KRCdvZ/L40 UxbP+s2OBxllWm/eMhdb/PE7Yatara51vpCC8TyPyOvUjMsKQVDeg/iygK/SCDRVQn5ECea1fbc aVUamHLnlbYT5UUZ7UkJGZtShnZR2RgoSagevOdNvr3jywUuqDpvt6NjCW0c90fIlDgJaD/sZbJ
 OhBr/r/Tn74Ju0i+8Uoq4IdB3QMHQZFVA4B/jGKiJUkAxVIIWOKEzoSh8txU+rFcRX8q1oaYohA 8r/4Z3zD6d5Tt/KtA6+xVJOmeub1XK/FMzQ9RRNWPzCpWMRpPTY5tI6yhqKamF2ZXpI082CjLsZ MfG87XTzfd1z6zN2PaXHb4IRn4fgjvnjwpY3UuoaVfw6bKJ8StOjqgMrcSWh3YVf4J9cu+cNJHt
 U40lPPfRu+0FavyeVXZ/zNvjfgivoWdxdDN30VIOHmCFtGq5aiofv0UEnhqbU3y/JFR0t3mK
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=6808f083 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=m2W-dpWsrdQmR1pkfZIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NGQo5ijiswh6Gd7ye42Y0wr7p15tU0ri
X-Proofpoint-GUID: NGQo5ijiswh6Gd7ye42Y0wr7p15tU0ri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230096

On 23/04/2025 16:47, Konrad Dybcio wrote:
> On 4/11/25 1:08 PM, Dmitry Baryshkov wrote:
>> On Fri, 11 Apr 2025 at 13:50, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 4/11/2025 1:38 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 10, 2025 at 02:30:57PM +0530, Nitin Rawat wrote:
>>>>> Refactor the UFS PHY reset handling to parse the reset logic only once
>>>>> during probe, instead of every resume.
>>>>>
>>>>> Move the UFS PHY reset parsing logic from qmp_phy_power_on to
>>>>> qmp_ufs_probe to avoid unnecessary parsing during resume.
>>>>
>>>> How did you solve the circular dependency issue being noted below?
>>>
>>> Hi Dmitry,
>>> As part of my patch, I moved the parsing logic from qmp_phy_power_on to
>>> qmp_ufs_probe to avoid unnecessary parsing during resume. I'm uncertain
>>> about the circular dependency issue and whether if it still exists.
>>
>> It surely does. The reset controller is registered in the beginning of
>> ufs_qcom_init() and the PHY is acquired only a few lines below. It
>> creates a very small window for PHY driver to probe.
>> Which means, NAK, this patch doesn't look acceptable.
> 
> devlink? EPROBE_DEFER? is this really an issue?

Yes, it is. No, devlink won't help.


-- 
With best wishes
Dmitry
