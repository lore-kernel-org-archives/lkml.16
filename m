Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4208421ABB0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743099567; cv=none; b=rryANFoakhOW9Gk83g+cIUGkhiIWi27fY7zZK0TpFFtn9l/sSkmOWHnFkSeZ7AgClGZpEV/n/qt1BtSwI2WGLakyz71WUbHmCBdyq/L84eWLZAwzfWjtWsMvxlR/nIgdkhQTJKRhVnMaFgFVfCyE3MceXsVi6f/qCFRd6fBRgck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743099567; c=relaxed/simple;
	bh=RAPTKl+n3VShCaRn/cpo7MxBMZDRad9KxY0XvNp+49o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SezXt8RS+IGjqT6LpsNnWIL5YUgUC6FwaDltHgCtZgagGmxEe1K4E7Bx5FdoSYhfSVbhUIdwoKb1aAOSfagu0kEV95ewEBtrI/5Fx9ffMoXibIpVvbcptumfmgEvQvaYNsgMN6CfSpuy2Bhv6IWLjFARO3v4XELe/S4sp6+2st8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8RO0Hro; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8RO0Hro"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REdho4010233
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e+PqLCySKuQUVoMyZ6icZJ9
	lYK/eLks31o5gyEyhW0=; b=S8RO0HroQUXHNwpONBNXSLuOTYfhe90WKTi88lRF
	saGQqmjs4kMuXprRYg/4eBbE/F0n1MNaXIkvfLwtW2ddWT2BpCEpEl12ffBJQbKN
	XgGSHHn1nlx7Z9WhxaBIZEHdi/tcOOCa+KoypeR34UpCJQAUnDo3ywX3pDIyF9x1
	Eeub4XISee94KYhjB3UwwZepNjFIYHLU2WJSLSbv3taNVxQgpnGtxr9ydw69y3CC
	Y7huAaA55fvdqSaO4yD4pNCW96rvkYlWSxwxiuLE1CXHsTRCavbss2kQU65LBipf
	o6rdhYPq+aX+fVX0oM5mFp8upVeSyv6EEqM0yVOXPHD/FQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcyhjte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 18:19:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f9450b19so29152246d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 11:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743099564; x=1743704364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7e+PqLCySKuQUVoMyZ6icZJ9lYK/eLks31o5gyEyhW0=;
        b=ex7QaWyp2C+VywwePgqGMGupMcTxCWzCPf1cXbJci930vK6ABkpGOLqi0Zc27fX71y
         Ab6FOCsKxXc1NnPzmuLc7NC5zMUjhomMuH6DRR7jvHOQOAbuwyciX1a1+zoeqI4MkJUk
         zuK1qqTG+tzbTIuOsIhuiiY9xPnA8UOnTW/657XBcn7ZF6La20F3pzrfQfasSbjxzI+t
         FYy/WnrfRutOtKadKHzrNYYRxd9lSZgiVT/7bx6Fyf9TFJ3Mf6RCBEWiQy4IUQa6GwXK
         OCJcu59nSBFRwR4jPYS5GZ5WB9Oxsb6PpjL5PnzWrbmhUSiIQtMmK3njFKhAE3meDpYP
         RLdg==
X-Forwarded-Encrypted: i=1; AJvYcCVz/Lum35QjOihBKDM4lLvbVw3tAW6gSqr4jTIsfdPbE4fjNFh1cZ9a7AL0qUFmYLAGwjWOSjMIzC9F4ZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+w46hjD03G5eTysRLV3RS9O+7TP2g33cPfNpOq8thoya0s/Si
	am1q1ipVWBXLugjMfny+TYpg48pzCFlpFXa2FPC36blxZecdQfmz0AMqKoH215B3PlXhykEboYR
	VC/ZYu73x/crgavUZolUIzx+vWOrOKfc4hb4K1rvEP1liOcdwjQ6WP48efS/X0jU=
X-Gm-Gg: ASbGncuteX05cyZO6dlFX5YCH06ZcNmgX2O3AiwRBMxqTqknZ469HfRKtJ/a19n5Q+5
	0pk2Qe7GXOl6N/AojBdWW1Zjicz2q5QLo8l88xBDfvMJEQdNUDPL+3Dy1dMbLg/mAnW60XgUMlO
	11sJE8JHB+1gRjFky1C+hef95UvyWea/+uz3zrPnHs25dUdccJiGDKxuIphEFknm6ID5TOV0B3w
	znd/Zgl0vfdm+Pr2lbnCFiEUtgobuRypCMiqJ6ati6nxY35pJT4hmOc0rL0mnOQidGGd5R2jlo6
	byEACfwa6KhbwMgG82Qj0sSPxymils1xr0gAzYoo1tMzJIyQxyntDJGodlhj8i+O0406wI43/7c
	RGtI=
X-Received: by 2002:ad4:4ead:0:b0:6eb:1c42:a14b with SMTP id 6a1803df08f44-6eec7a1bce5mr17610356d6.1.1743099563966;
        Thu, 27 Mar 2025 11:19:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEn6cXrQgzwmi3/4b/edFvgOGrYx3nHDkqzD1eE1vyYepJ46UWg5mVA0McAf9rHDkpvqtqotA==
X-Received: by 2002:ad4:4ead:0:b0:6eb:1c42:a14b with SMTP id 6a1803df08f44-6eec7a1bce5mr17609856d6.1.1743099563490;
        Thu, 27 Mar 2025 11:19:23 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ad3cd2sm312861fa.53.2025.03.27.11.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 11:19:21 -0700 (PDT)
Date: Thu, 27 Mar 2025 20:19:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s-oled: add eDP
 panel
Message-ID: <hcmuxutvxz7q7ad7tuzvrputo7btmnssuqyyqlb3ydrlu5dyy3@oe23sa6wsefy>
References: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-0-45d5f2747398@linaro.org>
 <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-wip-obbardc-qcom-t14s-oled-panel-v3-2-45d5f2747398@linaro.org>
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e596ad cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iSdEqu8mIraFA3EoBIsA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tfVxeU5oxK3_TqLyufRpRmmUhR1eWhHJ
X-Proofpoint-GUID: tfVxeU5oxK3_TqLyufRpRmmUhR1eWhHJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_03,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=774
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270125

On Thu, Mar 27, 2025 at 04:56:54PM +0000, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
