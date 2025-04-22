Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E699C1EB1A7;
	Tue, 22 Apr 2025 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331060; cv=none; b=oafs32YsWQ1a4reORKkojaqlmW2DHDrt6MSrcA0TJP8drPxAndK19dvXC9yz2QkdSeaae5WTHHRY1LkBKep7tqKGKFkas8va9ElnknfHqrL0vSwRbqqIXTdJFLEtorYHOSc5L0ZeQcj+Wslk97XV0QefAWdw4ZUpT9J4QbReRqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331060; c=relaxed/simple;
	bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJ4o1tVFBkmSUyr6Gog5e1iNFAd6GhBexubIpGJWInmccBcfKSikERT1w+nI1LDtoIDGzVjIxg86m8XgW9Kiiv+2hnh0V/VcaUzm3I+dh2qjkIf0HYaxx7zRsrr2MnDOyOlqgFupEHaIyo13WXDoSqkNDwGlL97EoaszxAs7gn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwbA0RsF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwbA0RsF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so578524a91.2;
        Tue, 22 Apr 2025 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331058; x=1745935858; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
        b=RwbA0RsFb/SW0uq/MZFUTX7TQOZ0OhwqIVkysDj9e2g9kSWv3+BUlwvOagoCah6ppk
         QhYtiHzCXrijewvceJPuG5mVKoZR0sIIzJvlR6yOHGaDSNtk2YrN4XJb00ovRV8dl9dH
         MargF8cfO1Fc0AdYTdo8WEeQwYNvp5/0+16bunkB1GEgqkaUM7cY91u72C8/rnxR0t3N
         D7f59RVMm4/EeCEXA0jOc0ZQH1zYjfEN8CFoJ2X8lIlQBEv2HA5/bKkfuzUcXb35DuCU
         RtVRjMZlu3YWr7ETkau8FPAlGay5nzI3NRHK8WKraKz7JYUA2db50+4+cHKTwDmBsRg9
         Hvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331058; x=1745935858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MM6fvdAAQzaNltoa3ZzC6OQFO8sSXRGY0+MhpYMgCY=;
        b=MbolMMcFtVnEUjFvF1AAgk9u34/lBn72MTR5dUjMMWZmlG/yXlvahe0V823ArOmhjW
         +273qM5+GsudFqnw7DT/0DxZxLsEK+PFoN6UiAExklwVNmmKdToIvQMzbCZJbfA+5ZkY
         5fX3UAtAhMRrq0wg0h6H+v9zUWuuQHStmRfsk4qBnkseW/VAoU8kNrRtL8LF85h4fWmP
         QoPYuzZTw7sFgv/i9PIjmDljXRlMHbYjydwwREIEHoEpe1z4yqj5EqppVZsc0DGT/3Ao
         LBwkz/gbnuPulHHzgHd/zj2ABHn6E/DsdQEFF24kllrGa09RG90qH07jaI6YNpvMfbD8
         wd2A==
X-Forwarded-Encrypted: i=1; AJvYcCVifOxboGZHNbHZneIsht3PyCd26LIZLTHG6Wwn6teD9N2au2r4yLE3J/kaKdcdOsY2tZqbuXACZvuCNt8=@vger.kernel.org, AJvYcCXch8itUjyniiQ1+YgtJ6pTWX9QYZZ+rlHLHFWpXqrdHAslldC2btAAcEsj66czgPZSLhFdHDFwTHcDW2a64mY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwzAyiujTWsUqM/xPo1Kp7vfHC6/1ixNyvFSP7Xu4ek/0ydwuj
	8kjCYtqpvWJpmHYLHqIk1rZdA/xDa88Wi5n9TsKZpkmfeFyVhjpfsPVT+dyGB+VNw5JrV794DEm
	tzdVDGTV4+fG1c60BcwSchVRThBY=
X-Gm-Gg: ASbGncuuz1ImO50CDyBAESp+Qs2vdWLudDxk07SzX8QQlWAM8OzK6ySQMqJaRNCaJcN
	HNAcgFKH+NmdQjgPrs2GlM2dJqny17CLKYVCg+5UQ6wYRLLweJp3438iLrQH8m2MotAGYQqUdAr
	Mn0MDkQ4u4w+3qgtApM3I4YV/YEUXCRmTZ
X-Google-Smtp-Source: AGHT+IHNrZukhtHZqdbBi0rMLPXMhyRUwthSlOF6B/9nJ244nnrvPdxxYhxg5zPl9IwCLDR/Yn0OqTmVZ44CVdDTrRg=
X-Received: by 2002:a17:90b:1c91:b0:2ee:f59a:94d3 with SMTP id
 98e67ed59e1d1-3087ba5ccbamr8060310a91.0.1745331057902; Tue, 22 Apr 2025
 07:10:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
In-Reply-To: <20250422125633.30413-1-contact@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 22 Apr 2025 16:10:45 +0200
X-Gm-Features: ATxdqUG-FAOW6e-i0WqSstuY50PV6UgDsUfeNCfXkoL6rqSF8GshcvdRIVq93BI
Message-ID: <CANiq72mo+DSyFZ3gVWVhqH5LHa0hkJ6gyTN70=smhRYzpNMYWA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] checkpatch.pl: Add warning for // comments on
 private Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22, 2025 at 2:56=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> Background
> ----------
>
> The Rust-for-Linux project currently lacks enforcement of documentation f=
or private Rust items,
> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
> While rustc already lints missing documentation for public items, private=
 items remain unchecked.
> This patch series aims to close that gap by ensuring proper documentation=
 practices
> for private Rust items in the kernel.

I think this background wasn't changed from the previous version --
you can include a changelog in the cover letter too (some do that
only, instead of per-patch), which may help to mention what changed in
the cover letter itself, if any, since this is a good and long cover
letter :)

By the way, some of this cover letter (the "Results" section in
particular with the examples) could be nice as part of the commit
message on the first commit -- that will make it forever part of the
Git repository, which can be useful to understand the commit itself
and why you designed the heuristics like you did.

Thanks!

Cheers,
Miguel
