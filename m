Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45AC3FE7
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826818; cv=none; b=LTwIsFEsmHU6PBqEWT9ux3XVqewOZeRR5dZR9bqfkuLbuVqWIFGa3T1MLe/XFEtkLpE6o3EduktZfl1wix/QPnY0ItXvV9eOakzMLOkmPzwAeApXpJJkX8bYfIh2mzPi+ppeYpiPDRSyKSVpyFlSdBGvxo9OGcDj1pup2sYM9EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826818; c=relaxed/simple;
	bh=E4CkMZvZn5O/HFg1JTR/nxza/gN3m2V4wLT3hJV+ghk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDCRsFz+r71W1L4QmksLULQRdxjdtZOR/6bc1eactr9HKDyB/iLTtWaK232YLJxoZ/33x4mCL1luyfSnO91Zh0G7sHEKUbQp5IZQdW08NyIBieYGYJr3o11WdQEfR+XM0+yrR8XgezRdrLleGPJ8YgqwwRkyW94agmW/GRc7rBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zrbmd/yq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zrbmd/yq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D06ZFg006737
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RIoq7TQNFr31va//bRfEh+6W
	CaxxSdbEdo/2Vwgk598=; b=Zrbmd/yqIIBgBE7q1alslX9otWJmxqnOvxqIlsoI
	+MzWPJ526slnGZ1+KfyTpSrfEJjMgzwcCBJpbQjTUv1/TsD/hMDvPwiaTurNHMrp
	V7aVbLpTdXeAmJ+KHcyDFczMWxw2qXojueJV36jp6Bii3rY7NVEzY3w4zMl8WGJ8
	bNfzxou/bCp+R9DxYv8FQHOMWqd0GeZPLqNtKuqATKtcVzCTsTu3xypCdyzjT8Fb
	RDxElTisnPd+b4DCBgX/1H7JrFH0Cl4iEO9OwoGvWPAHPP5+yU0N0XmeyQPFswMd
	MSNgOdwodI09tgBijgTWTJdr3HkWOnQJExAW/1Pjfe96ew==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2yen5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:00:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fb3466271fso38692276d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:00:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826814; x=1750431614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIoq7TQNFr31va//bRfEh+6WCaxxSdbEdo/2Vwgk598=;
        b=ZChCg7whlb80kHDkOVwJwwzHP66DACkJ710ZIFUzXJz2fd+VJAw9xkBI3KcZmLK81V
         ZXBCb19kxNbtoo53wOhZ3pV6rv7VFzTGI+tpg0BO2Ik2aBsOujqg+52t+Y6rEoSzYOqs
         dPn4DAY9A7R85f3U1vp9t+2Mg1HNwycK46QVWpTV1sJjTTLL5r+Y2o+RE0XMamua5ZdZ
         OpRdgX1LGDgXRetgkZtFdalWHcApdP4ghBd4JmZkARGt6kakQc/bAolXlFCDSRTJqQbh
         QNtVhpMPcXTJU72qeZ1Dlkr8cRAthCxpU1VckZTE7eLN0hU1rQTbhsrJ7wVxTTPdVM4M
         NrMA==
X-Forwarded-Encrypted: i=1; AJvYcCWrJMsyzCVCi3hYXTaBP8e/lPDf6QZNBGQUzYzfcdb7iw6GUmCZGVZJzYqm4h+IgHWXKvUudd2frB6mipA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT1EIRDpxkNT50Ii3ZGAIZgDWBeU6CiWhCGKzlL76F4T7hi2dZ
	FxfrB8aTtsEmMHRSwAgyZzo8IJXtNFzqqlvmwzE9kO4q5LgUQNGtWSjh6YzgeZi7dg0+6/pTLyx
	G0quV7W0WC+wqjvylEEbzAapY8nMfYUNW9Avs4OOGvLGZ8IaDWlNEUxrWiwX1PEX1E/s=
