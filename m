Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CBC29D0E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746026142; cv=none; b=CGFVpwmScqjWg67yuGLP6Bz/1mEu2uNePdABy8Kxm68Odr9HtYtf4BcmjT2+U1FkpKdq+KMtHtUrzd7WYPYYcJEYzuxU9MV2Gew+4CqbZ0uVYH7FQM7Rjzec/4RFuJ54X95yJm6ZARCPVYjVZAPHt199jV9H5B/sIvwGNPY/NfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746026142; c=relaxed/simple;
	bh=Hhu6dSisAhS1fMzmQCWhcynvWoTnaQWM5JzsgauEqV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ob+x1Y7MN41tl05naelpIoBWD0LKmV8t+usmQZo5CgX9r9dAtxyQnisqI85iAju0mT9PwHVvGi6s/RVLNqL2vb5YaNWC2FadQhS7Z5ClrYiHxYkgLxxFRXovBOPAuBjmbsD1jnLHq1sFxk8zxwNUMELj7tCWV91T/Z4nyYVdYQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EmdLc6xS; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EmdLc6xS"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47e9fea29easo410741cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746026140; x=1746630940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKZ2dgbW06WSeLilefp4vu6PuAs8SnEk6bEC5IxyYL8=;
        b=EmdLc6xSirYSLDpce3Sqx6twB38aVFKWT06uqyj3xRHpDDpxmzsbwlXEaOTvqgUC29
         3nOj7bIBzSpqxA8W3M3RCbqVE2fCPyeR3AEqDTpOCnwJlfWw53dwABKACLPeQi9Xnj61
         mfR2Brt90NURoDoEtCERxVpspyo5YVejCUndm4UgMQVsLgKsfIj8cjPk7Fl4sCDB4IXW
         8J2hn7iGIXYqV8WIuseAOp0pNMwhtmlQkkAAF7iO8hOTnoXnPSsx5I7/ZydClL0Ml1og
         oMI069FJulp6M5T+FbhaoqIwKFgwdsgvwUjvu3yG2kiVldoHnPleNf3rGzJHs1REm1TI
         moPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026140; x=1746630940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pKZ2dgbW06WSeLilefp4vu6PuAs8SnEk6bEC5IxyYL8=;
        b=exRQOe6Bn9STOD4yUbiQ1YFn3d8eVGHH1TJgH5JOoxRTXUEKRNLTejIuIb8LxzsTRQ
         teMr4skDTXUSWhEzdGZ53VY/Ynhr4/pOVwE5GaXIKXu77+dE9f8vFk9J0DrxADOsldc1
         tNUpLzWj8zsng/UDurLloKY92qwzWZC8LUwZZVdptSl9SK38JVDiu35L3U4BIZkATqf7
         zegWXz0Zy6SDcS3uOEK1e1j2q2ZbSdl9qig/S1wyu1dilU0xUEhPRQWs4EhRbwyYxRfU
         CyOwaHAHvx/166sT63SgakLe0+85TE9cdeHc5i7YIfoxnXPFuZVswK9WG64mXzMuUqz9
         Df7g==
X-Forwarded-Encrypted: i=1; AJvYcCUO87EMfQs6kKIfBR33qfme8d0iyw/9+pGLQx9IB+K96pFUOB2XGqPFCOAnRlgxWrN9FWahwwiJeLZBXOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyMdPxF+nzyXPajZ54KPFoZ3Cid7T77YDV2EIRvBZ5TDlmNvz4
	/+FoUKO2+6JLCkeyKt3UKXxhCLGoXA59cvAGJ/sxgIMrXWcf0tP8+ETLfTUyWFtNAEraVO2K9WL
	zWqly8s0XaaN9LQm07vKP3WMqT1v4hfmJ8iD3
X-Gm-Gg: ASbGncut8lMAzmvS/sXff/pRYpAqW344zKhxXMD6bHpvV9HHtmWnLLy1rOn6uwOWAMx
	1vB8xSzhLpmIKSCaDnfrJ99IWrzzXPe3ewjzdKmTTGfy9yA8Jsqf/ScQjkbO0bIaiAe9bj7JtcM
	YpOj06c9TmJPM2gWKaUUoXBB0cpqCa+tH1Sfal5mzbH9aFJW6mhLc=
X-Google-Smtp-Source: AGHT+IEoUkk6NKnGA1wS8/Jh+KADxLx+/EOtFqYZsYHaH0GJgf4iKBkzrp0jMFygx69hC2OqTpumcDjb9StelgW26VU=
X-Received: by 2002:a05:622a:1349:b0:477:c4f:ee58 with SMTP id
 d75a77b69052e-489bb1907d4mr5141791cf.24.1746026139801; Wed, 30 Apr 2025
 08:15:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
 <20250429-debugfs-rust-v1-2-6b6e7cb7929f@google.com> <2025043053-spelling-rehire-a460@gregkh>
In-Reply-To: <2025043053-spelling-rehire-a460@gregkh>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 30 Apr 2025 08:15:27 -0700
X-Gm-Features: ATxdqUHr6aQwTUil5JRuLfNwReWGfKZFCaQxAfML745WvIwQy_JozQ2ZpcZtmGI
Message-ID: <CAGSQo01PneAee+C6FijhmW_sJt-H_Br5SfWR3NGWyfwk7vr7sA@mail.gmail.com>
Subject: Re: [PATCH 2/8] rust: debugfs: Bind file creation for long-lived Display
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 5:06=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 29, 2025 at 11:15:56PM +0000, Matthew Maurer wrote:
> > Allows creation of files for references that live forever and lack
> > metadata through the `Display` implementation.
>
> What do you mean "live forever"?  There's always a structure somewhere
> that holds it, when it goes away the file/directory should also go away.

That's the builder implementation I mentioned later - it lets you
connect the directory to a resource. This is an initial simpler
version to keep the patches small which lets you export e.g. the
contents of global variables safely.

>
> > The reference must live forever because the corresponding file is
> > reference counted, so there's no way to say the lifetime outlives it
> > otherwise. This restriction will be relaxed later in the series through
> > use of `debugfs_remove`.
>
> Why not use that from the beginning?

Because that requires the builder API + pinning, which I thought would
be a more complex conversation, and wanted to keep the "just register
a file" patch separate from the "here's how you ensure that data lives
at least as long as the debugfs directory" patch.

>
> > The `Display` implementation is used because `seq_printf` needs to rout=
e
> > through `%pA`, which in turn routes through Arguments. A more generic
> > API is provided later in the series.
>
> Building stuff up to review only to remove it later makes it harder to
> review :)

It doesn't really get removed - `display_file_raw` is still the
underlying implementation for the more generic API, and this API stays
around as a convenience API.

>
> thanks,
>
> greg k-h
