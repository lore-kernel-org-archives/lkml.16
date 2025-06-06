Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FAC4683
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 05:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749188041; cv=none; b=fat6JFy81rRNs2zMAh13J3cn4Sd5Yf0RrzS8mXKgYN8rPUub4FXLV+bTMqYIf8rrMGCc63umGAOivbw3q/qyx4Fxmkdyg9pn3IFTlQy457S5O3dvsxal3wBmwb8Ny2sDXaVZZP5uIBgDbkJY81g8+nh2fxD80G1XVpgsIcpmqwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749188041; c=relaxed/simple;
	bh=naqltafWL62FHIa0QUHTzp57wiSFDq8rVif1IzApAsc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JldS91jd31OKTQmbvtEgjCoi4s68w+3C6zZZVEAb5tKAO814E/Z4ouRWMKERHuooA5QYMY0Mo69/+eIDbxpFI7v0TLYkABI95iEVF8Qp763l3m59rohIymqJ45hUjCBAu+rtjnZspTa4Bw85+zNNVH3Pjys2MFadCVZ0ZuPmjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GfAPyq0k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GfAPyq0k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H44dg000905;
	Fri, 6 Jun 2025 05:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3fXWGiDGcxviW1fGNoR2ruND6LCNBMbPtWe2+G2nYOo=; b=GfAPyq0kYu2RL4oW
	xjCLyhCE4D7Wh3PbVBc0I4prWGdAwD6Kc1eNfA40rfwQNkWGinfeAWHik5fcGtu/
	oFKIOZjRx0bIW2M0+gmG7bCJ3r9Um715VBQsPe3zNyw+Njxpvs7K0k2guiwdpjSZ
	OnFLym7wiL9Up+3PFN3zGF6/DscK4QdBtfRAjH44Uwhiorfm7zN/qJqx378sY4Fg
	cuAjHUn1jorHkSAhL5wjauaY84Wo0PZIE0TyKUMnkVVuu1D/9aswdFET5mGVBptn
	v1ctJwgB8CLwxTVEzZXnHIYZkYIdleTJm4EjEJ8qnLkdUeIBhZJGmHsoQT2J8HAZ
	gKdeMw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qbjyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 05:33:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5565XhtK027289
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 05:33:43 GMT
Received: from [10.239.133.242] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Jun 2025
 22:33:41 -0700
Message-ID: <10e5207e-353e-4648-8e8d-6ee38d14907f@quicinc.com>
Date: Fri, 6 Jun 2025 13:33:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] scripts: coccicheck: filter *.cocci files by MODE
To: Nicolas Palix <nicolas.palix@imag.fr>,
        Julia Lawall
	<Julia.Lawall@inria.fr>, <cocci@inria.fr>
CC: <linux-kernel@vger.kernel.org>, <quic_tingweiz@quicinc.com>,
        <quic_jinlmao@quicinc.com>
References: <20250605044405.2057511-1-quic_songchai@quicinc.com>
 <e8221cc5-cf5b-49f8-871d-e49d6621fc6e@imag.fr>
Content-Language: en-US
From: Songwei Chai <quic_songchai@quicinc.com>
In-Reply-To: <e8221cc5-cf5b-49f8-871d-e49d6621fc6e@imag.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Kv9s_mcjB24Xqulvs4uzK8jhNFLf81Nx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA1MCBTYWx0ZWRfX2FtfBsIFWyYO
 WHvTaOcQGmaSc5W53cvx5lzDd8WoSiMQH/8P/EhZPD+dAQaM7h4IexaPmyKv7h81LfK4m/cP3jV
 W7XuKcIw5Go2Vwp1YE3KPraDSN5WaMz63XNZPoc8PlM5W7UQ0wVZnOiVf2GCVK4nwnDciiOfEXA
 Dxtnbum+4jk2x376z1NOnQRf/XlAwOLMSSme8PICuy1X1fXR9mtFP6OETAYJprikclxyskY1FpC
 cF9/rzOQG5zr0Uh8+FlgRTF7bZG+g69O+eqV/Y/yL5Gy2xczvKubRg893Szle3FH4+WNuVMaBL5
 KKE9z2I1w6gN2zB0iY5N46dAKKLFP092QOISMiwVoFiBjqzFEzRX9G6wH3rIL7Gr05VVo0CeUkx
 nEH8c0H21sfL3s/4lu8zeYq2FJChEcQe+PhTbP28Aifk05eSmjS1BasRDwykrDf3kCWaF5zs
X-Proofpoint-ORIG-GUID: Kv9s_mcjB24Xqulvs4uzK8jhNFLf81Nx
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68427dbd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=sPnlxz4oxlKK5PFXHyoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060050


On 6/6/2025 1:43 AM, Nicolas Palix wrote:
> Hi Songwei,
>
> Le 05/06/2025 à 06:44, Songwei Chai a écrit :
>> Enhance the coccicheck script to filter *.cocci files based on the
>> specified MODE (e.g., report, patch). This ensures that only compatible
>> semantic patch files are executed, preventing errors such as:
>>
>>      "virtual rule report not supported"
>>
>> This error occurs when a .cocci file does not define a 'virtual <MODE>'
>> rule, yet is executed in that mode.
>
> I am fine with the idea even if the orignal idea was to be exhaustive 
> in the implementation of the mode in each SP.
>
> However, silently discarding the patch is maybe not what one would 
> expect as the considered SP will vary according to the mode.
>
> Hence, could I suggest to add an else branch reporting a warning at 
> least ?
>
> Regards,
Sure, will update patch with else branch reporting a warning.
>
>>
>> For example:
>>
>>      make coccicheck M=drivers/hwtracing/coresight/ MODE=report
>>
>> In this case, running "secs_to_jiffies.cocci" would trigger the error
>> because it lacks support for 'report' mode. With this change, such files
>> are skipped automatically, improving robustness and developer 
>> experience.
>>
>> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
>> ---
>>   scripts/coccicheck | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/coccicheck b/scripts/coccicheck
>> index 0e6bc5a10320..18a69edcea66 100755
>> --- a/scripts/coccicheck
>> +++ b/scripts/coccicheck
>> @@ -270,7 +270,9 @@ fi
>>     if [ "$COCCI" = "" ] ; then
>>       for f in `find $srctree/scripts/coccinelle/ -name '*.cocci' 
>> -type f | sort`; do
>> -    coccinelle $f
>> +        if grep -q "virtual[[:space:]]\+$MODE" "$f"; then
>> +            coccinelle $f
>> +        fi
>>       done
>>   else
>>       coccinelle $COCCI
>>
>
