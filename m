Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BF226863
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744834387; cv=none; b=preNwdWPBlL9TSafCUnCvRaFiOY+Xp8LeF+qq0cqeolU8hSVTSYCJB9nYa2iC9cjmdBbRK3hvRcipPtqwCkF+GOO+NULSuCQDUUNIRjeDIUkbJmkCDztH9zjCObM4TYEdU9sQFFXJTRUQPjfRIqfrCCYm/r8S3cSVWiGHmiEw2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744834387; c=relaxed/simple;
	bh=PPhtOZVPixUAZnjIPSp7hIVSgZRIkChMYNhA/LQpnGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIHaOwAlzSO3LkDLN0jghjxzuFSHdvkMKYK+ZzPTOljH3ss1ckgDXbgD+AAJCDrviNSATNZgdArjahyJqSw7yik1voMkBL1tdk+4UqvwFseT9dLLQGGPkzXJj2bT+hu9359sYXYJvObfi1T78MVeBcgY7K98rrfq0Lk3MchdEV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GHIB8XSm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GHIB8XSm"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso832042f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744834384; x=1745439184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PPhtOZVPixUAZnjIPSp7hIVSgZRIkChMYNhA/LQpnGg=;
        b=GHIB8XSmrhg8LftTYt0mH6iy1oJ5S5jEp/k0H4Thsd+S6B0cibBoLBU82FdmEWUwpE
         mmpwMV6wro6LVEiNwES22qfQhklisKCVcrZpPKBBzCkFBSz1Y3T6rHnP5UEB764C5Tne
         FYYS7jLbsTOry7+FkzPw9+5ab2CC7QBq1k6x7EdraUO2rEHCUJ8lo6WbaABsHglwbHG/
         xZnI8EHs9P43YhVdoi6YAIHOKRKQwJ6RsLKwoag5oE6V/nm5erMhPAQQo/aNTYNhRJEG
         EyaAItuwLP8AA99Wcoknkv6onTS73Fq2eUaatVvr/Jw/cBDe0cTM9dXIVOm9ld8PVB6N
         eIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744834384; x=1745439184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPhtOZVPixUAZnjIPSp7hIVSgZRIkChMYNhA/LQpnGg=;
        b=GPaKYH6lyLGQu9kQ/55NTVZtiMSS7mW8ZE1w0eGUPjSBmgTGFkREe6QbZpYUHtMUHZ
         YeC2oOUdrMFMtpvsncBIoMVxSOlOdHUQr5WRmLb8QwdIsuurl4wlsuX9Ulh4RM4V5iRT
         AFMeNldPyZyFQFpaiCEZdLquiTl58n6gNdob6JOYwsXu7p1DhMCMF8/wn6AIMzGhehxF
         d5cwVsaoqWIfEB7rpVkdvLm6Ky86AbpDhwqKsh4XMnU/lCH8ZjkIOMIQ+Fx0JMiP7VXM
         YNokAPx7vHcwOsZAJXkk6UTGF9ylxJTop9Je12EFKQXzTMbifjYEU3q5QEOHyruxP+em
         catQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLcJjX+BVqc2OHjWqmL1As1dsE2+bKGFLWCzwhwzSHq7SkPb2MI2FDVABVhzeIUyIj82bOC1iFj2oTsmU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb2aYmcSuFb0trJ0naf5kAX8ceWE6wLIY5cpvmtffaMMt+swOR
	6GOZ1l565Ow0zKMTOep+f7+/w7pEA8g5KcHgXomQhl3RtJeA1YbcgrWazuGdhluLJt2qQg5Zw24
	rXJv2+kV4Y6bRar6KNCw9bmoMRN42oX5YZ0pM
X-Gm-Gg: ASbGncvuOFQCtvzptADRQZopAhVmIH8XvJifSgtrOwAkvxrTB/ZEKxEusG3Dkb2js9Q
	V7giESJ8ZFK4ubZUiJ1AuFcpSvuy+z6hkKGu8X0MfovhjQmVcpk8tDM6H3eVUtu+acVIMq6WMul
	OELy4TH4HbZMbCoNBhntBGqds=
X-Google-Smtp-Source: AGHT+IH7no6rE6O9cSo6vdn0OV9rypiX0Nlwnex3sqsS7cuzkCrnuTMPeoo8iVox0rpVnkvpwvETQLIBeb1AxcRvDow=
X-Received: by 2002:a5d:5f52:0:b0:39c:30f7:a599 with SMTP id
 ffacd0b85a97d-39eea304084mr154299f8f.18.1744834383632; Wed, 16 Apr 2025
 13:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
 <aAAKwTj9egoFdq6G@slm.duckdns.org> <CAH5fLgjvk6841Tn+C64AT6nx3HeZ7EMzruoJPmvT2KNF2Trmng@mail.gmail.com>
 <aAAOwfmi-RcCtA6W@slm.duckdns.org>
In-Reply-To: <aAAOwfmi-RcCtA6W@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 16 Apr 2025 22:12:51 +0200
X-Gm-Features: ATxdqUFhJxgwyswqLmQfzfVWGznul4xzPjyvRQS5YfEuqmkKSOH4SDcY74K0e1M
Message-ID: <CAH5fLggOeTo4Ptq+zHN-Fb4ymgzNgtBPUDeB5ATqTMakdrNUHg@mail.gmail.com>
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

On Wed, Apr 16, 2025 at 10:10=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Wed, Apr 16, 2025 at 10:08:35PM +0200, Alice Ryhl wrote:
> ...
> > > This should be pretty cheap and we can probably enable this for every=
one,
> > > but if the overhead is noticeable, this can be an optional behavior
> > > depending on a workqueue flag.
> >
> > My only concern is that we're executing work items *before* the
> > deadline they specified. There could be work items that assume this
> > doesn't happen? But maybe it's okay. Otherwise, what you suggest seems
> > reasonable enough to me.
>
> That's already what flush_delayed_work() does, so I don't think it'd be t=
oo
> surprising. Alternatively, we can go for canceling on draining/destructio=
n
> but that'd be more surprising I think. As long as the behavior is documen=
ted
> clearly, I don't see problems with running and flushing them.

Sounds good. I'll go ahead and submit a patch for this.

Alice
