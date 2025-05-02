Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79DC23C4EB;
	Fri,  2 May 2025 14:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194897; cv=none; b=Ri9NZBRiwiwc7xr7xHV+OW5APEWc3yr3zmGe8l9BjGa4KxM3c2dSKv3ZqU/pwXjFdjZ7yK9nHsmGnZJx1P4mAurTE5rjSvXf3Zx+XcXn7rr97d0YBGd++xs0nvTdtpik9CVobiN0ycSd9xWLRcXJZZ/hY0jmTHsC0bACBENgrlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194897; c=relaxed/simple;
	bh=M0N5hcrLVErdGk+gFeKjzddxxWgY7OZLy22j2pld19Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOma46wGz3zWLwB2dfDKqve7oZNr9dXGyGLeRMj/OGAAb4yL2LEvA+pno+WMEF+qMH5TGDDV3ikCqYBn1dvxHZPXKMqTe5BVcQ1jO3h7+k+y8fi0fZZEqxGy0D98OyVV4avEGao++eUWpJXezaBkkM6+GJReCeIIOL0JS7/5Bbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2RQLRbcd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2RQLRbcd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3D3C4CEE4;
	Fri,  2 May 2025 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746194897;
	bh=M0N5hcrLVErdGk+gFeKjzddxxWgY7OZLy22j2pld19Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2RQLRbcdZ1CxQW7ykUO6Yx7whDIeSHSXksaEDYS8MbFm3vq5JUV2JVn7EP4/MOQ6W
	 eK2nZuRgQkygUjvSoM6VBFCHSgnckB9dwAvv+7sbOuA7X0CUpsknMgeDi5wKYAuKCk
	 NRVsFWSabxzUVf6yTL9xhc9E2xWsvzGWWtjNIoO8=
Date: Fri, 2 May 2025 16:08:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benno Lossin <benno.lossin@proton.me>,
	Tamir Duberstein <tamird@gmail.com>
Subject: Re: [PATCH v5 0/7] Additional methods for Vec
Message-ID: <2025050251-canopy-stained-75f0@gregkh>
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>

On Fri, May 02, 2025 at 01:19:28PM +0000, Alice Ryhl wrote:
> This adds various Vec methods. Some of them are needed by Rust Binder,
> and others are needed in other places. Each commit explains where it is
> needed.
> 
> This series is based on top of alloc-next and rust: alloc: split
> `Vec::set_len` into `Vec::{inc,dec}_len`
> https://lore.kernel.org/rust-for-linux/20250416-vec-set-len-v4-0-112b222604cd@gmail.com/
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I had one tiny question, but it's not really an issue, over looks great:

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
