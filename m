Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653E15B54A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738863238; cv=none; b=TpYULeCEY7TSwGAjzetX/0fRZPYr0ZmI1ABT62V5+YMBeb6Yz0rMAKvx/YQMMmBZ6b1rWCIgN87NShmy743yn51UJbbCwaZceNVVCfBxk6IxJts3rJR1t2kcfii5hVhSuJlyN3khnwAav0bIzBsQihksX0+fC8uXwgWmZXAvYB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738863238; c=relaxed/simple;
	bh=GbON6iayiWvDvkdRopsxmojLnkcggg0RSYyaElN8EeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZPspxJ6vhMOd5i5a1o7w8Pco9nl4+eH0U1eRj7lVRkd8uVtnzQ41bEw/JxP2ErkbkX/kaCxVY/YpeD0H5hbQExlohDYbk42JX386CbU4e6ESsL0imhkfC/uS5WmG51ZV6mllokN6y9NAaHAe9hTdMf62ShpAq/94uLwQT2yeMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A7NIx92d; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A7NIx92d"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso892616a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738863234; x=1739468034; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJUUUjrLov9sJIl9/dsnkCvRrMfN6OAfg15ppJicsmM=;
        b=A7NIx92dayLynk+oRC/gIORcbQecAEBk4ttL6/8bv/k8i1Yqpcb3CwUHY8Gxoo7y+O
         33ducGMqcpRQEeOkfnPLlXYY8OSzRu6hJ33E5gN92UZVDcMqRbx5TZUa6xvCOaMLQecA
         rdX6o6VaaPm6Etjrd3mN/7v9cGuhi/Lu9/Pt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863234; x=1739468034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJUUUjrLov9sJIl9/dsnkCvRrMfN6OAfg15ppJicsmM=;
        b=GjDb0eefYnYJMoI+/g7p36iWef2JHC66yP3DATCMUocLjSJOS9TfL/QCLTsnDhRwyA
         fv5/W0Vd3SxNYh6oHkYV0LLtglJIpvQVcVvBKiUCHzh9EszS2p0zyDpeKqEeu7dKWknk
         QdNtC4vKlWQRP2xzQn+zsPTxKpFGM89hyqaIgNHFQ4/T9B+XHExYa+Pk5DUrndpydWTl
         rHmg2G9PEX30p3GvXqpmLM3JN7UuMBc85Uanj3OnpFm6SAkOvFVwtPFt5rMYn8t3yDof
         Ebdr1PTe0IDUOmVO9LtmuiTkv+jNSATr8syVv1QaPBdebANON4v/dyZYwgd46IwWKsh/
         TjyQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3AtnsnEC32NscGdGA2jHm2dOd1nQ4yg/EeR7Y5VTGvE+GhA3MTazguZNVLTwVIKhA8xX25cxgOTP1gGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVJA60SjyX2TfhURotRLEdUzPDhJNtO9niRpOkunR9zk0lK/6
	QCBIhvtGgqWHWU8NDSFlCpUPVo+OnNaODnsyaAia+isn/BjFpPurTFNGUOtEqfWpqx+oHDIJHMn
	kz/p/
X-Gm-Gg: ASbGncsvoSdOhKXxSQBJ0yKMm+sdtgJxK3RPkmsIZbSi7NmnnHJjQfjRgZcXlfjOO8Y
	f43+fe0ui9VE5H9lynqhpA/TNHkdKOsKhfvWl+XoEaJDm2d4L11aYZ8VOS3nUwaIXl8F/YHqomC
	ahlJweNxOvdUcv75FWYrpt4Xv5ZB2IYxIIIWF47PUBIXK/P76rWd1hXpmcjAMfMQATUtKXDQgSr
	/X/I9hfaErskMnyWpjMIgIki/4q3u2JPy52YusXqE5FlmA6LFnZ5EzPcgCaL38czxG1FN/IO3x8
	fI2sfMBsmKp0mJbsOr6X9KrKnPfhxFOJV0l5pCl0ybKPmpDgCXk4RnA=
X-Google-Smtp-Source: AGHT+IEAQ4SBocFtFOuFbhV3au9A/iP6YcA0ZyZdAl0KRyGvl5YZiIoYNMwR2TDxLEBGeEbx/Mkp8w==
X-Received: by 2002:a05:6402:27cd:b0:5dc:d913:f8ae with SMTP id 4fb4d7f45d1cf-5de450b0688mr194852a12.23.1738863233800;
        Thu, 06 Feb 2025 09:33:53 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b739e2sm1158962a12.14.2025.02.06.09.33.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:33:52 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcdd427227so2253983a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 09:33:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW8EoKEHhKYxX2b0eQyuBERBIahQCbEV28po1rzoEHV5ZKVjp+KR/nyJSgHN9DwJLAgoCqra3tegTxZ3Tc=@vger.kernel.org
X-Received: by 2002:ac2:5f75:0:b0:542:9636:2981 with SMTP id
 2adb3069b0e04-54405a1ead1mr1769381e87.29.1738862871039; Thu, 06 Feb 2025
 09:27:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com> <20250206-drm-cleanups-v1-1-93df60faa756@bootlin.com>
In-Reply-To: <20250206-drm-cleanups-v1-1-93df60faa756@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 6 Feb 2025 09:27:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UV+psKjd9R=Z=v1jf5y48dS3-O+uu+5qp-bZNteXJ5yQ@mail.gmail.com>
X-Gm-Features: AWEUYZm6jGvL4mZzbh9s5YygPSphYTnr2ocZgOhaskVwIuc8XI42h9zOQQmsmW4
Message-ID: <CAD=FV=UV+psKjd9R=Z=v1jf5y48dS3-O+uu+5qp-bZNteXJ5yQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] drm/panel: remove unnecessary forward declaration
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootlin=
.com> wrote:
>
> 'struct drm_device' is not used at all in this file since commit
> aa6c43644bc5 ("drm/panel: drop drm_device from drm_panel").
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  include/drm/drm_panel.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
