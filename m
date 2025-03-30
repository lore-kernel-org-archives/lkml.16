Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B3322E
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743356733; cv=none; b=ahlKBzq7QbgdH5huhnl6ThJQb5ncsVAxlaRMGUK4ztgYNtI6iVxUVXsoispcx6PLPqqA2Sd1MVP3Ol4/vBosR9IzJRVOeBwXLYNqy+e+yh0gFk6JmcVymkxNiReJvCbuXl1XNzdOyjkCekQ4bpXHf6Trdbu5QRKskAcYyuatxv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743356733; c=relaxed/simple;
	bh=IR6/8SSTGr5dd4jqowLzLiWRJEQJjEmVlxEJ67xVVJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVwAhM1qHuDM84at6TlvbmRiB8V5zwbhpTde2OmmxAAE39ieHgfj1VQcw+Fs1w+j9eo+5OCCbpVeCBExYikM1zEiGM/0gWYNwUfervou0bgS1v/LMNyvP/Z7ZNnxo1XM3TPruQNVCeBsScUv4dyljY3ExQm2JCshXbeqWTKK7ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TDhq2GNz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TDhq2GNz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UELEDP023474
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:45:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0ftvHk0zJxR+Mo9YakIO8lA
	GLmBp6+lxXZh/431vDE=; b=TDhq2GNzt/fRJfMUjDvMGmdE/nhpzlbrEASJKHI4
	7bteB2zxTFP4fUDuGKRIt3Y3l6blSuZe6NietQKkAEPMab5Sl6KqUjGF6t0ezvQ4
	A8G+V0/0BUlvDzJAeGtOrEN9gVzMzZr3f4xQAQBv0D5WvuUSvb+cSGfOmqdsmNRO
	qiSdlIB3pPiEmXVOgB8oIe0lTSBN5oFMzFMcIA1a5N7xNbFj6AzET+MTNtnb0yMK
	LHZO4Rp4GvbeUv9me51DeKMFDpTuBEbFosfplg3rk3LuRTfBdbiKLB9SvUsfN7o4
	fj90Mrk0QTKtC3OogN9OK9Q8T1V1aP/2hCGQwI7uyqeqNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p86kjn1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 17:45:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff64898e2aso7419615a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743356729; x=1743961529;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P0ftvHk0zJxR+Mo9YakIO8lAGLmBp6+lxXZh/431vDE=;
        b=n12mNJT72eyHBTSKzz+asoxkY9tQrAQYjs1KW1UGqeKHa8AKo38x6NHunXC7mxvYuV
         uVG8od9WP77IIUJMszHrzBDDwsw/6o25OY521Y26DKvh02Y3Oh5EboiGcnhYemdfEPKn
         dgtkDuRFCrDQNi9Xs5LT1EssXelzR8Ebf7yxn0xI6LWzEKkwFFx8um/kp7j//5Rcm6Ke
         U7FgBaFViG2SNXhhQeTU3XPYOziCYmxgi9j5HTWaWR1anIeCPdqMVKTPx8wnSPobYFEg
         WttS60cGecqY9wTo3+dBUnaXS7/Hkt/GOFG13+dJ7bUlZhfKg4fz1QVYPLQCvj2GMyDP
         Q/xw==
X-Forwarded-Encrypted: i=1; AJvYcCX0VgOGl7XS6bKASOctQAVCbNwSvNXVAM/IQ87kOS0DTScEafFt096YIvAjpu2crzKP5fEzGhm5g+Jnfc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3fXhRrZuBDR2Kw6eHxVhs+Gp0RW8njJsnROIBnyBFkO37XmUB
	IIofRDAtujVcholnt/cLf56LfCT1AgLgHDC/0BYEwRx2yZcv9W4mjV3SAs9X5pRO9miI9R4I4dE
	5JmkdAfCBMU3LNFMNwUMKfg3IJLUtqb5nvbMh9v2Pbns2svyqjAKPhd3EP03I4Abf0LDeKuV3J9
	8KoatjCcWwihqmNsHnCH2m0JZ0kJ02HwAMM6gghQ==
