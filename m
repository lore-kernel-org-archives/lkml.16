Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E0205E16
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599620; cv=none; b=pKXl1hKimdZlmM+nEaADjTTMopAkHx1rlpd7Y7Ee9B4+jOMIZCxRsfhW2U5rrDf0Z2/pZrgDTDdzTeoCczb0o2bhpyF1dclDPTTbRBdnBrCWCc+V8sn8Ma6N/83jJ117mYDw6IuujAB23e/DSt4ldaevXxzyTjx/MOOc47uvxyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599620; c=relaxed/simple;
	bh=uMAhnwLIriUAjWznAGzjKTzWgRC9VyoYGCsYbnhwUYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r92M2ppaifLI7ZBVg8K/rTyMnYl10K/jiLK/YTD53wra418zf6cFC1cOcJsh6ae+Yd2glBU9HSGv8b35QqmDaE3zTiAGKfiiy8e+q4nmVZ9iDfHzyqy2JhRml0tsb8KOAdL1RyLB7X/nDmdVYZjlUUcXTZjemR+ttg0j75NI6FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=cMEN7xmz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="cMEN7xmz"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac3b12e8518so1114528966b.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 23:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746599616; x=1747204416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMAhnwLIriUAjWznAGzjKTzWgRC9VyoYGCsYbnhwUYg=;
        b=cMEN7xmzt9VOKuBJM5JNrWrM/7Lq51DB7puJe5wdwvUpt7HqqvjmPM5xHymuF4Etyi
         t2epzc099X2W7iTzevkCpQ3jIjGihkFDS4h1AZ7dDpGVorTbEbOI/qpILx5Ok67XXEHW
         wpbrqo12IGXOD3YaeMP3bfE8cm1yj4VNroFGnRb0PVKAhQZbhnzEGLmiIzmsYT2GhDk7
         gddmuKIBSv7vQI4ivamSXIyvlVsytpHbKgRZV5eB7srownU3/mfjdbuLphqDeRWnHVVS
         shGQuclGEIQzUOwvwZt+3F0RltGT7RzglvoKu1GviSUE7EsqFx9cfRjxDRgxaVv9Qrtz
         vKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599616; x=1747204416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMAhnwLIriUAjWznAGzjKTzWgRC9VyoYGCsYbnhwUYg=;
        b=ZGl5B7/+r+4iHMMRinGQN1GbBba5ZEPqNLm/zT9tF60Jzz/u3XAW7bz5hS5TkPHf/d
         xcM5E9z2UVSt2AyRdtpmlCSTG0ma0GwIL4zTXJX31WyqkcH7XiYEEzNKTJqH5tcU9NX6
         e4OAmwlvGlPgYBYTqxK8+5Jdvt4IiGH9t3fxboROUofC+O7mcIsiZVMYS5Hh7Ney4cs4
         i6OfUp1zptkapXCCylSK3AKch7y2H8MgwNMLo+o5hAo6usx3OjmBM8lTu4yh5l/7l1UF
         btO51b0lXXL8uBGJJt5q4jdJ4G4b5nXRwX6WhESvdH3mJTfUU751148XGzM9xeJmNkYy
         6cGw==
X-Forwarded-Encrypted: i=1; AJvYcCVoj5jkVlE8x7u6pniYLHjwIXJEoLKGabfKbcXqYlVOIDrv3V9yjyyfl4H7zN3t3qzDNXuElRKXVvhLiGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcZI3B9V6IQOFaOhnyO2J8IXglW49Oa34fvLrzm41hkL30lsgh
	qdYdasfgEANVbOU+sZjgwLEfV1odTNYn5m/QdZn4C/c8jZWtjY5O5cY5FihQbOcvZEHN8tUlWug
	+6lnVauje2tfrhURWOlSQuP1SK1OScfUoc/SQlQ==
X-Gm-Gg: ASbGncuFg4v2vFn/1gmGUIK1iRxRfc+GYzZ5db4Kya9zhRLZLQTFYOp2qu5nGhVscMA
	YP6Sw79hlBhwoAoVbhQhvtWHGyiZnfaH+zVE28FLKpPgJXMGpXh15NomI1Jr+w4cAFYaX7jW+Nv
	o7zmMaCNceA5QpmCkrhbOwwoZUN2YGhQjRXdPaezG0kJia2PvsWe3wXoGyothnIQ==
