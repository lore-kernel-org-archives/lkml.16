Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687AD2E9ED9
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443245; cv=none; b=n6diq6WZqpxvkIM/Usr9CsHXuVVOSX+zUegWh4UCXI9UUVh0Rk0z75ME/J5M7BE9JQm5OiPrcRsbJ6+A6p1ExrpNLN+TGuUTwSnctLfHz2uXP8+EU0WXMaUoxHQUzxtipNqZIgwo5qxUuet1lKc6L6hV98c9ZaKvolJXFH47G3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443245; c=relaxed/simple;
	bh=hiRHPYrjUIS36TqXAsT6xsCfV++i6DIy18EgXOhem/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G0F6TK96NyZb8HISKlsSWpd/f2rHgPBVi5U7q1ZEdrsgNqxSWb/R+3bha9bDEDxwEz+W3XKqCgEHTUzOFz/mmIdhOVKAgoGzVTQXJosNQMVz6QOlwbTpxLAUi08BjbcACje/cOgIB/Bvrh3TYLq3bCWEf9usE0zmnj+ZumgpdEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VgQXY5r1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VgQXY5r1"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KGVagJ031102
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=; b=VgQXY5r1aAjjEPfH
	WVWWFdEEHuNKYDeUeNXocsal8slANzB9p4RiMYK6hAcaM1Fkh1j92aREBMTfX5xM
	7pPCe0wqcxxYUigGDMYyQSN5jRAoYa5ldGVIf/vDnyzHV9N1Q+jA5DGoz0xlocSF
	+06YExKrKhp8TDwqpWXWC1eWdqQjlBdYKvIwi/38g+V0NsJqBGqn4oseIAos6xuS
	FwOvPpumkPZeV53BK/PJlyUurCoZdTmNw5mSP+5ze6rnJk21+mlWiIyrowSJ20Cv
	j8O8OdLtt+uXxEzGsSMbryAsp+Pkpf07BQ3rlee7swU3wSFxk9AZ0ph6L982cxH3
	jg97iQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47db82g8r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:14:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399065d55so257062985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750443242; x=1751048042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PEdfT0ej6rioFoBNjA/itEoF2Clr7rfXta6Q0FyrT4M=;
        b=IlkF1Ii3s+gKVoWjCHMg4M+GVtQAtcsW0kHiBVV2FibIzysebG6wqV3Q9MXb3nTMQ1
         hrF8pPkm0s86SZjbrezYLQ7dDR+hmzFfs+i8Ni0uCM+8bDztyPF6DD6wEe9DbRD/e3i2
         OoNqYZGvEYEeWfMocFpI6EdGcPiEQgFz/BWHoXeuVU3Gs2ulwpwS1VgnCeMdMbjFGblL
         hbSx4h+v/NvU5KMX2mMjVzGZFVrnxkV5Y5OIlWWIAOmyt1rg24mSrms2Bzba8eUD9VIV
         GbGODPcwquF8TBF5dGOH7w8/rVqi8ILHAvHPJlHCANDehvBBy9pafxIqbcYgt+M+s+0R
         e3sA==
X-Forwarded-Encrypted: i=1; AJvYcCVWJnV3SEna+GgUTLJPYUQP5MVwh2wg2zxr//GlEUq6Hlz0GhrOwMoF+fd2esA3Kf1J3PtbpilZdNAmQDg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HCsbtIiDIVm0EtuSNQetfMUU1xT22ycU3336RDDT/9Y5lVS2
	EykDAgvphd+ItNBDmwalkhr19fDPWGKsVd4ijLScAcAO+9EiGDE00gWtUP/c0M0R0H00pLnBxVZ
	j4KhZxsrth7CGxmELlVKYdELIXLerf6ub0ZIpaPsbglM+42QiI2UZLLR/s0XHQPypvKM=
X-Gm-Gg: ASbGnctv82RFoucE3ZCtvi5F+Ri5e5z7usEK39sq73rycDTlLraujjBIe/Tw2qXTe1p
	H3BjA0lH+dBHcajeiPgRJ9ContZYchLQQlTCVi/bDMH1ZPzFPlGap/OMTX1pK10h9SbojnvMdOP
	2OZ6677PjZZxd8yQgmWKELUy5hfgq//1lr4s8ot6aXZ+qP2dIHWuX8d2vEP7vjAHyYpUNWJj8bL
	MMrwJMzfMZDrFpoOxNC3+GIwznKmSUkO4F/vmz5tBw7bZLzTei22qE12w3/+rZ1K1Pt+xZNTDVr
	Yjdwx/ZAljp+d2WK03Hy7QlaBL6xUK017zW/OazU99yNkoSgYYPukvba5/+cn6iDF4QtZe4MHMS
	4Mfog6GNkbltfeW3aogvMOxPYyU5cdsFZ+W8=
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id af79cd13be357-7d3f993c19fmr609664985a.47.1750443242054;
        Fri, 20 Jun 2025 11:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEa1scLzEMTbwQtGcAzKMum3byZVIF6ahXfUCGXpgHDAwkBpTju7ydihEn+tbhWAI6tCDqAlg==
