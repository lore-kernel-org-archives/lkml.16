Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0956155C97
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317390; cv=none; b=Fp0UyTy+uNApnNIFnQY9Halu9Aqwg0I4gH6EcPoiOqhRttEu0Yk5asE4ykM+Iy0YVBtR1gHz9r0VNkMcbZK40F8MdnO99bnw/zXp76fqvVLY75w9zt1R72k4Z7EeG3jjgAxbLOYM7M/Cto8iWWKHTT6KZKlozye/YHZUOBp1WBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317390; c=relaxed/simple;
	bh=Sa7GETTQgwfVClLUd5WysYho63CW2Ury9OOVP7i4C9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMwdxoqoKZbKRVs5ZIHXMZFUMrF8Oqjg2wionOYPT0UXI+RPBfcfpBeggvVAnAOlJTRVkwgjWPmIGTNYvl5cvyIDUnWnfug5kI6jvHM3bEc1Va8MVSjw8ytyRomaBzIdaYenEmFPOnMnh3qHv9dNtjnmK3mx7bnQuWqLW47/tkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=eSmpYmn1; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="eSmpYmn1"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-550e2b9084dso510106e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1747317387; x=1747922187; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rm0gTtyW2LsxAMkxrNunR4Q/6X7D+Ybvvf7I2m4z9Sc=;
        b=eSmpYmn1Iqh85u9V2kvbtizkz5IuhNwsCxMFXJ3JWMHEM9hDezYfUMf4SERrjznqgj
         M5AW/pYk4myxOrz2rDN1HxUfSmtjQDvE/laJn3yuKs5oXWUGqgp2q3u4KscinaH01CeY
         ZMctDsdcl8UKK9/v6T0YYvMVBl5sd/4tm6R2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747317387; x=1747922187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rm0gTtyW2LsxAMkxrNunR4Q/6X7D+Ybvvf7I2m4z9Sc=;
        b=MNOK+x82UnP2T1ityw3WBNlai8CPTCkPOJ+EEpMU7xcyoFuW5I2hPSS5onv/4tHhIX
         NaMOGrORBOhey1e69f9f2m96d0DT0t6qWQ6TOMx5ELEcTuHPQIpH8/xWIqwyRU/hajwO
         a2FjkmApEltShtnUZ+mZtCZYXVhmBVcalZlvz3mcw1ITl1+3YRyNV+nw118pdp4pynXy
         mPmK6CcxqHhDuQHaFh6O1ygQWOKC5OXc4L5502wjJJkS8rZX++0VZNPv/pLZpzVyeS3u
         /7dT+TsQ3msTDsxKE9yMYxDm4PFv9g+ZysccxPlgBWS0WYo+hHvUlXn5xktAAkzQ9tUf
         t5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUzQy0SQuaA/ixAbbZwEb8pB+h95a0Oe1JW2Czi6sc7VB5M2A26zA+Nb+0GbxViOfiP1Qi0Newys/eHsnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5MT75lmGAQlVXqUWMwULChKU/QE+mqwyoUaleM2+S6/ShZX37
	O58kQQXfALvYEKz0dLHrIc4behVUN3TPTJKgM9HZcCdglSvfCkAiQF88cIGWhYYoomQueaRLB8j
	3dRcRyrrxyWX0soGI/erefYVNf8JoiVTB7tKOAg==
X-Gm-Gg: ASbGncuXjfA64USzttFnuVH90jSFMNtCXsSFA4rZhUDIkz1ulAq4D8Zr1WiZeIiixgO
	8r0hw63rLRRLE7D4EcHjcZ7SUzK7uPz2q6IgKzUMmT/cW8rBq6iokKp06jP5enHICJnYPKAEL4W
	+ofkdCDHol8aizkr7X2I15m17/X/zECHOedg==
X-Google-Smtp-Source: AGHT+IHGJpz7aWTwl9mwnxLim4Wu4UpJRoyZSChwbFUtfQOjHxlGMmgBOj6a+6ZvRKFBtH84qKDoTSz+2awicFIRtmo=
X-Received: by 2002:a05:6512:3183:b0:549:5b54:2c6c with SMTP id
 2adb3069b0e04-550dd00417amr888488e87.23.1747317385975; Thu, 15 May 2025
 06:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-6-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-6-0a1329496c31@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Thu, 15 May 2025 15:56:14 +0200
X-Gm-Features: AX0GCFtkXNTU1UNhCQJwYHTj0HQMppT1zbtgyuIpAsA_JMgRpL61RCC5l6sfyU8
Message-ID: <CAJqdLrq4sCbCV7pjVdtSktsgwA-PWrgrY=_gFn0pVTQ59ZTtNw@mail.gmail.com>
Subject: Re: [PATCH v7 6/9] coredump: show supported coredump modes
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Eric Dumazet <edumazet@google.com>, Oleg Nesterov <oleg@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Am Do., 15. Mai 2025 um 00:04 Uhr schrieb Christian Brauner
<brauner@kernel.org>:
>
> Allow userspace to discover what coredump modes are supported.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>

> ---
>  fs/coredump.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/fs/coredump.c b/fs/coredump.c
> index bfc4a32f737c..6ee38e3da108 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -1240,6 +1240,12 @@ static int proc_dostring_coredump(const struct ctl_table *table, int write,
>
>  static const unsigned int core_file_note_size_min = CORE_FILE_NOTE_SIZE_DEFAULT;
>  static const unsigned int core_file_note_size_max = CORE_FILE_NOTE_SIZE_MAX;
> +static char core_modes[] = {
> +       "file\npipe"
> +#ifdef CONFIG_UNIX
> +       "\nsocket"
> +#endif
> +};
>
>  static const struct ctl_table coredump_sysctls[] = {
>         {
> @@ -1283,6 +1289,13 @@ static const struct ctl_table coredump_sysctls[] = {
>                 .extra1         = SYSCTL_ZERO,
>                 .extra2         = SYSCTL_ONE,
>         },
> +       {
> +               .procname       = "core_modes",
> +               .data           = core_modes,
> +               .maxlen         = sizeof(core_modes) - 1,
> +               .mode           = 0444,
> +               .proc_handler   = proc_dostring,
> +       },
>  };
>
>  static int __init init_fs_coredump_sysctls(void)
>
> --
> 2.47.2
>
