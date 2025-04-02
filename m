Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D017923A9A4;
	Wed,  2 Apr 2025 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743607679; cv=none; b=lDTm1UmQALOiC0cxtT3JXqI3+wG1OF4RZO9zY9dQ2FIkipS8zigxagVzAhRCszOQ8/XWUcrgF4O/jSmL1Ya2lBXcCrOQ39EGxI4oCEcLSBeZr2sofbxa7l2JAI2fDBlKEbyB2u7Wlk/Icd3TDzJd+gLPrgIg+Rxf4hJu7SeJvpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743607679; c=relaxed/simple;
	bh=84wxmOUuZguUPHRF2Z+/DPs+bRzIW2iV+gP7Vzph/AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DGZR/95yF+vBQlY/LDvNNFKUm5FAt6WneVFhmfVyVqPqSs96/xORz7kQ63m8Zva0iSh+X1YzAaBzdzpQNSWYmLGLt0eui3kbFeZu9BEwCQNtldhRBjmwHslhlntpSxmaR45jgEUFJExW2h3ACSVGWI7N8vR0bAJGejSdjsNB4EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=irXtTpNe; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="irXtTpNe"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso1364871a91.1;
        Wed, 02 Apr 2025 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743607677; x=1744212477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84wxmOUuZguUPHRF2Z+/DPs+bRzIW2iV+gP7Vzph/AE=;
        b=irXtTpNeG+aQ0j8bRJdbcftD4NXuArDAib5qutyV4sgUKk7/3/lQ6YJCKivSiPJa9S
         qA0YSjFb6L3lvc+MYM1Ma/bNd4HLrclY0QEpo/MRd/dsEeKcRmnYJJZWQa5BZF9s396C
         th3QJD8LJFDOk9Hku36iZzbs3KaPU3lE1PTL68tGft5UKDu/0yL0W9/AYRaFBRfo+ygV
         7Yve7NY7FUXKlwiYWzR/Sh4jDQAxwVxlzPopRnLL+kC1UX1+f0V7zmMWvbj7pCiMMgE+
         BlB3h+LXPb804fY9cFFs1FprrZA5s+gC1Q+ChIFGNFBl6H85gBom0C74qKCCjBIQ6/HS
         rsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743607677; x=1744212477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84wxmOUuZguUPHRF2Z+/DPs+bRzIW2iV+gP7Vzph/AE=;
        b=B3RnXckP/vkY2BryAt2m7TMGAvk4/3Y68meHc7LGHPGisvMExne8S4BbJ1QXQYILb5
         AfGe8KRcWOpJfz3ZdeFuP4wuGtK4djzYB1ZDCiP3bh6PLyKf1TNDhxDKrqcLPyUfYp6+
         S1Ro5FSpFmjYMUk/AUJCPP2r9WET7fFA6KuRe+eT+Yzo9F0g0XrPb3uKcqb9qyKWuVX3
         oALpAlokekCCp1S8HKVz9OzLSk8QVQS9J88XnGQ+uGC+MR98kJTUe81NHdpccPlQ33oQ
         5FC0vY/PzhMb6Z2p+OiKGaTNa6ZazlIyAz47STob38ilA25v5oCbNCuq3Pn39SMM/xXg
         Xn0w==
X-Forwarded-Encrypted: i=1; AJvYcCV57gLl6zKXTfRbWWbOn7uh65F3NSHRrTGkfFYD+Ca1KHDfo/jzExa7tptnB92R4IUfMFezR169BhSPpCM=@vger.kernel.org, AJvYcCVZGJqZ5LkD0VxUjrY4E0zJ2CbCys6innNF56t+dSVfOqyeqgarhelI3x4yReu14/t/wDCUe8mw5fYN0FKTAUc=@vger.kernel.org
X-Gm-Message-State: AOJu0YylnAzWShVsb3ATlJITp9SIf7MZq0N6Ip89FocndryQj1oEET/1
	+H51cojci0W7/+mEL5lecwrmjHAAindex882SmaBV5iUP6zOpiCqN+SPUeIB58/GS7rC7F5N5T9
	ZAXvZaavQaQxVAfaPdvd500R4mpQ=
X-Gm-Gg: ASbGncthVB+nQrV65BQGAJLDHEBwRbTV2R0ngy8yvvnfkwH9VnCNyXPtUiZb7Wlq9jL
	lepTdUXoZOjf+NlvyyHXRMrH00VHCrPWRLSeAsoYtkP66ZDlMgkPq0W2PJZurVxrsyfnxtQZoeT
	BKAbz5DWQqV/e4FUw1+oCpDizptg==
X-Google-Smtp-Source: AGHT+IFgu8WJu4ETgzkoPIm09BkqQZYs+/o4m6q+OoOBxfa6QeCI+cNBBW7zBSkFSqOaR/bzrCPSWdOOUKW+krWRqlY=
X-Received: by 2002:a17:90b:4ad2:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-30562e636b7mr3562139a91.3.1743607677054; Wed, 02 Apr 2025
 08:27:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401221205.52381-1-ojeda@kernel.org> <D8VPGBN60E61.1Z48FQW6TL3A@proton.me>
 <CANiq72mdvnHvWbVNQbiXSRxd1xrF+A=v0RdJO74xeY3HyhRmcg@mail.gmail.com> <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
In-Reply-To: <CAJ-ks9nAAcoJoFF+qNPbhsM32kOh9u+LGYUwFN_n9qqudB6YhA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Apr 2025 17:27:43 +0200
X-Gm-Features: AQ5f1JoRtbxlEpwdukshR1-PkgSkh2vofg1jzjX7AuGCKpYamwkZP-wPM1fWZQo
Message-ID: <CANiq72k36Tvwbzkg6nRdxB8VNRHLf8QzLeCXZq7sEPewccsWNw@mail.gmail.com>
Subject: Re: [PATCH] rust: clean Rust 1.86.0 new `clippy::needless_continue` cases
To: Tamir Duberstein <tamird@gmail.com>
Cc: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 3:59=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Rather than disabling globally, why not `#[expect]` these instances
> with a reason?

That is an option sometimes, yeah, but in this case, writing those
lines is also a burden -- one that is, I would say, worse than just
using `()`.

It would also need to be `allow` here, not `expect`, because older
versions do not complain, which makes it even worse...

So it is all about what a lint gives us in exchange of those false
positives, and about how much time people would need to spend on it. I
have always supported adding lints (I think I added this one, long
ago, in fact), but I don't want that we overdo it either, so I am
happy disabling it if it is going to be too painful.

Cheers,
Miguel
