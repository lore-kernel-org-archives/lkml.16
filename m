Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F62283C91
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330216; cv=none; b=h+sxUy2F7y/I30UI2UDvf8x2P3h2oYS10z4dAaGiDanZ/UGXWKMKkf7rwY8I0g+FM18V0gXnQkYz2IyLsy1/iiBjGlRgAnygWD3mx+Dpyz8vhEPVAyYfZMaUQgz7pzvOJVXVuRNCsLBIt4K0SNWaFr4lag8mjhc7VTT8L5Bb0wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330216; c=relaxed/simple;
	bh=nyVXIwCxYqpA1EPsqZ/tIGS3GDdjdsIoSFyWQBwO2r0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RkcTrXgxp+i8mBzcDyLftoK6KxhOkQP3GRsXWxEj3icZcuwa+vG+1PNRwych0mkplTYbf3zDlzEASKqisWCXkyMITLQVISlH6dPl6xkBGeMN6SE47JDQny7eK4KoV27oEoXldrigIB9iReUj/pIE3TOVu+dAnGhU3oZQ2cVRu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVuA1Nzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVuA1Nzg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MCg1jw023132
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLX41ewAvawIzUNIg9oBBsNHTXaw2xrMEYTyVLovArI=; b=aVuA1NzguAoM93ku
	CIhcHBgukCzA6WsaKWpWm7zTDDaQU5hJxp/00tiSdcemHjFlZnphNdXwd02k1a39
	1zfQrHXLhRvG0QvoNGzT3tW2OHMaNd/WbQJzOJCJmP2MCD6YsA5JGCFFLy4j8Fij
	fFdR4th1s4BeY3ZdfYhQF1htr/ZnlHJIA2Q7AtZfyzCEbHqh3+vFOKjO3IURu9I7
	9ds1jJ8gCevsnOqoEyLAkJnk52GvsL4w0MqNqN8H2KnghKFA9pQDmCii8SsLGA+n
	5rWhXrtMsT+j1+WW4X/bSFhVA8m0EgHn/375M/6aCTNhRstl41LYWKIenJbmqdeS
	MoXbPw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4642svfrct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 13:56:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f3b94827so781998485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330212; x=1745935012;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLX41ewAvawIzUNIg9oBBsNHTXaw2xrMEYTyVLovArI=;
        b=gUrtQHw3DvkiO4kgjrJ9mpK9oucQPhacJLOWclQWvPNMKqzPa0u2ia5uYy4DguPvUI
         OSpIvUmmUz1zAHeGF47NL0/FUdG0NK5Jer9UxW8pF7+lW5l3BBPGSGe9DcNsl2x1OmfN
         t2saAAnxnsP/sEdm6bB18f3kTvL77PGBZuPcJULHNCGA5bqqJIa6d3bYHmZiA6sh33x7
         PqpNkq9hLYM1uPCAf6UBoOsReDZ9zVCZo/q3yZf9OkfB215x6/cHeJMU589Xrr8gr/L9
         lJ5v8m+Ff/HR10sLJcW5gDopv5jljrgQ9nyiFu7KnareVLaArs2XxEtfRBcvK4/XGWtl
         lX+g==
X-Forwarded-Encrypted: i=1; AJvYcCVaeY/U7S5mhTjDmP94soWIrgRWLuD5n+ot3HxVTYw4zT+HIzrJF/LzLOZguRZSzLpKcMFUR5GybxduDOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyDA1osgX+gDLw2BqFMFr3yvCo1aFFlHU4p8bsUpzaPvxOm8NH
	Ie21dE+rW7fWgOMgA2uYJSc7zmAolhMNMkyk8daVRvjH2V/qtJh0va+5LqnsKhUZnp66I1hUlez
	d/Vm+0X8d1+Fzimdx0/di4bRzUmYOFo1Y20oinoIDq5ttQ6cMlZ87xoLhTSbnGRk=
