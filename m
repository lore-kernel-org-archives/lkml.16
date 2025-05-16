Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB2C238C3F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395116; cv=none; b=sFKQYOI+UNdtkz3RKvt7gIjMQlgilCgFbVwAQjPIvVp0PWVASREr4Be1SeKKgPclWsOniDL6cCK2etbn5mZFc9j0faVS4H0+pAoQ3adoDeiLopAtyqbkTTpezyDU77FBY9F5LMmhTcby3oiZp9IUqmSZ+l3lLhgtb0e96uSQYZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395116; c=relaxed/simple;
	bh=FycK2ZODVKZ+lpAYgjUK8m4GTFrVQc0AVRZfmvA+wIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mvdpEUWXPg+09tQ8I+e/3Is218LSIYd5a+EnXel/rjd73pvwbjm+O/JpsD233VOrxVrOekvSUGMfQmMNZvbacbj7/TWEN3gf1SGKl6jfo4H7HklC0zNq6oSouXMohm+BSuC517EebDqodF1nb8+McbwQHI8b2SGKMsN0OJdi0wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRqR66ap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRqR66ap"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GB9dD8027175
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=; b=dRqR66apEnvPjJPH
	yeID3G5+Rg5NPfrXuFh3aGQIqGG5DIuplLekO0sl+RQJkooeU4ONUMMXJ0X3RCvW
	3ktUwywPWGnVeY1XUpZknIlM92ZBbQnmZ/6Qiwd3kftYppZep6jrqsPQPMFWhENh
	xEzh2sxpEvSN384z8sFftn/0k5TDMkA28Seumy3ILgk4y47lJP+qd0EDaFDHkDb5
	9Y+Sxf368DK8pHZPpczNgJCcuwn7tuICBNS9tbuEEVrD+4iITgb9J6uAK3pKCwcz
	cwcAVUEcDhUXO3WeyLd1zzUHSvWV5Wo64a2CFcFCFV1fFgZbE83sbPvkwxzo2cnM
	lbLKNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcysy9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:31:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f539358795so1378426d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 04:31:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747395113; x=1747999913;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnzC285t3rkaZwxrXZ55mpC+N/Zc/3Ny+FfdlNU2kLY=;
        b=MuikdjI0GGJqHL1Cp+fqxov7aNWwQt6CE4WqzN78Feol3U3A++Vu0KdhJzph50viLC
         moFOS82O22VP/HQCPUmy9XdP73LvMwMH/ivb8DBJUcXsnt8Mkg3of2e+5tgjWc3kDai4
         BrYHvnB5dSZ1obn5k4jYwRVCj9ZAqOn7F/OASzQMvzE5ftTnGfZh34IA1YgYtxc2EDRc
         OBUV+RtUfL/ZpYUJg+QeHUkQy62UJehUFFSvzJ2mpSzwEiJPHEgXU7nle0C7yeWGnQPZ
         FCauaFT2U2f6an5+mv3sJWYjhOq8Uuy91vIFcdRiyjWvjbNKDCDRirPWGOIJjBcxRV/V
         k9Zw==
X-Forwarded-Encrypted: i=1; AJvYcCU0KwjerZdNryde7fHc+Ff5hqzH1x6PjyDYUmbU4KXlmY1pXUglN1tEAtJPyQ0jQl9hqnETzIDkxTj/+Ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzE4RaFbINFhCuUMjkLOaBQ2TvVESN22uaR/DWyq8DaCHWNfF/
	I1cmfJ0HrQJFNO19BMcjJPEXjZ9KF+hMhZfihXDwB5XIZnEfjpgCIStWKwQ0iMJKm3QcczkpkwF
	+oDl0ECPvodJES4UvJZ8eGQwXPSNKJMCtCiTMDkXfiSqUcNzcpMNanDBC9XfZUMDzj0w=
