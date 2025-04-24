Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6C18FDA5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 13:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500347; cv=none; b=Wtx1w3P6alhxB7VZPTPIRGqz6rqTBpBlqCNUuBr23M2PH2Bhno3hh/pshcDoQK1dA+pN2nPfs5orIgY9+0JTQnhXV967lx9HBvpKRmeHlJ2XxmcLsekPkX60SXbRrs7GtQ2L1S9O1pqC1WIhtqyspTuNr2WyPaW9NexzNDnC5xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500347; c=relaxed/simple;
	bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdPiRoXo8WbgyOoLB+mykFB33NFgPZdC/mQHO7USp2jGLXwFl31CEh93cvjsyDk5iwFMbQ/KftKrIFiiatb1G2P1H4OoRgKV8iyQDnpvyNQ57U45HFJuLGRvSVFZpvMe8qDydIbsm7gQPMvN478qMMVXXf62Vsac55od9DU66bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SD773NUJ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SD773NUJ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso160481a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745500345; x=1746105145; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
        b=SD773NUJaH/sq3yBiEzz2t3oAqmxcc675wcaZHVArwYviP6Hm1E+hQX21rL0XUZezR
         mZYoMiwT5WM8anNrmuLyxix+CHZBSmTKql0+bOqBho+5RwGK3AUhcUCQPsvqfXdNBGvi
         0TZME91qXDsVhoTBmBtx41A41mWLBpHWzw50ghQoO/FuAfMghPSUCyJ9zvE7CrDDnK4B
         79QOr5gI0sALV1Gwjy1/Mx0NpDfmHC8p26bSaCj2oERAAkIUIcnTAJNPWYFy0FzV7nKj
         R3+g+hMJ3mXeAIoHPGVxFlQdlh+ZrM2hfwQQwNCVOCloiMRirPp+TNhzUqQXTkR+pAZC
         m4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500345; x=1746105145;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eA7Xuy6k9ONAPkP6AgSuyk9zFim9A6uFvmLfDwCH8vs=;
        b=Gixw1hap6GmX1v7uGXgCHTTKx/Ysa0Ro1tcnByWyKzakOnYGO0gf3eXzM7ZdC06yr3
         8O63tzNO1pmQtV4ETuF1m+IAC62MA2HtwIVSZhaE79/3O8k6w3THG6uy/w5lJqJqT6fB
         G96WHrhrBP4zo80c+52poqxFh8LSu6fQCVNmWqA1ZataRkotSiMbnIapncK7tuGGgskR
         SSlIAZXg2Q8bGF204CylHH5lvUFjzUrnnTUzQyVf/Yl/G6yOS73/KVtFV+LqHdb9ISEc
         QwuwTTy9aMkR4S43leMwzPpPU/UofozIp424+S5NGkHN01eCny8cC+/sWYXmFAFnMAAf
         lXvw==
X-Forwarded-Encrypted: i=1; AJvYcCXOfvFqMlyTElcUgbp4xvP0I8d6a6p3YE7iH/kUcESIfmlZkB18qryuDUtlFpFJMKL13GXNhjz9ZSj1KGo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfE40xzR5JZWMSAX3vxAa6/xugJ80Cu80BNZzrQRsckSAD4erW
	s2N5Hlv0IDuNu+DgX7ODJwlVHCdTO5o/6gXuQZpQNYAgfLToATKkjhASHf9JCC6QcZ2+yY2tsm+
	bAalgsphPbqoD/NLM26Sh5g16NGo=
X-Gm-Gg: ASbGncvOrmbeD7IJbiqYGrc5HAjwfmhoqv+vYDLpm+oYUy9w2IPiqhtJoe4pCBI6szc
	dvgHeDi2tQXRyNpPF0q6uYJklgn30rQycJhKwKwi0Pf+0ZOlYytUv/lU1o4ZmSuHvvHqsE5C21z
	IKrhSmsd7cNWhG2euG9RReOg==
X-Google-Smtp-Source: AGHT+IEFvo9XYRtQEvgfEvNW3YyXCDl9i/8QVWCKx/TXGNL9aOOZJwdPzKvHZ6KZW7h65cYldr4AhFdLlL3QAZqAS3M=
X-Received: by 2002:a17:90b:3906:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-309ed24cc88mr1706401a91.1.1745500345346; Thu, 24 Apr 2025
 06:12:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed09edb167e74167a694f4854102a3de6d2f1433.camel@irl.hu>
 <8963a409dd575e040e5f07e4ad5e9c1d26b421f2.camel@irl.hu> <CALT56yPd-xfd=47xRxrCk4F3jib4Ti7kg8pRXy-gVAQpbOc=pw@mail.gmail.com>
 <e323219b52cda1891a55d12ad77a2b34edc8688b.camel@irl.hu> <Z_jodBrNFdEpJRKA@mail-itl>
 <aAn6wsnJ-6mqK4vR@mail-itl>
In-Reply-To: <aAn6wsnJ-6mqK4vR@mail-itl>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 24 Apr 2025 09:12:13 -0400
X-Gm-Features: ATxdqUFwuh2Liv704M5KwrRa6klhoiIfTdC591MnFCPLJIk1C-iKiwHLYfgFHos
Message-ID: <CADnq5_Ptzieevwysn1Qz5yxTOujMtEDW=Rbwqpvmd_3o2Gd--Q@mail.gmail.com>
Subject: Re: amdgpu_dm_connector_mode_valid regression
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Gergo Koteles <soyer@irl.hu>, Dmitry Baryshkov <dbaryshkov@gmail.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, regressions@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	Alex Hung <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 4:49=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Fri, Apr 11, 2025 at 12:01:28PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> >
> > Hi,
> >
> > On Wed, Apr 02, 2025 at 04:35:05PM +0200, Gergo Koteles wrote:
> > > Hi Dmitry,
> > >
> > > But the code would start to become quite untraceable.
> > > duplicate mode in amdgpu_dm_connector_mode_valid()
> > > call drm_mode_set_crtcinfo() in amdgpu_dm_connector_mode_valid()
> > > duplicate mode in create_stream_for_sink()
> > > overwrite ctrc in decide_crtc_timing_for_drm_display_mode()
> > > if crtc_clock =3D=3D 0 call drm_mode_set_crtcinfo() again in
> > > create_stream_for_sink()
> >
> > FWIW I'm affected by the same issue (on HP ProBook 445 G7, with AMD
> > Ryzen 5 4500U). And the patch quoted below fixes it for me too.
>
> I've re-tested it with 6.15-rc3 and the issue is still there. Is there
> something I can do to help fixing it before final 6.15 is out?

I believe this should be fixed in this patch which is already in this
week's -fixes PR:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/b316727a27d0dac1e6b7ae5=
1204df4d0f241fcc2

Alex

>
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
