Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA419AD5C;
	Wed,  7 May 2025 16:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746636604; cv=none; b=aUcL2rlyMVJ65drMPGk16lDlt6ftDn10Cx2d1tdXAm8BxPXzusHACXjNK0/pATV7dFRwwzd6xjOSEWQ6wBxc5KRvcQU109WqXZUysYzxFEH5/VqcOK9QFjv/BeXHmsJ8csscLCWsqk/v0DmIaB1nUD2Mjd1vci+hz7CXqLb/gsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746636604; c=relaxed/simple;
	bh=/oXJz7lHNCcO6QSyQPg/+wzooEDY12xe0sDBwqd+x+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nY8ywMqiO1pLbPeeVvLOouV8pvHMKk78Db2d3Vp768448xzBk7P178ViPmEUaVlBm6dYWdWHT4+Lw+zH7N0R8+gU7UAZxpKB4Cwqd8tVx+akm0jPX24xykTHRuQISSGgVsfMzEtygEcdkAt0A0shR5GwsdT4MppSa+XXGFdBsSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grt7Qm+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grt7Qm+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48BB6C4CEE2;
	Wed,  7 May 2025 16:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746636603;
	bh=/oXJz7lHNCcO6QSyQPg/+wzooEDY12xe0sDBwqd+x+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grt7Qm+h+eg2TEauf/o/ARQOsc+004Kbs/Ul5A16zlPE5Vt95Sxbcli0oP3TH8T7S
	 lq2ATznhVtbaaGLEM0nfkY2eG5XZnzRyj1w0Kp/npfrzAA7wSHztzHKFu8Z36UmfAJ
	 uUazk9++fHVNk1jqBzwz6PIuBVJlxkpfKZvYtqYF2usQ/Vh4cfbJzKH+dRMWe07+zr
	 NchqpJGJcKNIzzJ0fSMXAxV62w3Y4yXBzUQq7Pt+GUnepdf7KZvUYiDMmYf3lPt1LS
	 dvV/moOrRb571H5Ib9LY00uoFopJDeofFXSvFLnMGQzBlzupcz5N17xw8UXuMzF4j7
	 dgtAqXDlb8BpQ==
Date: Wed, 7 May 2025 18:49:55 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v5 0/4] rust: DebugFS Bindings
Message-ID: <aBuPM6FJvfSl-xog@polis>
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>

On Mon, May 05, 2025 at 11:51:33PM +0000, Matthew Maurer wrote:
> Changes in v5:
> - Made Dir + File wrappers around Entry
> - All functions return owning handles. To discard without drop, use
>   `forget`. To keep a handle without drop, use `ManuallyDrop`.
> - Fixed bugs around `not(CONFIG_DEBUG_FS)`
> - Removed unnecessary `addr_of!`
> - Link to v4: https://lore.kernel.org/r/20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com

I will go through v5 latest by beginning of next week, thanks!
