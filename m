Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6181E22FC;
	Fri, 27 Jun 2025 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751049380; cv=none; b=Mlf3dxlHdDFz1koC1fmzhFlWYHrzO+4pQ4NDlZHg4HNgZLMGr5LTj/vPgwJKMf0tLf28a2E2hjwbNWOt0NJ07Z75baX+c256S0YBszabOG0sart1HMaM0KHHGazHLPhsUTcA4uso13bCjRzaezbSnFi18Tc6xYluAaUOwzSt8xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751049380; c=relaxed/simple;
	bh=UGlAEvHJZ5FkAhATIQUdtmRiAgmz7gNZLwYsF8dR8U4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6ylED2i2mmstHU9xzfldbXJtas4VwYkcVwKVowsmRvW7PPoWkgaZNwk2HdSvKGMFwBOLj/0A8ZKY3/jN6IEgqVV86U28MklUf86DTCn/2eD6dsHI/5xk0J3LDheNdnTXfMwpF3VvMWhVp840uaSVnfkfbjzhOF8wATbxwmMqCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fo/jcr08; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fo/jcr08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB35C4CEE3;
	Fri, 27 Jun 2025 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751049375;
	bh=UGlAEvHJZ5FkAhATIQUdtmRiAgmz7gNZLwYsF8dR8U4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fo/jcr08LnirSs5EZ6Ebxcg6zAv7uu8WZ11U5cpQA6Qf16QyAXDFnetYvTr0GMq58
	 PM0xrAKdWzqv9gRfSrsBKkW5XWhQQwEQNsmOy8LzoUI8hsXEnpK7qd00Szj5IHHbNP
	 8k+QJgxlQU6KOzc41XmdeWkbLPQpsAwNlOPnUarfZhiXsJmPZq0RJA7Sf9RtMfoMCi
	 hu8M4LgL7KVLA4VOLBjJzSeuHIPTs0a3WMXWd47zlfKCOfh/QYvKTvnxpdTspCzmbe
	 QgjYOHE7l6DwKlkcCswaXAgalcSN95qHBoDKPEBq3q68fqhDkij0Z+fpJnQTWQzGwo
	 odTg6CmBz/lmQ==
Date: Fri, 27 Jun 2025 20:36:11 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aF7km7nm9ggoj2AW@pollux>
References: <20250627181505.2080916-1-vitaly.wool@konsulko.se>
 <20250627181638.2081102-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627181638.2081102-1-vitaly.wool@konsulko.se>

On Fri, Jun 27, 2025 at 08:16:38PM +0200, Vitaly Wool wrote:
> Add support for specifying NUMA ids in Rust allocators as an Option
> (i. e. providing `None` as nid corresponds to NUMA_NO_NODE). To do
> this, modify ReallocFunc to use the new extended realloc primitives
> from the C side of the kernel (i. e. k[v]realloc_node/vrealloc_node)
> and add the new function alloc_node to the Allocator trait while
> keeping the existing one (alloc) for backward compatibility.
> 
> This will allow to specify node to use for allocation of e. g.
> {KV}Box, as well as for future NUMA aware users of the API.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>

Did you see [1]? I can't see the feedback being addressed.

[1] https://lore.kernel.org/lkml/aF5-a-bUp1pD5tiS@pollux/
