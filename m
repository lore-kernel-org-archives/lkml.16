Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170AD2566F5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341991; cv=none; b=C3Ulk1K+A7Qv85Z4emHC/azvylOOuosRZmsw7uufoyDATnV5Ezy5faFM4x9huobDR0L91QNtVUndvkX7REhXvv5G8i97bLwPWmcLLmlX3d93RsevE6O9ewWB8/IAoQTX5xv3IsrIKd8/QdkArROL8Tr2yxcQSgYRRjR9DjpKz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341991; c=relaxed/simple;
	bh=orS6naTu85AKEnJfe89l4WIdi88qpbgmbGoyfqLfYi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiCaa92q3/3kFgzGVRrQW01m6yQznI83WZ03p6fsunrhWjKY1mOnAiGZIDGd9q1cAGG+52NkaCH7lIXgHQvsHvosD8/l5Fr6JZe8a3LcyvEdKbEaeTJ3+T6mwmlVd0omK0waIQYqnzVQvos8bYyKLg68Y439n52OLjDf8tRnuGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hvF79/2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hvF79/2q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R7iKlq027799
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:33:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GVSa5TyFULpC2g1pbka3bw5G/Zxf0bHM9jfUTPl9ru4=; b=hvF79/2qxLLoKwOP
	5875/eDnHvxydQpDbWKUI6GvwbLSK92P9GY3ly/Jc5zi59dK7KmR/1sGLpS8Yio5
	6nbCaYdFVqhh3kXABUjPHx+9c/rn4ZHpwe/nFOZv95mYqSPSUVuYa9iR4l0HFyWA
	37Kp+eVga/C07rfj0R1YdwHVWP+7/xFSG7jOxkGDCmSXduGjjiteD1YISs0wgGKD
	uvngDp1k8Ij32XYtTOI0QEVTuduQ660kcIDUdC+LFkTihpyOJPKqYWkU8mZRRBRb
	sUaWku+nC71t94QcstkLrPHBtY6t3kZ2FnvDApmyrSztH07aquMLvfD7m/Q9C0vu
	I4JzxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992gfn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:33:09 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6faa0435aa8so8595906d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748341988; x=1748946788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GVSa5TyFULpC2g1pbka3bw5G/Zxf0bHM9jfUTPl9ru4=;
        b=DA0wY5XKkFz3/x88eg4NS8uayHg9/zJ9lIILUYWPxnRacNeQAu+YbWcykpjyQrDCHb
         JNpPBl5jOWcMt7Q0vFuF6eO8BXsz6P3zEQCiWx+rIPSRwv/lVSetEJupmi9KyvstboYB
         oAa5MsFWKlVcRmGeubtGmGPpM7+ypU8Oe9J7BN81g6LOm5e20YdQxae8XtAr544yQ/gd
         hNYEIKq+xutiszY/ehzzKlrQD75+A2mLv5/hi1nVpB4sMq6put7v8vnNXyt6QD5/f0JT
         gk2ybr+rEIls+ZCYhKLXrwrFkjoYWYi3JFWGsbfAU8Zj6QPErcivR79df8hFt8plj/EW
         zLIA==
X-Forwarded-Encrypted: i=1; AJvYcCVNAGpKItG3Cc/kJYq2RS+wuOGN9wz0XoBHPNEYIz2dYp/CS2lLw2X7tvq0cHzmI6jEk3mKuOaadgvLXLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjLwSsx4RZJYwYvPjzV0NMeRmZSIEEBOvQlQ7vUU6xc85Hds1f
	o7PJO7svqwq/IpCz2eRqRVsiRpwL4mOA7dNkQG2VJdI1FsKCl6HWF3898WQG7kacH5Pm54NXydW
	6PRwq/wEnYhlp8NM4aMX+EeGxRXMbOlkUEZS7otb52qhWSylGP0B7Y+kyqWB/gNtLsvY=
X-Gm-Gg: ASbGncv+3NucswlTK7p0/66ZJpUhcFgZ2FB9f5YrYv4WDL5e4zdVHorFQFQ/S7V87Kl
	1lT2II7Oej+8eBk9yai0tBuCNa1NRmKccSm64iKD3whDNkQ6UOATSXMcvtQpVDmAxloYbgyRN5F
	mTy+rU24kF7GQ61PrAhpYn2RGsZ4MVCvEc/t7I1kuPGPhuSSTIZGnNpAbPPpg8OBMM3yLLNU3Qn
	+MFL/9+h5xDuX9ZeMB02lBn+YKkep9S/+hrT92gJa64VR2NISK35gprow4LbMbBUFxOMcmj1T54
	yTULCzRbrMeTbqQB1pjY019ZvDw7h+TG0UqpjZkuDwM29SVSOJoeITnsVJLpWIYVWg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr72941216d6.8.1748341987896;
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJSSlpTDFYDWxRvDO2PO8VMKZpkqF2yx2SQnwuybT0OCxg5u7Q/jhHeEqb2VX9nRjheRGEgg==
X-Received: by 2002:a05:6214:529d:b0:6f8:471a:9fd8 with SMTP id 6a1803df08f44-6fa9d28fd01mr72941136d6.8.1748341987473;
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad88973815asm127933566b.129.2025.05.27.03.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 03:33:07 -0700 (PDT)
Message-ID: <49839473-58de-47f1-8b2d-cc994cbd6488@oss.qualcomm.com>
Date: Tue, 27 May 2025 12:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: remove unused reg
To: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250525152317.1378105-1-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525152317.1378105-1-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA4NiBTYWx0ZWRfX6AHBF4YUafkX
 Are0LU+N7UforfPXewTFs1S4PJEE0fszjs+QSAEhogUKTTIJhqDwDcL56q3YA+QEmCgdAsq2K+C
 3Cb0Bxp1GPvSZ9ogQw6junk4U9CbLsLuZO/F/g4mjgyEZ5cwHi55EC8+nGuwtrlh3owpv8d/Js3
 oar2s4omaXr17Mdba5p3vr9hMiXv8v+lVlS6vO9QZ7LqGz6nyuOvF8fxH9wtCcV8/XtjWdpyVCJ
 sjivQIAvLGKZS/igAlOFBepwNJW9y825GftHnj78uRl6IvJUw67gQ80yc09jlsE7dZkyNIsmqQD
 mCXyGSYNvrBB99KcKAB0FFIEfdKE4pLMUE45LHAv6ILgMTwEgkUxLzdn37olJQH5nD/WdWNWK6J
 rCGpvdy4/qgSmhRWs0HXJV7ZjojqLF2nqnUz0SzALTe98T1f/yMxXlUunBaOtSdqW0PO8Ywi
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683594e5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=kyqvF6sjOl33UedpCx0A:9 a=QEXdDO2ut3YA:10 a=Y3S50wn-SOoA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 25is1talgBkuMK4IVtNPwbp6i4ew-Xpa
X-Proofpoint-ORIG-GUID: 25is1talgBkuMK4IVtNPwbp6i4ew-Xpa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_05,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=813 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270086

On 5/25/25 5:23 PM, Pengyu Luo wrote:
> <0 0x17a30000 0 0x10000> is unused for apps_rsc.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---

This indeed seems to be unused

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
