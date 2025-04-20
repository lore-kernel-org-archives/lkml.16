Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E7582899
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745188554; cv=none; b=A779oFwFv7tdcEiqUKKl20j3cXeR4Ofed4LuKON3GD88xblY8uS9KbSlHtHiG0owaT4/UL+D+ahoseyhf0YmVcrBX1e61wTH9VRUuOhqLXTmR9uhpYoFcAgzl5jlb87NfYRRperZ54UUOus9hVw6OWbiirPNCBL/LtHwWto4o4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745188554; c=relaxed/simple;
	bh=XRxNxsnuSO3K0gpdnSRQxV2lMXRCSK4RVoUJrzFEzq4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NbGSAQgtEa4gSdKIMgcfo7UdLplumfFWIj8XtT52pEjlS3Lto75CIF4jUm2t5+Wv/0v006TLwoLgVJL4tdZwq1TSuehgKuBhJyicXLbkSx6U4OqFKsHtS+q7rtgrKgKupwGKbannCukoNULemgjvxu84V6kES6Y3yQE1JwLVJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VETGHU7Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VETGHU7Z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMIJsJ000537
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:35:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWToxAdnI6Aa9yCRFIPR9W7z9KJYBd0BVcFA7/xQZy0=; b=VETGHU7ZdMmSPg1u
	mm6xJoxzR7diITNxdHOrVBiOWOsUjmYfdOv5dBArLmnkkTpXpazh41iBZ+6r3O78
	XoMjEw0sAZk06VoWWyMoi29CbaHKibMZZyvR+ESTeylwvDCKLuS0I3DXv+CsnDWL
	1BWeCOexNAveWvKhWNCr3xUNnM7EpNyR5OR3CRAAFcxPl5vY/v5CCNatdTdTY50s
	+6Voa1veAjLBGzoSYAAlt9CK9sWSYpFslAZ0rf3NiMoW9kJl4ckf5RTTJk4dORt8
	TT9f3y9b3/JVyC8DGlq4xi99+1CUA91D57lvEb2yi5gqg8A172g1luA4OpSb+J3m
	tEoeZw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qtnud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:35:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54e9f6e00so666314885a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745188549; x=1745793349;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWToxAdnI6Aa9yCRFIPR9W7z9KJYBd0BVcFA7/xQZy0=;
        b=cuPjUv2iD1vPYHjoCCgKthZayZdJrmIMzWduT+kSKG6uPNj25gZJ5GW8lRP7KAsYfu
         efOj+SeGaZ3UIacFVx3CSz+1rjWGxAQ2Bzls+S9Nf0lkMcSrYmKrHo086w5WW1DFcTpL
         IU1i5tAMpD1b+Eb/q1XhYxwKJvqOBA1sWiWP59YpcslNeaYH8EVhIh94rL6r7FYAQpko
         AummMm9cEFpFoxee4mzd35SkZC1rkxNXjeZxsyRf8ZXND6FiscH36sfjHkbyKNAdh68y
         twdBv6S1bPBSeTdcpoVTJC+8jbPMX9w/EqPStzSL/+1KQ/ORjV32xEdyPXuKZeYjWm1k
         5kxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2GG//hIF8bWO2gtwUzcTWjttfGeVrQS4j91FxbFPguE16nqrDiM92ftOmThxVBMRPS36jEmFBJyaZjys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZdZKspidc6EmOaQNobv4Ruq7hDnxmKqDL5knfluwPQ96JAbGQ
	g++sNokw3MwnDPPO+53VoYHuMiW8KtCWe+PE/etO9UANuClEigoPqC2NyB/A3THkgXt1wsKvNi7
	s4VmVW5HM1Fk8y0XMX4wEkhnxGFCoiyW/qJdmsbYqRpNLpmVXoepcLT58o7FzJXY=
X-Gm-Gg: ASbGnct/sDIYpCsolKdfPZzQAjtZq6Bd6y7iTJMENaCiVcwAHsGpw3mC012iixE1lh+
	4V8vUvh9lKiQllsGLt5+wn07K+fji42dNV2vXAfHWuq1hvrC1hoMX67VAUOGWR5JGJDkvW56Ju9
	RpZHLjBtjRsZw3JMNevQcURkxqI45yn7jDg5tL2FayEzK0v7QmA8qYlCCqIam+W2+fJOBgQHdSi
	r5c3E+m9kh/bzjqaW/avLwYlfH62QYLVyvIdrL/bAE4yL5PkXS4N6twBGoZACBI4jyikW/Z7MQ1
	RM61DT+aKuW9GDixogSKamzWlV1ioFBUYP7LbJkY8abdcEMlcDnVB/gHFTn3O5M4WcSw73O9peE
	=
