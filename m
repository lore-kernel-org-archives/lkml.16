Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5B1A8401;
	Sat,  3 May 2025 11:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746272690; cv=none; b=ueYxyoaLHlZBulQWDTDL/8TwsmUeeDzjLazESolQ616je8/dHPi0XxxI8ez0epWDNToynDoTERsitYB/UnRoTE+0kvG1eiWpI6SFwBHvY3x1kMpk0w2XM575LQEgvKiP52LtK9aTWd7HONdnapDT9C5gVZktRgQHu4RXIag+38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746272690; c=relaxed/simple;
	bh=3BQmLD3k5V4mJGqOp/CBvqGCITxeh8XmeaEuHrzpSus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHwrMdZHDH71OPcbNOsgiYKyXGe5CGykdZSME0ZlN2fzKA+BGO6CZ/TBnjSNh0z9A6xHX2d3/BH672TZoQ2bwh/Ngt+t/paofR5bbbUYE0UOuB2JXDsFSgY0q70dGVh7fCUsbkXVFbTTlL1/PM29sZLYgEwjUpQWtNg8az4Mm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDgXhP3W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDgXhP3W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BEEC4CEE3;
	Sat,  3 May 2025 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746272690;
	bh=3BQmLD3k5V4mJGqOp/CBvqGCITxeh8XmeaEuHrzpSus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDgXhP3WPnKaYMBx4l8VQss6L9ZgW6kZaNtwHCWcG2pBDCqp18tPefSC1fGB00FLZ
	 JBjnwY45BKcNZggu/ye03Ix8/UGhD5rQECfdKbf8j7Mj6YJPq11TfVw/e+t3CnEuKW
	 +uC8OT46LzcHwhY7ztxNOhSEtcdxJu6wXiFhWC5reL9hkztLrQ3jS/SAPH0oh1wHgv
	 izxOM8rFo2gk//HvEeeITVC8mB6g21EDrAT6Kikb1suAo9Y+yang51nIa6El50IHWZ
	 EW6F8M6HT/VauiuQFuO/J7zuGwWiwO2EwT809KfaMm1lllLrubTvbD0FBoQb0eIOhg
	 kJt5Q73bBRrJw==
Date: Sat, 3 May 2025 13:44:43 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove
Message-ID: <aBYBq1xWgSis7ODa@polis>
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-vec-methods-v5-6-06d20ad9366f@google.com>

On Fri, May 02, 2025 at 01:19:34PM +0000, Alice Ryhl wrote:
> +    /// Removes the element at the given index.
> +    ///
> +    /// # Panics
> +    ///
> +    /// Panics if the index is out of bounds.

This isn't the case anymore. Unless you send a new version, I'll fix it up when
I apply the series.
