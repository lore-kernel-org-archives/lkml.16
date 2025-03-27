Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A134717A2F2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084299; cv=none; b=I7FnQERE+yCGXDpuUr1ha7UwqCrY3QCkpQIYIrs71nSbvheKXLUSahZdw0gbMnXrNz9Zidqs+194FqF3rs8eVDWseBlZoUA49iotqXiPi00sAUyXnNy52gL4YVtewZrtxUa1GfH5bh5T825ZCTtcUQ5bx1oitZkFqoCpnc9dpWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084299; c=relaxed/simple;
	bh=m+MQebCdoQen/iBMPXoz+KzcFef/ph4H4Nxtif+65TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgbocOH3yK4MWi/Thy2cNX+nR78yN7Jcckiv9GY9ahscSXZMg1y1WRxinpTSRXDOE9CkhycFKj/7WNtDG+GKorzXQsK+kLm9k5Fzy3h6uycJoZHMCIGTo2DMgo9nIm5ub5IY/n9EX+zX2oYbEjHgJt6TUUTn36WNHlr59nyqxmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsXpenhp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsXpenhp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5jaA5023247
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B32z0nkKxR0pV2HsaLWigtDr
	aivyxIGGbTNez+3GvU0=; b=EsXpenhpNPJntw5TxhHhQ+qdXd3mhUo76dMPdZdJ
	p3Q943DknIbXFlB8z1tVo2NwKhFl8lnkHVkPkDzSvaTB5xzyfgpNXvLXEbwyxhbJ
	hKHI/enUgARl49i3dMd0Jo5TYpO5xhBYeqtAa6IYpqmmTDYf9GB7I30fvTkz6MAC
	N9NUDR0736KeDXn/j5AQIdCGLkktBlum7mSQHRGwGOOFLzgeyHu2ARH6Ds/WBgJh
	zHfFtCenR28HitgxWehb3Rz623D9E77p8dSJ5Txs8RrUK68Sl3TbP84xsfW59uDr
	8M5HWNbtdmGmOoOvpdY4R8gUMHQ3oxCmkB4T+LXKPW4KSg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9mw0cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:04:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so280426785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:04:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084295; x=1743689095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B32z0nkKxR0pV2HsaLWigtDraivyxIGGbTNez+3GvU0=;
        b=MagEIoAPGi/kQl45+gecsVQLgzx6yaIYR04rhc+LBPBAgZHoD5gHWM+/JCi2CDTrDz
         7hS8OHE/yDmdpAGk910aPWjZmbjrjdUcBbocqWHWy6BBgcQXNBuQBTbwgI3x33QvfQyq
         0qYGuve+rTnH7rJ2KHzv7IcqK7h0vH9nxLvjB/qcTcfkKwXIGzCko1fcpt1Tag2NgXIy
         zvcqFsh8zAqRmrfE/6O97zY49iIVQGRBN9257kj0nKbwRiAQHGBea/m9b6nqHV+vf2jM
         HkakD5/E6ucJ9PhmRgPyzZlm+cay2/z/O/845/NLFzK+4zM6BlGL14RvZ51F+W2kxwqg
         xfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXC46axJbX3XX9AKCeCjjZZQX5+I2ZxaVYAEBlmbMXa14Dn4x9c/Bljt4gec/QYLhwtbLnzPYtlvYDfHz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnnpNWuczeh3PJFZcm9cdB2urMgw5Fcwbax9Bxah+Vs7YZeznr
	DjlgTpzZv6fTe42iwzcpb+Dph5snSOlyYTEx1DYV/CZS509fTF7T4Iy6FA+JheZKPN23Z6Wuci3
	xYI+Z+4a1a24nTYPCxjy3Q2TfPCtm+JMrnRBdzge4V/nE76wJHKbUd8iVQeWWpVc=
X-Gm-Gg: ASbGncvLMUaw33nIDP/XQU6RHBm83/lQpHA/Y4Tn0096V4m2CTmM9MQjfrAXWEV9sjL
	RRyAtBeS67oFpiMJoaIpdR4MD1ogGvskucKQJzaIcuGR1v7CEhkOLMrNuqA8/ly+R7M9GdX3nca
	JEobn/UGZZHzGITSJmHA0S1T9lkXZ4teKxW9J2ZUJfOTWvAJjNwgrST005HZYRE20g6RJKYKC3j
	lCLFMEac6ts9yLRkznmWUrhX4K1cPrvaqO+7pVBMXzXrzFplQEU0SNxHXtUW0V7FZNN1Lev0H7t
	W67NM4XG4AC3Tib8d6vbQFC8mJvkwkCXOZTWRu52TFnbPyyiWTx9wIX1OEnY+Wljx/7LGW+WHiZ
	J4Jg=
X-Received: by 2002:a05:620a:4305:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c5eda60226mr530561785a.44.1743084295428;
        Thu, 27 Mar 2025 07:04:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG0kR4BIcRTnYfbkvx20oj3Hp4oBV0sCjN6K2E8Rob51ffUn6DV3Ut2PgRJAWGiTjCP+ZraQ==
X-Received: by 2002:a05:620a:4305:b0:7c5:d888:7098 with SMTP id af79cd13be357-7c5eda60226mr530555885a.44.1743084294908;
        Thu, 27 Mar 2025 07:04:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d7fe8b9sm25208831fa.58.2025.03.27.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:04:54 -0700 (PDT)
Date: Thu, 27 Mar 2025 16:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dennis Gilmore <dgilmore@redhat.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: enable SDX62 modem
Message-ID: <ghqzw2wxunc7yg36epcsdydm74fkrecd7iyestbqiobbsfvmys@fxhv4cs5mfvx>
References: <20250327081427.19693-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327081427.19693-1-johan+linaro@kernel.org>
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e55b08 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=LP5Qa2lKvCmapEnZnZ4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ExkBQ98NFphtcRo1g0bOdnHoxAqCpeaV
X-Proofpoint-ORIG-GUID: ExkBQ98NFphtcRo1g0bOdnHoxAqCpeaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_01,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270096

On Thu, Mar 27, 2025 at 09:14:27AM +0100, Johan Hovold wrote:
> Enable PCIe5 and the SDX62 modem present on some T14s.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> I don't have a modem in my T14s, but this is based on the work I did to
> enable the modem on the CRD reference design and the T14s schematics.
> 
> I'm hopping Dennis will be able to help out with testing.
> 
> Note that we may possibly need a new entry for SDX62 in the MHI driver
> device id table (mhi_pci_id_table) as well. The output of 'lspci -n'
> will tell.
> 
> Johan
> 
> 
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 

> @@ -1028,6 +1044,25 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> +&pcie5 {
> +	perst-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
> +
> +	vddpe-3v3-supply = <&vreg_wwan>;

As we now have a proper PCIe slot power controls, is anything preventing
us from using it for the modem?

> +
> +	pinctrl-0 = <&pcie5_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +};
> +
-- 
With best wishes
Dmitry
