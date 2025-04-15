Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D1928F50C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744714004; cv=none; b=LJCmkfBeMy1oUD9yYXUXuqqQY7ahLiBgMHdhkFqxGKnatx5zTeU+jXUwKCQitfgFvVzU43s1uYJthhu/HgbccH620NNX3YXtrFs872G0nyojL4spSyLXU7jHyqKAQaoQYllaDLu0SgSf05bi5pW3hyhtAOx6bPZeaecZd6kEmm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744714004; c=relaxed/simple;
	bh=PqtFIuf2PaqgdiInwLbpBw6+hS8F+gVD8HwKtn8pZqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tv4yscMbyPJMxZ1RylUEPdCiAU2oOaIXlu9BThNJESX0XF5x86Q+6/B3SOor/axrBLMJFFVoJs1n8AWEpgd2nzcfk6P7GIC1hdUK78KJsqXHhb2VC2NyxCnDeUhbh8dXjjFp3KImb/qM5vO2/3sSB9XTcP27wYrDgeVmDryXpKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNOyiD2h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNOyiD2h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tKkS025188
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=; b=iNOyiD2hcr2hg96M
	9ASFPpBDQw1ipz6v9Qr8PRWugoiyrQwaM/Iw0KISVqHDi50wO5FRkGIIEl9UrhI+
	FEathVDNtemddjQh/4ks73KvYMIZqrzTZoDroSuo29AC/vZK9dd0GMQ1kmgEWNe/
	LZoldtYNU7AYXGdZJnSAGOkQOlr2DN+Q1NTHtR8X3cocd7QFyWkNrwjp/Uj8gsjG
	qD+3CvES1g2eUYQ7j6/eNX+CjIyPdgcWC2icr8vMjQwBbheHc3Za8x6RiWHmGLt3
	ERXojj2KBLkInbU29qYssg+whx52WjXLxSSGfUXGkDAQzhkP/+XSWBu46sJp9wwH
	Es72zg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69qs4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:46:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso11734516d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744714000; x=1745318800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+0K8i6mH8nJR7NC8EwJps6/hl4dOeR4gugtJgCdwYo=;
        b=M7H1+XLdq1Z5bVHM6GUVBW/1ip+uER+CsgS3sN1P+ZONh2HCGwJIdAtpmLM3MAjV/3
         VBwJZO8Ekb/bVN6VuneEU+cU75RWsR0Ox73xUetSS14iC/ga6X9TIqpNjwFDOJWSteIP
         vr38fp4AwcZs4YYIf+EoThC2QA0RQW0HUPLNn6TuS/Y2vng1Ln9uVRKqeh0cvONojbT9
         c4gj5ATTA4bVvKJ1zeaeJ+scP/UbARqnPoNobMYN/OIV88ETeexQP2MF/05hglVFrsA4
         Xo1rPLXOrqEihbx3G/p6JS4iRmNTHGaiM2vbl7uqziQps8fYY4XRVq3M68D1+OROKRg7
         KcrA==
X-Forwarded-Encrypted: i=1; AJvYcCU/HD/1JxPih/nCE0xC6JH4urMB58vERed3TuNXaW2t29kPN81fsjPcp2mU3EZp+XpngMdljDVLfc3GU9o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7LRjskvlQ1o/vXNi8zaJIuIB9sUhytvpzzgummpMONDJ5PfFU
	Ty2Zlx1hs1msoVhvDwHgbSaI4n+vmUZR7uFx0/KZstlOypXCGexFSNEpa3aDX3NWONSXvnzxFYS
	yE6vlEwxSeynCjcuotNKWuhUavQX1nO4HLl0yPse5Vj8VpD5pNo3jHKezkGtYUag=
X-Gm-Gg: ASbGncupE0qibZ1Wi7YxDhy6NbMxgxCgVXiUXqHz++00o6SQn7mUVuCbC2kdYtDnpeY
	Ob28pmW205b/gw1/qDvEKDMCIAwE5MHbVG+P03dXGxGX75K7MDHh7xyqYLBw2e6nlYbu4jNyIUv
	rr8BtO/aT1crKpzJ7ZpwGT454ZxpbcptK9xRej9c9SzcPEInP33ZKeKjtigw+WfUV3vtqkREfxp
	/1RH1fVL2L6f7SbB5Uafk87dO6wZsX6dTnm/iYYfRSqO+wBjo5wssDcHylDjPXCZmfRQYg8TM59
	+TYUhduCNU5YoDkOPopSmiNGyqgoxlFUmQLyCZI2F0mJVaFJR8PqEZWMVKbhSVF89us=
X-Received: by 2002:a05:620a:f11:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c7af1ce7femr829326985a.13.1744714000778;
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpAmwVNPIZNpwFLppeLrZ6G4WDCaUdR1j/80hoWD/jnnrt5XLNcypB+fTpoqwlb3p2ynN2AA==
X-Received: by 2002:a05:620a:f11:b0:7c0:bc63:7b73 with SMTP id af79cd13be357-7c7af1ce7femr829326085a.13.1744714000450;
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f505744sm6614359a12.57.2025.04.15.03.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:46:40 -0700 (PDT)
Message-ID: <99e9b4ec-b19b-4332-ba2f-6f932e4a646b@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:46:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] arm64: dts: qcom: sm8350: use correct size for VBIF
 regions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-17-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-17-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vd8aHNoZmNgeLYpwhIDsiQiT1Ca5t0ji
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fe3911 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=da4WsfccAxvekxWPt1gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: vd8aHNoZmNgeLYpwhIDsiQiT1Ca5t0ji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=633 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150075

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Use allocated region size for VBIF regions as defined by the docs
> (0x3000) instead of just using the last register address.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
