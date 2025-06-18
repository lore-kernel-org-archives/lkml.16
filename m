Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17CB1714B7
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750224161; cv=none; b=o1LhOf/aNSx7edOJyV93oddVQ0BfuJELHItdSgCeqQ6WwfNfoO7tYuRjxY2Ggbx7iX9RG4xWxngBByTiYscLg9BCm+xBFtWD7CEmJUGIc0AD91vBhAZE3EbrmCG75zo4eg0oNTY2RSSv3+fZ0WtPkKF5bUbnek84tgwnApjN/9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750224161; c=relaxed/simple;
	bh=zNSLyQ418h7s2pWnKQbVJL3Hx6AjPoaLpAlu4+qN/Q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RdihDWaY881y1tQl+0RXYVE2yPZvja4NsavFTarzSxtCRB8W3w2IS5dmf7zj4ZFlfJN/P+XE7m3nvo70a0DO+wJr3APJmVxelep3YlGDmPaMe8mI7Wo2GCro9eZe+nj5G9cuUQcizA+CZgx83EcjQyOm44ExplDjQT1wZZC6zwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfse6n61; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfse6n61"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1Q6eH015543
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfTFGFpiffzYmC6fjsBnbW+eD86WS8MQlLmrP9ufxVM=; b=kfse6n61g+u1w6r/
	lmrZunITbmNH5P24rjw+yVDEdLVaen0WDglvkS1lQl0glQsN8l4/qlEMrP0FO+vp
	pjt1SS/sVrzHODJ9Ba7ICZ0fsAAHEVlTOvU8Gx2Sc7yozk0Taniq6DyUzloOSC/u
	B4zJl9fRoZ7v8e7+W/D445s6GqGj57NNNb2iMySg1U55alWtZON1P8GZlJJ66y+c
	JSs7aqdEjqL70zHXBq/sSRYa6PXTl3kycNKo5RRjDruJdagck0cwWwYIt2Uy2M5t
	GBL8KKXXTAep6Aa53nVRzXf3SgsdHG3K5zxGtUmiYAVP7w82rbtsD+4Th6RjFP9R
	RAEH1g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfjvnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:22:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7394772635dso4775733b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750224157; x=1750828957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfTFGFpiffzYmC6fjsBnbW+eD86WS8MQlLmrP9ufxVM=;
        b=ZHks2GAriL2v5gdXZXw/nMRxYCj8LiHXyb9i9knA00FPVVm7j1mG9DfFWjix0oennU
         +Hw1P7rVz9AZbkAIaE9caUxGjqIySu8KtJJK4mfTRAj2Jc5OeJYXVA3b2IBXBV6uwnba
         /Ex+jkgbmI2n/MImZaapJg+julZ5Jjx4kgwnjJgKxKX6wthbdVv7sWJSWF8hYLS2Gb0X
         ucJVMPdKLNokuPcU5CqGFQFEGNFFPYIZHCByU5rutYeMDAqYYlu9/ou5XuOGrhDDzWIt
         FGJxJLYZQEHYf3XPNgjf37+1OR+Z1859TbgA4m2Alp7r+tjGIKtEiA7R45/T/P7gNfIL
         bONw==
X-Forwarded-Encrypted: i=1; AJvYcCXoElFlnaIPuBRHs4T3MWqw9rM9TyC2mRNdS1SCVxiS1ughu9mDEnpZY4ex2MCCyRb9fYJolPq4CTijNn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhcjMCuluZeuQVMcULgk3tnhvIl0oY+NXN6WxdL6xdqNrho6cI
	YSp6XB1mc5Uhj2LigfJzgot/pZVVKDHfrg+942DXMy8M4AqsCkIs6AYgPH7z9ICEWmgilzsaabp
	X4+FE+kjBqk8DYjKSGCWvCs9l32fEhZWYxw3KDQ/gwcqSw3LODdkHQQb/+JO5YDiRu7vO2lZJmV
	Q=
