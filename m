Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B381A2387
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 22:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744495855; cv=none; b=BkTDTAq/BD1BmirqL2DTjyIbLhqMX0RpyDA2+JrRRB/tbhsnMBBM3dmX34wmZ9ZKlhjDwVF/VJFhKiUzkFHn6H5F/1jg9IH5WfWhk50hRQ3TuwVv7MrL+XOUabQGOGE2RysPJSDRayfYSfHOy4hKWBuB3ENdO8n3yxftuZ7syys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744495855; c=relaxed/simple;
	bh=GTGPLo+XaT7zNOr/l3V+8Y/k+hzhuICEIRbpVyc6TmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1Lpwb+gi0XXrDoJ9ThMdvl4uLOpwQbiGdBdThXKZrTXVVt9xTlyB9CiRsBPbdOtM0ZagbXtdIqPzzX4DHyYTTWaq5XTYr0yMqWIqiMo18x1gLfeWNGDdUl3YgrSD+l48MgccHQovbkZey8WWCyc4Ax+vZK4or3zMPTnjXdCjPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fKwhiYVu; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fKwhiYVu"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73bb647eb23so2817517b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744495849; x=1745100649; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aHcCryjZ51sPp9epA2rO67Bwv4kAWiYpXBGmYoC5II=;
        b=fKwhiYVuRXYJNtHgNyF6tBcLOjRbCExKdB9AdJhQ6oTEB+GfUPnrbl4hy7DdQ2TKRd
         fIYLSBLGO602IYkRDyYDRCiw346a9PQpt9KS3QU9CGke9bLvoJU8N0GQru1KpjyEOYkj
         uFqa65e71H/SXaiCDuwwi/MiKaf4/Ie5f4xI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744495849; x=1745100649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9aHcCryjZ51sPp9epA2rO67Bwv4kAWiYpXBGmYoC5II=;
        b=GJRMY1k3MULgOgauIUGm/KpR7fslH68yN7kHx9Qq5Op+maqBzxJ8gAIzb9F4poORDw
         vu7f7xeIaTJBMGYCv1DAVH2IcS4VBLHaVbGfDJUUZ1FssKsVGvafNaF/Amr1R6E+SjQB
         yaSur+/CXUT971j1e/tnVQx6eyRE1XUPLkCOrew//OC5z8aXoDilQJDvkS7oJN+WICwN
         wrLARoR0WLLiIf/t3Dc5dUN4R/zuvnv6/W30ti21Ofsq5Rq4T/P8i8+LD1RogEr75YTn
         NWELUGNuZNcX8/wrlJ4/WNFZLhkTiwEa5rhz2a8vICXbEM6mOXtAXTKcPRNvDEguJO01
         D0bw==
X-Forwarded-Encrypted: i=1; AJvYcCUtrYX98lWeSezxI8GCfOnarXtAmsRxmXKoTLbOohQiKRjyKKFzNERTGvx4KMhmP0wp6XaEix0nXH7Mydo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTZSpSv2aqXeCNRNjm5zKSpbwTxa/5XV4jRgN1TvH19ZJ9Cu+2
	J1cQhl1rqTV5vf4tJXoopaWMkzx+pIiyv6JXgRsODrSfI3+r0yQZmxN/woy3nIFhQNewKC1cTvE
	=
X-Gm-Gg: ASbGncudRuBxqklJv/g52J2mPwoonnrKo+/KbSei0FE8n0UXuxDA0W028VN7mKHWsRI
	4u46BOJHCT5TM1FaEbkn1kgAKgl6A5nZDQvGIFRB0SI9088Kh2BEgHJOUtxA+52pBmPgmB3OJxH
	E4ziGkNl3HgqdwmPRmR67BJvvYWRDQRk6V1sRbu1Qq7+2L8ZqQ2mNwKY1UEhu8n3AI6bpwrkySI
	j44WSCdHmklp8LMM9nRKN2GQ++JhkfypggkE3Z0k9sa/vRZu9E5wRemlhcID2Qer6aFBpGwZyUX
	yHcozdFs4oJYNkx0/98ahuZ8px8Y9rCmeRokp0TMjqnexm4a36V85qnighuj/6A0DywbLXxWy8S
	lXz01
X-Google-Smtp-Source: AGHT+IFsRPMgo5UfinLcmZyco38C3i89avmNI74//SJt7oHCOWqaNoEwz2ksfoCJoS7h5a0viQsyRg==
X-Received: by 2002:a05:6a00:1907:b0:736:3c2f:acdd with SMTP id d2e1a72fcca58-73bd1200471mr8689570b3a.14.1744495849084;
        Sat, 12 Apr 2025 15:10:49 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21949dasm3907140b3a.35.2025.04.12.15.10.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 15:10:47 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30828fc17adso1453664a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:10:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDaQEf8mXQBLqb/NetGArp8PThwHLpkiMslFH7yIjtr+HMLOTxIaTSoj0Lv/fGB7shtLp/0YGBrr0Ynrk=@vger.kernel.org
X-Received: by 2002:a17:90a:d647:b0:2ee:b6c5:1def with SMTP id
 98e67ed59e1d1-3082363359cmr10624682a91.8.1744495846538; Sat, 12 Apr 2025
 15:10:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412043006.188641-1-tejasvipin76@gmail.com>
In-Reply-To: <20250412043006.188641-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 12 Apr 2025 15:10:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
X-Gm-Features: ATxdqUG8oTzU1ud8WY8gkS8QtqDCzk5Os5fWsO0Vr20AO8sNQuStYia_euLNSzs
Message-ID: <CAD=FV=UrZ-t8MkH0nY+koBt8NJ3Xh-LAH_ZPirWuCroGQEFNYQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asrivats@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 11, 2025 at 9:30=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
> wrote:
>
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling. Additionally the MIPI_DSI_MODE_LPM flag is set
> after the off commands are run in boe_bf060y8m_aj0_off regardless of any
> failures, and regulators are disabled if the boe_bf060y8m_aj0_on call in
> boe_bf060y8m_aj0_prepare fails.
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
> Changes in v3:
>     - Disable regulators in boe_bf060y8m_aj0_prepare if
>       boe_bf060y8m_aj0_on fails.
> Changes in v2:
>     - Always set MIPI_DSI_MODE_LPM in boe_bf060y8m_aj0_off
>
> Link to v2: https://lore.kernel.org/all/20250331061838.167781-1-tejasvipi=
n76@gmail.com/
> Link to v1: https://lore.kernel.org/all/20250330151304.128417-1-tejasvipi=
n76@gmail.com/
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 109 +++++++-----------
>  1 file changed, 41 insertions(+), 68 deletions(-)

As far as I can tell, your v2 and v3 are totally identical. Either I
messed up, or maybe you forgot to commit your changes?

-Doug
