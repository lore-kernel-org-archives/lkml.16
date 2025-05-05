Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AF25B1E0
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454737; cv=none; b=qC8otAlfMdxDP8+I3e1jBQ94etsdrjZgO2aAtoN3aWa7YZds4+Z3qNRoYr4AnxEZhF+yDVRQ7guXrMWYL3O6iPIsyeFbkUPctqmDQzdYIrC8sfOOZAkCY8TnQuytWo1wEZVnjj0AMUoLBTd0s74lWM2m1mlTi8TXKrG7714ZmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454737; c=relaxed/simple;
	bh=3Vf+AaQhANAKR4iErxV8pfkN6oisAXDi42nAcHc040E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnk8OPmCcJoVHNpHw0T/W2pEuStIjb24s0rhiGuJpwKFzHMh0uDOFkGoq82ebqnsP9uradyBu7YcTN91OYzO1WufJCMrUagMqwhVtBf0UFM5bqP+FuaQICqsRYpREEhvNIT/53O/8jjPvNBCYCQXK7sFiU0apTzFBKULb4OBWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4PAbizK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4PAbizK"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C7M3F011348
	for <linux-kernel@vger.kernel.org>; Mon, 5 May 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=; b=b4PAbizKQdgKo4Sz
	hAnB7gq3XzspJ7yxkI0rAfW/7gt8MI6H80NV0PqEJqNV3uxySOCpIdYv4a0kcI2M
	g1H+XyC3/zZ8nd+XzuT6p7yv5WQH3G5GZtwy8+MHRWRMP7nTsg1OhRLVB8Ao2Q2x
	LkOtxTrcjQC+ePkmFGRmr3CN7it78qUDiXOhLLNJydEezJTaB/wbSUgoAEn3EOEG
	rKFYA+c7uVYVYrRyokY177Tx7LL2A80L42El0vWjD1xeGlYr1oHgT2qD08MrheoD
	BeqGEQ6MFyy3CrqaZ4pB2puT0olee4bxczYriQ4HokKGlV5XmOK/jOHNeDjjVuKv
	NniVyQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rvbnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:18:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f876bfe0so765800385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454734; x=1747059534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=;
        b=eQglBNnXWhEt8UyKISQVpdp5Fz/uHXfK79iDJiSy8T8Uq9G1skVfhFtZrODiNS0N2C
         qjECQZ54ETt/FTWeDTg5QZAP7QemwBsUUw4eNl1D/kAHVK3BwiiSS+f4hkxPWS2ajE/W
         EjLsbw5HdXMe/Ty2zMquPzPQ1/YW3AR949847kmIurpx4aO0DNcIS8a2LqcMAEkJUXlG
         DU4eSJJruU/Tr6V5FltGFEBk0Rpy6PiY1L3rgU5pm3+cQls4qpifjXNuOvoKbAkTLh8A
         oYNcHKZGAzE4EThvyEyui8ajdGkrgt4IjMaMPHHWGDt1v/QRuFCCqzk5+1Yb1vQECmxt
         z1lw==
X-Forwarded-Encrypted: i=1; AJvYcCUQyYxAaMrrSwXYIUcVu796+k7t2eSGePCeRJswZpN5dXM59gge/maDRQlahOU8y+e+4K3n+3+OBeZr/ik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpDIsQ51ex4EobE8MrNNrTQlHb3zj4ZuzfX1cJHCBJt/U5wNil
	39pBwWV+twqTHWcBQeRQzCHJayL35tN+oaXXhH03NHUCRqhGnRQkDQr5rIHRWNe13G0clsnQA6m
	J3DLvcaxSwP/vhrjk2HsdVkrzh+PdvHB+TaeGKJWbcVaElQ/NIZmv4fgkt/On+h4=
X-Gm-Gg: ASbGncs5kCGQmEn2Ep5zZPAbuTaWsM/6ymPkZvazqeNSEOgS/IhLo1+poNhrBwJ+FHX
	XqdusHROzTsRlAeP3bNYqVBU9py4IEqCU3VoWbgf+6+GzD6z+vUxcD6jKW6J4DFUvqeTngizNRa
	jYQLFZYhVp+9qdFUm3sXyzh1/2SuE7K8RM//5xFncyCCYdeBlO8SYDz2xtKi7ygHl5JOOZpBBjj
	47O0j4ZUCKK2wGadopLMC5NNkljokGACjCi1CAn1sorFUn6BkbsvA4thnk6yppcWlG8K2QulB8w
	V4430hDJXRHUipT/axjQIfj+6TU8fjzftP8CK+eRGCAeFYnIOuXIyQ17Lkyb+S/OZcO5mfA4ht4
	+Mu/YjN29ITRUuiVo4sc3zfrTJjozP07qH/YruimIOmPBe1c9yIljb7nazeBOM9hdE3AT
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528028185a.30.1746454733819;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLIuDmlMk0BDjjG/jcKroZx3ooAtnxfCFD86oCFhHuF1R3mpWcw+w7OoB3Ift4T6LrXoRzw==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528024685a.30.1746454733441;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f2043sm1707308e87.179.2025.05.05.07.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:18:52 -0700 (PDT)
Message-ID: <4a186d4f-9966-4569-bee2-77e237cf0c54@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Rob Herring <robh@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
 <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eDDly3x00_eeBSDSMRT9Lbb5rNtxN3pB
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6818c8cf cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y8Lu5Vov3j2QtJBI0v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: eDDly3x00_eeBSDSMRT9Lbb5rNtxN3pB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzOCBTYWx0ZWRfX3n9SCvzAddHk
 ZgqaX1rDO4yF375/zql3aWVvy93DZ0re6j4Q6hQh+gaBz254pqOh052eFHu7go3se5MNXBWtgNP
 8GhPR1UaT/7NybS/NGXOOf4aL91oN2SV29pclfaMCOqgrt17resPGvHR12c2ohBG6I+3pOmz6kj
 CvI/5jhE71aW6LqzXX2Q6Oki3qALhD1dCr7G8LjsIDrdXwIh5vSTRWwDupRhPWxmX/PIRs7mxaT
 xt67DrUpJ5okeQ6kLydh9rV4C3r7p6L3rmQQdDDcCtRW/nXgMmjaGiPaNEM0fVzE4faGuRRYwNq
 yaWn0mFhQWGAk13wjzkiH1875SLVt7PO2JYpzHIsVLlz+fy/nNXS2dhuHBzDAPni/TNMRI2PsRG
 Y5U8ngwa6HWj3fbHP9ybGp64EgaT+tlC6BV6LlV2ADQY73jHN5vcLaolHcRxy7XNqWSysgUX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050138

On 05/05/2025 14:56, Rob Herring wrote:
> On Sun, May 4, 2025 at 11:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>>
>> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
>>> A set of not quite related bindings warnings fixes.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
>>          https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a
> 
> And now there's a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
> ['mdp0-mem', 'mdp1-mem'] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
> [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
> 1, 0]] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

I've sent a patch fixing the issue, 
https://lore.kernel.org/linux-arm-msm/20250505-sm8350-fix-example-v1-1-36d5d9ccba66@oss.qualcomm.com/

-- 
With best wishes
Dmitry
