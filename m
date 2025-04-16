Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FA8224B10
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834132; cv=none; b=ANwd9wnu6bb525VEUTq0hzS1KGCKHuaJ3p0Sje6R12vyYksapqN4RlA13UJaQ7dVoTZ1q/QG/bGsVzHgYZvOc4JsuKB2VwWSCqHcVhfi7t8vzXggqO0Hlm9s8ltqxrJtU9+p6PuBB6p8RGsfgiksv54jnXsIX+4u/3ZJoWbKpL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834132; c=relaxed/simple;
	bh=yE5ECAItcuDQCq+yKRsL3iozYXep7w9OrJcHgAxWW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEEv8y1c/qw84Z/5Wg0XWycRNTWuGv8pmLJZmSzRuKKDHyD6W6VAIGnYHGJhhqvl3WX04AE8f+zNrrIAQwdVFUEG2Ux19FJsPUvh8WCzFAabuKVJjTMz673HE2sU3QygGlX/vY2RnS2zU01AwTMpZ5HaQgkDac8vADWks4T61yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZs1i2C+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZs1i2C+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so609465e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744834129; x=1745438929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibZ7KQHmkt/3pfRd0AhQfZ4hStjunS1iiXN137ErW8A=;
        b=qZs1i2C+jpT8wbRxtaqreN3nhD6HshW16yGPAaGPW9i/TVZXg/R0+pCIzYhyD+GsZ9
         hB/vZPq4f+Dy55IESwsAzPHWiWZM8vyAzuf69190+4ER4GydMoZl74UKA4qcgSnaxfXs
         t+csjLHU0bp3VyvJgz11eEBFrKGJkWq1vPGZM1k+kZpWEiFN9BGmaSSGkaS56Mn7+IZe
         oNTySu8gOjkgEinrpeantATbRPCNkOnyEmeXLd9fToecmb/021B0WyFPw+jgzGYJ1u6X
         Ep+PglrkxsAjzG9K/QhIDR1DfY3wi+rxj2QOPMlO9Qgvc3vfHoVMZThrCawZ5ssnTvFf
         CfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834129; x=1745438929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibZ7KQHmkt/3pfRd0AhQfZ4hStjunS1iiXN137ErW8A=;
        b=CMw5jB9XBTOk1aTx9N92gtdFvcslmW486ASpd5gNOFKzm7YUtezdVzuayWRjvgaF6I
         ruLzkxJ78dVxuVIfJ9p1fueSEKKFdoJQieXHK40zywLnEOnqNKSmJbbI8gPjul5aHtie
         Ft3mmxeP0jkMB4/tFNUCZ2arP39zZsM7eQp4kh9GIRPKw1KFMFfQD+2988jPU7sr9RHI
         eCnT8wSlu0A3KlN3GgjVusXRidJcXSHvDCyhJq0Eecy1enCk84EPfPJ/0qpmScmr617S
         QDzSCe9dTjfHhlJ4156iok1ofeZdzvrcs/guZ9v/gR8VHRQsHBVcTNP2ZNYkTlL6H8cl
         hl8A==
X-Forwarded-Encrypted: i=1; AJvYcCXcdFJxitSmyUGUqkf5Yh7trKRU7WiApUf0Hx9MvYf+TJNYibwRiaUwn2Io04oKIcaBN5UUz+vgubR1MMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxok/2WNsvaXWTfS1wgDpE47ZiCfA1jtYfeO/BymCYfyyGU3fnk
	64K4+9q+x1YDmDwx0adzGh9CEycmGjQM1WhqMdmp6yrWQeKot/kVnH3DEWKH8yFq69Fzo1i4mVd
	KorbAI75nF4EhT8gcTIwTgLRSrlLJvt+cJE2N
X-Gm-Gg: ASbGnctXgFy8E9uAhXgBFjm5ypECYJIHfwRpGBPGbbcu31ssAuL5Fhka6RPpNDY6nkG
	UfBYWPGUUQsf/cI5lWV9tixrI5xR65uzC7E4Sh2NXnLl8/hcNOJ/rz63fhwQesKvscWCTAgEDxd
	qi7JDISiKePH/1WsYthMg1Jf8=
X-Google-Smtp-Source: AGHT+IFp6AC18M0DKQIHU1V+NvGAjfad3pIx2ikOtgjeGe8a+HdGSpHxHxUcanJNCCDfXYEEIfqurbJukqjKN28qZsQ=
X-Received: by 2002:a05:6000:1882:b0:391:4835:d8a8 with SMTP id
 ffacd0b85a97d-39ee5b13e81mr3177874f8f.1.1744834128620; Wed, 16 Apr 2025
 13:08:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com> <aAAKwTj9egoFdq6G@slm.duckdns.org>
In-Reply-To: <aAAKwTj9egoFdq6G@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 22:08:35 +0200
X-Gm-Features: ATxdqUHfxqvk06XlORJWLcPTpv4_-oZaBa5jnSSToNiy7Edl583cViXZqDH5kBc
Message-ID: <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 9:53=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Wed, Apr 16, 2025 at 12:17:48PM +0000, Alice Ryhl wrote:
> ...
> > It looks like panthor handles this by only having a single delayed work
> > item on each queue and using cancel_delayed_work_sync before calling
> > destroy_workqueue.
>
> That sounds a bit too restrictive.
>
> > Tejun, what do you suggest? The goal of the Rust API is to make it
> > impossible to accidentally trigger a UAF, so we need to design the API
> > to prevent this mistake.
>
> This is a hole in the C API, which isn't great but also not the end of th=
e
> world in C. I think it'd be best to solve this from C side rather than
> working around it from rust side. e.g.:

Agreed. I think this fits on the C side.

> - Have per-cpu list_head per workqueue (or system-wide).
>
> - When queueing a delayed_work on timer, add the work item to the cpu's
>   per-cpu list. This shouldn't need adding more fields to delayed_work gi=
ven
>   that the work part isn't being used yet. Also need to record the cpu.
>
> - When timer expires, unlink from the per-cpu list and then do the normal
>   queueing. This wil happen on the same cpu in most cases.
>
> - Flush the lists from drain/destroy_workqueue(). If using system-wide
>   per-cpu lists, we'd have to scan the lists and match the target wq.
>
> This should be pretty cheap and we can probably enable this for everyone,
> but if the overhead is noticeable, this can be an optional behavior
> depending on a workqueue flag.

My only concern is that we're executing work items *before* the
deadline they specified. There could be work items that assume this
doesn't happen? But maybe it's okay. Otherwise, what you suggest seems
reasonable enough to me.

Alice
