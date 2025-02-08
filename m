Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EABF28F3;
	Sat,  8 Feb 2025 08:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002662; cv=none; b=HAksfG7osrIcRUqRTFNZhcObfFZLm6tLgJhEoIerNtbmgKFeizX+ZIEwMjWSEy65t2fyueIjKdLY80we0AclnMxYiH5t+/4RzZYMIjD4LOxd/t4e1u7eDJd0CBeZH2LaIT/xAK7/5TgJb5UdFjESLQW2bW2W8/sO7y25uu0LJyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002662; c=relaxed/simple;
	bh=+tIAwvDtZUeKq5lIL4siNEEQQzH8bg/IC4ssDeJzqxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc+WX1ss7tI8AY2ugA3qSKHb6QP8pXqIqQlMQOUm6wfozjqzH49156YnhjUJFcrGW2lehUXqxRPXd1JKQWUxD9XB9P36QrnwKo81JMXrfXRKuvfUacl/FlFzCtU6z92IKxkBjzMdpwkOnlX1z3QJyvRMQAmA1Td+/tj7rQ9/Siw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IWz5P0bh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IWz5P0bh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B90C4CED6;
	Sat,  8 Feb 2025 08:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739002661;
	bh=+tIAwvDtZUeKq5lIL4siNEEQQzH8bg/IC4ssDeJzqxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWz5P0bh7cU1+wqgU9ne2x2+l2u8vb6NaYkBThbTGHBhHUnbMQtpoDlsuS435wI5d
	 UoTCzfti3clGaCDbFkNqqIhvRIovtcNjTucUPWAYnP0ZLcBSdFHBQEmMxl6x4bsXLw
	 gRfChp+UJOzuKyhWCyxcYjwZyRlWgIgLGMPaRlMY=
Date: Sat, 8 Feb 2025 09:17:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] rust: macros: fix `make rusttest` build on macOS
Message-ID: <2025020847-boxcar-bovine-47e4@gregkh>
References: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>

On Fri, Feb 07, 2025 at 12:21:51PM -0500, Tamir Duberstein wrote:
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (2):
>       rust: macros: improve panic messages
>       rust: macros: fix `make rusttest` build on macOS

Very minor nit, patch 0/X does not need a signed-off-by, and if you find
that you don't need any text for patch 0/X, there's no need to send a
patch 0/X at all!

Hopet this helps for future submissions.

thanks,

greg k-h
