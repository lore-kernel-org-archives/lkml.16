Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8D1DE3AC
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 07:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745738970; cv=none; b=Pum33gyZtYI7W9bVPm6s9HKLV1qdCdFuZ9PRPyR48M4vn3OvRa2e5acQThjwqnvWK5OIGuUwzuymlNbYbb0teYqutwhqg8UDlDlplviEjrIXgegQN4p6SBZDbUljd0fwjvhuJruuZ1+QiDYpp1mD/+rctY67UXflTsJ/BvLmBzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745738970; c=relaxed/simple;
	bh=YmIdSq43KeqVX2RY3EWr0cE19/g+nxXYj6wkj+8bK7M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UB+gdYaGGBm9ujTKY/p63SmklOeTH877nsFubp2y8YgJ1ZlFsnCLXFFwt3vhMQlTzNnt589gQXSa/cqtMX/gqdJDbW6ITvWT8/pdJDL6F2AteF0KaFExHFiRDUBRpzYRYzLuFgYHMa26DhdfDvKtFaCsX7Yzw84y1p0d4+d1/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Is+oWpTV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Is+oWpTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745738967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcGQpFTguItVa6CDu+q0byxuNxLDL/Np928mwDKp2zQ=;
	b=Is+oWpTV6S7/aK/v/Ng3NVe5/7DfH8YuLnihzo7J5jXqu4OB6r8Z5/yAQ88foLmlx6iVeW
	jJL2GN05tCzxgI0SVK0g/WFmiCUy1X09+ZeOoqUcBDh5JQLB+bTtaYi5NS36tSlziIYd4j
	uMB1DSsn5unJ7x37W63KhwRcsxrChVo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-TT62dsfcNpirg4YClsN7jw-1; Sun, 27 Apr 2025 03:29:25 -0400
X-MC-Unique: TT62dsfcNpirg4YClsN7jw-1
X-Mimecast-MFC-AGG-ID: TT62dsfcNpirg4YClsN7jw_1745738964
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so18142635e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:29:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745738964; x=1746343764;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcGQpFTguItVa6CDu+q0byxuNxLDL/Np928mwDKp2zQ=;
        b=mMy7chRj0B4HP6SLb3EU5TF1N9d50sjx1Zbiav2TgvX0wDYftkp61qOvb9l/EspPXp
         P2ydbwH1deyJhLHODAfdhuFhad7qDK1cpOuJnLLlkBfs13AHBp9KpY1D51gfT01iFw0A
         aJvxh8iCwUlGZruoLEU1NIu8SBpsw7FRL18lQzi84jVJurKFtVruz5y3YnyZKc5d4Uds
         BOVm/FYMGfzfEQn7/WNUDOXsIGAUFXFKQnvyayT9UezAST7mLlGJY7gBUsWrx0eI+mzt
         fQjOUHA/77XUqSRQ0+yOL5RkP1exqj5ngCy4Ebo4UbbA7zJuYVQwPrgwGwoN1e57I8Kx
         dBJw==
X-Forwarded-Encrypted: i=1; AJvYcCXSVRN4TUd6klSakIBxZknl7P4+0PsQFvg6eHLJB5wMBtPXGjwsm4umX+LvEALFPmQTIyctkgah/FGT0L4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx571ffbqCxZsNK+YxVhmqqAv4aPeX8ry+YnVo3s2xuFQMHsgXN
	OAztuv+pjPiithYtNIKjkArt+UGzqBTZPxNJcGI82+T4BUlfGGRkMdRhdSxgBM7g939zLLRa4xD
	WhCUFowU7KfTjpDkjABc6yGfYZ8Dr/Fjx/Vk8H0QHxN+SXqaO6YqqGMGD90iqEA==
