Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851B2BE0F0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158896; cv=none; b=EV4n83hLWTgvZljOSr73bObj7jB9ySjwleHcSSwY4jpX7OKfPa8PE5xXw13HhVU/cog24vlPf8JjVuNu2fHr5IB/mp2y0ahjTbQqbLG8UB2e7LqP5QlB+lql3tSajKb1man3PDgaDc2Be3JpCo1M+5LkRZzgp6WHz1O7pTIrd54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158896; c=relaxed/simple;
	bh=GyMwpjiPNcK4vLmXY1CwDjpVBCthEk928qIThdfw4k4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VijNjRU/TmJ3lAx2LC74YBHMXaNVZ7CO4sgpfLyAaOxkc4ohrfKgr/x/eLk3gjf2IgfWBWMK9T2lw+YR3l8Q3tpl/hrKJtiXBa16DGOmTb7v0+uNRKhJ1/jv+ezVSgxoR4sqAJYoDIu2gb6uIwc7OGImQvrSZDPKSZHt24KDNEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com; spf=pass smtp.mailfrom=kylehuey.com; dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b=EPsY95dY; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylehuey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kylehuey.com header.i=@kylehuey.com header.b="EPsY95dY"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54fc61b3ccaso6287297e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kylehuey.com; s=google; t=1747158892; x=1747763692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fEkbbjc8SgdWndktwHsp8qvmd1XKdC5xi77nBDSspCk=;
        b=EPsY95dYAeTKenJtsa5JZjlcCCGLKJC5YNJMXuHF6aZb7UhNRiRhQxYQDRtd33F2h+
         S1eUa4teUA3ixbpB24jJwIGE/hpCjzCSn/SuErsyly1E1uHRwVd+7LxATA/UqkmAkqzJ
         H2Ii1fknze7AKqNtAbiob70KFppp9ecj85Bn8gs4PPG0NYk2u5DkTdxqxFi4NXDVqxCg
         Knjtw+4/V3hsVCSZGBEZ9dwr68LeDh17Py6DkjjpbRs+ff1xbXY+oOAGXo6o6A8xpW6z
         c23eVuOeXDmhsLvm8Hmbn4rDqW9fO+yQaXxAH/gfOtgDaQORhT8e6skNRm6eky2abnqf
         orIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747158892; x=1747763692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fEkbbjc8SgdWndktwHsp8qvmd1XKdC5xi77nBDSspCk=;
        b=GmEjKzcR8wWJqcKjklCSdhqX2PkJfIa+43keS6EIJKMLs2IHHcjj0ub5oHBfjKk+ZZ
         Q5Zvb6ClgVZvVfEw3KPVt/4hGvVctx/nAHMNgl/lGlu8XxTICsNJMHHCxuFaGPg0sgT4
         pP7MQqZZb8Y/ljecN3k4yx00cUPXG3Co/1Hxzf71g47XWQCo4KP43g0eL9cTANQVVDn2
         GIoqlibmeAXjykfVjCAbMD/HahJoyubkWwT6rtw+d+89KRGvx6hdM6Aal7tCC2uKC3e8
         j18yR9z93RYqusx8tGkK734AW3no6TQP0U1EWl5qUjsI1JCcXCswQX2ko4QUx714L8A7
         M0lg==
X-Forwarded-Encrypted: i=1; AJvYcCVxRv+ekmu6WypoWcSkcue+2bsCp2LTUA7/XWWZhi84KbzZ05FljHTgJFG/qDQP+gprOXJYwd8F+4u2CI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Gci/i0W6NLs0H6+m4EsSCjZbPtD8rb54mN/umdP1B308aZTV
	IynZZWLaE9FFIV4UThSYJZcY1Yuwv8CV7IGpMeMqQqzs3ETGX8DWpDFswpmKptUuitorR6JhuhG
	HOFNoWpiNQf+PGUa2EYuhwjdb32tHYqOO2iLQ9WfyooxZnAdFOg==
X-Gm-Gg: ASbGnctX81ONVkdtHuPg/QXC1O3A8WUQb9KCMeBbuUnoUJsqYEHU0in3ylSCXr3kPFc
	3B2o1R1xwj8/X7GMOteBhA7CCEPqlk98aruVgB5xRW0lMRBJY1fIb4BVb+oow2KaL13edWOaGDG
	yJtwym1Q/ETGknZP506LXq6NTmHxy4rueF9ZdcU1cVEvM=
