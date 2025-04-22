Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07EC19F13F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360511; cv=none; b=ZRcpLTLg/0vits7FZBfNzh2vmMqLPdS7l3ebhDUvYZ2Y5s6HKEiXMZxS1rI7guuaYj9CbiwgGKE5YD5G9UJEVo2aSZWBRrtL7EDVyEMX+7PJ74QlADXhTI3iqM4DvbxHz6NaaJ0rdlEgnEKG49fDbokbzPUqXCz87wZLXNTsCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360511; c=relaxed/simple;
	bh=UsjQTI9DWmo6U6QiJHMG3Ibvb6nvqmDeHDkJXkSvevI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E76MNtj8TEFEP6tPKoiRvWA2/CzUTEwVtC41mlp0n5atNee344bNgUR0OclaHCAGd5r87ZXH8nZ0o1ByunU6bdfw0QykhnRzd1+ksIheBoLZluJE5BTegLDJ4l5R60t7Bcv5MLfnKlTvj/N6UOxKjBk8D/IyozYQSv366ZcT9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YHWN2RQt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YHWN2RQt"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MKpNIm026844
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=; b=YHWN2RQtHNBMCJyD
	EYzx9fM5u9uwFTy6s+Nsav9rJpeYHPqbqLNF7mlqS8ucurabTU06FST6MJo02txz
	MdFM1bpQuAsNBtrvW1gb3XcfpvWr+owKEZzFUX2FudDC7Ko+eWpsfosaX1/RXAa/
	IcawMPcfhbAQlDw4eF44JMjm6Hcrfe2zaNo/Pp8RoeN6gAp1gfOgL6KoNa4SBf5r
	rf9IkTd5oMZjDlSEDUUHR2u3Tho0wQGH8VZmdrSX7Sw3O7UX6HND7Bmvwgyjc4tl
	ysJLLbLMA1WBH18a52TlT9DZYKEgX5zysNd8kbTIw88XuK+i5yjfuQ7FYO4g5EPu
	1Q+tYA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh005jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:21:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5750ca8b2so809600785a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360508; x=1745965308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFVnrpWb050fxv5AMU0KXMBJxaS68SUI9iug+FP01ew=;
        b=cao/15kA+KHu4egPAkzbU6LJBzfgDxsD5/AftO34jZBwn9ELsjYWdlL2n2b5cPGm+a
         rGcHNw/gcWzJr/RFXkm/oEk1/88eAsBc78JKZhPJK0hVueZ3xr6id23Zch9BjFd2RIL1
         kzyL2sfjFeCpkYXnumLdoeqKrGZlWoisjlBbiTvYBi11tXD+UTb3ZADsxwm20ZhTRWrW
         rn2AQIeOBEGx4X4i5mU+UkNnyhK070wTbKoWB4GtQU5bFkB3G8eODMpwx+TIMURdNXQC
         1ICN9QrXaG/nsLK9Mt50lofxFOK6uPZ6eKYK5jS7lJAD5r+pvyoWGj6MZtD0egoAL9hy
         F6AA==
X-Gm-Message-State: AOJu0YxAxdOoNdTrVJH0kjXIO/6H6W9KoFZNWghw1V16nDCBuwDWIlsh
	QEM4b16iESqDwZ1/E2FZMOWAY7xt78W5+u/9jAbXOKO9vW54VdTz0JvJUrQFjgnCfp+60r03usJ
	IyEkj8n4Z8Vv25/DsRU/romrEuwUcRIO77YnMQWdTdLsqyiXTb+NAtf3uBDUxbXI=
X-Gm-Gg: ASbGnctocazTn4eM2x5RTzqhskMPmhbyfjfDenGIJDpnhC64GcwsnJ/iVg55yuWDYgw
	93fY19vX/b/fzB7WhjVunWkbUx1bPFafzLt1l5FZM79Q7rYPiKN0Ptlg+OGbbmnRIOpdfBqQUtD
	H7/7jm5fSUundaKxw6qzdToLqFgdTZcIAQc2i7vo7jXOANsW61dnL1KesKHigUUZLT7miHMskhI
	TSO1/Q5A5bzDO+MMLfs8/irmQkt9ehCXzdM0GQSVLa8E1wGlXR0iBEb4cMP8itiRbNsSVyFlWAn
	M0p7TkSkDmVJkYXY86gkX/R0IgEXuUuP12nlTgKHpOlglC72mpmICV8WV8V0dqLxpkP9W/qMkwP
	FNujPvDTRyQKNjnzbVRdaW8ea
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id af79cd13be357-7c927f849a9mr2413025685a.13.1745360507820;
        Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOiwKU9TBLfD8mAj6HNCGwIQ6VsntnnuJ4wlLR80zdOsb9Oy9RmdN6FhXt95pYuyHYSfsmlg==
X-Received: by 2002:a05:620a:2586:b0:7c5:96b4:f5e5 with SMTP id af79cd13be357-7c927f849a9mr2413022085a.13.1745360507403;
        Tue, 22 Apr 2025 15:21:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090822ecdsm16630271fa.85.2025.04.22.15.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:21:46 -0700 (PDT)
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
        Sam Ravnborg <sam@ravnborg.org>, Dmitry Baryshkov <lumag@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
Date: Wed, 23 Apr 2025 01:21:45 +0300
Message-Id: <174536050030.3678509.7013496889543262628.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
References: <f167608e392c6b4d7d7f6e45e3c21878feb60cbd.1744958833.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIyMDE2NyBTYWx0ZWRfX2FzcIhZQ5058 McsoHNbfVPBrjW0bbPulZjg0cc2RnMLfgeLOaR8F8jXGeKSDF09UhoUlwhk+5FLNLzW75cs6Ezz K5oZitH4A3awk+a5KhATGRnQBft/1gyO6lIvLQGEeF7bLKF1/s3fLqJTWn8/bQZvbcZEQzmDTw2
 MGPu1FZkF7ydeFDdiQX7JPk1b8UhqrPjjsynXtjJkdplUUyY4hWaQ41kkmxzelmgytF7farc/kr 3RAV5yHWRv5Gt7yam/8YYvTSeMRNQwuXAxEoC85jAgymq9q+0NTZR5SK13GqpRxKuNhlSN9Kr9V 9yq0zbftKWYrQ+xBb/DZiE28JaBLXZ8uecG8D4lH98URmzVrnwHIMHWMrvs0xqBeD5ezt5Z9sHY
 +oNAzIi7iVmSMS6cWOHGB8wPm/Q0Zhtu7yE2StQXV8GweF4+KBm6aSqypgnAO7QNqwch/1na
X-Proofpoint-GUID: BCIVD8FfrJFnlNZw4mURJZO0-j4XBNz_
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808167c cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Epe2dFrVDL3RtkqF-aAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BCIVD8FfrJFnlNZw4mURJZO0-j4XBNz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_10,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504220167


On Fri, 18 Apr 2025 08:48:16 +0200, Christophe JAILLET wrote:
> If lt9611uxc_audio_init() fails, some resources still need to be released
> before returning the error code.
> 
> Use the existing error handling path.
> 
> 

Applied, thanks!

[1/1] drm/bridge: lt9611uxc: Fix an error handling path in lt9611uxc_probe()
      commit: b848cd418aebdb313364b4843f41fae82281a823

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
