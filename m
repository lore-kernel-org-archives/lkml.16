Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A106626B093
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116772; cv=none; b=F5hXKzGwc/+tJZLoonQsZPDz7VyiNwksbBllZsR77HZ69b3g+ejo4jkiNuowCMx8PVKM5/58tpp695t0t+ifFARXs1aRIhFi3DSPXoGRlIr0wVS5vf4TPSWeuM+fahhvrOnEEPprCZypCRVhrZUw0ZL6SVug+KW6hDtCiwR0EJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116772; c=relaxed/simple;
	bh=5rA8FeshCv9WG8o8JCjtZ1vN5uoaBwl7SAobKX/3FS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGg1fwtV1RLJzIdlANjj9Sh+cVsNbrF5jIC/q1C6Ey1h4bhAsMGwEf2ZnBnupqjVRN+I6PhqXZK5tSUulb1EhhJRSNIoI3J2Rj9cv4APmK7/KBGe4unNd9QIjwG6YaBI0brHkfbQxh7x1BpgndeJaGGBiCDCaT5pQCWLBFV5BEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3tCMRND; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3tCMRND"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538BIEMB019609
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 12:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ozOy0GqJhvM4p+i6g86ZdCT/
	y47R+QwpvYzEE25KFo8=; b=W3tCMRNDVV6kOJXIZ0EmD/SnguEJDNfoPUwX7V5D
	iAcIbJxvaoeB7jKfrCEujpOb67naWQd4Pd4yqIU1JIWpzX3c0UcuwejM3E2vz9ss
	9FE9s96SBrJR/fKTkKD1ZIbh0tQSiZereJiyK5C8eTIz7ENY1r7lwrb2M1LrbjYF
	OxhaZmAO2R9j+pXtroVZs806qYxz8HUmMylDJ2p69UFshJ46HJcuuXbD4tYYbbw/
	wjoWN/KM+ACcE36RTgsw8Ofv2UI3yZ44VxjR4YSVZvMH4FFAJBIzDQ4vxSJzmjMs
	wb4CNpA1nTeHh5c1VRHt1fPF6dtKYJuuuz3Hj6G2+9sSJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3frxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:52:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5d9d8890fso1242242485a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:52:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116768; x=1744721568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ozOy0GqJhvM4p+i6g86ZdCT/y47R+QwpvYzEE25KFo8=;
        b=fqavj7SQIUArIlpMx40wzMV/LaQFca1jibdnR+wTWTJSBubxH6PlyFqwI48ig9EIv7
         1eFePtdOyz2RyDd7T0BQMJ8JE2T4enDqzg1KZqUf2z21YI37Jwg+vMxNnKj12pY+aY8a
         g9owtH7HdsqOibDVKmxuMq6VN1bDNKDM19MfxHuBb6uP99GlkcoFAYLPvDNHZRreF2MT
         uw9/8q5NNGKsLTASwnwvGrGeukQ8IpPAMd/P/2LWEkKHbEk71xpp//e+tzUGqMdwTdD2
         8qdSwNvMyVA0TUU1erSJrq1aLxeTEEeTjIVwxchgX2M/7dg7hJL1B0Df2qRnXc4dKkOI
         wKQw==
X-Forwarded-Encrypted: i=1; AJvYcCV69H6lOY9P57+NyO4fN47ODeO+JqdbZ4NWcZTyhLnMXCDR1knpVCWzB/tNKLob0x1uMeMYtkNpcAVJ65w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYH1RPhZnL2fqrwE/tpGpUuEcnfTb3HoA/HXh4aTveHlmNLYYD
	dq886dO4kNSYYy1YzjpjSj3bEXV3/ApYyIIMv9o3CZz84Lu3fdz2tJp8u5DNOFoPV7G2DqxuTVN
	3CYBWa2wmc0JSKPKPePGBSCDnqtNhvQbLD2yj2oc2k/5aTGUe7CyWR3nwKn9FqIQ=
X-Gm-Gg: ASbGncvnKBcHN7Z67BtoEtvvxRrkUA1Kb9AE/H7geITbCj1xnKoA2iPs5wANiHjESBc
	vUfXl5MECLtNPxBipqsEBQ9Z7vsAVEKbz2rbmnH33iZWEz4gWnwiHcwg37Vevu2YdV5ffs2tMfT
	arqg56TqHVaywG0CSUcJrpZ69xvMsGxW6wurhDPkQ8bJ3+Ji/TxEcLUjxzeQHe/lJrNBUjKWNmi
	H26IsNXLIRFRPG2dp5W+XUJlnBkeBEBysJ8ZPTpKvs5dHXLIlFO5VfvnyNE0PwGP6O2xJFPBe87
	tKcsds9IQejLwbRQ76J+vvMkMQ0WYcsFsZIRtJwkvFxfBS5guNjPSQ6y/Z/+o6wSY2heoaMPgfe
	0iA0=
X-Received: by 2002:a05:620a:1a97:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c79406989dmr487481485a.8.1744116768705;
        Tue, 08 Apr 2025 05:52:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENrprMV38pKL2vCzgWJqCOhSuJOXB3SPgKkRxCoZMwFOXx95HGF4YDMgZqebwP9lm9d8nn9A==
X-Received: by 2002:a05:620a:1a97:b0:7c2:3f1f:1a15 with SMTP id af79cd13be357-7c79406989dmr487477685a.8.1744116768396;
        Tue, 08 Apr 2025 05:52:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c46sm1531376e87.129.2025.04.08.05.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:52:46 -0700 (PDT)
Date: Tue, 8 Apr 2025 15:52:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        "Pu, Hui" <Hui.Pu@gehealthcare.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panel: simple: add Tianma P0700WXF1MBAA panel
Message-ID: <owlfv4nuxiwxjjoooyx5haoh7bxuovyctjvi4esa5j7el7756d@xxfl45lpv6o3>
References: <20250407-tianma-p0700wxf1mbaa-v2-0-ede8c5a3f538@bootlin.com>
 <20250407-tianma-p0700wxf1mbaa-v2-3-ede8c5a3f538@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-tianma-p0700wxf1mbaa-v2-3-ede8c5a3f538@bootlin.com>
X-Proofpoint-GUID: ic22MsjgHz9S-j-AhhuECn5LEXoJp5cj
X-Proofpoint-ORIG-GUID: ic22MsjgHz9S-j-AhhuECn5LEXoJp5cj
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f51c21 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=4pWTrk0WRE-EHe8MsE4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=851 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090

On Mon, Apr 07, 2025 at 06:34:01PM +0200, Luca Ceresoli wrote:
> Add the Tianma P0700WXF1MBAA 7" 1280x800 LVDS RGB TFT LCD panel.
> 
> Reuse the timings of the TM070JDHG34-00 as they are identical, even though
> they are described differently by the datasheet as noted in the
> comment. Power up/down timing are slightly different, so add a new struct
> panel_desc for that.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++++++++++++----
>  1 file changed, 29 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
