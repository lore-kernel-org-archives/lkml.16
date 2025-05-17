Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45269F4FA;
	Sat, 17 May 2025 10:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747476818; cv=none; b=YoJjwBj3mAFtvoQz3SdGo+nJDzoB81iqI6ZoiEZtnwDpW3p3yeOP14Cghl/U5NuPUjQEoPFpBihk6MtCIjFONkuECcrMX6liv6Hw5/LJgujdFx7rWqKfKNYugc0XKZ6W2l5gZBeC674gxy3eioLiVq2QwJcsKtuiUFzjTPWQXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747476818; c=relaxed/simple;
	bh=8yh9ur/IZvga/MBbfC24SRQ6hiqIOhARvKINKIIyYsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDJia0ZsXOupalfbfGosEk4bnCP/7E1+DJwK0vBn40d8efMWEH0bOI+BZdG+O5lWdHxy0BK1/nhPLtu9wnL1VVMVGEmLpROt9yWTPHCcbU9Zrf3tvwyB3n901pwDnYKsCYkMSACzil8cOpsx5NgBGVfnrMwa2HWJ1pNLXd2/S6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gXDRp+AZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gXDRp+AZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BFDC4CEE3;
	Sat, 17 May 2025 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747476817;
	bh=8yh9ur/IZvga/MBbfC24SRQ6hiqIOhARvKINKIIyYsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXDRp+AZr6hTkDdELXCjL8VZSUncksHbTgeuKQBwpTJciP10Le46qm6h24SJz8EDN
	 gyOUOXzwifMGvpdxiuHvWRULijdksDs+nAf8bbJX7OD0MCDPLMeWIvvLGmyFYbTs0y
	 s7eEA7PPyJpJcsoAcrEcYEhlVS84kQO51FW8bFSo894kB/zv7zroBH2bNVY8nlDZol
	 m/Mv4emnCmLonzPJGL3VSNdi+AhaNgn2f44d1ou2xZUmDzdh3behSJxWDxx8Kj+rjE
	 djoPd6KjAsjWezADaCYeNahN5zyAdRlK72LU81WHjdhKYR3WbpNvH8Q5AxtZWKjeuQ
	 Muro7NPPMh9Ag==
Date: Sat, 17 May 2025 12:13:32 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>, Timur Tabi <timur@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: add basic ELF sections parser
Message-ID: <aChhTJvY6KFvqrTP@pollux>
References: <D9WP3YU31199.Q8IEDBJZ87LU@nvidia.com>
 <2025051532-gentleman-reset-58f2@gregkh>
 <CAOZdJXWKLu0y+kwC+Bm8nBCLizQVpsDdDUoS--hVgz2vnuZJQg@mail.gmail.com>
 <8b14b078-b899-42e8-8522-599daa65bc63@nvidia.com>
 <2025051647-urology-think-b8e0@gregkh>
 <D9XMAV4ERYK7.39TLQBLYTX3TU@nvidia.com>
 <aCc_PSOPkLWTcTru@pollux>
 <D9XNS413TVXB.3SWWJE4JGEN8B@nvidia.com>
 <aCdhS10JCh6HRpqV@pollux>
 <08a91cb8-2e08-44a5-9d5c-c2c223aaa71d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a91cb8-2e08-44a5-9d5c-c2c223aaa71d@nvidia.com>

On Fri, May 16, 2025 at 12:00:11PM -0700, John Hubbard wrote:
> On 5/16/25 9:01 AM, Danilo Krummrich wrote:
> > I did not argue for or against it -- what I do disagree with is that we seem to
> > just agree to disagree and stuff a generic piece of code into nova-core after
> > three mails back and forth.
> > 
> > Please keep discussing the above with Greg until we get to a real conclusion.
> 
> Danilo, this is a small amount of code. Is there any real problem with
> a compromise, that starts out with Greg's approach of putting this code
> in Nova?
> 
> And then we can promote it if and when we can make a good case for that.
> 
> But in the meantime, we really need to be able to take "yes" (from Greg)
> for an answer! I don't want to blow up the firmware images, shred
> the "Nouveau and Nova can use the same images" story, and delay merging,
> all over 100 lines of code.

What I disagree with is that it seems that you actually *can* "make a good case
for it", but stop discussing it with Greg, because he would agree with just
stuffing this generic infrastructure in the driver.

It seems like taking the way of least resistance even though you seem to have
good arguments for this to be generic infrastructure.

The fact that *only* nova-core would use it to begin with is not the relevant
factor. nova-core is, for obvious reasons, the only user of quite some generic
infrastructure, yet we don't stuff it into the driver.

The relevant factor is, do we agree that this is a valid requirement for drivers
in general (which you seem to answer with a clear "yes"). Which means we should
keep discussing it.

If we can't conclude that this should be generic infrastructure, we can still
figure out the way forward for nova-core (i.e. have our own ELF parser in
nova-core if necessary).

But, as I said above, please don't stop the discussion with agreeing to disagree
after three mails back and forth.

We have plenty of time to discuss it; we do not target v6.16 and the v6.17 merge
window is far away.

- Danilo
