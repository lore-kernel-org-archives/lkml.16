Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DD621CFEC;
	Tue, 10 Jun 2025 10:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552650; cv=none; b=RPE9pt4DbPB0hb/noL+zQqEeGgYoJ28K+iLdUQCsNCcdjts3tDKWolxfD8fG/y4A/NqBrNFax2wnJ+VAIpLVQLS6J0ChZmr2KeZGeuEtpRkNSFrr+R/6YqyOx/KNw1e0QTosAkXuFYjeMLliZ+TGVTpEsUgiWjCu1QjC1oqfyrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552650; c=relaxed/simple;
	bh=T6OOjdcHezRsUffz3VudAWNhovFQ6XtcSi4BiNT9xeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z7zv6n6ZVuxTwFs4UjYn12pWgyXlxBEyS4uGoilEee4+drH96WOROttz4fxJtwYCV73hx6duAW04FS6r4TLEt+4KfZikWsR/kTf9gX0JdRbcqikGmDkc5/gsvohvudjLUriv4n87DmnqP9SjafsOPNhmLakXxzYQXPS7sFcViA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJgsnrEx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJgsnrEx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31373948e08so397111a91.0;
        Tue, 10 Jun 2025 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552648; x=1750157448; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd/zJDAbb5I6puJxCc+2zmo+QTt5tjZ9vF2UjCBKVug=;
        b=NJgsnrExfX3z3I6dEkz/ad6g0MuTf0WevmbxWxSR3cHC3/azIsVUmJX/YDKXxSx6Yr
         zSrVjaEV4XrUBaEFajMxwnwX7Bq5EvQxAYulqfgFMD3TUX0bfBmA30RTQ8xIa0TNttGZ
         gvPugrpGweDO4BtxCqraku3FjTGYmo/9JlAWRCEqyz7ee1iw7f9uUdmJDIrMlSBqp2cO
         eLiwwUUSkhtzGvXSzYtwmIpSHC/ADN/N3OIXCemmUY7Ce6QnbfduIT48qgkfwAGZ9x+o
         5s2alQAS4CDKLRVQkL2ZRVs/j3TfUp8giAF9YnswVhYJhdG2LE3/HOBsFBf16ZbnKzt4
         j/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552648; x=1750157448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd/zJDAbb5I6puJxCc+2zmo+QTt5tjZ9vF2UjCBKVug=;
        b=LQJvCgiPK6110vwycIzUgb6qOd2KuhPylbP/NurvY5SMy9HbaCCRFOJH9LhS/Vd2wd
         yXs5ruMWjZjFrGI8DGvgXgXkHSYiUUypXmIyIge+JbNJ6R6E5Z1Ur3VWYrtfU8t0EO8t
         0dBcQy3ykrOx091G1gRk2EZcwH4YRlh/6cVJin+c7Allu2srbdoWjFlMF/VBdfLOfTvF
         oAaQG4D70qGj9D7Uj3H1snht60yuL1zA3gNdMZemo2ZlNZbUOyzskMsqsdLbDPPsLCU+
         wuu+AxPEngn/ibKrmNJsxOwN0N1vzDTL/F129SHVUl435UhC6mFdsfLVCQQ8+6wqezAV
         Ovww==
X-Forwarded-Encrypted: i=1; AJvYcCURKBEt+TE56AhfuMtf8W24vBur0rcfTZU/JLqP0pmQbrsoW4TPsu0n4TA0UYvxgJz+drtB1O60HYrUoyM=@vger.kernel.org, AJvYcCWQgRHwwHfQXjTdKxnPdWeCFNSbIc3fu1ETG3JwtiqYsoaVOHTjtCwbl+Cw+rCxmMopeY1w8XzyTSblfmX96o8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUf3zU+P2zDQbQef3LboBDlR63vYb/GHKCU6cqhWTKyhOql15
	AUTf998No2kxRN2GxfY/HcHTdB/01k0iMe1k7+WmzXAE63PFkXnN5nJduwxPoO+M9SKpmgH9lzo
	xs5u5+XGY9pk4vUS35hF6vJPa+j+6RZQ=
X-Gm-Gg: ASbGnctDrxHgKE7C333GrP522Wq0tg+QsgR32cbPux/i1h5Zlnn08EUmuqLDSLne9Gg
	PAou/PAgOyLtPFAoAunST+T+fLMgOG5yeuYK5gJhr823p7sHpFotsNAgPsQ8Z3SK/e7ueMDri4M
	4AOi+iVQf1H4yrBNGpLCdVTMKfs4acC868ghJmbn7yF70=
X-Google-Smtp-Source: AGHT+IEk/zKMY7PPZRXcOJMrDrvR6ztWTbbGqVlORpNdV/Yzoj6FKiAg9yDaQKf5B4qWWat6DgUhIMYjnDLWNOUa0F8=
X-Received: by 2002:a17:90b:2685:b0:311:a314:c2dd with SMTP id
 98e67ed59e1d1-3134e414f06mr8865868a91.4.1749552648472; Tue, 10 Jun 2025
 03:50:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com> <20250610101944.lqy6lberyy2aom2r@vireshk-i7>
In-Reply-To: <20250610101944.lqy6lberyy2aom2r@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:50:36 +0200
X-Gm-Features: AX0GCFuAJt8h-IfzslFEntqZQ6rXsc_xm3nWhiReTJy0C4SKsa3s6nfFm8wM2uI
Message-ID: <CANiq72mVYAxnd0ecER409Jw8CNUsAXWsr76JubX5zQbmjT6Udg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:19=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> Yes please (And I won't try to solve it this time :) ). Thanks.

Done!

    https://github.com/Rust-for-Linux/linux/issues/1170

I wasn't sure if it should be considered a fix (or if you would
consider it a fix), so I used the Suggested-by+Link template instead.

Cheers,
Miguel
