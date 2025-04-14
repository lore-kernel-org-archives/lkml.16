Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC011624E9;
	Mon, 14 Apr 2025 18:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744653936; cv=none; b=jyFEISe8Pfxfivu9MhEmoE9KxHLFLvP/W5BtPtcjvuz/JvJRXUo8NEGu0bsZg0fDPvlVoEroIDV3xdpER0VH4aElVgvTP1uWaylaNh+z+o/noKgdih3Rm/ovEPDm9AUdBd6UGAZ7Mz+8Xu3jkpH2Rz4DhHYqNn48QJcBCrNRLdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744653936; c=relaxed/simple;
	bh=neZaO5r4sLtwQFB3OZqm9RjpLToPpDz7VMGozqpxoTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyFesGYiRbhVLh5Itvj9OZl6lppD823hir3gLomqE/O9Y9TQMlyEobOlKR+huEMyx6O29VfdnjfX/nnLg2TdSrHt58W7cys95aDcaFehPu+2UF9s52IGu/dIeLAv0g2TLZs+hxJo3twi2CZeeuMzXl/xis7RFaqOcMED0fyurhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N7C0zIh1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N7C0zIh1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F06EAC4CEE2;
	Mon, 14 Apr 2025 18:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744653935;
	bh=neZaO5r4sLtwQFB3OZqm9RjpLToPpDz7VMGozqpxoTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N7C0zIh1D7B8QdeQs+3TssGqZ6pvSYUAOjG0vnmh7dOwYyi55QLpHQRyWmwMqWsp7
	 OdMhTDwo3xCV5YLOW4pVQSOXBnQiKY2yGdHWz08cjVIvXzCT1eJnkVW9vPqOHIxfp4
	 IDWgCQWwbhqOEkoTRIgjWz7iNoTl4qXR1BC1ELNNwVyNf6oiXNJgT057zZywle1LKS
	 Fg8LNlsSl3qEVXlewfkhKkPfdoQLR7Wb88AbQzG+NBpMQ3EPxDxBC/b+bpD+bkXeOp
	 zHmWgAHeYclcx9KUYWmyCtWwTu12pfpj72SA/tpvb3Ge6/63dbK4Y7IcZU5voYQABp
	 3Fi11dg21jKGg==
Date: Mon, 14 Apr 2025 20:05:29 +0200
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
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/5] rust: Add bindings for reading device properties
Message-ID: <Z_1OaYt22_GJRX0b@cassiopeiae>
References: <20250326171411.590681-1-remo@buenzli.dev>
 <20250414152630.1691179-1-remo@buenzli.dev>
 <20250414152630.1691179-3-remo@buenzli.dev>
 <Z_1Jfs5DXD2vuzLj@cassiopeiae>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_1Jfs5DXD2vuzLj@cassiopeiae>

On Mon, Apr 14, 2025 at 07:44:36PM +0200, Danilo Krummrich wrote:
> On Mon, Apr 14, 2025 at 05:26:27PM +0200, Remo Senekowitsch wrote:
> > The device property API is a firmware agnostic API for reading
> > properties from firmware (DT/ACPI) devices nodes and swnodes.
> > 
> > While the C API takes a pointer to a caller allocated variable/buffer,
> > the rust API is designed to return a value and can be used in struct
> > initialization. Rust generics are also utilized to support different
> > types of properties where appropriate.
> > 
> > The PropertyGuard is a way to force users to specify whether a property
> > is supposed to be required or not. This allows us to move error
> > logging of missing required properties into core, preventing a lot of
> > boilerplate in drivers.
> 
> The patch adds a lot of thing, i.e.
>   * implement PropertyInt

I meant the Property trait and all its impls of course. :)

>   * implement PropertyGuard
>   * extend FwNode by a lot of functions
>   * extend Device by some property functions
