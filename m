Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EB2298983;
	Thu, 12 Jun 2025 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743073; cv=none; b=Vbcub5Ilo02f/qdr8BHszR9cdcTx61wc5rmAMe+c+cl+MxaoIGGrjmeHOCEIF6W4JCiooOXMIo3VMxOlVWA3tJGSrUJlGJr9gaZsHcJFwXgkivWXVd5tFMEGfHMlKAEB+caZf2woE7mUYy7SB0ExQWRAe0SMFqbNB35EA1l/fy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743073; c=relaxed/simple;
	bh=nIfwM18TYZXcj3xmxhzeNysnRdSmwhWrjtdvKKFJgBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULbgm3MXHA5YawJRqCLiMebIGbxpWKWU2RvfvjOyUQtxnNhOVDMVVXUZXUY76KRrDeTZV9wCpzo+ekpFfVnU4wfwlC+5nMZi1v3TPXe5JoD+0Ctiij8zbOoK9+E4nKd6hkE55b7mSP5u+yQGwCp7cUfqJeJtVGXzvKK+Kaf8Ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BiBsjf6t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BiBsjf6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D32C4CEEA;
	Thu, 12 Jun 2025 15:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743073;
	bh=nIfwM18TYZXcj3xmxhzeNysnRdSmwhWrjtdvKKFJgBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BiBsjf6t8WuDkklrFXYCapi18HlrYw9C3HsNLsKmyWCUxKfOHW3ua8RBV+MmUB7qt
	 g9bYakPpmm3Lty+AAf3iP71QTei/1c4iDGxWgw1AyyVouGlETnyDz3I8w/me4s9bEl
	 vcr8iN79C4O6beve1Q+FwluMmlZWAOVT89+1yH/SGk0TEsQXt7YGCO4LEh9NryY3ZY
	 0Tiio9TiesOXopdCni4uKOG0O6m3sXK77a8CHxbk5WPRIjPP3G4+/9Cv/0DZpwIVqw
	 kFC8RCxEZCLDluxW5qQdLag+J3csOrx2utl3mixrUn7fVAC81ool69Un7pUKQAeDkE
	 RVKZrU08rmqYw==
Date: Thu, 12 Jun 2025 17:44:27 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, chrisi.schrefl@gmail.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] rust: devres: fix race in Devres::drop()
Message-ID: <aEr120wdhFVjFXWg@cassiopeiae>
References: <20250603205416.49281-1-dakr@kernel.org>
 <20250603205416.49281-4-dakr@kernel.org>
 <aD-EiRChuScS5TK-@tardis.local>
 <aEAWwnyP4zwwrccX@pollux>
 <aErxSYp0AsHGWt0E@tardis.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aErxSYp0AsHGWt0E@tardis.local>

On Thu, Jun 12, 2025 at 08:24:57AM -0700, Boqun Feng wrote:
> Thanks for the explanation, and sorry I'm a bit late for the response. I
> was trying to find a place that we should document this, how about the
> diff below:
> 
> ------------
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 0f79a2ec9474..c8b9754e411b 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -31,7 +31,8 @@ struct DevresInner<T> {
>  /// manage their lifetime.
>  ///
>  /// [`Device`] bound resources should be freed when either the resource goes out of scope or the
> -/// [`Device`] is unbound respectively, depending on what happens first.
> +/// [`Device`] is unbound respectively, depending on what happens first. And if the resource goes
> +/// out of scope first, [`Device`] unbinding will wait until the resource being freed.

I will add

	In any case, it is always guaranteed that revoking the device resource
	is completed before the corresponding [`Device`] is unbound.

when applying the patch, if that's fine with you.
