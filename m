Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828E292921;
	Tue, 15 Apr 2025 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721193; cv=none; b=VYWGeF2mUkhUU9RKOspj2UzTn7JrTYLLJREwXCs3O5CjurbicULbFjgm8QEeoRJn7VE+iZVfuuRHqMH/6gCn5Xsw625UK9aG2mbnhxVtxoLbR3q6zt2Oswccs9gBg10OXUlvldOAnXwQ+HzwuP1LC2zFNZS8+rPVDzG8AdIvekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721193; c=relaxed/simple;
	bh=+PPvXQGkXkgSiXGkMLXfpaE8M/+AqsEn0JPtAbELTQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ITMpNTbRlEPW91FqtuJJuexO9yqBgnFN7nXhGIxLI5MofFuJLvwpfwuBkqUMbVz9VKn8fbmhLXGjFJUhqmmsfe/X7EpwovB8XIzV9Rw8wipCuWwvh7uYrLfAsYEfUPODCHud2IxJwxinO8chhTltElvUlxCFhr6icSzQn7G8SNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrlkKnYT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrlkKnYT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1255FC4AF09;
	Tue, 15 Apr 2025 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744721193;
	bh=+PPvXQGkXkgSiXGkMLXfpaE8M/+AqsEn0JPtAbELTQE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZrlkKnYTmF8borcg3mEJGryqlU2cghpQRB6TY7ucEN0RZinWxWrJDaGeybg9gfjov
	 fRiS/x3J6sIu6zW3JiCmbeMHhxf1LW4jkDMY+6q7c/bz/DjSKH9KuByTNRWKK1w7cV
	 ZwWmF9B5wVf5eAlGoLtbH1HCfvCEPn7x8IR+wsNhLlM6W3ih2fz7m8/AyzaflPIi8J
	 WWIYOcDUvT5HqlvmXUMC/WhdBur6XNpQ7mVcrDIST6zN3C1lvxDPGJFJZIBOAkvb33
	 BHgwSwEE26heeZ15HEoLD9oGGnvQDgCkW3BdDOxV4KCtZVM2GcoA/vTZgIGCuybT3v
	 MQpGrfACT2w1w==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso10255834a12.0;
        Tue, 15 Apr 2025 05:46:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUA4P+ZN/HKiDvc28L0YeQICJ8sNCCVcoPk1CMGQ346zvOYGeS/VXYvmWma0CDtxQhz/fIYx0/qNsyT@vger.kernel.org, AJvYcCX1v6UBB6M2PttJlQ+GkldwpctX4P3zjgYdsZYugcWAG2LBQk0/wuGvJDKTDC+zfxBvrPcQVcJTbIf+3/YAFlQ=@vger.kernel.org, AJvYcCXPC6AoFE9fMKI4E8/kNmGyFVkewWGXT9XD1O6slTec7nroL2QhhGHq6jbRd8ViZMc9hU+Q0DiD7B2h54V6@vger.kernel.org
X-Gm-Message-State: AOJu0YxGajS6oQAUmeQTl4TSp8cTTU45uGR0w5FNLIQY56D2J4Y4Vowp
	/oCPvfhKXmpJFI9V7X1nMVsJEPEykt7Pqv5ekvRsq7a43Zsbrih9a6iNsVUUbaIpXgKG/Z9ictV
	lGv2tvgY7VT98owbHaaprd866tw==
X-Google-Smtp-Source: AGHT+IEwV9I04xQr2SBLjX/PImczcjqt7PwVOKeXiqIvpJe944fzS+0vFau10h18OQEDa7cAa5XMaWfcCIgr6RbdpYo=
X-Received: by 2002:a05:6402:3506:b0:5f0:9eb3:8e71 with SMTP id
 4fb4d7f45d1cf-5f37015b989mr15215855a12.27.1744721191419; Tue, 15 Apr 2025
 05:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326171411.590681-1-remo@buenzli.dev> <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev> <Z_1Jfs5DXD2vuzLj@cassiopeiae>
 <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev> <Z_4rVyUjK1dlnTsT@pollux> <D9760KMM0PSB.HONQ7MUG8OTN@buenzli.dev>
