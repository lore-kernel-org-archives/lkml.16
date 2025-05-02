Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9EA1F12F8;
	Fri,  2 May 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169900; cv=none; b=TzpQFV+NRldQJi+OriX3eyoZdtyn3y0VsnEWpYqsdzINjdWGhEqpwU9NkqSxHZcDL7MM3tdOnFQUGYUwEPSTD6aI6olvdv03WTNAdhB6Oj9SYeYuDIeyi/WDWPDRaBGrTbs6e9LSGaa8yTuweAfrPtbh1764lTeEJ2zzNQpiqV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169900; c=relaxed/simple;
	bh=Cl23HrG0NbI4zaeaKlMyqc6cU44bqn21N7OPQNvcZ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KywVn8qdaFKzd6zzzRceh0Rw9kWq3ihldbfwpoBcMWQ9b06whwbk2bN2dMMD2fccoTY7vd0JrSiDB50xQcMizpwVZ5H+1+fsAQVcHpeehnqL8cLHByH4u0rW5LpmD42EXqsqvSd6aIVrzGvvZI/iTnnf+XYTQfL8PJtgxjn3nA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=k+dCcuTM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="k+dCcuTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F495C4CEE4;
	Fri,  2 May 2025 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746169900;
	bh=Cl23HrG0NbI4zaeaKlMyqc6cU44bqn21N7OPQNvcZ0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k+dCcuTM/Bc3TFFQtnFq70WegTPt5Y3lVJ46EWIgXXmORvbYCn8mSXIFw9LokrpG8
	 NwgGbK+P5u0sn485Q1ajovz13P4m7IPNGVieHrFgfNgKH8VQqR8qLXdmzj3ap4Ey6k
	 bxGhyAIimD0/W3MqDBDIc4fAh1HvarJkzrU91Q5I=
Date: Fri, 2 May 2025 09:11:37 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/4] rust: debugfs: Bind DebugFS directory creation
Message-ID: <2025050205-reassign-entire-4078@gregkh>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-1-850869fab672@google.com>
 <aBRoNKjB063QhGZo@pollux>
 <2025050230-browsing-backstab-8de9@gregkh>
 <aBRutTMBtq-uCnii@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBRutTMBtq-uCnii@pollux>

On Fri, May 02, 2025 at 09:05:25AM +0200, Danilo Krummrich wrote:
> On Fri, May 02, 2025 at 09:00:07AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, May 02, 2025 at 08:37:40AM +0200, Danilo Krummrich wrote:
> > > On Thu, May 01, 2025 at 10:47:41PM +0000, Matthew Maurer wrote:
> > > > +/// Handle to a DebugFS directory that will stay alive after leaving scope.
> > > > +#[repr(transparent)]
> > > > +pub struct SubDir(ManuallyDrop<Dir>);
> > > 
> > > I think it's not very intuitive if the default is that a SubDir still exists
> > > after it has been dropped. I think your first approach being explicit about this
> > > with keep() consuming the SubDir was much better; please keep this approach.
> > 
> > Wait, let's step back.  Why do we care about the difference between a
> > "subdir" and a "dir"?  They both are the same thing, and how do you
> > describe a subdir of a subdir?  :)
> 
> We care about the difference, because Dir originally had keep() which drops the
> Dir instance without actually removing it. For subdirs this is fine, since
> they'll be cleaned up when the parent is removed.

But does that mean a subdir can not be cleaned up without dropping the
parent first?  For many subsystems, they make a "root" debugfs
directory, and then add/remove subdirs all the time within that.

> However, we don't want users to be able to call keep() on the directory that has
> been created first, since if that's done we loose our root anchor to ever free
> the tree, which almost always would be a bug.

Then do a call to debugfs_lookup_and_remove() which is what I really
recommend doing for any C user anyway.  That way no dentry is ever
"stored" anywhere.

Anyway, if Dir always has an implicit keep() call in it, then I guess
this is ok.  Let's see how this shakes out with some real-world users.
We can always change it over time if it gets unwieldy.

thanks,

greg k-h
