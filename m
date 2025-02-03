Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7E200118;
	Mon,  3 Feb 2025 10:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738578153; cv=none; b=X1L3dd/upqW4hV1n0h08aIVEB+VY8HCJjac5rBJbunCkhJAylLmLsHFeoIMVWr2hdYfSXqvw58yqLPSxrlenfEQDJihS2wa1DQbmUUkRYCAX5mczckMn/312kVgn3h03cJsGpD9qXenHqgeykKEcyOF8pO5ESjHDf3D4nDc2h5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738578153; c=relaxed/simple;
	bh=QzJQs59tEMAegxo4auqHQLZZzupL3/wsbia0GWupvw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGL/+jTHf4MeiwnOVW8UbPOWpnUHQVsdPj+C7huqY8v3Msdj+NmtNUG9kOBLJJOdMgCM2XQEyCQsKY4Op+Ubhh5msP2TZkSZNTwyLbnd9MVTBfpWaCNjrhUFpGOi5mv6LYaZigoy6HSmFpAw5oaVdf4KT1tG1TohE11hzVvv+iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a96bAOTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a96bAOTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7562AC4CED2;
	Mon,  3 Feb 2025 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738578152;
	bh=QzJQs59tEMAegxo4auqHQLZZzupL3/wsbia0GWupvw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a96bAOTdjg7CJwmyNWQVcN35ZihqL+2eDwsatvfj4nRcVoaNMFZ8qHJLBodyZLPGf
	 7HQthVCaL6Am5Q/crAl49hcF1vgPn+dqoauUxX9c1qkn6F1vfjpNdQibHWBhkDrWC4
	 eedvtxFVO+MNADuzcyzS7xhzMTTqXwG7u8Ng7sMI9dLkEX3IDWSBgF08ry4P/9XNqm
	 b0GfVZ6Rh2jSsGd8sIvf1HptuaFKY0LoQaH1ajUAbGHUdkv1QDO2QnuFEnK3qGO3W7
	 GnqBtyzUYZ26qg9OoAnP0pwak4Ej42ou/y2RMY4bi6L6RX/Md8SeYWSXf0bN9FreIl
	 Q4BpfsrMlKjrQ==
Date: Mon, 3 Feb 2025 11:22:25 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <Z6CY4TvZwLkWmB3I@pollux>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>

Hi Lina,

On Sun, Feb 02, 2025 at 10:05:42PM +0900, Asahi Lina wrote:
> This series refactors the existing Page wrapper to support borrowing
> `struct page` objects without ownership on the Rust side, and converting
> page references to/from physical memory addresses.

Thanks for picking this up!

As you know, this has been previously worked on by Abdiel. Kindly drop a note
if you intend to pick up something up next time, such that we don't end up doing
duplicated work.

- Danilo
