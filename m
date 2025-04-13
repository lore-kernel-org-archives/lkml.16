Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B3618A6AB;
	Sun, 13 Apr 2025 20:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744577584; cv=none; b=Uip6OwUEisM9cr/GsvOV9mQjVsdNMY5InxDN6AqfUamlrgxfg30ZVVbGzTrvpzk613XucJhLTok14e/aAXYC1yWtAz3hM+CZTCGazQKtJg65CXfguY/qnSkn4Kgd10EKa1c4CcKT+Qpw2/Kx/h1oj7a+u3aOC2dH7I5xwzXXbWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744577584; c=relaxed/simple;
	bh=Emir0TLGas17ay/4YrDiRDgoUVWIQQDelZyNShEdSzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9LdPZ8DXWFxwhBZVVbcJHugc9oZJbx2jqFs5PBUN8b5jmnpTRh7MkQQxZEZgjYXkOxnp+feTjeCPafn5/2fPTucAKmloqVgwD9f4IXVoWZAGhLqj33Dgfz/Ai92FSF5DzfrjQjz0lXNcJ78sRJ63+PqyJiZ5M+zEbDT/fzgaic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+TdmyxX; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+TdmyxX"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-308218fed40so533295a91.0;
        Sun, 13 Apr 2025 13:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744577582; x=1745182382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emir0TLGas17ay/4YrDiRDgoUVWIQQDelZyNShEdSzk=;
        b=Q+TdmyxX/uaAdU4l5TXfIoYHerUa0Quilt8rs46ikd/PKuYd7n71mfWqc1T6X3p0JR
         yjBOH7t4xo1eyw6SooMO7yu7NJ5pXV9g3cSNPHBKVm7/A5UJFUy9yZrS9l0mwgoFyWg5
         x12+6RgfCPey50xp7MTY+bsio0WxvGUWUaY9GW/7WCovFYUSSyZJF2oom3/lJuTiQ6uf
         eyB7vkumNC3zzHO240OQ2cFctcwGuXRxSrCqnF4Kqbv1TSv63LFVxynugeQiONNQ2a8K
         VW4+39vtvF3TUcv+hpFZznqYuWdgeVhX5qraKhxZ5orXKNJIb/3lWkaYWPtWtTpkguzM
         pPNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744577582; x=1745182382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emir0TLGas17ay/4YrDiRDgoUVWIQQDelZyNShEdSzk=;
        b=BWvIcd7prAC7jsuPK6ItJVlporq1jjXzaMK2n4+nYnSDMBkzgwac68Rw+9ygJe/wXj
         mj8xCKKjuRe1eGOS0xafIaVrAPKDaRdeXa6Mji5LQKMc7uArvBDaLc0K8K99xMqCVAL3
         2i7GLEwN/n4qWXyePd/GS+r6gEBuyHb9tnLskZh1GhPy4PvsG7W/uoDxroRc5rmR4Z77
         bj5rFUFARYSUos+UesJqjS5mde6+RAXiqMJZZQlyfR5LpuZflAtubUaFFXDnGXrgiaX2
         TRlAX7jpDe8HCZ1yILsWSeFZ4ke+bWTI4FtF1LIXXf4dw0tpbE/OGuTpFUfSNlzRNX+c
         anlg==
X-Forwarded-Encrypted: i=1; AJvYcCVxER3QrxyMol66G3o0WLF4m6My0W99KASR/JI2F/aBKCjLyB2M/vcBZaCuqVzHzYt++3Mf5fbDzbzAdQQ/JH0=@vger.kernel.org, AJvYcCWssL9jAYufzeDFmNJZMUCXvmjHVEnQFcYcCgI1fERHnHuGWJN6H0aRIAfJIAqr+7Uyk6tEEtZ1a0s=@vger.kernel.org, AJvYcCXT8aGqA69hTgkvl/J6PIqvO534dJ8uZHwjVLVJeoJts/WB9NFKobYBADwpfo3cs5VT1vcGKCiYkbqu47qX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq/P+p8kl5cpthaK2w7iTwyTRUBZECMZYafUuAztYO4aKNiOfx
	he3sal5vQf4rw7xviivHGsoYDteV8If0BagojASMSJAJuLTgEM2UdSY7BO6ZW28OQoqFB2DyTmS
	Tx0hG5+Uk04NS11XULvnxiyP5aBA=
X-Gm-Gg: ASbGnct+Po0cpU8vPlXmh30ev5oMSIowz7qPcTucZc0PGepgGP9ifbxev84OMG+zJZ0
	9+qpGRKhzNNlsWKuwFgRdD0CX4WG5Sa5ZiTt0Q4I3DMlOvjF3iRTFwfs3wdImwGvc1mkCbp40q1
	1E2S4n/ZlV0FOGaIu23lIqBQ==
X-Google-Smtp-Source: AGHT+IH2Hs5OUU46xFChLlQo87dvV2NQLl26XhaQHWAVdVPutf/WF7UlNeDH8J2nd9JAugeCjkSHrKGEGitOY5w4iIs=
X-Received: by 2002:a17:90b:4d04:b0:305:5f20:b28c with SMTP id
 98e67ed59e1d1-308237c95b7mr5487431a91.5.1744577582062; Sun, 13 Apr 2025
 13:53:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
 <20250206-printing_fix-v3-6-a85273b501ae@invicto.ai> <CANiq72neqbD=zJ3jAizwMewxx4s2YhAvh6M-Y4sNfq9+ca3P2A@mail.gmail.com>
In-Reply-To: <CANiq72neqbD=zJ3jAizwMewxx4s2YhAvh6M-Y4sNfq9+ca3P2A@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 13 Apr 2025 22:52:48 +0200
X-Gm-Features: ATxdqUHDyU7OcivKGtJLfrr2nPLY7T30R-1hEV4g7U8vnsGDS61pvzuPuLqmP_0
Message-ID: <CANiq72=CTWYzs=n_x1XSjjpoSdCu4E-+JpdLk2XWFWAbVaoR6Q@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] rust: samples: add missing newline to pr_info!
 calls in rust_print_main
To: Alban Kurti <kurti@invicto.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Jonathan Corbet <corbet@lwn.net>, David Gow <davidgow@google.com>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Asahi Lina <lina@asahilina.net>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	"Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, Xiangfei Ding <dingxiangfei2009@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Fox Chen <foxhlchen@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 12:55=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks Alban for making the effort of splitting the patch into several
> and finding the right commits to tag.
>
> I will take the first 5 patches already, but I think this last one in
> particular will need to be split, because one Fixes tag points to some
> LTSs and the other is very recent, so it wouldn't be backported.

Ping about this -- thanks!

Cheers,
Miguel
