Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498A17CA1B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357392; cv=none; b=nyjK5hSEjSkbKXqWdDsKjhljg++7dD58WIbAl8o4D4C53wcC4lvfQXUwmB4r8Xtr6BBB5P1g7F4mM28CFfTDBJI0zCwqmF4cG4GLbzue2O2kGJCQ6kxfZ2Q5MSqhakWVUDFr7Qbg5K+C1YysKn1VzRVNa0aweUt+qH+iRZ7Hc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357392; c=relaxed/simple;
	bh=M7YcCO2/Jd6OWqTReHmKh8CPEQ89KUSFbclKV7W0TEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf63bkN1PYaq2E0NrrXRii63FRKBO48OmpL+DP3/nPujJ4JXUHtmradNHj7aIhjsK6VLqfVFQylaNZekekLhTwVzgANuTg87pm7DHEicKffE9Rhk39p5LKO8Zgu0cW1p/Nh3Putjp5mwC1NWZym05b+UpnymqvTEtmZGC06HA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e75VYa//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e75VYa//"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52U80EKA018208
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Lz8cPs1jv9yYaNYKFo1LAT2i
	8NFG1hmV95XiMt5jeXQ=; b=e75VYa//hrOje19C0Mz0/K39wmVEMpMO95Nzp7z7
	1F2XnyGv6DNSg5Tl9bHgbnl/hj2KvBAT7RnNTtlBmIrN16Hq4YMVXZw/5NDgldL2
	SGanrfylCQ679LHwwRgEdIkovyfJ1iErzxt7lJMsVvHMtMGck0tcjIsoMG7BfZTz
	qAM8XpNYhLdOoQXg1b/yvGH0+GJiRY12UXEHWBOOIiy7tKjt1xJu7Fgli7R39dHg
	6dFeAQxgCeRZiljucaJhme53BE3KiEL+EGL1utUFupbLSrrfP+NBXHEEpocYQ8l8
	SHkcTsPau2O4Kle+gIxmxsqNiXklZDjgNdMA3SMCAzBtmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjser-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:56:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so135467885a.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357388; x=1743962188;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz8cPs1jv9yYaNYKFo1LAT2i8NFG1hmV95XiMt5jeXQ=;
        b=uJDtVp6S1TgYLrMdltxPVC+Gjt5i2RubFDMueqB8SuX/NJEYOuYs2gK0EoEZA69pW+
         qh998+LzpVMei6qOYbQ8grH+bFCO/EpmS6S5ngc4upG2+YW+CiNN5ki6xsor+z4wQS28
         nk1aWvKJg9RoMnoSvsubJj4ZnoOHGimpO5qrMYef58UFdTeXh1wrCVVLb+CtdcYl+TxD
         v834Hr/uopmJgkj7fVOwfYt4e71cMQmVO3oPTmJxrulrp6Z0qs7WUezAT1vnMq144krq
         X1VFuR641x9+7pd7sovOS2lhc1q7SQoOpMviuS8MPtw5JPbnAafKZUWG36QFVwjavhqB
         YfsA==
X-Forwarded-Encrypted: i=1; AJvYcCUKfCABC/EyXyHz81avbZq+z+j/is9cfAdntIpcuFNhICAdAvMTw4EAG4hr+7qdLiAqxtkUVwfllKCjQP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuaJVtOvhPd9QS7ooC5t/+xVhEpV3VyLMjok2YIR8J0Ot0AyQr
	5FRRr5OWVdzlK+D41babcOZd0OkegBywXdh5sUlN1k/5ymbvxq6AlSBFeD0yID+881Qgrr9Vrxn
	ViVvV6RApYxxNoDBYyzW/oYDWC28FJQn+eqJryoM+83Qv1puEIITDL+a6scdrMXs=
X-Gm-Gg: ASbGncu8UMVfH5+dvdnlOxGCjKkLgPqZdK0ePcoBUjZK+WQ4Y0x//jYBReT13cNY9JE
	Q21TZjOXtUYEpXqhLaEKVN6IvTGXd3d4t+fDd4X+Aqo8Ah/KF7mAkVU2DJBmWckDGzuYaOQg20c
	DAYPA7yNyDe1RyDsZFMLC8msg1b3xwU8vyccAYErZlIstCYsAxO6aGSlkqniSidyaN+V2lvgQ6U
	7hRx9FvEfGDPahRaTbW94H+H993vyL+KCaCTuB4XZKu7u0KDazLcwJwifxIyp46SLdlpeyuSnUw
	thycphOr6Sdoe79QGnzM9iLVQXWaXqqxTVO6MIKjfLDGWPxHMI44ZAPK1xl9Yygcs9ccoIp07gK
	sIQ8=
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c690730c58mr798692685a.33.1743357388338;
        Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHV8w3BiW0koPwvLrrFAy1gyiPQeqzm5vgh0g49Qe+2/7yY+I33AnKCPyAKUW1tUcda2ovAEg==
X-Received: by 2002:a05:620a:29d0:b0:7c5:5a97:f784 with SMTP id af79cd13be357-7c690730c58mr798689985a.33.1743357388038;
        Sun, 30 Mar 2025 10:56:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2acf72dsm11498061fa.48.2025.03.30.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:56:25 -0700 (PDT)
Date: Sun, 30 Mar 2025 20:56:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH v5] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Message-ID: <f2odvmbhsfmkrkzada2a7qdjavomt2cjji7mbwibzlhxiz35ai@2qxnfb44eb2r>
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org>
X-Proofpoint-GUID: kh6yrvAgk2b7D-RBC6ftJuvU99oXR64u
X-Proofpoint-ORIG-GUID: kh6yrvAgk2b7D-RBC6ftJuvU99oXR64u
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e985cd cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=YrjviDGP2Rj_hCM7jl4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300125

On Sun, Mar 30, 2025 at 06:49:40PM +0100, Christopher Obbard wrote:
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
> 
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.

Describe why, not what. Something like 'is now required to succeed,
otherwise bl->max value can end up being not set, although
drm_edp_backlight_probe_max() returned success'.

LGTM otherwise.

> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
> 
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
> 
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>

-- 
With best wishes
Dmitry
