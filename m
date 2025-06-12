Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B9C6BFC0
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749705620; cv=none; b=Kxzo1s0P2kbkz9vvDoJtL7Yge68VOlnT7ZuX82WyxYC53DMO534nbtuU7NxN67KQaVNXU5+n8yCpQHtlc5/F18h4/hjjAOhuO9iVNvEc/j93ntAl+b2IZqzHOaxgyg1KfApAKQPtwJMYvYYraAnzre8uh0i2aGPvlpNz9yp0Jq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749705620; c=relaxed/simple;
	bh=SgShnvbxYvOe9ejQemiO99fJ84xPVKpU9m8unTXLRdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvI3KPmCV4RML0LcGaAGUn3CoQxig4slyZk5UdMi94nnSy7PwHwvNsZZ3ottgaUhrfQpPGOvvdu3u+8xGKDxa9QI4pY4I1V4dyzVdtAeywoX7YSroeazBX/B8YSLHknGTqVwYnuLoftyZvsTlj0sDHCDGrC6ih+noPUVdwc2VJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIsEVmFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIsEVmFL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3sraP021496
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SgShnvbxYvOe9ejQemiO99fJ84xPVKpU9m8unTXLRdI=; b=cIsEVmFLLuUkqwWQ
	OeN4SVH7c+fBoIaBZ5LnOZcEnpBUNjaASOZCo90WUHqp/E+BoEDTvj9VwPN5Grtr
	KQrsYxeP6qKX0xAlmjwz1DdJ/pkWXd8VuUqphMgXh4Ng800iJFCbl6kn2nknKx+V
	2iXDqqE+1kI/759cc9VDAajfARBlkyT/mVBLK3JGnBhMVrrEmIk7+NpxM1mHEyop
	ZDXOn4OdFPQ/hHPlLwWPNcGTqaMNIoWTMMvaV4OWCxrJxdSpKzaBw4tXDYMEKEtq
	Wm9E01FSnx/5/bTWtt1s6tz5MT6IO0mC1MzRnT2NBJ8JOvzzA0DciiBPATippACp
	/S8LBA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxyhyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 05:20:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7377139d8b1so566315b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749705616; x=1750310416;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SgShnvbxYvOe9ejQemiO99fJ84xPVKpU9m8unTXLRdI=;
        b=C8ttUkQ7pTGTxD2l4oTTKa4bLT/Ot4wNEogeymRUjxCh/4IHou63Z7Mw0gizidQWqq
         DILySAo8pZ3cELXZiBzAaFShFJ1NIfsl4fZUzo5iZ7z0IRUdYXbE9LKQjk5fRIZaBsCc
         qC809JLtQY+LNbtTwAjSVL3Rifa4xTTdgHm2/iLtpo1+SJqsCgvzgVtUBm4TB50T78fc
         J6Qk2pQJLozxxBVHTNYknRw2TUzO/ISW6P0l0TTDejx7u7pN9TX3xYuTxIE09zSVHyE5
         knJ69jMGTuDkNTxmx4GEQTCf70XbuKX6GGcECEElcRAtLl/1dEEyZXT/XkMDA/8uqbS0
         zmQg==
X-Forwarded-Encrypted: i=1; AJvYcCXZpGh0IUayEdIEYMoMNVX9DaHtrGIZ2Sy7XQ1AEXCNZaMiOE+xvfXA1mjnF2rwildgZExQoOG0yzk4F/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz/MrDiIO4scKFzKcN7X/b2u6IfC9VWeFzsRycH4WI7fvY6RJd
	Eo+srixggwtjuknAFyeBea2mmx6Nc4ZNlEVa5AOb3Lm9tidwaOsrIuyP0GUml1BavCHtHJvwxHB
	YXh8eUALeGFvAcsxmdRM/9kmH1GbCW03d+ylLKSoHRJj7KOSLIs2FvzIRRK9c78V8juc=
X-Gm-Gg: ASbGncu3we8QsTlaWjTYJDf2VmyDjyYBpk6aOmUMCLf4s7Kb7LcQp/0RLkZgPUDlO/R
	9unP2iHRADsTatxilKW88xv21bTChtRAVKyFvhqgZa7Oxjda/v5BccGlT5uuihvZaMGAVz/jILx
	eTfBfOCzWC6wgGUIZDDRD9tbI2xL1WMU4oOmdSSPl3zciFsu2nCWoqy+sn2Lk1yw82Egl8jAnr/
	tytXdyN6ZGEQnEp8y87tXwVht+XUmuVMDxDiulc46JAGiT8kReSo+NpHHI0oRmfiMzoPJatLci8
	aMsMBmU1v345G7DiwsrgnIjdYxVzDfNtTIXaAL3Pjh4PbW168w==
