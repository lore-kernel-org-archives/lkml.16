Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85D7268690
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213801; cv=none; b=aqQI1e76M293u2BoKSom9glXC10XX9quUldwB+fYT6uD/jcQVt94A1qODTeJw9VZTqwbKDllrUodObXHPE1bRDLZn9RjFSdZbaAWojPAz8iP5hpUIeNNZwC/p0eJZehDqpkhHavJ+32mvCynJ/LpJaS3mfHkk9SKxWoePWp0IIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213801; c=relaxed/simple;
	bh=LCxmsUkc1L4qyYCSGKNDRxWncAmIJpFPTIKKf+qZMpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hc1NFU+5U7U1nE0sxsT6VrNSyiLm0oFmGI4SRhFyxXFntdDryo1kA0twbQ5v1PsKSNhRlZ3uPi3ZfgQR+G8VkAgrpdxsR3yBdrEN4jWlVNIPk/BBt69sFqDgHJpmB7hF7FdNWawa60rDVxCaTFRLbjjpxU3/EVZLBwQUhbkkBA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crSzCxjW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crSzCxjW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398qxWv002547
	for <linux-kernel@vger.kernel.org>; Wed, 9 Apr 2025 15:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=; b=crSzCxjWuljA7YwG
	3hvyP3B4qsWxqr+qYYgK9MlYP5erpW2GWyefuR1r5vpHD1cy8I9TWSE4Izkf0gVi
	9C+SZeQhcibQfmpJupsNlTbcXJC64QGCnttIYzLLBtWXRou5/MgEvypCqYO6Jh8B
	WW5QqllGLB1y4v+WWbjs4KMz2Hs3OkrkhjO7pRUqfKRCsNXcPJSi6Oo0QGqkOjea
	/imDrzNxxhX3QrN0yoE8jeojpfSpdauv+mF7J3E/c6wjMSTNOIcALw66p8Oc+xIA
	YhYeInXE1V7/Wqyyv3Hqqs5S1/QCgdCH4uJBuE0LZI+wIp7vpA8P9/r2RGgOs2qX
	3KN16g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1ks6x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 15:49:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f3766737so16352446d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 08:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744213797; x=1744818597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OfB1diTu8S+2+IjYQiq6NxbHo6UapGpX/p/Wbz6Phn4=;
        b=rluJltAA0Y+n0OcTGDSQk4ZBGrNMra5L646Z6CM3k6xQaMqjXlW1Pu3lBee+f8XbyV
         gTfx9lK0Lhpc/rQ25S1LIzcSbMi4iRkbVb7Si3UsMUOqaj3Mvti9cytaFH6B5uA1w+9Q
         k6AkEyGlKojR+ixmq9S3FlUGOpfHVA3JD1PJ83fQJ8MvG9Nd/39EO2a3G1ScGKkqnk2m
         c/XUYY2CCApFfTk6DIHHBleXDUv3COoukWs1FwsAmZkwjrj3ypFn/mHxOyCThZnr03sT
         7aMayZ8S5dtbbvONVL8CXO9xzS9VLpSXxIS//U3324VUpPPpk/rtl4bTES8PficE9qyM
         obhw==
X-Forwarded-Encrypted: i=1; AJvYcCWOoMSJwpmqpaxCQWg1egkbII/s1nttrbwvc4AeTIsTBTF9R0qekUcJEhDvLfrn3zErNWrtt/sqtIhJSVY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgfSD/zhUqWWypT2glLdskZ7m1V8VgIAXhy6c9SpNpmAjP2/C5
	dQlUWqvLXapMnY9QgvVtprUw0FVMSipzfTn8NWeRUGRxnstMTdFF5I6OkAHNvtAPmnK1hPJIumV
	fObpbHJSmjVvU4XXZNL0A+iSpGiHtJJhkFdzbMHt0jcGbbZ+xoyitnFDhZrf6rg8=
X-Gm-Gg: ASbGncuRPN8N4sz+ZZD+ZJlImKZxDyXCJj15IxurHHqxEAXkJ2bSURVDOQuuphdMdwq
	BdoutURXo+l11JJYQzg+PBL8TI2WQrG/E5Z6SUXQ20v0cC0ggbqJpnhcrQkTDfgsvSCqbNputcC
	4Mvswy7jV/Hw6q9M8bSctwYvibGSQhVRU8FwQb/ka63WtipU2m7v7Uju71HZFnYilBdYDM3jigB
	9mk6dcOiUYjYewS7SGJIWxKcoIgs9ZL+CFjjd0Ph0G6hJXak/vYl3OEM1n49B7+OiOYcZOx4bYI
	LoqgOAY/CxT+ke6cLIsCfQ3oJyC7+ev30ZIYx+jxvNegi6yvQeH/w/drM238F7dfag==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7c79cc38a2fmr170375685a.11.1744213797592;
        Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgLb4SIntY1KrRW8OaT6UF39Sv6qcj05/CcAG4bsBVpRe7H1ghDwXTdXn925CoiQqmrP0N/Q==
X-Received: by 2002:a05:620a:4148:b0:7c0:bd67:7dd9 with SMTP id af79cd13be357-7c79cc38a2fmr170373785a.11.1744213797214;
        Wed, 09 Apr 2025 08:49:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm117214066b.98.2025.04.09.08.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:49:56 -0700 (PDT)
Message-ID: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:49:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ax2ohzkrIzvUEixUt5BHDKRvKPNzOTu1
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f69726 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bKdCaboesIjPuyFXCNkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Ax2ohzkrIzvUEixUt5BHDKRvKPNzOTu1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=540 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090100

On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> On 09/04/2025 17:47, Konrad Dybcio wrote:
>> SMEM allows the OS to retrieve information about the DDR memory.
>> Among that information, is a semi-magic value called 'HBB', or Highest
>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>
>> This series introduces an API to retrieve that value, uses it in the
>> aforementioned programming sequences and exposes available DDR
>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>> information can be exposed in the future, as needed.
> 
> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> 
> - SM6115, SM6350, SM6375 (13 vs 14)
> - SC8180X (15 vs 16)
> - QCM2290 (14 vs 15)

I believe the easiest way is to give them a smoke test.

In any case, unless something is really wrong, any changes made
by this patchset are supposed to be corrections

Konrad
