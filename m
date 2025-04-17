Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B3E21516C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872714; cv=none; b=aedo5/Fs+Kwq/q8vtZAvdiHI6j7JZir3oICuSZRP13qtrxTAL9net60jGa9OxasLcyZEL7+d8OqnRyv48cniKM1gYsaQGLkFV54VNLK87qZbIrTO/pa8MQF+x6kv3TAeIuag2qB2IeuilqGcODyGb3PJDJlzjiCcpumJ1c3KXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872714; c=relaxed/simple;
	bh=Pf4Ipk91d7H1AfijgJfbT2PavHXksGVHQh4TrEedAYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTguE7yMNkoGyq6MZfEe4LIpCtTCuRfK83AQR0wsaGaQLf7B3wwYPXnrZXoIpqdAcPxG3UDmQ5IuQh2aAnou/NS1H3Em/pE75J1KyY2DtqsZAN+OBwUe+GbV0dzMKJobfMfx9gMrUnTSlZ1Mz0HdZ7pb6BTPK2QbBkdULDyGmXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=AEuWlUmf; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="AEuWlUmf"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e702cffe590so361884276.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872711; x=1745477511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFyIxYl8CM7pfniK7v4uSLsOvO7ZcL+Q50oIJUmy4Zg=;
        b=AEuWlUmfOq6G2prBgyytwtMml93/blvtqlqp3gMyi6jrlKLQQ44pZsfBjH8FOerPMN
         J5g03FeynJiTI7vq1ZmSchrkSGkyM9OKPI7Prbs44pBFeFsWi2sFpiLGGcB9AXlllqS9
         OKEW86gvFnTWQ9bavxowoNPAxTabfBeKByKHZQoX3mPflFQ0H902g/0YsG7cF/MnjLmx
         5qYTzBf/A60aSV4FQJDLIsPlbnJNn5g/M+/PSAHyojgHE62ft7q2b8i2BWSPZ4900SeI
         2DkZ/FOdvuhZsElycvYa42oLC4VmXkINQyXQVqQi240lhaYxbErCd9F/J98E4nE3lkNo
         Sp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872711; x=1745477511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFyIxYl8CM7pfniK7v4uSLsOvO7ZcL+Q50oIJUmy4Zg=;
        b=cqHM4E17Q8tsqJE5Fm0Rm14sqU5a4wufeEl3baV8uQie87TrNZuRqqManeFoTNtEoU
         cBkyR9ELLtJR9Mtt7U8feiYrVlA5Yl1P3i9SwTtGcBN+jMOq28af5YUW1g/dlYaSXEDR
         K32Yeop7Y3wITmJVB2ZQGVO+X5hiG7qIEzgAE1qTD7tgcV4chebhyPzBerhBFUygci6i
         8AAQ1QYjqZ6KwSjZBoWYlR2kIFGUNTu1aHAi3mgB6KvcsbyINFFqEsMYApFHqk8k7W3X
         nrGM4k5Hb8LgKCE4/0VrpBi+sfXGl/JPrhtXDfU/qZ4FDAQkAvmYf5GqolIvXMqsPZpt
         n3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCV7X8UQttcLuytC4IUU0bEuKzwuqXdlUsykQ9hcapbFvxLPshF3CSh/l7PyMKAZPxR8f5/FU2yyR1i5B90=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDMGYr7+puLhkppUviNeLn4eD1k3jIsre72q05bD1Nw7SsnaRN
	nzYNb2By1dGjtSiwmf0gamTHNiq9RMpgx+GFTNug2GLfSgz9JBY6qajHzCnrjr7Gd2/FEHCqnsB
	FDiGIqBVPlVegb/uk8adG8hpnkgZdvV3YR7TZEg==
X-Gm-Gg: ASbGncvot/5bDsYDr7ElaYT/OIsdc4zuZEJ9nkg2oXObe4SCqyfp9MxrZShj2BYfkqT
	L1PnDTzQ4btiyncbbrrdtZNzPkXfZlcUUA1sYbd8qEJrdgpqbg9d7fHuuAAx1SORJwCivZo+2SL
	9RcjbLHxRg0PsSlpvFTH9IyWrV6TidJTV6
X-Google-Smtp-Source: AGHT+IEXcYcn3MZe5ob/F8f8GnPNfJ6UNuPjHwNzwJKDDOiGQCsvgdgGNqoqugzFPNQP+DjNeO4rcBRTLYtY2Pf+0/Q=
X-Received: by 2002:a05:6902:2387:b0:e72:6ada:d0bb with SMTP id
 3f1490d57ef6-e727574caadmr5702510276.4.1744872711599; Wed, 16 Apr 2025
 23:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-3-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-3-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:51:40 -0500
X-Gm-Features: ATxdqUHAuJi-CdQp0i6jq1Sq1031o_Pg7xduY8yp9CfsQlRjMYhWFR6hWQP69yI
Message-ID: <CALNs47uXFvGL-k872oqwP3_rv8se3qNPeaZBOjOSMmXFFcYAoA@mail.gmail.com>
Subject: Re: [PATCH v5 03/13] scripts: generate_rust_analyzer.py: add trailing comma
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 3:06=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Add missing trailing comma on multi-line function call as suggested by
> PEP-8:
>
> > The pattern is to put each value (etc.) on a line by itself, always
> > adding a trailing comma, and add the close parenthesis/bracket/brace
> > on the next line.
>
> This change was made by a code formatting tool.
>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
