Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA11BF33F;
	Wed,  9 Apr 2025 16:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216143; cv=none; b=Qvjya4iguBIQ13nv/Q3yyUXNvTPvotsxSzPX+0dcWGTnjkjLsKhV0xnXz9FSnlcKAm94w6lICfdqoFNnLtCUGwJbXwuObYuOOacLFDHBfK6py401nB+kriR4JdNymV0IqvT5gdanv/md+HSgQDpWXo5V5mi4M+ipDmn3w0vB5yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216143; c=relaxed/simple;
	bh=1q+VSynmwPlJU7x8bslFD2SHwUAh5gUYIiUR0Udy/8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LByPeX0WZS0FBO3K8/B1bTf80qobQ2J7Xk0c6RcgojR5YAHCQG3SY2UMjZD5XlJjgrpYxchsKIdUbTgBW2iul3TSHVJ9t72bAknXz8pghskBNHVQB/nkkL/fbc5VZnXL5H7zxz1nGT7Vfnk4anRah08HGayPnEsYZO0pqHWcLRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZ7xuUxM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZ7xuUxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC88C4CEE3;
	Wed,  9 Apr 2025 16:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744216142;
	bh=1q+VSynmwPlJU7x8bslFD2SHwUAh5gUYIiUR0Udy/8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZ7xuUxMgK193/vloPthk0DdEqC6xqgVTZ2tv4qrUxfwPflPQeu64Wc1z2ve1i4wC
	 savT8q+JPWhHWAXM9qKH3P2CysPMI+H8NXPMOk/sADqIA6DAB3buTZJnOOAFNZIVcp
	 xtJ59dTw/q73luTZIcB+YnEXt0/P970/6Vyuq487Q7JJzQq94DHiDYCvTEthE3ECZE
	 N0fowb03flN7jgsWj1nNsLjDhfnsVDPtyeENaAqDuX3MlYm8kOFld2pfheQecXSH1X
	 Nt2CNZxpIaNjxZa1plq3c+89EGabUCvao75NbpjqHZXPR3QYDBVULQ6/dbKGkd7p8P
	 lIz9Am9lmbk4w==
Date: Wed, 9 Apr 2025 19:28:47 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z_agP1ohC3sVZrM7@kernel.org>
References: <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <Z_KnovvW7F2ZyzhX@kernel.org>
 <20250407141626.GB1557073@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407141626.GB1557073@nvidia.com>

On Mon, Apr 07, 2025 at 11:16:26AM -0300, Jason Gunthorpe wrote:
> On Sun, Apr 06, 2025 at 07:11:14PM +0300, Mike Rapoport wrote:
> 
> KHO needs to provide a way to give back an allocated struct page/folio
> that can be freed back to the buddy alloactor, of the proper
> order. Whatever you call that function it belongs to KHO as it is
> KHO's primary responsibility to manage the buddy allocator and the
> struct pages.

If order is only important for freeing memory back to page allocator, you
don't really need it. Freeing contiguous power-of-two number of pages with
proper alignment will give the same result, just a tad slower.
 
> Jason
> 

-- 
Sincerely yours,
Mike.