X-Received: by 2002:a05:620a:17a1:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c9257ef5e5mr1664104885a.19.1745188549547;
        Sun, 20 Apr 2025 15:35:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBIsV9h73etG5RMWOHPnVmCLLh+xKK8HOQ3zsl0XthtAmLfRYE2wnVV4KjY87RqdCOwW2XyA==
X-Received: by 2002:a05:620a:17a1:b0:7c5:93bd:fbf2 with SMTP id af79cd13be357-7c9257ef5e5mr1664102385a.19.1745188549177;
        Sun, 20 Apr 2025 15:35:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090782facsm9022941fa.33.2025.04.20.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 15:35:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Damon Ding <damon.ding@rock-chips.com>
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, dianders@chromium.org,
        sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
        boris.brezillon@collabora.com, l.stach@pengutronix.de,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
In-Reply-To: <20250310104114.2608063-1-damon.ding@rock-chips.com>
References: <20250310104114.2608063-1-damon.ding@rock-chips.com>
Subject: Re: (subset) [PATCH v8 00/13] Add eDP support for RK3588
Message-Id: <174518854674.614969.14581984196577762340.b4-ty@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 01:35:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=680576c7 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=XGKhw0KbdVzlZrVxzTIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g9zGhRjK8hYqm8XandBaXNoe66HqRr6I
X-Proofpoint-ORIG-GUID: g9zGhRjK8hYqm8XandBaXNoe66HqRr6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200187

On Mon, 10 Mar 2025 18:41:01 +0800, Damon Ding wrote:
> Picked from:
> https://patchwork.kernel.org/project/linux-rockchip/list/?series=936932
> 
> These patchs have been tested with a 1536x2048p60 eDP panel on
> RK3588S EVB1 board, and HDMI 1080P/4K display also has been verified
> on RK3588 EVB1 board. Furthermore, the eDP display has been rechecked
> on RK3399 sapphire excavator board.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/13] drm/bridge: analogix_dp: Add irq flag IRQF_NO_AUTOEN instead of calling disable_irq()
        commit: efab13e7d13a641a22c7508cde6e1a5285161944
[02/13] drm/bridge: analogix_dp: Remove CONFIG_PM related check in analogix_dp_bind()/analogix_dp_unbind()
        commit: c71db051142a74b255cb61b84d8fedae3b70952f
[03/13] drm/bridge: analogix_dp: Add support for phy configuration.
        commit: 2c0883459ed62ac65784289e9236d673102eee68
[04/13] dt-bindings: display: rockchip: analogix-dp: Add support to get panel from the DP AUX bus
        commit: 46b0caaad3a5aed817a02b239d4cb4392c2a5dea
[05/13] drm/bridge: analogix_dp: Support to get &analogix_dp_device.plat_data and &analogix_dp_device.aux
        commit: fd073dffef041d6a2d11f00cd6cbd8ff46083396
[06/13] drm/bridge: analogix_dp: Add support to get panel from the DP AUX bus
        commit: e5e9fa9f7aad4ad7eedb6359baea9193531bf4ac
[07/13] drm/bridge: analogix_dp: Add support for &drm_dp_aux.wait_hpd_asserted()
        commit: c8f0b7cb01eadef03558b21245357683409da438
[08/13] drm/rockchip: analogix_dp: Add support to get panel from the DP AUX bus
        commit: d7b4936b2bc0987ccea125d9653381a1a0038d6d
[09/13] dt-bindings: display: rockchip: analogix-dp: Add support for RK3588
        commit: f855146263b14abadd8d5bd0e280e54fbab3bd18
[10/13] drm/bridge: analogix_dp: Add support for RK3588
        commit: 0e8b86b6df143662c631dee8bb3b1fff368aa18a
[11/13] drm/rockchip: analogix_dp: Add support for RK3588
        commit: 729f8eefdcadaff98606931e691910f17d8d59d6

Best regards,
-- 
With best wishes
Dmitry


