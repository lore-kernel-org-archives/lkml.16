Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A717197A68;
	Wed,  5 Feb 2025 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772465; cv=none; b=ZsYcxtikoHJqwxIfjOv1uuVXPCnZ4oi3gomlLuQEYQV2HriIIIMsIg7J6G6mxo4HBr/0KLWW0KbEWwmh9pTJJtq2n89C8sNMvA+PcQ8xO8rbp48IRco4CMEvZf1YvXn9fjHmH9ElEJY3LbQkUVN8SjpyrWpe4UDto/q0XLn36w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772465; c=relaxed/simple;
	bh=bVtZ6k6KxStzvlvxAK3RKCr3g7nXKZiR7ZfOq4UnMBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/8GEx5qNcFdqKY+3ok9Ju9nEQGarqRGY2qAlot0qFbKW/h1Ls/OAQqa74u4ueLULZ56YV8oRkK1h9Gd67uwfbIPChYsBj97KocSl/S8AQ6rwhIJ26s9daFb9aN8QPYoRMuqfuoe7/bp5n45nFEDU6PRl7f2xoLKL+H3vzUrxrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwpRGHY/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwpRGHY/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B2FC4CED1;
	Wed,  5 Feb 2025 16:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738772464;
	bh=bVtZ6k6KxStzvlvxAK3RKCr3g7nXKZiR7ZfOq4UnMBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwpRGHY/u9bcHtadAkaxqmIPjDQ1jdQCblmVI3v8tFCDwKmhLX0ocA1peOqumPak1
	 aV886zx9kRQLBJLfmqTM5VgwED+dJyOu10nCkn+QG2+n5bksKwpErLCEHC+CC8OY0I
	 Sq2uv9K/8tUGYwQmMma9B0Mq0vqaI6jU+u+AumliirziND/d+p7K5q6E9ZIt3zaZSl
	 3ka+RVXQISaBJf+UZRcyqjSx1vax1aSJviEYOkHrRFSsRGqHPmsCJlb+n1rXVOSI0O
	 NryprBUmaxsfxKlBmPz8UwdOH1mJ7BhQ+ex33EuuwWVQYAaNwGCzwPvdyrJ2Z19Rww
	 Y39O0l+cCf6qA==
Date: Wed, 5 Feb 2025 17:20:56 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Zhi Wang <zhiw@nvidia.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, ajanulgu@redhat.com, lyude@redhat.com,
	pstanner@redhat.com, cjia@nvidia.com, jhubbard@nvidia.com,
	bskeggs@nvidia.com, acurrid@nvidia.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add initial documentation
Message-ID: <Z6OP6KIIuM1gcDj9@cassiopeiae>
References: <20250204190400.2550-1-dakr@kernel.org>
 <20250204190400.2550-2-dakr@kernel.org>
 <20250205155646.00003c2f@nvidia.com>
 <CANiq72mxKhCudmRaS=gwnC=gjkCLMhZcC2ZpfzKKaGX1Hivz9g@mail.gmail.com>
 <20250205165632.000016fa@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250205165632.000016fa@nvidia.com>

On Wed, Feb 05, 2025 at 04:56:32PM +0200, Zhi Wang wrote:
> On Wed, 5 Feb 2025 15:13:12 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
> 
> > On Wed, Feb 5, 2025 at 2:57 PM Zhi Wang <zhiw@nvidia.com> wrote:
> > >
> > > It would be also helpful to make the process explicit. E.g. sharing your
> > > command lines used to checking the patches. So folks can align with the
> > > expected outcome, e.g. command line parameters.
> > 
> > These two guidelines (and generally the few others above) are intended
> > to apply to all Rust code in the kernel (i.e. not just `rust/`) --
> > their command lines are mentioned in `Documentation/rust/`. We could
> > add a note to make that clearer if that helps. So I would suggest
> > avoiding repetition here by referencing those.

Regarding the two, for me they read more like suggestions. The few others are
indeed pretty clearly documented in "general-information".

Gonna add references instead.

> > 
> > We also mention it in our "Subsystem Profile document" at
> > https://rust-for-linux.com/contributing#submit-checklist-addendum.
> 
> I think we can refer the links so that we don't need to explain the
> process in detail. I would prefer to have the exact command lines that
> maintainer are using in the doce. E.g. I was experiencing that folks using
> different params with checkpatch.pl, the outcome, .e.g. warnings are
> different. different spell-checks backend gives different errors.
> 
> It could be nice that we put the command lines explicitly so that folks
> would save some efforts on re-spin. It also saves maintainer's efforts.

Generally, I'm fine with adding the specific command that should be run before
sending patches in a single place for convenience in this document.

But maybe it makes sense to consider whether this could go into the generic Rust
documentation too?

> 
> Z.
> > 
> > > > +The availability of proper documentation is essential in terms of scalability,
> > > > +accessability for new contributors and maintainability of a project in general,
> > 
> > Typo: accessibility?
> > 
> > Cheers,
> > Miguel
> > 
> 
