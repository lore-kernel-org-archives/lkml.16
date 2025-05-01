Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4897E21B90B
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746095950; cv=none; b=Y3/Xn4HMtewniEqaVJ/J/iBHOym1R9SQNQbOXrPREUXdaLRh5efZxweQ1kOB0PAE8Fk3Q1oMQFLoVNEil9TcD4tHOvP7/80b9qs5FCMHxR7ioCnmPlYm+s/QG/HAn3QBQTZWUP+38xLL7ieH1BWJNl+4/ZX09T9YMSrNcehELmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746095950; c=relaxed/simple;
	bh=VQ59kI4qxTXxFxMVf6562ICjT4GIW+w3akR+aEPxnmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NK5s++D/rUjlWGI4MZO8PpRAHYSwu6gD8fbFqaHUnCaYpp/Pml1Ckpv9BgZ2ywH1PTEPViA8wC1h19CLlwHOUwUv74OctbybqCkPSdqi7Lh0KTcgnbMH0JR6SK/Jwja7nW7GJ1Ebqf+rPdpJarPDW6TamY55LMudt7ylORJ/a4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E1BC4CEE3;
	Thu,  1 May 2025 10:39:08 +0000 (UTC)
Date: Thu, 1 May 2025 11:39:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Luiz Capitulino <luizcap@redhat.com>
Cc: lcapitulino@gmail.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	david@redhat.com
Subject: Re: [PATCH 1/3] mm: kmemleak: drop kmemleak_warning variable
Message-ID: <aBNPSlsf-HIW6xeV@arm.com>
References: <cover.1746046744.git.luizcap@redhat.com>
 <97e23faa7b67099027a1094c9438da5f72e037af.1746046744.git.luizcap@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e23faa7b67099027a1094c9438da5f72e037af.1746046744.git.luizcap@redhat.com>

On Wed, Apr 30, 2025 at 04:59:45PM -0400, Luiz Capitulino wrote:
> The kmemleak_warning variable is not used since commit c5665868183f ("mm:
> kmemleak: use the memory pool for early allocations"), drop it.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
