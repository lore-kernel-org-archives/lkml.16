Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3BF21ABAA;
	Thu, 27 Mar 2025 18:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743100631; cv=none; b=l+S4Lf405H9BxE0KYUVyoS4NEwE32yAun7UKkwTeF6u4cNktXbn861czx3KRB/CPRt90aFu7FqSOguVcysiB/XNr3V5YvNM+CjxkJvcxsmmba+4eLvCNRYf/qEWnJ7zAOxUolzwMelMbiFy8j/0vok9Q1MFU/pRN/vM4EWVTTmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743100631; c=relaxed/simple;
	bh=DqCIIW4vk3TZc2XuZBMZPu9SMl5ZB+LnWrs5fcjjLSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElEKlnuvB4FneZR/N7FcLZM0zmbH1MsHVrfJX7iu0nsulRsSclAaAHkwjuyQLrmmP/4Mz7uSeEeJRBGyc4rzncQ7y03YwxzV/mKPOsJCBffXeOhtFtRpgKpEUIf1D6lJc5i9SZ1gHRJ1YdRjSGAp7PMEzALhplujdbtVxylsqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dvQxoFZm; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dvQxoFZm"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301a6347494so301859a91.3;
        Thu, 27 Mar 2025 11:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743100629; x=1743705429; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JREactd+MR6uIyk15bAj7n2qQdSERCkAnE+wV8jYE4=;
        b=dvQxoFZm5rxWdz3hbFmq8vJja3ykQj+4MAOoLdy/mnFYE2UazMMkfT58DXpbh2FNsm
         Sf2Yxw1H2xVM1xWglpYKFCeMVr564paFWgCp3+zrbZW43vAJlUAvFj+mIDnna2NOYxCq
         ZwRMVVjYKRAyorcMUqFXWYENieRzcgcQWUvRyvv9xd+50iDj8FDdSbufYHRrJPT57FX9
         KSHZAePtxgVX3077CokSYktuZiiuYy8ITg338Uzrj59tpm9+vgL2gepzxUTFAX/rJfIk
         M04HRcZP1cOfOK/wkGe/z3S6PF8OaJJWWs466leYHpihD9TkIsx0V2W5JjHbbxWD1M2s
         MCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743100629; x=1743705429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JREactd+MR6uIyk15bAj7n2qQdSERCkAnE+wV8jYE4=;
        b=n3QqEpNhoKiWuGxVOVHybH2HFGtGPQugwr1pPSMcXfe9+rdzE97y527Fvttvr2XYo6
         ljv7MryFx/OIim2VbpzGqAln6APLbuGY4tbeFtexYjNPJgxGoPJlasmTvqyLgw16b1vg
         VxTEfr9bxiE96pUxaVbu2wjRTaakema0jne8yhg0t+Z5PlZ56MVO1+pLwsTch5PzIddp
         UwkB0aJGVezkttqwqNP4Z/2nqeYH0lUhEz5R3yxymFExXPmK1b0decxYQbLEo7A217ho
         rsTXjmbfT0rrjWPY/NLZFu5hS3lBHEE5t0/q93/QTkHBqr/sd6e1QXXsYwsgPi1UKLkP
         reaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+bcO2U9xRr32lvxco/1Eh1VmrKqV25tGnxK0d1bRNEcmTDWzIO8UneB6fRzS8LlNqmi7/KQdo82M=@vger.kernel.org, AJvYcCVe+WeqbuEF51ouol56/QuI0FxRFzMuntIahx//KTwvH+ICRW2XsaxulDsa11y6h/2mW6ydxcS5JzBuk75A@vger.kernel.org
X-Gm-Message-State: AOJu0YyUdv9M+NpHccTLqfvEhld5xT90PxPc2jiahKiDRdXoiko0QipV
	FHYdKvDwuQK+IvxkJF4Oa1ZziJPIT+BJWaTqd5L+DgHvhKISwjg7yoIvhKc7FtMPAehfTazhY7w
	ISEhkbdapAELChdQOwhZts3w/sIQ=
X-Gm-Gg: ASbGncuXlyaBebK6/Eat5P7Rfo40DfWKqs6j3ZdpLPQrpBvG8lUjUNNC5upeD+y5TO5
	hI9iqYh6uHp1bcQn8uhh1lXy9es9gQHdF+7WbMMTn0ktBJtXtQkQO4RKIPmPJhoOUsswpNC6ic4
	Mk6lN44enbw8W59V2DtciofyT3KA==
X-Google-Smtp-Source: AGHT+IH7c05IJ5W/E9xxmJQsQPdfmivr+RUCxhCsCfa8LemId4Vp9O0cRT5dp0nui4Q2qTyhx/gmnMNOqoAD7O2RzL4=
X-Received: by 2002:a17:90b:3e8d:b0:2ff:5759:549a with SMTP id
 98e67ed59e1d1-303b2112a46mr2303459a91.1.1743100628593; Thu, 27 Mar 2025
 11:37:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213070837.2976-1-hanchunchao@inspur.com>
In-Reply-To: <20250213070837.2976-1-hanchunchao@inspur.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Mar 2025 14:36:57 -0400
X-Gm-Features: AQ5f1JpbAw11CZFqXhvzASt06rySaccLlqPtNMKK5tEKU1zWvxVL9sPEAzCP3w4
Message-ID: <CADnq5_Mw_d5KnUAUMLgu01o5dBoAKGJtPzYFTLp-hSsz8RSWWA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Remove repeated word in docs
To: Charles Han <hanchunchao@inspur.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	airlied@gmail.co, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, 
	Rodrigo.Siqueira@amd.com, mario.limonciello@amd.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 2:08=E2=80=AFAM Charles Han <hanchunchao@inspur.com=
> wrote:
>
> Remove the repeated word "the" in docs.
>
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied.  Thanks!

Alex

> ---
>  Documentation/gpu/amdgpu/display/dc-debug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/amdgpu/display/dc-debug.rst b/Documentatio=
n/gpu/amdgpu/display/dc-debug.rst
> index 013f63b271f3..605dca21f4ae 100644
> --- a/Documentation/gpu/amdgpu/display/dc-debug.rst
> +++ b/Documentation/gpu/amdgpu/display/dc-debug.rst
> @@ -154,7 +154,7 @@ of the display parameters, but the userspace might al=
so cause this issue. One
>  way to identify the source of the problem is to take a screenshot or mak=
e a
>  desktop video capture when the problem happens; after checking the
>  screenshot/video recording, if you don't see any of the artifacts, it me=
ans
> -that the issue is likely on the the driver side. If you can still see th=
e
> +that the issue is likely on the driver side. If you can still see the
>  problem in the data collected, it is an issue that probably happened dur=
ing
>  rendering, and the display code just got the framebuffer already corrupt=
ed.
>
> --
> 2.43.0
>
