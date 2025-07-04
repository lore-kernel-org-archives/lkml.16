Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB952DEA96
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 17:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651894; cv=none; b=Cyh73InOlqo4z/Obi5WSC3ZLPzHT96FIVVkjuwD5Xi0V/YtBx2tTlOqU3ngCk169fjIj1T3HKlJAG22U9WRdIDjLgLGQkk1NVNHuNC0BP6beUXOsdoHSsr5yKuEEK0vhjF9Mu5y8IdIVfjA500uTdOSj6pqVXlUmnloIVf+R3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651894; c=relaxed/simple;
	bh=BI8lvaPH148TBhChk5VfQgxnWJCquhvNcpg5PnObUBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/zdCewgq4sORtnCBs5XnQj0tuG8VytFG3x/Hgsu1m1HFTzykGtaHIubZlC9HJ/6/6AQQxESMvOmAyePOwQYvt8ytdlibS8CipkHwz9an13H8Mgoqgfgxl8QGr7FQt2G+cf62dbJ7fgJe7kXNYPI5EI0xxdzg+YE8UDpHu6QNGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SkktpzdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkktpzdW"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564B5xXT019851
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 17:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1F4fPAEqvP62EdjTi0IWSox
	l7RsMJ0HC0KZyKC5XOg=; b=SkktpzdW58ERgizP6ibeQh2xFgVNN+gVoR/z5zbG
	T0iP1N9Sr9Dzdt92V6BKDI1TqwXXBpoKGLIxgnresQrzyyxqIyxnXonCuGIx9Jec
	UPn0UZ8Qgf3vlhSUkvaVjYwt5spK2HsRW9+oru0KHgektVXbxHEFro9yJMAL0KRQ
	ixh8lWzuywlB/TVb/pBihvB2WEbtH680U278abcnUb8Y2QUjrmFE812Rhj1WoiQT
	JQHaxiCdtQfRo505QBjaH/1zh53bciDM0C42CYSX2G+BPDl/wrVnhi8dkxvyuqgR
	ory9yToRZ7YbVJMs/LV+HAY/I70YQcrzuNSYode+mnIoyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pdsh8xmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:58:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09bc05b77so181505785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 10:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651891; x=1752256691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1F4fPAEqvP62EdjTi0IWSoxl7RsMJ0HC0KZyKC5XOg=;
        b=Ws75VYlDzbzetyrnxmH/nKmZL04U/OzTmylyvlxoCtUcHmAAXWK41wuKM7MBLK/rUe
         6aXAfsh+3SniuyihY+MwCqvMxiQIoIIPduoPZnubiuBHfdcL/8TjDn8y5+hCqZTvAsiO
         ywWOll6DNDuEoKLoE49Aj9RtSvaM3buTg0B4uU01AoTh69dfuBX7c2bM94lOcJbOTquD
         xrMZ/ecZqnNGi7y8a6+v6FA+Fa8zNBYtZdrhLGa7raTlyk0nWcPgbQDH9QzQd+oEX/+c
         Xolh/WFAXTx0OLBZzpyn/HNHkzGxtXwvpP4wqe4t7+0WJA7xnaEPAqHjJAWp8vQO1TOP
         9CYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgAxxOyPyZI0Qco7c8/i4R2CGZGjEOA2CdQlKa1AqUWnPvSgvvKtKTCx5ke6pqngNwsX8t4zXOEOwIWLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn6qtYRiISrXOeb6oKyYuYf9y6Fuam6ScDM8IJCaY0omSG3RpB
	rXh03zsIIIvEmRP3WvgOchyYWlmkBpYp2lHODde5aLsc4OJ+/oRMfaGZRIXv0XjDn/0HGc/tQIn
	SPh4UI77gg/yxZVBAHHXPEawyMOeO2u55iGo7iPhD9mD5Fy4dM4raodcqyjEEEgYRfdw=
X-Gm-Gg: ASbGncvf7VRe16SKCTk4A7R9WaaZiwLSNxuea7mNXZtYBDp9D/iFK2HEAIvDGpFcemF
	V5Ejub+7AS6NIgm6aJeVPxK9++WUJHXiCrGWUq06MsRS+6ZMDLToGpcjP5z9nMTLjEkKH7+iwr0
	62TmM16BdEah/mD474gry/2LdyQIxkP1Nmwy2D6Zr7WZSJGBYLkdv0oMtPJ5DYuI79tnnKNd7wW
	RS18CBnMzGFbWg55/lGyOgwOV96/I7Y5/2mO0azyNiGvVLW5syWnTb6k3yGA2c1FjMNBUp5MChW
	ZICheiSqfPECodhzU/aivLzVZO43hOZzS1SgVofOB+Znz2AVAFQtczz5uqmcFglfvSzAOJHRkjP
	ZqMQ/VSdS/vC+mNZvsmb93Az2vyMF22iDVWg=
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d5df152bdfmr319545385a.35.1751651890959;
        Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBxi3EOJEoPm5oFMT0+ivzet/BlEeCSvPIneOHAOarymVXusFmqrpwwE6fb7KX41R6g3zjQQ==
X-Received: by 2002:a05:620a:4629:b0:7d3:907f:7544 with SMTP id af79cd13be357-7d5df152bdfmr319541785a.35.1751651890486;
        Fri, 04 Jul 2025 10:58:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8d6csm318439e87.79.2025.07.04.10.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 10:58:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 20:58:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/ci: Uprev igt
Message-ID: <wzivs2n2inkvtyy5wvyur5bpi6iexxmrsc2fyzm2vwm4o4opzu@lt7tm4q4g2iq>
References: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704174433.693630-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEzNiBTYWx0ZWRfXxo8nvDQAMpzI
 NU4XTUsZo0AP08KaMonc3BjV1HivGIMjT/3DKRJVJAiMOh65HVfMW8F9SZdVEDAp/42PgJv/arr
 ZKR46uZthGtvsfNaDitUUdCQ5+GBv/Za47rQx924P9KPXGjp73duEBZWRbkOg7CNFOIfG8JVBpk
 2wxwkaMdBFebmYLYU9/W0/FEPagxHVYNC7oRrjJsa7F2+OwXDCX8gTRctPkiWEzj9STKlgmKGU8
 2SoqadothXMWFTeYzRAzp8fO70nrVk00/B9vNodGZftM45Bz04u5v+ZRCmLQ9zHNNzhbIxmkd/v
 FbchOeiTN2K5ejdVquu1qShMAW7pdkQ9t4rKD7ee9Q2r3A+AdzDa3Ujgf1aQ3laUcFlRUrhtD9x
 IB4+iZaAY1xztI5Os8CI6+dYC9zSe8u2ZE+jyGGt3O1FTCxnxPNqh7kSrzOru2YRyyv2IDtc
X-Authority-Analysis: v=2.4 cv=RJKzH5i+ c=1 sm=1 tr=0 ts=68681633 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=M1e0B-rp6HQtO0eZjbwA:9
 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ex3Dr9gsUIIQGXgIc7zTgoqEeCU34k0u
X-Proofpoint-GUID: ex3Dr9gsUIIQGXgIc7zTgoqEeCU34k0u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 mlxlogscore=901 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040136

On Fri, Jul 04, 2025 at 10:44:32AM -0700, Rob Clark wrote:
> Pull in igt updates that are a dependency for VM_BIND, and will reduce
> msm_mapping flakes.
> 
> Skip msm_mapping@memptrs on sc7180 (the test should be checking for
> preemption support, and skipping if it is not supported).
> 
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/77
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml                             | 2 +-
>  .../drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt    | 5 +++++
>  .../ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt    | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