In-Reply-To: <D9760KMM0PSB.HONQ7MUG8OTN@buenzli.dev>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Apr 2025 07:46:19 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>
X-Gm-Features: ATxdqUG9P7iUtyNTDn0N2TNGX_7KFy-mnkt2txixBD2a833kXBUfKDMMmQxkdjI
Message-ID: <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 6:11=E2=80=AFAM Remo Senekowitsch <remo@buenzli.dev=
> wrote:
>
> On Tue Apr 15, 2025 at 11:48 AM CEST, Danilo Krummrich wrote:
> > On Tue, Apr 15, 2025 at 01:55:42AM +0200, Remo Senekowitsch wrote:
> >> On Mon Apr 14, 2025 at 7:44 PM CEST, Danilo Krummrich wrote:
> >> > On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:
> >> >> The device property API is a firmware agnostic API for reading
> >> >> properties from firmware (DT/ACPI) devices nodes and swnodes.
> >> >>
> >> >> While the C API takes a pointer to a caller allocated variable/buff=
er,
> >> >> the rust API is designed to return a value and can be used in struc=
t
> >> >> initialization. Rust generics are also utilized to support differen=
t
> >> >> types of properties where appropriate.
> >> >>
> >> >> The PropertyGuard is a way to force users to specify whether a prop=
erty
> >> >> is supposed to be required or not. This allows us to move error
> >> >> logging of missing required properties into core, preventing a lot =
of
> >> >> boilerplate in drivers.
> >> >
> >> > The patch adds a lot of thing, i.e.
> >> >   * implement PropertyInt
> >> >   * implement PropertyGuard
> >> >   * extend FwNode by a lot of functions
> >> >   * extend Device by some property functions
> >> >
> >> > I see that from v1 a lot of things have been squashed, likely becaus=
e there are
> >> > a few circular dependencies. Is there really no reasonable way to br=
eak this
> >> > down a bit?
> >>
> >> I was explicitly asked to do this in the previous thread[1].
> >
> > I'm well aware that you were asked to do so and that one reason was tha=
t
> > subsequent patches started deleting code that was added in previous one=
s
> > (hence my suspicion of circular dependencies and that splitting up thin=
gs might
> > not be super trivial).
> >
> >> I'm happy
> >> to invest time into organizing files and commits exactly the way peopl=
e
> >> want, but squashing and splitting the same commits back and forth
> >> between subsequent patch series is a waste of my time.
> >
> > I don't think you were asked to go back and forth, but whether you see =
a
> > reasonable way to break things down a bit, where "reasonable" means wit=
hout
> > deleting code that was just added.
>
> I was asked to squash two specific commits. The first was making the
> read method generic. That was the one that deleted much code. Totally
> reasonable, and the generic stuff might be discarded anyway, so I won't
> be moving stuff back and forth.
>
> However, the second commit was the one introducing PropertyGuard. That
> was a beautifully atomic commit, no circular dependencies in sight. If
> this commit is to be split up, one of the smaller ones would without
> doubt look exactly the same as the one before. I provided a link[1]
> to the exact email telling me to squash that exact patch to avoid any
> confusion.

Adding PropertyGuard changes the API. I don't think it makes sense to
review the API without it and then again with it.

It might be reasonable to split adding the fwnode bindings and then
the Device version. But those are in separate files anyway, so it's
not really making review easier.

> >> Do reviewers not typically read the review comments of others as well?
> >
> > I think mostly they do, but maintainers and reviewers are rather busy p=
eople.
> > So, I don't think you can expect everyone to follow every thread, espec=
ially
> > when they get lengthy.

Please understand maintainers are reviewing 10s to 100s of patches a
week. I don't necessarily remember my own comments from last week.

> >> What can I do to avoid this situation and make progress instead of
> >> running in circles?
> >
> > I suggest to investigate whether it can be split it up in a reasonable =
way and
> > subsequently answer the question.
>
> The point is that I agree with you that the PropertyGuard patch can be
> split out. And possibly more: I think a reasonable person could make a
> separate commit for every `property_read_<type>` method. And I'm happy
> to do that if it's the way to go.  But if I do that, send a v3 and then
> someone else asks me to squash it again (because they didn't read this
> exchange between you and me...) then I would've wasted my time.

A commit per method really seems excessive to me. I prefer to look at
the API as a whole, and to do that with separate patches only makes
that harder.

A reasonable split here is possibly splitting the fwnode and the
Device versions of the API. In any case, I think we've discussed this
enough and I don't care to discuss it more, so whatever reasonable
split you come up with is fine with me.

> > With your contribution you attempt to add a rather large portion of pre=
tty core
> > code. This isn't an easy task and quite some discussion is totally expe=
cted;
> > please don't get frustrated, the series goes pretty well. :)
>
> I'm trying, but I can't say I have a good first impression of doing
> code review over a mailing list. Doing open-heart surgery with a
> pickfork and writing documents in Microsoft Word both seem like more
> productive and enjoyable activities to me.

Mailing lists are a good scapegoat, but you can have 2 reviewers with
2 different opinions anywhere. That's just the nature of a large,
distributed project with lots of reviewers.

Rob
