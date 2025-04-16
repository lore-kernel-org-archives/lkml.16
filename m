Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AF821146F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744820098; cv=none; b=dm1S3+8Dvd5o7XeDWJpSP/2I/xuN+mTStuAAVXn6vRrXhIIRHdpBFbr7jcYPjKUSZ2sd00NRnrCSV3aGiiQS0JCWnamWbpEq+DPFTaH792ajTsVqPGa4QVyBwEC3sGrYJDJQr1921BPe6QtFYOAih+5Mw4Wf3DxVQK/ewTMIYss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744820098; c=relaxed/simple;
	bh=IKxvaHmVf+jL/dJW9NdhFZpj93dS41lz/VEVQxe+NSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=grVy+9Z1ve9rtsxYAfoHLKKfyq53sWVnERj0iQBSQ/ZaFbuplpdGY6oKpLJxINocm9ZTu/kofy9eAERYPLwpFBktoqBFQuizjB+otPLoNHIbTDlPrjVNb6SaoIbCGKRSUXNaLzgcf+etmBHZhzuRwgU2BCgrBzUXdCFzcecFmh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VFBL/Tqs; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VFBL/Tqs"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7396f13b750so7356051b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744820095; x=1745424895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93lYrXJcXYYRNRseEFWo6L1+f89BOQ0v4i7jBvitfWo=;
        b=VFBL/TqsWc2DDGRIAlwSHJtBUcq/viNtZNtrqVedoKh8rJs9oJil2eWppaLwQ8AkRP
         Z9aBT7XEBzX4Zv6SUgBRbzHaZbLW76a5Q0jNTZG2DO8rdzyYm7o3w8TuK6y20pbH62h+
         zu5w3LNbNg3xegxsVr/pKHcz3JWTXWcJDQFf4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744820095; x=1745424895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93lYrXJcXYYRNRseEFWo6L1+f89BOQ0v4i7jBvitfWo=;
        b=p3ZGtrzCzkNclUqXFnHrt+gqzXlosZZEJM8URfZdaQo983eonmCgU0Rv909cYX5zv/
         gE18SxEXfxOi+fbtLC6rvk9fvPcyqoJYuziB2k1CQyfTrYXM8eyUdxwfMzqH8VsQx7Nm
         lHvBbYTN6qXIVLy1GmGZJIX4KyWn8cBJ8ObgXX6he1c9s39rZoxD8NLmEhqma+aSNiNM
         yoG+LUbdLFYaiXoyIv7Qvl4ryHQaNNF5Cy+6FDc3Xpurh0bLOJcOFu+Qy5z77Foa6TJl
         x6kbyanflEo/v5rh13N34Kdpwy7gM62eaBmf3U9JEjh5l2dPJJ9XUaf65K6TNV2rsGU4
         oDsw==
X-Forwarded-Encrypted: i=1; AJvYcCWlyp4V8ELZu59VxPd5LnufiUcmcG8hlfw8Fd8mRR7ZZcX3aqTbYGMl+cOptDmnsWlHYmTlvGllRnXJdEY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy09whxSOi774QHqLdBqiTz0bCYPjcG5TUBWy2+7l7pd1erdtNr
	u4xklC5KsHymxfei0x3775D6P1fnUNWmGa/lPupu91Nu3oh3a5e7lqaoCfsfyZKo9eIuoT0+O98
	=
X-Gm-Gg: ASbGncsPgCWWBncBlhRhZwTo0+BJ8SWspbyh7z3WuO4RoKF9SPlY0S8EmTrZh0oyK/9
	7sVqGcjIbqUMhH9OEEZpQmIDOwWI4piJ0/szA6oV3Db3RXWCKFZ8XqLufQKYpHr0LpKTKKxxIy4
	pp57tXYLJ7iiHhwrBqaBTrL7DiPlGLbSfStAQfO+wE/MeQq/+4iFqo6Cn70SUk8V6mysDmZmY7f
	blApMI1vI1KbKpLdDRFYJ01XbYg8OH/0RAT5yO0UKBUhDVJn+rIy4oKRaQACCt1AeeztVURmxGS
	aOkp208DYkF5Z60073YY0VeN6M1fyXzgoQBiu7RI0sLGItQ8yGZkkOqo2pp4qUjRzW6XS+OW1lT
	xopXdbYsa
X-Google-Smtp-Source: AGHT+IF7AHv++KLwcs/6nsVbKMc1e0136rfZbcyuZ6VBhifsn1Mr5ROx3c93PrQQHuQXNA4EY3g4iQ==
X-Received: by 2002:a17:90a:c2cd:b0:2ff:6f8a:3a13 with SMTP id 98e67ed59e1d1-3086415c577mr3248699a91.25.1744820094688;
        Wed, 16 Apr 2025 09:14:54 -0700 (PDT)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com. [209.85.215.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308612131dcsm1797908a91.26.2025.04.16.09.14.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 09:14:51 -0700 (PDT)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b041afe0ee1so5790099a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:14:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTlRLvAE+tvXQEegZtTnB0DnButHT1xGBPwmHRuLAwD/y8e51NnUhFf28EtX8KFfCeR/BG103ZfNDx+Xs=@vger.kernel.org
X-Received: by 2002:a17:90b:2e10:b0:2ee:e945:5355 with SMTP id
 98e67ed59e1d1-30863f30453mr3359259a91.19.1744820090455; Wed, 16 Apr 2025
 09:14:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250413035959.255842-1-tejasvipin76@gmail.com>
In-Reply-To: <20250413035959.255842-1-tejasvipin76@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 16 Apr 2025 09:14:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WaX8s2aPi3V8SfHd0i=+9kMbF83dnO-e7P6CZQ8-iEAA@mail.gmail.com>
X-Gm-Features: ATxdqUFM_zF8N6Cjd3iCDu5vqV251aCLSHWtDUzz5VJNje7onq9bV0FbWP6jAQQ
Message-ID: <CAD=FV=WaX8s2aPi3V8SfHd0i=+9kMbF83dnO-e7P6CZQ8-iEAA@mail.gmail.com>
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

On Sat, Apr 12, 2025 at 9:00=E2=80=AFPM Tejas Vipin <tejasvipin76@gmail.com=
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
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 114 +++++++-----------
>  1 file changed, 44 insertions(+), 70 deletions(-)

Pushed to drm-misc-next.

[1/1] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi wrapped functions
      commit: 734b6f10506c726dc6be23e0ba63ab0310580aa6
