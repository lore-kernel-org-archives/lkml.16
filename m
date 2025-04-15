Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9F5297A6C;
	Tue, 15 Apr 2025 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744722682; cv=none; b=tJ1f86Zmw9kM7uKyBhXg7Gl169XJqJ2tHJPx3YZZhX+MP3bVDU/2WSdUdtsXI3bMxFwjbE/ajFhQcBTEvIQ2Zr7nGUg/r938WB1d84G0tJjT+naQ6e8T29G5HgrRRqYgNKeK3ECWPKy7ABvx+PS5T2x1r9xLzIRP11UsdeDPhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744722682; c=relaxed/simple;
	bh=v8TJgpASVjg0/9Rhs8onAf+pfIazFy/KYb3K3LTKVuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kETiJwwZLnY5b77PuftUZm3WoCk1tX414RtJX42WGcbmqc0hLR24m/QOQU6G1MKM7GFja5TQBt03xeBMfYYwotTVds7k3u68ewjiOfkhXiekrT9wsbYrYKBmzHLiT1Ii+liKm95Rr3fdU2WJnU03LKYlrLDVzO7N0q1iBcv6qI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/1IqjfD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/1IqjfD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC3AC4CEEB;
	Tue, 15 Apr 2025 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744722681;
	bh=v8TJgpASVjg0/9Rhs8onAf+pfIazFy/KYb3K3LTKVuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A/1IqjfDL3pIuDcquYN5U7ufCXvWXd9EZEOEKEBKiZgsDrK+Fi05L9aXCH/kAAiWj
	 zHce/bcue0MxFpSpuau5p+Q+WWpDErApmXu/UI2/pQWGYRaW7b8SPqUYnzb4yLcHw4
	 Wue5SNv8efD0tsQJx7pz/V3YZ3oO+I6Poj+IeesFpRU5O/RWHy/rW6wckRtyvWsWrX
	 2CVETuP2Z7hBt1N0FWFrpzc8V+ZjqOp9El/O23pKMzSAA02MVJwd5xWeXXJTWo9rh0
	 j5zF1f8Cyup7xcxQoAjJsPqnwOZewz+KXjfxGEFbgrksqgnsXGMxBTYqlUyplAD4q6
	 Ebi3cszaPg1dA==
Date: Tue, 15 Apr 2025 15:11:15 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>,
	Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
Message-ID: <Z_5a87L9hYz0Pbc8@cassiopeiae>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev>
 <Z_1Jfs5DXD2vuzLj@cassiopeiae>
 <D96RNFS3N8L2.33MSG7T019UQM@buenzli.dev>
 <Z_4rVyUjK1dlnTsT@pollux>
 <D9760KMM0PSB.HONQ7MUG8OTN@buenzli.dev>
 <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+wGopPRcdp6t0h2cu03vrxxP3=msNmpju4nqq9XENmng@mail.gmail.com>

On Tue, Apr 15, 2025 at 07:46:19AM -0500, Rob Herring wrote:
> 
> A reasonable split here is possibly splitting the fwnode and the
> Device versions of the API. In any case, I think we've discussed this
> enough and I don't care to discuss it more, so whatever reasonable
> split you come up with is fine with me.

+1

Let's wait for some more feedback on the Property trait impl for primitives,
CString, etc. before moving on.
