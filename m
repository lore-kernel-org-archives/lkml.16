Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D79230274
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745305228; cv=none; b=gVhZQIiVKnc3Y+TizU+Pf0R0JvUj8F4ghlLq+quNNJJEIGig6iSxSqF07GmM8uMW+9oCWkgGUp3bkmUHc/r+3aI4GoDHoAv15zPRsnOMvWBdbDIozR+tg73d28uTQcZ/cFjIKB6WqNCqugeDhEt/gNx7W69DY5o9N3SpezMsQSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745305228; c=relaxed/simple;
	bh=OnhJem8wDKvYG1wfpXkdizyH5nqV/7CdTNEKjrvFSyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OizGogCCZj/mW4F1XRf7cWT1JuE3i8RfhF5ar0r5KTL7Byg4Cs1wHHxzOT+QKZa1bbkdVBPEpRKF55my2geALSLuWb8mBowue5IE0JfnNGAzS6G6o54AyshUzRHgvRUeBnRzpKxRJScYHiSCNS/30DazIU6l/pG4B1HuaZUEbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KlPWqp8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KlPWqp8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79463C4CEEC;
	Tue, 22 Apr 2025 07:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745305227;
	bh=OnhJem8wDKvYG1wfpXkdizyH5nqV/7CdTNEKjrvFSyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KlPWqp8TQgFETfYLAvudfzAo7tRlCJKuVJztUkGKxB913aXlP2eZIu/uwDP4Sg5qn
	 Z7mMx9mvvQ2b2UUBL9xJ2QqF5YPKkMyXlzBDP4T0Si0OMbFOvDnl4bvcKDvBbpdLPV
	 c5aiWyTulfQ6gIC2Ml6AMKbiMjmWLc9DnfY9goggczhCzx8QVPDjHvshOgFIKxsvv6
	 Xn5Joic+Q42SUbNMr/8PImInI2GYnwX6swtzAvWFWo89Y8dWYddDfyh35saCkbHcdK
	 3Ej8F0wnxyOgS94Wbhlf7+iURYOx1ol6XAOu1KcNdndlafKK9ltH6Ay6oZESRqm+L1
	 P7LM7iaqRIWYQ==
Date: Tue, 22 Apr 2025 09:00:23 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Qu Wenruo <quwenruo.btrfs@gmx.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Dave Hansen <dave.hansen@intel.com>, x86-ml <x86@kernel.org>
Subject: Re: Kernel 6.15-rc2 unable to boot on 32bit x86 with PAE
Message-ID: <aAc-h1TJV7do7JXa@gmail.com>
References: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>
 <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Fri, Apr 18, 2025 at 08:31:23PM +0930, Qu Wenruo wrote:
> > Hi,
> > 
> > Recently I'm testing a situation where highmem is involved, thus I'm
> > building the latest 32bit x86 with HIGHMEM and PAE, and run it inside a qemu
> > VM.
> 
> Does that fix it:
> 
> https://git.kernel.org/tip/1e07b9fad022e0e02215150ca1e20912e78e8ec1
> 
> ?

That commit caused other problems - the best fix we have right now is:

	https://git.kernel.org/tip/83b2d345e1786fdab96fc2b52942eebde125e7cd

Thanks,

	Ingo
