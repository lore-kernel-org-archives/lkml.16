Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0EC20F077
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747675816; cv=none; b=NkncPzgRNlYptxEFRGtluH6V4RhjdMFb4XxYD301J/YYz+X9igx5pyKgd6at/B8xuhRi0abRBOSYDeBq4xp0vY5pTOk2lDaK1D6CC14g/r9ZseE76j1NQ5ZttxxFPTr4E5BJaC6XRtX19tAIl7v6N0kOib3PIMqB94gvsE4HDcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747675816; c=relaxed/simple;
	bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxa57IdS1NSrYWkjoy92FCh3JJ0LdJ7XwKHCVF53Q6sX27uABE1lbsu+381HAVwc/MELyhUe8X1uz1MBlV6rRRbXcq0zbdvLkCO6mcM3l2GDEMsRd7iSyR7BnompR6xerswhSTqYW3STSqwimSLf+IG02EHghDp7mACekKWk+3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h8zomfpD; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h8zomfpD"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a371097fe1so930912f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747675813; x=1748280613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
        b=h8zomfpD2mC6n01HVxombTvRmWi8L+n/SRu5WhAPx/fOJi7xeYy+iKd9i31rnIn/Sp
         y/cdRMwdNSXq9fxIw1//1EIAXCbDAYl4JIL3pD2hT5u2x3q4J1YRctgK9gRJdlIQGQBa
         exFrbW0HUUOOhLJQSk7WaU5O/Ea4LKYTNJHioIZzx+BDaq5uY1w8lgwjdGeJ9x+I2Q2I
         wfypSkSWSduG8qSm4OQpGYBcOg+botAVNRvLKBKocnhtmjI/D/l117/NEmgiNEeH3WMt
         s2UX/4enYYDxpZtp+mZhcQOkA1jj/3/crKIkEJxjMs1zgaMWzJ4skzqCv95qdc24DHGF
         xGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747675813; x=1748280613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DlVjaAuGzCckGp8cGIwmSCnyzwOM6gZWGWJBeW5dPt4=;
        b=L/aZVaq2viHLwDjhVmC+69FtNjjdO1zI0wGrQel47dG2Vh7XSdmzgVoV1YjrglOofv
         nIg3dhiGq45arYf/tXJBBjmdaEGPKSiiaYHOZIebC1KfFY1rKQF/OoHhGMB2ZOghh8lc
         h+7umExD450jq4peZqrZFRnbHO9iezqKFPclbSLbFteoCjVm7/xEd6epIUCtVixrWmbp
         i2OSJCeOfHVfUED17fjJHWXsdkv+RSj9v9CPbN/vJIgGHG4nNTbxRE+82qqPUxZmA17R
         I3u9FYiOYDdaHvUQnpkqKMOoAkj5r+pWeShuQJRhIQXpQNyo3tQ3ai6SDZkQdKAZPiaK
         yvyw==
X-Forwarded-Encrypted: i=1; AJvYcCVmLR2NGKAQGqDeSGfbobQoJLCS+MvDosf3shgOVKkecbQPtrCq1ustwyL1PUqwZeK+Z7H0r3Oo3pOAZ2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+9dk849hfD3bIV18L16hhGMPP/E+PVeBbkN9EP6ZbwcM+brI
	Zg+EH1UV5s6Aq22+vhxsOkAK0LROym3jcr4EBMWZsEdF8+K/jzhy6whP1oKL7OgyWMwoBoDWLVt
	baf+HSSxpelfp32n0DEyC2LNEyzS6amM4rR5wNXpw
X-Gm-Gg: ASbGncvMga81s2PbMVurBIcxzBN6O7zLbxOosBz5opzct3iRh5DUJF5vyKPRuNvQ/k9
	+vAqLNqolmDXuaxzqJY0NQYWW75JGXN35gQ0fy/Goi5FhcGiH0kJbIuAubPhXSsoImSNUPAIcuE
	6Se6k9SAlmLVcWJbQhBSLJcGTuWVrn3QEo8akD5cwen6NifdySbvXJfvFzI2WeKjM=
X-Google-Smtp-Source: AGHT+IFQD2LI5rd26B6n8pHjdC0LhDPOeG6Ss3mD/taDqgLRFMr+XfxaMA5Wk4K/AbxHJ0rJ0CBHMuFKf1LPF0bqKPg=
X-Received: by 2002:a05:6000:178c:b0:39c:30cd:352c with SMTP id
 ffacd0b85a97d-3a35fe5c5c4mr10951227f8f.8.1747675813149; Mon, 19 May 2025
 10:30:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519124304.79237-1-lossin@kernel.org>
In-Reply-To: <20250519124304.79237-1-lossin@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 19 May 2025 10:30:01 -0700
X-Gm-Features: AX0GCFv3th3HNsBNGLkEKsgSDx5oHFNYc5dr6sRRu5xtx1L8o4sSk4_tUpgUv90
Message-ID: <CAH5fLgj1k6juFMoBWeeWgdkF0UDewF1=VThj-dnusXwjKGFnSg@mail.gmail.com>
Subject: Re: [PATCH] rust: types: remove `Either<L, R>`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Kartik Prajapati <kartikprajapati987@gmail.com>, 
	Aliet Exposito Garcia <aliet.exposito@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:43=E2=80=AFAM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> This enum is not used. Additionally, using it would result in poor
> ergonomics, because in order to do any operation on a value it has to be
> matched first. Our version of `Either` also doesn't provide any helper
> methods making it even more difficult to use.
>
> The alternative of creating a custom enum for the concrete use-case also
> is much better for ergonomics. As one can provide functions on the type
> directly and users don't need to match the value manually.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

I don't mind making a custom enum, but I do use this in Rust Binder.

Alice
