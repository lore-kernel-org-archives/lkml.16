Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5758C28A1FE;
	Mon, 14 Apr 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655262; cv=none; b=LAVsp+TUBUlQWCGczGTQKEpzM44IvwqNfEsB4BPQ5MwzpW2dopGCn/XhXchBwwd87b8NtO1y3caqg/0lHFPeIi+gyOjca3wUqdu6FPE6sQoejOSSgFZgLPTbHFW2WHrdEUhWKPhuJqzW4BGSTRRhdpr9LqGkokmPP8XGqFJsYPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655262; c=relaxed/simple;
	bh=cIu9Se4STGRtfAiOdohENSs7XA+UdpGnMxi2NKjp0pM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8RPggf2Z+o5FebH5pql9a1II9h+8x/LLG0Bw3IIZP5UYv48AFfxuF+NMVV2nDl1aSgMWRsCVxQpItfelwLemLTpO5MFkQfSEhheqH863OsWSEfw5VDMCQzonhbaVOWU0YuJPJCFMVjyd/N8sjEtk8bwCb4n7sA24Ky4QNj4av0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCb7uoTk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCb7uoTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EE5C4CEE2;
	Mon, 14 Apr 2025 18:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744655261;
	bh=cIu9Se4STGRtfAiOdohENSs7XA+UdpGnMxi2NKjp0pM=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=nCb7uoTk5gII6T00rmswgQJtKiB7vAfu8fG8HoCX6i4Ob7ZnCaz+RXsqk9dFk7D65
	 q3H7GOqCFWFYgjcszZOnnYtJj4HZ4kWQc+fXk7Er6d5l/vowmnmkgXLD7rjdqTFPJn
	 9Cays1FbysrQnNrg6id6OHZE5IYCgZ3xvAprn7L+kO6dWoN/PzlJGeaQ7rG9CVo7xe
	 d4jaO4Js4Q5rm1uHwFn9Px36K/xjcd6W0xT7TrJfnQNZDZtn756uiXzoB2S267Tukt
	 M/6Uu+FBpOrnwsPZCPevHP3yeB1LP/CljVmOOiW/t0lFvr2CSR0BC+ya7+fjcQLq5S
	 c5fdQFxsaBAYA==
Date: Mon, 14 Apr 2025 20:27:35 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Ballance <andrewjballance@gmail.com>, a.hindborg@kernel.org,
	akpm@linux-foundation.org, alex.gaynor@gmail.com,
	aliceryhl@google.com, benno.lossin@proton.me,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, brauner@kernel.org,
	dingxiangfei2009@gmail.com, gary@garyguo.net,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maple-tree@lists.infradead.org,
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [RFC PATCH 2/2] rust: add maple tree abstractions
Message-ID: <Z_1Tl1yd_5XNMsw2@cassiopeiae>
References: <cons6o6begjlf4eu3wvhplimbrjtns553nugtblki7u23a3u3p@efca7vmgmr6w>
 <20250407200250.1671534-1-andrewjballance@gmail.com>
 <mjn2lz35u6joosddwrbgshgqitwx66fvpie5y4tledbcb2i5p2@gbp2sjva6iop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mjn2lz35u6joosddwrbgshgqitwx66fvpie5y4tledbcb2i5p2@gbp2sjva6iop>

On Mon, Apr 07, 2025 at 09:36:35PM -0400, Liam R. Howlett wrote:
> No, I don't think it is worth having a rust implementation right now as
> there are no users and I could cause issues on the rust side without
> knowing.

I may have a user for this in the future, but we still need to investigate other
options for this.

If you remember, I'd have loved to use this for DRM GPUVM, but unfortunately
failed since we would need to be able to pre-allocate multiple new entries
upfront, before knowing any details about the entries and before modifying the
tree.

With nova-core we may get another option to use it as VRAM allocator. But as
mentioned, we're still investigating.

- Danilo