X-Received: by 2002:a05:6a00:8ca:b0:740:b5f8:ac15 with SMTP id d2e1a72fcca58-7487e0f4523mr2216970b3a.10.1749705615892;
        Wed, 11 Jun 2025 22:20:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqs1m+QLoDS+x2lBJsjsDDNIg8J4sHRXwm/0j8jv4uUBZesEksjlKMxB2tDesABKn2IscKXQ==
X-Received: by 2002:a05:6a00:8ca:b0:740:b5f8:ac15 with SMTP id d2e1a72fcca58-7487e0f4523mr2216931b3a.10.1749705615442;
        Wed, 11 Jun 2025 22:20:15 -0700 (PDT)
Received: from [10.206.107.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748809ebe56sm536054b3a.135.2025.06.11.22.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 22:20:14 -0700 (PDT)
Message-ID: <f3d376cc-6e2d-4ac3-88f6-3104eec67acf@oss.qualcomm.com>
Date: Thu, 12 Jun 2025 10:50:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
 <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
 <61dd2c3f-20ac-484e-8a45-f42fd5f42b86@oss.qualcomm.com>
 <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAO9ioeX1uE3ty5oSezYOLJKqf8G5dLYAS5nRiNvryWTk0RPdEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: h1fQcMl50yv3xrLuNrXwxEnKV2OK63tR
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684a6391 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZxPKgs51gy0u-eq_dnEA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: h1fQcMl50yv3xrLuNrXwxEnKV2OK63tR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDAzOCBTYWx0ZWRfX8rKydnEkGmHF
 yZZZOV4lZhWvK0O2UgmJQgibtk9NvPWOCqGyMrAzUED8huPmLlnXyHGTmzumLthAaLcikX9eNmb
 pgQayS8fCoxdR+wJu2PZfTFxyk4UEQDIGu9N+422RtcfQNRF9+FkU7mrNIzJ8yJ1yz5Xx1TVbvh
 X+1pMXiVF18VeRGO7fdFvUdbUWIi5v2sXmBh1/AiDsyTA/+FYCTD9f8f15zKmQBLJEw6CCgobBT
 w/jMATWWihkaWy+bWc7/+B7uAXIU8MzcxHra7C8x1zqVsHSvoMXGAbtvzO4gE2Ofn+UdrUq9q6C
 IxEjWqe5w3TiADThndcTVDfAcz1HGGiJvf2aB9fz4Bvol3S9IKGnXUmAu+VOfI/FOY6exh40FOR
 dVGUmJQUGuCG97CvW0PSg9h/u9CXnGLRLGk++N/903YqB7WkbLDkSkvwSba8dZHD6Kjdrm+E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120038



On 5/22/2025 5:43 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 08:01, Ekansh Gupta
> <ekansh.gupta@oss.qualcomm.com> wrote:
>>
>>
>> On 5/19/2025 7:04 PM, Dmitry Baryshkov wrote:
>>> On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
>>>> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>>>>>> User request for remote heap allocation is supported using ioctl
>>>>>> interface but support for unmap is missing. This could result in
>>>>>> memory leak issues. Add unmap user request support for remote heap.
>>>>> Can this memory be in use by the remote proc?
>>>> Remote heap allocation request is only intended for audioPD. Other PDs
>>>> running on DSP are not intended to use this request.
>>> 'Intended'. That's fine. I asked a different question: _can_ it be in
>>> use? What happens if userspace by mistake tries to unmap memory too
>>> early? Or if it happens intentionally, at some specific time during
>>> work.
>> If the unmap is restricted to audio daemon, then the unmap will only
>> happen if the remoteproc is no longer using this memory.
>>
>> But without this restriction, yes it possible that some userspace process
>> calls unmap which tries to move the ownership back to HLOS which the
>> remoteproc is still using the memory. This might lead to memory access
>> problems.
> This needs to be fixed in the driver. We need to track which memory is
> being used by the remoteproc and unmap it once remoteproc stops using
> it, without additional userspace intervention.
If it's the audio daemon which is requesting for unmap then it basically means that
the remoteproc is no longer using the memory. Audio PD can request for both grow
and shrink operations for it's dedicated heap. The case of grow is already supported
from fastrpc_req_mmap but the case of shrink(when remoteproc is no longer using the
memory) is not yet available. This memory is more specific to audio PD rather than
complete remoteproc.

If we have to control this completely from driver then I see a problem in freeing/unmapping
the memory when the PD is no longer using the memory.
>