X-Gm-Gg: ASbGnct8pC7fn6ud6mqcnmVYrGs9BIzKaTHmqeZ/UvzJQ1xrquFlqWG1ntH+FpGfoWq
	X94ouLHrV6DDhwmZ4cu7twKaOUV1bShXLlpaUKYNV5I1xjr75BLMVsTe/kqvNkSE29YEiq+cLYb
	wJhyezEb43RAp23cCXhABETyWsUdF6BOHllGVzu31orJ/7Op/HkZXGUcOVOrGayU8HEQhM0mKf9
	qKa4Sx5uOIE5EMa9RXFs8q7XSm1bcTx4c8Yq6CsGgE9uOkExXLUmPTrOa2IUMH3YiR0IIQNLqpR
	vNw4sJRkKbyhhFl45Nzl8kULeUaju4+CQUEeKv3Mp2/TqHEBTcUmYCf2K12RTgm7g7rByuAdGLP
	UICeHbyO/lTtVS/IGzKZrjPw2c/QZa3Xn5Kc=
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr14748936d6.9.1749826812025;
        Fri, 13 Jun 2025 08:00:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGoXvnc3lC2lrsZXsOUtgUvC1XW6+DbQdmBou7XX0ZccxSl3D3oAsA6zhfFgbdanwdCRWggA==
X-Received: by 2002:a05:6214:b61:b0:6fa:acd8:4c00 with SMTP id 6a1803df08f44-6fb45b1e941mr14746296d6.9.1749826810361;
        Fri, 13 Jun 2025 08:00:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1f76fesm472238e87.226.2025.06.13.08.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:00:09 -0700 (PDT)
Date: Fri, 13 Jun 2025 18:00:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Georgi Djakov <djakov@kernel.org>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] interconnect: qcom: sc7280: Add missing num_links to
 xm_pcie3_1 node
Message-ID: <welmka636qegzxkubalsaskuptfjq7zudmeu7zsfayqpqqg2fv@xtvjqlm62fcn>
References: <20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sc7280-icc-pcie1-fix-v1-1-0b09813e3b09@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwOSBTYWx0ZWRfX0HIQsLNUx5fK
 shEFoc+lC3n3WHSEEjsaaa7tQzJlrH5lgm2K6S7O6jxTOk4OJuIcLG7W43KzPhCQ4JUIjj48dBa
 xYwtpXGe201hEbStt14qaHeoWuiaba74CDfw0kOPPz/ynusvI98RHdp6DAUrSmR+IRPCBMSfNLM
 PnWR+g3+4GidGrURHiKnfhVd23wUlMua+u0r5ue1IEzNdQma68BbFAOJNs0+uUBnprbxvycZj8N
 dK5/lAR57fP46rI6CerzeMqknWwz25lFsbPSB4RFYfcrzmlEtVzXtqfdBLPNG766FHwFcysgJLr
 QSoiJmRgwubX18tDrX6EBuxo7Bggs3ybeBQkPm/2K8aCARfUVyiPCxSLif0TW4dlo8M4I69nxfN
 jWnjWZbBMRG9WpvWXFVcwpl1posRcxvdE1kOrKbuoxVzvd0MGNwyUeSHaYgAUqzSohW8b3R2
X-Proofpoint-GUID: IhEFfA6lZDF5P_Q0XkIPV58E5oLaOsu1
X-Proofpoint-ORIG-GUID: IhEFfA6lZDF5P_Q0XkIPV58E5oLaOsu1
X-Authority-Analysis: v=2.4 cv=f+BIBPyM c=1 sm=1 tr=0 ts=684c3cff cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=egLgVL_HDBsgJ0s0AK8A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxlogscore=819 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0
 malwarescore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130109

On Fri, Jun 13, 2025 at 10:53:38PM +0800, Xilin Wu wrote:
> This allows adding interconnect paths for PCIe 1 in device tree later.
> 
> Fixes: 46bdcac533cc ("interconnect: qcom: Add SC7280 interconnect provider driver")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/interconnect/qcom/sc7280.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
