Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59AC1AF0AE;
	Tue, 15 Apr 2025 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744751602; cv=none; b=RelGxArNlUWL4qHfWFZhd44I5FayzxCut5wx3TzxfAKnYs6gnF7U/04gKkJFASMheaZyZbOKhlaeI9iaQHcSyZVRdBhcl6poXCaB3Yrc5Hy73q/rhDnnEhc6nfRGl6wc5wy6nmRTV4drSJESFo8b3DjkTifQaD7nDtqLmszeyso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744751602; c=relaxed/simple;
	bh=APUcvf3YF1vO+uYtjU189J+YznSf3tAE0tRmaLPT/Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gmd1BK8qmhDVQcRcvT4b90QKxJNME0JD8cRQUZTc7r1c/GTfKvxMPstWmFFdtJZ9Vivv+wmQY3TbEajSbnJFXH/8j9M8jp609iuK87j+YgvcIybljHKY6fSMefTiSMIW2M97DfJOjNcT9fJOm7vG2OrByP/bfUow7WEeW6A7E3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOZEAbhr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOZEAbhr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so1783831a91.1;
        Tue, 15 Apr 2025 14:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744751597; x=1745356397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHLGknYMoOLs5ngthTi5stcyq/0FFXNP8IkshpzhnfI=;
        b=fOZEAbhrllf7wLbfwuUxrRTTmVOVtkUQyaKq0ekeOjKjAByTfP3qq2gsf4AMvcwtSQ
         GRQ6ETUL7TAbwUwT5JKClaGWe+6FtQCKfPCkKlWw9l/U6JsmQ2c/nYr6E8b5OsrNRrHw
         dxafhF5S//3uvr8Zg6+OJF9eufP+C90aFdRdDc7Kbn0aNOOaOhlOnloqeVvdZ0vy3BLJ
         KKIwuSK0dQ2olX7W4wjIlPXITlPOy52V/1UYBgfK/CU9E58H0xeDET8RWRycw6PlU3Ai
         WmAJsz9P8SrrUdYJYMPyiwFFBtGVQ00m2EvCIEF+H9J16L9N/fFHQi6mAYXs6nYHLTJc
         AqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744751597; x=1745356397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHLGknYMoOLs5ngthTi5stcyq/0FFXNP8IkshpzhnfI=;
        b=tQll03XwwNuChX01FtiuWepAzzsIDwOzZbdUOSAM/2DhR3W0jcuJqihfWd20dy4QxK
         zrvhfuodrQiMQlNWH1PMmv4Qus7CIiPDzVVAvbE5mCXmMl5mZEeswq8zyQGw59Ru+fuy
         Kjo1T9vAxcF50nRT+csYX7tSSf+eKjxyug/6DgoV/kwT1S845V3bp7BHAMrHlCau0w/G
         uPTRNYHY1O7AbV+NnXhGCnp7mF7f1IP3Eu+J1j9/YY/qQ02HuezkNPKnESLAzpCQ1OsE
         4MGmpITXZ0vrTs1XSWlnrVXiUS+DUk4JCTdmmFtCS8aSdOoU5WjQnPxgKzINtBmmvLtu
         OgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9ppfE9mB9MI51ddTeX0Q0vRl0CN+Mg5laDeNVIhPB+iSE2FlbgHtxhlPbz0B/bcY/z9uq0oEV0woyWTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwECwgj2xEm9cKdEIw5bE8IfH/CYxaRWjvV/ZKcc40bUfr9RYQ2
	0AgL2F1CrOPXG8ffJ8kdHUzujOATiBEx1wfuPUvxVM1wQ83rtIOCzDWFRtt+Zc9XDjkA5xZFgxY
	Nl9Ey5g1clfiqJ4kBNdXaPn5478M=
X-Gm-Gg: ASbGncs6ggA8Pem4Xt9H8yj2YesU7sevNPchHpr6fLj8BK5etD+0GZbdkNR7B49BHP4
	0kM48UsO+p+eagxWjFhM8gOujsbp+g0nqjpfkRkg9m6pbuFZ3igz2Vef499bB15lm5ojSKO0ut7
	/TlW5Zq8wX3j5N/dOhsuIjMaihCj1qPRUh
X-Google-Smtp-Source: AGHT+IHM90piV4cTZFw7grUOXr4mCxJOuor423t5Vo/nYWbEHHrVHgW/kAzavfD3IYP+p75tnCKOJBCIaksLgjjYodw=
X-Received: by 2002:a17:90b:3b4b:b0:2fe:8fa0:e7a1 with SMTP id
 98e67ed59e1d1-3085ee80932mr368927a91.2.1744751596912; Tue, 15 Apr 2025
 14:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412005341.157150-1-fujita.tomonori@gmail.com> <CANiq72kKhkVRAmg26DNG=Q8-s_+zkz8jVe5MZa__9RPjRs7f6A@mail.gmail.com>
In-Reply-To: <CANiq72kKhkVRAmg26DNG=Q8-s_+zkz8jVe5MZa__9RPjRs7f6A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Apr 2025 23:13:04 +0200
X-Gm-Features: ATxdqUE5FuiSo7mFKLS40NR5DavlskBpVFqdZjGjAtUfDvnKXNnrJ8TyXzkhVJc
Message-ID: <CANiq72m5uoCnhYR=8eHZ12O+D=A+sChAj7ZNTU8vcCTpAhayog@mail.gmail.com>
Subject: Re: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, richard@nod.at, anton.ivanov@cambridgegreys.com, 
	johannes@sipsolutions.net, geert@linux-m68k.org, logang@deltatee.com, 
	sbates@raithlin.com, dakr@kernel.org, dinguyen@kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 9:14=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Applied to `rust-fixes` -- thanks everyone!
>
>     [ Reworded for relative paths. - Miguel ]

Also:

    [ Arnd explains [1] that removing the qualifier is the way forward
      (thanks!):

        Rihgt, I tried this last week when it came up first, removing the
        'volatile' annotations in the asm-generic/io.h header and then
        all the ones that caused build regressions on arm/arm64/x86
        randconfig and allmodconfig builds.  This patch is a little
        longer than my original version as I did run into a few
        regressions later.

        As far as I can tell, none of these volatile annotations have
        any actual effect, and most of them date back to ancient kernels
        where this may have been required.

        Leaving it out of the rust interface is clearly the right way,
        and it shouldn't be too hard to upstream the changes below
        when we need to, but I also don't see any priority to send these.
        If anyone wants to help out, I can send them the whole patch.

      I created an issue [2] in case someone wants to help. - Miguel ]

Cheers,
Miguel
