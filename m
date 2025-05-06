Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31EE1F7580;
	Tue,  6 May 2025 10:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526703; cv=none; b=ukIdhUzwSLX5O77pqkq8/huABVFKh7fU02ePXIrlpK1LT/lDQOWKvrgao81yGzNuDLj0jdbIL7+m61fOaNHHnt0x+cBQp6ezwF92zN8fJBVdL5RWaUNJ3fjAbmzLpAfY6Ca2VZrgmeQ7B344PUeuDNzvOMQ0lRJKnhMXDnR+HRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526703; c=relaxed/simple;
	bh=TkVB+8a7Equf/EbuOsvzUv62MCHrmk/SwZSQs4n6MgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gB15cDRsO5eBlOYw4Emy4Bry1Fe7RH4+33iF1lHBb6MPec/V7dPdWtBAUIfJi4oyk3x6RG6E8KoNxfSC84WI6n3wtdLYCN1DdnSLgKZ66ZtZgkoWfnVNBZFmuNdNgIkHvDvtB0YvsDb8CdTcW1v4nqjMVpb1s45MYOBkq2pbVM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFbnB9dC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFbnB9dC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30a892f8124so28970a91.3;
        Tue, 06 May 2025 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746526701; x=1747131501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkVB+8a7Equf/EbuOsvzUv62MCHrmk/SwZSQs4n6MgI=;
        b=gFbnB9dCVtg1U46K2SCi9EpWQjEPyUw9la7eZx0KQ6cTOdNYEH5g03JIXR1ehJYkeD
         5KDP6GV2qtcFvsr/esKfTAOYXCHBPPMK0BrsL85Tm+cSm7t7IdJjV/0w6RC7GplvBYpv
         JBwh1CCfUiGdMNX0W1Cmg64ZP4WWQqDRPK2dFJbijsON+LZnBAwbo4VAmutLvXLM5S1T
         ykXXHt/slsOSHuY8q3DpLsiEc5uWAzDKroVbZq2l/eE4x1PEBSPoFnSIJwf59wq8NasR
         iypnFYe2XQC8P98OrrnheA9nmfzD+uQ8lDyf0u5ZPVA4FTJsUq7cQkzDS2xnSAMG4w8w
         cNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526701; x=1747131501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkVB+8a7Equf/EbuOsvzUv62MCHrmk/SwZSQs4n6MgI=;
        b=UU+Ui1Wjj1bxmIh6QHO428hGy2uiZhciciN3yciGHFOwuCg+qZTVAs9R9muogvWm5u
         9Gcta7AdH2qSKLKKfcPtDEYJQoLbHyxzS1+CdU1MgtG/GnfunGpVjxg8020be5795Kqy
         3pRSlqSFDgFhF6uqSltS9+A9/6l8ugeG2OMYrpCve0N11z52Dv1YLhgzyLgn/vPks2pL
         Q9855z0OtMb+VRRe8qD0KrpRY9Kq98WtTGdLg4UcWy53oJ1oZEP5oNAtNInm/IZ+HErr
         4MjnYkWCwZ4bG9FTdM3uDM8wbFvCxNDyeSW4c+7FYOLbOZxyT0uELYSsJb0kGnto98Hb
         lb2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTB97NRSJnbHuLRz0GxfehPtIGC5uuradZJqI/S/tSxtpP0AUcAZNf4O1SBjtEZeRTf5U9p36U2FOxYoc=@vger.kernel.org, AJvYcCV4E5e/LPUzmq0PAgIvCbIsf4gT9Hsm1tu6uf5gDF0lz/61UMyjE/fJlb9DZT45jhlkpWaaih7cNa66mPrAnjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8aavXui+jslKwthCFvONV2zrqWBcOMBkeR6Ipvs14G4tMROrA
	p9kMCHWn8r2NcUzq64qpck33EOzuuz9FUGGWb8vthPaFSfJ3S7WBE4yB/Fzp2LF2629aXVl4h0x
	/U0sHCOe1fVj6ecC04KgzqUTmMf4=
X-Gm-Gg: ASbGncup6lEdheT5bZjneQZTtDTX6TI3lujXCOID2l4m867bSmPdjzY2lTMY+aIBDJy
	1G8xSlU3ErnS1S7ruNKP9AU1/BzobY7Dtbd0DuGnEYUJf9YP84UjK38lIsbKkxsJie+/GL97lzp
	8MuR1ErOza4855JBZNjSl3vg==
X-Google-Smtp-Source: AGHT+IFTQhMrziTWlbb2M+/2CKqeuD9ySvQIFR7HINWqYlufRDWodWwGFdpGFLHaN5vk5bUQ2xswfOSdmk+Gd3iNYOY=
X-Received: by 2002:a17:90b:4c42:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-30a4e6f3564mr9396337a91.5.1746526700829; Tue, 06 May 2025
 03:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mvu54B=U+YCUmbFctj_wXgF5zjeE-BB-vHVnAP+3mPcQ@mail.gmail.com>
 <20250506042330.281501-1-contact@antoniohickey.com>
In-Reply-To: <20250506042330.281501-1-contact@antoniohickey.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 May 2025 12:18:08 +0200
X-Gm-Features: ATxdqUHheYcgH2uYtGDqL5P2WC747Ik5cUU8Qk9P-Zl-sb_irLvy-lFNrX6m8BI
Message-ID: <CANiq72nu9MrTaQBABxiveqSqX4b9zJZL0MsazG+D64ULQ_Shqg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: kernel: create `overflow_assert!`
To: Antonio Hickey <contact@antoniohickey.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dakr@kernel.org, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 6:23=E2=80=AFAM Antonio Hickey <contact@antoniohicke=
y.com> wrote:
>
> I do like the idea utilizing the `cfg!` macro, it's cleaner as it
> reduces the empty boilerplate currently required. I do wonder though
> could that potentially cause warnings like unreachable code or
> unused variables?

Hmm... Isn't it the other way around? i.e. `#[cfg]` is the one that
completely removes code and thus could introduce cases where no other
code references something.

As for unreachable, I don't think that triggers with an `if false {
... }` (it does with e.g. code after a diverging call).

The `debug_assert!` macro works with `cfg!`, so unless the compiler
does something custom on linting for it, I think it should work for us
here too.

Thanks!

Cheers,
Miguel
