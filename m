Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970632750F8;
	Wed, 25 Jun 2025 08:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841192; cv=none; b=tWSfKwm2szTNfIoYu2VMEyyVpOm0ZkZ19tCvoGq5e0VIAQeTeEPiD0o44tw3DW9Y8NlTXBfMG0Qv/lOYcWNg08Z4amZz0vkfseOBj0f1f5EdAxkSD+v53xlfd8j/AbWVdux0bCIRJo13lzxKkHWU3/Xg6AvikjIfjcWl+HUBcAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841192; c=relaxed/simple;
	bh=cY7Eyl5hR/lx2x1lh3MrmiytMFzS7zS7uUXCCsWV6vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AMk4U2+tcRncKH03eLsvpvn0IsGuhfuBw5ki9BSBdwKF1bZHZY034A0qhUEojU/9WLMatZmSsq2oqC09cl9QOgxRObaysTIhI3NqHe04CkfMKqwL/afcY1GnS2kcgPV2GJRnj6YPkZdjUV3lYc3w3qyIygZVXSql5Y02RdPmPJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1xNiTjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1xNiTjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4C4C4CEEA;
	Wed, 25 Jun 2025 08:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750841192;
	bh=cY7Eyl5hR/lx2x1lh3MrmiytMFzS7zS7uUXCCsWV6vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1xNiTjYEIdQql/xZXl1Aqm5+h2U6i8G09utQJX2u7CPP4n/1tLDAIyBRWiy+nC7x
	 F6kZI3uCgfsHUlRoWb6T7iCnnmJEZz9Fdb7yWG3l3rs/q9peyopAh4IR5mervSC63f
	 JBHKTW0SLPYk2gMmVutbRnBpu7AoXT5aeIPKCeYIDke9yVy4Px2drYeaT2ZEwYD21r
	 DHK7rpiAaGzw+A2OF0UqFsawI5nmD5+LYBL5wV+W8DmdbkrEfwVtblfpFdNxnKsnw9
	 fHGgRWcTE0ZUmBz7EqArbdVrfq6mS10t3vFVJuR0tOLrfb9F+JHy8M/etzM72O6dGF
	 YAPF4gFxnwUOQ==
Date: Wed, 25 Jun 2025 10:46:26 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 3/6] rust: types: Support &'static and &'static mut
 ForeignOwnable
Message-ID: <aFu3YpGyaM6eNsIR@cassiopeiae>
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
 <20250624-debugfs-rust-v7-3-9c8835a7a20f@google.com>
 <aFu25UGNjpdSVd6_@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFu25UGNjpdSVd6_@cassiopeiae>

On Wed, Jun 25, 2025 at 10:44:27AM +0200, Danilo Krummrich wrote:
> On Tue, Jun 24, 2025 at 11:25:22PM +0000, Matthew Maurer wrote:
> > +    fn into_foreign(self) -> *mut Self::PointedTo {
> > +        self as *const _ as _
> 
> Please prefer
> 
> 	core::ptr::from_ref(self).cast_mut()
> 
> instead.

I think in the second impl it can just be:

	core::ptr::from_mut(self)

> 
> > +    }
