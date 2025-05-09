Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA2227700C
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793831; cv=none; b=aIN1n9vLw2r/kMB5ytecc43t0Urdon0M577FdtTfRuFYeo3q8TCDEred0Yje6kwMLoy9X1rCdlSRzJ9moBq2pzSOzgYdKzFUOVuhMWbYp6TjCUnIrI+2bPQgad5eJrlgwGIPKS2b3nDKdEtK/JPCFc4qtaiWGipenLenq+zG+40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793831; c=relaxed/simple;
	bh=EtIqMxiMTSEf7RwEbSPialgbzUOQRaigNeo+faqjLU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=efeJUq6NUHgc/s6hwrqJpptClanB+mvk0YztmPHR4mGi/xThnpcvEVCVnUZbDOtZAmlQMAupbgMmxYuvxyoh38LcCVgENPhMpeDHgWin/Bjo+Bq1Rw3PWMFoQOIVEkWedGdW1ItMtnCaAIyDTIl3agBl1KlN3PFMcNlwn3vxC8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zl0GjNo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl0GjNo/"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5497ZuUP019254
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=; b=Zl0GjNo/+5WV7EPn
	4aLty6QN0B4QEZiS1wOy5GR45AjjQMZxk+XfpKka+PdyTX0/EviO9M8R5oYCiW7e
	8i0LgoFSEtmSH+CfuSgbPYTBq2Ay9EryCfHLsqYD1OZUwBwlaE5wwIwCjcxWbg8R
	9QTdoFgzdQqwX0qRFKXYowco9/paEOSGPnSZUdxWx2oXzY05p0Reb2Tt3nMvTz0q
	chqbAzz3oauv5l7FJnd+DPClKz6vVWAuHkEdoDxT7I6duu1heMOow0xno0BJ6rcb
	4WQG8MQ964LhxdBktcwHjCT5A50M2lbnH4jge0FUJYGc0Em2WZ86f2iyaLc75SK0
	oaz/7w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gsdj4351-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:30:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c76062c513so55378685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:30:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793827; x=1747398627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l84llEd8JLKaBllMEadN67nos+6Z843mYuJwRmu5tnQ=;
        b=H2rTFq/6H3O9pYNvaRBxtHOvbP4czHbTUpR9JRELPQwFF3Hw4f7AOHI2h2E8Amuj0o
         ImUxRPuq7dkMOfbsHI4hRUEXsDxFW/Jxu77ZPF+KiXUamLKOjg4tDvue72XLPmOBkqHM
         RCXO4JK2eRgWp0e7VuAf3FmlzSD8XdBeeViQsLMo28vSLFWebCynzfO9F5VvSx57Z1ue
         iycwoxzaDALlfGNV7/WiWzkv1L/U9OBA/XTSojSg55BHpA+rAyx3hDs1cxOk24PZnYSh
         qVjMp/t+DChWJZpLYnIhHyfvOOaoUyFULHBqh5oXBRhW/cKp9x8SF/G24vcKb0c7nlNf
         Iezw==
X-Forwarded-Encrypted: i=1; AJvYcCWBMsr26N//d1/1F9TGd8Ee7D5YeqZUO4ntU/sBNyA1i8hrpmA2SrtrVIrCeipOss6RPYM8OBdjWJy7NQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvmQ/+x7a/NXB+D6lOmWmrAxcZnR9yBbSUUbwx+T+IuxL4EpR1
	2B/2xjNyInl/RYTaPqu2mtXU3siPtbYwCUgbleHnbjwdD/khwoNH8+pUTWqDosCe+DA934K41l4
	XccTiMlWlJ5F3QMg/y+leWE6Vrr7/pL/sw4NWOqXRAz1b+uv3sB3l5qnqY1BSHmc=
X-Gm-Gg: ASbGncvqKUMOL5X1TIH0dXRgmsimRdq0ZCyAIzyeuJBlvuSQtjBD0rkM77bpjKowZwc
	WpzKZ2r9LrLZJwwTAViB8YNI2tHE8sHh4FjjF/5gH/5EBJ9yCVWwSgC8qaOYkAL9xVWFp4vT6fr
	tdTAIvbYKQeijFRDnbkqI5ggB+t2w3dUfy5ei67YNXHbDsbJCrfNirwuo5B1NdSwpUgC0ioB2sX
	jMQzySQmZzuHjiQCKvviNPfjXWKnxdsCzFr2VIOJrNVld9V3ePQ88VpAAtoF4uhKqePPQh9ZN1n
	aPHzuiW4R9VUTOJvYArZ93ylKqBzElq6R5sTs4WQeuC4GbryIe/U9FOhWsOirc0Ir/c=
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17282296d6.5.1746793827336;
        Fri, 09 May 2025 05:30:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbU6gmI8KLHNG4ho2OY5Av6zEE6Kq1HFOv+DgFV16MqINqCdZXRWO8sLBv9ZYej736PGPshg==
X-Received: by 2002:a05:6214:5197:b0:6e4:4034:5ae8 with SMTP id 6a1803df08f44-6f6e47bc895mr17281956d6.5.1746793826703;
        Fri, 09 May 2025 05:30:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc4f240sm1317373a12.33.2025.05.09.05.30.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:30:25 -0700 (PDT)
Message-ID: <eddc2ea5-dab7-4c9c-89fd-23ed20b85ecc@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:30:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 03/14] drm/msm/adreno: Offset the HBB value by 13
To: Connor Abbott <cwabbott0@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-3-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7E5kUfJBVQG5Bk8nQTG7uqA7s8LjifuUtU9VYhpGAhNqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PMAP+eqC c=1 sm=1 tr=0 ts=681df564 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=HXtwfQqbK82wVydd0M8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMSBTYWx0ZWRfX1nBxOs7MhtLq
 pgN2SM6fmXo2deGQ1ReFypKlt+TfHHmAsFRbVxfShycdmtVXOtdkqTB0S59oqeIeJZNqfqZFMGZ
 wFS06GecnVkw7iNN1lgTvX2XP+Gagi5yJBEzDb6969BFTaKWNJ4OQF5w1Vv6B+ZNe4GdEcVmedQ
 W7Zy2lMV+nble/zDD8kKe8IkHtEGAzNy3s4ih3iZz5nEt+TCLOqgp+I1B9kbFj8yQfb3Q+nJA3h
 oLkmaidQ3/B1lt4ePfkKXZajFlOEljyIDt+qdYLrLzhWw2hODneNnHa7H1S/5U7aQ4BqxYaZsmE
 9uCFGwpCHIM0PFd3HJGuCzAYH/TZzxALqTfdZcjibXhjTWXONtCwDRlONlO1OMJQhmlPEUyiGT6
 U5ddkTesSHRp7Thx6UZwk5eM3eShBt74xtxVA5rk5FcmAAkM+3PLIcHxXirFTWKzn5sTxP4p
X-Proofpoint-GUID: aCUFkXBYn3hYYALMHHfXsFMhh5y9vHfj
X-Proofpoint-ORIG-GUID: aCUFkXBYn3hYYALMHHfXsFMhh5y9vHfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 mlxscore=0 suspectscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 mlxlogscore=833 adultscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505090121

On 5/8/25 9:03 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The value the UBWC hardware expects is 13 less than the actual value.
>> To make it easier to migrate to a common UBWC configuration table,
>> defer that logic to the data source (which is currently a number of
>> if-else statements with assignments in case of this driver).
> 
> Don't break the value exposed to userspace!

Bah, I keep forgetting it's there.. I think I'll alter the mdss code to
do a -13 in there instead to make it a little saner with the future
getters that return the x+13 value too.

Konrad
