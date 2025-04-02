Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50120E328
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 14:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743604853; cv=none; b=tUzZhPTPGG14fV23gZBWrtUSOfMSMYi+QacSEmpurCVTCU8lf0ovqPrRzLinYDmfLfHr/kixMKUldj0IW29cJlGURvbJAhXEassQP88+x242rnIHjzV+FqGLm1n6zw5CFiQEvHY6/HeF7Kt9QPAEpIRfxkyN52Opyuav319Qug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743604853; c=relaxed/simple;
	bh=I+T4/p/o14tjNdo2eIRFXj4kxVjt0av9HHARSui01ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tO5Dsvy8LXqIi0eh+hk6tco6ikmGOcRGGVMy1rwcRcHa+vpyhLpY4eDE84CKMq4gXtBniRiLO0sjeyi5SVOBxnqo6R/bvf/NkCpSzcxiGnSh3+WX0xp6CqF0ZfLoGPQcFSYDRcFPNiYCVEBrlhbJJJ69G/edpB3k5A48XFzUWbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TciyG0qv; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TciyG0qv"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2bfcd2a70so897100966b.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 07:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743604850; x=1744209650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XdHt/IUBJRf8eYl33LVdyil+49CKbWzVa9iDx/vEpmQ=;
        b=TciyG0qvai77OxKzf6Rg6H0DZ+XAq7R/ZphuV0q41vYYMw5WRGKvPqHC7aPFCb0Pok
         Y1KFwAHDnl5FuL6PyYVTNpJ96N5oS8DDnMYLsub1XbMPJq+R/HSDdsjzAGQ4nU0U1jCX
         rgb+65VLqIcCaotYO/RfIoZ9FnYtM+NgvO92Mqi9uXQTAiEJ+TIrYWubg8fmoPmvvzge
         0qV3joa3ErnOtdJfon4T428eELqIiHEcmq6VwAQVQkBnG3Qz15LeJmQzzaUCpp7znplP
         zqmBZ3+8oeNtndrNUFvqD+R5IMqumdKFgd6J3ntdLQYAGic9RQ4FtTEkBt6aynpYtfLr
         aJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743604850; x=1744209650;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdHt/IUBJRf8eYl33LVdyil+49CKbWzVa9iDx/vEpmQ=;
        b=uxVsSiaZjQN2Mt4Ifb5/yZKaOmvncFNxw1Jz3FkVm5R2wDzc7JgeBi/Zqqn0WJJaid
         WiBQg6i0yeCgAMQ/Irv/i4+o29218KQprg7be3sqnG+MPSvxV7+vM7BtSNDCn4yk2fBE
         6AGrl64/vGSF7WM0IGC4VJTRfztFb96pr2g/9hgRemv4U4JdGPffvx2DZIi6ASIqdhbJ
         YqzaEE3hxTdj1L/5Ld+PTo7gcij3hfNfi19y0sTJnRCDADUVs/3cruBJNdWteM6Qk2/M
         BxuNtts6e6A5kyhW3bRZ4U4KwCMQ4TSN+3xznbwKHV8mKuluyg3s8czzk8UT4W+voFI1
         KPug==
X-Forwarded-Encrypted: i=1; AJvYcCVOQSlLLeLfMsFr90oOu321z3Z7gKYIJhw1JTBI2sPu4mZqeVjSyeV0SRS41Fmdd9ZPDo/231Ou2wVtT24=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPezjPLCSKxt4L8ivZf0/4B0pq39qFEfD9J3od1lgq6yFbcMp
	jIdQbhy5aTkuHkih31aRTWzZZLlprYi83h2n8lqkZ1Fgkhy2mp51UI2Ibu9Ftbcr2t8uKOCWE/Z
	ou4N7+E8clz5oEQJ7Yve5NaFAtmsZM2Vycsk=
X-Gm-Gg: ASbGncvqgTVWL83+bDpr+3FscadEqRkvW0WP5UqnCE89KHgk8USEixtStFdjAG3cEuk
	4pIdWn2ZtFqeKL2xx7yIVIAP/QikjpLriNJ3VmVYMi0bUK3jO5AgR9f6cOw53L7mjqqQlv9dO03
	spLw/5PCZDh1Alvmq3LZcRgJVy5HaF2blTXf1RvbnUZoKMr76s8Bc=
X-Google-Smtp-Source: AGHT+IE0vkwx1hX/1OTjSflPZbThMYB6+8r0sqUR8j1ij3DKDFbTPc/JDMeDathxWVU4WV6O4plnQuRnHTgw4HD4hmU=
X-Received: by 2002:a17:907:9693:b0:ac3:45c0:6d08 with SMTP id
 a640c23a62f3a-ac7385b6095mr1595411066b.0.1743604850163; Wed, 02 Apr 2025
 07:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu> <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
In-Reply-To: <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu>
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
Date: Wed, 2 Apr 2025 17:40:39 +0300
X-Gm-Features: AQ5f1JpoH0lX5gFoAYCq8CN2F9yE_ggsFXrXdOVagMSfH3qOEL83a2b4hhyNzuk
Message-ID: <CALT56yPvDW1dLNdZK0kkn53kTa0HcVXgYXp9Gim4MH4YjgEncw@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: Gergo Koteles <soyer@irl.hu>
Cc: Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 17:35, Gergo Koteles <soyer@irl.hu> wrote:
>
> Hi Dmitry,
>
> On Wed, 2025-04-02 at 16:36 +0300, Dmitry Baryshkov wrote:
> > > >
> > > > It works if I call
> > > > drm_mode_set_crtcinfo((struct drm_display_mode *)mode, 0) before
> > > > create_validate_stream_for_sink()
> > > > in amdgpu_dm_connector_mode_valid()
> > > >
> > > > or
> > > >
> > > > if I comment out the decide_crtc_timing_for_drm_display_mode() in
> > > > create_stream_for_sink()
> > > >
> > > > but a better fix than these can be imagined :)
> >
> > Would it help if you force recalculate_timings to be true if
> > (drm_mode->crtc_clock == 0)
> >
>
> Yes, it works with that one.
>
> But the code would start to become quite untraceable.
> duplicate mode in amdgpu_dm_connector_mode_valid()
> call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> duplicate mode in create_stream_for_sink()
> overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> if crtc_clock == 0 call drm_mode_set_crtcinfo() again in
> create_stream_for_sink()

Well... Unfortunately I don't know AMD driver details to comment on
this. The fix that you've posted below at least resolves a regression
without requiring us to revert r/o drm_mode argument patches.

>
> saved_mode is never used after this, so I can't add the condition here
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);

Agree

>
> This commit is related, I think:
> 1101185 ("drm/amd/display: fix the ability to use lower resolution
> modes on eDP")
>
> Regards,
> Gergo
>
> ---
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bae83a129b5f..83c8c81d4015 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6984,6 +6984,9 @@ create_stream_for_sink(struct drm_connector
> *connector,
>         if (recalculate_timing)
>                 drm_mode_set_crtcinfo(&saved_mode, 0);
>
> +       if (mode.crtc_clock == 0)
> +               drm_mode_set_crtcinfo(&mode, 0);
> +

I'd say, please post this and let AMD maintainers act upon it.

>         /*
>          * If scaling is enabled and refresh rate didn't change
>          * we copy the vic and polarities of the old timings
> --



-- 
With best wishes
Dmitry
