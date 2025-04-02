Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC191E491B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743620872; cv=none; b=qnNUrD4Ew97WNmqoVR8ZJteG4YhIkPwparOVY2Hp4qBNaTl+iFF30KUb7rxdfSa6+a+RWEqUHwACiB1in59T4P3uRpswxxksrabnZ06FIwbxv2aANZGYGXH1/Vt88J5tDIOowQlmAGgL2m/FquCSk9YfvD+rBAmkqv3dL9jFQ8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743620872; c=relaxed/simple;
	bh=nsq76gksv/CQjLrekPMlJY9e0Z3fWNmE406AI/XQB2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7RAXXMcut79t9KvgL6FFTpjI8hts75WGJb69KQxtymdTjPHGnVCjAAUeyzSdvzWJq53x9wWtrjXL229eRDuq6OGT94qi828OicCk1MB0C/d51SzlZUVV0NtxWcDd5thu3MW+viC71zGhJ4u9J+/JQHQlBKJoM6OXCSYDjyHdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XI1od+kH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XI1od+kH"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532APmBt000927
	for <linux-kernel@vger.kernel.org>; Wed, 2 Apr 2025 19:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LA1WOhQTX5ByQ9v6PfWc2mZW
	1spbBXtueAXo3bqSDbQ=; b=XI1od+kHQtwJiuPa/LY0dHthPp4qR/eoGoTaqKw4
	WV7e5ihx3zU1tau9huE/G5OE2N4tNJEMZ77lAAibREy4/Qmyw6k2H64sOJH1Ri7Z
	47OWt85AvO6qQMOlR6ytfYOE4ZElqCmoPNf2gnLUKBevX22uUulrvrvzC/6SuApw
	fQIiqwJJOpRlahR42Km1d9n9PbvzHAPlxwtv5+mQxGthcGyBKUDdL3oquRkyiw8z
	hf20O2xstFk+v8RH5P/bCuu+9OmShYaZLDwiTKe1ISFxhe78vrigS0inB3s2Fw3A
	msAyJi/TsrE98XWr8EhUAeamWYHDhU5K3ey+hSsEkuwnAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qmsfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 19:07:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so26030485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 12:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743620869; x=1744225669;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LA1WOhQTX5ByQ9v6PfWc2mZW1spbBXtueAXo3bqSDbQ=;
        b=pvNd1WX5pct/O7sK7rckZFrYiNL0FajVt5seOP7W5rjy3UKMYZeKeLgK3FT7hnA48o
         q3zaxGJh8GRsb8uRUbw8HXbz8B/oKgdVrT1rJuVbXDiv2QPZLNXWLa/j0rFGdYU8gMci
         YqjGbzg85lA/JrlwCwpm4JQXTQvjQbSJ4JtcvRN8yD8kixRQAonrgo5Gizp9HMupk63y
         H1s6AOHvVsL0yIT4DOMdL9radxhBtrLhfhpMDj0qbzuB59sca2E03gUcJRZQS8eic+YO
         eFgLhKZaCnphJ9jqka4TrJxI0tJzzVXInMhkIEXfnvjKJSzFtC+FMGQpHOATt7Zgb73b
         56/w==
X-Forwarded-Encrypted: i=1; AJvYcCUuqgWD6BH5Jko0i4DIwfAKdlj5nPl0vQq5Mu8fbYAqfa6T1Ml5IV8UPsLEyKhN+h5z5Rxsw8S9mYIgMCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzryswGdK26INk42CNRIyEwy8rf/XutvSKCzqsPrZ1JW50L31Pz
	/dlXrbet4LGEqk33ayrruOxTp9lCnPWtOo7U4dwDlyry9JEVKGQ0DImqw9vs8Eg9I6Fejdjnu6X
	+f4mSZUwHEuQ8zy/XC47cqsdOHh52c+Cz0K1YOQpN5H5PbShmjDX4thxh8RhqTm0=
X-Gm-Gg: ASbGnctQeX2Nbcik95mBhK45oa4ZTUQx7pPKOxo4a5Axy9VeIvBEi63vO4cA7LFl3qo
	eAnho6TLF2Ci962i3nSnhuogBTOA+OSAtJkP3Eyg3tiwI5lJ6Xyc20ONvwZH1wD9bd2O4KYMJMW
	Pg72bYHeE7toYAWHtbNAGTLTRPffJhrsBTK4jzgKgfuoTaDMwzVrYJpiBdbPvaTT8OkMJdA1tIk
	o9F4XRbEYl/6dJ8+r9GN1gbP5v8sdb7sU5fvaWRBXVZKbCPtkqxEMO63WsBxN7yT5iBrbk9xlUW
	/k5ut+Uyk43Pl7H6kwrsgOTNeRvM4yz4zdMBy+WJxjqwDZUEdWSNMfl6+mtcPoOJFK8bgmp6raM
	Pr+Q=
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c75bc8e3afmr1349614585a.48.1743620869350;
        Wed, 02 Apr 2025 12:07:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErZZ608u4zqFw2htoAry3TzhWNQ1iLzSerIc8/NM1Iiada2nzhQbeC8aAg15XvOdwOqWacIQ==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7c75bc8e3afmr1349608585a.48.1743620868984;
        Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dda97350fsm18626371fa.107.2025.04.02.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 12:07:48 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:07:46 +0300
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
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: x1e78100-t14s: add hpd gpio to
 dp controller
Message-ID: <6fxnxcrtihxcpmn3fy2bb3tz5xoeqhxdftvurarlwvto5vyofx@ff2sfftyz5cv>
References: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-0-ff33f4d0020f@linaro.org>
 <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-wip-obbardc-qcom-t14s-oled-panel-v5-2-ff33f4d0020f@linaro.org>
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed8b06 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mxXJVTWgdfz31GLmhacA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: lv1HeLrQfhYLnPlj1BVTK65UZh1gp9dm
X-Proofpoint-GUID: lv1HeLrQfhYLnPlj1BVTK65UZh1gp9dm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_09,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=588 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020122

On Wed, Apr 02, 2025 at 03:36:33PM +0100, Christopher Obbard wrote:
> The eDP controller has an HPD GPIO. Describe it in the device tree
> for the generic T14s model, as the HPD GPIO is used in both the
> OLED and LCD models which inherit this device tree.
> 
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
