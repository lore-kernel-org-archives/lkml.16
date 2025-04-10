Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AA26AF3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744257120; cv=none; b=T2+H5I103zeH7g5C27Eq8NVVTB+YlQl13tYrMTKNvvFuQEDz9AmehT9QEdKMVoXbpCDQK3AmAL+pLS3WA7cVwe5NFtW1jOmHFK3L6HjVtxeJuqNeoKlBqfS6wZN1+4AplGfLNDuEYEjVpzNU6WbRHJsK/8eEtrMLOChpiw8tJ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744257120; c=relaxed/simple;
	bh=G40xwuuhEalaAtAG84j+mCKLB9Fl0PM0jvfPEOlJ9G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y60eDrC3aD8u8/iuXwlPqauyF/qc9gaQWJc807ScPHtAqsYRTSnGsFu2Mc0jIwvKQNVdUa7MjV1EcSSBjjUvy+M3tKtFAwbTl2mZViq2bM2qHNph3GAwsJaMtQ78blv4qdHoBKEj+tM6YBlxgnqiLZ0wZRdXEbS4siK1bHIY4z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYpSxRfj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYpSxRfj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539IGVpo010468
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZIvhTGg/PtZD55HriLCLdOKV
	idFTqZ52LaSgqOaJPpA=; b=YYpSxRfjdZYDuUzVK+T24pH9t0rIRm/Jh1Nf9ElF
	fTwLhRVXnOt0bH4Ub8Shil2RRBgkWCCIuuMX6zX+/fEaxcOTb98azuNalY71oDHL
	dZzwjeItJiCk1BKH2xaW/d1cRJNFhD9mC42PDddVXOWRRb4Q47CoieIekb92D9eo
	eGIIrdZP4orb1VBcHDDfBw7lsTuntxR9CsuZkqx4vKf5kiteBc2Q0m7/u6kL4qOa
	dscyT3I34VLfnRyPU8XBWQbI8MPxjPEJ5PPyLAtzBWoz9GtNu1EMAXvKNxAK1q0z
	G/TI0R6bAIfBS+yp5rGbn1rUKHXLvBYzc7zy7jn5q34FDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftnbue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:51:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c3c8f8ab79so78632385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744257116; x=1744861916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIvhTGg/PtZD55HriLCLdOKVidFTqZ52LaSgqOaJPpA=;
        b=i/9mPzufEFnOZs+azSgQUtceCT+mqJYpmXQ3ARxb59R1/icF7CtzknNIIOV8iCTglL
         +aFWdtfBTDbnuYSxOFJzkCDCkqB2JylrJQvlI10XnwGpiATQ2xs3YD//U2XEqcoDrn6a
         UzxJjqWDL/+E/XiFlzJXeltvkfrgJcJhsga8HKUdpC/pvWUUzmjny3DOW067vGq378X4
         Q1iCTjVudEnhYUli6iXNIJYcGdVOnA1jiTeCznn5TuqgUukYncvk6n6acHqSoMZGgCQx
         plvALm335eYKXE/TM5GvvsYLOswSSsTCrD+YGpZ1dGD45OpkSFL5uQFiAYROgErFTFlm
         fXuA==
X-Forwarded-Encrypted: i=1; AJvYcCWFBh1LCimK2l+pnd74XWPmpQ3HYGJrdok1VGtTSDRVtWwCGBFKm6Z6UlcgyFJ6geOPAFNjGRaKnobjAEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx4jsrnFJYw5vkDrqUtCGTvU0Db+AwQIoEpWiRCp4f0z9Tz+hp
	HyU3GIh9at+PWhoy+DMAufTd2X+RPAfXEMNzlj2u8/52wsrdKDUvSNuRwRgUK7ItrceJ21saWX8
	pOIQQFvktgUNocA8HDCotzxfYMPG7eLsNc4qHGgzdJljvurSqla/9umhu3ONEovU=
X-Gm-Gg: ASbGncs5W/kma6a5ogDTEx2Sa9u1WzErpBH0SY6FfitEnOoRP9rGxD754AyJgGU0AVY
	DuwLPxLaD6rUCgM7Mc8GOhr5BwdjTk/l8u324dDvtqClL6+jrWZIQoxFJN8NvP67TyI7Gji1EKU
	qM500NDR6Za5Ldxka7/QC6vFHI9zjozjUQzSuOLQHqPv0eVQOH3+Qsdz1/dZWXF9iHAAbeb565R
	K0cRSQGAxaP8NjyNuIXwAkUUKOE75gkQPSaoTuS79j8VyU/8PRa4oPWZ7ssdpYlxYPgLBkBO9ns
	36JPTKTEnG1xarQm0m7P7JLrBYvNqp3S6kjx/zXZoHa7p83C2poyMZf3O3dXnHFo9SRmPDjHobY
	=
X-Received: by 2002:a05:620a:430c:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c7a7654791mr194627685a.8.1744257116364;
        Wed, 09 Apr 2025 20:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjUtZgiODqub0LOS4XW9ZoeqBCnVVTAHVxIcf7QAzzKM2/fq/RcPifjbgDnTwXsLNvS/I/cA==
X-Received: by 2002:a05:620a:430c:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7c7a7654791mr194626285a.8.1744257116020;
        Wed, 09 Apr 2025 20:51:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510b73sm28262e87.185.2025.04.09.20.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:51:55 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:51:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stone Zhang <quic_stonez@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_miaoqing@quicinc.com, quic_zhichen@quicinc.com,
        quic_yuzha@quicinc.com
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add a PCIe port for
 WLAN
Message-ID: <47sed4fhrqqtjfa25hp2nenlcw5jn3s5ejcb4mw35agfmpol7y@cncy7tipi323>
References: <20250325075331.1662306-1-quic_stonez@quicinc.com>
 <20250325075331.1662306-2-quic_stonez@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325075331.1662306-2-quic_stonez@quicinc.com>
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f7405d cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TBYT5JYlgfXD-NVwRcIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0NjwXKNdkW2vVQIWmWYnXeGUC1SQZpIM
X-Proofpoint-ORIG-GUID: 0NjwXKNdkW2vVQIWmWYnXeGUC1SQZpIM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=935
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100027

On Tue, Mar 25, 2025 at 03:53:30PM +0800, Stone Zhang wrote:
> Add an original PCIe port for WLAN. This port will be
> referenced and supplemented by specific WLAN devices.
> 
> Signed-off-by: Stone Zhang <quic_stonez@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
