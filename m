Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A11C8611;
	Sat, 28 Jun 2025 15:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751124820; cv=none; b=a5rZ+kl1YDk+VzqpKTXsdwuQLhgv1OGl2ZbvMHN2xEhgsdLZmIGYxeu0N5Wtq1Ls0BM3dgkweq7Ou4wBMZQkFzDT0l4f8Bm7tRp+pomZRrHSWrv686dCembtq1t5f0WrPlcuNpPHEd7taeW2duGaD2JlnPKRP1t26wPG2NTwze8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751124820; c=relaxed/simple;
	bh=KGj+3Dao/fmvZlyjkuGLYx3Pal9ZeHYgMyOhMpi0bnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfjtUIDgpcVNTC0yfS2YYNpGbsGN6sM8CiTG85XaC1ko/L9Xd/EbvY+8du/wJQNvrBUr8KM7khl4dLpahkwk6mFmxni3leWv2D2bgdKholg6McpmgUv3rSLBQa2b7fYewfkHeuR7Orl00ziDIeYYJrlmnEo5Sv28zt3AM5WjQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JP3SfskJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JP3SfskJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED611C4CEEA;
	Sat, 28 Jun 2025 15:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751124818;
	bh=KGj+3Dao/fmvZlyjkuGLYx3Pal9ZeHYgMyOhMpi0bnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JP3SfskJgDjbj9JPNS3JtzknCSkvdcwyBeEWXCiR4uowz2HumlPW4XzSPd/UFapWB
	 UPWg2WokcOk9+CT1G7dQgjaZHsvVc/FRFJa4FqxOv0NpvZmamGfYluelrza81MlTqN
	 GDN7iWSCP5v1qBW3Kv/Dw6E0dk3yE8oGnCu1GXIokGujssEyUPZNJLn0v9CAHSnw02
	 FoIn2Pz1z2+GCgSYM6zGh1SOdQbvqYuEES7jeEt33Tmhv/oBHusnw+RexBua7hrj/K
	 49e3ybZm1CZu7oGlH4Cv+HZ64zHBm7y94CpV3qSOYFm2Vl1cz1upJLLz2cP52G4D6X
	 9N1CNmXZDZLtw==
Date: Sat, 28 Jun 2025 17:33:34 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 3/4] rust: add support for NUMA ids in allocations
Message-ID: <aGALTr28ER3-oGTh@pollux>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
 <20250628102611.2542910-1-vitaly.wool@konsulko.se>
 <aF_eLTlirxl-1jPP@pollux>
 <61DAD282-B00A-4809-B579-3F47F4781BBC@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61DAD282-B00A-4809-B579-3F47F4781BBC@konsulko.se>

On Sat, Jun 28, 2025 at 05:25:52PM +0200, Vitaly Wool wrote:
> 
> 
> > On Jun 28, 2025, at 2:21 PM, Danilo Krummrich <dakr@kernel.org> wrote:
> > 
> > On Sat, Jun 28, 2025 at 12:26:11PM +0200, Vitaly Wool wrote:
> >> +/// Non Uniform Memory Access (NUMA) node identifier
> >> +#[derive(Clone, Copy, PartialEq)]
> >> +pub struct NumaNode(i32);
> >> +
> >> +impl NumaNode {
> >> +    /// create a new NUMA node identifer (non-negative integer)
> >> +    /// returns EINVAL if a negative id is specified
> >> +    pub fn new(node: i32) -> Result<Self> {
> >> +        if node < 0 {
> >> +            return Err(EINVAL);
> >> +        }
> > 
> > Should we also check for MAX_NUMNODES?
> 
> Good point, thanks.
> 
> > 
> >> +        Ok(Self(node))
> >> +    }
> >> +}
> > 
> > <snip>
> > 
> >> +    /// Re-allocate an existing memory allocation to satisfy the requested `layout` and
> >> +    /// optionally a specific NUMA node request to allocate the memory for.
> > 
> > It's not an Option anymore, so we may want to drop 'optionally'. Also please
> > leave an empty line here.
> > 
> >> +    /// Systems employing a Non Uniform Memory Access (NUMA) architecture contain
> >> +    /// collections of hardware resources including processors, memory, and I/O buses,
> >> +    /// that comprise what is commonly known as a NUMA node.
> >> +    /// `nid` stands for NUMA id, i. e. NUMA node identifier, which is a non-negative
> >> +    /// integer if a node needs to be specified, or NUMA_NO_NODE if the caller doesn't care.
> > 
> > Please also explain what happens when the NumaNode changes between calls to
> > realloc_node().
> > 
> > Does it have to remain the same NumaNode? Do we need a safety requirement for
> > that?
> 
> Since we don’t implement that logic, we trust the C part. The current implementation will refuse to realloc for a different node, and I believe that is the right thing to do because transferring an allocation to a different node doesn’t go well with the concept of simple adjustment of the allocation size.
> 
> Do you believe it is necessary to explicitly state it here in the comments?

Yes, we should document what can be expected to happen in this case, i.e. that
it will cause an AllocError.
