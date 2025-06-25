Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5321027603C;
	Wed, 25 Jun 2025 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841067; cv=none; b=BWK9QGULpgsrmRzjMyprYiWKrzwPVEZ9C4CQoCioNkNcJ6xE7287/j880qKKj7/eLHwjfWWTBguQ+H4qtzQo4WinqMR2VjF3xDtNvZ+9BjDCMkdJCMDof0dGIIZJDqGARGvXCAZ/7sDlkZ6Xqaq4WDmo7IWR5hlrsaj7Pf/QYpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841067; c=relaxed/simple;
	bh=0Gk8Hrbt+TDUCHBydZ6Iy4jemZypgMKe+d9ZLcZkRd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlJ2YUYSoQHC2TVKEKPEzaSS4p8LwfvDy4DKQl1Lt5tQV50OnILfKsskSvtQY5jfBwQ7RzK8RadBj3nY349BGe3ca2lpFwY/wbWd1FRO4tWI0B6OulEnB+zwuWBz4acA2WkvFIPzqnp8QGcJKRRpdfk+du099LufJAJ5P6jEac8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvKmKYOD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvKmKYOD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA543C4CEEA;
	Wed, 25 Jun 2025 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750841067;
	bh=0Gk8Hrbt+TDUCHBydZ6Iy4jemZypgMKe+d9ZLcZkRd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JvKmKYODfPg4Zpidy55gmYPq9IZLsM/UFXPl5/wpLCuF2v5SJfQDtJ/IdUzo5z9ab
	 tcc3i7zaT57ADDGJ8/OI2sA/u9w6Usn/CLYmvLdwXOoulQpT/HESWGWP/ii8Z1ilyB
	 yVBE3VQ+djbt3wI+m8xIkkyC8OmITSBbXl4FIecuEFtG4paTJ2VzRan8wbiJujr7AQ
	 aAH1fXk/0JfDLUcl1C6ZklIH+fyUC6hvjO0NLpg06ARMPZ70/WwG0IvVXskhcnnjn3
	 XmT0oT1fr8TovEcElE7nI8lwxL5PnJf6GGXvVFRibFgSmvIAhx1XPDUu8TmdLwvzRT
	 oO07lSfhhjXBw==
Date: Wed, 25 Jun 2025 10:44:21 +0200
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
Message-ID: <aFu25UGNjpdSVd6_@cassiopeiae>
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
 <20250624-debugfs-rust-v7-3-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-debugfs-rust-v7-3-9c8835a7a20f@google.com>

On Tue, Jun 24, 2025 at 11:25:22PM +0000, Matthew Maurer wrote:
> +    fn into_foreign(self) -> *mut Self::PointedTo {
> +        self as *const _ as _

Please prefer

	core::ptr::from_ref(self).cast_mut()

instead.

> +    }
