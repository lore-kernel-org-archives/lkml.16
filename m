Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762101A314B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743357778; cv=none; b=kEtcBv0uZsLwG7Wuuwd8TIiK97vG7T2PYDpviYkeu3rftY5GJrSTQwZWccR+bIQx7k/gMGb/5705lMMcpEEIJjVxwuqucc/Y+T1cjzfGdb90M377Ti4BdWJT751vMgoa4Aa/NwuNiht5tk3h410LTEdl+Em1YPTPNvJ4qo+UA8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743357778; c=relaxed/simple;
	bh=TXYLh/RcMb5W+PFVwLVpt9syPHW6Z38wPnySREiMUAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dQ6F0ZEhQ+2THoa246e6SUAWpKHXC3UuNqtNIWMBsJ5KBXgjpV5Cio0wIZ05o9656TczQOJA03w2K4MnM0ZcFqDFft0AitgG8Lr5q4SAUIx00MOfjlVIuAV4u1w0hCQIqGtlmdUfiSxeTtBSeDAG2bXb2Rqx7WUPbLhUW89gUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R21EayuK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R21EayuK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UB3BaW024224
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:02:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlaN7asJ193Fv+MWu0+aw75zEOU6L/Dd+AbBmRtY93Y=; b=R21EayuKxRFlQ/v5
	z8rgfFYBWcq/B3MBLeCi+vWKR8ldpTUF0l9O9c6/3eabxszkg1ATPOqv+U5NViIC
	EdWcGqrtK2iqV4vHMP/8rzESZpc/Hkdhs4em9l8em5trodfgrNX5CW/ma4+37fN6
	4C+3aCj+DfbvhU5SKrLS94Z4KOboCKXVHXj+1iLTG4UpipWiu5Fp7AOAp4wrB90D
	9KUozjJ8qrR5BDIsl2t6pHQlNyLkixG7jN3q8fCjPvQY03zGGfPe3WPpOc8Dj927
	FaT/e9g/Zs3gtpc2ozvUM+/ic5tFfM70e9c/D0OO0M5DM1JKXaHZf/i22PjhEFmO
	JuEtMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p6jhjsr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:02:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c54a6b0c70so357899285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743357775; x=1743962575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlaN7asJ193Fv+MWu0+aw75zEOU6L/Dd+AbBmRtY93Y=;
        b=SLV13AnPNokrbpzqPA5sywiW8u+oAVlBvWBecDb8iertzM9re6isySuOe5xieD3cKm
         fIwe4LZiVBYecZy7pyOfCHBWCCQngBX05bF3NMPoXLeJW2de2+z/tWCge0mg7b+P1N4V
         0H0B2g/ImyCXxH2TnosqSoGNJqVmDUMY8+lAohrwYq6JEapznsEr2KYhhWCzLZkko6TG
         blCLddxllU6XOsioHjebNcGzXFEz+xHNWGLWfNGOV/XUe76jXVETSViwYjpoOU8GbtmF
         jJgjuNZOvMSZH88wNuyUhKtnyOUHHe5tHFbStQRrhZCcMfolu627wcr3jPSM3eOHgef0
         NiAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZXvE9hKVMfGYjDtwrXk5UHFAA/QS4E9pJcNzF64gttU2/j8VJW8jag7RgZgw38a6A2e4Ih7/06mP72wU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiB52jITeLo7Zvvojl3RF6n/jC9i5lj6Cyk++6cIbaM/rfZt21
	hh9FE6ns7hLaAVEur/krFloherwS6/W+VVoUOIvLUDLi61B4402uA9ja09GSaSiGLfBFTYSn5fb
	anYNrJk8vlXTCg4b+Rr2+KixHGWScnJiL5d64s2hHSOI7PxGzGw67GO65S3QcxAs=
X-Gm-Gg: ASbGnctj6qvUVAWQeC+m1RI3FU5HFmHKoXmcxkeny6yUypYqzZEURIQq+e5EXGmE2dF
	HNLDZBQH9SRVsgDbfHz070aQPsTJmgBsRpZakptmkKPNcS4t7UORNBG9kUBu6XBk9uE3xFyRHOK
	dJ3rm+gnUZ5YHjfljKG5277SAYegLMfHBwkdJvY4orSd54zMlYBkr7pM3snpAKLrypiqqDvr+7n
	vq4kcoQaRJ99E5edZxvkzK/XzQkbPdRBqydPL/G1r6jMDvMV/mjLTEjKlJoHnyAEFodbRbrWP3F
	yYe5cwWwBZvpfIbBGWWQWVaE3FfxxGRXRrWOUB4aBxH/vc4FrNvbHurpjhUN6exuRPU=
X-Received: by 2002:a05:620a:400e:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7c69087ddd9mr654773185a.39.1743357775271;
        Sun, 30 Mar 2025 11:02:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAPYhkOOkZUjy6KYQuyGJsfsTPEhDTKBmuQ5FBkrMVqvE17ds8QzCwlgbwULJxX9LUBjkjwQ==
X-Received: by 2002:a05:620a:400e:b0:7c5:65ab:5001 with SMTP id af79cd13be357-7c69087ddd9mr654770985a.39.1743357774924;
        Sun, 30 Mar 2025 11:02:54 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0e78f29csm703408e87.113.2025.03.30.11.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:02:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
Date: Sun, 30 Mar 2025 21:02:49 +0300
Message-ID: <174335776562.2565584.12345735704248581476.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250324210824.3094660-1-arnd@kernel.org>
References: <20250324210824.3094660-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: AJXCOW_a-l6uAixmVkvTfalf3-IXX1Fl
X-Proofpoint-ORIG-GUID: AJXCOW_a-l6uAixmVkvTfalf3-IXX1Fl
X-Authority-Analysis: v=2.4 cv=bZZrUPPB c=1 sm=1 tr=0 ts=67e98750 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Wyn_QxJju8WABout-1IA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300126

On Mon, 24 Mar 2025 22:08:07 +0100, Arnd Bergmann wrote:
> This fails to build without the KMS helper functions:
> 
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_detect_work':
> tda998x_drv.c:(.text+0x4e6): undefined reference to `drm_kms_helper_hotplug_event'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o: in function `tda998x_bind':
> tda998x_drv.c:(.text.unlikely+0x33): undefined reference to `drm_simple_encoder_init'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x584): undefined reference to `drm_atomic_helper_connector_reset'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x590): undefined reference to `drm_helper_probe_single_connector_modes'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a4): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> x86_64-linux-ld: drivers/gpu/drm/bridge/tda998x_drv.o:(.rodata+0x5a8): undefined reference to `drm_atomic_helper_connector_destroy_state'
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/i2c: tda998x: select CONFIG_DRM_KMS_HELPER
      commit: 85a063b8b281e144ed96463936fb4e6b3d4fe9e4

Best regards,
-- 
With best wishes
Dmitry

