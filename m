Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E479C23A563;
	Tue, 17 Jun 2025 06:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143341; cv=none; b=aJL0cP1bspM9By4q4rFO1bjNQ5sxFYSxTsJDCX5dbxbDGU84u0xDv887d67TEbf2f9pB895FnXa4ks8kU7tc/IwCARmMDUe7dszoMkigmnaHMkNSvpgwNv9F8O3oZD5vn2O2o2b43ebCSpoFQoagtKm3hbBnJSwXp2jLgoMkZAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143341; c=relaxed/simple;
	bh=bC0gww3afJvIAXuLAxj6TrpqfBdGhWz23dSMrKCAttU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxqnIcaYk61583CqjxEcVJ+YouekBWRDSBCh4miIHFLNyiJlA/9aFY2FaHiG2YAs5jCeh2Sz6kh/kpfL2yX5riocpaAHEWGU6WYXBM3VofifNPtzsIXv6+PjL8jGo0e7g5oJvJeLleRxbrjgWBKy7De1yxk9UdTSKGQhTVVb1cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEC7gBf+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEC7gBf+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-312a806f002so892260a91.3;
        Mon, 16 Jun 2025 23:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143339; x=1750748139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC0gww3afJvIAXuLAxj6TrpqfBdGhWz23dSMrKCAttU=;
        b=IEC7gBf+2oovd2fXkZuSZtx5pwr6L9RFti3rkvbEGzZv9C+VgEFfCiGgx6mfMu2iQX
         nocFJuZU6Gg/+Xg2RNtAhhn/dACoUMUq1ieEZwqO6ORWDF8567d0wbayaW+S7rrs4ack
         gHPrv1WZGiIgbLGj8lIk2Vet1uB9knMggb0zGE5wLTel5+eoKS0EW2Avrrx8JHiXnNmK
         FXeFEJbBzM2j5q7VHrji8ia2uIzVZwotQZR1saqx0lCVibQWwFuuyLJ31ES9wBUpK9uS
         epIBqAYrEZeJZxtETVZ/Kty1D5uyr05bVPAoH1uTKlLM3Onk+CMN/EDoX6KjG+A2sJtG
         aGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143339; x=1750748139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC0gww3afJvIAXuLAxj6TrpqfBdGhWz23dSMrKCAttU=;
        b=ZU7Z3MNeY5zKuV/GRe18Nh8Q+gkK7n64zn1icvP8B9bLzLUkyVhuRZYkNCA/5Sowsf
         2wNFKeFvf4oLCMh/v2yYlXfZxyrr7yBq1+O+pjqvObzVZqM8c9Du28xog6r6/QW4lHOq
         xvKHxkZImHeQBHsM1iEJWXgV+gJbR+rInSx+i9rv2wv+ZPyDS5HlsspOGr455Y/DGst2
         4+lHQByNynd/2Q8DYYUZkDJ3JminYsuDqm7nuqEo631Dfi2QQvUcNKZuCpT8SSxxGPdK
         QwCaq4ph5vdPuFOoA9By8bONxwY63F5jZuOAqvLVfNHW/okuWyjCadyJt3Oxw3+AC4c+
         ZRBw==
X-Forwarded-Encrypted: i=1; AJvYcCWJB2OR525ityVOIK20gTLi0/tgHTFQQuLVHJce+J9zf7go/i+0I50d+uucQv9WBMUCQq6Su5hoolAYByMqmfk=@vger.kernel.org, AJvYcCXXX1UWLLyCltMcYj6RIHyppIkAQilC+KwgfI+dWWSLyB3GWOYz1aRMO5/aUBaI6uEI23f8nfgu78zuMkQS@vger.kernel.org, AJvYcCXi0RwdHlT7y5nIJh1mAYnU56A30oOjqfseMZ9D2JwH7Wll4taQULseijOzHmT1bEKFaLmp8nWyZbg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WdwO+pICXfCBePNctstKsLrI+QAvDFxFjDi3cuwPP1mGyc9H
	v7QejYTh1QFxqN7j3gJaIP5URmJ+Vjp35iKL0o8vVVJTMOKTce6/Passuv8KayhdoJqy2IvYhPv
	RBXbkiz3+TTtr6PHWOQENANNHziCA4eU=
X-Gm-Gg: ASbGncsT0qO+MK9AdaX/wKxLNlfcfkqe8hbNV5TgyqEb9fAO4rPw2uALjSOgnJ61gZ+
	pwoSO/hGVTXGykOvEFJVnGsyYw9HivP06OUZY7F3HWhMeN+pW2IHxpVQ6mP4TerMJcgDzuSp09/
	/YwmfV7n4RR3wf5gDdAPyYeXFDwEiOTTSYSebnjKADAZ1DB1sks27cRQ==
X-Google-Smtp-Source: AGHT+IGSWvTkSzXLX5k9TvdQ5mDhPI5S2QrkEhpbHmYkrOAdur3jHvDcYjSmNoDXjnWmylStEbjWHhzNYk02DJCzzL4=
X-Received: by 2002:a17:90b:5242:b0:312:ec:411a with SMTP id
 98e67ed59e1d1-313f1d54e39mr8146267a91.3.1750143339051; Mon, 16 Jun 2025
 23:55:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616200103.24245-1-work@onurozkan.dev> <CANiq72n0v7jinSyO85vorYRFB=y5NH5roW4xLRjwZz+DFJ5QSQ@mail.gmail.com>
 <42151750134012@mail.yandex.com>
In-Reply-To: <42151750134012@mail.yandex.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Jun 2025 08:55:26 +0200
X-Gm-Features: AX0GCFsljTzs27aj_JdovAwLsjHO29VvMLS_sfeN6fkiC5VyGoas8b0eo7_9I58
Message-ID: <CANiq72n3+qzDCCf0ct-5gtQHKXDbT2rr1fgxVQP4qBW69JmmhA@mail.gmail.com>
Subject: Re: [PATCH] Various improvements on clock abstractions
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"ojeda@kernel.org" <ojeda@kernel.org>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, 
	"boqun.feng@gmail.com" <boqun.feng@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "lossin@kernel.org" <lossin@kernel.org>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"tmgross@umich.edu" <tmgross@umich.edu>, "dakr@kernel.org" <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 6:28=E2=80=AFAM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Yes, it should be "Onur =C3=96zkan", sorry. Should I update that part and=
 re-send the patch?

I would suggest to wait for other feedback, and then you can send a v2
if needed.

> where my patch converts this into a single straight line which I think ma=
kes it more idiomatic.

Up to the maintainers :) So far we have both styles around.

Thanks!

Cheers,
Miguel
