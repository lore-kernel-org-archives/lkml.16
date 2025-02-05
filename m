Received: from gimli.kloenk.de (gimli.kloenk.de [49.12.72.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C01E0DE4;
	Wed,  5 Feb 2025 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.72.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738785551; cv=none; b=EVQQ8+hrBegY0HkzWnyOZxVYqOJsW8uYk/iKQgwXiJ6MymqRF/sH1bDkF/d8fm5PghoO18DKT8w80Npiae8EbPuIWdtSH7oxJzM8pJfbRO0d68x7WzGABD0nc2kHqlzI1OZ3jOqmlgbaU3XhcZLtcXSGTA1F2PsTctu1AWvzcPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738785551; c=relaxed/simple;
	bh=B1PbU4M3lkVHBG8eHqdlluIItYRqlGQEErNp89aV+L8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U9Jd3uJ/Pcr+k8X6MbscfAnoIulZz7rLXCROcuk1DgCCThXkrlQFPWtTNDFE6ePhu1VCE/fJktES718MmQAr6f/JWOXXo4xf1YVrY5J0Pr3+EjROLWcCFqjChf7Z2fi5E26uprkIOeEgd2rHvfVZl9rQHCSLzmQ01BYCtMDBTHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev; spf=pass smtp.mailfrom=kloenk.dev; dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b=H/lq+uFw; arc=none smtp.client-ip=49.12.72.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kloenk.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kloenk.dev header.i=@kloenk.dev header.b="H/lq+uFw"
From: Fiona Behrens <me@kloenk.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kloenk.dev; s=mail;
	t=1738785544; bh=B1PbU4M3lkVHBG8eHqdlluIItYRqlGQEErNp89aV+L8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=H/lq+uFwg7FORHozIJJfvM5upS2y+LwKV/JjtiypPqZ/AnoZHthzcW/SJ3tCpynGV
	 /Qi9HSXeDrC29fqTZQHOI2oy5gQrczmDnDtR0UsFzZ+hr3GhVBT9HwZh0nuz4ScbH+
	 UfggvxakgbMkWdICd5kDWlYsMehmr3K0KZC9Hfts=
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,  Miguel Ojeda <ojeda@kernel.org>,
  Alex Gaynor <alex.gaynor@gmail.com>,  Boqun Feng <boqun.feng@gmail.com>,
  Gary Guo <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,
  Benno Lossin <benno.lossin@proton.me>,  Alice Ryhl
 <aliceryhl@google.com>,  Trevor Gross <tmgross@umich.edu>,  Joel Becker
 <jlbec@evilplan.org>,  Christoph Hellwig <hch@lst.de>,
  rust-for-linux@vger.kernel.org,  linux-kernel@vger.kernel.org,  Tamir
 Duberstein <tamird@gmail.com>
Subject: Re: [PATCH 1/4] rust: types: add `ForeignOwnable::PointedTo`
In-Reply-To: <20250131-configfs-v1-1-87947611401c@kernel.org> (Andreas
	Hindborg's message of "Fri, 31 Jan 2025 14:30:08 +0100")
References: <20250131-configfs-v1-0-87947611401c@kernel.org>
	<20250131-configfs-v1-1-87947611401c@kernel.org>
Date: Wed, 05 Feb 2025 20:59:03 +0100
Message-ID: <87bjvgp3i0.fsf@kloenk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Hindborg <a.hindborg@kernel.org> writes:

> From: Tamir Duberstein <tamird@gmail.com>
>
> Allow implementors to specify the foreign pointer type; this exposes
> information about the pointed-to type such as its alignment.
>
> This requires the trait to be `unsafe` since it is now possible for
> implementors to break soundness by returning a misaligned pointer.
>
> Encoding the pointer type in the trait (and avoiding pointer casts)
> allows the compiler to check that implementors return the correct
> pointer type. This is preferable to directly encoding the alignment in
> the trait using a constant as the compiler would be unable to check it.
>
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>

Reviewed-by: Fiona Behrens <me@kloenk.dev>