X-Gm-Gg: ASbGncug+bMBrHOm+1iMf0+w/1gsSbyHQUh/TyLdrpE8kWShPsAmdCt0gP0qWgsCqB2
	DEaPAyk6FTPEWAjxzVcfHsh3yOVro9IOrD4aikcA9h3Vy3oOPj93r73mH8j3BkauCalI1wvrDVE
	fOXgTv11NGQKQ+dk+bgkxH1gzabqq9MNr5jBC9Sl8bi3jX9P1unlT1TzZKRydh6dFzfcEWjzQvw
	Yo+Nk2/NW//pLWn0DGeZQaRCummp2TEgOhFpP0hXHXUmuigxJKSo625+b24ygfZzLzZ2ord3Xwa
	yk4+y/IbKSH+4cWaFUApYqxkYm1jWM3DJrS4c8uopk2vhvUyrfSwV6X6g668jhkExw==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20294326d6.1.1747395112930;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCEBLp3n/whIhi4REkgwi84pjCbz7w5PCZVecxxq7YLAuV1dBIWRpjJYZo6uKW+5BD+6N3Pg==
X-Received: by 2002:ad4:5765:0:b0:6f6:d4a8:1a6c with SMTP id 6a1803df08f44-6f8b0806decmr20293946d6.1.1747395112304;
        Fri, 16 May 2025 04:31:52 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005a6dfd41sm1294532a12.35.2025.05.16.04.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 04:31:51 -0700 (PDT)
Message-ID: <f8e44e19-0c86-435e-adc0-b9cd5b24b1ed@oss.qualcomm.com>
Date: Fri, 16 May 2025 13:31:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v15 5/6] usb: dwc3: qcom: Configure wakeup interrupts during
 suspend
To: Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com, quic_vpulyala@quicinc.com,
        Sandeep Maheswaram <quic_c_sanm@quicinc.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1651740973-7944-6-git-send-email-quic_kriskura@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cUmTvrIONcAYuB6qaEqMSVhzRUU6YV10
X-Proofpoint-ORIG-GUID: cUmTvrIONcAYuB6qaEqMSVhzRUU6YV10
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6827222a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=bXvnuBKqF766Z0xgLQAA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDExMCBTYWx0ZWRfX4fuPu9N7EYy5
 FTt65w9zg1gmommk15LoHne57aYOiV2OGEW7GpchWVaX2RoFb+8okDtGkrtmHRyGiTxR+cDAKAh
 ZtuY8VPI6nDeZ4AmuU0aTr3vn1CSltX2OYXCzpj132S7TEJH7/laZpHZQeeyQDTnZk4M+pRu7aO
 2EjFUwZ0NHst/gXl2+jfRIfgHjpmTH8Ajoz49VGkGCWTezxjlXkT41GenFyk6ShTdT4aMm6c13K
 5R2UJ5IdGxb8rit5d0zpStRGXuLdV7GfKPpAFGYPrZQ+XkYKG3mpYIaFENprvpd/Br1naj5HOso
 um/mLqKJFru5FQPdkidYItiNLRrZoikKgwxzSSkuuCVNocryKTkgdggKFnpvbuvOSLdd9ld91C1
 yYVOmzUosk1+wtkTBrPOj8MsZuvq2dyc8ulEg5nRj9mLn5FebYtjWTi+ARop65/qhVxlXlG/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_05,2025-05-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=940 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505160110

On 5/5/22 10:56 AM, Krishna Kurapati wrote:
> From: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> 
> Configure DP/DM interrupts to detect line state changes based on
> hs_phy_mode. Enable the triggers opposite of what the current
> DP, DM levels. For HS/FS mode enable DM interrupt and for LS enable DP
> interrupt.

This is not what the patch does for FS

[...]

> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {

to do so, this check should cover FS too

Konrad

> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_disable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_disable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_disable_wakeup_irq(qcom->ss_phy_irq);
>  }
>  
>  static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>  {
> -	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
> +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	dwc3_qcom_enable_wakeup_irq(qcom->hs_phy_irq);
>  
> -	dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_LS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +	} else if (dwc->hs_phy_mode & PHY_MODE_USB_HOST_HS) {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	} else {
> +		dwc3_qcom_enable_wakeup_irq(qcom->dp_hs_phy_irq);
> +		dwc3_qcom_enable_wakeup_irq(qcom->dm_hs_phy_irq);
> +	}
>  
>  	dwc3_qcom_enable_wakeup_irq(qcom->ss_phy_irq);
>  }
