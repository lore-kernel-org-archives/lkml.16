Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB906274651
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652334; cv=none; b=q/CK4BODXyqaR4ZmMPfggKVK4JPxnLzhfRuoB1hBW7y5vBX/eLQHcf+vC/uP5tfmprvXgwXbywUaTvjOisGNJKij6hR85s9WSpA1lePyiSPnon7dDEJBWgZV9Lx5DQdDSYeV0HhRYJNRky5eH+5bXtrsFsmHIHedH0sq0TXAj68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652334; c=relaxed/simple;
	bh=dt18pC1pgXdhX+AIm2Nrs967cIN/phk15KUSiKaaRqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSLQkcpgmqL6MljNeqtCMVhpob3NZ0+Yestd8SufgQYj4/eu2iIJTme3iBo080BS7dZPJGiEG/VRRFZoBd0aViRUPz6OORxUMEebSr4hDLQfW+hgF5dp/zFOjI03Qqp6xMepClkrmI4bFfkoSpCM4NC15Fv63TTpwNF0k3ibVcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nqPlFKgD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqPlFKgD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ixAm022845
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=; b=nqPlFKgDtcJTNdC2
	1oP9aMoBx6nrqnnJuWQmxp9B/vOaolIc+Y3A+WYU3zrGgijg7O9nkhSNFpIELShO
	rxdId+AzFZNx3mLnOpaf10IUFwocrgMhJxRzLgR0369oRH40eFekjitj26vqTKNn
	xaUCM9AOwRPNjO+JxEV5hWzbhasn/1x4TehHUSOdyPrRQfq+vV98NtLR8umWg0Vi
	01Jio9f9Xm341DOyopowtH4P85xG8AAXv4gX4dyYwIcpiaJupIzDj779bPoFMvSp
	chKwifU1Wa8wHIBtSlZnKdBOChD7kHB/maCTALbzBYUbky4IfNJoWpcb2cwSZqFt
	JbO1Wg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d06qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-231d7a20b31so28819485ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652319; x=1748257119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezwPMR8BMohMqjYrOQ8JruSRo2RSohjLEs2OJOIJnhw=;
        b=D3forgVRsNQDrVjtPbxFO8E5GBTggsa8JFL4plS4/5a5sLavYV0Ge3SKvUy4Q119kL
         5BGmcsiLlmLKavDqYOcV8e/eQm2iaknXql9NeM5+FU/M4mkoTDA9/cNd59WGUPfaqNHd
         i7NqDTMoU/iLN9rV6uTiTQSrxJRxDKdwPxM+ODOaUjWCT6indaQpsDlcPrHTDsmhNFE+
         gsBQnT5x9MKkH+3md1N16WiTlBrzVTy6XbBbD3Uy7SUk9LACVG+GgOaVx5DGqeaatCtv
         J75GTnptniGPuWai6yOLaSqSYjlPSqOChKNYk+eKQE0ZakITPQnsVbWYpI2GghuORwzP
         Xk8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXyyrCNOEL9HUqG+a2YoQZvPC57Y6rfa3xztD+n75XkTvoslToNEysJsMzJHZsBOdjZl18SZs6hqSRxS4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjQZVJETZmqeJZYiiZ7ru02xuMqyZtVx7kUS7DVBICIoEAV8h
	KYLkxWqOnAUi4AaYC5hiHc/7LtOmQ6yhoou7YoWDswzwaE4/Whz8ySadAMOKXrGjgd9TsKgWpCV
	SIWyFTIBFPhSNmvhhkuorImZqASnv4vUB/dT301u5xA2k2jB0brsAyk9VCLiTStaPI+g=
X-Gm-Gg: ASbGncuvpe2+GqUoPE8vxLn0ISq6U+nh0joLhT8OPOktmzRSFBqdxmLKNmxaAytdvDz
	tivZ895IMEa1vlQeMwT2DQNjQ7AgopLV5Ay99FPEWUiaFfkjcoIdlNvTuZu8X8oG6F3IySM78cl
	7WxFEd5JCSoSwAwsLVKZYiu0jchDIVihuk5IYP3d5vTuLRPUVMLL1RTOjpxFlFP7hLbexmnNe3d
	9W5MmrEGPyWn3/6sFfM5N6loDIt9I0d8f03vnSFndDbXzmnX0Fw0rTwXYAAynosUvXh8rC4qxdK
	jLbpAADqEM94viFRvkcgQcVpLRsMPnsSIbUrJQ==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id d9443c01a7336-231d43d9bedmr164170425ad.7.1747652319372;
        Mon, 19 May 2025 03:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3EdjbB0W7Ag5YgVP4lwZ+LArL30OC7oyQH+NM/5K3jhYFi8kBt1aEKqOsDIaJb60GH8INTQ==
X-Received: by 2002:a17:903:17cc:b0:22e:5389:67fb with SMTP id d9443c01a7336-231d43d9bedmr164170195ad.7.1747652319028;
        Mon, 19 May 2025 03:58:39 -0700 (PDT)
Received: from [10.204.65.175] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97db8sm57252635ad.110.2025.05.19.03.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:58:38 -0700 (PDT)
Message-ID: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
Date: Mon, 19 May 2025 16:28:34 +0530
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
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX3sWqbndHctf9
 KHY2BClitajbqofPhjXV1BL+R8n+jKyaoRxl6aZX80QcrjYVMErQsAviRYnEFzBxEOY2+jHeiQm
 b4H5vsEfPo8qyELaPZo3EYsRyWM8l6xr3tZY1N0pAZIDI6VNGooQdbX3XOcdJRTOrkeM2W3Yde6
 F41dUGNLo0XiMr5bO48xKYsCg6BXnP8VtlrfnHq+XGLe8IJQa9XDNYDqfbytIZgEJzBA7xIrV01
 Nz54i2IFSgJRyVk1dBFWDZw0+w1VaI27sk1j50osTY+RukWFQ+jn5zC3m/0WEB3AwxQLCwmKJPB
 eeoYkGeeZ83TY9lhEfDawSBhgqtUXLf7ktwiBNdF6wDg8fG26mCNRKHsrqewpFff4cVVsHb2b78
 Cvak/EBCro1qvwPpglhK6/ZYcDM7uh9V4RiL9WgaWUsZLh7eYxPgi2l3r7mkQdIcmOvqZqpX
X-Proofpoint-GUID: evEZipy7b4GqrA6TSi6Q9m4sGHR121Oj
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682b0eeb cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=zJRMy9OeSTis9rFUpe8A:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: evEZipy7b4GqrA6TSi6Q9m4sGHR121Oj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104



On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
>> User request for remote heap allocation is supported using ioctl
>> interface but support for unmap is missing. This could result in
>> memory leak issues. Add unmap user request support for remote heap.
> Can this memory be in use by the remote proc?
Remote heap allocation request is only intended for audioPD. Other PDs
running on DSP are not intended to use this request.
>
>> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
>> Cc: stable@kernel.org
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
>>  1 file changed, 51 insertions(+), 11 deletions(-)
>>

