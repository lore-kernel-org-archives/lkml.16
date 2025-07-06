Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E919005E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751790735; cv=none; b=JvkLHuEd4mm5bSLYvG3pRELx3IXpdxK36V8w7ATOjECdte3Fh+oId9YnQX3Xh13eJN5cpORh/rXFBfalV5ythhWRoH58XnwMj5jCPKBwI9UA0DCRxKoQDHHAPGU0hVZ9uaGmNzce2nsN0SySMVUIEZiUGjPFG+xmz/Vu9sxRBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751790735; c=relaxed/simple;
	bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nTz3XxRgkcJaymV1AhFbjVkKIarFmHr98vuFMsde22NdyC5A9WKGCuMxxAIdoTut7xctQcWyzw0N0f3Ou6vMa7HZt9oUZqh55hW0WJhZUFqwVN0/ydc8uvb995WPWfo/TArZ/EgPyVDk0tAYfN/cHdT6SNyzCYDxbAT6ApqZY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=swpvIHgR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="swpvIHgR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-454aaade1fbso23782955e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751790732; x=1752395532; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
        b=swpvIHgRiP0Z8YZPjJ4tUiHt7S9FtIc3r6BOnkc8TsPmePUqxRx64/IJSqlvBTrVy3
         CbVigymHiF5wNJxJqL/t9oWBBa+q0j0R7kXUw0igP5lt6l53iExiDbMx4dgdCp8Rigca
         VI+sD1kE6bKbzty6jwXXNLKK5DfZtg2jD7i039B7hkwOlKqN3udxoHMeF2qKbKFqb3Oe
         FE9huP9Aur0ocTsl23mNbSO03Zb0yorzUtj2PwvorsUCiXV5Mx0BY0cWQQPCmZlOAGUO
         BmFCNdPjpX0QpgFagqE0SVXSWLAFm5bJ5bjipFPWTWbzIgaagfrHKUkzUsXmZ+/3acdF
         +Z3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751790732; x=1752395532;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCh0rlkNZFhJ5wI2jry030Huq/MRz92c4m2UkAahWbU=;
        b=JehnBABE1LoCRstFLdwQOesLVaRNs4oRt6s8tZtL08jCuyf2I1PmzPbBjpoH/Lq/0O
         J+3f8zais22MUyhLs29TqHPtdHeL7M9YVfM6XTXyF+lNJf/8HH9sjltMhlKkAlZK7xZQ
         CdFZuKK2vq/+mnBvEEcGcICeV+Mx5qGde3fCoqqMUqsYlF4uqiqZEgMK2zY8mioe1wzu
         ZZH5SZ66qVU0VZZaQV1Znf8kKVtz1moodE2zWNuHfPRkjPH9A3yuv2mhFQix96kmTDqk
         Q0WaYqkm76AnwpCV5ioWiRv2DfYAWP0qSbuTwnUz8e6jNRRexwhNVYyu81A5epuTYpI8
         2wXw==
X-Forwarded-Encrypted: i=1; AJvYcCWUPnfI85Q1oXcJllwBLyqBSR3e95NW/1qMbCUbcwUAVHLbxpQLQH4i95evCGyWGXlR8g/uOk8r4b+S+A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YypzlrtrD3iELUyFS0Z2h+LRvVJoxRSeMBnz1X97m0NL1sZjExy
	HZOvFPXj2PTRofXj6zJJPkI40OD4HckG1cHRgC6vEcUpa3Sqn2AgCbycsNcdEBC1YISIZKWnqZt
	ec4JvFK8Rr5sjYIV1Y3KF6qxZDMY7z6Tw4wJjVx/q
X-Gm-Gg: ASbGncsQzVZy3pR9MEVSeRpQIQ5OPu80AApnkMkTC4pGT26zkn3h3P2zok7NjJqDt6s
	WOtHlfOUz5BK2qduFuIdmWO2Z3lWGv9jD0DVV8GvE7y85L11DG2rUgBi6TUfPppFhUG/RrdPvGo
	dLcohc5GlX5kVjvdlPKmnr++gvpjSkbu4yYexfSF2Yt3I5
X-Google-Smtp-Source: AGHT+IEGQ1yvGh1y3CB0u/RmI8WwsZH40VLDWwCw3/I8DzRJFsL4891+0YGeKbVlHlDbDSg+hBTaNvwCq+RYP2UKi8U=
X-Received: by 2002:a05:6000:2f85:b0:3a4:e5fa:73f0 with SMTP id
 ffacd0b85a97d-3b4970195f6mr6202610f8f.20.1751790731838; Sun, 06 Jul 2025
 01:32:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701-xarray-insert-reserve-v1-0-25df2b0d706a@gmail.com>
 <20250701-xarray-insert-reserve-v1-3-25df2b0d706a@gmail.com> <CANiq72nf-h86GszE3=mLpWHi5Db+Tj0TRyUe9ANfjdNbesBEEg@mail.gmail.com>
In-Reply-To: <CANiq72nf-h86GszE3=mLpWHi5Db+Tj0TRyUe9ANfjdNbesBEEg@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 6 Jul 2025 10:31:59 +0200
X-Gm-Features: Ac12FXwwPurn4FW_8RxwpWJr25A9vazCDxaz3GDmuhMxLJA4Vob4fuczPZdPUVM
Message-ID: <CAH5fLgjmUXUcXFFYdrM4f2iZeD-JbEuSV1DuFbGERNQNM+V51w@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: xarray: add `insert` and `reserve`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 6:56=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jul 1, 2025 at 6:27=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Add `Guard::{insert,reserve}` and `Guard::{insert,reserve}_limit`, whic=
h
> > are akin to `__xa_{alloc,insert}` in C.
>
> Who will be using this? i.e. we need to justify adding code, typically
> by mentioning the users.

Rust Binder does have a user for `reserve`. As for xa_alloc, Rust
Binder may end up using it, but the current plan is to use Burak's
bitmap work instead.

Alice
