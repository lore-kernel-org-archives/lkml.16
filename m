Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7080E2641E7;
	Fri, 30 May 2025 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748635002; cv=none; b=F6T85C0S8yjXTRNa1S0DqxEqMXVUE3/l+F2zkvXF9sjY4owPhjiaaAEZxyc5NHzSFWS703/5Yim6OOT+zyekF6l/jqrnDcgbOBlyORBeBGFh9TiOUM514gV0jNuqZc9KRMeZuez6ugLqjyPu5weakMDG4I1eOKeuCnHg5TjWOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748635002; c=relaxed/simple;
	bh=LM6rDAaDXvGDcb1aBIUtVyRbpOEpodj9tUigeUqaNwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NA6kV6D1YnCt0OSN47izyPa3hl4vWuGpBfJOg0WoTeKa/JWEOiHGQfRWUMfX2jhYrT9Z6Vr34Z2hHQELkGt4btPyPB0/m+pPy2Q5VGBikIjaqPtdyYhOpNyDooVWsbmjHNjKaknLCWIsiWJmmJZvJDUsbXpqIvifw/RNr2G5ERY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtrMJJYs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtrMJJYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5236BC4CEE9;
	Fri, 30 May 2025 19:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748635001;
	bh=LM6rDAaDXvGDcb1aBIUtVyRbpOEpodj9tUigeUqaNwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtrMJJYsN85mInoC0Q24VIsGiFlz4W1NvCcV5Anl1Ilt2YmZbEWM/FCZYv4gDAt5m
	 6+lIN5I0D7haQX3GglUuwa0kBitHbMiHc5NixmB27+z1+BK7oKzasITJj2cE49FKJe
	 fVSApIOO9oN/gUz59y0pB3+2SVxSI4pJuwDa6BiED6rifII7szAs7HK+P/ilDJSueE
	 phCTx51wiOHPzZAjDRl8DGktN70ZCEMF6Okk/ilZ+WG2rJPII4TxAaWSh7RYwjOSnJ
	 9w05nv4t5UoxuhftawgSUalfMeF9Wa7QvHD9cgLUAQpGjWd6Ti8EtEz+jX88ZERFcm
	 zC9W86/e5KBLA==
Date: Fri, 30 May 2025 21:56:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dirk Behme <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v7 0/9] More Rust bindings for device property reads
Message-ID: <aDoNczwEWCDows_-@pollux>
References: <20250530192856.1177011-1-remo@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530192856.1177011-1-remo@buenzli.dev>

On Fri, May 30, 2025 at 09:28:47PM +0200, Remo Senekowitsch wrote:
> changes in v7:
> * Fix a typo in a commit message.
> * Fix bug in `FwNode::display_path`. I took a slightly different
>   approach than the one suggested, using `Either` to handle the
>   owned and borrowed case. That also removes the conditional
>   `fwnode_handle_put` at the end.

That's a good idea, but also a bit unfortunate; there are efforts to remove
Either [1] in favor of using - more descriptive - custom enum types.

Can you please replace this with e.g. an enum Node with a Borrowed and Owned
variant?

[1] https://lore.kernel.org/lkml/20250519124304.79237-1-lossin@kernel.org/
