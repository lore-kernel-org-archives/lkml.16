Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE6E19D881;
	Fri,  7 Feb 2025 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738951934; cv=none; b=P+OH0P4oYpXSzJzJHMoU5lF5M38SnptsAlpeavaSofMUOwPH37kdlpot0F7IwAOuK1r1CwSYcuVqbZ1+HkTqYSsiVVwLtcibUm4j/ShL5DdlWTeQu/qpwweDk2OeFowvLph0+DaS+hA059Gz3yWRrHxBFw2MPVPD0MLHAX2fevs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738951934; c=relaxed/simple;
	bh=UL16UHiG9e0z6Z65WXvRnZgcXrZJQ9t9AhuMsAVqixw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eyp88WYauZR4FFXTgZZKwXvL9k8Yn91AZbrQcONttlKiDwvbroZOenHfFqgcvXa8ojbZAmQ4Z+OjJio/N5S5UKt7dKehLNoqGnxb14Cmmllup2aOYcaYzAZTq2JTECjOW2TXDWoPYF2ZsjK7NLGPSAd1N4HqN9tkF+WxsImujGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MyuMvyXn; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MyuMvyXn"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fa0f70bfecso441935a91.2;
        Fri, 07 Feb 2025 10:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738951932; x=1739556732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vbY/PBwholOF2JDy4WiiL6Wp/4TxznWfUWc4NV54Qto=;
        b=MyuMvyXncYHIpVmGHY6OGggpBRIeFHhEp8Ko1RdFNy9xAC6//g8NBkUyJXYHtuty76
         53xJUG/PAF6TRPOWYzo/zqT7XR0znpSmwrra6BiGavwyKcYdpzTBEQW8z/rg31jp214s
         YLBZKBq7YDXLz6nhZu69JlYcTe4f+bnI4GnoMSQKQZEjko6jpkEI6nqjfGtQeGf20BDL
         k+JnK9wzuERFDCzRvFFjdJjKypc+7udjAoyGDO0a4SnV844g7cmNMIr8+ywNXGF8+MYn
         EcrZ60G9AquLpt+8tw6IUi4cwtPuyuCL/ZNUbBEgNlLYEXUftZdgNDJDvB1nXSPlXpT6
         6hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951932; x=1739556732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbY/PBwholOF2JDy4WiiL6Wp/4TxznWfUWc4NV54Qto=;
        b=v3w9z3gc/aEUpM6NREZUDZx+fJmVtKmd5N2m9n1QCsfMFYJ0AOlt95rs9onEiiOj11
         BdkRTqwxmFOoJNoTCOmrEygsqnMtEsZgCyGnrvRa5qq+aAHdWpJdsEpCtrseJlhyZ7C2
         kSQMlUE/U03KbsIbhpzviBIsJULf8YBWFF6tUf7VjjQBPiSSof3Ysdkg29EIqLUUqDpS
         ahhsYC5Y6MVLGpb1qbbqk/m2gR52chKbZYoF/wkDJTRWe7AXRs9GgDmdUC8hhGPT0/X+
         RWKDnQDEHfesnV+g37bhtxOJGSxZF8LcDoIBrRRtknIUEmhNn5bFqdNbulhv7tSLPCT3
         igGw==
X-Forwarded-Encrypted: i=1; AJvYcCVTeGhiuvAnRY5K0ZUHAGzHBfVZm5StfT2xwAb26pBhx2duDw9pHWwlIY1Vq6tSr01Pis1k+9DggXuZOT8Ig2I=@vger.kernel.org, AJvYcCXIr1gUogqX4N01LmqD1dr1SobenfO/4fxCAUxiGoP098RYxFHsRLoMeY5KacWHTkIaRXI9xB70utWgFxA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwagrQyJ96JumBJs1YULRmOXUjjPwae3m/Ic2ezfEyZ9cDRB0v4
	9FeZ3Mc/hJbBkEOfjd76BrhEDeFV9jw0+3fxj7PVlWZ4CMvTFmGqxeP+D+tx9y4TdNpVXAnRfXn
	s6hTzhG6Oj2cILDo5XgXWf+ADDxA=
X-Gm-Gg: ASbGncvCHo69BZHSzPvAdztFl/jw4VwiL9ziZ1hYVgnFOYmMSXY/TzZJUuFzpPGvElT
	nk6mp0TQGTrjove/SOk6GdVuf61k143iK6RLERZh9rKOzEOV2W+zPVXCBg/r2Q3QNQIWcVULzaA
	==
X-Google-Smtp-Source: AGHT+IHRZhFO+dqftqZaKRb94T0kV4Q38yZSGjM5KyjbUJvVwLtackKzJpYRfPC0JLLi7Tq4FvPz3Wx58XNvcvrLijQ=
X-Received: by 2002:a17:90b:38c3:b0:2f4:f7f8:f70b with SMTP id
 98e67ed59e1d1-2fa24544c36mr2561500a91.5.1738951932397; Fri, 07 Feb 2025
 10:12:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com> <20250207-macros-section-v1-1-8f018cb05a20@gmail.com>
In-Reply-To: <20250207-macros-section-v1-1-8f018cb05a20@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Feb 2025 19:12:00 +0100
X-Gm-Features: AWEUYZm1Btnc79nYuOdqDCxOXgK4yrleEaA31HAaHN3M6SoV4x-ONmx55mJ9mVI
Message-ID: <CANiq72=Hgqt4jPGw_pXmReWaVXWUZm8YofdqUeSde94apozhAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: macros: improve panic messages
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 6:22=E2=80=AFPM Tamir Duberstein <tamird@gmail.com> =
wrote:
>
> Include unexpected input on parsing failures.  This has the side effect
> of avoiding a spurious rust-analyzer warning:
>
>   Variable `None` should have snake_case name, e.g. `none`

Hmm... That should be solved independently, but sure.

In any case, how is this related to the second patch in the series?
i.e. do you need both to solve the macOS issue?

> +        let Some(token) =3D it.next() else {
> +            break;
> +        };
> +        match token {
> +            TokenTree::Punct(punct) =3D> assert_eq!(punct.as_char(), ','=
),
> +            token =3D> panic!("Expected ',' or end of array, got {}", to=
ken),

Do we want to shadow here?

Also, I think you could write `{token}`. Same above.

Could you please show how the new output would look like in the commit mess=
age?

Cheers,
Miguel
