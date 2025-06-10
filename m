Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904F528DF0F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553480; cv=none; b=sioBWxN4IzQYxp2+0XuVL0H2R9AmNCeQ7DpwXjJmllqweTIPikw/do1JqlvIsGFWh/PO2ZLUzItN4brqwi0IQfkkW27wpbd0ydZqX1ek5kxhKJZ2PZYI1SUg8b/fyA71uGbSYlDNC5Z6/rFFrOtieSxarLL3S45HV/ZP4DznUr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553480; c=relaxed/simple;
	bh=R4o6PaWI+O76kDy/WY5h4PlkOJeZ0j1tGHOz0ZXU3GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMZZdgBzdlook8V81kMFi8Ksn/WKEMVCw0u88a1pPb3eNRmNNYpu0BsHwntmiWcSSQxfINj+U8ch9thXEI/r/FcoWTc25YnFxs2cp38h/C8BvWp9l7MRed6UwM278UZtmU381DGG724D33XmYRf6rimCBlkzGXkwx2fMTV3sCR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJbkucFY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJbkucFY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A9HoNv012049
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5mAyVc9QUeLGtDw6CMaYtUCL
	bSHuku+8kjioemkNmUI=; b=FJbkucFYcpOgGBiGt4gc3E6ot2ICduQQLof5EeJW
	p2BZtGGOYkAzV3AUEdJ5JGCFMSI2C4r/MyFidizKeNZ5z7mkKuCBKQetfhMf8tys
	yuVm0sYzosYVlLFj6ecFa1wWcOwkrxwEc/VxDQJ763sRNat+3eMot2RL/+6LiFjZ
	iJXJIidtIR04egYO0V0NLjoDo0Mg7opMOUSnU1bmQS3YW58BGov9TKpvK8gySlZm
	eNK2/1iN4hn21BJuzP7sCC4tNEXBsM/aX3Dxc6XC/WnZzK5KjQBFuhD/HvyumyM9
	ffyd6HYTVC1y6ww00KcoIwlkbA9jMdknI6UJXFpYSqGsxA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekprw8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:04:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09bc05b77so834488485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553476; x=1750158276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5mAyVc9QUeLGtDw6CMaYtUCLbSHuku+8kjioemkNmUI=;
        b=HyuxRHoR7E2UjGa1kV+3xr3JXiDXgvzK9TqoWDHYWxalbMnAgttxlvAAMhi+01fmL4
         Tu8lDMIhvduoHdSW+uKj+m+wzx1L+U9ny3opqeMoXhsmbadNfekyV1xfSHbgE/Roohsa
         aXbn53I9NdTt2Hj69zmJtIxKDmlJ+B5I8MFwVsKOGtKYYloCNqPMB1mzTw8ROHuCu/zJ
         gkqHqKlJtLe4FNkYkxzKLpajaMNrOEW21OHJJe4/wneUsqPosSzcezjU11JQ+aoMTrxk
         u81MRES1nrqdYorqn1WV9s6lTdhLGooNBxxe9WkQkHdQZSTaoxxaK24W5h3FRxzr8gR8
         7TSw==
X-Forwarded-Encrypted: i=1; AJvYcCVAWIP2EAOjcvoKYYEw78KO0zT0r/uz71frapvXuAJjt6Ra5qRMs29ARJJndoFqyF+AlJfryWaPw1nVZTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDMMRg6q/GfJaIPvkC+hrY/G3/ZnQl7No2xkNmGqZVb/yKDtM
	PGkJwcWHtM+2M2h7ULGD2rwZLuR1VKhPlq5dm4PorXcO7i2Z9mDlCLkNezMTebwSss4mktY6wV+
	fSbyPhD8UlUt1bUeLutA6vZ5L0WamjQTq/jICTa9W3zI9eeIewZsaQX6Jjq54yHJrdOc=
