Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92B2202C2A;
	Thu, 15 May 2025 07:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747294692; cv=none; b=D/48kwESZlTtGexywamumvdyzqmxNCo6uQoAjaxNVvfGwpSRivvb+mRgPuw1zcnvAHTcLfhJZQWjhw8Li86tM924W4kH4eIgx+8XRBrs6SiMuwL9yXPwCtw3zni2J+O9jtm8fnMfBKK647ePM38V9uMajVGYmTI5lZB2u0SK0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747294692; c=relaxed/simple;
	bh=R+oXMrFZiQAmHeF0XsyIUPrpLQVVx2PG/xBSC4ude1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8nUY1sjyeAf1Ot/XOuXlK5ro/JotElgBF10AtONQko57acFC0CiaH1dibX9pkej2ZReLJh+nuewvSc8AxI1qZwmOIv1FoEkD2sVTFj3rCHdwZ4bxhz/nrJsVnpDI9aKTH5KOBYnCZC+Krt10cWzGYZH91PusLaTNoczUn7YfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TQUnO3yi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TQUnO3yi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69CF3C4CEE7;
	Thu, 15 May 2025 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747294692;
	bh=R+oXMrFZiQAmHeF0XsyIUPrpLQVVx2PG/xBSC4ude1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQUnO3yiaI9kPB18R6cZkm3IQxY3CxZnzfBSOZhdtkeMgO8tR/gjr0nMyBtrzmM9p
	 ld8DvAzhE0LB/5wmRwzxqqNnbFEiW6IhHCOt0M+Z3i1YQTVS1Ojs4oTJF/XR8d/l7M
	 dS0vqOQH6YV+wxUkwaH3/rXfiBlm1kJG3tVibFrY=
Date: Thu, 15 May 2025 09:36:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] samples: rust: select AUXILIARY_BUS instead of
 depending on it
Message-ID: <2025051511-unstitch-familiar-e376@gregkh>
References: <20250515-aux_bus-v1-0-1781b54424e4@nvidia.com>
 <20250515-aux_bus-v1-1-1781b54424e4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515-aux_bus-v1-1-1781b54424e4@nvidia.com>

On Thu, May 15, 2025 at 03:26:13PM +0900, Alexandre Courbot wrote:
> CONFIG_AUXILIARY_BUS cannot be enabled explicitly, and unless we select
> it we have no way to include it (and thus to enable the auxiliary driver
> sample) unless a driver happens to do it for us.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  samples/rust/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
