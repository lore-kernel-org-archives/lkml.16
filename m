Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F142B27CB39
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744364943; cv=none; b=biuvhwG7WvXBi+eJTTrDh8BQ5gpHgnF6g/ISSozrJJQZRMiYaU2GeeR/C1q7/zPgoReRaBoDDjzaiftJR2HrE13V6lYntm/oeqpBXSVZyAbzrZe6r0jVyB5/r8c+gf2GBOpudtnxExD8pycI//QqL1/v84LJGZ91SGaIBH+rGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744364943; c=relaxed/simple;
	bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dkAkXWFaFFlEoZXd2nyCeiZ9nH4QH4+5Kwe1TNIoIFysuMtm8whjMkciu6WO9WVx/FLXH2DZGEcGeXqefqkiKcBDh0iV04MihNIQon2wGEdXW53EsdFwuoyBTI1El0Er0J3St90V633csgwHkNhbA2seWxLZOr4/zVkWeE52k/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moQeEa2I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="moQeEa2I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B59bPh031979
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=; b=moQeEa2ISOojle/w
	/JoZ35u9aMiF2+p6HCZg34oGywaDgM3UO6AYsquLopCnm2ii7ww9VjjFFP+6ILWf
	1yWC6q24vXnxgxjQ1HdvUSFoWoMniTAKXLQenjw3n+7B179Zujl5ABxIQyNZBvHb
	FKsuGrlN+HAxQlaw9WhDATIC8yFlE1WrvzrFhOIxeJPBFk1+N7b/Hh0Tx7XroHrt
	SzmGACtbeVq9MutycP4bCOvwBrAn6juwgncxGlsrsd8v1kw8I9zFRB1wfSPpFPXM
	vnrVnTPxtVCU7Y2iXQ2nubr2mOfGdAswvuYdVe6buWL2r7RW3LegenEu7yxad+sW
	5DrE+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmhvxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 09:49:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c76062c513so40105585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 02:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744364939; x=1744969739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Cs7Olcf+iGn0kiLuKLVzTGFucVizSpTxlSXymspVxU=;
        b=mWMQLr/NDAEm1NEmyXXRRDq5t4x5lwYomEYYLJe/ZxmHx87W/ge3PPtd7R3SC54OhH
         +hf3C6Q9/f5AiwCKSkWYVEP6KenMtyU7tr8kE0SHYmDjZwNMNMkriMB6Xab1R/5Fy7w3
         k9aoKwbaetvQoF0De6TqtgO3G7MZ88rx2rLnaChqLnjvr5FIMd12GQU+kpcImZZzn358
         2Xr6yruUVxoxSUHwys8RoquTEgb/L5Wqs9eA5jAkHwEf01i4muRUfN4Jqfp9E66AgKUV
         RNbqgsSXDojT60jHkCc8MLJnlOOvlCFwPWpiDS0C5j4vVSgS/c1LWoNIUXeCpWhVqgoG
         LRNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm3LXF6cP936vzjaKhaXw4VTqMXMyiwmZLu88oB+9NBKeuzQPgvSaShDy0iPTngH6jg1O9a7sTFKG78zM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYco9BSNIPtMNXLE/4isvwl2jNfisXee6uU/F0v2SywSv1F29/
	TNKr1WnQl7eUNJCGP1TlQqxws2p5xxuh7okLMlKhqVIL47MY2EMbm9ecM1dm1grskOeoDhbzV9b
	8Ho69wn2DmtO970N+qCgBGb5rjwLlJP/ko/rftv2jlRKPh2zunLwzY+FMSHCwOZg=
X-Gm-Gg: ASbGncuzNHje9U49bUoUCzYHhpFAObaKbtJIt9npyfkYbJFDxyDxdn6ASBSoYCKQGLy
	xx+hrPEUh9nByKaeHlu8IKF4CUIyc2W3fr9Kf1MPjbLwOUviEa6lKbOXyK9GtVbi6BtPYsw5Zce
	hB0mZi+XBIbt6h+pbOafB6xCBV/0Vlz51hNB4pcb4Wva2dz4I5iuXWlE07PLzxQWWYh9BLN/mwW
	FxegHtB9BPAf2jeO7RRh6cy4a1kdkwxiMvsKMNosYqOVBg+p8buUPz4qfLJEa6NBuhazhZwMc/T
	bR2Dq+r7Q7VE7T89V0xkIFW+CmM7mCOvA49FxSNLndrFnYxUThuPF0JJpBIpB8t+4A==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c7af04c112mr120741485a.0.1744364939600;
        Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9uldhSMjj77tDXI8Od9HS0eE+YcyHVF3EP8I1eSD53hf5eI36oThMUSZZTFoT4LlFjZitIQ==
X-Received: by 2002:a05:620a:254d:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c7af04c112mr120739985a.0.1744364939225;
        Fri, 11 Apr 2025 02:48:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4204sm415022866b.116.2025.04.11.02.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 02:48:58 -0700 (PDT)
Message-ID: <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 11:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
        freedreno@lists.freedesktop.org
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9nScI5tJ8hPH3OzDXgbBGZTUlXafL8kc
X-Proofpoint-ORIG-GUID: 9nScI5tJ8hPH3OzDXgbBGZTUlXafL8kc
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8e58c cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ur0lq8UJKF3ET7YIcuwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=807 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110060

On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
>> On 09/04/2025 17:47, Konrad Dybcio wrote:
>>> SMEM allows the OS to retrieve information about the DDR memory.
>>> Among that information, is a semi-magic value called 'HBB', or Highest
>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
>>> and MDSS) must retrieve in order to program the IP blocks correctly.
>>>
>>> This series introduces an API to retrieve that value, uses it in the
>>> aforementioned programming sequences and exposes available DDR
>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
>>> information can be exposed in the future, as needed.
>>
>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
>>
>> - SM6115, SM6350, SM6375 (13 vs 14)

SM6350 has INFO_V3
SM6375 has INFO_V3_WITH_14_FREQS

>> - SC8180X (15 vs 16)

So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
the HBB value.. Need to add some more sanity checks there.

Maybe I can think up some fallback logic based on the DDR type reported.

>> - QCM2290 (14 vs 15)

I don't have one on hand, could you please give it a go on your RB1?
I would assume both it and SM6115 also provide v3 though..

Konrad
