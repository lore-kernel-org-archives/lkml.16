Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A981C84D9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746203476; cv=none; b=MEvL052xD4HuuTzTp8fzvAdyksuikJ7BSns3vprSN37ukiI/pRZamjOrhzHlry91qD9QJv6fRisjNWpI6Rgyi3QkMTklhsCHu+r1DFlKWYHcpZUAfWGxMK7HRMpACDs5QS8k11pj1yTKVUFrbNrPOVZf4hljgddGrGtNhvTaBqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746203476; c=relaxed/simple;
	bh=HfhrNn6qbcYUoPHjEUu/qbSmHEO8TLmjIKVCSB/6Hz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q601y2Qf4l1FH9jyuSWTTgae+sm6t5SRLYsIAYYmw3d6mngcN67S0/GyrxhQ1AXMzYPUfrVF2oOGvLxVjbVVn8Y/TEWuivtdnBg5xDGUSlRlai6SHOGeUcv8x0gYIIUgL2l2Up9FihWSe1hkAy9mwIEJy0Y5bZk2botbwKXPPA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jr8hSbse; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jr8hSbse"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542E6VPa017555
	for <linux-kernel@vger.kernel.org>; Fri, 2 May 2025 16:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=; b=jr8hSbseZYhk5GDK
	eCuf6SvK55ZwCkZniRU+ObTIGXCxY21vMQDvrklXPN2qqZJ92AwR6bBX0SgIQF4n
	z8KOBR1XjtxADECTzZ2iCgFyaKE2RhxQ+NmqHkBk7bsdKmoGhyqNvMT8S+iUUkth
	Lvi1X6TbcqbpmFolEAMPlscvuDkOjWdE43J/4r2Vy3ipr5pVWNSFXE3z5MtDTozh
	K0kNv4CE6FjiaANQGmJa2dfEPME4O0+F+KfC2x6DrSvoSz/974P7ouYZCiqYYhMC
	ZDocXhHZS0XXFDVXijElGCc5JYh/7606Emgcy7s59j5o+zYFTLrKNIp8NMF55z8B
	gqieAw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u40t85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 16:31:14 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7369b559169so1602880b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 09:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203472; x=1746808272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtXRYG9Q5qrj8myubAvBaI3Oe8aAUXM6QH1Fw8r6toU=;
        b=wfgDOBDAv4/EkpTcofc4gQ9NxeMGkW5DkNz8CT7B5fQ/MhZXsOLFK02lYb0Bpmu7PL
         r31qjkzChdWXUy2l8teaOuAdJ74sqA/kUVenb3t5XA5KyLlAh9AeWufZzfYMmHhgaK8V
         xd17GlIr7MWBaBBzF6KcC7Ef8i3xvAvANt/HsdrPYbTrFGoz5as+FfVZ36F91sePC9ve
         nyyJKuqNE8DOmFu8YA1hHfLJRSiDouCHK2w6Px6RZ2sGVD9DoYY54zJfkIga1va1l9Ur
         LYjjqBo8aBlJmaaFkBEsFSG+A51XC/kJcU2ogIgnOf9n3TiEZbnNiNeA8adIaLPt8iXL
         CeNg==
X-Forwarded-Encrypted: i=1; AJvYcCVfo2etnor+F0gPSGGxipBL+JsY5cp4CK86+Ih3CEQLVOWi27Xjrl2lIH6KFrmlc1o6mWHm7PN17mQVgm4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4lScnv9yqNhwQXIP0VyjqINeWoLzhUVE6AAf0FHLHPhMRcm4h
	JSB9d/RdorSj4UvTN8I+BkVT95dpSIkz5LwL5h49s6uICahJ9vEfkDMoGIg3390qrjhWDF5Xhnw
	swCRfIMN8jQqLDOvLP6qPj0lZSEg2Ci1ZK1hVSF99Lbzzp1Xjh2q3BzOxPlIcxkY=
