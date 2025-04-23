Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087FF201269
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745410909; cv=none; b=BSAs2BqFGZD9yXOsQQd6aUJ1ehqKZEwQ2qp2bybYaGGOGWzQx5yGAJxYJj5RXI2nIfAwNoTxze0ubLa/iilqK+0lnLBoOQ1ma5aQi0LS+Dd+O0j/oa//oyHb1SFCwD5o827v6ZWU13MNfJ9ZjaM8MPWPLU2mHaiU946qSnGFJCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745410909; c=relaxed/simple;
	bh=yUlmQngLWM95uTbYGzUfTXaf2KiV+RckgPCq0lwW5TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CtwU4WMToVRWmMJGuu5RDgHYxueLWhwm54oS4KrwrELcDks0u00YKQ5YZSFznyslmBBt4mqEzSnssV9lZrGRrITZsitREFu+x3jk9K3qAcOVQj5YcuPrdtsRQHdHDaDGPA2TJHtfgUrazZQ6dfk2+OJnqL8XiADxlEoTYagU5PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iEfdqrJv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iEfdqrJv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbiu4024110
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=; b=iEfdqrJvitZsTSxv
	xsGCnrcjXPQ2IcWoKVAnGGCLzDRIk4aNsh8+XceLEgtJnBHzppKtkd+PX0XgPy+a
	/OkacEzWoTkABAA44fkCf4sbZ/umnbmaBjr7/E8pFzFzwflwenKcY3iHtwqUFxX/
	yy0NRf1fuFuESEyfU1CJv+pyi8cY2grdbFYwBsVJFg5uFktiiZz27uPCFdI8S4YY
	y7xfEZfaona7VSXAXKXXC85waLtsZlL8PLEC+e08Ort8NOFMbtsJFzywu0Plzmlh
	rZnTjZled51CzoiAENbgJamTBVAMIL7HsfGVDN46I1QOA/BOXBzkQJ5GUysx/yKR
	IFpN8w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a2mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 12:21:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so141167185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 05:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410905; x=1746015705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEy3BB74MydlFE5SvSBjX4VOfZhaorZTjCn7mz9RhEM=;
        b=X/7UkS6ObbtrYL6m+S5Z08EOvEstzwTln4wHEMvL5FumhuE6NaWEyjTN46XQgzj3vS
         z6TCn30sUE33zfLu1EBLxCNRybRuWXXPGcRKaBM/J5IpHAA0FeneIaQCMgKitHed2WJF
         wC+vz4WDhXpHCK1xlITIQK3f76l/H/FQ8ECGCmAMfOgKMF7coz0bp11kI90+lH/jyZSh
         lTPIFfzH36nTJdxRUKjYt8QDaZGvx61Km3BP3kHnKubLFLsEQqdMKcx4PN1m5FSXkn3A
         dKnileBxLDVXr7LV8OBb/ZFl3cmrsMnHDZgvRXCwkl80WEZRxJ4VK461K6n39qwiJnyd
         egAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq0EQwGTIvtQ0M7kZH4TxNTsynN2qL/WWZdLNuzl1jAQt+3LRXopS5y5Wm390xRsuqAZhwXdkExggZE+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH2HGybw1d1vI8FpD61Fh+bvjVcNkwhpNMLq7/J3kaWgbZWAJw
	7FbWBWeYiCIupBn17XPTJjGklwYeNxQ6R1MWlK2kZE2nSECwnZ0jlO63imibZIXwFaZcjmx4EMR
	MR7X6t0GfysCFGHJ4/otru9UKWxMy/raV8Smc8wSqjP34fUzyBEZECLLFZa7gb7M=
X-Gm-Gg: ASbGncu2D7As/tK5BadQUNSHhdwGo1b9CBtBEf4Hp9NYLIc2kdB6puYEa0AfdGl/Mp3
	oXel3S7m9wIfa40HLgyzwkB72ZsWBWpH91KBvMp+yl406YutWbOD466g3qLKCVFl6n8RTVLJwz7
	vYUz3Bb8bXklu8eBOh7F2I7Tv/EgHIhJHb9TK1cqUsnYvaxj9RGQPnjDUwMifuudN8ZrJKk78OJ
	Ghk4H05sIv59ikLrrYicuJ0T8Dx+LJtbDQNyG8+8/yz4cDc7Bvb0XW+1oHJkuvNvi26vWnRBzYc
	XUjACPH+Vp/fZSUnhby3VijJSI9iEn8yMy/n7c3Kb9uB0eZEk7ogHj2KSuTVwLhU9IU=
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7c927f6f902mr1108010985a.3.1745410904999;
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXBbDZMwLarl+zI6FrhIiRzh9IB3F9PW0wtQy5FUQ3y8e0F2Y8/CQ5HRXpH8vW397/Zsevcw==
X-Received: by 2002:a05:620a:318f:b0:7c0:af16:b4a8 with SMTP id af79cd13be357-7c927f6f902mr1108007685a.3.1745410904673;
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Received: from [192.168.65.183] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec4c622sm786854066b.44.2025.04.23.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 05:21:44 -0700 (PDT)
Message-ID: <ec7b53a4-0321-44bb-938d-0cb955e64397@oss.qualcomm.com>
Date: Wed, 23 Apr 2025 14:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Anthony Ruhier <aruhier@mailbox.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250419-gpu-acd-v5-0-8dbab23569e0@quicinc.com>
 <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250419-gpu-acd-v5-1-8dbab23569e0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _fFtzIiVKHzypuGiYTlrpqbBMzAIP0av
X-Proofpoint-GUID: _fFtzIiVKHzypuGiYTlrpqbBMzAIP0av
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA4NiBTYWx0ZWRfX9Zk937dLwwxB QrlEQsHLCipRt724+rKZXJTJG95tAkZOTeFqnhR2OxTjQqNft7sBXidF+rD30ZeAWHuEmpPg39o ohluW7BDhB5rBTB+ZQ8dE+Z8QopWTRixuuurzKm3zRlQqZroHW1s73NyjdzVQQwW6Vr4TxsdUH7
 3F+eHVk+WUWnnU4kM8hpSR6GoPCo0Sd3ES2R6DES6jI6zvxQEIaQTFxrfvWAk/mHEuGgWnEgy1i BrnKIEHxUfWAQJHg3Z83IuoPcbJIHHCYgofC33cXBzHlJAihRuypZTK50ggUeEnuIvzhV2L9l+V KWEG/5KmwMY9SGibbzL6wZe4F+1u6avekgdD5rJFz4bn4ELUbCQYOL67+m9K9ImkbApDfzg33zr
 YTfD/o+HhqTVeUj95hBMIkd2ArfNKTcslT4czKRHq0//1V0gqgKl2Nk8grpcOAM/qsbKfcwe
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808db5a cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=rNhkmTvpKUHMLWWBcFsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=960 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230086

On 4/19/25 4:51 PM, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Tested-by: Anthony Ruhier <aruhier@mailbox.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
