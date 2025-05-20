Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F325F965
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759744; cv=none; b=KiC6fj+RBm1GkqIKqhxjz3YPnYVsCOcGsJoF6VZ/CuACZOA/ntQeP3QGyUyyS52RdhQ4zwWenLsw98pCzcSErnriJ7NFNh1QREe3P85xsndvx5Zo+SEihItRBvmx98C4Z9FPib0euM48k12Ecc0E7Ud4flfetCjiTu+MKCZ9OzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759744; c=relaxed/simple;
	bh=X4+btThmKvIhjE0qAfhLumAaALzryTgL0hvFCGxRLxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXxnNp5ffkThV2xrIlOy7k00ofdsCSgMYSxMAdEFlXNfO+Soy4WoKdyziK7ZRQpDV1L6eu3Kwg2oWoTUGNg5vKmXhiu5+5q8yl5NPpjMUFDf16XD6BNh+H3UfeQ+MqJM2uKBmrX0PfbJMf7v4d64+QIjplBISrb9h+hrFlBzStU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NY40pvZA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NY40pvZA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGfbDf004263
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ho35WoPUyH3gxfEwkpGcPljNy3jZF5gHV8aJ2JxHA1E=; b=NY40pvZAX6r4ynz5
	4ET4ml+TnJzRKNVvWI209DKeBNv6uKXPSHVDXR/15HjZuyKUkI/YreBQki9pL74z
	LL3QjOuOtAhr6mr/nHuY2T/jrDLvCsFwV21o6rgp1TQaVUQWocMXzGg2z5y8QzIh
	FIntJnrFs8OBL2j9gN0eZj19pOBVI/+rt13BnumvF+Vqgo8Yt+/jmvuuPfbC7C7E
	pmxfYMdmoNHcUuqZobhJXq4QTwkbuqfyFfGQuDniNVY6kqRw6ejub1aR6jyrKlJI
	DNsgrlyRb2AucPacWP1NVXf8/zJwx52awkfJTXPySN22i4mgwsx+/qhV+kRDpC0e
	TxL0+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6r0wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:49:01 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f0c76e490cso14940506d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759726; x=1748364526;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ho35WoPUyH3gxfEwkpGcPljNy3jZF5gHV8aJ2JxHA1E=;
        b=doNYAAeyAWs4H79mdVrjZ5ZwoAlX4DKUFFXIRwj7xWlBIm2yZZsST4o356tonTPgYu
         nztLoKSB1/xVR/kiKuDgR1hpkA0k2F2KTe9/UUgDYxTfL8NGfB+RAh7QNKN278iYHxxf
         tAktn/sndpDxWiS8E493ULA16M/xuvmP2Lv4G44JSYPoXEMLLY1xEhpQQWhzs/EByJZB
         NuO7pCqqxXW+8MtEC/zTEgHwAPwUojhKaVEiRrnN3Zd7LnywzBCleNv0Fs3xtcfn6qvq
         4BlFiUMsbLl+j3EMZPIsnMMMas8BFqIlO9Hhd1c6ZQMtuJwFS/+2DxkHoNz9ubYjfXfo
         sVmg==
X-Forwarded-Encrypted: i=1; AJvYcCWuJYU/V2UlgbEoSWN9bS16Ea6vO1movUF4nsIeKs/8qwzWcNTXFvrUD8sQrKJ30hs68YaRXCHLnJ5cDRg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9+CdSfjilN2g/EcUB/FNSZHCikLsRV71m4ZNZ/mf9KvZeni/O
	8RAcR7U8AwcF9ipF+NxZXOQFxqg71G+FZvpWTN+pcXaTJPr9Kmd5bTCE395P4wgawbrPVW+a87C
	KMfsiU4KZ50Jse0DHiz5B3y5ga4d0wFqaGW7utTVm8tltB0x1HpP+vzEx0u8uAHNFSso=