X-Gm-Gg: ASbGncvELjgzVlmhvDLaEYi/le9T1rl/vsqBbSZeMlqL/wWSKzaYSkMsAzyP+E5OgJx
	Lw/xP3el76SJ1G8hLA0G5HcHc984Hi2ZaKC9DMWH5R/JPppQbiKttbEykQxIrJ5xtC6d1v44M
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-3053189a552mr11204819a91.8.1743356728876;
        Sun, 30 Mar 2025 10:45:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGME7jRI2sFfJsehCQt4lsWUfCyjJVKWW/oli3FcGjjzFgJjhd9tuzlvDwqRmfcOc8OJA++VOev6W9P/jn0J8E=
X-Received: by 2002:a17:90b:1f81:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-3053189a552mr11204793a91.8.1743356728513; Sun, 30 Mar 2025
 10:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
In-Reply-To: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 30 Mar 2025 20:45:16 +0300
X-Gm-Features: AQ5f1JpjYWSUXvbaxiHPEpdW5pr9qFF-4jMf2vNXngE7irr28wNVcYOn4zBVpxQ
Message-ID: <CAO9ioeUhx96EYXuMZL0LHBb=Z-prkwX0mPETMvsj-c1qddPtXg@mail.gmail.com>
Subject: Re: [PATCH v4] drm/dp: clamp PWM bit count to advertised MIN and MAX capabilities
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=W8g4VQWk c=1 sm=1 tr=0 ts=67e9833a cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=Nx99i8uyAvHPRi5pis4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: BJnBkSMNO43pUGW8HpXeSonXyWNdwGlu
X-Proofpoint-ORIG-GUID: BJnBkSMNO43pUGW8HpXeSonXyWNdwGlu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300123

On Sun, 30 Mar 2025 at 20:31, Christopher Obbard
<christopher.obbard@linaro.org> wrote:
>
> According to the eDP specification (VESA Embedded DisplayPort Standard
> v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
> less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
> the MIN value as the effective PWM bit count.
>
> This commit updates the logic to clamp the reported
> DP_EDP_PWMGEN_BIT_COUNT to the range defined by
> DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. As part of this change,
> the behavior is modified such that reading _CAP_MIN and _CAP_MAX
> registers is now required to succeed. Before reading these registers
> was optional.
>
> This ensures correct handling of eDP panels that report a zero PWM
> bit count but still provide valid non-zero MIN and MAX capability
> values. Without this clamping, brightness values may be interpreted
> incorrectly, leading to a dim or non-functional backlight.
>
> For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
> ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
> supports AUX backlight control and declares a valid 11-bit range.
> Clamping ensures brightness scaling works as intended on such panels.
>
> Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> ---
> Changes in v4:
> - Remove unrelated whitespace changes.
> - Remove unrelated commit change.
> - Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
>   and _CAP__MAX from optional to required.
> - Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org
>
> Changes in v3:
> - Properly rebase patch on top of latest version of drm-misc-next.
> - Make patch more generic by clamping PWM bit count to advertised MIN
>   and MAX capabilities (suggested by Dmitry).
> - Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org
>
> Changes in v2:
> - Split backlight brightness patch from T14s OLED enablement series.
> - Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
> - Rework commit message to reference eDP spec.
> - Rebase on drm-misc-next.
> - Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index e2439c8a7fefe116b04aaa689b557e2387b05540..b5c8a75d036b5d65262417de363409e3ff3f4560 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -28,6 +28,7 @@
>  #include <linux/init.h>
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
> @@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
>         }
>
>         pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
> +
> +       ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
> +       if (ret != 1) {

NAK. See previous discussion.

> +               drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
> +                           aux->name, ret);
> +               return -ENODEV;
> +       }
> +       pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;


-- 
With best wishes
Dmitry
