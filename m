Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8118C22688C;
	Tue,  3 Jun 2025 22:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748991242; cv=none; b=jlsukX7qP5DYUSloG7BoDW0yBD1kEDMOYCHW6+7hzOWT1864H8rOKrSbWfu8lhtZp3tfWxabrGwbNvvLrZ109ppACp+Z5c9fFzVXppaSzv7UN2upSLYxoljmqhBoOlrWBpWi4qTdgW8WZRADlwFOMGTi+1sFaKvjz8tLCDMPnA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748991242; c=relaxed/simple;
	bh=/WogzThYcDrkaGD5+tbfG99pqzoVtuU8upkXweLfeGg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QsAk1BhMCYiAyOZbWtcLzaLTH0TdoA/5QnlBN7r0UzAjSgUvFcymbfLpNXdFbwAoZU6DXwpaO4+SQcboteUVcMp4VGa7u00OO/io7d6OAIK/ABUPsVzNysHgxYdt0YDjhEEe4cPUKMMMj/ghVC7LJ8y+0BIIXTtW1aRtD43bTuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vR4WSSkw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vR4WSSkw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ACD1C4CEED;
	Tue,  3 Jun 2025 22:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748991242;
	bh=/WogzThYcDrkaGD5+tbfG99pqzoVtuU8upkXweLfeGg=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=vR4WSSkwjWc7+MIDx5kQ7h1lUGN9qHfwZaooBTnk/6jljnxEf7hIBnCavCXqPy66J
	 g3p0hWqc8Og46r80WqG/38Gq3HwyBJGBbnZGvS7uxDvo9oEymBi5+IiPpnP4+RXlx8
	 Xp9ueXLfWQTAA3lrebMVjTL8OtM6F7hqMehMefM7GW8f3Y3QTmraILDfnmgE69LEe6
	 fIqGDpAFMDB1U1poNrQaGZQZdkjFNd2zG/FHoioroboHQjxY24rMRAs2BT4ZKHOjYk
	 BcbfQ/6yvZYiSRkNYVu62yPX9WrGdhc2ls2/hmsXxnlvL7VzsZqLwG+PD5YX/IIsXb
	 A2O/oYXdRRVWA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 00:53:55 +0200
Message-Id: <DAD9NDFY2RXV.3LDMFVUYN0IKD@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
From: "Benno Lossin" <lossin@kernel.org>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
 <DA82KFLNAOG7.R7YT4BHCLNZQ@kernel.org>
 <DA88YHU4AZT7.B8JGZHW9P9L9@nvidia.com>
 <DA8GTD7LT7KO.1A3LBQGEQTCEW@kernel.org> <aD1xVkggDrCvA7ve@pollux>
In-Reply-To: <aD1xVkggDrCvA7ve@pollux>

On Mon Jun 2, 2025 at 11:39 AM CEST, Danilo Krummrich wrote:
> On Thu, May 29, 2025 at 09:27:33AM +0200, Benno Lossin wrote:
>> That's also fair, but we lose the constness of `next_multiple_of`, so
>> you can't use `align_up` in a const function. That might confuse people
>> and then they write their own const helper function... I'd prefer we use
>> all functions that are available in the stdlib.
>
> Considering that, what's the suggestion for this trait?
>
> I don't think we should have a trait with align_down() and fls() only and
> otherwise use next_multiple_of(), i.e. mix things up.

Agreed.

> I think we should either align with the Rust nomenclature - whatever this=
 means
> for fls() - or implement the trait with all three methods.

The longterm perspective would be to choose the Rust one. But I'd also
understand if people want the kernel's own terms used. Still I prefer
the Rust ones :)

---
Cheers,
Benno