X-Gm-Gg: ASbGncvvrAtfHPhz96GKAvESOYRJNWnU4oiN9dfKMkup7GnAXUYaUud5vQ0Z5jES7CW
	AIQarxNMZx7yS3R/DKV2O8ZOh4E20ate2C9juaQRZNMV/zjz0lxZKrzQ7/1nlzVnlhQMlIbCsV2
	l/uEJ4b5WVSr2uyEgqvAnkhc2mY9oUNbc1g9rfc+aFQBDTgnGTO1QTyB2mDZ8OpeAWJP7rTW7pM
	AovLqiazL1YLVo5CjHYoCohT5zouw90diHSqGgxfmRxczERy0a2KDHagS/JX9nd/lawiUFyRcn/
	zc/aozOJmkOZym4wkmcbDG0zf04FDWmC5esFPR8qvuqkTnTSi3gT
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417117b3a.24.1746203472638;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFb54Eg6fwcaKmb+QzmXQ8iGK/9mI8N87y3T04YynY4pAo54pLrPvinNqZ/362AoLpwlYrDpQ==
X-Received: by 2002:a05:6a00:1c9d:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-74058b25d87mr5417076b3a.24.1746203472209;
        Fri, 02 May 2025 09:31:12 -0700 (PDT)
Received: from [192.168.1.4] ([122.164.87.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb804sm1839193b3a.52.2025.05.02.09.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:31:11 -0700 (PDT)
Message-ID: <c2b0b0b3-6fa9-46b8-84ef-81314965848a@oss.qualcomm.com>
Date: Fri, 2 May 2025 22:01:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] watchdog: qcom: add support to read the restart
 reason from IMEM
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, bod.linux@nxsw.ie,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
 <20250502-wdt_reset_reason-v3-4-b2dc7ace38ca@oss.qualcomm.com>
 <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <gmoe3ykmns5hmmz6hdyxgzxiejb3nycghhvt3pgjysq6xa2zni@wpqyuz2pj5vy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Bv6dwZX5 c=1 sm=1 tr=0 ts=6814f352 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=wj/iefQKNY9P1RSDfSoyGA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=sAsrsCsg_48icDTAn_UA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: RhQnlLAS3w4evDJN_OR3LY5NluKeG1rZ
X-Proofpoint-ORIG-GUID: RhQnlLAS3w4evDJN_OR3LY5NluKeG1rZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzMiBTYWx0ZWRfX/ryqHd6JgQRH xTLxq7oJIFD31QZzE2srae30YnYAaq5ChAEJdGuBrGtHKJi3fuYM8XX7/OlDe0vcYM35bYw+PmM hT7gTYe6JwujViQw0u1WEkUhUwFx0mprQszfoTjG/prSuU9wPlL5AC0Zmg7YFo1FN0hY92RNbY7
 hLWnQD+5dgISe5fi4hiZ3Y7plcUn3zQVTxNI7dzviX33E5fzUDeyBhPXn55LcdWeStG3OqJiB3Z n+AKXaZj+qYbyHLgjl77puNchwmbSu0fbMOYKbMMhx7ShhawiVFqq78NF/d7DA0CI0HdfmHiBPf Z86m8IE3xlhJh/hf7xQ6Ko+qeJYwS68ngrBtHvGEvSpItPp+Iaf29gqAB0UBGkGWx+z/QS4TMpE
 vf/XHnuKXNlz653ZR0Ibnjb2agVUG6UBAa9e+36znKbmQCl+0ismPxOa93q0Aa3A/rGQc7i0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 mlxlogscore=874 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020132


On 5/2/2025 8:24 PM, Dmitry Baryshkov wrote:
>> +static int  qcom_wdt_get_restart_reason(struct qcom_wdt *wdt,
>> +					const struct qcom_wdt_match_data *data)
>> +{
>> +	struct regmap *imem;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	imem = syscon_regmap_lookup_by_compatible(data->imem_compatible);
>> +	if (IS_ERR(imem))
>> +		return PTR_ERR(imem);
> Why? Just pass the syscon directly via DT.


Ack. As replied to Konrad, will rework this.