X-Gm-Gg: ASbGnctShAd8KV7dH9ee6GsNl6m0FwCw8Z6+WlaRktLOjqoDtW6FbYCNdXsL6mztKHt
	bEMUhiGFErnCE6SQO5CvJC7KGDkK+CDnNhsxJhLt3gsHJ9FWOMqFlF5AuUL7lPDkB9JZzVhkgDJ
	NqkwG64+vUi7AGpjLb62ovMikXgFe5JJVZbPMUiU6pX7ZcAb0BFQUx3KNTrsIoM15Bge+EyReKu
	xy7fY+mY0cjfiVjFAAswxtsp+THU3K7FN1YV6y0RUL3MHcsTrl9YaAqAZRtLXv0aaLu5HmtNU5t
	QNbqkIuSPIAukKfzR1mTRizLuyjlBro0NSd/Wcc+qpJ1gX+L1XFDJZCCd9Geyj462g==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr93780926d6.8.1747759725650;
        Tue, 20 May 2025 09:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPLddRavjW7T5Aifs9O+LKyxFQH6Bk/4p2Fk+pp7h3r2EbU91L3XnVOfAD+U2L+jZ1PqXF/A==
X-Received: by 2002:ad4:5941:0:b0:6f7:d0b9:793b with SMTP id 6a1803df08f44-6f8b0944b8emr93780726d6.8.1747759725166;
        Tue, 20 May 2025 09:48:45 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3888esm7381058a12.65.2025.05.20.09.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 09:48:44 -0700 (PDT)
Message-ID: <6cd1e3df-5a47-472b-98f3-468b8e86de5e@oss.qualcomm.com>
Date: Tue, 20 May 2025 18:48:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add UFS support for qcs9075 IQ-9075-EVK
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sayali Lokhande <quic_sayalil@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250513084309.10275-1-quic_sayalil@quicinc.com>
 <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bhu7ifrgg4fgy56lc3ix37drxyciyzl46qkicv6lr4svjejcgi@dqdv63ogxtjr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NiPBt-A9XcS_ake2_QyusssMAyf2ge9z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDEzOSBTYWx0ZWRfX7oybRaE/4kRL
 oLUsl5XpzNjSJQTPwi58TyfqV21CdYsSkgfeL0gqkayM32H/fBCJP6Cm0u+BaxJ20MCNbFLGsrs
 l+VNQr9DxQVtTfyfvrUDSfTSqTdqFcdJfyVg50v2+x3HfdEvYcSRzdkh8q3B4DMnrvO7nACUCsI
 yJoahinCA8YyePlJ/FOHU4PIrhNz008SV67JChBucAaNZyu1xFVmMX7Jgt0YIpeT9kk2v/agjsW
 8uzrKkO8FE4ksUYBsnP/0CWIMmAp+f4R86pc1FpNsHfpeYYdPiUKA3/Jlgfj8E8R37vcQFqDiNZ
 SbGsCQboO1K0kjMZRShiMXF5WT5YikJ3HvfS84j8QxA9AhiCy9hAnjEzmX/fydVeBFg/cxMsoyZ
 hiPoOMxtHALG3oNcZMovs8p/lNSjQsNd6LEwoK1BzKb5aTUTHgS2g1S9q8lFh+4Q6pPKsLHC
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682cb27d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=9KQU9hNs3Guf2Fy9bq0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: NiPBt-A9XcS_ake2_QyusssMAyf2ge9z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_06,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=994
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505200139

On 5/19/25 3:07 AM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 02:13:07PM +0530, Sayali Lokhande wrote:
>> Add UFS support for qcs9075 IQ-9075-EVK.
>>
>> Rakesh Kota (1):
>>   arm64: dts: qcom: Add support L4C LDO for qcs9075 IQ-9075-EVK
>>
>> Sayali Lokhande (1):
>>   arm64: dts: qcom: Add UFS support for qcs9075 IQ-9075-EVK
>>
>>  .../boot/dts/qcom/qcs9075-iq-9075-evk.dts     | 27 +++++++++++++++++++
>>  1 file changed, 27 insertions(+)
>>
>> Please note this change is dependent on [1] which add
>> qcs9075 IQ-9075-EVK board support.
> 
> Please squash it into the original patch.

+1

the patch contents look good

Konrad
