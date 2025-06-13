Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F0239E6F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843699; cv=none; b=H69hgXiDTVqpT5wsqOTNzGNxKPt7HhQ2EZ0v00Gu/IAEBsE70n+bxjO6EXegxY4ioe/LtkUFuv8nXaTs8bUpjFkypU/Zg6oirsRTNHUS5zEYPBqY+MnCBn4vm+nMzmZapl47lEG04Il23Ga/QUlzXU3p+rPgMIc8sHMxR1aiXcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843699; c=relaxed/simple;
	bh=VHGNStfXRS7au1gMiH2Dbzhwuas9kiqaBcefG/Usvaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mZsyjTTYxv4O6QFfgkdCJrJMUU0USV12pGV+guJ3NtEfu3KpUuyI5hiqTr0xnK4qn83Uxhh/jyz+LtBwHoI1+fsYTbWPhHkAEWIKu8eFrfDT5FwrtA9dE3mImjxBZ6X6g6jZC8ac21USPyzxXzlf2ZIeb8IOuaqoZyD2X+4CNIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=osObhhsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="osObhhsf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D9rpGE027368
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZdJ0wBY5oGK3A+eYa6OTWVtKRBxZmcf1tbSrTCxgbVE=; b=osObhhsf09hBoxim
	9EwUrts4sfOzbxwoMafQiQzdq3uY353WwpXwLz7rYvL3RgLEgnxcdfi37h+BEetl
	VzlVdJg7IFWWkiinKnFhiztUHTWh8JNm1CQWxcbPYSFBGpUSLrhuOXXY8gEStNuu
	WQGi4zoxbbCbQYueqfmD8Itwl3D1OXmYoiFY13wKMCTTKosOoXz0RmY7DMASJ59K
	AMagNdKPgXF0AL6a7437jV2cj3rZdeA4X2/GCPLMWtszmrNbudD1hcKmJohS4o7d
	C84oUYZIEf/dyjYqrFD0BKOutgxLpKDO41mZAcPEwdcheu8xK6ogqB/N/Doqj8zX
	cMfoNw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhk7ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:41:36 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fafc0e703aso3369406d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843696; x=1750448496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdJ0wBY5oGK3A+eYa6OTWVtKRBxZmcf1tbSrTCxgbVE=;
        b=D9YaqxDH6ufozAqQYsA7ZSNhMIVcGbtzEw7aj3J2MlmqbmPsyzaNRJz/uJFfox8X3T
         zilw50PSNAaCUggnXqF/LdZOlB04F1ZVy5HDBOWQbpB4n9fBm/I3AzcGU0yu56ATyN2U
         wuRaVXplMQ0UGwORiUMtD+FvLJ3JX5JC47b8oaYyfZXKlrGMZaByBD7jKPU5ZNGnM9id
         6OLqgeYG1yQPTbrsjd+hwWeeATL5HpWIhWaE2ZJ1sfdahjL4cTz3pjzdhORaS38E7w5K
         ICua5UJHz7jyNhaQQ6Obhrh1/JVVJdCY4ZlFvMFr+wQ6J+xMNjHVl3Mg3p0En/o7lFCP
         72hg==
X-Forwarded-Encrypted: i=1; AJvYcCUXtkH2aCep5tlT2B81BxIR7FaPu59/Y8OZXVFuBEzvBH7n+ED7uvUaUGj1Cu6q80pJ6mvnp8QHD4sBDzY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5QPWPaGtttJZfIxYwtwiltFlbO+rgVyj8htTUVSK6CybwJSM2
	xLzLbv4HExIFDlfJBVyaZNu8IiwFeuf7ZYPIg6UevQ4dtR1tddD33c3WEm9kxje/ZhWQrI52E0u
	VjzloOvJ50Nr/KR+tKOLQmZkTcQeFCRjYIcAWbpHIlwR6Jb0khlJQRW0U+/ypqtk/WXw=
X-Gm-Gg: ASbGncvYgRlCw37cMpEHsn7C1OY2x5juQwBU74aAQghYrZFs7FlNDMW3WE3wsRJ79QA
	rdi3TfuMA/iIEGaG4tffGqkLQy37BsZggZHBMBpN5Zf4dFw9R7iu024fu+eH1A0RtdoKpq8CZ+l
	w/Rd3LTG6z7Ia2REkx1uj2d2US3QvB/GIvezgxedCsCWY6o2Pzv/WrToHW9DDkJPpc8w/RWis5M
	RuuDLVv9PnU/6XwMqYchap1/UaBRX/BC72jRsGFwgiFsA49FAD2rE+ygfP+dngaK9NGxzPqBG8s
	0vl4JP7VvbQK5W1ehrXGO5iPMLntWp1hBIcv6REAh6m1xJCvZ8hEQTZpqInEgkDWNO7GII9QwsV
	p5d8=
X-Received: by 2002:a05:6214:d02:b0:6fa:bb44:fdd3 with SMTP id 6a1803df08f44-6fb477cbd0amr3159376d6.7.1749843696178;
        Fri, 13 Jun 2025 12:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2uRPMoMDmeHgp85rukBQT58kw9wJmx4qV1auWs1/Sz8fmI9/qjVlmri+yElgGOC2BQuIm2A==
X-Received: by 2002:a05:6214:d02:b0:6fa:bb44:fdd3 with SMTP id 6a1803df08f44-6fb477cbd0amr3159226d6.7.1749843695811;
        Fri, 13 Jun 2025 12:41:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159e54sm177372266b.12.2025.06.13.12.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:41:35 -0700 (PDT)
Message-ID: <6bd88bc5-c1b4-4ae9-b631-93b208e9862f@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:41:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: pm8921: add vibrator device node
To: Shinjo Park <peremen@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613194004.19390-1-peremen@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613194004.19390-1-peremen@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684c7ef0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=qUHfeBcuc-EptDy5CXEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: zNrULjNd_VVPYplvynEJBt10gahXl494
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNiBTYWx0ZWRfX9LcD0cs9K/W5
 hJOb2Ifp/4r/ZiKIFai4jtPBcNPm0LgL5TwpYhGAJIiSZ/NfKXGBTYrVwsyAfa3FxNoVbWW5u/E
 59mGwKRRCBpJRomHW8diEsQU3gALvLNLjp/vzQqWuW9QuVgSPVtQX2Y8c4et1qkNjfRU7tPKM7o
 5xvtVN91hHoki/AkGQHVgBL8cSydeIjtfQoUZv5QZas45K7W4AoQ/61t6h/dBFq8msgYzDKFKSS
 zQXYM7xzwC+wjihtqPDk+Sojm7/5tf7DPK5n3p5May7ZWt2kyg40+608yAWEj9DNZYNCVDpPAfp
 5nS6RFFyTnPcfsjsK4cLPeIJV9fropiqRyAuYndkJNoawOAhOL8wADHSpUdgPGs9tsC3Q5wYlG+
 wnvfqE+/Nv+Vuf9oiawxYew8dksrrtSqdpsjHXcp381sHbbO3Og5qbHGjUKq//1ktc+7mF6A
X-Proofpoint-GUID: zNrULjNd_VVPYplvynEJBt10gahXl494
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=737
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130136

On 6/13/25 9:40 PM, Shinjo Park wrote:
> Use the same definition as pm8058.dtsi. Since vibrator is used only by
> some devices, disable it by default and let it be enabled explicitly.
> 
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> ---

This is the third time I receive this patch within 5 minutes - please
check https://lore.kernel.org/linux-arm-msm/ to make sure your emails
reached the outside world

Konrad
