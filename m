Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC24212D72
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738673208; cv=none; b=hA5SWF2qMLkm3H9lN4TUJwNZ2zL7Ol3YYzTnvMqVQdYw6NciuqB8PXdqmhb0GRJWPwh0kISuavNX+FEwrHuReu6ftp6Td6lgsJdfZWOdMgskm10YZfIZ2Kr8MyJPZEZODJJd6uJQUYcIl9OTzp2gBJPfomIuTBw0CFirxJ2Ea3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738673208; c=relaxed/simple;
	bh=01XwQv7f8Ozj8eCNDsAHnXleMt5Xavp29Bpdgi9flQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=r7F89En7ImMYp0sy3CGbcaKt8Qf39eYpbatBox3dIWEuIf0WtpsK60LIp/T4r/O4+Wy08Zv5B7b21HAdiidGMPEnoiOvMsi2IT/7yW5dJllmBwr2qJDQ8RdE4HGHOxCOO5F3Xa4Rqd3XyyVhb24LtnzxAZq/gK3BgEcum2692D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PpTKABlD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PpTKABlD"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362f61757fso56568375e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738673205; x=1739278005; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZIhs10/E/7OHie6ls1kLvr+5pWu5vHwZfAGymSupLE=;
        b=PpTKABlDMuKjYJLfGGw34pffiY9qKhWNXNNhOH3UiUKIT1h4U4zirf/va78aLRrk93
         0NFETPQjxD67CJ5HnCXHLJktSxtGTULW9KetUPzW0wyTjdP3ebIA6UrKNEGXrwsM4pbg
         xXatkYNL4KatI6mvyeHFogNLdAPXdq5iVZY2pwfQH24SpfLVdqCpBcD42QBRWZim4vZn
         cOKnzy3hxWat8XrDJe/9tDRyzfUkebER/bmmLfT4sUpjrLbM1P/Y5vUgIxo/03QgKRX4
         rmpAhFViaxehSkPJrG2pIChb6BFFK9zMYxgAWY9VHpN/WyMJ2TkyWdpUIW+k2zWqywyE
         kK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673205; x=1739278005;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZIhs10/E/7OHie6ls1kLvr+5pWu5vHwZfAGymSupLE=;
        b=apguhedplAKKKjz8z5FEdJgXQ8f1qsenLL4/JZrZ1pJAOKZMqLcfU7yhRYa0tuEYqs
         N9S9C4O5ntga4MzGZn9vlrt22nYRZvlNzTHd3+WQKHZDr958CB1qUa+TzwwBteGU7pwU
         bMOR4BbWJ3sbMPOf5c4eqoy+0euOp0PDz+KGU0HTxrDSADywR1e2kWp9vQYrKLhgo5Es
         uqwB8VzMA2v/59z6sPtSOqStVLoomzlmYz2fkeIuHEFfBBRhoae3juIidoNABRgLfQBY
         t+5MG4utXZWokk9veyaWYF9KpNKzNEKlgn37o1opsNQ98FPXwVQ7GU9lbBUZkykx5MtM
         sYoA==
X-Forwarded-Encrypted: i=1; AJvYcCW6z1UVpmWIk0mz5IuMBoPo6ASzR6UYEWQ3Tok9nKkXihaHzJEEHE7duaqxUJH1tvCnr0Be3kuVvKow9Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd5E7LsBeNEJP5nHirUaX/L5l0VnMK9bPjOtED84hHw6JvLWrZ
	fy4s35O1V8R/Wjw/sPQQLu/LFI6nJ3DwJpXDJ5e4b1RT/zG8h8nXVeShJTzsEu2AVY+2nGW9Enl
	jajh5zbq9SHPob7Bf0TvcQYgHquAENZAwSlAh
X-Gm-Gg: ASbGncuavsrS6AaOdWyyp18v0+WwinueDFycgwz7ZYfr1GSCl4DVByU5niiQhex4ElB
	A3tHWc6s0hucymIrJVmXImOJB++K8MkD4c8YAvuZLA8AjBXene6RWhIbDJ+6jV30DAUI/nBmcEx
	CIhj42NGttt/wmIhIcNnF8oh/RUQ==
X-Google-Smtp-Source: AGHT+IEeMvDTzY/03dvwAU4Yl2RIOwMLjBmew1d3LH3owD/yOENufGbubw5j2/f4efwWgAcJ/EqJ0vGrCTbJSOjwLbY=
X-Received: by 2002:a05:600c:5252:b0:431:44f6:566f with SMTP id
 5b1f17b1804b1-438dc3ca9cfmr216084175e9.13.1738673205184; Tue, 04 Feb 2025
 04:46:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203-vma-v13-0-2b998268a396@google.com> <20250203-vma-v13-2-2b998268a396@google.com>
 <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
In-Reply-To: <r5xkc2i3tk4za3xkrrvbeqto4kf5l425ursytc3n6tmcy2gylb@eusudybb5dqa>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 4 Feb 2025 13:46:33 +0100
X-Gm-Features: AWEUYZk27IDYj4WV-KphnBAyzxUYJ_cTBIi6I5kvdkOoZNqc2m-BHRJ-993o8q0
Message-ID: <CAH5fLggtO3rRvTouoRmZzqJFMEjxaZGy+bcK23OPUr3TN6d8xA@mail.gmail.com>
Subject: Re: [PATCH v13 2/8] mm: rust: add vm_area_struct methods that require
 read access
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:44=E2=80=AFPM Liam R. Howlett <Liam.Howlett@oracle=
.com> wrote:
>
> * Alice Ryhl <aliceryhl@google.com> [250203 07:15]:
>
> Hi Alice,
>
> These comments are probably for my education.  I'm holding back my
> training on naming and trying to reconcile the snake-case and upper case
> camel of the rust language.
>
> > This adds a type called VmAreaRef which is used when referencing a vma
>
> How did you land on VmAreaRef?  Why not VmaRef?  We mostly use vma for
> vmas today, not vm_area.  Is it because the header declares it
> vm_area_struct?  I'd be happier with VmaRef, but I'm guessing this is a
> direct translation from vm_area_struct?

Sorry missed this on my first pass.

Yes, it follows the C name. Happy to rename to VmaRef.

Alice