X-Gm-Gg: ASbGncvTt2C8C07OmcL23lYL1n12GjgIRABdX2rVvRZwE2Msje/6v294vxHAvTT292U
	g4j00+9jUQK5yCuLaDzW2rrHjUoWN8NAarfNuREoJY/ZWGZHxh/mo6TKJVojB91ocSXUAO0jse7
	SOPADDf/RmKzQOMqKJtLSV5vD/RZvRXrziO1/Mx6RmqY1XKgvMoZYIXEmXg5dWfCM97g2JKBlwg
	dBm9u+VWfbmDTj/yNg56+qA3Z+Qu9TmyAdnv+UIy8/2OWgopx3hvhGDrmav6V2ltK7K1tIQW1CL
	wn4T8slAESZyFpoxfwvy9E71MeAdPlq/IzsNiYzOLnvIUcCcUusOqA==
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-7489d0335f6mr21012550b3a.19.1750224157580;
        Tue, 17 Jun 2025 22:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwXyKvQ8Xiz0pixedDfbHKQlZlOr+c8lkODmf6tgRR9I5uagxkblxgMGrvDShoOMlSPgKJOA==
X-Received: by 2002:a05:6a00:1255:b0:748:33f3:8da3 with SMTP id d2e1a72fcca58-7489d0335f6mr21012515b3a.19.1750224157157;
        Tue, 17 Jun 2025 22:22:37 -0700 (PDT)
Received: from [10.92.170.132] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082b10sm10373395b3a.105.2025.06.17.22.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 22:22:36 -0700 (PDT)
Message-ID: <948e0112-1ba0-40b7-acd7-19fa9d93559c@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 10:52:32 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Don't leave BCR asserted
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250604060019.2174029-1-krishna.kurapati@oss.qualcomm.com>
 <20250606001139.jaods5yefjccqni2@synopsys.com>
 <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <b8f5c24b-d9f2-4a3f-9dda-183dff203003@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDA0MyBTYWx0ZWRfX3V7XWRyD6Per
 Ze/rpzF+84epPjBOJJcLgTAedvuI2L8P6KON0DBgQwrtcESFj0BPsH6/ras/680DIYAdbMbqPnZ
 xj6+izZub8B8BEbQHgM3jTuhCLhI7MZOCmZ6bPFPhiQaoxcN1HwIq1qLWBcbAJDlsjt/lY4r4+T
 9gG6GbXbV+hNcBdmgKbNXo720gNI2dMZV9zAnKB5wvY9/KJmKO5erJ+6M5kH+5zYfZ77EjcZXX6
 jXhoSNtHD0IyuEKKlGDLHFxoy1F1CW1rXaqa8oyqqPYqf/SBdBcEkyR9HMDVKGlSuBxfl/u+/uN
 a3JKIAYX8slnKwMieOvHa6LQ9Uct7LuN0lVynzyUELL0Ijhdo/LJaoN7ke0e1V5KEOGbiWBtJv+
 3PixoEGnsrbqlVaI6RlFmALqAC+Vhxj7KyPSoXprtAmyNkUinJGxBB6zsLGLG0wxWtXeJ7gP
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68524d1e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=6Q_x32ss1i95r1sQoNUA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: DW2zwiP8rY9Nfi5HCSQSteuN0I96D2YM
X-Proofpoint-ORIG-GUID: DW2zwiP8rY9Nfi5HCSQSteuN0I96D2YM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=432
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506180043



On 6/18/2025 2:58 AM, Konrad Dybcio wrote:
> On 6/6/25 2:11 AM, Thinh Nguyen wrote:
>> On Wed, Jun 04, 2025, Krishna Kurapati wrote:
>>> Leaving the USB BCR asserted prevents the associated GDSC to turn on. This
>>> blocks any subsequent attempts of probing the device, e.g. after a probe
>>> deferral, with the following showing in the log:
>>>
>>> [    1.332226] usb30_prim_gdsc status stuck at 'off'
>>>
>>> Leave the BCR deasserted when exiting the driver to avoid this issue.
>>>
>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>
>> Is this a fix? Does this need to be backported to stable?
> 
> yes and "might as well" - this file was re-made last cycle and this
> patch won't apply without the recent
> 
> e33ebb133a24 ("usb: dwc3: qcom: Use bulk clock API and devres")
> 

I sent the patch on top of usb-next. Perhaps when I made this patch, the 
above mentioned patch was already present.

Thanks for the review. Will send a v2 with cc'ing stable and adding a 
fixes tag.

Regards,
Krishna,

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
