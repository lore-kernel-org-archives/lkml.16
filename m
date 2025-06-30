Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E928A28DB5E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751304879; cv=none; b=a7FFaFOBH48AuQeYcK86Af/FsqXfN9Z0nrjEzuVXzDOASE+eVBy3wHhcTsyF9Tj+QwSx8JfzUsys07AhfjV2tVK4++trdVMp4JLFLLlYxa4XyEH6T9+EQKF8RoGlx8UHjGAhwnibXMB86dh545q5FxIVUG1ajuN9z+pKxYCrdHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751304879; c=relaxed/simple;
	bh=txN0VoHoERiQwtI1Nj+OyWBtIGfofmvwvy5Z+6fKswE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=luICff2iaPWn0r5wCy/wJ0HLgWEbPZUSdyFCCDGnKofj4XHxSR7PSaX9DVqA1vByWiA13HgqrLU1Rseymd/N1lqbQ2ILT96RbUskypwGb9yDc/HdfReYX97WNx51qv2H8iYiSQnigx2eF4BVgVgkqDuiSTwMc37w2b6DyY4coNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bOSl+d4z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bOSl+d4z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso775a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751304876; x=1751909676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7pKzmp6risezVpFGNptctw5AXsTBYcK3o9vyNICCack=;
        b=bOSl+d4zbXcqJgA4lR9P7TWThBJn7BMVEa7dKUPM6FJhZXUysq5NQX0JyqhBUbokIs
         Qeu9wOhBnLFjqG2OkndJ39ak1M4qdjpR6MnuUzf4x1vBPk9/aP17gCq8/yDU4tquNFJs
         f950Z3LDv3Gc3T7Os888/p/DZIK9h1l12BhIhn225f+ooJkTIyqNRl513/guptGGNIco
         9iaeHWRSazA/5a7dJz4q57N97cCXi05+84UBr62dZkYCWZoZGuXER/iYYxMiBs5Ym7sT
         GV0stDuT1YUvi6mphp97/xT8Qq8GSuGwPI8c4yYXhMwq2ZRG+g1nUavWoMXi4gSZfqQT
         iHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751304876; x=1751909676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7pKzmp6risezVpFGNptctw5AXsTBYcK3o9vyNICCack=;
        b=OwTZE3Mix60+oenHNFGUk9RW7w2yOz6Jzht3AzmlKGiDaT9XVXBBBSMzdA0SvLGSto
         sjoNmRclp7g7jLvw8m1OwUZeIxhHmHWavj93V02i8V6vwWRFhu8wAuqQdTE3UXOWUBs9
         M+313d2sjuq9wpPr/bjMoQGOc09oIGyI8u2c83FptEkGp/DpPHPYt7M9njfeIdE7HuxI
         DSCGl6l9NwS+b3JS/Nim5mwaD1H3cFqaidh+glVf6bfQbMRS4djjPWz11hHtZzgL14bY
         sNLOnlBsGp2ddquqG8z3BdobEbLq/smVxku1+YCCQrNl8/g+K5NtnVqltMh28Rdk+j/C
         NkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSByeB0f+O+TuSI+CHQKefjMuNurwPK+UUD9h5mZizH+iWfZcqoGC10f2x5q5ICtTGJaPHHTcWpateeOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXVZ+vRiszDyz8CPySt55akBt6xfLga0qm76Se6nmrfyuxphdN
	dpDWzKahqHvRUgyHA9tcUBpThaONfurGwiaKsCCrvmkeuL7ojfirhac4DJvCBwwfmSHqiiSRNYn
	5RzraP1BLZbIJaxD5t4lFar+GAGR/BhuWaom1jFIL
X-Gm-Gg: ASbGncvGVgAkRXBKbFkDKmx7QWSiH+xpGlsjfRm/kf6hB2VtkuTcdJ0MzKJQ0d5fO1x
	UmvrKu3vuhjPkGhySSrf/uBipxQ/8SChpQCtTC+PtSiVizVg05U7eH2O/a+NcGrgEhMHquJpVq0
	zcuehKrk+knKGIux8WRRgcKQgmbW1pmQonsGhtGBt4WwCGurVHcJ+ZTt/fl45dBn6AJmwhIl4oD
	Q==
X-Google-Smtp-Source: AGHT+IFHj7916AmIiUe+DcYm9SP9mhlcNXyz2SvSx7ljxWn+C94mxIYjImsnFG/ILQQ5y8gfoDa3L4qM4h6FChZn+Fg=
X-Received: by 2002:a05:6402:2755:b0:60b:fd63:f7fc with SMTP id
 4fb4d7f45d1cf-60ca3db2409mr204595a12.4.1751304875964; Mon, 30 Jun 2025
 10:34:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
 <20250627-debugfs-rust-v8-4-c6526e413d40@google.com> <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
In-Reply-To: <5c3a2289-01c5-413e-9d7c-88a41c3f54e2@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Mon, 30 Jun 2025 10:34:19 -0700
X-Gm-Features: Ac12FXwQ3MQ56JYk1RmWEOzrCavTwHgT3pjucKgkfqXxUmfV5wjiWoi-zV43X9Q
Message-ID: <CAGSQo038u_so+_pMRYj0K546zNfO5-eqoXFivXsEF6ACK=Y5cw@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 10:30=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 6/28/25 1:18 AM, Matthew Maurer wrote:
> > +    fn create_file<D: ForeignOwnable>(&self, _name: &CStr, data: D) ->=
 File
> > +    where
> > +        for<'a> D::Borrowed<'a>: Display,
> > +    {
> > +        File {
> > +            _foreign: ForeignHolder::new(data),
> > +        }
> >       }
>
> What's the motivation for the ForeignHolder abstraction? Why not just mak=
e it
> File<D> and store data directly?

1. A `File<D>` can't be held in collection data structures as easily
unless all your files contain the *same* backing type.
2. None of the APIs or potential APIs for `File` care about which type
it's wrapping, nor are they supposed to. If nothing you can do with a
`File` is different depending on the backing type, making it
polymorphic is just needlessly confusing.
