Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58182DC78E;
	Thu,  1 May 2025 10:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746093651; cv=none; b=FVQlajqWmfVqTaoY98Je+8z430MO2ShopS43WmQoRlzVvEOFGx6dd2bbBSZkVbvvNLJ5ISVWFUnloA++IZYCZGhfQV6yLQLwIlH/UfiRo/fvWO7pbDnQ+QTMlfGiU2iAJbC4kxjTj9tJ0DGIlR3UPhx6sV/EKhIqg/Ja3Wn3VmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746093651; c=relaxed/simple;
	bh=A2/tYQBZY1Z3uPg6ctYYIbPoFZIQJ6KqDCrjuG7/KAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVWoXCPu5h+g2dwFJgk5L5TqqxEmIm9nQwAOJrt3CRnp45x+39CG6QnImp3jVPqA4TJMqKkf1dh1IuEOlNHb5BnfcrtuUmEw+oJq7rtaODWFymNokeQVzXU6Sy9c16/908Ji8DGkS/U0ouCA/8DmDkmsQPNapv2ft98TBevEvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NkI/nWXa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkI/nWXa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-227c7e4d5feso1579415ad.2;
        Thu, 01 May 2025 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746093649; x=1746698449; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYd47t4gUtgZAEpPyFJEBYLZ3qfrinyM/AUCXFp30k8=;
        b=NkI/nWXaTKCV/SeWbZk+Yk6rvX0ZKXpO+7cN4iVgmOcWCT9rgwz1U+bnECoSv7X9pf
         J8deKP0TedO0FlfAxqlwOY7ZqCwDV6sytbNXV278vqpCSzR0/WRpcdBS70lt75ewtuln
         7KAEUzWQAPw+1/ZMUuxe35m9bXuw2iyvspoiFxIx/M+HLo3eBv6cHiTxOVsT2wBdUi4K
         fzjI0Oq4eDL0dxXBsShD2/EbLXSWpLlHcHdkhZ5wL5CAGV07P8ILadcYpGqAPDV4LbYI
         PKfOFSDS5zJnnNgnXZrMknK57MPKU5ntN2BMJPcmAJ8P6afXpOnkpMVMjWxhSl4TKe3q
         iO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746093649; x=1746698449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYd47t4gUtgZAEpPyFJEBYLZ3qfrinyM/AUCXFp30k8=;
        b=VgYm1A3N5Ig+nWlJA1JhY6k6l+x8jsNXDP1+UzusQ3OQcHC4xHBLN0aXACDn7XEL16
         dVavlxpS2olKgpstEdr3dO5wEIpIAxI4tMiyn+PnCmzcFK3mjzhevLjs5Izbvo9/5vjR
         lwRH0VkiqPZyafQXEEe67OclqnMJ8nNgRyEzCza1FaN4/uZbsO4tjqRaMDkIB/T0nAad
         Tn45HzvbTG+dEyiqcI1tIFCGYl/5kjmCytciPWgmhY14j2p0nz88SHg2fIRaQA8krMZr
         M5mfbB1pGQ8EkvkKuWTVo8H+zwYMrXnH6Mt2U/+FzgK9b/l84ZODy8oJP3j4pIi+rzwk
         erzg==
X-Forwarded-Encrypted: i=1; AJvYcCUld98NsIzNZ8SdkdniFN0O5S9QYAvSRgogQgA1e0eJqPjJSXPyXeuLDywsegkfbOeW7/yUZ7JltV5nrVeeYPE=@vger.kernel.org, AJvYcCUmwbzX1sT3JlN4rJ0JbeP4uRisDPzef2OXvtemQKX9zzPeEKSjuazQqv8gAXjjFAY1gMmgMmcGsx7BJdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbOsf0KpINvZgX8qB/GA6SYB2hh8vZlJpHRyCyRBNasEBmXPIC
	5nEV3N1SjTQ90IVICD3uALksBGHig6jP0bXNyk/lP7yRVqPJh72K4jrOjuGtbb8JoMXIkFX+5S7
	ucFLQKhOKI1pvN6iVYlNOBmWTjX0=
X-Gm-Gg: ASbGncuO9Wbm7xbLP9mTgTZEivwNCSLcIf59Ez1t0ICHIwtZyEdu2fkxBmQ/hUJH16F
	egWbk8LEByJI1H9UnzUkPlCf1TPZCg177tTVi2+B65zPglv6PwlTmSxnGRu6cT7tIb+2NndJmJ/
	frCzfUiHyxz8WI5hUuUA1ucQ==
X-Google-Smtp-Source: AGHT+IFwguHcR8tQBbYtnPIlB9QnWc+bW5pF8LXM/EEbWC88+f1AI898M/1iUA64HX15LkFSIwFHE1TMP0hP9pf9+4I=
X-Received: by 2002:a17:902:c94e:b0:224:1936:698a with SMTP id
 d9443c01a7336-22e00cc026cmr20951245ad.5.1746093648821; Thu, 01 May 2025
 03:00:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com> <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>
In-Reply-To: <20250430-debugfs-rust-v2-1-2e8d3985812b@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 May 2025 12:00:36 +0200
X-Gm-Features: ATxdqUEXxhXQ6AFlFxbNBm4xvnMYu__JxbkT187AjW-JFOw0SWgwNEbPbSps1UQ
Message-ID: <CANiq72mm5Anx+MPc15Qunq3ewdmQQjkzNTcV7rx78z9UniT9CQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] rust: debugfs: Bind DebugFS directory creation
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:32=E2=80=AFAM Matthew Maurer <mmaurer@google.com> =
wrote:
>
> +// INVARIANT: The wrapped pointer will always be NULL, an error, or an o=
wned DebugFS `dentry`

We do it the other way around, i.e. `# Invariants` section for the
type, and `// INVARIANT: ...` comments for the places that ensure the
type invariant.

+    ///    // parent exists in DebugFS here.

Parent ...

> +        // * If parent is None, parent accepts null pointers to mean cre=
ate at root
> +        // * If parent is Some, parent accepts live dentry debugfs point=
ers

`None`, `Some` (also please end sentences with periods)

> +    /// Returns the pointer representation of the DebugFS directory.
> +    ///
> +    /// # Invariant
> +    ///
> +    /// The value returned from this function will always be an error co=
de, NUL, or a live DebugFS

Hmm... so far we use `# Invariants` only for types. Perhaps you could
say something like "Thanks to the type invariant, the return value
will always be ..."

`NULL`?

Thanks!

Cheers,
Miguel