X-Gm-Gg: ASbGncuhLbdWqmWpufQgHwssFwT4PM475XCXG3Y5Al2CYb+hGCdF5W7R8IGfCxD/sZC
	n61Go8DgCRjUhhudsvrt4i/XL8YWBOb0NtqufGYIeR+kjLmJxhSFWdRQX5ErPc0QTuj93rEgSiu
	cgKO92pir2tR2RjPK+T2wKJUdKiyQwlQqa0EB9bFIREA81UHi0NaHJZkw0JJiSxi+twTTS3zn25
	jg6MbYd3zbPzdeJtAgU46RiV0II+e5KrwpgcRC+Bj8rrL+IFv2K+mMlV6BchmJYodFQo4qS7KqP
	9przDwcIvU0sRgXYZ34dxxAYpNQMnbvN6uIDb9zYjCr52MVob0YmRkL78tTylAVvt53AOQ==
X-Received: by 2002:a05:600c:1e84:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-440a66b7b68mr66727295e9.29.1745738963930;
        Sun, 27 Apr 2025 00:29:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHimZlDfyKX+dV1RunsI8DPPpzKCieKScXo5Xcy7H8gXFHsd947YK1+IzF4ivCFxFOjPMb/Zw==
X-Received: by 2002:a05:600c:1e84:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-440a66b7b68mr66727125e9.29.1745738963562;
        Sun, 27 Apr 2025 00:29:23 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408d0a7802sm102831515e9.1.2025.04.27.00.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 00:29:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Ryosuke Yasuoka <ryasuoka@redhat.com>
Cc: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, jfalempe@redhat.com, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH drm-next v2] drm/hyperv: Replace simple-KMS with regular
 atomic helpers
In-Reply-To: <CAHpthZqJPKtXUjFiVRLP+LEmTKFowUKVHGDe9=NS4aGx7WWcMA@mail.gmail.com>
References: <20250425063234.757344-1-ryasuoka@redhat.com>
 <87wmb8yani.fsf@minerva.mail-host-address-is-not-set>
 <CAHpthZqJPKtXUjFiVRLP+LEmTKFowUKVHGDe9=NS4aGx7WWcMA@mail.gmail.com>
Date: Sun, 27 Apr 2025 09:29:20 +0200
Message-ID: <87selugizz.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ryosuke Yasuoka <ryasuoka@redhat.com> writes:

Hello Ryosuke,

> Hi Javier,
>
> On Fri, Apr 25, 2025 at 4:15=E2=80=AFPM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>>
>> Ryosuke Yasuoka <ryasuoka@redhat.com> writes:
>>
>> Hello Ryosuke,
>>
>> > Drop simple-KMS in favor of regular atomic helpers to make the code mo=
re
>> > modular. The simple-KMS helper mix up plane and CRTC state, so it is
>> > obsolete and should go away [1]. Since it just split the simple-pipe
>> > functions into per-plane and per-CRTC, no functional changes is
>> > expected.
>> >
>> > [1] https://lore.kernel.org/lkml/dae5089d-e214-4518-b927-5c4149babad8@=
suse.de/
>> >
>> > Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> >
>>
>>
>>
>> > -static void hyperv_pipe_enable(struct drm_simple_display_pipe *pipe,
>> > -                            struct drm_crtc_state *crtc_state,
>> > -                            struct drm_plane_state *plane_state)
>> > +static const uint32_t hyperv_formats[] =3D {
>> > +     DRM_FORMAT_XRGB8888,
>> > +};
>> > +
>> > +static const uint64_t hyperv_modifiers[] =3D {
>> > +     DRM_FORMAT_MOD_LINEAR,
>> > +     DRM_FORMAT_MOD_INVALID
>> > +};
>> > +
>>
>> I think the kernel u32 and u64 types are preferred ?
>
> I'm not sure if I should fix this in this patch because I did not add the=
se
> variables. IMO, we need to split the commit if we fix them.
>

Right, I got confused for how the diff showed the changes. But I agree with
you that should be a separate patch since the variables already exist.

[...]

>>
>> Acked-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Thank you for your review and comment. I'll fix them and add your ack.
>

Thanks!

> Best regards,
> Ryosuke
>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

