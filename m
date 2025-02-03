Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20691E0B9C
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 09:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573838; cv=none; b=LfXd1b4Z5xjxVl7xqaDAdyxorPqA3dqJQwPWfeWd4FaSowLHQEdwcPpm4Zgp/Bb9vWGQsOHqK9yRlpD1ugYAkHI6nINJXaFxoB5pQNVBjW0CqZEyWCEgNTuRWotwg5AFTvGGg9WbSjGSuB+U9x0jPEWQk/GXxAFRagOEx5uNG9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573838; c=relaxed/simple;
	bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNYn7lTn+XMgTJoARd2hoMubxXFhxWneu58yMIWmLc4+A9Y8S2S9TPsf+BoPVcjqYYG1wxRrWEYw9vCsLsKdlEUQzyIdyf3W7Bon6/egKUy5+I8J/GzyZntYhHc1ICp0j0wtkdsQleljMh9L7wds/xt0CymfCJ/DgsdKKeaSdrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UkqZWSa4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UkqZWSa4"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436341f575fso47373985e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 01:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738573835; x=1739178635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
        b=UkqZWSa4nRvWV3d8x/Bb95l3rvtdARee826SLOylzSendGn9qrVy4/u/jAZ6nt0wAM
         XbeiVwlhNfnuuXd1Hq1ZpB6R2goMnFpCyWhdwA46Uupw5C1xGCAd+vAVG76J8O6iMcnT
         KIyqbAi/oOzlG485zoh5HEtUfbsmnvZvASxsMM4AluMHXluZw8A91ksejXK/zl7MM3UQ
         YBBQOzMQyMzxl+0sbJd0/glhQzooPnR7WHg1PZDoSHneuDOfi7wrVPDiLykzYFLm+zWj
         SyccP6G8ix/hpQhn+Kmz8Jwqv9c8cuuxgzrtfH+qN2anhyCey8GfRsbvWt37toBq4U/h
         ScKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738573835; x=1739178635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GqnJ1PTVxaimi6jzAEHxm4Rj0qeyB29leOa6XPWAB8=;
        b=VOH9vrhHZfAqzv4mKNN0ahKA9ehNRSqVW+2yb3xCjToaFebnkCD5wB41uQX0275+7Q
         8bPyapo2nd6rQL8VU+TKTRibXO+o6Dpre7AFBsL8ekIfCQ75xu6sZsxvZFiDFPSBa0QU
         UlNVh7IOWwsx4jylNxXnFyqO6tZAlGKW7tQAY1n94NJ2zM4ZOKT2jUmawokdoPanfEFg
         hfn+pOiWsHNHkaXlJ0GwlazfIj8SxE7K44TJ494TU40NTqUw99nJexgbBd41Y63FqhjY
         oLdVhQdmdCIodqVXSoajHS6KvNxquDAZ4KTX9ja08DwlP2JgLXUM8Mbq6t0+lW+f1OkT
         bpvg==
X-Forwarded-Encrypted: i=1; AJvYcCVCc3u3L0NvrXjmj0BpASsYQ8/E63UtwngnpC8Ma5Io786BWAbYOa/DCRLbCFlLxmFcb1TBepsHReQDqL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWrWgAEk11B3HUoCENh8H4GCfgPBf3KfGhNjBQIt1KKJa5vAha
	TEzYMgH08ZNA5LMlOcgQy235cwASo812MtFnQwRhT/TBAv6RsDYrFrSYJnKMLgl3+DqkRltvkAn
	GOD14NbzZascsi8VvXQpukGglZpSKbYRoTx+A
X-Gm-Gg: ASbGncvRvkRY2ydVoJSgTT2D15kOSEzTuH0iB4LEyM3ynYzDHxbQAN52rzbWtLn6UQv
	J6SWOahtx5+638MGTKOVs0VJi8Rx1rdmoc/CVxfArCIQyoMy1B3odHb43dlQ8O5fIhgCkrc9Dv3
	gyxpRYEEBf6r0HU/fiO/6uBZS4
X-Google-Smtp-Source: AGHT+IGI34eyHu3/GfGg9biDfXT3JxIzFtbQN5HJwuQantgQ/sjTmTZbXZuSP/k9Tb3AezYeg5j0EE13+HmrChg4UzM=
X-Received: by 2002:a05:6000:1a86:b0:38a:888c:7df0 with SMTP id
 ffacd0b85a97d-38c519380demr18290202f8f.1.1738573835006; Mon, 03 Feb 2025
 01:10:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net> <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
In-Reply-To: <20250202-rust-page-v1-3-e3170d7fe55e@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 10:10:23 +0100
X-Gm-Features: AWEUYZl6WceXbooRxBlvUcO8bpNH6XYBFh342mQJjM7qz2TGDzIyB0PjWSJCckU
Message-ID: <CAH5fLggrgd5fX1vDGKjfqiZ+cjYK6p+q8XaCfCa_KwsTT4L+Qg@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: page: Make with_page_mapped() and
 with_pointer_into_page() public
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>, 
	Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> Lets users do (unsafe) complex page read/write operations without having
> to repeatedly call into read_raw()/write_raw() (which may be expensive
> in some cases).
>
> The functions themselves are not unsafe, but they do take a closure that
> receives a raw pointer, so actually making the access requires unsafe
> code.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
