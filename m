Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB30221F0E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487466; cv=none; b=KjDkLRM1ixhRGopK8c5cp2pNFtWApnLnWt1iJkQGRuXbMokObAULk7gkZenVMbUF7yuBOX36DkyX7JTiV/6hz6zKWiZ5jCYdI7F79bQaStdoUXC8os1+p93GqJY+CGtykrEet/3lpfs6MYkQlSoHBrcoWYIhl8OtLZWchZ1dlTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487466; c=relaxed/simple;
	bh=US2PVtNLZaFkAuVXr5SpyazmZmP4+ZVR7PKcZZegtjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r205qnPEkpCR60zavTtmhBZq9feGzVJ5hMrzp0Cqoddi+tomxDR/gLZZa3GdAYYDpnnqE0GoLPzRAF7VVZ0VIvQf06URwb0YO9E+BzsISNWaNDeE8tP+6/loH0y6hnTraSwnNEqZ9SLCOFz6W+kT8Uf36NeCSbP9LqVEXJYUmCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hp8m0nAX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hp8m0nAX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7cJ010257
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DgOyK6Aj8y9bqEdW8CqXJdRw
	Zh5pW+vbS8PbU9FROaw=; b=hp8m0nAXnk4d4G02FKP6jguqp+UJUzC/82qow50d
	0L7MigqO8ITXrjG01Ox7yDCBSQMzPp6l8v3ZvSHeEqTiTX0L0jBwionjBfVRlCqZ
	sUwSw8jI5DLKU5IkJI/q4VZXIKW7BaVSbVObrfeAS8ZdP6oUnaM9W02ZgE2NA5pl
	GqOXFCdp1mmQ9J/Oziptyfj041KAOufp1hFq6dY8nshF5y/x4/efekkiqUbGLv7z
	BNVnAYRw4+WgrXvhPsJ2pmkkEdS6g+WlgyIzOuYO9oKFtI2AuThDuFWms17ecRwx
	1BnG3atS1yT9goBfnBj/5LnBzmk9UTOpkSk0bg8hiIRZDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n0j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:37:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae87b5182so14588691cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487463; x=1746092263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgOyK6Aj8y9bqEdW8CqXJdRwZh5pW+vbS8PbU9FROaw=;
        b=eSJI5vTF+1KAxR/uzHEKhoPwxsrAZk7ozIVxkCcPRwlDZnAi1UppkhD2QlRW83c4Bu
         0vXZS2X8EpCwSOX+CYa+SIOW/19Hg906dxQEukfPZfOUWedTcfguC6nZk5KdF0B4mVcX
         y5i7IJ2cZYFSxeMxB/Vp5/a8zuLbGrtQ0AkSxZusNssn5ArfN4iOh7C/xmupbV5i/IFJ
         vN2m5sZf+M3vfPtDgXDeZUES0aY7jAr4hiI63UrkwB3f4e+u2E1cl9ZA1P29jo9sQPg9
         c/kzwK+DSkwUgciBNM2EeKsZcvvhv/P5SS31LRW2ZBvuzWw97zY9Ra+wUXkgexkgNWMS
         hb+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXVGmNQdDr1Xv5h0I0QKO69oYgrkki5gV3TpumJIuYLdscCtSI4T7Tkd9EIVqbRIbbXlvtsXePCV6oWZzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4D3oJkvzwcXqfiKfGrGGugmb1KtgUD2Cfr8HWgDWKnblDtMmU
	7R/B2bFiJBGbZ6MPZEmcur4zeelrYYgf8a7IXw5Y7FiX+wIZ+DOmbbFAyhD3V+X/Y5E759afAMJ
	YPiKa9O20TPfXyrH1Ow9JsRbXnsC3UjAeRXkuyVBuI82v9UBQ71jylWzD4OVDg2o=
X-Gm-Gg: ASbGncvZRycK+v/P2MvMABlE2qodbxxycnlsSo6LCwGNyT/Xe5XoBfSFf0s0T+SnqPo
	yHZl8kWB/v0r7UjzmYaJ9QKyjzMMEa/J90vCdtAMGSUwitkstRAFCfGQwmW98UReKzwyZP0J+Cs
	e/BmFHjCgf2VEH08M2lyTmCun9Xnc5NDjotU3qYRuAKhOJe1nAEI3DZwFmFm7uNqBIV3ahPwEnV
	XTA6LgHpZrNHY9KICeSIAdv69ZrA0b6Lkn3hGcctU3a67qD4YhECyYJVW3pw1qK1MD0gRzcrt5g
	us35AEegp1ADCqGK06JxM3EEDBCLfffiDwgfa8j/fRQonv5bSJAhDPib+m7h4RqoLnFZ01+s8SU
	=
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466891cf.30.1745487463425;
        Thu, 24 Apr 2025 02:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1eEvXAeDIBJ+oaIV6NuXCx1ty2W8MF/z7TiaW3cFjO6fXs6cgqkeV3Jv4TZtIDAyz/pl37w==
X-Received: by 2002:ac8:7e92:0:b0:476:850a:5b34 with SMTP id d75a77b69052e-47eb33a7730mr30466451cf.30.1745487462999;
        Thu, 24 Apr 2025 02:37:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cc9ea4asm166075e87.149.2025.04.24.02.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:37:41 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:37:39 +0300
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
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/10] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <ayfgkx7ep3pglzydno3waipm4xqcbuj4v4go7tvm5j3hu7mswr@ceqbynkuidcb>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
 <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-sm8750_usb_master-v5-4-25c79ed01d02@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Gketiot9wHPjr13okjOh1DUoBMXi2Ps2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX0z4afkLkPorp FuuQ5pJfs2oBBF91ALBc/knm4CYO/yeiXPEVoOMtgd30NjLdaNB9z6hEMOwTjFfkZAppubsQNTl wscsYNSvRGdcoucw2QQLEu8ofBldsvn7xXEWHPrWwwW5vqu2uYtTEYPabhKIhB0gkc1C2Cd6+bz
 zyVIHPZhsOeWBt+F/552HPXTs5jG8av7lRgY+BaMoWj89RiHpm03liunXqmdQR1BKd1L6OcabRy wZDMPI+WsEVUUe64qiheUJjFkoEHXG6c7YaGa90AON1GaczBgMfLLJy1e2s455UUEAjUB/QaBQ9 xjZ+3VEiNsaOKAQZp1hGbDHoj5U2Y13g8iK+bXt3rWHs+mrP4CUPdPgMw2khfPobIHoH9Gty4s+
 /8PxbhjN2K862VzZuDSou7O6CUhG1HvNeUfEhu80DRpi3KpJDHKPXAZ9FOMMN6MoR+u7IQ1x
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a0668 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9yGODh8E-QI5J-fucZYA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Gketiot9wHPjr13okjOh1DUoBMXi2Ps2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=858 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

On Mon, Apr 21, 2025 at 03:00:11PM -0700, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.

What is updated? I see only additions.

> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

-- 
With best wishes
Dmitry
