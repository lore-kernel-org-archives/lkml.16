Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A72A223DC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553825; cv=none; b=gqvKsQza7t/imN/XkoH/vXG3UGDKeeFmmvT5AwLTaOgq4L/X91lDSUzsNK1WR/6n0hj0nXIF741vqnV1byw9xk22S42KCe9+wIRHtVI2Qs5AkpKzaT1HjWUodAeE3uIhLjZooJaKTt0KGnVcJ53buuTDm78mVnxNGqcdy1sgloA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553825; c=relaxed/simple;
	bh=r4xPlsKaOiVx9NhoF1ofQO6ILdX1exjn3Eiq1JZUm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaFcn0J+FWy0QDvPVum51mgK9ZDosndfuvRLDo63hgpnG7moY1PBpf0BEOLnJ4Q1n1rL5wB/BCDWL79iIu74fcp/fCv4wxyOjkT7H6puHJCsTefyesL+yCEtD1+Z9261KVPBOj0/5+bqHCxj1G341v/l3ymQPwX/HEhV38UldDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bzjaTMyk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bzjaTMyk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6gJLu000800
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hpn/4tPOJNmUak+UQiHyAmjZ
	rWIWVGOHrxMVzXs3PzU=; b=bzjaTMykLG9/dqIxVoTS8I8xZkxlVSxASHjQY0Ki
	DkZ6JRTnFZNakFEVYHaIZUXcH5l5bv1qSht6YxuWMsld9i/YCRnvlw1BA9bEXhfj
	RA1E67McNeZ0EeOZkII/DKRAcQnbphqo59YyRVgcf/w6HO65KDxCIlLB4ytqTaGm
	yap4p0p+0STBaLTWXph8xGkQFalZ1GlUNLiv9RBO4x6OHTRDHYZiQJrcdQ55wbQc
	cgW82MmAmVXnG6cr71QgzJzqI9hcp7GZi/F8h/WgJ/8XjXR+uEAAwyUhaAC7R78r
	ZEqgznH0fXmsJzK2YP1oPWlJkJk+kxlLilEQP1ctGNQ4Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 475v2tbvqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 11:10:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso966306285a.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 04:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553822; x=1750158622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpn/4tPOJNmUak+UQiHyAmjZrWIWVGOHrxMVzXs3PzU=;
        b=XpxdpzKtZEZoAmevlYfGQhwNIxm30vjhS92HQnGiQCu4GAe7NVQA/0twHDV16449D4
         tJaYBt/3e2MU1n58livtTfGJiQoTl+cFblQqM+MYOzumy/Xn1RJj832GlniRJX53NGZB
         bkRfP1LT0KkjT7/TWUxzitno8zaPGFvLEeOH3eZcqYk/Gd76a2NWmmn1WH3vprGutZ7t
         +srjx+14ls62iCOYQMF+rEvyrkoRM8Lu8JqaMhSfQ5AGYyx2Ivy2/PBxV9ZfbORkTPpZ
         +LRScpXOFaqiCJzim08Xn9usgY97LYW4TaMj3f4wteZ8zcbeOdq4XtqL9FCZ6+rqCtrT
         N8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXLqa/lluJV9izJeeSfq/9Oa9UPoY3Op/DG77QBO2NOdICkQIxCM2Tk4TVfN/dApfhLrXqCAov8T42YKC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TVgYpCm1B9uoRLdVbk8zkv2lHvRrdhhfa5Qbb+xLP/NhUzRZ
	NmKJQoCp+vy9HFwF5Ba4eX7ljDWyimvBVKtGgIURy5c3POYwLR8A5N6EPLBaHdAmfAf8/A9JakY
	kIilCYSJi7AFwDjt3pyCkqCgoMO2OMrSZ0fSNIJ9AtGGMYMGTJz9bew7KXhD731Rt0dU=
X-Gm-Gg: ASbGnctZE85xhqMmiaEv/0pCN79fCzs9n/6a/AdonVuRxKu6T6eel9BuHraYRJomgTB
	omLB1MqZbUQKS/GkLiDWjxzwW0f7YAlI3nNjj7yR+1Ctpk+f/IQJOFz/rUk5emw82AMBCFZDWV5
	fLue72CZFF4dUbR26mRcMo6pA10jMe1KMgBqGYKwgQCU4xvdZ43zvv/kEcNq5Xlp2CFe9HjLQ9v
	4gCLHQzBBhEPy3edXeNsteEYHloXnhcHOkjTCMYBb23reELIk5iQ62jRG2E8toFV20PD99piZhd
	3e9AGYnhosFFwHaJNrrj2gd97bRgFVUqPi7svC8hENam7PyjgGdxGW5wiTRqecIxn7FblMMiUl5
	7t5knArMatHmZ1P9PO+15P98ovc8KvpmkWo8=
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630761585a.53.1749553822373;
        Tue, 10 Jun 2025 04:10:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuXICBhdrwFurksQR6OS+y4QHN0UrTWRMmZU5j8Di3gdH7KR6uSaZW6QrdFBs18kU8wa1rVA==
