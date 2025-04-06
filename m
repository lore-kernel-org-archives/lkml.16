Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55318205E34;
	Sun,  6 Apr 2025 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743956016; cv=none; b=bsWHcUWP+7+NjiW7jrUjsmICTuDVfEdaW97VMMIhswn2Nap5MpzS4aJIa6oM3969/TSDH9UQEppv3AfVV/+KEkxDjCavHS96S2ArIYdoK1/23zkhmFc7U95ctKNB1xCK/2cuW08iiUQfegM8W5EF9sKZGUnsiTYUgVaxzvkgjKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743956016; c=relaxed/simple;
	bh=W0OMGEKRCIzqIrkZA9af/iDCd9Ojc329+ipStkNg+2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyNzvODiWg70o8JP7csdln/ATYKndx0FxdS1fEge/VMDuEKBXKKaxYFdpupitPPcHkP+xOKKHlY6d+3PQQ+WbK8Lk+08HkPzRPaEs0FT065SYENpRud2y6wf5VH3sslBeCIJabdDmFOxd+HMgw6ghakq8vYHQsyim1v6TXUdeXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lVL649ja; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lVL649ja"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D958C4CEE3;
	Sun,  6 Apr 2025 16:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743956015;
	bh=W0OMGEKRCIzqIrkZA9af/iDCd9Ojc329+ipStkNg+2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVL649jauEKYI4l+zYBSX7ppwy6IT04RV3unP/HxPdVIchTz9J7xinl7ighu53XJc
	 VInujhiYAW68CGsOaP8QA3dL8s/ECb6HJYdDLnKaEh8XCMv1JCLAVpujC3668IHOXT
	 jMy1/loS0VOWzECX6bTjCZin36JS3TKm1zBHmWiIee7BwnDJGcozLzX0IAXquRbBuu
	 engWpzJT15+C+mpkMxWTg3sLPTx5bTToRcsXa/K8RxtmsRJzxyxBDSm2Kg1A5m1Mvx
	 FAV+YRjrpYEr6Sooj9ZzL6hh7r4S4m+SWRgQ9AXjP+eUXOAWs/Mu8eErqLF6D4bfBn
	 Ji+To1URvuL+w==
Date: Sun, 6 Apr 2025 19:13:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pratyush Yadav <ptyadav@amazon.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Changyuan Lyu <changyuanl@google.com>,
	linux-kernel@vger.kernel.org, graf@amazon.com,
	akpm@linux-foundation.org, luto@kernel.org,
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
Message-ID: <Z_KoHxDLzrzQAjhK@kernel.org>
References: <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
 <Z--sUYCvP3Q8nT8e@kernel.org>
 <20250404124729.GH342109@nvidia.com>
 <Z-_kSXrHWU5Bf3sV@kernel.org>
 <20250404143031.GB1336818@nvidia.com>
 <mafs08qofq4h5.fsf@amazon.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mafs08qofq4h5.fsf@amazon.de>

On Fri, Apr 04, 2025 at 04:24:54PM +0000, Pratyush Yadav wrote:
> On Fri, Apr 04 2025, Jason Gunthorpe wrote:
> >
> > I'm pretty sure this is going to be the best performance path, but I
> > have no idea how invasive it would be to the buddy alloactor to make
> > it work.
> 
> I don't imagine it would be that invasive TBH. memblock_free_pages()
> already checks for kmsan_memblock_free_pages() or
> early_page_initialised(), it can also check for kho_page() just as
> easily.

And how does it help us? 

> -- 
> Regards,
> Pratyush Yadav
> 

-- 
Sincerely yours,
Mike.
