Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25908192598
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255335; cv=none; b=DvUWrcYdX25wbYi3mcwMy6Gh++aWmSeStjatmr4Ol24QGbSY459DC8mC4ORXMuK6VLJnJEAl/QZswcPmvIhCgn1W/HHiG3QGKy2HHdmhnhfGFXSsW8jwDQIwLd+90Z7w6OVXOlDYWxAi2zgW40NJ/DwLOcyakwjqg6ODHdatjhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255335; c=relaxed/simple;
	bh=njOudKkr+opOc5B/8y0DvLTRZXcH8G8feB/AEAv6HpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRTDsAAlGSm9ZekVstdhsc7ncHbSnpZ5p3T7Khrn8So/CYgllLAK7gxmYWQ6uCoY8IQ4EDK+AlTOw1ffQ4inslCodqiDmZj/lVVdMDIM7JMD3DJ2LmzLBhxk/Ro706aeXccDkwXObJmLf/zAXr7KAegAuzITKt0QnJTHby9TVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hm+4Hm9+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hm+4Hm9+"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539GmUbv004569
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=81XbHVpgrvitz6FNaWdfiNUW
	5qqRcwftat7ZNunOoP0=; b=Hm+4Hm9+MxW1KtDwMhT/6OhbK7mrnDOmv1NvwcGw
	B2fQ+wp+yeeLWv9RWE01AP5Z9o+cBIaC+w1lgrhx7utiaqo+Y8OoIoUPmUFLyV47
	/rJxZVUtWvcWvY4A1/uGe5XoVhcgdRl42VTStAxpK/DOyh1g6C/pWzJz1aCtOdQY
	u/aa1P+ev25knKzNp792iKQD8qxKEXTQnn0JSf9rMmhcoo+YXqrSwga0R5yf0Uce
	+mDtpimJDOQDCyhaeOIRb6QkCcyhydEEPY29eTGrgzxd1K2zY3vWEmeT27wRwWq4
	2PoqrztysW1lb4fgV719dQ4FrPuNXht/f5i4RkTFxmol2A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtb5j9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:22:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ed78717eso4720046d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 20:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744255332; x=1744860132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81XbHVpgrvitz6FNaWdfiNUW5qqRcwftat7ZNunOoP0=;
        b=GJJMdFE9pOxuBYGx0Per6tMSqPM4alCf8DS57mKNXl/WS8H3Dssx4HG7giHtO4IaMS
         aq5Z1MWgWlHhpxYoDb83/FE4iB+SFt86h1F3PJbQHbieztmQmRf/biRSrciA5tngw3uz
         u8ZnQ2KlQJXejW29/mEGqejmR4KqlM8hJxf/C33z+OffcqASHesV6jusoje57wi3qDC0
         5PiYCw/5ua4+qdUt69fPoRdXsVtyFhLUWelGK2CT9wQ9zrj8aK0tKyFu/Nyjxb7ZGCc+
         At27QsXP5x9mg7lO8Hzo5LrGNwQfJY4Mbu3UtE0g4myHKgXkXOPH+HkpZNabOw6E80iW
         LfzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHcCI7mLAwiu7A2bhTdbA4pIIQ2KVOXDT01xLyRb3sKpHdWy77mCGAlUcRXoWyZh05AmaSnklSqzVouRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMyo2RNAdDlm9pzkhUKbzLG+5N3jX6nBpkio4mf0cK47W5i6Wb
	XC2oOJcxGJ+4u2OAm/0LdeykguHsWnrN2DuwNnyk/KKBENjdM5bda685vN/N6phx/54NdnVbai/
	XS6I/LkBeM9FqhuVoahuLv0csSQ1ChLoryNA0JrHLkK5VXaAuBwsKOnd1hfAkXfw=
X-Gm-Gg: ASbGnctgmInCKvM4Pa3tnR+Kmy12+PnSAGJ0uu61mZwgGva/VJOkLgz/pMiRP2QjrHo
	ydUTOkqKLMSTI4NKo6CV1LWEI5tOtj5OiQWrXtuqqSDjScQPXC+knf2Ij7BpW/4a4X9Odmb4I76
	HfKPw6IsraOxVTMrYlCSNF0bg1sF6S1A7dK5lkDbN8KMYhKw9dzu2o4PxoPdpcz/kg76RtxXaGK
	bQmvNzWu6qfblB1OXoPinR8aUa3v1oI5uYTffY8AXP4y6ui3o6N07Wlq4sGGk88c7t1YSMgW16A
	Pp+j7gQTcKW/0HoyhOzw9viSiwHw6LqMQ7qZzZ8btNZHOv/00zRv8zqzL1609we1GgP/FFs2hI0
	=
