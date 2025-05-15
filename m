Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D7F1F3FDC;
	Thu, 15 May 2025 15:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747324187; cv=none; b=bNYAKH67VAbFG62v5YY9Ls12UX/MUG+c7MJPyN6/y/4TO4Fn0Lo+ZtxzJPjVnP2S2RxltkIx4xOC9ABHcvC2Xu/JgmGM86CsvVQgxYAd3hX7kifHGLcbF3ZxF5lMDw142TneqSWXHUItoEK+hqVH7FOFm9WJqPFjuJyJaEbgmtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747324187; c=relaxed/simple;
	bh=zseRsqd8FqAEc+BwyVX4fSRhI4DKPi/2KqlEO7SG8lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axneuRLjxyYp9GVEU3oHOpk6GJAonV9XqNEZ5vJmOrzABUiK9PL392sc2yHBHNr+/YZBaHbK3q+HFz/tmsyAwahLr/TshY72Zy+NplzEao4KG8yFKbVcGv3FtzeJTBhnqv5wGYWMLf075dx8h6bEZmblf2vsw5qhXpmBP8su5UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PptK6i3X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PptK6i3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B31C4CEF3;
	Thu, 15 May 2025 15:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747324187;
	bh=zseRsqd8FqAEc+BwyVX4fSRhI4DKPi/2KqlEO7SG8lM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PptK6i3XtpImtJkwi0bcqSAIg+2tiF14iLwQpbQu79fKcvWbSfB3mt1P6+VbP27X5
	 rHDvpbq2pICqWl8Kht5YqIuxbLMwiaseTVmSD40iqL5YRLGf7QNsMNMwueh+FcYHoI
	 PAG0UFpLKOudw5hnmXvKtMNyZWOzLSi/19GmwQdugFiZMmEIF8cqlP3bNYSzboMU6W
	 QJRzaizr7fPjpq7Znq/51O13liUHc7x/SNhNKbf7EuYB6u1UBBkTpDWM0sowtzgU2H
	 5LOY8P/PuBAovMrXXRzzr34eOf/HZSozN2/vK3wnnC9x75E6UdaWe49pVc29DOzEHx
	 /3ycpkuk5dmpg==
Date: Thu, 15 May 2025 17:49:40 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Fiona Behrens <me@kloenk.dev>
Subject: Re: [PATCH v8 0/3] rust: platform: add Io support
Message-ID: <aCYNFPbW7j_SXDpt@pollux>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>

On Fri, May 09, 2025 at 05:29:45PM -0300, Daniel Almeida wrote:
> Changes in v8:
> - Rebased on driver-core-next

Something went wrong I suppose. The patch series does not apply on top of
current driver-core-next and from the patches I can see that if it's based on
it, it must be driver-core-next from at least before 19th April.
