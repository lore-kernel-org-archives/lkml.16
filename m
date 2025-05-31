Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177A61531E3;
	Sat, 31 May 2025 15:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748705345; cv=none; b=jfzsecN4cJ5iVgPS3p3au5RCxnPa9gfc/K9fPART9CvIjDHVs7swDRiCZnHIOngkNVHk4ggW35EBKq6jAMU/Vnm0NqzkBOsKTmyLYOguM6JS90Qtl3O7FM1IWwSorWpuSR3UmlPe2UxWohYbF7l4gWhuyTbDbQm8JPxvNfpGYo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748705345; c=relaxed/simple;
	bh=spupGMDpZclgrfVrT7R3JNeLbM5FYVyG+Lxyt87Ekwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mxGlvzL84/5SAEwCoX1MeAqDG8udJuoazRJP8PTJdpVR2PGAEW4BNIj4qKtqbgpEJck4TGpcw6wEGeATCmQtzVGSEBfSOPR9COgs13IxmIt5PzusYa6A1IDRVT7Rbu6sTxoLmfUyoQjFe78dnTA+me3jnFG+7MhCKIGTel1lmxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RM2tHDor; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RM2tHDor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C1FC4CEEE;
	Sat, 31 May 2025 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748705345;
	bh=spupGMDpZclgrfVrT7R3JNeLbM5FYVyG+Lxyt87Ekwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RM2tHDorFEehNFssgvcklF/+Xy5dj3KWqbgNaIU6SBBlWgjd+ff95OeVPVjMBW2mc
	 sha0oYGmOnVd2yZUXvOPvkGGPD6WbVV0pny55PaBUxb/CfCEDgkV/qDwtPbEnvQ23u
	 Uh713RPIeqszcdzeCrJPxWL+slW9vsW4vbsZ4hgETWyBb15M9Pf0r1yrTlveX1YFDl
	 dTmx6fKLHjCqIAc2dFEHKoFZVnilzIIdXfUvraodvv7T+uKwsR2zsTBA8by8PQigu4
	 28VA4ujWZQQ9g3jO+R2tb4VOXlMp+5Svy/c6bpEtq2eTEahX+58lYj7WgocZvOSy9Y
	 wSzemaga7ln3A==
Date: Sat, 31 May 2025 17:28:59 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Timur Tabi <timur@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <aDsgO3mq9aJwe3XF@pollux>
References: <2025053047-theology-unsaid-d6ac@gregkh>
 <DA9AU3OBT29Z.3CX827C91I3IH@nvidia.com>
 <2025053050-maggot-landfall-d5eb@gregkh>
 <DA9KIGDH4IF6.2T383ZVLTJN0G@nvidia.com>
 <2025053039-reselect-thinness-e0a2@gregkh>
 <CAOZdJXVvmDro0Mv36grqQ6LB_1O5GzwPx+Dde+wsfu9Cu_me7A@mail.gmail.com>
 <2025053148-gore-badass-1d1d@gregkh>
 <CAOZdJXVSByiwGWusdajdTVma2aC3ibZtSz9XBpRy4MJrKuxfvw@mail.gmail.com>
 <2025053109-flatterer-error-7432@gregkh>
 <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOZdJXU1ftLfem40v82NJp3S0WqZoMbqYrqQMw4vZEUbpa6Uag@mail.gmail.com>

On Sat, May 31, 2025 at 09:38:24AM -0500, Timur Tabi wrote:
> On Sat, May 31, 2025 at 7:25 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > What exactly do you mean by this?  That is what I have been asking, what
> > is the specific reason why this can't be done in userspace?  What
> > hardware "thing" can't be read by userspace, and why not?  Userspace has
> > access to PCI devices directly, surely there is nothing "secret" here.
> 
> Why in the world would you want user space to read hardware registers,
> when the driver is already doing it???????

You're probably talking past each other; maybe Greg was thinking of information
that is also accessible via sysfs, e.g. configuration space registers, etc.

Anyways, I also suggest to take a step back and write up a few lines that
provide a slightly broader context how that process of loading the firmware
works and what the technical requirements are.

It feels like the discussion is missing a common understanding of what are the
exact problems that should be solved here -- let's get this common understanding
first and then let's figure out if the idea of parsing the full ELF image is the
correct solution, is part of the correct solution or whether it can be solved
differently as well.

--

Like I mentioned previously, there's no need to make this discussion a blocker
for progressing nova-core. If we have to, I'm fine to apply the required code
in nova-core in the meantime.

But at the same time I also want to make sure that we discussed this - with a
common understanding of the problem - and find consensus on what's the correct
thing to solve this properly.
