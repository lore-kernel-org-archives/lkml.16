Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE332C8E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 18:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606649; cv=none; b=MXVRfCk7YQbjO5l1+w8hcMKYSEwQlxjQRzEFmWrrIBoNZfXf6JOa6klVTwZQRu+/mXDCudk7aStbGowubLcAn33NEc6DuiSyKTJzHgkl9cwFwE/6sSQ3MdYmL1HjRujcecv1FKs4HmIEgCQOe0R3ezbtyfmeX1t0XiR3J7trH9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606649; c=relaxed/simple;
	bh=+oTVEI7ih4UQ6CaQVZkQ3pNuU5Lz8cH04p72iYkrp88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzs9ZBWoCzJg+ergoK1gvPnztwSCtbNAQC2EZInroJuqJOJIH1fQ010PuTiokDNBTitW98YKIIsevkugw6vPKirHOXiqeB6pnBo2Emf67L16LezESIalqsvYcPINTTAzpEiKdS8RxToHSQVwJp6dib/jjg1QvPXZ4sG4A+34yMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=G4cH0oea; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="G4cH0oea"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso35238885e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 10:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738606646; x=1739211446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=G4cH0oeaYQyTXS9ej3u1+f+Qzl8IRnO6AyAMDWpmfZp17wct9DjUIQ4JPlJ13t/0Kb
         tm4eUjPhPiYtyvhwhLtpf2l0/b+6MfHml9L3SWSaLggGPh2ybjtTzSyfUH5SGGTjOaOR
         R3sYXP5fzeEOj72BQPF27soQGVgAKO0GV918gRz7rnv5ZBHzae7pPlfmtnR9DEJS3ou9
         6uUF4wf+GrCIS4sY+voOy3BkSugE1SbdDHXCnhcDw+AbOpmPfQUiMSpU7yeZgglQiVyd
         kmurEXMAmpn8Y2JFgssTcSYaPZ1AV8rfPRp8gb47MnvPa4YYDm4jssnUPYHcFYpn6FxT
         ezMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738606646; x=1739211446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VDkxzxcu7O1vOggBOzC4wE/NAP+zsMC3Yt4mKkAp2BM=;
        b=BhjnkNegnL70FYTxPefNx7nwTICnDW0/lIvYqKmcYqttvMbjquhrpDkLcJ9hoK7XZ3
         1koKm1Gb3Sui07UNkX2COHrspvAdbicDeMEHGi7xkQwzM/aN72sJxtCD4176vDt/h/Un
         lIt3fKZRONGSItLC/51cSjSKFwLPhHs1pQiUG6TTyQvL3I2ZFKzcOyhxNntghNBHM4j/
         P1yZ91Ci7GeeVqtPcMWdERIyEoCt1maqFB2dHvfpwsNPZ+wQNdHURSHy8DPTI0bDGI9a
         oABjoRRelYOFAjPQo5moAucxEiwYJ1E7gWzRdzgXQlVWb4+CDAOSQATCndG/TcoaPtR5
         /w1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6sMSBcc3iwVL2sdUtK7V+RJeZcHsMaxeAisuFFi7XAbeYMKYOQKHqrZAbtZLIYgwsjvYf1zxKLMIhZHY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiFY6jqNzRy0XwDM383g4Qthe50m2b3jSH+5B/KoUgbBYlV716
	3lmTmcAzrzWLp/Yfl39ApbFi1QkzeZO2TedkwrkkFIW7x0L64h0P5zxsXFtTLD9tyHN0LiZhpdF
	0oaAQM4IiOpiY4rlW+jIeEj8lMu9IaYqto3rW
X-Gm-Gg: ASbGncs5Qf8zWg6Yr8/iJcT+0Bq/4UScQJIU7e4xnkoTvPk1ptB4CxlPqNWbytXdA5p
	ct8h8lJz0Kg2TR5wB4vv8xgqFb2+vfvyrGzWF3ozOi8gvTD9L/RNLm61p4JRxdVM7mkbw4JRn0w
	==
X-Google-Smtp-Source: AGHT+IFjiAANHpU4lYhLwjIj1aIzAMCx+jP5Z2qXe2xs3JQXXbYoy6fxWH9MRWQ5Z6+cy+ed9B9IBPZfiojUyR3Yru8=
X-Received: by 2002:a05:6000:2c5:b0:385:e013:39ec with SMTP id
 ffacd0b85a97d-38c51930b44mr17922172f8f.8.1738606645674; Mon, 03 Feb 2025
 10:17:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <20250202-rust-page-v1-1-e3170d7fe55e@asahilina.net> <CAH5fLggscATtCgQwCYSms77oSFOMkjTscRDqAOZsSgoHsOoPQw@mail.gmail.com>
 <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
In-Reply-To: <def0ac4e-6ec3-4f91-a3e6-02ce931c46f3@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Feb 2025 19:17:13 +0100
X-Gm-Features: AWEUYZmdD1lRFN2B0MxC6_5nwF3LFE7h8SGB6KozvokrQeCQEKJgmX-DPDC9T_s
Message-ID: <CAH5fLggcT0_e3EsBppxsGfxaqvs6rTkbbRvrFEHthEff5s1x0g@mail.gmail.com>
Subject: Re: [PATCH 1/6] rust: types: Add Ownable/Owned types
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

On Mon, Feb 3, 2025 at 3:17=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
>
>
> On 2/3/25 6:13 PM, Alice Ryhl wrote:
> > On Sun, Feb 2, 2025 at 2:06=E2=80=AFPM Asahi Lina <lina@asahilina.net> =
wrote:
> >> +    /// Consumes the `Owned`, returning a raw pointer.
> >> +    ///
> >> +    /// This function does not actually relinquish ownership of the o=
bject.
> >> +    /// After calling this function, the caller is responsible for ow=
nership previously managed
> >> +    /// by the `Owned`.
> >> +    #[allow(dead_code)]
> >> +    pub(crate) fn into_raw(me: Self) -> NonNull<T> {
> >
> > I would just make these methods public, like the ARef ones. Then you
> > can drop the #[allow(dead_code)] annotation.
>
> Does it make sense to ever have drivers doing this? I feel like these
> methods should be limited to the kernel crate.

Not having drivers use this is the ideal, but I don't think we should
always expect it to be possible. The Binder driver has a C component
for the binderfs component, and it also has some code that's
essentially an abstraction inside the driver that I was asked to move
into Binder because it's so specific to Binder that it's not useful
for anyone else.

Alice
