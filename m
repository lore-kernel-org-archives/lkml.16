Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E612288CB3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715293; cv=none; b=PqPVzAWh6cdC3LOdPdFv2CmGA9Ib6sKv0Qp4m9YzWOwWItZcQFq2Sfh2rmb+Nj01wHl9JsVf0/K3fWo7iSNxjrbKGObjzN3Dda/k5O+us+AlIbsMl1WXJMnF28kEfIIggiVKfV/lIBB32LqP9sdU0FZVkLDlkOs3hvfhSeHC04U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715293; c=relaxed/simple;
	bh=IvmLFY6gRrLXoQmeqKqKvUQ3dyqswU/FI1eB0oi0vWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sU9iMzRy8GFtD+lZma6rHYtx4zfMNqp86REd5mXbF+KdhrCT6jCmc3J/pmZJuebFjZv1yJFEdHRMHJVaSmhdqRgqTYRiJJF3hQ5rMpTITF9qzGe+yXw6v/wJalKGtamQ8VgOt3ZU8UVTfUuVYnOnf4sIw5M/v2aqdqd397PeMs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d6HQItCE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6HQItCE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tGq6005840
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=; b=d6HQItCECyDmG7wO
	X8WhwJIvKV9ZaySz9lxRHK+O1V/8I4z+0o7aDBALfFpSIUkltISo1Qqhlp2oJQ+K
	Ax8guywMPt6HXy5Pl68I0bkYi40S3LYvCuYFimu3VrN8LGIHrsV+kQaDfbUVBDVF
	tnhaUBK+DSEy1yvAT65uZwoTIlj9DlySBq/AJaIAkw3dm3W93Ylb3fFnpPZH3sbu
	CY8Ozr1RDijt4V7BC86NPrpOKY79CuV1r3hKAPgKbm88G2+TxBDj9jH04mFC4/Ql
	JtlEtQGc5GP3YDjFygV2wqwZwga15SzDyqlWcSKhvQu0VWwYYfaeon6u9gpcz7eP
	F4+VCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj7yxk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:08:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c793d573b2so964893085a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744715290; x=1745320090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK/JFVYlOAXErlNkamOHP5njDdOfVrTDiQoYt7ITYKQ=;
        b=JUqBgD/Es1AqKm3o3UY/f/gouwgcLK15+Il80oXzrEmFeTaDtKHcsWeGxpvxJk7iXp
         Yz4BDK2bVI6qDFap0i5PueQu6H87D3X7/WjVUA9AlUoHrguabrhNHP4YCOwufqzPUbsK
         ZswqCmmkK/er09PGTRIYS46v25/TPKqecXR5mOIchjO/gOcH9pH+09S/ver9EGtFZZ3n
         KFpJ0Z5ct+13Ddtt/XV3hSN7ZRUMdxEU/CDkMXNoBg0k2SlL5A3NqXm8ffsB5ecrwyvH
         SPbj3zNliPk/CJeuQUkevgTDVx5tkZCCBGrxqrnXR7jSHUBhwRjY7R70cIQUYJ1uQ39q
         fVzA==
X-Forwarded-Encrypted: i=1; AJvYcCXOxzM2eU4GVE6gIOF7kHnZoMEfkn7+kHs9M3WtodTfO1wTutjm9KtF2OvGLXNRRy+zfYtQV0Urt6BxV4w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxECBrK9z63njX8ANhrKoWKdveqrgZ6lXbtlsjCfTop9zEaYJiC
	YxSblWNtoU4usGDoQLE3W30Ukv0kQ/3VDcXZZ7aUi9mlnSuufIx7p+nw6iLTy3NOgoiAT+QJuLK
	p1EMnZHbhH67qSLZl1CYOMmv+1HMBVBBSpPGynDw5RN1DS648I21Bl009rbRypGg=
X-Gm-Gg: ASbGnctDmQLJb+pE/msiNdzEuWB5QsGfLJuQOrTkaE0Dvyj9Zk8eGXFJwhlGm3oJ9Q8
	gNrR8GUK7sGFbXkDmlGv+jd/MaLE5NKlVp3yKeIf3qmW1w3GgkReHlEyoJ8iDa9LWDhhIDoY6jh
	r31q/3c2Z0BqhrMFd3OviYN4IlzEqsHM+ZFKZ5m7650TK9+U2+sJgF+AlCCtZxQGaOylUopCGiD
	NQB33tVzcHxNtG1A5dlIYPj9drbKAuZ9VVpKwuN9rnvqD6Bpt2XdA5nju0ouv5+p4KFwvumnLfJ
	7aLdx5//TcthlMQ7lvHdbrzyV9vqLtFRHcUQ+jAbMkgJ5EhGD+14DemxJN3mOOU=
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7c7af12ae32mr2051838985a.51.1744715290129;
        Tue, 15 Apr 2025 04:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoUA8N73ZaepWJT0jZ3DvxSynJfsHmBtSCM5bS4zH20AS44fmQeKF7Dcsu9apRm4T/YkvPPQ==
X-Received: by 2002:a05:620a:2906:b0:7c5:5692:ee95 with SMTP id af79cd13be357-7c7af12ae32mr2051835685a.51.1744715289698;
        Tue, 15 Apr 2025 04:08:09 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d56b5d846sm443672e87.181.2025.04.15.04.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 04:08:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: (subset) [PATCH v2 0/3] drm/display: hdmi: provide common code to get Audio Clock Recovery params
Date: Tue, 15 Apr 2025 14:08:01 +0300
Message-ID: <174471527399.25276.2451594776232891809.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
References: <20250408-drm-hdmi-acr-v2-0-dee7298ab1af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fe3e1b cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=1CIDf1XVFyXLR-mqbVoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AEFgnQ19SJgF49_m3L0ZuU3kw9DmNWlR
X-Proofpoint-ORIG-GUID: AEFgnQ19SJgF49_m3L0ZuU3kw9DmNWlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150078

On Tue, 08 Apr 2025 16:54:24 +0300, Dmitry Baryshkov wrote:
> HDMI standards define a recommended set of values to be used for Audio
> Clock Regeneration. Nevertheless, each HDMI driver dealing with audio
> implements its own way to determine those values. Implement a common
> helper and use it for MSM HDMI (tested), VC4 and DW-HDMI (compile-tested
> only) drivers.
> 
> Note, this helper simply implements the database for these values (HDMI
> Section 7.2). The question of selecting supported formats and rates
> should be handled by sound/soc/codecs/hdmi-codec.c (pretty much like it
> is handled by sound/pci/hda/patch_hdmi.c).
> 
> [...]

Applied to drm-misc-next, thanks!

[1/3] drm/display: hdmi: provide central data authority for ACR params
      commit: fec450ca15af63649e219060f37a8ec673333726

Best regards,
-- 
With best wishes
Dmitry

