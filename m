Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1A1C148
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691662; cv=none; b=jscewLhX/+ukeiYlaR+WgIf2tDOwRXtk1Xv7vOETc1IHLo2ctpNnYqNsKnk/8cgkCjenLN5ZtBXLk8PYFzq2snZZpUauXo4U4rWe4ZAKc6ng8wjVcsuP68+pZkouAtZRnEgoCHh+DVf7F5FtrXS/bvPXWMRmJdSuVGOnCRXx1b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691662; c=relaxed/simple;
	bh=1cMrRrD1wKYeXbyb4edK//2QLqfqx2FamRPjULNvPhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chTqUeYBmydrnCBCFN6eGsL7MoBBxfdHGUaPdHghkxAFMEtWoZwPaEaBfO01RmJXxB0KbqwunePS3cRR0pKFTd9uynJPtcBgoUxbRLsxhqRBD2Pv7ca/DDOYsFKJloq11sqtSrTDRhVTDYWfpclO0P+SQDNzCwfIciNBt/OgwKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tm60BgJo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tm60BgJo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-231ba6da557so416655ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747691660; x=1748296460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cMrRrD1wKYeXbyb4edK//2QLqfqx2FamRPjULNvPhc=;
        b=Tm60BgJowglxwG0ADKJfC/kFivUSVg/1l+v7ESrne7cR7qxwtyERaO+D1IwRHA/baK
         V86dIQbyPdRPCrd5cetOgnoDwv4+ejDND+njA1mc4dPNcegcHB7hIzdp/NLCjH8aOA1P
         QY//U8wXxLQkGocSM8jrr3spx4eR8dMY0RQntPT1PsvX2kuNApk6wEwZxpryN95jddhz
         j/MfHHREeqhMlk5RO83cGHZlu1Z5xPxwvh/zEgW/im7aQg/Uu7PZ4ZgpvA90Mch64dhZ
         h98DP8iOY7vKrerjic+Ad+vu97Mwr00zQmzas5+W5gB4x6Lk4szjNkQH8T6WxzhBp37Q
         6A8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691660; x=1748296460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cMrRrD1wKYeXbyb4edK//2QLqfqx2FamRPjULNvPhc=;
        b=DKzG9BvRgLkiWfIW4tWE9WZSaWa9BXR8Ovv0Bjo9gGfaXs6FMGrQIeks5U4k0fqQlu
         3niGP+gXfG3WcFbYVYXB8JmFfR8uyAflFd6VAo2CITZ5Ey9Lq64hykNWFk5UX3NG4gOl
         xk9vyQEeaZCYVJM+7PPIawkM/3P/6G9TRQ1qDjSl7tYu1X/fpp3D/yX8MPahgsZJi4un
         ExuPy2s7RFEh/kMxmDGkZGt366H7tMoRB5EIo91HuHBvK86nTkXKJLqf/WEAEp8PjUxo
         WJGvjc0WbhCIK0qlDc2EbcfG1ZxdiDvHgETi4IVVFMPQr43MjfFEE1jUmDUt2o2nXHiY
         qc9g==
X-Forwarded-Encrypted: i=1; AJvYcCWCn6nYLwhbuJjh+Mk/7dZjHZi6onMnTFN8Q40t1DgruRDDzhTSit/KbMU/REJ5Cr1QwQgFeVPC/25VBoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZza/CLv42G0LwxeZy4+hjD1c+/qkdvexKGXCaxzSXr3TPmKZ
	h7xMOySse39E0Gc9UWgAx1Go1d/8RExbCZ3eLnJbk25OKlGcrt7/s29NDdGWvTvtdngpHhsbBrl
	XzERLrBj3g0IRaYUQ4VAY9pdNYQrdy718LH4mL1oJ
X-Gm-Gg: ASbGncsiTKH4VzxP1OXgsMufJpH+H5KRicq/cTSfUK0fnPneZMayNf9+hTTl3zy39mc
	EvEpCXOPOf39UOsojelj8tpbOQD3pI+Vs3HstnhhM5Ajk3P4Gwx6Jl2+8h8DIwzvVYAlZu11BZO
	l+EkW4SWm1R/M6n9KIZ8BV5EdJo56H1R2zIREEmovnYmGeiDvhKvz4qxeqThkXTVkI5eg2WJR8Q
	BCNsriy
X-Google-Smtp-Source: AGHT+IGxMFzfxoMshf8o4a14Ejv5ySZeVudjy8uWADR3jrlyocSlHqGDCSnPrW5fBZgeWyiqUxNYjC030ER26Bgve7s=
X-Received: by 2002:a17:902:d54f:b0:231:d0ef:e8fb with SMTP id
 d9443c01a7336-231ffd0e311mr5549935ad.10.1747691660258; Mon, 19 May 2025
 14:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
In-Reply-To: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Mon, 19 May 2025 23:53:43 +0200
X-Gm-Features: AX0GCFvlTHWGpQXPrZqZ0zsT-FBytrKftqSVY8o-HTsRuDoHswTfw7vQf9EDQFQ
Message-ID: <CAG48ez3-7EnBVEjpdoW7z5K0hX41nLQN5Wb65Vg-1p8DdXRnjg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] add process_madvise() flags to modify behaviour
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, linux-mm@kvack.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>, 
	Usama Arif <usamaarif642@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 10:53=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> 3. PMADV_SET_FORK_EXEC_DEFAULT
>
> It may be desirable for a user to specify that all VMAs mapped in a proce=
ss
> address space default to having an madvise() behaviour established by
> default, in such a fashion as that this persists across fork/exec.

Settings that persist across exec are generally a bit dodgy and you
have to ask questions like "what happens on setuid execution, could
this somehow influence the behavior of a setuid binary in a
security-relevant way", and I'm not sure whether that is the case with
hugepage flags but I guess it could maybe influence the alignment with
which mappings are created or something like that? And if you add more
flags to this list later, you'll again have to think about annoying
setuid considerations each time.

For comparison, personality flags are explicitly supposed to persist
across execve, but they can be dangerous (stuff like READ_IMPLIES_EXEC
and ADDR_NO_RANDOMIZE), so we have PER_CLEAR_ON_SETID which gets
cleared only if the execution is privileged. (Annoyingly, the
PER_CLEAR_ON_SETID handling is currently implemented separately for
each type of privileged execution we can have
[setuid/setgid/fscaps/selinux transition/apparmor transition/smack
transition], but I guess you could probably gate it on
bprm->secureexec instead...).

It would be nice if you could either make this a property of the
mm_struct that does not persist across exec, or if that would break
your intended usecase, alternatively wipe it on privileged execution.

> Since this is a very powerful option that would make no sense for many
> advice modes, we explicitly only permit known-safe flags here (currently
> MADV_HUGEPAGE and MADV_NOHUGEPAGE only).

Ah, sort of like a more generic version of prctl(PR_SET_THP_DISABLE,
flag, 0, 0, 0) that also allows opt-in on top of opt-out.
