Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394EE20FAA8;
	Mon,  2 Jun 2025 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748865561; cv=none; b=t4SJ7FfThkMSzDj2Bny37L1n5fm+pECpfaXS8gfG5CLde33kFsI4Iay/M34jxAQwlaCDRZXafll7N3ogQSc5WtYm0z4Hysb7HJb9Y4Qx6K4fZ74vXRovggPdgE2MzyX2FOJfzIM7NZ3UFHZvSiVW+2jjUWY92duPzWyRF9qnJoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748865561; c=relaxed/simple;
	bh=v4VP9unh12AL136UdUGxszRm8EB2W+tnWbUHeEwMpKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H2pKhJUyYL6+AuclKFrGolOPTwI2tKOvJIoJ5UCwG2uPMx7BNGih2aEpIdIcO+dpam/iyTvjSQqE8W002gjx+vglAzjwcYIiYWzY3i3VQD1M0Wb3p0wt+gPhTI+Y4wQopSqJ+rQbK4iokZldddIl9JDBUAc3/7Kf0Dh+tI2L3IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=m0yTtOvn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="m0yTtOvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3054EC4CEEB;
	Mon,  2 Jun 2025 11:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748865560;
	bh=v4VP9unh12AL136UdUGxszRm8EB2W+tnWbUHeEwMpKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m0yTtOvnx+eMOPqsN2iw5RBQBIHdSS4WCQQOBN5WJIG24H0DAnC6Y3XiAXKqqkRy+
	 Hkj1arRfFgEzGPb0vgD/5vAZi41qMPpXkRrgtqiuJWHt4za6iY5TBKtNpB1p2OM47y
	 V+J2qS3pA9W4oHJ2lCSfQyx2igzrh+9OrGhazVlc=
Date: Mon, 2 Jun 2025 13:59:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Sai Vishnu <saivishnu725@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, me@kloenk.dev
Subject: Re: [PATCH v3] rust: doc: Clean up formatting in io.rs
Message-ID: <2025060238-vanilla-cardboard-eb74@gregkh>
References: <20250602083119.17752-2-saivishnu725@gmail.com>
 <2025060244-dragster-unknowing-23f0@gregkh>
 <CAFttn56vNVcE=pcGgxGrSZf=r=h_ceFwEf+D71yc9GnANww5Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFttn56vNVcE=pcGgxGrSZf=r=h_ceFwEf+D71yc9GnANww5Aw@mail.gmail.com>

On Mon, Jun 02, 2025 at 04:41:20PM +0530, Sai Vishnu wrote:
> > below the first --- line
> 
> Is it the one below the Signed off by line? To get the complete picture:
> 1. commit title
> 2. commit message
> 3. signed off and other tags
> ---
> 4. The version log or any other necessary comments
> 5. actual diff
> ---
> 
> Additionally, I suppose the `base-commit` tag should also be placed in
> 3 (above/below Signed-off-by), as it was added to the very end by
> `git` when generating the patch.

No, that is fine.

> I am sincerely apologizing for taking at least 4 versions for a simple
> fix, but I am trying to figure out how to properly create and send
> patches.
> This clearly explains what you meant:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#commentary

Yes, that is what you should be reading.

Also see the thousands of examples of good patches on the mailing lists
for real-world examples.

thanks,

greg k-h