X-Google-Smtp-Source: AGHT+IEdqK+uTg3aHvnbNkaG9RlhSEYZqBiUwcBgzQU1q3K8m+RX0GeIMjK97H9IUDcFFqxAb7dhp9Ubi7rz5ZLPNHc=
X-Received: by 2002:a05:651c:2227:b0:30d:b366:d259 with SMTP id
 38308e7fff4ca-327ed0d966fmr541821fa.10.1747158891597; Tue, 13 May 2025
 10:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512171922.356408-1-peterx@redhat.com> <20250512171922.356408-2-peterx@redhat.com>
In-Reply-To: <20250512171922.356408-2-peterx@redhat.com>
From: Kyle Huey <me@kylehuey.com>
Date: Tue, 13 May 2025 10:54:39 -0700
X-Gm-Features: AX0GCFu0GiXP77j7Ocw_EEYHdj6M7fuJmdwT_meIB0dk-dffw8oy1ZpyJcbP0xo
Message-ID: <CAP045Ar2nojOceUMZYx5x5YPkafNYvMMKRKezQqYa67+CDRxWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] UFFDIO_API.2const: Update userfaultfd handshake and
 feature probe
To: Peter Xu <peterx@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrea Arcangeli <aarcange@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, linux-mm@kvack.org, 
	"Robert O'Callahan" <robert@ocallahan.org>, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:19=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote=
:
>
> There's a confusing paragraph in the man page on two-steps handshake for
> userfaultfd UFFDIO_API ioctl.  In reality, after a successful UFFDIO_API
> ioctl, the userfaultfd will be locked up on the features and any further
> UFFDIO_API on top of an initialized userfaultfd would fail.
>
> Modify the UFFDIO_API(2const) man page to reflect the reality.  Instead,
> add a paragraph explaining the right way to probe userfaultfd features.
> Add that only after the "Before Linux 4.11" paragraph, as the old kernel
> doesn't support any feature anyway.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  man/man2const/UFFDIO_API.2const | 43 ++++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 19 deletions(-)
>
> diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2=
const
> index 54b34a1bc..1c554107a 100644
> --- a/man/man2const/UFFDIO_API.2const
> +++ b/man/man2const/UFFDIO_API.2const
> @@ -42,25 +42,6 @@ fields to bit masks representing all the available fea=
tures and the generic
>  .BR ioctl (2)
>  operations available.
>  .P
> -Since Linux 4.11,
> -applications should use the
> -.I features
> -field to perform a two-step handshake.
> -First,
> -.B UFFDIO_API
> -is called with the
> -.I features
> -field set to zero.
> -The kernel responds by setting all supported feature bits.
> -.P
> -Applications which do not require any specific features
> -can begin using the userfaultfd immediately.
> -Applications which do need specific features
> -should call
> -.B UFFDIO_API
> -again with a subset of the reported feature bits set
> -to enable those features.
> -.P
>  Before Linux 4.11, the
>  .I features
>  field must be initialized to zero before the call to
> @@ -70,6 +51,30 @@ and zero (i.e., no feature bits) is placed in the
>  field by the kernel upon return from
>  .BR ioctl (2).
>  .P
> +Since Linux 4.11,
> +userfaultfd supports features that need to be enabled explicitly.
> +To enable any of the features,
> +one needs to set the corresponding feature bits in
> +.I features
> +when issuing the
> +.B UFFDIO_API
> +ioctl.
> +.P
> +For historical reasons,
> +a temporary userfaultfd is needed to probe
> +what userfaultfd features the kernel supports.
> +The application needs to create a temporary userfaultfd,
> +issue an
> +.B UFFDIO_API
> +ioctl with
> +.I features
> +set to 0. After the
> +.B UFFDIO_API
> +ioctl returns successfully,
> +.I features
> +should contain all the userfaultfd features that the kernel supports.
> +The temporary userfaultfd can be safely closed after the probe.
> +.P
>  If the application sets unsupported feature bits,
>  the kernel will zero out the returned
>  .I uffdio_api
> --
> 2.49.0
>

lgtm

Reviewed-by: Kyle Huey <khuey@kylehuey.com>

Thanks,

- Kyle
