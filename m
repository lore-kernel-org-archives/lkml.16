Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472251E50B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793916; cv=none; b=tM6GgSBZIRJcT96P9IfucQQ1GdTks2I00/GsQZKJM/mBMwFLWOUs+L5AYEAGPJhSh0FLtcfnyU/01GvX1TdM8jzvWKa57JLPm/N91WWNOuCSMoyjK9AYUMHiFce5HxfF1ZOskpvHm9AsLlNLI+QTg0E2FZ/BEwXI8/2QPysne+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793916; c=relaxed/simple;
	bh=NGYvgxpdJayVvCDzXfX8HEx0HoGX4wz+UZYjkP/kR4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vEqZv3Hrp82s5kYBUGnA4xebx7KfPzt6QzfIT3yfntU1Ldh5MGF5PZBPFrOFYe0SYQbbuLIR0mVoz27AEGXzZ1HZL0GS76aa68tsk0TljUtWNFlrh0ETPk8y+qw+vh35Ui/fm0R/JIMAkITXbhCNqjyE7fjzu1g6N/UuVuoXwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD0l2v+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD0l2v+h"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549CUvra031737
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 12:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=; b=TD0l2v+hKdxbfgVb
	/RivV6WcujA3/LpI/T7ypy1YKytqRt6KRVq91exRPZb9sOjot68avQj+C/akVD97
	uenXZvm+8eiehYGhK7YvMmKup1HZokDrZBUNlLIRyXJ/g8IZndTfsKkZfMitrvp6
	5I3luqaXB+BAyWydhTVZhwHlUfNysY281JQHmTP4jWCaWEafW/+tWJPB7l8kF/0f
	WeFE+zM23dpTujtVKqSI8wA0PT8y4+a9mo4YcGfqfLS59ETmiHDFggq7ObqkcMHT
	2vgH1Ke09XA30aMtDDH3o7I+3H1MqjYPNqNrCelpR/Zsw+nFTA7X51y6NF/Tfg9P
	gGMjjA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgmkwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 12:31:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47983a580dbso4247101cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793898; x=1747398698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbH4xkJ037sHmWJTr5Z6OLwNV9LiRqfb5T0r82ilyRo=;
        b=tXK1yn1C6L7vQIhGjQBXnoybVYal2o+K4zSlJZ9ahe5h7mXx3XiradvrHvK83Ha1eZ
         gJa6a0gC7t+tvgpY6Ez8wFKTOYqlHdyYJK6HHwBV8IhXAKy110qlUHpuvllnzsCoOi2c
         RGIC6qb3Lt/rZTqIZRWHRut+FSfDOS8b8qSzBPGUZbj9jaRk4JDluFb+kAHrMb2Me+ZO
         QPRaTvBZzRe30+g8s8d2h3OJwHMGDtuz4bi03bs32SnQi9yLEGZT/UONl/uROMSHplUI
         KU4+DC6MS0W8qmQcHV9aOmCR0LotbzKH8t+CAhW1bs9sawQ0rk0Ipqj7qyXe7B3zcRyT
         siVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsbUvtH5LmRAAxhcjHj/ulqCBZZWODm5G+VSkYDNjepsCGxhI/VZ3GRvxDZ3hmLBOgvOUrHSAAYXnhfcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgq58/dGiZE2wiULysVxZcIsruBVrBAtG1lFyX5VkhGtNwpfmM
	655S+0qFpxGVi34dRmbuhKYqx7NGgCb9MsFFpCsQSttNYZJIamkIhxX3/+KdXWEfLwabu8t0OOC
	7ixDO7NTSgjZAlDc6VQIlmIBsUBpTYJyn+BHGfccK6h53X6ZSbTbQUPdl//mQvdNmiJyj/+w=
X-Gm-Gg: ASbGncv5F9Q2AunIQyBXW0EquzuYMvXVJxVDIk//7cktVJJd1vyuEm3NtuQuHUXLmBM
	x2/GAEugr1fCUktH5BQ6G5myJVVTEL4xzGoTUoeBzKF7CKIytF6Ur4xy2agc90XH2wsm6eUYv/6
	VAF+D9/ka4D5rLLW0UWmp2xIVJjS4E4NUA/cw3xRl3+gnYy9iAlQFx4GCP4++esEl80cQtvFYDl
	vqeC07Z7gfkwuzvKhGfj9eH1+eJL5kKLVhKUH3ufQRIQ3zx+1PyTnJA4oTYx1wqtCtuV1rvU2L/
	D71g2vcw2o739fka3iXIRYYnd1Fw4HFxMS7LvIFkxpSAPN19kLLht1urL2k2Vwr5ziY=
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49452621f26mr19121081cf.0.1746793898381;
        Fri, 09 May 2025 05:31:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdKIea1lSY3D/Rfo8iAPuqf50b+VB1CNMxYngayS0dUO+pp0Ywod1/ouLGCtIY6ZrJN13yJQ==
X-Received: by 2002:a05:622a:15d1:b0:47a:ecc3:296c with SMTP id d75a77b69052e-49452621f26mr19120871cf.0.1746793897859;
        Fri, 09 May 2025 05:31:37 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad21985b026sm142384566b.177.2025.05.09.05.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 05:31:37 -0700 (PDT)
Message-ID: <2cb9a1f1-7283-419c-937e-5eecbe65f982@oss.qualcomm.com>
Date: Fri, 9 May 2025 14:31:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
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
 <20250508-topic-ubwc_central-v1-5-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CACu1E7GrdS3m0fLcnOW+v-nkzRveXrzVw9PzSb01duYx1aifSQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681df5b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=RZUx41kZHZKgpNmG730A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEyMiBTYWx0ZWRfX+lcw20U/VnBT
 cOzpOi8up4p1QTgCwvREoblmtC8SCccs0PiczboBkdKuspyXB3+ud/XlQ3tddtayr4FcasEDDD+
 aiXWpNhu2ruyrpCqVR/y6zUy02iMcwgwSeJrGD4UKcYQ4JYerW/oDEwofb9WIm0Hw3LJFsQ+2M+
 k8BTG+NjSS8AnDD50k3SrdGYvEUKnOtEEsqb5zJpLzzOZ/YFPEaifngP3Zc/yy6kYgqF6z85gu7
 9FEbvBJGAmp4I4qj/S10Bp+XnsAGN34nwK5zcnCn7loOX3PjP6ShBpOGfMbFVsI2tF/duDAmq93
 Vos50f4WhKb+qo5cLTbRz43n5FBGg3VhU8fXC5+DxZdmcyARTsq0RCubJNQLP5jA8SrhGam6/Gy
 ezmxUj2z7t1Jzmd4jUN8IvCIWCO7xkbZwjfhqKsCHPxkX1Ks1MZxEpYnQRe0wBpSLOan+ikH
X-Proofpoint-GUID: A3gf_zxxZKfaAPrfxKYF9HtRozZ23E7N
X-Proofpoint-ORIG-GUID: A3gf_zxxZKfaAPrfxKYF9HtRozZ23E7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=824 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090122

On 5/8/25 9:16 PM, Connor Abbott wrote:
> On Thu, May 8, 2025 at 2:13 PM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
>> as a separate field.
> 
> For these sorts of things, it's probably best to add a helper to the
> common ubwc config header. Other blocks also have bits for enabling
> AMSBC and similar things that also need to be set based on the UBWC
> version.

Good idea

Konrad
