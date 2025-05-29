Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DC5219E93;
	Thu, 29 May 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748529630; cv=none; b=JJyc6U9tdVT51BC+6W10q4H/ur+C9oktVAGCKHCy4HC8+oWHfsbIxsIY7TbSsKzwXq3O266VvAGu6wizVeqsld5Vm07XssI3EgN3KpVsx4vBur6zKk73AIAvhtEcRRDZE9GuiyTWIGdVM5alwWMOXZ5vx4sNqzwIOLS/V74kz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748529630; c=relaxed/simple;
	bh=+D/ua2DayKacabvOy+QeVljqypmxdT49CtH2UyTiVnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g82gd9d0icBEeROREEEN+FlPvwQE51GCL/3/siYa/dANsbDk5rg62EEAj89i5nURMGj/+AyGuggEJt9mlHOdQGlWf4qsWUKI6/4L5pe7s3yxdkTIyFvOM5OId9P+RspogS5Xf8EiF3dmvQftxI6nWOGIayPRld8EX7OivGDN78c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EdsUfVx8; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EdsUfVx8"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32a648b1300so5218391fa.3;
        Thu, 29 May 2025 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748529627; x=1749134427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D/ua2DayKacabvOy+QeVljqypmxdT49CtH2UyTiVnk=;
        b=EdsUfVx8QrZFiL3sIN9LK6ZBgQKIyK6IZdSQFgorw+9ylO2FLQmGPAsDBtoph3TbPS
         KoI/TElS+ntdtuREU2pjcXIQHKinA96qO9ebGVU/vbAY6MYeVqEffsb1iGZjTm0lhon+
         vQPhsyRsBIzVpWFuaRYLD0m8zerF1E630A0E5cNjigsDhrLSo781qV2QPul/nAWI2Tni
         Ir3x7WxYSZhSR6PdRjChrRVLvfA2mOP4TTX1VdnJKXskMZucxht/72mFstDnXf9Aap7c
         48EaSKoLgMWMAon7CccsU+slR8gfQZgEG5aaPOM9Crm5+jjt1jaYtb7bLg5XIEMUsFal
         FJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748529627; x=1749134427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D/ua2DayKacabvOy+QeVljqypmxdT49CtH2UyTiVnk=;
        b=jDIL9qB4JlzOAjZOLTqTvoxXEWzN6R0RpNqSHFgkZkykKiMVRF3frKJ3L7MS+9wmU6
         zE+6s6qm4JiB3j4L4pU61RDLVGd2joJ68BCHJQnTceAj3tGnVuA1NgQNkVaAl+JGb6od
         i9D4SWiFh74W8bIzdYlEmPcyPXe5VBhZK3gbnPwpAIkgB4CcJMe/BjvLW75pBiA2ZL5J
         kBzVa3My+DwzjH5hgB/HFi/S6NoxoPh6EZAMuQlS4zhGDhKIs6hxkEtNF7c8CJ4xH0ql
         HTEbnZ9wtj9HrKBnajIoqDtjBOhePW0ZxKCN3zwdKVn32REhFHBWxke6GL4WVip2eFxY
         6yaA==
X-Forwarded-Encrypted: i=1; AJvYcCUS06raeIHhVVpfiwaPb1mxCs51kMw+HVPzF/KZ/u0JBKLTqJenGdCxxwvLc4GUgNVREI//jN6FOjrqGqs=@vger.kernel.org, AJvYcCVDzLgSNLOahzCfnHAlfMKgYpCbfoUH13rb4kACvHAAXf2Dt/MZPOyjB0dNlSnHHoPqgr6QSVqJnBLnmGxV1Ds=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlX4++ioUIwvuf42tkIMJ1W8yPbabFxdXaLbOtJKCMIrRApv+H
	uRlRu94osjoh+Z8aAAeTgiQWQ/Qpq8cdk3HVtDvAaudsueFCX2mGpymLlT6GcQHd35YG2Xnedpv
	e2p0vyed06HWJHSZePM8p9sIqmNagdQA=
X-Gm-Gg: ASbGncvBTVPI/23x3GoDjq9mq/z7jhxo73Z9lxhiaNin8/rUBMuW/QSkpLnXie6jtcq
	ilXXMYxhBuUmu2zSXg8gklN7CYt7Y7t6zQKBJhHNuULNgn6Cuu30GHz0tz+KxPP2qPImHxEwUFC
	nHMi+Ft381UMdRwKImEkFx9yE+RhQfXGcV28ybGidfZsKiDusKd141dfoLB+FgM4c7/b0UZ6pqU
	/ee
X-Google-Smtp-Source: AGHT+IFIOsZlPLfXgxVBZMlZkFL+ShhOCVyRcVsmCdRASQwye7R6HGJ7F25pQsrgAc7az+7LsPsd35Q7hlRxdRlLmpc=
X-Received: by 2002:a05:651c:b0d:b0:30c:50fd:9afe with SMTP id
 38308e7fff4ca-32a8cd69223mr8661fa.9.1748529626577; Thu, 29 May 2025 07:40:26
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-b4-container-of-type-check-v4-1-bf3a7ad73cec@gmail.com> <CANiq72=B4JMK4eqK0tL5ECWFAKcBGm0O9LsZ74dd38N2GrZOMg@mail.gmail.com>
In-Reply-To: <CANiq72=B4JMK4eqK0tL5ECWFAKcBGm0O9LsZ74dd38N2GrZOMg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 29 May 2025 10:39:49 -0400
X-Gm-Features: AX0GCFs8RwRoBePQBurTxBlqD-hIi994O8rqwQfy4IZ_mcLMn1HjxIjuEcyh0Ew
Message-ID: <CAJ-ks9nTrOuDK1W-qFpsMow5Wf7XG9hGBbf6h_kS2Xo16wyHjA@mail.gmail.com>
Subject: Re: [PATCH v4] rust: check type of `$ptr` in `container_of!`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 9:30=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, May 29, 2025 at 3:11=E2=80=AFPM Tamir Duberstein <tamird@gmail.co=
m> wrote:
> >
> > Rename those placeholders for clarity.
>
> We can also put this in a separate one if it is OK with you.

All fine. The only problem with the version you pushed is that it
evaluates $ptr twice, which was flagged by Alice in the v1 review.
