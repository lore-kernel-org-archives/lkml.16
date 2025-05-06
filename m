Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896A1DE2D6
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551260; cv=none; b=RB22+2KAk3LWgzPosRqwWjx/BLs4D0VnAsbRUuHFMt3uQy3mHWfvmi3sn0ZRCECyW6sKI9kGisjjTDfQYfH3nqyVIEvktF3ScrGgJxQv3ujHfZo6sY3XWD8alFKaNxyqCut+p7VQFCkUAkGHLnnMqu+J2VJOeHcNaSon0yPF9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551260; c=relaxed/simple;
	bh=Y1D/Ai7Th8b1ulsQV8Rw/WzGuOfLtn4luAEIHycJPbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meguVAOGgkjic/OndYd29GFzgZVvEtQ679lKfmOaQeP2bE053Eg9bPT7+cUbKHPH6WUXpBob9X8eV6bBBJmVZGFTjioJEgBoJkd3wIJS6AMr3CayHeMFbsnioXRb4m0A9/Zd+h6B1yrRvJ2BXraOyBT8Qp3RW1cy9UbQbzZKAfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=wKCpkMVv; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="wKCpkMVv"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAAA73F12E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746551255;
	bh=WQHjxQ599keg+lxgKKgv5hY1aqkd9MG97ygANGkcWy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wKCpkMVvSyaZ13gW1hbiXgCVykm2QncYlGzE4wM/zS9ePA7QobBfhhbsfCoSy3erj
	 o6O7HkXJNSWI1womyZsFzpdTFpfMmBmfK6iBg9y9kz2r1tuocX9XXCQzfnwEv0LEEs
	 iiznjSEGCH3gyOvXj8WwW0nTPDge5kU7GcxxVXZgvzRz4SLE+4+9tuoYJ7EeQ5saiK
	 Bh+8Y2qE0eO5EVKEFNfj4tyOlapVBBgKeup5hw/oCevNlpSLt6jMy+TGuPCZRzbDIq
	 4nvibJfudoJvyH5usGyitq/fEyr0Sf4fHMk1CAu8o8Zyi+lQ//mhR/QPTuyvd7Q1BH
	 I14nOTdEWd4bg==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb66d17be4so479483066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 10:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746551252; x=1747156052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WQHjxQ599keg+lxgKKgv5hY1aqkd9MG97ygANGkcWy4=;
        b=j4YF2FvFQ8sxFsqhEiSFA0latELW0ZoYcmslR7vsz+iXzS0blyZuGmxhchzLl0jCPQ
         w3q9ElROTg2HCrRS0D+gpVtKtRez0iRuAX8eom81YmB3IaH2DmekP2PV2KwRd8v2kRfF
         hjXzWF2y1ct8fU2iGl8qThLNX/gzzUYp3Xq60ouGF0o6pgTj0fk9i1Ahc+nWy8pps1Wc
         lCqjmGYLUDwbRTswNsg+0UwE0PDE6mbN7Ut2sgy8p2KUw7D7UKQkVoeXZIEKGxLMzGzO
         9gR2cgwTPjr72FNlZ3N3u0elvr3YIrs3GPF2VaZhw437t6BtT+hm8vfMJVlcAdYYHxuE
         Jryw==
X-Forwarded-Encrypted: i=1; AJvYcCVnUq29tx0yXivRbbsGQaxs0zgBRUi8BycxK88xd3pNwXk5zWdi9YVAvAFvlJYLdRpvkkBSqavKc5scqGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynUdxOQ5r3ZbyHgscvcx7kc2VvCVKvPeNO4Zbk/7z/OuvcLEQr
	duQOZrGsPceiWCU9Cp2NHvfuDQavzKn0b2RpZcANpjhhlFRS9G/x9dSNQWtYLwUQjA2KE0usPIT
	CHq00HIy8HZu1PjZXIP4cxTyC0nViw+haxOC4pmDxWiaax36zk72kCmuYS+jTivqYVC41hKGVtg
	cJFzvaoOSnkAqpFdVJ+findRktkZGoKmRgcxoQ9WUnvDdddi+gcuXp
X-Gm-Gg: ASbGnctdhdARDoQ3pmNb0r8tJp6fgreYL0grAzR3nGLfrGnnQpqucohsBoI5ijvWroz
	LBkmD+Hl/f3kA9e3d+/Hp5tnTNb9cSJszxi/YG8DTAl6rU25JkHMwRkbFTnfRLhJtsHJa
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id a640c23a62f3a-ad1e8d03300mr24484766b.39.1746551251657;
        Tue, 06 May 2025 10:07:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEELCfRqIOuYUnndVtrp9GHbcIPFv6oQ0mX4mJunFchFQKzR4N7i7UxFMlcDKaCqsfET+x4XtS3/doFGJc8mF0=
X-Received: by 2002:a17:907:a4c1:b0:acf:c80d:ad81 with SMTP id
 a640c23a62f3a-ad1e8d03300mr24480566b.39.1746551251309; Tue, 06 May 2025
 10:07:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506170425.152177-1-colin.i.king@gmail.com>
In-Reply-To: <20250506170425.152177-1-colin.i.king@gmail.com>
From: Ryan Lee <ryan.lee@canonical.com>
Date: Tue, 6 May 2025 10:07:17 -0700
X-Gm-Features: ATxdqUGnt11yRJyWyktYtIrCkZT5mDo5sbrkN2hZjNJrjV5n2rzCVahg-DNhbLY
Message-ID: <CAKCV-6uAdn9SvUFrYqGo0ZzJUtPAYgRFcfHPgmrG_GDt2Ob6Hg@mail.gmail.com>
Subject: Re: [PATCH][next] apparmor: Fix incorrect profile->signal range check
To: Colin Ian King <colin.i.king@gmail.com>
Cc: John Johansen <john.johansen@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E . Hallyn" <serge@hallyn.com>, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 10:04=E2=80=AFAM Colin Ian King <colin.i.king@gmail.=
com> wrote:
>
> The check on profile->signal is always false, the value can never be
> less than 1 *and* greater than MAXMAPPED_SIG. Fix this by replacing
> the logical operator && with ||.
>
> Fixes: 84c455decf27 ("apparmor: add support for profiles to define the ki=
ll signal")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  security/apparmor/policy_unpack.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/apparmor/policy_unpack.c b/security/apparmor/policy=
_unpack.c
> index 73139189df0f..e643514a3d92 100644
> --- a/security/apparmor/policy_unpack.c
> +++ b/security/apparmor/policy_unpack.c
> @@ -919,7 +919,7 @@ static struct aa_profile *unpack_profile(struct aa_ex=
t *e, char **ns_name)
>
>         /* optional */
>         (void) aa_unpack_u32(e, &profile->signal, "kill");
> -       if (profile->signal < 1 && profile->signal > MAXMAPPED_SIG) {
> +       if (profile->signal < 1 || profile->signal > MAXMAPPED_SIG) {
>                 info =3D "profile kill.signal invalid value";
>                 goto fail;
>         }
> --
> 2.49.0
Reviewed-by: Ryan Lee <ryan.lee@canonical.com>

>
>
