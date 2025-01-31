Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6002F56
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362676; cv=none; b=MxojLRo3wLmyDxy3lBmou7D5v2T6zBtFCfrLNuej1BxoBJZwwdUr7T1kDVkpdXuOzDP6G3BLJcDfNxJzj8wsG+uIhF6kYL6Ob4BVOnfVLqW51vijJCQkz4cXgz4qiYQAv1ir5mflyRe2Y46yx7N0mwvP+arJo193/BE/uQqzrTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362676; c=relaxed/simple;
	bh=pcO437+LDVImqyiRUpHYD5daHe5/hSWciKYXwUxMQYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jcylcqz9Tjk5ovjTrQ9eyemktvJ04Unc+bEgTu3FciXid+QUceRjS5d19F/DOQramEeBfVs+bPIklV1ztfbiVg40MFcAsh1R8GXPgFY8yfPO9AJotq+Qd/dx+jvo6pw3BiLJSsf298DmKOvWBfAG2BgOVj1okfd0SNqz3MTbS0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNf/bmLu; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNf/bmLu"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5d3f28a4fccso3650922a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738362673; x=1738967473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKsXBpMAtVNtSV6mG/j/GoHK9YgSZd073Jd3YtYAnLI=;
        b=aNf/bmLuS6/uv3x29cG8poVjKcYGDe2nl4NoqHqwoqtBUfX5KUiMDkewfaFuyhmo4e
         7G+ftZXOgzN+Kyh/Anxnw7rHZrgwl0ajuefS2KiCqrkqO4IcohEv1Sfi6eAJieb0zeua
         4DtcnLOXxdVpNMND2x+HM4wW6kOnk+OUauS1GTAEGH7+nMI0FKzDSbLY16WmMtZnrE4J
         odE9qD47PRKrho1rWsw+PfSG8yk8Q9hLQj+Iu8LiPvvy9kCwOFAQJpPc4O9F9MXDiDlN
         u54e/CdhSy9FrimRi5PD/Q+vDh7UpEHuTrF7hM8H7n/wjYOfH2yJn4zvDbwI+l2Fqb/E
         MD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362673; x=1738967473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKsXBpMAtVNtSV6mG/j/GoHK9YgSZd073Jd3YtYAnLI=;
        b=ufwcZ9Xjj679qZxY/hgwL7nMrIDnyZUAwxdDYOluRLOVLKY+viK0y9EjTliyualF6I
         M8vNPFEwUSyj3RJMMlSKFHmFqyh0UkyrWn8poHnOeVKpW319/7j4w8WZNU5tklKk0hv4
         U+kx0bz0GXUUnlJU+B2EnsW5hP26HECL7ybFxbK5UHnmnY2KRCYBugVsxG2VkhTG29Z+
         Glkee5q5lBDjO/PFWBzeriepW2+xHkZOgUxQhTcUgLwaK6OItgcZyZWFRiaATeI4NaaY
         yvIhEwcKVGlKAZOfkVG2LxGOctafTXHm3LF0iv1aVoEsW7eFvTp/B2bCzJT8IviPsLTq
         q2KA==
X-Forwarded-Encrypted: i=1; AJvYcCXg0F9pfKb4o+Ajh7sb0A2Hq5E1TurBesqjUahWA8O4G0HohRdcH/NuXvhFMvyVcZ0v6XHXbdr/WS5TBU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjUwmypuAh7XK/ytXJT1BFAsK7tDyol+SAx4teMPTZkUzOIZYn
	NyZkTaFyD8AA2Hr9Eie/Xp3K9RNX4sgGjpHrT0HsOEjqRUMUAJtFyT/cWmsCfU3LYdSEbGaPhyf
	FitYEHm0qVSEjTsCD25ZGs7zjgmo=
X-Gm-Gg: ASbGncsOeuFayZ/G0lx9FKeQgoLskk1s30quEjgu7Qu/rU8NMVGQLE7HZZywbuR0bAL
	gi7I+MSKYF1UmSmVyS6st8FLtzEU2KWQ+anG7OszTksWXd4B6LFtYS81VOFqgkRby5jfQ5Vn+
X-Google-Smtp-Source: AGHT+IEQ5yZBthZMm8y1uTFR/umSZ/26VKcWRXpeVX+Hs4H4/A+qmkdVBwnHcFkRtHihobc7gxlblsFWrSJBAPn2Wyw=
X-Received: by 2002:a05:6402:1e93:b0:5da:d76:7b2e with SMTP id
 4fb4d7f45d1cf-5dc5e6d858bmr14698171a12.0.1738362673028; Fri, 31 Jan 2025
 14:31:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250128160743.3142544-1-mjguzik@gmail.com> <87ikpubt4c.fsf@email.froward.int.ebiederm.org>
In-Reply-To: <87ikpubt4c.fsf@email.froward.int.ebiederm.org>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Fri, 31 Jan 2025 23:31:01 +0100
X-Gm-Features: AWEUYZkoLfYUPWZOALHy2ZhQOXsP1g4Y_I9LMR1orwBiiQ3WDvQ_4Et8wN_qflo
Message-ID: <CAGudoHHd3cE6+nyZY3wi5Xw5++uKiypR3qK_3=2XcGNocE4Vyw@mail.gmail.com>
Subject: Re: [PATCH v2] exit: perform randomness and pid work without tasklist_lock
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: brauner@kernel.org, oleg@redhat.com, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 9:56=E2=80=AFPM Eric W. Biederman <ebiederm@xmissio=
n.com> wrote:
> Moving proc_flush_pid inside of tasklist_lock is a bad idea.

The patch does not make such a change though.

The call is still performed without the lock, but it also dodges the
additional refcount dance (and notably eliminates an atomic from an
area protected by tasklist_lock).

>
> It is wrong that attach_pid/detach_pid can be performed without the
> tasklist_lock.  There are reasonable guarantees provided by the posix
> standard that the set of processes sent a signal is the set of
> processes at a point in time.  The tasklist_lock is how we provide
> those guarantees currently.
>

I don't see anything calling these without the lock and neither my
patch nor a follow up about pids suggest anything of the sort.

> There are two more layers to pids.  The pid number allocation of
> alloc_pid/free_pid, and the struct pid layer maintained by get_pid,
> put_pid.  Those two layers don't need the tasklist_lock.
>
>
> It is safe to move free_pid out of tasklist_lock.  I am not certain
> how sane it is.
>

Where is the sanity problem here? AFAICS this just delays some wakeups
in the worst case.

Regardless, looks like I have enough to send a v2 for further commentary.

--=20
Mateusz Guzik <mjguzik gmail.com>
