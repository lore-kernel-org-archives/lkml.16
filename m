Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2F225B66A;
	Tue,  1 Jul 2025 12:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372281; cv=none; b=K7xw/WoiQlVFQV8I9tBqMvYemmsNmIIiII05Xj4QWsvVnFz9pFqfqFlr9OW+/kBwP/zkXhiWZ/c0uc5ZZcUz4fkpF8XONkpWfhryo1I3OEtK0zABlvV1QlfSnov8wZWF70i5CM2ZLExnzi5uNz5HbgYib4TuDcAdaeiIPyuFvZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372281; c=relaxed/simple;
	bh=uSxrEa/aatStDlYzdgidWMnNxmVi/goKnF/38j+P230=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWdfmg5nrVUlR/I8J5Wdug0r22LEvK4dEfC9PFor4W5R4YlU4aFtRzziOTbk6yjUNwRmaz6e0yEiHdZoIg/muYy2Fey4drCEmtBskTl9G+8X1mDJWlUOGcE8T6l/n1xR4a8Hdf1OoX5o0fIWVRRqQe4/2Gw4gWhmkAcZk/vtKiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwBWX/EY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwBWX/EY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D02C4CEEB;
	Tue,  1 Jul 2025 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372281;
	bh=uSxrEa/aatStDlYzdgidWMnNxmVi/goKnF/38j+P230=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwBWX/EYNxrD7OpYQ79dSZLp+xr2dLlwrDm5kUDkVzkIMQbiDsapIjt/SmcIzxjmH
	 Vvg2zgq4DQdeYmzkOTrKG4AZrNP3F2r9KZGjrYbje+PvNMIlIZ83dLliCiRo7wSQLb
	 Ca+FPda4W/PwXbv4XPg6oJlBHP6Lg3Lx2vGddLkqJuccIHopkrqdg9HjN1vFScjW+V
	 4wc1ygy6RRhpIM+Zmv+X2xwCkauourLcN+bBNxQpVcIN+GcuMeFpjxWuSaq1VaDyd/
	 mk2XVK+gIMJg+3t/ca0I3EaQARnFyBHTksFp38qnAAYUcVG6/6kxMWZ31gTHakShfw
	 /a/Ls/x87KeYQ==
Date: Tue, 1 Jul 2025 14:17:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
	robin.murphy@arm.com, a.hindborg@kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: dma: require mutable reference for as_slice_mut()
 and write()
Message-ID: <aGPR8-psu96m9ioA@pollux>
References: <20250628165120.90149-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628165120.90149-1-dakr@kernel.org>

On Sat, Jun 28, 2025 at 06:49:54PM +0200, Danilo Krummrich wrote:
> Given the safety requirements of as_slice_mut() and write() taking an
> immutable reference is technically not incorrect.
> 
> However, let's leverage the compiler's capabilities and require a
> mutable reference to ensure exclusive access.
> 
> This also fixes a clippy warning introduced with 1.88:
> 
>   warning: mutable borrow from immutable input(s)
>      --> rust/kernel/dma.rs:297:78
>       |
>   297 |     pub unsafe fn as_slice_mut(&self, offset: usize, count: usize) -> Result<&mut [T]> {
>       |                                                                              ^^^^^^^^
> 
> Fixes: d37a39f607c4 ("rust: dma: add as_slice/write functions for CoherentAllocation")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to alloc-next, thanks!
