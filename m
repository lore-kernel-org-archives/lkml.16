Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAB733EC;
	Fri,  7 Feb 2025 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949075; cv=none; b=eL+fyRoxfLIGKlXGZhHhtO1S2etupFiM0KHb14wYXx3NJGvT3oxGfC2vx7lA6IlUjlXRzkOoDBkmPNlnC++NvNI+zEgRQ7o7WI9RTXXzxtlUOYFDU7kYY9PiXIc/pExN224RDn6vlsJwbP7cYbmt57yySFcnJRiR1yeRZmPPi7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949075; c=relaxed/simple;
	bh=4FqbyW6T43rM8SaIorh3pfrQSsJBAEX+RkDworH46sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOm4C1uENS5poqQib1yjpOdSBk7+GztjnNdaFHk5rixyZM2IWUDbqEkzJnlVlsmeh4OPqrNgPN6XPyy10P0KvpNSzrgoI+o4g44xE2hSVEmJFfLVOPyBo2tQurpAb7lFPBtDpM4Y6m390u+k9Z7cjePMAqNOqFE8kWXpgtTjCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQ/yA8QO; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQ/yA8QO"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3076262bfc6so24573781fa.3;
        Fri, 07 Feb 2025 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738949072; x=1739553872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FqbyW6T43rM8SaIorh3pfrQSsJBAEX+RkDworH46sI=;
        b=bQ/yA8QOLn3nyzGankSfNZQy9J2dhBtQZdQnS659+J353l6ptcrEl7Hp7Cfj5ato7P
         tH/CmW91juk52MBc0NagRgczT4fAfuQu4IR4DIWxmp7ebPEvl7amiY8Wqypc2M2S5nng
         S4J9UjHKgr2w+Q0wVlWXYs9H9pj61ZL7vMgSKK90iR9sgAhu8UbCyP7Y67bFX2Pf8KPd
         tRq5R2T23moVi3BIfmwLw8Z/Lqn7MLsioNboV9XVp9VIwQOBjg52b5SHB2PTY3G0igB1
         NXA9QJ/8AeiENvI5rmUjySRuB0EKv3/G2SBZ9XdiZlACtrM0K8dMKS9TQOjbMtnI8Dg8
         Skaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949072; x=1739553872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FqbyW6T43rM8SaIorh3pfrQSsJBAEX+RkDworH46sI=;
        b=F5yHh+5mzugnxmeDn7vPIED797fOYO35phyK0Gu7XPlZCX6GDHJmxiJtfXGRZvdGBT
         WpIBsW5mZhRwxVMU/uBaa4xjZdfSOe30MjWBxDXyE8RJiselWZgjAs7eWyaaAM8cfLPh
         xSCX89oT7+TR0c9Nueg7arGY63rs5aJzJchGN0caGDC6MErn4f1iW0Q+LgtSPz+37r4c
         sW9RoDqWrv4OH+afNINdffpHR5IvrnguI0yons5mU7e03OyMRSWphDlm0E69LKcmd4Kf
         NQGWekGNF1tQ3MI1hIZVGG5qQ25MQhuPHENFX06En4Rh7SmJVLlaHCkEg7yj7Xt57jUM
         rpCA==
X-Forwarded-Encrypted: i=1; AJvYcCU5RogEcXpjRJp9qEGLLNIaBuZB/ZKz7rHlyeR/sazbHXUmWi2vqdmlMGY+AwgZoKPKsia/V+8qMUUCyLyhISo=@vger.kernel.org, AJvYcCWZLkfkBAsA7Nr22jAriKhYfLLxewYGzlHKoJ6a7fnK8VQ496Wlzfaac6PODuxyTb5QMy4SuQcQcPBY2sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlblMtuAYAVuyS9GZ/fdByEF2JIHPzQzAyCHt6nUej27qeQKth
	mUXsCxEZxQkr3yyn2cm/UBR/0b05eH3JDr4y/PmUrw+f+CxNj8H0b0W219n4ymbs0GG7/7ReJZe
	QJ9bfc5h2xZpwnKB4u+ZJeVzyX/w=
X-Gm-Gg: ASbGncuSiNaoTIqY9H88ZbymG0SWZAI1PrUkDk8TczqWsomrFTgBDUZaL9mgd0spkDq
	055fvnUZc7Vd2uyRzbgk0Ku2e56kxb9Bcy3g9jj/AUBZguW8FATtxnTDDoJ6KvKeP3Mj0hC2wRx
	f4y1wXN05Qv/nzgc5fblrpj7Y4ROTb
X-Google-Smtp-Source: AGHT+IG9pbT24kZGeeD+jal6OKbhajlzOKUg4scWlT1NB/y1Mro60A9M7f+pnlieWgL50xF9H8QjqJq2pwKffaMJcns=
X-Received: by 2002:a05:651c:150c:b0:302:4147:178d with SMTP id
 38308e7fff4ca-307e5a73c15mr17208191fa.28.1738949071450; Fri, 07 Feb 2025
 09:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-aligned-alloc-v3-1-0cbc0ab0306d@gmail.com>
 <Z6UwCtaO-qVYEN2Z@cassiopeiae> <CAJ-ks9kvrBBLTnEmRPbrkoHYgg6wrXoTVXh8ecqYBSPTfpjx2g@mail.gmail.com>
 <CANiq72=P3O5Q=S4JBVGY0B0t5xSfMYGu3YbhT6SQmbVcAkEA8A@mail.gmail.com>
In-Reply-To: <CANiq72=P3O5Q=S4JBVGY0B0t5xSfMYGu3YbhT6SQmbVcAkEA8A@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Feb 2025 12:23:55 -0500
X-Gm-Features: AWEUYZlzQeDAaaVqkaMfjkSWv28i9coMAeQO2OkT0X01FaL_a7WEuwb4KcogeJM
Message-ID: <CAJ-ks9nFo7broCoOSBzzaG1uHEK=Lch8vxhGCvqQj4xwWP0nXQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: allocator_test: use `posix_memalign`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alejandro Colomar <alx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 7:19=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 7, 2025 at 12:43=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > I'm happy to wait for clarification, I'm just not sure whose court the
> > ball is in.
>
> Ideally Alejandro would clarify, who I Cc'd in the previous thread (he
> was not Cc'd here, by the way).

Sorry about that.

> Anyway, I agree with Danilo that we shouldn't overcomplicate just for
> this. Using the previous patch, but being clear about that we are
> using stricter requirements so that it works on macOS too, should be
> fine I think. But I trust Danilo to decide which approach is best for
> maintaining this.
>
> Cheers,
> Miguel

Seems there's consensus on the previous patch. I've reworded it and
will send it in v4 next week to allow Alejandro some time to weigh in.

Thanks.
Tamir
