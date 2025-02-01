Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66FB19004A
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 15:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738423306; cv=none; b=ECo9VM4WrcuTIDjsCYAprkpUNdoyTSzR64HDQ2dI8yDI2tdbt+vTX3rnIMKmtdItdiawCXiUkBW3VLrEj0smpy0SE5h08e735xYnltLuQeDVvy4pmm2Sgb+RC3t3YXkXDpKIO556MmYwz1oWEI1KKrjJLRxjY+LAw45jk7iUt0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738423306; c=relaxed/simple;
	bh=jwlgbM58gVPmYcQpvsJIy+oPufT9yeu6uuA3sKSpgfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SOkVTNRh5BFvGwS294K4PIoVD+tYEDBtRZjxUOpUdwohMZQasAhWaHU6kcGnd9A09sJJRiu2kwnnpFoQXzEBGtj6jtLLKQZbr28Mlre2K8bZslaosVaINJbIZSFRZzulnYvbPcUxvezIoShz5jlzvyQTP/je6GWQPCbzJS3DoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j+lNUpa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j+lNUpa/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5115CTPq020535
	for <linux-kernel@vger.kernel.org>; Sat, 1 Feb 2025 15:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYn14RVc/FnUbOz6NZcw5IacFoIiXOj9waoegmQ0C2w=; b=j+lNUpa/HZ/qqHHN
	ej0VzMAKatRapM+8hvwowBusVtTTIWyL46Vxfc/XDTw1KflGu3yR/R1AkrKrzp0r
	XC8UHphMfSbmdfsvVX2wZXPWJZSXhwe8EVC2gwh5qwbTqebJ2C8gD72CqAeD7ylj
	lWw9OZhlDZ/AkaIx4yEOSqcKXyW9lWdVWhoCtkMVwtwyA8Adb1TQGq2Fzw1NZ9ub
	cNTzy4fgzzg31i5zfPr94zYCdefJ7Aj663DqwodpLItrgVHXbIj3trEApPX0qRld
	GNSZ8JtgZVUVqVUh6Vl6Xa+/pEQPHz1S7OsWAbTTFmmSHNhkQ3Oy4b4dgr+hpOSa
	r5G5Yg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44hd8w92d0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 15:21:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467975f1b53so7655721cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 07:21:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738423296; x=1739028096;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OYn14RVc/FnUbOz6NZcw5IacFoIiXOj9waoegmQ0C2w=;
        b=K+9ATBG4AYwFDetLZb7A4Yj2G0JGRbwIgwHaHW1uY4G/GjTQEFh5YSUAFkZXFHn7Sb
         2PeL4JaL1EsFr/5IrB3JgeZ6+x1p+JWNPEak8PoAl//NkAc5EebpsEaRge4UbenpLrW8
         A1sRP0YHFtymR3Oa/9suufpCBP1HBbn4mxhrG9VMZnCSjGGZuoi033H0Gpygwf843Efm
         FwxS4bOG9ai18vsqdTf3R2tcS9f1Glg0ktaC+1tGcb2GNYYfiNIu/IFx/WHaui2PHJ++
         ykiZCcPeIt8BKDFvV1ACBOrjh/lQZVS34nsH3VmU5uW3QktIUPvaokCvzqhpaf6gDabL
         a21Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpHDUCEGFiqERqkyOzui3vzzcnWxP3/9f3luvI1UxDeHkKsNXrk3oFUEvEp3Csy4pHaI8uw9Xu1+J/L0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNlDN6olzPeJHW5tgWnsrXXkYHXSed6qIDPE+kqhPYRElMNnRF
	+D5Mf7xxDQincK0SIXQoqu9siMDrNxOxYtOU5UPYpKZM5jLuSCkp55K9rudZFHGGyMz4awefu1P
	QXmQPoh5USGSPcieej5xTSxiM6ymyO5Y+GvoBdRamkJsFRAPaZyQL/1d/Vo+IR10=
X-Gm-Gg: ASbGncsVv9wKKJawlgd/RVETmqgxwq1m7+ZCHRdlyZGtGvxsoXQyxmn0l4WE+sR4G/S
	qSpo83aqkoPwEOI/zXzh0kNYcNxhRuKbPjqlM//N4TSbBJJphEPIuEV5eoK3f+jXyATnoH8NTI8
	1/bZBzZaXwxlF4SbMH5OZBrFcFn6LcbisNqsXXYpgfTVOppDdUx8j2kY0NochNAWyRiNyc5xsJP
	zYeyz0atItdnc8Y6aLjXEUh38M6vP5f9U9qXJprLQJDzGgiRrVEX9t18Tp0fIqE2oWx9SKhsiO1
	OjcIpQ3TUK3VIRzUGtZ4u+pc+mHulC3pFLAzlGIIECdlT86lr5o1O74BF0w=
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr868789585a.6.1738423296269;
        Sat, 01 Feb 2025 07:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEySoHd41wM76d7YXvZgBoCWYiEpndiihi7DUAJYjYG7YdkAiWAxYQXu8K6ao9XqT6ueBFG2w==
X-Received: by 2002:a05:620a:1921:b0:7b6:6b55:887a with SMTP id af79cd13be357-7bffcce582emr868786685a.6.1738423295862;
        Sat, 01 Feb 2025 07:21:35 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7044bd8dbsm220728666b.2.2025.02.01.07.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 07:21:35 -0800 (PST)
Message-ID: <ee608de8-ad3c-4cb4-994d-fc3cf930e29c@oss.qualcomm.com>
Date: Sat, 1 Feb 2025 16:21:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: ipq5424-apss-clk: Add ipq5424
 apss clock controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sricharan R <quic_srichara@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250127093128.2611247-1-quic_srichara@quicinc.com>
 <20250127093128.2611247-2-quic_srichara@quicinc.com>
 <0c26af56-ed7a-4de8-ac47-7447298b87f0@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0c26af56-ed7a-4de8-ac47-7447298b87f0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QsVFd3IzZplJjyPW2POPMqWHFH_zlRpU
X-Proofpoint-ORIG-GUID: QsVFd3IzZplJjyPW2POPMqWHFH_zlRpU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-01_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502010133

On 28.01.2025 8:34 AM, Krzysztof Kozlowski wrote:
> On 27/01/2025 10:31, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The CPU core in ipq5424 is clocked by a huayra PLL with RCG support.
>> The RCG and PLL have a separate register space from the GCC.
>> Also the L3 cache has a separate pll and needs to be scaled along
>> with the CPU.
>>
>> Co-developed-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
>> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Considering that there were multiple conflicting patches coming from
> Qualcomm around IPQ SoCs and that we are in the merge window, I will
> skip this patch.

I think you confused this with something else, I don't see any other IPQ
clock patches

Konrad
