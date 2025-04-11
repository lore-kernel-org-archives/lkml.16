Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CC02367B1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744376192; cv=none; b=NQRtJQWuF+e516pMooGWIo6wRlfvpwhonmdViLzWOlq61oTmpIeTBbFp4ZmQkZf3nBYWjaOTQ4MJeTS71uyvsPiEfA9/UNiAEcE91qE0Fo3Xd/tSvg+u9v+yr0DFhJK0ZGjg2KeY0/JsjM8D+Tlrm25cGdzKMqs0Jcogwn3BBow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744376192; c=relaxed/simple;
	bh=Sfy8MjMMU+57mHRwvKz65SKNaOSwioFjv8LNdhjshMQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW/VmnfDLRKCV13Y6WmrE6i9O8ieqW0XcbjM3CIPSaMP+yNz5S/ShkfiT1mjOlVcuianOsvvyF1gfwXHAzr2Eey4kfS2EjCCYNfZufTrUCsLfk8fjXUaxj2N1kDnJjgD9Q/k4DnaLi9XGVaHyn4wJ4kaDaMMgjHjoiVFd0V9AIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iARYEuE1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iARYEuE1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5SkfL000667
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMvxg5D4cmEiDoMOwRUc1Nn+M/99Mlhq5+0RDjA73no=; b=iARYEuE1NWygdwH6
	UKWKY3z7djZ5qarxVEM3NZg7vw7a8PUC5MIF4rrs21Ati++mdCQwhhBTa1eO/A6+
	uHp8Yl9cEUqwqlVoNRWEvh2PllK2DSr0Y99jz5tijGKGR/E+lINvDOldn/8+PaNA
	72Lo57tzAUyRTfQGAwEe3NB+RKDK4CWjFwxPTSwCXKz2hzvcklVjU8C15GAQgPv6
	7BDkBlSGn2lsDYp3AjujfQFjh3QrGvUQic4EwrbVuv3a2ZdwDZiGp8OtUugnZXoS
	/BHJvudYAlREQzTpYfCCtgl+ozuAT0HGM3cBpfRFSDB+1jG0wM4PTCwNVJdMXj/i
	3KjKxg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd32ddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:56:29 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-73720b253fcso1574435b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744376188; x=1744980988;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CMvxg5D4cmEiDoMOwRUc1Nn+M/99Mlhq5+0RDjA73no=;
        b=HmvOjfGW4qo9cerpN/SxTZ2QGS5jehvxwRgj1gz37Cok3WnhWUdZI2SqEeDgbUViE9
         0PJ0SMn8egBfgIytHaaO8rYOgp61aYlNVfr6FAGXXpR/9rBYFaaUrv9n2eNkNA43Y2/2
         /xXwIQUMZTylYP0G+xMqNOYx4YQNt7ci8knwsre+fiXKkvnrHvJNKTcH+Z9HU5rCJb9V
         VK0QOg9JHUwBIEgGatLO84EFkYKb6E9JbIny/ly1jbBNqK26sQaTMFR5PEbiCINOE0dQ
         h5gJHD7SUUncT0W2QJkSDZWslkJTm+1OmMdq1BrMTH15cxlxU+IyAYSy5nFktNM0zMWC
         diOw==
X-Forwarded-Encrypted: i=1; AJvYcCUXBqoKTFxBHaVH0pXzZ6X461V3Bj25oYLKcBob/sxO3rE8EBVtxtS19/4nAp7gB9ZpLu507uZzWQ1/b40=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpUd8u2wDdUtW0Wb43YTTQ25vRyf5lYdhji9c2t0ZRLTeORnM
	Nq4vpNnJxe9o37KMHGFlLWU74VKYVTcQvMkKvPG67sZ6ZW6SxJldyBqBXD1wPsZqW1WXcszjJJA
	Gnj7kw+5mW9BhSkWLxJEimRO0Wi94CCNyhywlui0juEHXwhZHmYb30q/p+/ErkUvWOgWxXps=
