Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB4528DF23
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748451496; cv=none; b=PUqKx735H4nVNh9vAIdwb1VlbXHvOGTa9m7QRcXLbA8GzGcy59CZ/e6Vavi/GSouURl5TeVtzHUMKi5CMO7Jx1YmTiXIcmbtkRzIWDSUnPv91tA0YcqtEyjEfF3bWvEFv8TmAN4AL/TfSNm0ljI7lLo8aj2+vrQM/V2KPTb5k3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748451496; c=relaxed/simple;
	bh=C/ggDr2U3zgPwsBNLbn/6E0DwqeLz9NmTk3loAa748w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDTZ4pzy68oOg3nEnhp6r/cwCHk7RiAuVePqoxzTl5P4t6HKX/SdHIKxvrQa7mb+niQoXXdS5S2TVYWDyFTuG8+Cu8aTd0BPwcRu++WAlgDYocZRUa3HApwp2pr1j3+jEhrU5PXVRQu0oxv3IluQ1qS8Jm54eLeeu7pIq9sfdTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdQJuX77; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdQJuX77"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9PYvC015068
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qPuMK5jZFsmnypBiTqJe5zYuFHyiejNpkSdvHBAX+qM=; b=IdQJuX77asAFx/L9
	V9dExB1SzToC288lqlo7biqGHva3PbRcVejs7s2klOYoNqPpzUswLaVaayzdourC
	f6ZBK+R+SxZqnUn5Ivaknt0kqfg2JtOeZxo7uF/KKOOTQuLiafB8hKLkI0iogjQQ
	dknU9bBD9+wA5UrUfhfiHB9EEvyeqHEk4cOj69NWgDBDI1RQIH2sWhCGotCrWnzv
	KDurIHQhb6gXzv5nT9qzCsrDs2waLDJhpztub/2/TSRRhljzR+YFYKD6IFgoDlM0
	4IPOs66w2VZhjC+l7jUSxSKjwHmOlH6Ofq0CbNQ4IEUB4egVfCEZN6ATZFL+5CBS
	2xiw4w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek2tu8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 16:58:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c552802e9fso113748685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748451493; x=1749056293;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPuMK5jZFsmnypBiTqJe5zYuFHyiejNpkSdvHBAX+qM=;
        b=AGoL2bzk7kXYz/smjb/S5L/AvB03wgVTchwwT1NjI/1+Op1t1l9UIzHOUnGCqN1f/y
         wuFHWHgwubQ7tnpSabvB1WuQr4bV8fEx4BHpCCU0LVn4sT0+fM0o8VpxgD39ELywq8mc
         MJ8SZC793VNeeM789/o2FrN7CswyJ2LHYM2Y3+7hvTuol+rhly1xB38e1+1WEicOzhR/
         mXSky7SINOEw3bHCjsewmAfeZ3q0pkqnDOrelioV/T5QLcFw2NP43DoNvAfa+co5Km/a
         aDBDAyoZ2VFsBIYVnpMe/z1j7bCGbspoIRg+BkosLycEgSBXrwRqbVz5Vl+NzL1WNMLL
         kt3w==
X-Forwarded-Encrypted: i=1; AJvYcCWbOfxAXCSnQETTD3R54Q0mRyUm9heHWsdreshBJd9msrKtbTaetp0C1Cmvlzv0k6QVD0piugkoIb2we2M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzAhf0sA9YJqRcjCVR5hzGaR4jIFusZKQVKaRxrOLVy4XZqMk8
	AUyFaDAlfp02gVa8A/XYG+PvjKP7EDUKGjKriaT888pEfB0gi3BilvyRzr3XDEp1YmhE2H+Ug0V
	/Z1z9DpUtvrVN54kvzr//Qhj2kYJi6cycewF+NlY6rly5KVDQf8S9FPAVuIhAw7jT7fQ=
X-Gm-Gg: ASbGncuIM4QhNAN1xye86RK8xrSdOsAuDx6Bx5cWxKl0gqwdBkRsaN/CaWRP/TVihCR
	54TDqr91SjO2mdsu1EsHwAcRxt6/KHbzoRWvPbSUtHdczACdYr7XGGvjT6SPi3xG5CxqKY7btzo
	tFhJiiIaChhkUE/snj40bOR4Fu+72mOx0Xi6f/9CBRrFur0mBnVUd19M0fDm34D9VFZ6tYYrpPu
	hBE066hlUMhqIfGa8zE4udKSnCUgoqkWaE+HmMniGmYQpGJdXHz4adshBqWwzhqnA0IXQZkYgUk
	MCyrm53MZpJHHsSneaJeEM8KIyFZ5cehubWZPpphN9zxziwHrgj8Nb5enOMkSnoDgQ==
X-Received: by 2002:a05:620a:3198:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7ceecc09f86mr921830085a.10.1748451493048;
        Wed, 28 May 2025 09:58:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkAjuwttwsySAmNXr3cyWyVH5nivsVuo17QQGa94DXhh90c8s++PqJyE2HPepyHAHWSRNEhw==
X-Received: by 2002:a05:620a:3198:b0:7c3:c9d4:95e3 with SMTP id af79cd13be357-7ceecc09f86mr921827385a.10.1748451492681;
        Wed, 28 May 2025 09:58:12 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b865sm135090966b.168.2025.05.28.09.58.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 09:58:12 -0700 (PDT)
Message-ID: <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
Date: Wed, 28 May 2025 18:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=683740a5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=RZIJFy7CuqSkVLaUGaMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bas_z6hHsUvu7-SkRx403As-jqDk1CVO
X-Proofpoint-GUID: bas_z6hHsUvu7-SkRx403As-jqDk1CVO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NiBTYWx0ZWRfXxeZI5hIA7HjK
 PjKW1coYROmVlLeLTyyAWG2HmNhCGTECkuNbrJYRyx5qufTvr4ogXGZm3edTWHwW3V0Aebf+cBa
 6Fo8oFdN7CgDV97u5/NUcCidPET+ZWJNVwMTXx0Kt+B3nHgY6iOuKDPRrNIxxf+j0wNydH6WuhG
 GmHW7vl3aRCSh8ntDakr1oV/E7uihYm9rG1dtd4wo8D3QZUKIaqVdMi4R9q/CKDkTD612obnN+4
 UN6sRLyzPHEh3lvGcgqY5hOIiWLCvRcZYB7bNBW1kU3PPpn94z57robgPpm23Oo3R2s5B59tGCY
 Ffm2y5dms4Fj0vB8XLlVCdlFHaMDr8KDr8UmbQw/g8pM9gWngw+QdPFLWOVPOJdVQEaZz0NavXs
 95eAiFu5omQwRJ8Fkq5si8A/+z5R6eDhR2L9HyP0b43oK8f+HZvIypPeX9N5Rbdjs+75FGDW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280146

On 5/28/25 4:37 PM, Alexey Klimov wrote:
> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>> and evaluates it as a SoC component or block.
>>>
>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>
>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>> @@ -23,7 +23,7 @@ description: |
>>>  select:
>>>    properties:
>>>      compatible:
>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>
>> Why dropping front .*? Are you sure this matches what we want - so
>> incorrect compatibles? To me it breaks the entire point of this select,
>> so I am sure you did not test whether it still works. To remind: this is
>> to select incorrect compatibles.
> 
> Thanks, great point. I tested it with regular dtbs checks with different
> dtb files but I didn't check if it selects incorrect compatibles.

Maybe we can introduce a '-' before or after the socname, to also officially
disallow using other connecting characters

Konrad
