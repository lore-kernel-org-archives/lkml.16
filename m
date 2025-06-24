Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7364628D8CA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769638; cv=none; b=qA7VHncCPTt+AIGwinHJieeFK8z8SA+yQ8cZXNCBZtfwItC4nwD/vzaeU4eIEAuy78Bm+1aNQ7piwllQoYj98yPXkhrTXwTkPLTnOz55n/ilU+lFLLHcowMwQfYMYjNY3fBkzuMwWu/cHf6RUIvuoCoSZAzPNi2dLEyy4NLXSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769638; c=relaxed/simple;
	bh=tNIhnvuJL34DWyW0/9wKkWvSs2dn5yOqIFqGyBcGiyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=df/JuXP2kp9wrxwLXqXl5OMkceXiYER5sdPX/4Xz3rDtp8E8UA5aNPDWQLwKqvBIHxm/KfIkYmhIJ5n+FQdNKrBxw3djG/X4ocrJ574kL8R7LkDVNwnzDh7inJSKtzRG7rRI4XIrg60QrN/4IsMOl2EOxtOqNl3a1xLJJ/1pMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o4tnesdl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o4tnesdl"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O7RB4Q020843
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aeRBeFnF4lcno5Yc+pip1PsV/E+s7JmR6bAmZl2QfIw=; b=o4tnesdlmoD3y7mR
	b6XNGNjqo0V7b/+TfJAN+ogKd3ncfjFkTcV15lfI3p9oIMlYcQIUK86QLPJ+TJT4
	8Q1UpadV094/L0EcG+k2MxAR+dmqUN1bfngUhDMHwMluNioGvcgDWnHeOPkObIBO
	TaKiTdtyp4gCQNnA+Vd3jtLnrixgtxaUlN+reItPQHSKLk0OIpWrvEylFNnHeQFN
	icUGN6iRk6xrQ30gHkx5FmiT/eQuZfx5NQS+5u4HVaapNtqaO0ILpQLEtFioDsES
	VkDZ2FbUJgPRkUAh65jOHiUCkNycO2vcvRiBvLMYp1uN9Q8fXAlOnzHz+7Hazp38
	SobelQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3v1bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:53:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09b74dc4bso139739785a.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769635; x=1751374435;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aeRBeFnF4lcno5Yc+pip1PsV/E+s7JmR6bAmZl2QfIw=;
        b=kA9KBZOEzW056wPn/WxO+IBnhRzridlpPULtsonE4bp5XpirvHTQGWBpu+6oxr8F87
         fSyKJYyhNfjDqYVzpuEhSmlJwRvoYl/nd7Ga/gAXvbEEvJSbNnATWbMO0ewfiXhOcK77
         uZuZ4ZQBJvIB5r1vZtnlgbLOpPg6o38sYDV/7vVoXmyX6YPKtrcCante1m5S3S7/NXiL
         zOk1vw+I0owEKqlaOAbfvhZPr15Nq0CjAn9JpJnZtKi28oiXlZ9jE2J8b5n3J+FBn0Xy
         K09kzxPl5u3KcZGx8NmolsJR4+UA+oIOSPEwlDdCghcj7D8ipRrob50U6+RB+ns6fApw
         9Dgw==
X-Forwarded-Encrypted: i=1; AJvYcCUT8/7nc2pP/3W2JEomMO52KsE5TjJ8ExnR3LnTtmVujsE8kF8bY1ePtnwLQqYu34HpDrq1eq76+brlvGk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1zElxu5vSvTKea07T5UTEyXrFm6QSZ83Tqz44RkbRovIL/JS
	tHgmBQz+BwnNEDoMm5ZfIqKTccfNo68apnWXVFTXAIXVAJeyixSl/kIjLK8TokQVz2/9qK7ewgy
	pc0Pu9eXJa5MBX2RqWpkZto7bjL94x2f7IkK07bKK9kUVnwfjC+Y2R2/kxB6/M3jBXDk=
X-Gm-Gg: ASbGnctP+l3LQDeUKpJDrX6a8iyv8qqwD4dyIcHbLB7oY1/WDMFdesFaZh7uVNmkpB9
	mNXZ8zjLSvVeEUr8rSGds1l+0+8G7e8p7YjiAB00EpkQHc6eAjLsP6CMSiNGl0NX2zOPnzZUc+8
	KP7hkmKpXhahpi35/Tc1HFLrnVfTRmXO8OypPgSH7TQkWBM6prwTIkyJVo3locVFRSPziMs63N5
	TaaULv2XcWUeK69Ch6DSATxBj942b+xU31v8Q0mVI/mfE/s9wlP+JvQ1hCbim0wxy3l7MI/M0Vs
	YNfRo2tm1SbcG6kEzhIIId825em3VYwhe8+heXCEqEYaLj624Xuu7HTCrKpKiN0bHZ1atEsbhau
	g2m0=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr757962985a.6.1750769635206;
        Tue, 24 Jun 2025 05:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm26Atmzo8lMPkhFJw/P2Xp8LDJYbWX062GO4T8ZPwBCNOZSuvof419wfPyXwFJWWZBsaOMQ==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr757961685a.6.1750769634731;
        Tue, 24 Jun 2025 05:53:54 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f4975a1sm1007741a12.68.2025.06.24.05.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 05:53:54 -0700 (PDT)
Message-ID: <9012d2f2-b9b0-4fca-a047-5b5adb921ccb@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 14:53:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
 <20250624-more-qseecom-v3-3-95205cd88cc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-3-95205cd88cc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwOCBTYWx0ZWRfXz2yOU5n2+KQX
 cq5p8ZPcqtET8HQRC8J9RbwytP5GH2R3dfWHoZtfXP4ikXfKFDzfhV9+v/SYYt0ZkrHOwbRxDuI
 97RlxEUuv/9mTSGnaXZ16aT7bmbKAd9KyXqLSTjnij/Cgvzvx7UiJHRnAU0mITjNwIsUTGPjlQ2
 AXiDQ9KKbSh9mz/lNZVrWr/8tREaDaUFNxDZW3yf2xEAuLkx45o+jyNRVojBwqOzvk+RhUc6mrC
 J74R1PJnWTr/lEIk/+/reZSkNQbtmin20gnMf615YD6CRn7Hbbnfp64tMSoRzY5kKpMp9c7VElS
 Ko/jrY6aXtISm53nyu9YzcETKwkVRL3KQM7bv5sUSbjcptHrHwnW8AiIQk4iRIW4tXsS/NTHmvy
 XAVtW7JREd5aoUpb7p5s3qD4ExFA//1tdu1X68FKfZgpUB9QB78s6drL7RjjqkV5nTF0oK98
X-Proofpoint-ORIG-GUID: 9JT-cYlXDxalXiP7FuK2GM4TLflRp39z
X-Proofpoint-GUID: 9JT-cYlXDxalXiP7FuK2GM4TLflRp39z
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685a9fe4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=aztlNrSj1wai7b1BO2MA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_05,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=937 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240108

On 6/24/25 4:13 AM, Dmitry Baryshkov wrote:
> For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
> update variables in the permanent storage. However being able to read
> the vars is still useful as it allows us to get e.g. RTC offset.
> 
> Add a quirk for QSEECOM specifying that UEFI variables for this platform
> should be registered in read-only mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
