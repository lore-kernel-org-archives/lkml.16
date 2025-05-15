Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7428C2C6;
	Thu, 15 May 2025 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335510; cv=none; b=LoPHkauj4UrWUS94R4ECsk73Ex0qAgAnZMRrvZ0TExqSdrUOKK025sCHkK1mGEylu8lZH86ltxU2tAjZJ/+XRYieQ7Mfw6FXzOlB6x6o8SaPZvh6O2kHiZry+8v4a5l5hJRPXM4urCoS/YvdERnFEvnkBZN6Y296I+EnIj5fdzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335510; c=relaxed/simple;
	bh=l6sKHpMPEkK6sz7MYnYBtzjiqBwRtoy4aLuxM1q3YWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuerTHgwiyzebaqdlkTtqAy0F0cT1K0ixA7uhorVHx4P+W/YIbNwhJT6pMhJ6lzomUlagsecnpHEOYFGJ/igUNCB4JNChFES67vXPtTYu58PNSiXsI1zj4oxZv9dbCtWOJ6acTliFwnDjsLdcaBrqtQBT8vKZrejB2nYnzh+d4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nocwxb2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nocwxb2M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 959B1C4CEE7;
	Thu, 15 May 2025 18:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747335509;
	bh=l6sKHpMPEkK6sz7MYnYBtzjiqBwRtoy4aLuxM1q3YWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nocwxb2MSAIfdBubu58MKI0xdZmijk7q2xQvUH2CMXrEmAbxBXFRl76jkKyTFFc99
	 Iy7tpPjQfrxFY+2SXheah1nI94sypCF6/pNGc9B4Pk1bqOeWYk/5nOchV+JkmXqVD2
	 G6d3+7ylq12ry1BrFalYDaaFN9BD5PBEDfAoQtQReSJ82xC4SAjT/FKShiUI0kNSmD
	 3enP25jk3tDJEBi+tukoy1Lfpk6UfymB/aE9Oo4+VFskIPyXlrMpU7cgAZ++8a8sDk
	 zKVvTF8qRtGCuTsDgPtqo9BFPrdoS45QGsMbIcYD8ImLGIdogYG+lmCqP4O/XmOL0H
	 ZJ3ewPUh54jLw==
Date: Thu, 15 May 2025 20:58:23 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 0/4] drm: Rust GEM bindings cleanup
Message-ID: <aCY5T0B4GHAo6WK5@pollux>
References: <20250501183717.2058109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250501183717.2058109-1-lyude@redhat.com>

On Thu, May 01, 2025 at 02:33:15PM -0400, Lyude Paul wrote:
> Just some patches to fix a handful of minor issues, some of which were already
> mentioned on the mailing list. Some of these patches also make it just a
> little bit easier to add the shmem bindings from Asahi in the future.

Applied to nova-next, thanks!