X-Gm-Gg: ASbGncto+Sg/Os8aDMIhh707VumQtJth39lry3XyunTmm8mB2wxYsu1q8fyerflLu9/
	mIe5U/goK8cwmljwYP3lavT3xXk1mz/+e6GZObo1b9+FItJE432ePDu011OuUZEwycQ0Y53qn25
	3BEgGKef0cpOwcR4yCntEPm8oCKa2izWxbA0KLsFTK1akaUPfL12jeczt5mrpSgdLGfbMNTfD2I
	1MkxVa+giKFfqNu5JIHNC7Oui0KYYND7xqzEVZdVHZQwXqQzFe18Y3glPCXux02mKGnzYEHAN42
	XxSqL0L1PQtEFKXMcBaP1uuUNahOunq53IGABGe4kTMiVoTONdBYM+NykOIhrMidvXwVm5mREh4
	=
X-Received: by 2002:a05:620a:28c4:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c927fb6519mr2112158685a.34.1745330211875;
        Tue, 22 Apr 2025 06:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0qRpkyBUKjUrD4kvThn3Y16KvvVTGoT6HNmzOB78uuI6p3Y6JljxDMeJUkjZNidRJE5DCFA==
X-Received: by 2002:a05:620a:28c4:b0:7c5:48b8:b4ac with SMTP id af79cd13be357-7c927fb6519mr2112156085a.34.1745330211573;
        Tue, 22 Apr 2025 06:56:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310907829f1sm13930421fa.24.2025.04.22.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 06:56:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
Subject: Re: [PATCH 0/7] drm/panel: make prepare / enable / disable /
 unprepare return void
Message-Id: <174533021057.807756.14047991918333049362.b4-ty@oss.qualcomm.com>
Date: Tue, 22 Apr 2025 16:56:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: G0mlKVT6BA3yRWwJPn_LnQBJ5t5JSlD4
X-Proofpoint-ORIG-GUID: G0mlKVT6BA3yRWwJPn_LnQBJ5t5JSlD4
X-Authority-Analysis: v=2.4 cv=QLJoRhLL c=1 sm=1 tr=0 ts=6807a025 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=8AvdZQ4tI53xHl701REA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 mlxlogscore=808 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504220105

On Tue, 01 Apr 2025 08:11:32 +0300, Dmitry Baryshkov wrote:
> While it makes sense for panel callbacks to be able to return an error,
> the state-management functions from drm_panel API are usually called
> from atomic callbacks, which can not fails and must return void. Make
> drm_panel_prepare(), drm_panel_enable(), drm_panel_disable() and
> drm_panel_unprepare() follow the same calling convention and return
> void.
> 
> [...]

Applied to drm-misc-next, thanks!

[1/7] drm/bridge: analogix_dp: drop extra calls to analogix_dp_prepare_panel()
      commit: b65cbfe0e1d8bcb74dbeb221d423dd926f326d05
[2/7] drm/bridge: analogix_dp: drop unused argument to analogix_dp_prepare_panel()
      commit: 0ce432e18c932a7fd219b9c2bf1db623fb0f7840
[3/7] drm/bridge: analogic_dp: drop panel_is_modeset
      commit: 4fc72e1fc46b0dca74c1f8c94091e524ad5b9fdb
[4/7] drm/bridge: analogic_dp: drop panel_lock
      commit: 62ca1c3a146c73f8b8a381bf4461a82951defb8b
[5/7] drm/bridge: analogix_dp: inline analogix_dp_prepare_panel()
      commit: d5f34ca5df7c0ae075fdfeba20edd6f81c792554
[6/7] drm/bridge: analogix_dp: ignore return values of drm_panel_* calls
      commit: 58a71d2bf103550f809987e16d8c1949be719040
[7/7] drm/panel: make prepare/enable and disable/unprepare calls return void
      commit: dcbd5dcc956e2331414fd7020b4655df08deeb87

Best regards,
-- 
With best wishes
Dmitry


