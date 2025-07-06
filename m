Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1B14A0A8
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751802607; cv=none; b=nGuN0/gle0A/oFpAB+pOvIAM3yFyg3F+wH0WL9vIlgrsrEXBryTozZanFjKTwMHuSOa/ev6WMrh3+YcGVNdWBvTjMAR3AlTUwv8qqECfHiy74sjEcdIzHrLSowEHIi0GzVdbiDhRgHUJYf0y0msU/dpO7qFsK/Kx1ZRyKyMvqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751802607; c=relaxed/simple;
	bh=h1BsmiKChKnTyvXPWMsOwhS7bc/7uJacFkQzxL3fWk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BKpIPF/ZndgfUB3v2RY8QiHiG6HIpWcxuItX4i4xPALtU6PHrOh0LyfsT0SHAfW0Sk2P+Iorz9O2hDWM2VUnqcFRwkawzuy9CDOj7lQ2D73J9IroGwM5tCtW4ZiCaMDSbk0msbsq6nKeJAKVf1UIsMAiI/jb4omzP8sPYkxJuj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Leacun/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Leacun/c"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566BMlNn012795
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=; b=Leacun/cxyO4anBW
	d24A/fKZnr/yKL5yoR/0upUutLNvKKfe+EETlP7P9kQ7ng3gEy89PMxdI2cZUirm
	ZFIWfbiYxJXGvY22Qh/MhrLuCLodKYktGAb8rwNksiOCVbJGjF66p6otzCIL9Fuv
	kzoj2TKpfpzn4HiCrpv0HvS205AnZ7TR+htfQItZsetjbx7ZmvEZE9Za7j59rrnE
	qAx513Z8fSzzYRSCwCwLNOVfkBD8xYKLoPb+Yvr3JsllAx69AowytAOUB6awal1F
	+pZocxyFwGCqwxqPMvbOI1W1XiRrQzfH2ss1VtURH5CZaxrn+W5Ivzp2BrH2sMHK
	gyoypQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdqc4uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 11:50:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c955be751aso323283685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751802604; x=1752407404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q9HNInpFc8Sm98uBUx5T9Cx61YxOobfap1a952dfyZc=;
        b=I5adrrLXlr1H9F7W5V83rPDECOe9aKRgyseq202u5dE5uUatiWhWlJmWJOUDX1pBEw
         gscnKqFfyzCydD0eX9kWEOnlV6+1G4srXBGznSmEx7e9cql1rFeF/5oAKf/8IArckAYe
         Y+4gcVym+d5vY78inrs3qLctDwBspW4ErfSZey1x98lCsUh9pFhP2v6dnM9Ne8JwGBHV
         TSrveuDAWS6IShU9kkROI4AhJ9wY9ie1j8p7qYF/2YerBWRb0BapL98AAB/ITiw9O5MY
         sGXq2FPcNucHEGLyh40XiFkrXliQzhNa/Q0/4GGaoAd4vZZcBcG+SHFo5d5b6qeQx9N5
         f6qA==
X-Forwarded-Encrypted: i=1; AJvYcCVuitcneMacb+CEbl5q3q0U0JVGJNO3quNv3MHmgJmlYkiZxA1YbGVNQJouvJz8tAEKbLfvvEynEJ4lPls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfzWH9ZuSI7XhcFd2G40D1dXY5wbzAAvyxCBH258SoPOG7Kg+E
	KE531mmiqDPwJzEGH7P3ddS9oQTsh5LoZlmqQ04Gh+EoPTeRoiBURJxg2/3unMha/uQpTl5gPkv
	PFbfHC/i1LWQaIrHNRFYGhuAZoupKrlsCO42siYvLTDDeh/BVQhACRFzK5djoYX6+jUQ=
X-Gm-Gg: ASbGncs1SDoJhb2bBrVfvJtr/bUwYIy1mA6cKmlDI6gdpY+XeDicHTZpc+DOlzKqH5k
	cfwlsuiAda190WrH+O/6umVpItzl55WA2ZoklRo06ZApdztK47u56RjGoMfvpVQc39blJ4TyC3S
	RpSJQHfvQv/SJFh2c4EFeQMkVxlGXTkp+sGC4nhsZ/9mmul70QbR0PV5nw6ZjucyphF+wpgpuan
	fuSYKYkkO4dsn/QFgjXNMBpOekPwDBn/uqw7lsBavCXCB2DifPeOPP7+qSLdwwHGt3nCswiGgoL
	6fjXXZlMuYsVIhYA5Wrd8v/9SbGWfF6bpXjWEtx9OBX26v1uIJzwA+t91g1dLAPlh5UJZAi/5Qb
	MKPBwzMStLSBjsbX23CocOkYqG5f0YUNSkwk=
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id af79cd13be357-7d5f2877ceemr597279085a.28.1751802603994;
        Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb6W9CB14eZN8lAc1Ju+O/wZfg00R2RD3YvSB64DN3t3zQ6bM27TvwmM+CwZjrSQ0NktwoPQ==
X-Received: by 2002:a05:620a:4710:b0:7d4:4d55:98f9 with SMTP id af79cd13be357-7d5f2877ceemr597275885a.28.1751802603572;
        Sun, 06 Jul 2025 04:50:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d8f2fsm940440e87.78.2025.07.06.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 04:50:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jani Nikula <jani.nikula@intel.com>, Imre Deak <imre.deak@intel.com>,
        Arun R Murthy <arun.r.murthy@intel.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>, Dave Airlie <airlied@redhat.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/dp: Clean up white space in drm_edp_backlight_probe_state()
Date: Sun,  6 Jul 2025 14:50:01 +0300
Message-Id: <175180259610.2709906.15531384408565663524.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
References: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=686a62ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=bpLDS-e79snoD0d2c9UA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: wEYBwQOV4BStmCdX1qpTxzysMIgQlpqx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA3MyBTYWx0ZWRfXxHeOYbjg7KXy
 VUfYNP7hgAatP98C+G8wjXwjJaGlyu4yh6oBD1RiPcE8IrkN4pojRKApzFoH3z9RCiFjRkEAV3p
 0DDyGNj8ttS7qUE0/nyxHiLJ5jsL8EQ/3RA5qnUbMgppCFWJzBA6Tzx9hSszZ39/nbea2Ns2yXl
 dDlGfac0oiXwT1CXaVMQ3YClEIo00TaPTdaRu4auIAAKq2Brpk9gQVdvO5ifFylWT/sWWLHHqVi
 kzzT5eyzAlh9GY+YkmdEfsYyWV8UtxASHbPDRc7HZ/nmCpZBig5f+NpvgOV0x6XL0N6COE5lSx+
 EuUzw8nazdFvyOfw6xktSIkxZxszHvPyTA2m/JlEhawSKcc2A7WVj5zZMxpPbyjFg23jEk49HiU
 E6mwYCfwdXcrTLIirDA1UK6L20HHmZFwv7NO8SY08dGBdK9UJBaI9wjQNUaaEO9RjlmB91cY
X-Proofpoint-GUID: wEYBwQOV4BStmCdX1qpTxzysMIgQlpqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060073

On Wed, 02 Jul 2025 07:55:10 -0500, Dan Carpenter wrote:
> This code needs to be indented one more tab.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/dp: Clean up white space in drm_edp_backlight_probe_state()
      commit: e33f256dbc293a1a3a31f18d56f659e7a27a491a

Best regards,
-- 
With best wishes
Dmitry

