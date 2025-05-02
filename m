Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5CA267AFB;
	Fri,  2 May 2025 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746171904; cv=none; b=NgKs2BtVMKjXvFtbMX1qgejmWpXqzCT3LVoICuO29NquVEwgQCom9RXNkxT3q32lmt7nXW9LD0Ig0Qim8QZfEv0FP1w4sIBuAx4PBBPeqj1PrmIDQ4+3/D52m8XoNIj9imIA+RyGyMfwri0nylAtRnjcdOlPZKP2su69HpxBiqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746171904; c=relaxed/simple;
	bh=3UFf+SWKMS7v6/zsF9J+zoMK9moancOfUNZ8sFnC2HE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGsKmuGBCTAgrQQO4tylzRR4EkJJExrCFE7fmBEPpMC7EazFrw6CE2LxSqQ6M1dk+vCQlYf7ozSBJgz2YuZ7lRE0BExnGpYXPFbBfUqEyGYuEy/gt5ZyPV1zWWFmuRJDmbB7fq11eGN2llzuWCcy5hdIjHbsWKE6Nt0vZGQ4Lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p57Cfcjw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p57Cfcjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5DDC4CEE4;
	Fri,  2 May 2025 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746171903;
	bh=3UFf+SWKMS7v6/zsF9J+zoMK9moancOfUNZ8sFnC2HE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p57Cfcjw6Z6Ai9dPHSTjRANOeXCL2V0nuEcRgSHPy4n3sbDU42hrUZyat1rvnaGi4
	 cE0F4YTt4g8oOhLzfyV3+q5ErLQLy48pCKk3Gpq0Nu1wqiET7/fW5uI76VTB0RpXjI
	 2N/4o0uD4L5DkqMSaS7/5ofCkGjY+XOX9K29HMZmoijj3bDNIQwQ+4clDUvUHjR9fj
	 0RKfmxTvuWg+yKimPbPkEhmD4SIkF6Dm7YPLOcRp82c2i66SC/eK5m9st7WLEJ3arw
	 QSgGNRSufiK/C2dszI6PPD1cvyYHBdF+DrgusLXM1grGvPVQEFSbDOih6pYZsI9CWH
	 QxWMh3qpE9alw==
Date: Fri, 2 May 2025 09:44:57 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 4/4] rust: samples: Add debugfs sample
Message-ID: <aBR3-Ry616ghAuGc@pollux>
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
 <20250501-debugfs-rust-v3-4-850869fab672@google.com>
 <aBRtrfTaaC3Vk9fL@pollux>
 <2025050253-wriggly-pod-e420@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050253-wriggly-pod-e420@gregkh>

On Fri, May 02, 2025 at 09:13:28AM +0200, Greg Kroah-Hartman wrote:
> AND how to have maintainers review code that uses the api that are
> not that familiar with how Rust does things.

That sounds very reasonable -- I like it!
