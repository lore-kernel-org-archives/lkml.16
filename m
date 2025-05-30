Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF371A2396;
	Fri, 30 May 2025 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748628690; cv=none; b=CXJJbGCwM/ADQJ1Q41vfnCyNHJv9Mx3h1hk1dlLXIaXuS4+leSscyJ/ze75DNEtOQ/Kcx5cjCYZNNM9i4t0Jyslmc3aQNjHwz9R7fZlv1TVcgGz92S4wJW9TNow9OKe60/qvdOlkqprjjD7T18jZxfkS5mL3vAkJBMoR9Wl9Dso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748628690; c=relaxed/simple;
	bh=NEnMQhjpyyHfnxzzO/PlX+P6PqzER8qKWzoOIliQ66E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R8Iw0NdfkxvAH5vHHWAeJQlvxlqz/OLKbXOSMFD4zrP5s4Lw1+BNk45veY7UFk/cXVZakXCAz+SmkMVO89E2+1oqgnrmKuhemI7eoUQeMVPStr5yP4RWPB3a/+9/SuqOXHQBRw0asNcggQfMgrapU5ebwsd17ocwtBDVKZGst04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0v1AXR7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0v1AXR7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3FAC4CEEE;
	Fri, 30 May 2025 18:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748628689;
	bh=NEnMQhjpyyHfnxzzO/PlX+P6PqzER8qKWzoOIliQ66E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H0v1AXR7I9wn7+zzuJY0/KK/n0ihbHDR9DYU7gCQuc2xU7JcJIeP1vE6xyDVy/0gw
	 0nxJb7uYpSvOiSyExZy6rbDerrJiyhpXgxRrmfDhABKqRzZOwH46wn4Q8/cnGT/bM5
	 sGsOALyCvYkbwDbwUhBAiymL39K1eAHniYeDNv/z0+ILVKkryzEr8CTp4E9hUktlMc
	 JMiiTUS3EpK1k/pe6nXPfpuhmuOD3PwMTdFy8Wyiuh3j5w1WJ931e0Ti+KcnDoWyu2
	 9z+nLV0agsvIZklVEgeUYULJnHNerFnMd/bSDEq23jPrLV/Ex6JmXajeHr1dBHw5QS
	 UPki0XuEBVp1w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so4607344a12.3;
        Fri, 30 May 2025 11:11:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUAslONXbcFRgR5eNAfL0mzYo6s+a+TTTGyxtVInvPzJQ8eHqudKZg05qHP1GPgYd+Tu+lyOvn4yIl+QRA=@vger.kernel.org, AJvYcCUNRBcTlPOqfAnPNXNt7zN9QpLlDu6gMFcIC/8/zBMlpYwbY8KTYQjeu9+XO+a6e2zlrCdp5nin31Od0aq8jeU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi01xAN5RuQYcXFgQQJzCk5IH8l1QZbjxDFAtTGoJbjfk5tVNi
	9popN8bNqc3s0/e78n+hlYDhgcDylZXUdoGDUrHtDq82Fae/cFWaSPHXacXTpKLqYDEc4UVBk8b
	/w0vsh0Ii3Vp7KkU8bZ6WLDHrFMn9OGg=
X-Google-Smtp-Source: AGHT+IHMIdbep/NDuys/wofm6QP2rT68gpDJiCcWgJ8T5h4FuiduxKTspFC7xNrld8F88bBZkvWbhbBCIC4XV5VTbUM=
X-Received: by 2002:a17:907:d89:b0:adb:2577:c0c5 with SMTP id
 a640c23a62f3a-adb36be1133mr349200366b.38.1748628687973; Fri, 30 May 2025
 11:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com> <CAOZdJXW+PoFgxH+wPEum-kYvRmSRd8c4kaxvbNAq5dfZJiXapA@mail.gmail.com>
 <D9Y0VJKOAQAY.2GJSAZ5II54VV@nvidia.com> <DA8G3G918FS4.X8D7PQMT4TGB@nvidia.com>
 <2025052932-pyramid-unvisited-68f7@gregkh> <DA935OIFBM1H.3CMSHQ46LLG4P@nvidia.com>
 <2025053047-theology-unsaid-d6ac@gregkh> <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh> <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
In-Reply-To: <2025053039-reselect-thinness-e0a2@gregkh>
From: Timur Tabi <timur@kernel.org>
Date: Fri, 30 May 2025 13:10:50 -0500
X-Gmail-Original-Message-ID: <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
X-Gm-Features: AX0GCFv5S9KtBIywcHff8MbdGQAdMVSxN9c9yC4X5MRuNIIOEn1F1ztLMow72Jc
Message-ID: <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, Timur Tabi <timur@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 30, 2025 at 10:42=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Fri, May 30, 2025 at 11:34:02PM +0900, Alexandre Courbot wrote:
> > So to try to answer your question, I am not disagreeing that userspace
> > is capable of doing what we currently do in the kernel. My follow-up
> > questions to that are: how do we command userspace to do that work for
> > us when we request the firmware, how do we provide the result to the
> > kernel, and is this something that distros can adopt easily? I'm happy
> > to consider doing things this way, but would need a few pointers to loo=
k
> > into.
>
> Again, look at how your firmware for your devices in your laptop are
> loaded today.

Today, Nouveau loads and parses these binary images (that are already
in linux-firmware) in the driver.  As I said before, Nova/Nouveau are
using ELF simply as a packaging format, so that these small binary
blobs are kept together and processed as one.  It makes no sense for
Nouveau to consume them as-is, but Nova has to have user-space break
them up first.

We could easily have said that the format is proprietary and not used
the word "elf" in the parser.

IMHO, Nova should really do what Nouveau does, and just have the image
parser in the driver itself, without any generic Rust code to do it.
After all, what Nova needs to do with these images is driver-specific.
