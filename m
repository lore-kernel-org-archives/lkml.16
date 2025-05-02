Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA3255F36
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 14:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194884; cv=none; b=o3okgRLZU3U1A5MJvVqbZwyA6Eqni4Zqn3XkHsrwC2PzANj0AYIt+pjx9exa49XU3Iy1La6m1CJ8gfCDUCO+EwwI7VYCOm2xpFoumUaCcQOjdLy2r/pYKuJ9cBFt9ZU1L79t1M0xzsoXvmPqc65T0qLAYy3pLpqwyFl7ViI82rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194884; c=relaxed/simple;
	bh=UVrY8f5Cyv14chduVrQZ3t/d79hUTi9W+07ivdjtsbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oUTPbMKVxliv23ShNkz/Rj19YpSPDEs6WwGpr4KtQqorQt/tZlAAXBimsLK9TCheUCwwX/5ehdwugbYRo1Qg0vbKwMr4PdKXZXQfZEt9N+/utqbOaOOuVzqRLgr/GuTuUCacz4UFUp2uV+TnNaOQyi7w/FC25Jnxl+OL8G5GIYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zN4+LBjn; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zN4+LBjn"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5f632bada3bso8117a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746194880; x=1746799680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+ralkWtDGcfXchRBqjEDJJfkQsdJ9smPBhVueEpLX8=;
        b=zN4+LBjnP4Cu7vLw76toWXqWKIVwN76veFVgq2/O91Cc3Up/kIE8EbvE8D6qttK2sY
         7wpAGEDAki6Pzr1XJgZztl7CKZZO2e4kjWgYWiDKxnEbbBGTguC8JYRF5ef0xQhQXD6u
         E1G4ccXN7SeYRQ8to5IOS4JvnSIO8h7griPAk/wfz3GiAb/HObZ6d3wY9vo5FGufm8yf
         cip1xI2qJRpZiSGOekImzugKayye8fi+47mdCfN1EuzS0ZKNdMVzMXqB9FqQ3A4BBo+C
         J4YR+1GJKqy//CiZvzSNRnpT7qYTNkwxfPmvMzpTed/yRV6aNWxxt4h+snIkyranUw0/
         SqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194880; x=1746799680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+ralkWtDGcfXchRBqjEDJJfkQsdJ9smPBhVueEpLX8=;
        b=nsQc8y8M0tH3SAslYlpYHx5cViDi2UBZkRpKTN2wGSnLEiWbfVCdSmmhTyJilr2kLY
         NngV3VK6JpNLWusZdsl+6gTwGEQM+ktZRevX5EL7dQZ/7gMTlKKV8KUPJVREqbkIHDcs
         gkayiF/A6sxkj+XZVDNjydsHumfiT5nEHrBLnu2sSZtZaEhkqGSvGJ//7LfngsAPUEqZ
         QmRbb1rFrxs8k8jfu4Hw08/qd9C7nn0OtghwAoUT8qRNiLuXbolmmf1hpNd1SmT+z5fo
         9+3jb4kAwzgdJeEv2AJPbcD6KsD7TJXiep/l08ec/YhSd5w704UACZNtS8Gu3Z3MJGEf
         d6FQ==
X-Forwarded-Encrypted: i=1; AJvYcCXti7oJ79dCPNgkv059B+jlhIsYkKAFnCaskFp/FDaQ+w6HIMYS524TQWIgTxxlHANKRHdpIqnkQbTFOiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwruEmP7w/DcCj95R12fbP3TWZ7wR+0w3GZRlAILg2ez1+zDe7V
	d6vBmwXTM/wjN2m201TwThtHRuv/Ka2mmEKwHNV51xj7uVqDYlG6B+FZXKXV7hHyd7741l1exB1
	ja7fEAlgbBH1EiDPHuWBtwYX1z4KPucQRPhIl
X-Gm-Gg: ASbGncuCpEfX0ePwZIEd56whNoOrmFk91VihSjmIUwUMZfZUUMgK7cDAVeC8bZmrhpN
	C9fwkeIH9VXrrwXJVhIW+gFUHTYn9f2wMhP1k/cqjMfORZKJ0mbk1Xwtlii9Tm2EWUMWi8FnaEM
	WuG67rDUyEt7/J/SiPkwDL6hWJSsoiRgTdeEnKbh30Mar7VWXb+Q==
X-Google-Smtp-Source: AGHT+IH2MgYtnCt0qoRxeEEy4wBAGB4W8/4VBrSSGQAsYhZAqwznZ2l8EUQhrSMm9GTN06zMa/L9rySKK9MxDQ8WHV0=
X-Received: by 2002:aa7:cc12:0:b0:5e4:9ee2:afe1 with SMTP id
 4fb4d7f45d1cf-5f9132eb267mr197482a12.2.1746194879730; Fri, 02 May 2025
 07:07:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502-work-coredump-socket-v2-0-43259042ffc7@kernel.org> <20250502-work-coredump-socket-v2-4-43259042ffc7@kernel.org>
In-Reply-To: <20250502-work-coredump-socket-v2-4-43259042ffc7@kernel.org>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 May 2025 16:07:23 +0200
X-Gm-Features: ATxdqUFEoXQsC4OEC4hdmE0Par_5oTsZKTXGKHrZCv9IPMoKZDb_IIBUvPJNHJc
Message-ID: <CAG48ez1YjoHnH9Tsh8aO2SNkJUW=7VUPXAdvxqt7d0B4A8evEw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/6] coredump: show supported coredump modes
To: Christian Brauner <brauner@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, 
	Oleg Nesterov <oleg@redhat.com>, linux-fsdevel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, David Rheinsberg <david@readahead.eu>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lennart Poettering <lennart@poettering.net>, Luca Boccassi <bluca@debian.org>, Mike Yuan <me@yhndnzj.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	=?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 2:43=E2=80=AFPM Christian Brauner <brauner@kernel.or=
g> wrote:
> Allow userspace to discover what coredump modes are supported.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  fs/coredump.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/fs/coredump.c b/fs/coredump.c
> index 9a6cba233db9..1c7428c23878 100644
> --- a/fs/coredump.c
> +++ b/fs/coredump.c
> @@ -1217,6 +1217,13 @@ static int proc_dostring_coredump(const struct ctl=
_table *table, int write,
>
>  static const unsigned int core_file_note_size_min =3D CORE_FILE_NOTE_SIZ=
E_DEFAULT;
>  static const unsigned int core_file_note_size_max =3D CORE_FILE_NOTE_SIZ=
E_MAX;
> +static char core_modes[] =3D {
> +#ifdef CONFIG_UNIX
> +       "file\npipe\nunix"
> +#else
> +       "file\npipe"
> +#endif
> +};

Nit: You could do something like

static char core_modes[] =3D
#ifdef CONFIG_UNIX
  "unix\n"
#endif
  "file\npipe"
;