X-Google-Smtp-Source: AGHT+IHxOk1DDQlqgVtRtzVrvtv+KQ+N8hq4sPyVAvu/WTYpqvLk0tXsOwVbxO+K6hN7KxjpnpMjq49TMM7Kxdczpcs=
X-Received: by 2002:a17:907:a08f:b0:ace:c2ab:a729 with SMTP id
 a640c23a62f3a-ad1e8cd5fb7mr222232866b.42.1746599616299; Tue, 06 May 2025
 23:33:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306082615.174777-1-max.kellermann@ionos.com>
 <20250309151907.GA178120@mail.hallyn.com> <CAKPOu+_vTuZqsBLfRH+kyphiWAtRfWq=nKAcAYu=Wn2JBAkkYg@mail.gmail.com>
 <20250506132158.GA682102@mail.hallyn.com> <CAKPOu+9JCLVpJ-g_0WwLm5oy=9sq=c9rmoAJD6kNatpMZbbw9w@mail.gmail.com>
 <CACmP8U+aLY7wmEqdb=a_tpDCY5LaPGb46DU+jSD3bCXX=JUAuA@mail.gmail.com>
In-Reply-To: <CACmP8U+aLY7wmEqdb=a_tpDCY5LaPGb46DU+jSD3bCXX=JUAuA@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 7 May 2025 08:33:25 +0200
X-Gm-Features: ATxdqUGgj7GRkdrDE2HhvGUTjaPAjkb2odBFmjaet1H89q27DW5giCWFSRk2X80
Message-ID: <CAKPOu+_=ocLeEqcaSMjb5qqrvi6KAu3GYJa19Fqz_dm3a5F77w@mail.gmail.com>
Subject: Re: [PATCH] security/commoncap: don't assume "setid" if all ids are identical
To: "Andrew G. Morgan" <morgan@kernel.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, Andy Lutomirski <luto@kernel.org>, paul@paul-moore.com, 
	jmorris@namei.org, kees@kernel.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 5:16=E2=80=AFAM Andrew G. Morgan <morgan@kernel.org>=
 wrote:
> If a setuid program execs itself, does the presence of this code undo
> any protection the kernel afforded it on its first invocation?

What protection do you mean, and what behavior do you expect when
setid execs itself? I see this affects:

1. reset effective ids to real ids (only affects NO_NEW_PRIVS)
2. new cap_permitted cannot be higher than old cap_permitted
3. clear cap_ambient
4. clear pdeath_signal (in begin_new_exec)
5. reset stack limits (in begin_new_exec)

About these (from my very limited knowledge of this part of the kernel):

1. is my primary goal, and really no new privs gained by allowing the
process to keep existing ids
2. only ever changes anything if new cap_permitted is higher, but if
that's the case, the is_setid check is irrelevant because __cap_gained
is true, therefore no change with my patch
3. as I already described, the kernel is wrong (or the documentation
is wrong), and my patch adjusts kernel to behave as documented
4. I don't see how this is dangerous for anything regarding re-exec;
if pdeath_signal wasn't reset on the first exec, it's safe to keep it
after the re-exec, too
5. same as 4, I think

Did I miss anything?

> FWIW I ran the libcap quicktest.sh script against your change and it
> doesn't break any capability thing I test for when making libcap
> releases.

Thanks for taking the time to run these tests. I'm glad the existing
tests didn't find any obvious bugs. If we identify an actual problem
with my patch, let's write a new test that fails with my patch!

> That being said, in general this whole zoo of *[ug]id values
> and their subtle behavior is not casually obvious. I'd recommend using
> a userspace workaround for your use case, and not changing the legacy
> behavior of the kernel.

What userspace workaround would be possible? The only thing that comes
to my mind is to apply NO_NEW_PRIVS in the child process after exec -
but that's too late, because arbitrary untrusted code has already been
executed at this point. This means I lose NO_NEW_PRIVS completely,
because the attacker can simply skip the call.

Max
