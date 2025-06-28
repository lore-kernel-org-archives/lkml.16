Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFD91DFCB
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751119350; cv=none; b=kzZS1wmz0LWa8CfIFFWgRkxySRp6gEtHvrXh551H0aHocGvR8/AtJcX3GYLrma5mu1Kr9mpEjR9k3X3bFnpZ28TeI0wmBLUBygbRX/Von+z4njYj48UWBbKtRW8u7WLSoBgxnMfBaAdLztjpnwn9Df3wVZauVOE4uGmzz34nhjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751119350; c=relaxed/simple;
	bh=76cTA5dhjIgLc0kQ61Km1dduokY52iB0ODeYTMZIjfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIW7WoqFvX0FSspU7bKfKKxHMhc2s0TtUhZM5ZEMh/DkBqz4WJZwQWU3c/DpIcMCaHwshiLE2KF5gxs4YhQHdCee5OZF4kZvTItlmz82bcNdOQtLsZvNFaFh4R2Vss2WUmOCB7dCB2IpgQl9BNsKGAc3RZbZzTEotupwCuNt0IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f1+cmURx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f1+cmURx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SCKXZn024526
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=; b=f1+cmURxwE7I3hZo
	XnCzpKbvRVGZOaw/EjpkGt11sm1MaA0EmbfPcbg704HmTDv3wIXLOEvsrdZYk8Ei
	ixrkP2Gp0Fdbj75GTOjYTWuViSDGtDncv9iphEwBkgmBJHuK4GynMBHuG/6FAgYQ
	LCDVuxuOKKewe73j6xCDEV5SvatZgecZHf6h63IEHKzqvaf0qHtvWX8tQuPgzXGw
	eMkaEkFO1QfS+PGGlINbngjnNkvtOKg9jPc0CmOOYq0/0Sjg8uXu8737S0kfbe5a
	Jji04dJGjc3mPqxLt/BPAUMLdAe0AdaQRWIasTWQoyIeBKpoGuNqa5gxsPhfZDpl
	gAPDiA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm0rva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:02:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0979c176eso68756685a.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751119347; x=1751724147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUVDKJVoWS0hkADGlcPQRi4yplUlvInid/KHKpX5DjA=;
        b=PMRyN49Uqg7pM7sta2DX1YVHBnQigVhRxMTISGXiegi5cB1V8b/fJoeM/r0H4oGhsM
         /cR5gFn6HTazgEM0zKNoYrtK2UmmqErTyydYBWhCaB/+QvkSi8fMaIzpthqiaJS7NEeC
         J3w2FwC3TMOInCb+lkJ1AcX0imv1+Mu3tDiYQbxmS0ezegXVedrI+6rVdai+lHB6+kxC
         iIaOTtpxuILFlbWJBl216MdbogrIuvkXyoy2V4hL0qaEMtfIOZTNK4GEi1JVAse0Ts+T
         K7to4j2C9OzqvMuyiQHwKHzJ6BtTH0sRnI0H08FULM8liE3YU7K4DkMq/53EgEptkalh
         J8DQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNClKnp0rWYIOlC+LJxiWabhgNU7ioP/UdyvhWaltKuGYy/u6TWY+a1ov42cJALXb0CGJ8L5oRKA6KtWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKLhpth1mjXuyXvXOoqt0QkQC7X9dkDYUj75G+1xNh5ws84yA
	szmEMPXIPnewEAdSQtsEmprLHa+oX+gru/+xsXEtPj4stYZYppmwUVzOUUfcN+nvdPPDxJLB72U
	u09gRAwFd1h8LE2GlIbnFBHWnG41e2GOsNKDT/yCG35w8SeeLIUcHsL75KvW2wqnSwb0=
X-Gm-Gg: ASbGncuOdCz2RYfBfzFc+px86euW83zGAO1JWIHifv/tvREZmAkfFapjEYi8D5eg/wN
	+7n2ur65LSCc/YdeUOk4plroKjaMBAZdjP2fkjWlJ0/xkM5iEt3+Hr/yNZ/fRDLujjkhDiAw253
	sObuVuu+30UVe5hmiMyJMMVfprkk2HF2ZFUSUQxTmkaA22BhqEDxcdlGeeKtPu/l6UMm2lNcvsq
	9LLpZBH8ep/98lGamVYsrPKSfqSYARHiHpA1Inou+SPcbUFmVGlxOfXsSjcRHXxdZVVbt2ZaTLt
	2XLguecgiR89Bl8t94MRvqgxsEjov2X+zMthr+PawQoAREUov7UeBf7FhiqI97yssKIEbCZpowu
	y7do=
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr159330385a.9.1751119347081;
        Sat, 28 Jun 2025 07:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7wuqAnLzb6/uFSg6oL9C//BE7uB/PxoedUfxOubcNg8iAM3IahQGLP9T9ZqdE0mT6FVoRNA==
X-Received: by 2002:a05:620a:2911:b0:7c7:a574:c6d2 with SMTP id af79cd13be357-7d44c26c479mr159328085a.9.1751119346578;
        Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353ca0fdasm319419366b.147.2025.06.28.07.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 07:02:26 -0700 (PDT)
Message-ID: <7b7c970f-f94c-4b38-9693-65f969b992b5@oss.qualcomm.com>
Date: Sat, 28 Jun 2025 16:02:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display/msm/gpu: account for 7xx GPUs in
 clocks conditions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250628-rework-msm-gpu-schema-v1-0-89f818c51b6a@oss.qualcomm.com>
 <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250628-rework-msm-gpu-schema-v1-1-89f818c51b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=685ff5f4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=fA9TbEmd_Wx33vs1QK8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bcnzsY_SvbSFKnE_0laprAhH30DAhSk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDExNyBTYWx0ZWRfX/MwVvIijvwbs
 lg15rjivAsxqYUKmrsAuTWCj6zsOOkggF4NpNEPWR/zPDMYJUQpVdaGOAIGF+yiknbTPHR9FNuo
 Y+PY8AAkIp2aJpVVcFBD5Cw7tfWXwPCrzInLlgPgArufOJyr1xJ23PjnAoz2llQB6CeWbbZ1MTe
 tQ18vJkpOAeorW8jOcGhh7CaJxCjLNbvCHYB+kDGiRqtmxQKl97ey6CQ3VkXnfPXTh9GCDX4BgN
 C9Gv0Ja4rq8m3cRZC31KqAq7o+nnuszKM1QjuPVyoH8aQwnTX/iuBr12bsQMgzv7l2Wteh9lnqA
 Iis6jWnNYy4WAGdG3zAWgT2ZziKai8QmkrGQ47DjQO18YlwYns5q/w6kV3ZXoqFhKiAWxPCEElz
 fno1DXFYCCjgT5YzNg0PPxDtCXHNoFyn58XV7f2p/8gnzDizk6E90FQzPqnpJQbI/hyoVfrs
X-Proofpoint-GUID: bcnzsY_SvbSFKnE_0laprAhH30DAhSk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=747
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280117

On 6/28/25 5:02 AM, Dmitry Baryshkov wrote:
> Handle two cases for Adreno 7xx:
> - Adreno 702 follows A610 and A619 example and has clocks in the GPU
>   node.
> - Newer 7xx GPUs use a different pattern for the compatibles and did not
>   match currently.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