X-Gm-Gg: ASbGncusbkmLLnJOWTswlr6fANBdffec31xI6db1RUZyIKkU1qE8JdZBHdPYLPpqatn
	FAUcQbzWJoTwpyYGb40M7gARRe2ejA/ixZQm/dF8R/xVLzkLbyJrm8FH3+dAesGXs6EiaD9MQmY
	Wm6Ocsjkpkqk4aGzWI9CM6DnydF4Xl8MXqAtzAn/CyOuEXwOnmGM3Y0orrGbdWu+9jCFkc1+xTf
	FzVwjp6ioBBA53riTildk7Zwt4wCUR4U53Exwfdt/x6eLssaVRMxZxt5BuKTr+vxbHsrU2N9Uaa
	lr/qK+DFyTRRuughUawi9Rk9SCHNzgZ8pzx7Js7m2DY5ubiojUXp
X-Received: by 2002:a05:6a21:3281:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-20179787801mr4522241637.8.1744376188252;
        Fri, 11 Apr 2025 05:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzqIKT2YA5sP6Tn3NINcpTsJ5x6Bui+ZmBQb0oUO6uDlCc9CZJV9wpDBiw/Mrmpl1rkjrz5A==
X-Received: by 2002:a05:6a21:3281:b0:1f5:889c:3cdb with SMTP id adf61e73a8af0-20179787801mr4522201637.8.1744376187801;
        Fri, 11 Apr 2025 05:56:27 -0700 (PDT)
Received: from [192.168.1.2] ([122.164.81.245])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0cf374asm4611147a12.26.2025.04.11.05.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:56:27 -0700 (PDT)
Message-ID: <74c9c5c2-6195-4c32-ad34-a3889de0ea53@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 18:26:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: qcom-qusb2: Update the phy settings for IPQ5424
Content-Language: en-US
To: Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com>
 <Z/i+6k6VseihdQ69@vaman>
 <734cf70a-1d96-4a87-bc7e-c070c1e7dc8c@oss.qualcomm.com>
 <Z/j+fs6hCVhGKLcH@vaman>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <Z/j+fs6hCVhGKLcH@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BeIbTTRUaETaEj7f2mlfHhFwuV74I_qt
X-Proofpoint-GUID: BeIbTTRUaETaEj7f2mlfHhFwuV74I_qt
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f9117d cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=uB/6cedsP4G8bgUXdgZ7XA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=rZc7fG3luCRD_x8UD3oA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=882 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110083


On 4/11/2025 5:05 PM, Vinod Koul wrote:
> On 11-04-25, 14:29, Kathiravan Thirumoorthy wrote:
>> On 4/11/2025 12:34 PM, Vinod Koul wrote:
>>> On 07-04-25, 19:51, Kathiravan Thirumoorthy wrote:
>>>> Update the phy settings for IPQ5424 to meet compliance requirements.
>>> Can you specify which requirements are these?
>> The eye diagram (Host High-speed Signal Quality) tests are failed with the
>> current settings. So design team asked to revert.
> That would be good to mention in changelog.. am sure you wont recall 6
> months down the line, which requirement this triggered the change!


Sure, let me mention in the commit message. And yes, as of now, all the 
compliance requirements are met.


>
>>>> The current settings do not meet the requirements, and the design team
>>>> has requested to use the settings used for IPQ6018.
>>>>
>>>> Revert the commit 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for
>>>> IPQ5424") and reuse the IPQ6018 settings.
>>> Why not do revert first and then add the settings?
>>
>> I thought of submitting it separately. But what-if only the first patch
>> merged and second one didn't due to some issue, it will break the USB
>> feature. So, I thought it would be better to keep it in single commit.
>> Please let me know, I can send V2 with 2 patches with the merging strategy
>> (both patches should go together to avoid the USB breakage) in cover letter.
> Series is applied together and you can mention the dependency on cover
> letter

Sure, will send V2 accordingly.

