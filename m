Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA6C1C3C1D
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744260595; cv=none; b=goLmJC/8X/Q6x/ZUnscMwUCjWYHP8oGf+Fe7QobSWSPcZy4itQ22ffBlPIX4KMZtCsA5/Ueno2psiComfd6oULuXp3MxyP/tIx4sBL8VaoXrF+w//NFoh+LApp/udxM6XWZSu/N+FQn7Gsl24NQBeCYFoV/Xr/H3J6OKBtCTv6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744260595; c=relaxed/simple;
	bh=HJubsNTysXTSg4uK/7vFlSsmHsU1JS438LmRfIfFBYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7HeJbxR/aByhav6/SVewpE7KG7QtXcjt3RwB8WjuNe39+C3btEpRHoIx/SYu7wJzAMpcUR/1FjwNZEfQxfym1M5T2/PTDXsYFb7bei0MpAqWOA1O+ECfrV5YwNIO4h1BX4sLsJ80HzdewCMvs8YXb84Gyd9NLTQ7nu5SoHaSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIBANVCA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIBANVCA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H0JSI006744
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EBe4h+OgQF6wvfsXVl90BUY1
	oHsbYsSIiyiB+HhoGsQ=; b=aIBANVCA2GR+yE21Gs/xRp5QKXTryJ9pEofLPOzE
	BKPKb0IC0+u5SlPqHWRg+dc97HSIqFMsvwgI5/EgHX63qd1csdaDl252/hiNlWCk
	4cMODLt7/XFmCyWSRMFf7zU9PUy0d5LNBXHUTpjtYUJEl0pJb6DdqwlqYScLQFPp
	kZdvaQ3xydV8lV2WvRJAaRaxTixgmmklesbZlfepoiR9g53aYZsutxaX8WHv+lko
	Y/kIl8NCz6zNlzc8L4zT/6x9IJQb/0C/W63HU2lHv2I+pKBuO6aXpGkEyqtUWWto
	Wp+9gwov5mql+hFOhuDcry0DzPXwXCdk2rzYbNrRhfNuxg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3nkmm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 04:49:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c09f73873fso69740785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 21:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744260591; x=1744865391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EBe4h+OgQF6wvfsXVl90BUY1oHsbYsSIiyiB+HhoGsQ=;
        b=GXw0VbbUJKxBNXE3NTaM6rbqRnEHlDI6XVLUP1QZCusU1vSVMygSqYpCGlrLv8BPQF
         ziqkEotXEmrb2O8IiKOyttagNXEPW2zxQIR6pOADO0h+ihcfkiTAFO4gsHFhFiNVmfeC
         kgfIeD0u+zwGPZQzzPkdlMjL4m56gdLB1lxpcT7E1a4dEv+x8Fx78JiCkbFZfT0XnE/m
         l0offhfl/5gmqxMmQQfYQ01UH1NWQXOb2cFMt8M3p+ttrJS3wVt0kBwfQ02b7C6dEv8h
         iNMmGIZGrraK50upwkuszejseWU3pL3nk3CdrS0tDNxAPlSwj/vLyFPg/aZ1MKncHIHB
         SNvg==
X-Forwarded-Encrypted: i=1; AJvYcCVHokvmQjjrc4mh3nyYmft50FWUh11WLZIrSN3vh2MW1/54PXimKnp/zvqTnzAEq0f4LphuMxZKDIzNp3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm4YD5nh5ai1NrHS/869tI8pja1xQZJ2ETQx2E2tQ3jHl2WUd+
	lMnshTzmSvR0vxCIPvpZQY8Akaq2RpDx/Zmm/o/lLBsrKR97WMdRV3A3XPbpg9RUpI7PZ5+nvj6
	Us9bpXfsYkPel6KnBcLOpaiDkvNBWVTnRJVGr9OSxZwzWnffLY1jlzkXCdeUQpaU=
X-Gm-Gg: ASbGncvJ5DXH26JbyJiOCy95if95imUoeoijS5DGlXYP0AepYIjCsnPxTVrA+yBAyb9
	2YSnv+HXRXc9WZ83zIcfd9SkZz13x/t6WFen7uJ+VKu4A+Yq1CLKPrzSXEzRWvMNt8l3QKLi+4V
	y8OUYZJeQyRmXWuVpGWi6b10y8Nsp7hnB3q4P3TDTdXVKPi6MyoskEitA7LiE+mtY6qO8Fe5yzp
	yLXZDScPbj9MdT/pPKBrrlTpviT4M0cfuSxfdbMJ3CUFSntLkhPBvk8IQ1bRoFTI+7LWOSHTgkI
	iv9FK+u6IdO+Ce4BC5xdFHrXBXPN4TrHo0S6EJESPRrGG1JtLFOiVqGhPoSUKRbcvEOSBUnF1KU
	=
X-Received: by 2002:a05:620a:394f:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7c7a76d0513mr192039785a.56.1744260591135;
        Wed, 09 Apr 2025 21:49:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFck7/LVrUqvTqOk8GDKtlJNoq9VvB11DSq0iOs78rjGlby6/VccIdHdBwARgqpjy/7DrynVQ==
X-Received: by 2002:a05:620a:394f:b0:7c7:a5e1:f204 with SMTP id af79cd13be357-7c7a76d0513mr192038085a.56.1744260590818;
        Wed, 09 Apr 2025 21:49:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d51051dsm38905e87.182.2025.04.09.21.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 21:49:49 -0700 (PDT)
Date: Thu, 10 Apr 2025 07:49:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-hp-x14: Fix up BT pinctrl
 node name
Message-ID: <dyfj4b74at2hr5xftohn6byfa3tzsr233y7wmgf4aums3hjnax@2lgotcdl37x6>
References: <20250409-topic-x14s_bt_tlmm-v1-1-b159395b7922@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-topic-x14s_bt_tlmm-v1-1-b159395b7922@oss.qualcomm.com>
X-Proofpoint-GUID: 6R39rKIcm11oXTJzYRNIGj_ZEGT7sy6k
X-Proofpoint-ORIG-GUID: 6R39rKIcm11oXTJzYRNIGj_ZEGT7sy6k
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f74df0 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=9F8HMpmrTCUkXK7qiZgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=697 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100034

On Wed, Apr 09, 2025 at 05:00:00PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The schema expects all TLMM subnodes to end in -state.
> Fix it up.
> 
> Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
