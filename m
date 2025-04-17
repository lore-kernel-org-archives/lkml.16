Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF96F1C6B4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 20:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744921581; cv=none; b=qbRnzqgoKKznzUqPKgZHihdMqqQS+Da55PPEBIyJ5gxiYQHmUkSyKnBWsd5A6LBqNFn7kzPKIb2UxgneGQu6HqEk75GxG4iiHmgy6HWrIIZimhDbm3GG1+Osqvw4/Maft58nhz77ZUk82fiWffq4v8qOqSFqOk3aQIhpHYHuNQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744921581; c=relaxed/simple;
	bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy64RBSZ/dchR8pjlmQQ5drXYy4XPuTlq4GtAPhoeUMtGkUgVW2PJ0pKoryu28XZUFqEERr1CBb/Vzz/Mkorbq5TEgyZhhc6AV6wftXOvjuXARp/BZHDQ+ttxHjrWwzwu1yA7pyUYCecAci1eEp9UGlogU7KrZoyqeCWjM4Faek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXHIUhir; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXHIUhir"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so1094219f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744921578; x=1745526378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
        b=uXHIUhirlKnW9uPK2FfcmgbbHVXo03E7nYXrhuEiQq7Kz8mcvZ1QqIjqAvUOH++bji
         cQs/2afYDNg0uNU0xkt0HtZ9oyNeMhqA98kQmTuTVLbLUMk7sx8tM9NeJeVgzMaHgOk3
         b2oXHgboYklLZVYY1vppAtNrUm0+QJP0c6lyjUCMbe5iXbxRbqSw0yIKwBpZyWEEB67c
         jeZMIw+ubjUTv+kYWwIdPz7AHkzUCw61+i8cingsI+RHa7/5PoCLyGefJwrlfy5+vUkT
         hohuheKga0Lr93e9ibyPavLL/2pZ9EBTFFDhREAG4mBnUc8v84W6L/oTswY6AMKBCYQY
         FFIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744921578; x=1745526378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9BR1fk4Lu9EfXNC1K+ho4OcbepgW+mVZht6+kGIrq4=;
        b=jVxSzFuavyvW56fCqoDcDOFUz6lGVoGFW0zllP/R7w1p+9z4E1qAtzIKujZ0GOi/VA
         j4W7atEfjActxERVXSLKN1E/NsZJLzzD+Qys3410aVbvbC0Ef1RBenBqdLev77buwnbB
         lFny4Vt3PmFP670XYt86HVUZJcaHombm8NBzcqXL47P4jlWexvgkb+dfQjK7Ihlue8ix
         8FM9/5HmFY2/nRx2vhE4qoBu9kx5icoQL1+40QcRz6xYQOHEJWLHKUlEXl9L7rAvkWVu
         UUHVmxzhTM+l/HphsxEpMM7Pgo/ECWOjMxP3yGT3QWchooWgrUgn5qO5IMHGbt5waxBI
         zrSg==
X-Forwarded-Encrypted: i=1; AJvYcCVRlOiPBwlCFASiqfh4650Ylqs82y7BIVCv4vH5Ux8Xj8GquiMCazKZ2QO4TN9osn5pE6GNC2vGlkFEJqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwczABnrSPamtE0wy+VxYiCBw6Fl9+PUEs3WK2L15n0U8geX9LO
	JJREH1n0cmKhXEUwOrl9ZaZAxEXMIo4p1I86dGYFlhyldRwNi5fiz54Z9rwE1bzODBnVKR6jN4p
	zM3Ex+BK5RKgizpn9tlxdWfpvFz2gCsbOmcqa
X-Gm-Gg: ASbGncs0Y3WQm25QDoqKLTQopbKGZYb0KEMCR1+n/VzpdYP/tdkvQNhR0p0TSr9CNvU
	O3iDDsD4S0QEdcDF0tf0hcbDmv9cjYGbTphW6KIA00/jiaZp9UzIKLiJUKZVf0HNExgnbhCTjbl
	VqlHvz0+f5FYcLUK95udvKFXleH/4OBWuqzA==
X-Google-Smtp-Source: AGHT+IEgbVUFGlu0tTYWSq2oOplLEYj/UF+LzYxMvihYNkYK3OXsIfhVMkkX8xl+OBW1JVcPLtcbLOqeqQ7WLI7Wqcs=
X-Received: by 2002:a5d:648d:0:b0:39c:141b:904a with SMTP id
 ffacd0b85a97d-39efba2ca27mr255141f8f.11.1744921577906; Thu, 17 Apr 2025
 13:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com>
 <Z_1QzTdV8mHJYdQ6@cassiopeiae> <Z_4gb8ZAlbfhobgW@google.com>
 <Z_45kDv_wAHIBNpI@cassiopeiae> <Z_-f7Bgjw35iXkui@google.com>
 <CAH5fLgiKxDpWg=dDsTJsrB6Kmkw32GZ9WPO-SrpWm4TZDxGVtg@mail.gmail.com>
 <aAALmSjLyWqrcQ45@slm.duckdns.org> <59c1e09a5c47a60e26c5fb10c3305356328a98a6.camel@mailbox.org>
 <aACtqnC7okO7eZEg@slm.duckdns.org>
In-Reply-To: <aACtqnC7okO7eZEg@slm.duckdns.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Apr 2025 22:26:04 +0200
X-Gm-Features: ATxdqUHB_J0T6QISOWtmxns5Ap3H-yx5PgjJvKRY1cMssCc41H0DFFgA7pnX8Rg
Message-ID: <CAH5fLgg3RrsWy-ArWb9502st3O=DsmPsBsXoZ5M_nS7oWggJuA@mail.gmail.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
To: Tejun Heo <tj@kernel.org>
Cc: phasta@kernel.org, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 9:28=E2=80=AFAM Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Apr 17, 2025 at 09:22:40AM +0200, Philipp Stanner wrote:
> > I assume you, ultimately, mean that the list of delayed_work's would be
> > accessible through workqueue_struct, correct?
> >
> > And then destroy_workqueue() could loop over all of them with
> > cancel_delayed_work_sync()?
>
> Yeap, I was thinking flush_delayed_work() but maybe
> cancel_delayed_work_sync() is better.

But doesn't that have a cleanup problem? If the work item owns an
allocation or a refcount that's cleared by the work item's run
function, then using cancel_delayed_work_sync() will fail to clean
that up. Whereas flush_delayed_work() avoids this problem.

Alice
