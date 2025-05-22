Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ADA2B9A9;
	Thu, 22 May 2025 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747945425; cv=none; b=i6Ascqqoskf9SuoymAjFfalc5vvwJncVtDYi64nAy3hPO9zRfo0XDEGX2UveTk8hgp6wyG40qr01BmYLHyr5QsQryLwly254/ZCOILLBupIew3FSSNoJ9RniGg0qIHoTYKTuqR1eEDGDTrpfZzdxyMRb1l0vGBTlmvvXCNPZ6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747945425; c=relaxed/simple;
	bh=E1s2k+OqF7aUtK9ryhNiv9y9CdlZsiwKLBCfieHzXP4=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=c7MObz7+zPU7l5ufH2bL2pxA3OFfrUj+DltDFd2Zl1VbY4DY7/Til6v/s3827qykcd/WJPP42vIKy6cfLEg9dn8rNm9ldlp7Zjth0u+NKmYzlbiUkl9oCYj0KKMiazxjdNKcv6QxDchuncrchU+C7GC4EZOnKzZ94U+DM6QtJdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM0R04bG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM0R04bG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FB5C4CEED;
	Thu, 22 May 2025 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747945424;
	bh=E1s2k+OqF7aUtK9ryhNiv9y9CdlZsiwKLBCfieHzXP4=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=nM0R04bGYP3DJ+yXZcrUKd5iudfA9EVgoL7Nz0FMwOoYtoVoeIjH8fxLM2omAsdB7
	 87cezrXn7uieGVxt5ngUtrKybuaORa0F47W4/2Y4k+MGfC0PkILjzb5+cy6YjHc1fd
	 iaP9lLMUPElA77lt0QQlV14bDjlTyWG+8ntntv91Fh+6U5FIvohZq9oJCXiHRPwYq2
	 NOiazUwJZtPDfhyVsVKT+RiXj6H6SmnA/cDB16r3CCE19LuDOYY2gSoKBIi7YoFr4P
	 DgsY4kmRqxZv3u4Y+YYLVWBA1xeoHd7rrXq0Mhl43ciR+zziU+NMUVBH76z+Y89jmz
	 X3jmzCrKJgIWQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 May 2025 22:23:38 +0200
Message-Id: <DA2YXRX9SZ2X.1IKN8JA0UXL1Z@kernel.org>
To: "Remo Senekowitsch" <remo@buenzli.dev>, "Rob Herring" <robh@kernel.org>,
 "Saravana Kannan" <saravanak@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Dirk Behme" <dirk.behme@de.bosch.com>
Cc: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 6/9] rust: device: Implement accessors for firmware
 properties
From: "Benno Lossin" <lossin@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250520200024.268655-1-remo@buenzli.dev>
 <20250520200024.268655-7-remo@buenzli.dev>
In-Reply-To: <20250520200024.268655-7-remo@buenzli.dev>

On Tue May 20, 2025 at 10:00 PM CEST, Remo Senekowitsch wrote:
> Add methods to FwNode for reading several firmware property types like
> strings, integers and arrays.
>
> Most types are read with the generic `property_read` method. There are
> two exceptions:
>
> * `property_read_bool` cannot fail, so the fallible function signature
>   of `property_read` would not make sense for reading booleans.
>
> * `property_read_array_vec` can fail because of a dynamic memory
>   allocation. This error must be handled separately, leading to a
>   different function signature than `property_read`.
>
> The traits `Property` and `PropertyInt` drive the generic behavior
> of `property_read`. `PropertyInt` is necessary to associate
> specific integer types with the C functions to read them. While
> there is a C function to read integers of generic sizes called
> `fwnode_property_read_int_array`, it was preferred not to make this
> public.
>
> Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
> ---
>  rust/kernel/device/property.rs | 253 ++++++++++++++++++++++++++++++++-
>  1 file changed, 251 insertions(+), 2 deletions(-)

I already like this design much better than your previous version.

I probably won't have the time to review the other patches, but one
thing that I notice was the lack of lists in `SAFETY` comments. If there
are multiple justification in a single `SAFETY` comment, we us a bullet
markdown list. (same for requirements in a `# Safety` section)

---
Cheers,
Benno
