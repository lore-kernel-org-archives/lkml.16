Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB5922DF95;
	Thu, 12 Jun 2025 10:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749724294; cv=none; b=L9laf7IEJDcC71KPeCCMIx9FlYS0yMucMIzOhxLeaa+9paJkJB3yAb0f50KS7xI3pT581VKrB+lLM4pQVDJzL7pQNdgoY/dCLw/sKGRqNdABMvw+Div76YFFgHpuWCh6MC9tBCbz827e4WRBvPSw2QwiWdRMXRnlJMdwbV+mCdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749724294; c=relaxed/simple;
	bh=mDm1RzkSd3lHQVQx0NkoIKQPL1oLiexJUBX7k9eUA3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWiV1ujZAOgQJDDKmsOUWY7lJuUpvsY8GEoeJBpsXTOhrTjWorFbUA6LS4w2/ilhxk+wy/NKVzvAs414kevDpyh97bu2Jukjblcw0K1hpqawasSXqb95JC7JTgOlvizd/mkZZI98dw96MeSF6nB8X7CHKDLIE29xyJu7/YxMKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NW6fQ5tz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NW6fQ5tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1464EC4CEEA;
	Thu, 12 Jun 2025 10:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749724294;
	bh=mDm1RzkSd3lHQVQx0NkoIKQPL1oLiexJUBX7k9eUA3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NW6fQ5tzMXCgQ75WPQhzp7TKnDIRKBTHyPzcEXOWWP9UclXy4K5rFulrbnRBcKdLR
	 bLhz5VPa5+APOcaHn5fzBWCw4OeoI/ZEs4B37Vc0I3L5ldiqyaiHmLVo9JAT/UgDdQ
	 ckqxI/yyv08Fm1vsn0niDGosHT5DnUwArbWxMS+9KlZjvmZxzPZZxziTQwj1CMWyjo
	 DV/E0b7bfAaN/NOnJP9n638tkuShnnzJ4PHk7kyUzoVdDs4FgWbexD9we9YpSxH/k7
	 Hgq0qypV/JXhjBHv4uYFnqubckmDpDkNjk3mMk7O0Jm4uJTI4Vh1aHZiQVsBVvxKoW
	 IKADhhJe8+F6w==
Date: Thu, 12 Jun 2025 12:31:28 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Benno Lossin <lossin@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aEqsgD2ap2VMpTR9@pollux>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAKEK5YPNCAU.3LQGI98GGG4KF@kernel.org>

On Thu, Jun 12, 2025 at 10:13:29AM +0200, Benno Lossin wrote:
> On Tue Jun 3, 2025 at 10:48 PM CEST, Danilo Krummrich wrote:
> >  impl<T> Drop for Devres<T> {
> >      fn drop(&mut self) {
> > -        DevresInner::remove_action(&self.0);
> > +        // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
> > +        // anymore, hence it is safe not to wait for the grace period to finish.
> > +        if unsafe { self.revoke_nosync() } {
> > +            // We revoked `self.0.data` before the devres action did, hence try to remove it.
> > +            if !DevresInner::remove_action(&self.0) {
> 
> Shouldn't this not be inverted? (ie 's/!//')
> 
> Otherwise this will return `true`, get negated and we don't run the code
> below and the `inner.data.revoke()` in `devres_callback` will return
> `false` which will get negated and thus it will never return.

DevresInner::remove_action() returns false it means that the devres action has
already been taken from the list and will be run eventually, hence we have to
complete the completion.

If DevresInner::remove_action() returns true, it means that we removed the
action from the list and the callback will never be exectuted, hence nothing to
do.

> > +                // We could not remove the devres action, which means that it now runs concurrently,
> > +                // hence signal that `self.0.data` has been revoked successfully.
> > +                self.0.revoke.complete_all();
> > +            }
> > +        }
> >      }
> >  }
> 