X-Received: by 2002:a05:620a:198d:b0:7ce:d352:668f with SMTP id af79cd13be357-7d3f993c19fmr609661385a.47.1750443241575;
        Fri, 20 Jun 2025 11:14:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e4144306sm363384e87.18.2025.06.20.11.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 11:13:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Paloma Arellano <quic_parellan@quicinc.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 00/11] drm/msm/dp: perform misc cleanups
Date: Fri, 20 Jun 2025 21:13:52 +0300
Message-Id: <175044313809.2014621.2079971726903686227.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 5PagDhEuK4jcyg2oz7wO1nk6memABnrE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyNyBTYWx0ZWRfX6/0xH070okR7
 ehy2bryUOCutbtx8NBKx2dsr4Gi0XWGW4lprxMrF0wYo1V5+08OcEFqWETP6SqDvACT/iUucOyh
 lemGIAOGgKasllMRXYUBwdv/bcMkf4GoZM21mC+5f3tecbf2dsLs6uqBUKObDlKq1NMjm2nJECp
 9OM1WBO1VjalWV2c80+1o7VeWL2DMwrZfak4LGo3Qc3ZNOJCGy2UtOZGZ61woldz8frxbpy5CKI
 3Grk1IBtU+pNX9oMFGK00ooeuJ6te2RN9+Y3GZQ3mh1rmqlLsc5UhYDyKOXciVs3sYFn15mdvGw
 wf/YaYKx7Ma8E6HZidE5omxYbTIT0TlIbbq8YFg+Ow7y1cjHXAVyQOztO4h03UxcfKKyjvNGDu8
 CG7FFqJGgPlzwUhKyLjyhpNcbO35n4aQFwuus5yym5JSR18Mh4vP0aYvXvhWC6UaU+t1yIkj
X-Authority-Analysis: v=2.4 cv=RaOQC0tv c=1 sm=1 tr=0 ts=6855a4eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=e5mUnYsNAAAA:8 a=DVdRDH6YNUG9iR60fqEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 5PagDhEuK4jcyg2oz7wO1nk6memABnrE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=522 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200127


On Sun, 18 May 2025 14:21:33 +0300, Dmitry Baryshkov wrote:
> Rework most of the register programming functions to be local to the
> calling module rather than accessing everything through huge dp_catalog
> monster.
> 
> 

Applied, thanks!

[01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write to a separate function
        https://gitlab.freedesktop.org/lumag/msm/-/commit/4ded343a67f0
[02/11] drm/msm/dp: read hw revision only once
        https://gitlab.freedesktop.org/lumag/msm/-/commit/f12a3d46e2f0
[03/11] drm/msm/dp: pull I/O data out of msm_dp_catalog_private()
        https://gitlab.freedesktop.org/lumag/msm/-/commit/df1a7ecda2ab
[04/11] drm/msm/dp: move I/O functions to global header
        https://gitlab.freedesktop.org/lumag/msm/-/commit/e7957db17d91
[05/11] drm/msm/dp: move/inline AUX register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/da5c957bdcb4
[06/11] drm/msm/dp: move/inline panel related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/5b2ef0755ce6
[07/11] drm/msm/dp: move/inline audio related functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1324e395929c
[08/11] drm/msm/dp: move/inline ctrl register functions
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8583a655f2c2
[09/11] drm/msm/dp: move more AUX functions to dp_aux.c
        https://gitlab.freedesktop.org/lumag/msm/-/commit/078a56d3ee82
[10/11] drm/msm/dp: move interrupt handling to dp_ctrl
        https://gitlab.freedesktop.org/lumag/msm/-/commit/609aa04d4f3c
[11/11] drm/msm/dp: drop the msm_dp_catalog module
        https://gitlab.freedesktop.org/lumag/msm/-/commit/9d47325ee063

Best regards,
-- 
With best wishes
Dmitry

