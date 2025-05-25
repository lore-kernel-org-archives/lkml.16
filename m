Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0A15E97
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748178720; cv=none; b=AkTN3X2LdCH/GxTVAMq9MofhUehfj0Ix1LfT+RdIHwi2M3FaTyUsUsUZomDkQqX3+gVN7p5/8RoIHwX7CJSoOXz7T2L22/uvFYX6XCCWtB+A5SHGG/2TuIzLOW/QxIOK59DR9rk3rFb9JzIfqg/fv9WzW49CpIQxhyy3Gvm/UAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748178720; c=relaxed/simple;
	bh=FOwfPkR3k3K7a74jMGxndOawCOCgIjCyZ7oRMcL0bhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3ltksMWoC17hL2mrdBkH/FV60qfb/hh7LyOIf2JisL6PD1PiNxEZytNCyZ3+rypDP+IzF56x6yKYvpAfIKwN5InypnHX5HKXqwpzqP9rLom4PEqXjsoo1GTV6LVwumK1TxHP9PTvpTJXqMYMwyVVHfG6/A6zQYLVGppXJTGHk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PlEnM/cs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PlEnM/cs"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P6V4nL009151
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U/+38rZUZ+yKKqj93ig1X6te
	i5yn0MPFfB3J8hGcDEQ=; b=PlEnM/csAmb2c58q6E9Vjq1L0mvCQI9fcQHIkIJV
	rq3J6RazmXcVfqQ65vQX5YY3FO5+qwV4uK0Z++JCTiWFiMsNHOmqoJ+PkMJVwP3L
	V6N4mwk2PTD+tIqZQqXDfGE4gbH070575K18FnY7Lwu9AmSK5UpACDclrD40nWRn
	8CIq31JVJL/NsiZjIXcp0ppTn4uD6OGkaX8yz45fBCh1BliUz1AATQMSVXWjk7kM
	xQxA8WDUvh23tEHyuxZOLlFVORI+EmPWqC8lU9tqnVGKB9qPhVEAWyVQyTisOE0E
	+MvZYvb0LM7o6vFu+tp2rOk5tivNDYflEXf04Lvz3w9d2g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u52ut3x1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 13:11:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so218797885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748178717; x=1748783517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/+38rZUZ+yKKqj93ig1X6tei5yn0MPFfB3J8hGcDEQ=;
        b=UaOmQsKkpSM++kWmlcD+uS7rkweqsdL5EpquMhOkajuh1MVi+tAkSq3YeR7VAhP/85
         9jPbFEHqMDXA4pZE9d3wl/Q7y7gCVi9L2XTECDvd4DSE4+Zyy8vl8IbEAKQkiKTTzjeH
         IqQPYH/WiA5QJ2RQP8IyQ5kvch5SHbHVfNJ+FHvFAqk9VyiBvYP7PANL+MQNs39YQXxd
         An53GtlqEU9caBG15pbcZRvdv0YLHzr6n/nnyIl+lt+MQdjZE6vmd/y2pcTlr9udQxQ6
         YNbATFO2YJvk4U7+KjpCPjXlqHSUcODMWXKnEISFZs80Lp/e+PBxu7iFqbWJBEszrycV
         jttA==
X-Forwarded-Encrypted: i=1; AJvYcCWCRnnfA5nTSvmmDCQPnprk3sST1ZcB1BPPyqdQy6CUOPlYvI7UT4Q6fbvrrjs65ZG1ZXcMg7ocB6+xv9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsu+ClIoRvPzhIvgbAYw62wbOlFn9nj0q8esj6/oolCf6nGW5
	gg9lcS7djHIiglI/IwY7FWZHorJq/nVPRfQRaGZCFN51V4p2cecCCWoEYoFVbyUJRdSr5FOLvQm
	y/etw1NjOEFypraJ6wPqfJb/Gq8X6ikM1RoVL80OdMilBTBffw3vL+IGjq8KOCNRZ9hc=
