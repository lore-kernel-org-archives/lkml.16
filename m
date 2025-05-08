Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0D92627F5
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 08:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693145; cv=none; b=Go7YbtjbDgHf/mUbiq8aW1wfy7nEFMgN6WmcoKUd19EeqkpppXLWZlNQab8JMwEi1I85RYDwaytprK7lIP5muXOI5t4hG//BGCqRh81dRqyvSCqQn5Tzu+9u6a2rqCmLrthAT4URq9mS4CCsxeboSqiUynWWxD8EEePpQH1Vk70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693145; c=relaxed/simple;
	bh=N8mZbwrs/5/HrYcaufL1Ugn9aNRzeB+rYc/9Jk/Dr3s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfjlswkwlY5BmwTd7RnfqbIZoBYRsvLpZZ0rCpnmtr99J/GZwbaYPD+MmrRgF61nhRD2qOSS6zhJtNmskpCOPqoclWqGj3Vj51nbc9wS6tptRCR6IfxetvXdvOWbKP9H8Dv+Fnb1bvUfmQ7BPH4lLP5L2A/pMpXJjgn9t06emoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uF8w/arX; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uF8w/arX"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0ad74483fso8563256d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 01:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746693143; x=1747297943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8mZbwrs/5/HrYcaufL1Ugn9aNRzeB+rYc/9Jk/Dr3s=;
        b=uF8w/arXTrCXchwAXa2DikpL0JU18fH6YoZRKCb6GIOXrvuGZD0WnpITWSlRP/4QBh
         l2hdV18bpSSq7k6O5GqL/lH5AjtBtAizMyE+gAgvCnMNoF+QOrX6VGLxP8EbP0ag0per
         wYsM/Zq8eWYhSIHNRaPGazwSgHh5Ufu2P8ohYnopqy68pvbNhUHj1+dxucN+a+8VqSPY
         Y7DRA0zXFBEklAHvHPpnIcw5qm/6tgJXyYT+ArKuxCkI2cQIKqGhOYnflH2xj2t7efKW
         8xwFNg024OCwrncmslOdHPSPzJa0KOZbdoUJ2qJMrBU5z9XtMzVsvxQWjGtoXnSKC/iW
         lqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693143; x=1747297943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N8mZbwrs/5/HrYcaufL1Ugn9aNRzeB+rYc/9Jk/Dr3s=;
        b=knR2sZ1zA8MquadRCbjsno9CptLBirmeXbuA/ZBSOTB0isTFZHIcguZiSN9tYqDqhX
         KfSoz938vNtU2W8aYFIasbsapHPlQIIbHOkFpO65aOKX1Mgvqzzh+H7i5urYInitF5pI
         hY/G0r/C5vwHhO2sZ/oNc50shfuHszlTLDDkF2DbRhy9xwFcfYzLsimfc+L9V6ZGvQsr
         L/OxYZWU1aBjz8fcpzrQZEZiyuv4Q7ZcMKxNfLUaTH2mIJ/RLSru0AeF3hT0nHMYeiEd
         o20VkETO9Sf9zrYGe35PHIdMv0oduEuD7HfqqVoTWyOTaiiPNopjVIMqwDxUz0eBnQC/
         0yxw==
X-Forwarded-Encrypted: i=1; AJvYcCXolTCEJ4qctyZo7hYXlY3PQk5f6jzJVkFfLWYpDD4uTTZKSilTruPzh8S+Ho+AGRVSFloysCXR9DvZtLo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9siV0g6s7aHTVhSSxMPtRvtN5+d+c1nzpP9s1v9tqmjX3m7xs
	M/lPZ9yQxNjfvf4lHNCj0Vb0zOswYj0Ibh6695RaMMuhwZw8rdM+9HBgCtOGBxjMmGvscEWtnwx
	t5B0bxX4SjbpSSH3Fub2j+pyBtdGl7OxrHloY
X-Gm-Gg: ASbGncscDnTAVDePLwPlAYDSYG0pxmvF9sIl6lT1bHSveXq80SJGIJcAAuKNmj0BqmY
	glCM1zZpSUhmoUBCtulfP/N70DP+WBsO4DT+tEyrq3lJp9Z8JTgYMuzW4lbhUF123l/MBdPkalW
	56djfgEt87QJL9r5ggMSKSLWpJ4xOh/drmCt3c1O5M/E2Zip3LqtK8JvqoFMMZqM4=
X-Google-Smtp-Source: AGHT+IGCI9yCKt7dsF9BpZWhipvTKbTZ/CQVkEZcrPI1qI82H4Af2aJ5Eo5kObAwhe6gD1UjC6ZozUgCVkdmxL4SrRM=
X-Received: by 2002:a05:6214:5086:b0:6d8:a8e1:b57b with SMTP id
 6a1803df08f44-6f542aad8c4mr120881656d6.36.1746693142679; Thu, 08 May 2025
 01:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com> <20250507160012.3311104-2-glider@google.com>
 <CANpmjNMUFmnVweY5zCkkszD39bhT3+eKk1-Qqc0LZTUdPN0x=Q@mail.gmail.com> <CAG_fn=VuaiTB11bJraxQjoVxp=0ML7Zoth1CYjczgUof3Rhqmw@mail.gmail.com>
In-Reply-To: <CAG_fn=VuaiTB11bJraxQjoVxp=0ML7Zoth1CYjczgUof3Rhqmw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 8 May 2025 10:31:45 +0200
X-Gm-Features: ATxdqUE7xSG_AG0WDgqD8g8zoZ_7fGDEsRbmK90FzbLlILhlobzg4Gki4bJ9d3g
Message-ID: <CAG_fn=VYg3sveZ8ofNJsx6-rS6p2PDNGWAKj18LpYRu02hV6-A@mail.gmail.com>
Subject: Re: [PATCH 2/5] kmsan: fix usage of kmsan_enter_runtime() in kmsan_vmap_pages_range_noflush()
To: Marco Elver <elver@google.com>
Cc: dvyukov@google.com, bvanassche@acm.org, kent.overstreet@linux.dev, 
	iii@linux.ibm.com, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 10:19=E2=80=AFAM Alexander Potapenko <glider@google.=
com> wrote:
>
> On Wed, May 7, 2025 at 6:09=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
> >
> > On Wed, 7 May 2025 at 18:00, Alexander Potapenko <glider@google.com> wr=
ote:
> > >
> > > Only enter the runtime to call __vmap_pages_range_noflush(), so that =
error
> > > handling does not skip kmsan_leave_runtime().
> > >
> > > This bug was spotted by CONFIG_WARN_CAPABILITY_ANALYSIS=3Dy
> >
> > Might be worth pointing out this is not yet upstream:
> > https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.com/
>
> Thanks! I'll update the description (here and in the other patch) and
> post v2 later today.

Since Andrew picked the changes up already, we've decided there's no
need for a respin :)
