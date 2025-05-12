Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876A3292928;
	Mon, 12 May 2025 12:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747051474; cv=none; b=ADZYvEjErxZs7GE1/ORE6gh5pbkrH1lx2bg+DaDU+7CSPvR0slG116nEQM/AU0moJQTrZZjHlJAYtxHGuvOKE6/58CN9bFlB2AhGbjl+mn8OOmsSAxoWCnqBeQ+PNNR5MiNd4ZDFxtZ15yV4Bumz2fn2fnLl/Xb0VWYfhBgJpXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747051474; c=relaxed/simple;
	bh=UVN348V7VAZTUF5Wa0ftGERbMNu9fnNa3x1psolbwgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EHqIyr5bLRHFBGLd+nQWXlXXn46mIMpSoN2xH9Q4TWw8mptLqVZEwZbbxVd3plukhfaq30dfR+mihix+jY/3R7O6SAQifd8L4pjSaga/31GPkgGBpb2Sx4OIqjwbRQ9OBtf3BjvzsXDK/m0t/MJZurnPJ5NxXPYxVszkMge5DFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUnJxikr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUnJxikr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA9BC4CEE7;
	Mon, 12 May 2025 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747051473;
	bh=UVN348V7VAZTUF5Wa0ftGERbMNu9fnNa3x1psolbwgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZUnJxikrVSlSyIXd02LmYbGJpZ/G2ayDIAHJnwEyB2HJRSFpvxtVnjYpk/HVEYBxd
	 VhFQVBO1UKYF8Y2rnn08bJGkQLdFNnaNONdWMSUp2t3GZa+d0XVuQzazRcZIcoR5yl
	 gRDsZYzpTFSiuovhC2iAM50xm1JeLWmXAp+63V4evd3wJiKwXdogEUTj85Cmevm7La
	 rvpRTr1VF6Vy/cP3ukTd4Jw4w33ADmpvF7QGvAC9opxSOZJtQeV68rCbTVHo2GcOI7
	 E6m7LJg5KSOpjHJ4f+MiFDgimrYMPdRfB0VRzDknswXPQpg7IzI85qOd6KTGHcD+jN
	 Eh2K1Smy3Djkg==
Date: Mon, 12 May 2025 14:04:27 +0200
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
Subject: Re: [PATCH v4 0/9] More Rust bindings for device property reads
Message-ID: <aCHjy7Z5ezhbYP0m@pollux>
References: <20250504173154.488519-1-remo@buenzli.dev>
 <D9U5QMVLOCUU.2M8O7F9UA7FLE@buenzli.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9U5QMVLOCUU.2M8O7F9UA7FLE@buenzli.dev>

On Mon, May 12, 2025 at 01:49:27PM +0200, Remo Senekowitsch wrote:
> I haven't gotten any actionable feedback on this version.
> What's the next step?

I wasn't around for the last days, but I'm catching up now. Will go through this
version soon.

- Danilo