X-Received: by 2002:a05:6214:2121:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6f0e5a3ed53mr16849866d6.13.1744255332167;
        Wed, 09 Apr 2025 20:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbM59zItmQio/3OiVDMhDZ3DGNC7CjNZAzhW3qfvOXOAZa1pf3Fb3OxUrU3srWDJ8Jd3T2Yg==
X-Received: by 2002:a05:6214:2121:b0:6d3:fa03:23f1 with SMTP id 6a1803df08f44-6f0e5a3ed53mr16849756d6.13.1744255331836;
        Wed, 09 Apr 2025 20:22:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d510076sm26342e87.175.2025.04.09.20.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 20:22:09 -0700 (PDT)
Date: Thu, 10 Apr 2025 06:22:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v4 00/10] phy: qcom: Introduce USB support for SM8750
Message-ID: <okpaydjmwdnrjb7olilkzfp2l3aw7pik27ac45sc4joasq4ioc@eonquhbz2sxh>
References: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409-sm8750_usb_master-v4-0-6ec621c98be6@oss.qualcomm.com>
X-Proofpoint-GUID: ahKkJCZp7wynl6T-GUhKpPi8HGP2-kN1
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f73965 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=f-ECfMwH9_x_JKpxBE4A:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ahKkJCZp7wynl6T-GUhKpPi8HGP2-kN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=992 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100023

On Wed, Apr 09, 2025 at 10:48:11AM -0700, Melody Olvera wrote:
> Add support for the PHYs and controllers used for USB on SM8750 SoCs.
> 
> ---
> Changes in v4:
> - Made some fixups to the M31 eUSB2 driver

Which fixups?

> - Moved TCSR refclk_en to the QMP PHY DT node
> - Link to v3: https://lore.kernel.org/r/20250324-sm8750_usb_master-v3-0-13e096dc88fd@quicinc.com
> 
> Changes in v3:
> - Split platform DTs into separate commits.
> - Fixed up M31 eUSB2 PHY driver with feedback received.
> - Reordered DT properties based on feedback.
> - Rewrote commit message for enabling EUSB driver.
> - Link to v2: https://lore.kernel.org/r/20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com
> 
> Changes in v2:
> - Added new QMP PHY register definitions for v8 based QMP phys.
> - Made changes to clean up some code in the M31 eUSB2 PHY driver based
> on feedback received.
> - Added bulk regulator operations in M31 eUSB2 PHY, to ensure that
> both the vdd and vdda12 regulators are properly voted for.
> - Removed external references to other dt bindings in M31 example for
> the DT bindings change.
> - Split DT patches between SoC and plaform changes, as well as the
> PHY subsystem Kconfig changes when introducing the M31 eUSB2 PHY.
> - Added orientation switch and port definitions in the DT changes.EDITME: describe what is new in this series revision.
> - Link to v1: https://lore.kernel.org/r/20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com
> 
> ---
> Melody Olvera (1):
>       arm64: defconfig: Add M31 eUSB2 PHY config for SM8750
> 
> Wesley Cheng (9):
>       dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add SM8750 to QMP PHY
>       dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
>       dt-bindings: usb: qcom,dwc3: Add SM8750 compatible
>       phy: qcom: qmp-combo: Add new PHY sequences for SM8750
>       phy: qcom: Update description for QCOM based eUSB2 repeater
>       phy: qcom: Add M31 based eUSB2 PHY driver
>       arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
>       arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
> 
>  .../bindings/phy/qcom,m31-eusb2-phy.yaml           |  79 +++++
>  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   2 +
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         |   3 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  24 ++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi               | 164 +++++++++++
>  arch/arm64/configs/defconfig                       |   1 +
>  drivers/phy/qualcomm/Kconfig                       |  16 +-
>  drivers/phy/qualcomm/Makefile                      |   1 +
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c          | 325 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 223 +++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 ++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  16 files changed, 1065 insertions(+), 4 deletions(-)
> ---
> base-commit: 46086739de22d72319e37c37a134d32db52e1c5c
> change-id: 20241223-sm8750_usb_master-f27aed7f6d40
> 
> Best regards,
> -- 
> Melody Olvera <melody.olvera@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