X-Received: by 2002:a05:620a:198e:b0:7c5:5670:bd6f with SMTP id af79cd13be357-7d2299025edmr2630757285a.53.1749553821987;
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d00c0sm1512628e87.22.2025.06.10.04.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:10:21 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:10:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: sm8450: Enable retention for usb controller
 gdsc
Message-ID: <20250610111019.osnrknvff7tlvrfz@umbar.lan>
References: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610092253.2998351-1-krishna.kurapati@oss.qualcomm.com>
X-Proofpoint-GUID: mJiCN6hHy_UaviOQwL-x93twLc5nxqkk
X-Authority-Analysis: v=2.4 cv=GoxC+l1C c=1 sm=1 tr=0 ts=6848129f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1kStAPyy7fiUOHsjtOQA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: mJiCN6hHy_UaviOQwL-x93twLc5nxqkk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfXyYyAKWm+7WIr
 wercVeLHpD8rFczqMx5No/Tix99NohOF1Pmxy4I6DGXbYIYG4esXfA4GlikBNthN3RrH55vuM4g
 6bsl6SFN5TZSx+9K2qTH/2Zl67sVe+AgDtf3w8uVjPfZ84WjOlcSwr1v0enb0pxeLmSHQVxur/c
 vERz0WiT2/cgzU4p8uLopCXSjbFE+omtTwpn6JJjBtzIjYl8H7zJK6+BtfIuWLo7edA5vBwa1Zb
 ovreOVVJqcVzg18qODgx70zzVOqV5g90ZE4ArkVHaNUpTSufkdWy98ZlQVnxBWydrrsxHAkGb+f
 hKEDHiFw4LtoV15aFiEv2lYzDPEaJMqBOgY/vfd3B6hNZjza568BI4Gc1MAEqwu4e97rMnImng3
 4Sqoqh5UiHzQxL0/PtB3yrb1h2o9/G19VdMkkfmHcdtFcLWZWnB2XngeVbobltuANDhxarul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 02:52:53PM +0530, Krishna Kurapati wrote:
> When USB controller enters runtime suspend while operating in host
> mode, then wakeup because of cable disconnect or a button press of
> a headset causes the following kind of errors:
> 
> Error after button press on a connected headset :
> 
> [  355.309260] usb 1-1: reset full-speed USB device number 2 using xhci-hcd
> [  355.725844] usb 1-1: device not accepting address 2, error -108
> 
> Error on removal of headset device from usb port:
> 
> [  157.563136] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402
> ,iova=0xd65504710, fsynr=0x100011, cbfrsynra=0x0, cb=6
> [  157.574842] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF],
> SID=0x0
> [  157.582181] arm-smmu 15000000.iommu: FSYNR0 = 00100011 [S1CBNDX=16 WNR
> PLVL=1]
> [  157.589610] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> [  157.596197] xhci-hcd xhci-hcd.0.auto: WARNING: Host Controller Error
> 
> Enabling retention on usb controller GDSC fixes the above issues.

Could you please clarify, if there are other platforms which need this
change? Is there a chance of switching all of them in one patch set?

> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> 
> Note:
> The above mentioned issues pop up after I enabled runtime suspend after
> applying [1].
> [1]: https://lore.kernel.org/all/20250610091357.2983085-1-krishna.kurapati@oss.qualcomm.com/
> 
>  drivers/clk/qcom/gcc-sm8450.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
> index 65d7d52bce03..f94da4a1c921 100644
> --- a/drivers/clk/qcom/gcc-sm8450.c
> +++ b/drivers/clk/qcom/gcc-sm8450.c
> @@ -3141,7 +3141,7 @@ static struct gdsc usb30_prim_gdsc = {
>  	.pd = {
>  		.name = "usb30_prim_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  };
>  
>  static struct clk_regmap *gcc_sm8450_clocks[] = {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
