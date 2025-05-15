Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9621DED64
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319770; cv=none; b=RUdgHvpvUE7A9GhcIDfiO9h2hrgl1X6glLggO8Idj+8FMlzMXS1B3KMpSRu5hqox9MgokkAYVSlETcqh1QLb4zE4EvehgQuDTq3Ab56YwyxsiH6OU3Mxmy7Uq6dWBtqO8hewETJoHdgnSHSiLcCgBJayZpvWd3t4+PZdL7dXQEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319770; c=relaxed/simple;
	bh=LkwzEhK4YQ+y4ydj2RJEeVreHzqorQrGCeShw3Gkmrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3G+PKRVV9lSb+nwxeT054rDb3x2PGj6cYPPCbLL12l5gybEiU9PM5g9MoCmZjHa/EHuWy685rhuyOMEfgJJRjIdR0QwnNs+XKt9EzVa/wt8iW9OLCOry1UKqOIndcOzzzDMETeEivzPEBp7xtVmkr4Xq0C7duTfXQfRBd+aHGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com; spf=pass smtp.mailfrom=mihalicyn.com; dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b=QBA7431C; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mihalicyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mihalicyn.com header.i=@mihalicyn.com header.b="QBA7431C"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54fcffd6b9dso1137726e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mihalicyn.com; s=mihalicyn; t=1747319765; x=1747924565; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jfHo/+rR2MB5NBA0pbyumj+N88FH0xRlivNxbjV7rwA=;
        b=QBA7431CGUeD+fibjQBsXkMd6BNNd+HNMBFqif3znoO59QdgwmWwotzF2kQaSxR97u
         RFURYC+rE5GKIykbTifdwIAv8+ZDl1aCbupp9fP1AznMFXulUn0WgN8MNhaZ9/sD9IeD
         3EBcLEZ0rrq4wE8rzKENlf1b30zs1gIO413BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747319765; x=1747924565;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfHo/+rR2MB5NBA0pbyumj+N88FH0xRlivNxbjV7rwA=;
        b=wTPVRAItEJ3YJJtj2fVKkERPGUwIx0X4UQquPI8rA7Z89e0T6WTVkIYYWNr/OOfH4y
         EWeb8xnSd3fNpmKLMbgxsP1IZ2F7GHYDLBPHW3370E8W2vktS2lKCoifAb33sI25fROd
         1MBQ5JuFZh7BTINr/Hi8eUSZ04g4X3cc7ZetKQ94InQxWVyOmPGA41YNL+tgCUnNqW13
         VIoMaInWLKmeKK4bZ8wpnYjulD1ogC9q7LcLoT4szBIkazMThLOd9jOoFlhlD4rdCxff
         4zCky+bOrZsC8At2zWcR6sumH3dsFAJP1d7F0U0k+jadZu8s+af6oFyADLhDageSC4fx
         5l0g==
X-Forwarded-Encrypted: i=1; AJvYcCVUoRHbsc9g/xbqxTgGRoj9BCOu36ngTHJqv4WRWgH4VPmfG5iC8qJtKzUWl/DKmb0fsOtRDYY57C/diWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhXmJh0/NJjMVoelliKLV7dlxwaWC3xhz+1d4zyjCWiCiXpHhM
	09oyhuMN/0qbPP+00ddQIWBbNfKHD2nHeODrH1eNfYgUOEvxas6iA/r8BdACPVNqI+DNdtINAX3
	C5zPGNDD3A0WaYkRcfz8RHUAHiV3NX3Aea0tqmw==
X-Gm-Gg: ASbGncsXzmyP248mMWgdsRQfS1MLP64mSgyyiFwMIbR6CQ6EfolzDvS1cib28LgfN4K
	fwqge/yBqA5s2ikJRw2ysFG6q3xDlvudP0nw908hpGAhkzxU9wZCPqBCSec9GU+QVllZ8tShEdm
	x0DdzUoILvzvNydEGN97DKrAaESZNX4AAcc57oiUigGO2x
X-Google-Smtp-Source: AGHT+IHd1CtZlFuSxAsXnx5Takqv6QZTe2+lhVirdtaDn0cFg77DyP9oBpxqfUMLz0N3QxnnHSEZ6bt+VSdCWoGtElk=
X-Received: by 2002:a05:6512:6d0:b0:549:8b24:9894 with SMTP id
 2adb3069b0e04-550d5fbd6f8mr2818776e87.15.1747319765098; Thu, 15 May 2025
 07:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-work-coredump-socket-v7-0-0a1329496c31@kernel.org> <20250515-work-coredump-socket-v7-8-0a1329496c31@kernel.org>
In-Reply-To: <20250515-work-coredump-socket-v7-8-0a1329496c31@kernel.org>
From: Alexander Mikhalitsyn <alexander@mihalicyn.com>
Date: Thu, 15 May 2025 16:35:53 +0200
X-Gm-Features: AX0GCFvO84s9iCLGUVDHGCypS2YVBJg4ZgjowZGClKY4pjGPNQYODIsSapI_tGs
Message-ID: <CAJqdLrq_MG0z+BMCCxX4EGkSyzz-nOuRc+Z0E+wTHH+98KEs8Q@mail.gmail.com>
Subject: Re: [PATCH v7 8/9] selftests/pidfd: add PIDFD_INFO_COREDUMP infrastructure
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
> Add PIDFD_INFO_COREDUMP infrastructure so we can use it in tests.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>

> ---
>  tools/testing/selftests/pidfd/pidfd.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/tools/testing/selftests/pidfd/pidfd.h b/tools/testing/selftests/pidfd/pidfd.h
> index 55bcf81a2b9a..887c74007086 100644
> --- a/tools/testing/selftests/pidfd/pidfd.h
> +++ b/tools/testing/selftests/pidfd/pidfd.h
> @@ -131,6 +131,26 @@
>  #define PIDFD_INFO_EXIT                        (1UL << 3) /* Always returned if available, even if not requested */
>  #endif
>
> +#ifndef PIDFD_INFO_COREDUMP
> +#define PIDFD_INFO_COREDUMP    (1UL << 4)
> +#endif
> +
> +#ifndef PIDFD_COREDUMPED
> +#define PIDFD_COREDUMPED       (1U << 0) /* Did crash and... */
> +#endif
> +
> +#ifndef PIDFD_COREDUMP_SKIP
> +#define PIDFD_COREDUMP_SKIP    (1U << 1) /* coredumping generation was skipped. */
> +#endif
> +
> +#ifndef PIDFD_COREDUMP_USER
> +#define PIDFD_COREDUMP_USER    (1U << 2) /* coredump was done as the user. */
> +#endif
> +
> +#ifndef PIDFD_COREDUMP_ROOT
> +#define PIDFD_COREDUMP_ROOT    (1U << 3) /* coredump was done as root. */
> +#endif
> +
>  #ifndef PIDFD_THREAD
>  #define PIDFD_THREAD O_EXCL
>  #endif
> @@ -150,6 +170,9 @@ struct pidfd_info {
>         __u32 fsuid;
>         __u32 fsgid;
>         __s32 exit_code;
> +       __u32 coredump_mask;
> +       __u32 __spare1;
> +       __u64 coredump_cookie;
>  };
>
>  /*
>
> --
> 2.47.2
>