X-Gm-Gg: ASbGnctnciImraKjXZytEHEqFIJ+Ja4GGL72QCbYug5csSN3RGtiWCzFGjgVh/sONsA
	h0lMLzv/y+Utw7F15Vqnkqx1Au0J5so7/h89tX0i2HRCUffuk5IdpB3lwyTNUJwdOUONhXnVO8i
	c0cN9mTA6bg2N+3suV5vtXlb4G+zOpNTzXUvg/LCAD8cW544rqIQ7lKDERvHxQQphQdC9cSayat
	zdjUG1y2UK8Na4K2JXoW921OFQ9pFE5VrF9GwuVLek4hDUVeb0zMtntDIN0v1zhjwyykt8LThNi
	R55X8uLekme8EaafC765uyjbmH5vksmQmq2MsOEokpKY4cBuClqo1taCPHnxRg0sbZE3XAEN/Eb
	0YDgPbRAr/8+mXUOEC36ylApA/NzSxOZMMuQ=
X-Received: by 2002:a05:620a:44c9:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d2299328d3mr2409957585a.49.1749553476187;
        Tue, 10 Jun 2025 04:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMCJOmjxkc64yeC9lOHbHk+tMFV29byxI2Q11e24WObV3yLCk99cMVxMnJZ4uc2QdyTNnPRQ==
X-Received: by 2002:a05:620a:44c9:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d2299328d3mr2409951085a.49.1749553475694;
        Tue, 10 Jun 2025 04:04:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772ad7fsm1499251e87.192.2025.06.10.04.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:04:34 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:04:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] usb: dwc3: qcom: Remove extcon functionality from
 glue
Message-ID: <20250610110431.zaug6ocvb56vztnk@umbar.lan>
References: <20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com>
 <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610091357.2983085-5-krishna.kurapati@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68481145 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=gYDs5GclryXmtiFo2a0A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX4i5DjzZry9db
 zzF1ZNhZpxia3rNGTRFcG9VVjqx/P8ta3rGE4tsUSqFV+Y7aI8LtbCXmswkl62ndLWbDKbmqA0A
 14b40D8xtIIBkHmdvtKA3H8apd0485QdYPg6g0uaqXKAPah9kTagcPV3jXOXWfc8paMZPaoDSUi
 Sj4bcNcEbexkJAdzu7LGx1SiMoJLcsSIKrJZ7nZx6u6wsQapORbonGX+KQgFdX7bXw8dME3E6lI
 cXdb5/ZkH3ANkkblwAY5lAjRqMxol/IwnCciYDirzH8Rquj7pcSwDv0IS8MksGO1M1VCAh6m3Y7
 X18NGDTPB0ApMCUhQGVZn5JNn57wQuQ4RVj7IUtHnFoMCcgWmhWPBPis2I/20fQLa0PbcIs7ZPu
 oLfihRw5L0h7EypB3k+uvecuK0VA7r7AR8fJ227UTA09QnRqlgWqYZHrOi1EfYIRQyPUtvNb
X-Proofpoint-GUID: OBTNp2HOn_GMffa-N4rDaBEYhsW57mPC
X-Proofpoint-ORIG-GUID: OBTNp2HOn_GMffa-N4rDaBEYhsW57mPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=785 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:43:57PM +0530, Krishna Kurapati wrote:
> Deprecate usage of extcon functionality from the glue driver. Now
> that the glue driver is a flattened implementation, all existing
> DTs would eventually move to new bindings. While doing so let them
> make use of role-switch/ typec frameworks to provide role data
> rather than using extcon.
> 
> On upstream, summary of targets/platforms using extcon is as follows:
> 
> 1. MSM8916 and MSM8939 use Chipidea controller, hence the changes have no
> effect on them.
> 
> 2. Of the other extcon users, most of them use "linux,extcon-usb-gpio"
> driver which relies on id/vbus gpios to inform role changes. This can be
> transitioned to role switch based driver (usb-conn-gpio) while flattening
> those platforms to move away from extcon and rely on role
> switching.
> 
> 3. The one target that uses dwc3 controller and extcon and is not based
> on reading gpios is "arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi".
> This platform uses TI chip to provide extcon. If usb on this platform is
> being flattneed, then effort should be put in to define a usb-c-connector
> device in DT and make use of role switch functionality in TUSB320L driver.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 91 ------------------------------------
>  1 file changed, 91 deletions(-)

I'd say, this should be the patch 1 in the series.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

