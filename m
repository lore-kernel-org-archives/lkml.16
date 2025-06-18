Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700671FBE80;
	Wed, 18 Jun 2025 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283147; cv=none; b=FN8b2h2k3NRsP/ZdtsEoUyCFjlPA4q0NDn5B/+T8WIu2UeKQt8KkY4C6R4PO5gWmuKpXhaze6B66qrw/B1tWmhTI+UNmk4Cf4LAF06toMhDpLMQJNykkkusSFtNRK/M+90vFarO6xmoItrJGewSaLv1ZoVhpb1ePgPA0f/qTnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283147; c=relaxed/simple;
	bh=Ajl8YwTDq0wbSSIpVqVDInuj42MSNQe1i3KZF+rgrds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k01PWWvXMQOHMNTQdsy/ZYqQ7ZlyrqB+mCbIdncFdwyk80MlnXiuhqhgfuGAaIGqKjNziNoJGmQEKy0Kzfeb2+n/bDWlUxWy+GKWKcWxA7PRegBmCI3MUvSpGwn69+dK7vfGgLs++HEj7X4h3Z3hJ+PSxt8rI2uE81TkbPYtL4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PBwP3ZRt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PBwP3ZRt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84133C4CEE7;
	Wed, 18 Jun 2025 21:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750283145;
	bh=Ajl8YwTDq0wbSSIpVqVDInuj42MSNQe1i3KZF+rgrds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PBwP3ZRtgSXZ89Rlhy8Bm/NjBG6yxFFxZTGCAPiBAxc6yJenjbRbEXCM+cEgkdtND
	 ffpwrU5iOqm4g32g48nUcstPhYyRhneL6SfuUeIsqPf43kFEW8O5jaIsAcYNysDDC/
	 GMT/1/IAprqyfof9KqqAMhppRA84DZ+0an3QL4nayT7C6fzKZNIMXKuhSKweYV/Dln
	 dru1HpxOy2O08CF/ZncQq/RAmqbvUdCb5Ux91fdAUP4q4Ky/biHkU3D79/Bh9RnI6l
	 rgQZLTSCmEvOlHsRqhMirYparR2pLHdtFLx8wVEmLCnSJYThUuEDaVUFIOIHShanz6
	 O4PUa7YlrdqIA==
Date: Wed, 18 Jun 2025 23:45:39 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] rust: alloc: implement `Borrow` and `BorrowMut`
 for `Vec`
Message-ID: <aFMzgx2gADlJBT-n@pollux>
References: <20250616-borrow_impls-v4-0-36f9beb3fe6a@nvidia.com>
 <20250616-borrow_impls-v4-1-36f9beb3fe6a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616-borrow_impls-v4-1-36f9beb3fe6a@nvidia.com>

On Mon, Jun 16, 2025 at 12:34:05PM +0900, Alexandre Courbot wrote:
> Implement `Borrow<[T]>` and `BorrowMut<[T]>` for `Vec<T>`. This allows
> `Vec<T>` to be used in generic APIs asking for types implementing those
> traits. `[T; N]` and `&mut [T]` also implement those traits allowing
> users to use either owned, borrowed and heap-owned values.
> 
> The implementation leverages `as_slice` and `as_mut_slice`.
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to alloc-next, thanks!
