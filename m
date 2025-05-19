Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6B27467F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652335; cv=none; b=aMLtpLYFMyBYeADqVUwfmUL8xLQ5vQGv02+d0seSBv8pfKwsNWnCxuAjXX6Te5ROjxJXDsyj9sCTm9JXYyXRA1Z6sHrAgRcsVIV2bWQA28dllXoBU5VwFHAG1HakvIPpxhTfNk4LZxaiel84Il+ZNJAWY9+rsJS0phXZb2l8x0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652335; c=relaxed/simple;
	bh=laU7zJS3YV56vTABXTYYyCyaK7vtQP0nr2IhS/ljwl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IlxUjx1ySLgJJ8q+sW4IFQSPShcMHVfyz0GXu9/mXBWfjLDOLZFnyXWGDGJcnpmvq+GVBJyxfzTsPoeGolVfi5DyoFafMoZiAgawXLSyrBJcuNHiL2GP9APWoFTpVjWaMqr0/hZ+oszfkMIqEb7IPvDbMN9KEzrztEk8w7ZLSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgMTqKBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgMTqKBm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dMQq002030
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=AgMTqKBmMNCFRM3d
	QmR+FeI7IoPU3llq3T4SCH2Hfx8Oet0nJ/zWjbnHMg5qQKZHW2qhJLn4I32vWn1S
	H1WjjmW4q32mwrRmapFrMFAzwTo5UXwChnWes5kAuGwYkYM5+kFImwG2SSMZB7sZ
	tEjMXc//6RKqHdcXXj5978JejS6taGAXEjRUDrm88wtkUsOWYEQARJXuoF1Wjj7J
	ZIYzmgKcoYZ5a76Y/l2jL+IjOKL/PjpzTVUGyTP1rLR6eXpHEIs1+qV/pUO+X8hi
	XEldOAP6lKYg0454DFIFsmcqoyOVHYynk7woKlVs5XShCB6YZ52tzPNB22kvNk4J
	rbTWoQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgdqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:58:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8c6ce05e0so29247676d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652331; x=1748257131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
        b=jml9F/pSBkTP2z3QqpS/ySCEka3Pi96KRK7Wepr2avkRK+8VN8+/pqNbX1BUPDW2nd
         ZSoNa4cg9bARF+th5qBosZY1EkZwoqCRZ3pQfs5VKvMhTRzFQIc2pxI2Uh3ibH6JhUEk
         Un19BMeA2e8YF/011uisQ812jTp3PjbHMJdkDPY/FDXTTmB7c+Jv02fIzkV23f5C+tKB
         c+zDaG2h4/nBugvNWA+yawZnpUQtn/k/M9WvD5oXEet9H+eQRhS1eP9oY5B7sfzz5fpJ
         i/8U/8Z4ig4gYQiQyGjzGqOxYKeT32VY6OIOzwxv08W0FGquyyGRfzKPzF1bDvbaPUNt
         ++fw==
X-Forwarded-Encrypted: i=1; AJvYcCUw1fZ5HwBwjdace3f5Z+WJ6HOOgp/aN6N6PMIwE4P/Hn54OXbpAVTnXkIOQ7RxvQrk+aX2+V5wVu0xcU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNxUeetKAfI/e6BokMWu49KFIBnAVgQy7rIsPdfpD3ZKV1059B
	sutSb9WgMTb+c3Km/RAJplb3ny6dAEk2NtksMAmCAUEFJasUcbkeLzTPQpdvq32X66K5khXaKvx
	+NbsXHPL2mT4e/anZgRk92KZCg/0LvcinIkqysHg2zWL9KPoj4CMYnp9Y0s25Wzv1uvg=
X-Gm-Gg: ASbGncsVP/Rp5FAz123IN43qWLQazyHwWNfLU5J6WCezpMcwZU4ITBdm9JEZfuy/Etc
	xFVpm3hBZf8BwquFtkpU5sG3qisRneKF+gcJA3Vzm0Sa+mFTGUjWMUaNqrMy4D4ZpQspZ0lFW2O
	FUsqWWJEFjIPEqx2BjjLiO5qLPh6GRz5WJzuTpOZWV0/GXm5v1oBmp+EK4qjwGiBSAX3VTnp083
	3eaoRWhVrATQJNv08T3hIbCCb8KBbMZPn8HjCs/Kt96z2GGYPcJEVRJFzsIWvViPDXwx6q2v0AR
	0gGdEamtD8Ps6RiNfRJ8WydBTifm0OVggS23JMCBV4XRAG8Ti5en+4C8iDhG/CgXwOATrzHs9wb
	3ErcuypoETqa06uBMcB7osPF5
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr224935596d6.23.1747652331147;
        Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRauQlOm++SfaTq2hFhTkCOAP4U1NEnYr+eOjzxOglAC03Q1vWVud53//B6i/067FYK6Nu1Q==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr224935316d6.23.1747652330775;
        Mon, 19 May 2025 03:58:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
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
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Mon, 19 May 2025 13:58:35 +0300
Message-ID: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0eeb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ACIG7tjf8XRmbPARDbCBX33qrJNlbyid
X-Proofpoint-GUID: ACIG7tjf8XRmbPARDbCBX33qrJNlbyid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX2Lk7i6QGtaQ7
 Ftn3iZ8GthzgaFJWOPfIAG8J82UjAoIm/SxRqHpargUe13quKKRejwQuJlDpL0RynwHFlfXodYI
 yhXHZY+/6xyxlGqTUbsvV5I6FAMvi+TithH7svIDSP+/wkANomGcxn4ZQDnVo1BZsPbWdrw6q8u
 9QYjLSpxZ8gqR/0x19oHSSgvQsS++4qJ+/hkM7wiRYZRAZ1P+tFkOP2kvJ7tqOq/gFlzpbLcT22
 YtrzL2BQ5v/R7j4hDM2lAACsOYrv8qRAHDNmoEgjAhBNCAKW+C+OZO72XsynXebDD+3VUyvjNTf
 X44j17CDzkk82Hb3JZvXtgi+u39TuuWw1rsA3DIPFX9BnyyHgjq+MNECTvjR/yetc2hbUGo4qiF
 A05W895QeIVNOp1Z/12QuvZ5tixIFLfsw38UHba4j7Dk7MXbcvEcwB+rDvo6C3/9mbtWveLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=879
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
Message-ID: <20250519105835.DpaqF1Pvlx_JHgeIKfJ8axxk_dGsM5g4auvW0RB4_ek@z>


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
