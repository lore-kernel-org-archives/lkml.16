Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC552628C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744619022; cv=none; b=FnehyFl1DhI26rm8TQAaJ7lkZHdpFi+N70jvmUXonqdm7LzXZcEdj4FWe108J94aTeUU7Knt1Lbagu5HtqWlkO2ZqV5eJDi/hBQB2nwafBKtgT6WgPHhLxjcQaVtr9nKQLSyz6QRZg4/E89YSsX8rqW4tb0g6HdKSqYR1qH5BQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744619022; c=relaxed/simple;
	bh=RXdhM4PFl9vkPOC8h9dCbKVEq25/Tptk3c1LQ3Iq0WM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFdVqi0Q57hR0MB3SuF7uTZNVV9arMVz+lKlrHBfCud9sR6i/+w5jou0uA/jiyr0l0E7Ovr0l3d+EZj+9cWehKuX2MKc0eWBZNLFEGeUlhYKSujlbACjQ4Rg63bZ24TqwdLe/jjzb+K42j0TTKBykmdI1GNu7vfLcFDo0VZcwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ruB+C2s3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ruB+C2s3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5941BC4CEE2;
	Mon, 14 Apr 2025 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744619021;
	bh=RXdhM4PFl9vkPOC8h9dCbKVEq25/Tptk3c1LQ3Iq0WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ruB+C2s3fmTi/Qy7wSYeudjhXLLEOWye4BfkZSHudxTUbRgT5CL/J3OKz1uKYJuYi
	 2ctBnUGgUCmJwFw0kcRnvPDRzhDdYqzPN3E3iTs0NSM1EnoJr9p5YLmXYFtmRFeew/
	 OSUN6a3ruC6OqKusN61QwrGA9gRPHPinjEmau1Mp0Clot1f8RMHNQcYEl7wWlYa7j3
	 2gxgzsncwuBMsbJO5q7xmUtCJFonAxmCI1tqcvpXZehAGFs9qucuHios7zL5qn/rA0
	 DWA6eocEL6A9glQh11Xvdlek1Wdo5WKvPqq47//sI/9BfZG2YN/ugqvtpEGWuuySje
	 zTRUIkvVpMEOA==
Date: Mon, 14 Apr 2025 10:23:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Sohil Mehta <sohil.mehta@intel.com>,
	"Chang S. Bae" <chang.seok.bae@intel.com>
Cc: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com
Subject: Re: [PATCH RFC v2a 5/9] x86/cpufeatures: Add X86_FEATURE_APX
Message-ID: <Z_zGCCNE_Qt3IlMZ@gmail.com>
References: <20250320234301.8342-6-chang.seok.bae@intel.com>
 <20250411161250.14662-1-chang.seok.bae@intel.com>
 <d076ee8c-0c22-4e99-964c-5ea254f5be14@intel.com>
 <7b91d929-fe97-44c6-aa94-05417bce1014@intel.com>
 <009062d3-d4db-443f-8337-ae4223efffa1@intel.com>
 <Z_onl1QbH9L1-8dq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_onl1QbH9L1-8dq@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> 
> * Sohil Mehta <sohil.mehta@intel.com> wrote:
> 
> > On 4/11/2025 11:23 AM, Chang S. Bae wrote:
> > 
> > > I've attached the patch revision.
> > > 
> > 
> > LGTM,
> > 
> > Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
> 
> Chang, mind sending a series of the latest version of all the pending 
> APX patches you have at the moment (and any other pending FPU patches 
> you may have), with Reviewed-by tags rolled in, etc., on top of:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/fpu

Note that this is now all in tip:x86/fpu, alongside with a rebased 
version of Chang S. Bae's preparatory patches for Intel APX:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/fpu

I think we could now start merging the rest of the APX patches, for 
v6.16 upstreaming.

Thanks,

	Ingo
