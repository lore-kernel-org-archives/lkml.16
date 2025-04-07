Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12B125485D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031791; cv=none; b=b+vPrVhiQFwWyix3k6JK/9rzVFNUu0wqpeCVgmgSQ8U9mhU9xC4a8RSfFJ3Wc5e/7EJHQl7bYc5vtEVmBM7/v9aEXf91tnnKy8+jUQLYaUkcMI6tGc0R6J067JEr6rcHZG4y/TN2Bk/5SV20tt5IWqFK14tvduotITG1313gsZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031791; c=relaxed/simple;
	bh=MMib6p3C8hdkHHOTCHHMLVyLdbmrWgElC71/JAQpy/E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5ESV0C0nN3qMPOqjeT6YGEdfryW3m6ar+5jGxN2j2hKe94PpulJRZRF61T1IoW6MNVjKqufmToC53Xzf+L1JrtS3XMLud9uM5zn5CUtFndkseu7Z9zhzpd0m0Aq/zVe/mgvcjnSlFdA4M4C9hDgpshGhihwFHJqFyFw18Xv9pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPSAIYD5; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPSAIYD5"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af9a6958a08so264107a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744031788; x=1744636588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7cCR1MuP2kYdCb0YqxaqR0Dqkjekp9ngJLjuSiWMX4=;
        b=lPSAIYD5HyCbjZZ+fjX0ik/KI3xA9znTu+KhTf6s5syCi8nSaFQJjEjFHGzNAxYEaP
         KR9pIduj2ZCTXWb08StNKVIXBWy4mnA6v0QXgqGUYE2fTL8Uu01j8y8ZypwWryUW98hK
         jixvXY09H7kUPQwWIIvinY0IlQgvWBi6TniGDxCq9atD9zrUsmQQDC5eeeoGX7wmnUQz
         ReCqfmK8hWk3gD0tIo8pe5AyrLqmVjE0O4IGAE97kOgJaZmDvhxv4A8XEkZixwgv93rv
         OqVZSkmmzeQnAwx7sYEN56Qvx/L8CFYWEI8TPQBvMxMCU8GVlSJWtYKsoPd0UX4olBUO
         jLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031788; x=1744636588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7cCR1MuP2kYdCb0YqxaqR0Dqkjekp9ngJLjuSiWMX4=;
        b=gDI5nlW6wn3oWGmxjkxV8KU5wSYc1NUqP+mq0kWnEnbx3U2MvUtBVl+l1PwhHijsPd
         5A6lVa6Eh6o4CRjJ9yZU/yxfH5gUAP+GJH7k5w0ADxOg0RYw5nVlf0pykhPmEBu0tZlQ
         C88JNMzRHji7st123JIxm95s0I68KnzG3CR5uzHm8QPqmQi4zA/5lUNQ8rMVEIE440ey
         t3YzY5OK5cRczYTMc0S6AWFDV9FotPIm1FjYDsxRzizVuq3Z1ylhGNk16HaMSodlcqfZ
         LBLihPXHgMqX8tULVHBZyOEvcsbMTv603ihCKk960w4QIZeZAWcsJkVjBY2PY0wB5UsN
         jTIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtKdH92WzAUc6tGkDfApyEUIheOyQbEkFJUx9ndmb3bVzUWlqFJd4Io0HSv/vUlzR0uizFgdz34S7bV0U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/OPZzJXljoP89uuZhAL9KQa9YdMnkFQLJ1lSmnnHMSDx/mDlx
	RGNwGR2OGuuyvJtVWXA6gZGDgcxdr7Tg+sB0/3ACe4efLkeck4UhuAI8klCqGQT+9uus4Jayngn
	+GY97U3iorQddC/HxAEHnMgUA9YY=
X-Gm-Gg: ASbGncv2bUaCFC9mGHG8ZfgbDr4iaC/hBrfe7uRzzIlIWJzztA3wSk+V3slvHpig4s9
	GYCg5AdcpkF7bVA9UdH3t5FrhwLlFNoDlDbHpvpXIFlUKQ5otYQlrWqtHVa1lZnQ0wvE0tAyd7Q
	/nn/FMFnPwaphU+LtZXkUDxV3Juw==
X-Google-Smtp-Source: AGHT+IGWsGXh2awIMFrukeFB4nL/EgfghTCD3qed+lyorBMGb+RwsVzpe4gd5IAuVIA6p04Z35Ji0j4QKUKfQ397qF8=
X-Received: by 2002:a17:90b:4ac7:b0:2ff:4be6:c5e2 with SMTP id
 98e67ed59e1d1-306a49aafa0mr5487508a91.7.1744031788284; Mon, 07 Apr 2025
 06:16:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407071627.1666-1-vulab@iscas.ac.cn>
In-Reply-To: <20250407071627.1666-1-vulab@iscas.ac.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Apr 2025 09:16:16 -0400
X-Gm-Features: ATxdqUH55S0TFCTeQ1RCmu6WBynu-cBG5VFi3Gz6QmQJXLT7nDsvMJiHqxjBnk4
Message-ID: <CADnq5_MuOUbnxw3qNcUsvvAKVWL-Bx+_2n81bWPXgz4D5fuAeg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Add error check for avi and vendor
 infoframe setup function
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, hamza.mahfooz@amd.com, 
	chiahsuan.chung@amd.com, sunil.khatri@amd.com, alex.hung@amd.com, 
	aurabindo.pillai@amd.com, hersenxs.wu@amd.com, mario.limonciello@amd.com, 
	mwen@igalia.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:52=E2=80=AFAM Wentao Liang <vulab@iscas.ac.cn> wro=
te:
>
> The function fill_stream_properties_from_drm_display_mode() calls the
> function drm_hdmi_avi_infoframe_from_display_mode() and the
> function drm_hdmi_vendor_infoframe_from_display_mode(), but does
> not check its return value. Log the error messages to prevent silent
> failure if either function fails.

This description doesn't seem to match the code change below.

Alex

>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 0396429a64be..d6feafb8fa3d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6152,8 +6152,8 @@ static void fill_stream_properties_from_drm_display=
_mode(
>
>         if (stream->signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A) {
>                 err =3D drm_hdmi_avi_infoframe_from_display_mode(&avi_fra=
me, (struct drm_connector *)connector, mode_in);
> -                if (err < 0)
> -                        dev_err(connector->dev, "Failed to setup avi inf=
oframe: %zd\n", err);
> +               if (err < 0)
> +                       dev_err(connector->dev, "Failed to setup avi info=
frame: %zd\n", err);
>                 timing_out->vic =3D avi_frame.video_code;
>                 err =3D drm_hdmi_vendor_infoframe_from_display_mode(&hv_f=
rame, (struct drm_connector *)connector, mode_in);
>                 if (err < 0)
> --
> 2.42.0.windows.2
>
