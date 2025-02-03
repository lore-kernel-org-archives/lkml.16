Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BDB25A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 19:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738611097; cv=none; b=SVznsMgLIeCCGxUw4MPBsZU8D3LVTzqf6UdtQh8nQEERu9Di2WYD2k0QxmFYe1F/RBE1mLHji+fnqho5oMgLXxt4kUWaZLNBt6IxXPG1dimE5WnwVFu6/sGx8qay9QJjxdFZEDWggup/JkpfG/iZuBsej2f4SqCK0O/Qw0/TNyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738611097; c=relaxed/simple;
	bh=FOv1gEYGZyoTeaAjFhuIFiaQjfXd0wjB/yge5W7u9hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q8T/CyXDopYCCjiK2BsSCb9f8GcU+ESK3p+ieyd3XHwae4GXEYaG+jEhrK/p42MU1SwyB6Oyrj0zvMm+0kqMCyyDtiVzPx/0raT0RGC1VDI5l3+XWS+yNKWBOqSR5xVgZYuVLTdylOsUiISQOY2W15zXWGkes4Hhmwi4FxMx6mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfO+rhXJ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfO+rhXJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso8889508a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738611094; x=1739215894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YhUjuHcIBhGO0WgJf+TIvW0IcxDITAUqyLknQcp0Bo=;
        b=GfO+rhXJ5ojIieu09KST3WqyW6tkorNQuqYGRR+xGPNeDvSC+IGM5aKOqP9twldNMK
         e9NUJxjSWf818dPjUJpIBIPRkN/W5eWqnsVbjxJzifZ2N7+4jShjClp+kXdwe/lWzDCz
         lbflcr5YiLPtbFIJvbD2vqdddIQyCKIg8/kaOWtioFoJTHqsKjSOH8dZJWA/duSCjaqV
         b7e3nz/ghwkYmpYjcvWOr1NGb3XgnQ+c7zA3ZrS0Bo+lMnH69Jqe1pXCtg5u9rH4hXrJ
         QJKUWwEBTIMk2BLM7FOGS7YMpk0UHrRkkDUTjnmJ23D4vG3mYgzyeEOVFnsrgX5tD/S0
         MWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611094; x=1739215894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YhUjuHcIBhGO0WgJf+TIvW0IcxDITAUqyLknQcp0Bo=;
        b=v8ztrTpi/51CUC87P/QytmfGLqzLveK4qlnnUEwdLUHRJOH0yOax6BMcKoLwbKHO9n
         AfHKj7Nbq7ut1gTUIK8+xic2ybeqWWaMsTfo/l+yv7t91wCj89GNZ2+Wm/ATgsGBcrak
         +JuQPZJZ1OmB1GN12VpSwVZ57XjxwmPysz2g3dg20XSC+jdeMIGQsLhiOfT4E47YETk7
         srMibIlnKxywTXF2nG3Q/QWkn9+4olpjrbR14o+ImMPKhoyDgdIPD6oMKS45KDVlQQwU
         bRa08s4ZMP6bc+cXUOfp8YkVzotyDPJz2s4V+Esw1NMO5Ed0UVzpS2/5y2tQlVehWKMk
         UpVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgSJYA+0B0e4GTksu9T1L7r0bsxUe/y4oE0Le2r3W+w3fUo7uPiOWWvIYKxXs0Z+5h0Npnt8MxhXHNZRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+RSUkM1M7t9Uv6PQkIifWgLESTOg1AkqqDVgecwq/Oixxg35C
	FlrEcImTyXVKg4mQVPfELPtggFDR6U8Bkc87NorGqJwU/V0aU2+r+kUrwdtdRuckzQnTHQvVmfZ
	ORkROrhKyzmvRgC+p9S0pp6WKGZo=
X-Gm-Gg: ASbGnctYNfqhixTtdj6Q0VNUKP3UGA2dCl4An9NB+3hEuZ6PTbviUe+eC6xj2yPlUDT
	6A2gB6BbtHIAe3rYeRADGFb3Mu56Ww45j3xZ+/Z9FHscjbp2vQ5VtwRYSiKiJf/48szJUhs4=
X-Google-Smtp-Source: AGHT+IHdIs+qhBF7hDdnYCwsSNBq7iUSnHJqZy8iBI2ejAeyM0QfkcrVHgZC8YYWJ4XiiEOGYow5soi9yNt5HDeLbyg=
X-Received: by 2002:a05:6402:13d2:b0:5db:7353:2b5c with SMTP id
 4fb4d7f45d1cf-5dcc14db066mr509769a12.11.1738611093385; Mon, 03 Feb 2025
 11:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201163106.28912-1-mjguzik@gmail.com> <20250201163106.28912-6-mjguzik@gmail.com>
 <20250203184908.GD1003@redhat.com>
In-Reply-To: <20250203184908.GD1003@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Mon, 3 Feb 2025 20:31:20 +0100
X-Gm-Features: AWEUYZkFHoUrKav1KigJ2FrDpijHpcrtKiqpr4ux3k8oGy48RfWED0jcFkWLbj4
Message-ID: <CAGudoHF5zTjxsCsbVjAHjhtsyRgNWFfbRA4W7TYQY76dDOWSHQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] pid: perform free_pid() calls outside of tasklist_lock
To: Oleg Nesterov <oleg@redhat.com>
Cc: ebiederm@xmission.com, brauner@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:49=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wrot=
e:
>
> To avoid the confusion, my question and a note are absolutely offtopic.
>
> On 02/01, Mateusz Guzik wrote:
> >
> > @@ -1085,6 +1085,7 @@ SYSCALL_DEFINE2(setpgid, pid_t, pid, pid_t, pgid)
> >  {
> >       struct task_struct *p;
> >       struct task_struct *group_leader =3D current->group_leader;
> > +     struct pid *pids[PIDTYPE_MAX] =3D { 0 };
>
> Could you remind me why
>
>         struct pid *pids[PIDTYPE_MAX] =3D {};
>
> is not right? I seem to knew it some time before, but can't recall...
>

as far as I know this is merely a matter of convention, fwiw a naive grep:
$ git grep '=3D { }' | wc -l
1273
$ git grep '=3D { 0 }' | wc -l
2031
$ git grep '=3D {}' | wc -l
5626

that said i can change it to whatever you see fit

--=20
Mateusz Guzik <mjguzik gmail.com>
