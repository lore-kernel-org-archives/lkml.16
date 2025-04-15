Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E655B292911;
	Tue, 15 Apr 2025 12:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744720982; cv=none; b=S2dTdc9LCtMBPy3LnbEXnEie1FRnDcd0jfKnbhMxOqLmNw6S4krUdcTRuTlZ/yOmnn9ZhAhsv7jjjHPyky15uxD5Zi5fV+AwmHPM667LkBbhquNNpKxrtMaAQNdxtB7v5w9n7FUBKAQNchNanR0VBuhFUhCsuWhUkaM1UMwksqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744720982; c=relaxed/simple;
	bh=fCa6LFz7pmMqmxuGDVYZ+Em0r89FCnzEM1WDIkSnQa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnPmnwdaeFheqOlrmXVWDzbEGUefTKfVmz2eg7I7tB96kTesLD7QKbx3TpIFMbyEuqBszWQcMQKQr/ziNZVDgfuTRL2opzRW0a4L8FOgdqfByPS4DHtyvuA5l95g9oi1K+0PS1cCLLyqx1x8BZk6M8zKucbg5QbxW7ZAYhJNjbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g40yS1Ds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g40yS1Ds"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A432CC4CEDD;
	Tue, 15 Apr 2025 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744720981;
	bh=fCa6LFz7pmMqmxuGDVYZ+Em0r89FCnzEM1WDIkSnQa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g40yS1Ds+w32o5gKi0VdoEL4DYZvPhjxhEAyDVcxuTwW4fCSppgm7B293f+c5P5/5
	 UKfJSJX8sgSfHQaUtEfelxkjzY46fDijeQecV1TljYzpWVy3T5o+2jUPQwHa6Ev8UQ
	 kSqPKIwN3SKTQnAiqgnL6J8Ql7ndxVOiAyhjZ6V94FMxB4dfrqcgv8KoZIq3GdJ5lS
	 YsVXQgYCvT+fW78gGoXHUVY3VkDXate+yLucGpl0eNp9curljw4lhwnLWnEQDS+gcz
	 KbWeY32GEReiTSavtwM6Qm2kFnRUlbF2RRh7YGnWp9hLaZrpsBt3KcQcubg/qliKxk
	 R3wBKX/UK3UJg==
Date: Tue, 15 Apr 2025 14:42:54 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, david.m.ertman@intel.com, ira.weiny@intel.com,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	airlied@gmail.com, acourbot@nvidia.com, jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Auxiliary bus Rust abstractions
Message-ID: <Z_5UTvuMpYhRN24T@cassiopeiae>
References: <20250414131934.28418-1-dakr@kernel.org>
 <2025041559-regulator-mutt-e8ed@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041559-regulator-mutt-e8ed@gregkh>

On Tue, Apr 15, 2025 at 01:38:29PM +0200, Greg KH wrote:
> On Mon, Apr 14, 2025 at 03:18:03PM +0200, Danilo Krummrich wrote:
> > This series adds Rust abstractions for the auxiliary bus.
> > 
> > It implements the required abstractions to write auxiliary drivers and create
> > auxiliary device registrations. A driver sample illustrates how the
> > corresponding abstractions work.
> > 
> > The auxiliary abstractions are required for the Nova driver project, in order to
> > connect nova-core with the nova-drm driver.
> > 
> > A branch containing the patches can be found in [1].
> > 
> > [1] https://web.git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=rust/auxiliary
> 
> Looks good to me, want to take this through a gpu tree so you can build
> on top of it, or do you want it in the driver-core.git tree?

Yes, I'd like to take this one through the nova tree.