X-Gm-Gg: ASbGncsxSXTITTrE4w5qfe3ryKkTGBfP0hsUrC/2T0xD5O1piKJvk//sKQHY2P4xYnY
	zmNWDzTwmSFUsC27qLNXuN+SHKv/IeIYa7d9wWFbE9P7Sl5S6wAmWRaFUXh8CbWZLiG4AVwcwz2
	G4//SgqpKD6jiJw0RjSoYULSa3IycViPq4nC9iMHDlusvVxTwoIzaFndxbO+L3eFENI8cOIbcyA
	JBP50WDhUiB2PN5PbN5H1GqsdgS2Tiew10bP4eV42BeWRcxjyuGJzZYFwsvQYJ6k6/iBu8fGexZ
	UZWPJG3OQzeAO+CR1T2kENqP/Cjq4BCgJeLuKcLwVC2+9GjjmyMcaD6SYg+mPF98jxXMwcnLE1Y
	=
X-Received: by 2002:a05:620a:2548:b0:7ca:ef12:966d with SMTP id af79cd13be357-7ceecbf9d19mr1005209985a.56.1748178716547;
        Sun, 25 May 2025 06:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgyG/K4Z8dfEY4Dwa9kH2DQLEzehDJ1S2mlTmorXKJn9eZezDIbjjrqIpMeBI6J6obY6T2jw==
X-Received: by 2002:a05:620a:2548:b0:7ca:ef12:966d with SMTP id af79cd13be357-7ceecbf9d19mr1005206385a.56.1748178716191;
        Sun, 25 May 2025 06:11:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f2f55esm4676674e87.53.2025.05.25.06.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 06:11:55 -0700 (PDT)
Date: Sun, 25 May 2025 16:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] drm/panel-edp: Add BOE NE14QDM panel for Dell
 Latitude 7455
Message-ID: <5mrwrceolmwfrkdwjpixmruygr5iqob2aclqm4wrptw6ljtqdk@wb3p7pbbku6h>
References: <20250525095341.12462-2-val@packett.cool>
 <20250525095341.12462-6-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250525095341.12462-6-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDEyMiBTYWx0ZWRfX45FzV8s/i0j6
 +spjKkHWzVNIZNf01g4X2wXFViFIURRADngKlG8g1oJ7lKVHz+oVjXpRRAWWT85WPzy8uwpnmMY
 eRM93rQb+D1cD+P4M9W4hMHL+Hv93orG8hbU9eSJ+3l6x1Ka+0FvT80anSN0OR/DQKRGUgmgqX8
 yUeCr8AJo1UfdxSlN0GgW8RU3ycnOVZdW8XsdOzx39hh+cIDV86XjJDFCcDAKGO63Kq3KvWwW+A
 qzK1cqAlAfzpSLM4KcK+uLR2e95ZQcD6C9tk735XAbP7wlByf9iOwTrl/zBqF0YRD/gwJIIjAn1
 dbV7XMEBzC8hGKdYfIX3UnqyiU+5Gj5sGLi+F7C+6uJlcVnkwuB5B3pK/hiGDkGl90y5h5e93fP
 e6rbcXb7EMVK/beE4CSsJvDmZKndr1RZxkpC1GXCZgJiEvccxoSegvJodShw6FgqWUTTFCrW
X-Authority-Analysis: v=2.4 cv=f/5IBPyM c=1 sm=1 tr=0 ts=6833171e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=GzcS8-jb-_Z-RagwDU4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: fL_Tyqn5A0U5AmHhkNsmhaLakgh-9Uvf
X-Proofpoint-GUID: fL_Tyqn5A0U5AmHhkNsmhaLakgh-9Uvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_05,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505250122

On Sun, May 25, 2025 at 06:53:36AM -0300, Val Packett wrote:
> Cannot confirm which variant exactly it is, as the EDID alphanumeric data
> contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
> touch.
> 
> I do not have access to datasheets for these panels, so the timing is
> a guess that was tested to work fine on this laptop.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Could you please included a dumped EDID in the commit message? See git
log for existing examples.

> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 90e8c154a978..ec7c1e21f2d2 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1937,6 +1937,7 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
> +	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
>  	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
> -- 
> 2.49.0
> 

-- 
With best wishes
Dmitry
