Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415C205E0C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744872818; cv=none; b=To3FqMI5otVCLnhTeJJBie9xKGaFRO2FFGwyq4udPU66M6WOFKbPAlsaMcT093AXFX7N3sqvM/pNXCjAeE44jebn6zKXHzoZ/thmo/hg0ohQzedpBVMi/f7BgZ3nPG5nUgkM7UmTb4z/gkCUJB+SujUiq+fhxOHMs4PpMX24Txk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744872818; c=relaxed/simple;
	bh=yfD1fdr0iWtPaImCVaMvQsmb3y3cZvCNHarqloDMNh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X8SE1HeS08+2EsCSE0S4Pu2lQ7T2OF/XGhl4Scm1MWp6IZTQEuYZvFVp0YoTI/SKY/0NkLvm+4Vp4ajvFxfYrUibCMGByna26xWd8r+vxaIbmKsRW5+YbXtlJbFG0B9agEerXLccvhes7bE9KirgX38k/ckKV2qhopsZPzRbXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=cbzra9dF; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="cbzra9dF"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso411285276.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1744872816; x=1745477616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rN6OekEdcAcx8JpVflYvmWKrrCmLr5pipCeXLvpFczY=;
        b=cbzra9dF6aRWA5MUUfaXX6Ojw+9J77ZDj6VpdvGI/a2rRL0olazYTQpT+fKKnl7qym
         F3kn/JGh/kUDW2odZj9K6KhcP0NygfY7+rHMKRlj+ynVfcu80fXZ8atwujG0iXzHzmr4
         BBKHs9pSzCVjiuzks4pKb+c4GVSDv6DO7Zf4Om0d8emolY57Fo0k35+1MKk+C+cSHzir
         L2DI7VjCjnHN5gxhsgR8rOBgMPugQ6DNVymXPG55uuJt4G64P8qv0FSAmHg1P255Xn4r
         VigadZOrF/Qv5+Sjp/9B9q2L1sz7ZWrLnJ5Rvm1DofmkygA7QqCkpqMHlk8c09CEsjTi
         33hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744872816; x=1745477616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rN6OekEdcAcx8JpVflYvmWKrrCmLr5pipCeXLvpFczY=;
        b=jMyeDIDwq3AhiftjLHI30LZJDbeFIPn419nz2B7dHrUi+V86aouSgkXSJ1Cf97ugOi
         0Rz3pwcACqOVOC05o5nudv2js8QEmZQMqy6nmHBm0Qe/d0oLk0THyfVY7sd39GShlYSR
         OUg2g0SyxNe7+dsdt9dVW+JIYUBAHmvFrJqrQLslsUXrnuaZSPF3OmjZh+fafsiY8SyX
         YoTlHznLu6K1PtM5Kf9hvx/C0jgY/tfvA+r3IMOTpSyL11Es8lNAaT/quNY1yEaPXZx+
         g2izspaghrJB5Qc+cvZHoCcVhNzjtpJZWbBjwmYaJ2PhWhaqYg5XZAieXmysuoYfkRm1
         IkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvBj4r3tZJ3UylK6qBhQUyX7EL+mFmTDi3aSm5rhP72eMGly3IQsKLCrOLi+eostX++15gK9Bnz7VnCnM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrAzYwKJEwFoqm1DpJV/20oFMcOIcwV7pzxYnNStlA5nlR6LoM
	JeOFvjxqg15BaTEGjPU/MjNQDMg3kq1g13Wv5jv9RlFvtoHWkgb+n8WsuL5TM4n7ZwIlL/yfWcj
	FViwexrsFAFEfPc47H2FIGTQdhAkf1PsT0kB3yQ==
X-Gm-Gg: ASbGncvwFsRjLfxm/MGUPYwlNBB7eeexyMCGyhAXiWSai2d4e1ayb6PQKI3XzK24ZG9
	yuxMePvy2P9yEIBBdyOUPIxCxg9f33wyaNCQdyhJA+qnXUdj4/IIli/m0syWO3oGvYbEMs40+H9
	f4IZm9gkHbCoFPgUHP9uT2vA==
X-Google-Smtp-Source: AGHT+IH14VdsQvLLMXtXkv7oRvquwRgIOJr4HEstlMfsuTByjNPQvfn4TynHwhYN+MAZgKD8vCSfU2G136QJZh/42MI=
X-Received: by 2002:a05:6902:2387:b0:e72:6ada:d0bb with SMTP id
 3f1490d57ef6-e727574caadmr5706000276.4.1744872815795; Wed, 16 Apr 2025
 23:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com> <20250325-rust-analyzer-host-v5-4-385e7f1e1e23@gmail.com>
In-Reply-To: <20250325-rust-analyzer-host-v5-4-385e7f1e1e23@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 17 Apr 2025 01:53:24 -0500
X-Gm-Features: ATxdqUEscG7iZyt3LnyOGWWKXBtuIM4kLb8N7cz8euqZP9UyPrmVQ7tK2A_pxkM
Message-ID: <CALNs47sQ_1XmLg-rWVoEqP65QdyhNSOi51dM3WgsPEgpO407Bw@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] scripts: generate_rust_analyzer.py: extract `{build,register}_crate`
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
> Extract helpers from `append_crate` to avoid the need to peek into
> `crates[-1]`. This improves readability.
>
> Suggested-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Fiona Behrens <me@kloenk.dev>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  scripts/generate_rust_analyzer.py | 35 ++++++++++++++++++++++++++++++---=
--
>  1 file changed, 30 insertions(+), 5 deletions(-)

Reviewed-by: Trevor Gross <tmgross@umich.edu>
