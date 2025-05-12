Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54D81720;
	Mon, 12 May 2025 13:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058351; cv=none; b=NnHqEJED/s7S/RFUtpur4tB5fgr4TyhcE6z8dnMag3e6vSaosmawTqtJmpOvwF1LBRE/NaKAT2axSG0obBjfIWm7oK5f1p21YbR6OkNYYZyUEoh+dcM8KPwc1DI0Ebstj/CUBfe3JM3xcL0yJHxzOo3UpPziEBMBUaffvfhQaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058351; c=relaxed/simple;
	bh=aS+xhCKHOW1Vbyt2IfMiIICsgpVEoputHQayuPef8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hgUK+seooW3+8x3x4NPOjjFDj27+34hRRwvckwa2logA6p8KY7+1tkNSul0n2gi1yNAg89EEgOmUPwWo+GbC1BOiShDIM4XEK35Ni9dY5Rjw7QYAtRl1dts7hlqGP5zZAGFue1i6CKy9d/tDnt3OPmyLN5DfKN+WU0VVfd/TrHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8BwHkOM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8BwHkOM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523C1C4CEE7;
	Mon, 12 May 2025 13:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747058350;
	bh=aS+xhCKHOW1Vbyt2IfMiIICsgpVEoputHQayuPef8e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M8BwHkOMEkpe1zVPGiNqGu1Vi9qQbkCTdFJF6c/f/V2pLMm90vsLFRfLickZraDbX
	 1Z6ZqXBxwm4H1hVMZhpdpVXDhqe/7ZvdIYiT56Ar5qLwBxpdC/tGmH+OiXIzUKOWuc
	 hUSj7BRK6OuiyFc7JjOObJI3Q2Yc0nbbEl0/Kv6J03+/dYZr7CsHDHl9/J4vRmSHJu
	 JHg3UU3s8LvnTDxIhJpouFO3RGJ4Pm+nGLvhVP4+QbKnaAxTgWGuuEU++y2L2UdFro
	 pKJnrG40qOa27chzT3Io+i1AJM+01fIkfNaY6DUQf1TDVAWTbLSj2r/Ch9GJl7qJb1
	 Y5trGFx0N5jow==
Date: Mon, 12 May 2025 15:59:04 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/9] rust: device: Create FwNode abstraction for
 accessing device properties
Message-ID: <aCH-qE8wAY3X0YRK@pollux>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <20250504173154.488519-2-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250504173154.488519-2-remo@buenzli.dev>

On Sun, May 04, 2025 at 07:31:46PM +0200, Remo Senekowitsch wrote:
> Not all property-related APIs can be exposed directly on a device.
> For example, iterating over child nodes of a device will yield
> fwnode_handle. Thus, in order to access properties on these child nodes,
> the property access methods must be implemented on the abstraction over
> fwnode_handle.

This reads as if it is a snippet from a larger text.

Please start with a brief motivation of the patch (even if it is trivial) and,
using imperative mood, what's changed by the patch, then you can add why you do
things a certain way (and not another).

The same applies (more or less) for patch 2.
