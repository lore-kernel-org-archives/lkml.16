Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1681B6D0A;
	Fri,  7 Feb 2025 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738954935; cv=none; b=Y8j66ctfEJkZMS6jQZu4Qa2d+UNpcPKjGDVp+NRkDCdpTrd+8ROGv2bsQpenjKmjT6PhEQQ5Uiw/NSuQO2OK04KE2p5fswGZXU8qhzWqsTLDt0dqGQXKEX7CTB9BS9t8zn+RT4hAnh7VYaO6ub1CU3Hft+lq2bB5UcIh6OOz+7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738954935; c=relaxed/simple;
	bh=qVfd97zkfkmzTB/cXAgE/+dJgZ6p/2lJrXR8cCuyXvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cGIUXzUEtNXgpfREDu71mUzjVK1PxQrQLjUGkncn7nnzg1bHXUgkC8bkVYE/by97TeMYHxNYTu7LFbWFI7nFw+8RXtZnxt5bK4U9RJ7Zeosfd4Xu/cu0PbDVvhOrXUXfYesZ3JELFmYU/Htey9h5EOcQ6R6MuAZcLxxMwGZXsDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AM/9VO/+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM/9VO/+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3082334d1a0so9327961fa.0;
        Fri, 07 Feb 2025 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738954931; x=1739559731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BPQBeY4NWsR7lR6BMW6QXyGfWgkM3VWv16uX3q7hwM=;
        b=AM/9VO/+FX0p/2CyrPhncgQeu+FE9B1SXuELCCMJTATa11NkxzZ7G/WUoL4tjgK8kb
         yYBwzht8orE71Ab7RKHak2N6x0GMFhBnkZAHRKmDlb2oUc0usQiI1tfMInfbFY+TfvDg
         pNH+XB8f78bywIVe70Dpo5iAY9SmQHEhhxfzQMgh4/ePieaSHSMtQ/dMPutRcdz23wnL
         MQC36VIc0sDylovhgLF7L4aMnTPFycwogj5e3fm15eIe2yKZqvDIGcNvv/2ymwaOr8z0
         GmLgNGYVVkDakNlqVpW2PNVbKpW0iDUK8/13UO+Ff2s2JyFbVWQQ9hOpE/J14nSQJzYr
         tPeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738954931; x=1739559731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+BPQBeY4NWsR7lR6BMW6QXyGfWgkM3VWv16uX3q7hwM=;
        b=deZ9WY3zw/x2vXQLrH6eMQYw+yWxVQ5TniZH7w4pJjG8IHvYrkMhj90EzYVQXaqOH0
         RdAQtZUYb0T2EOWPp2TmtIL8Dy6KZSidqxA9rknpTx39czhIF0zFQpyKQR2CRGbQGs0P
         UlzVUuDyChY3DUwrFl2sssBxDpmfNU8MCDehVKjncLygXfgjg8dDupwkN3dB4EsR7tFk
         jElzt321Oyb9wzgS/kFVsedw+FZtLQLWS6kyQBV4OhnbZ+MV81Rbqge5OUGBSAROEKc5
         otnvVEkUrEjFcc05AHmFcFIP27gjFGOBvjW6/gwKTl9NWh0zQArxUtHHtwJEYDrh/CDq
         5faw==
X-Forwarded-Encrypted: i=1; AJvYcCU1uCNrGuXHQ23MN9iVGyJDWlQP/1b17qgMZ3AYj+4IiJtv4G09eJHKJMPkJFIksR/dFP9H+YSiOuVMmwXTwBs=@vger.kernel.org, AJvYcCVZB4rscvJpxZAUVNAaBCmSwWQKUFYup6oZKv6l6GnLnvU8be9lP66nnt0Vz8X6nNFBJFsb4UF3crRQxxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJSvK5enHNPjsSQ0OPMcGJtbP9xxPifOuroKMj4FGoK2QxsOoE
	tVxjRnx66g4tU3NEHHlRJ7p2mvZF1LHNMQnjBkLD10Y9Y4oKgEGWfYiUXDb/JczQH3kFMBylcMO
	MkHuC08rzDGTJllY+JiAXDORG1FY=
X-Gm-Gg: ASbGncumhKurOSd6KP2ku6k1r8d84sVh+zNotjadVM0LXNXWG4dJjX+fmJ6sb9gyDlN
	oooFXz/wbSWy+V/YSZCgfryjg83gsYoRoVq3vgeghICusPCJmdwChCHBkLOUy8iwYoMakEeT36T
	8cK/wDYgpTTCWsrwDLwp9/cZyYzDr/
X-Google-Smtp-Source: AGHT+IHk+w78UdWaea7KZ1l60ekIWFxxUMzCAoxyaPzUwRFj1//8MfCTtQb/i8wOhQcAKw6q+pUmP9DyqLv8lMLfNrI=
X-Received: by 2002:a2e:ab05:0:b0:302:3021:9b23 with SMTP id
 38308e7fff4ca-307e5d93c09mr15027451fa.17.1738954931047; Fri, 07 Feb 2025
 11:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
 <20250207-macros-section-v1-1-8f018cb05a20@gmail.com> <CANiq72=Hgqt4jPGw_pXmReWaVXWUZm8YofdqUeSde94apozhAw@mail.gmail.com>
In-Reply-To: <CANiq72=Hgqt4jPGw_pXmReWaVXWUZm8YofdqUeSde94apozhAw@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 7 Feb 2025 14:01:35 -0500
X-Gm-Features: AWEUYZnFx91OhvKyZCw15ac2DV9Mx7qi3yvX_x3qrc_FEPZp-9u2uIyGPHxCIZQ
Message-ID: <CAJ-ks9=g9-bKoyh0++4f7CVQYth3Rb20FAd1-cgwXy8dYj27Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: macros: improve panic messages
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 1:12=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Feb 7, 2025 at 6:22=E2=80=AFPM Tamir Duberstein <tamird@gmail.com=
> wrote:
> >
> > Include unexpected input on parsing failures.  This has the side effect
> > of avoiding a spurious rust-analyzer warning:
> >
> >   Variable `None` should have snake_case name, e.g. `none`
>
> Hmm... That should be solved independently, but sure.
>
> In any case, how is this related to the second patch in the series?
> i.e. do you need both to solve the macOS issue?

No, it's not required - you're right to point that out. I'll send it
separately. Is it very inconvenient to consider the other patch on its
own?

> > +        let Some(token) =3D it.next() else {
> > +            break;
> > +        };
> > +        match token {
> > +            TokenTree::Punct(punct) =3D> assert_eq!(punct.as_char(), '=
,'),
> > +            token =3D> panic!("Expected ',' or end of array, got {}", =
token),
>
> Do we want to shadow here?

I personally like this style because the shadow and shadowed are the
same variable and the presence of a binding in the match expression
hints to the reader that it's used somewhere in the body of the match
arm. Do you have another preference?

> Also, I think you could write `{token}`. Same above.

Good call. Will make it so.

> Could you please show how the new output would look like in the commit me=
ssage?

Yes, I will include before and after output.

> Cheers,
> Miguel
