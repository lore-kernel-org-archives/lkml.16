Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D9A19D89B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771805; cv=none; b=CuKDdUXKvCgUI7sdIgiSehtsGeu9HaJ0rUcxJ7GiMtfY80vqA56/Slv3JxnxyBGL2eYVZh9h92nH9FiSH0Reaa9KMctxGAo4yJW6MCOcLahdMNgS1QqsLUtnb5bW4/QTSYwLR4nMODJbWRhYhEzGf0ZzVdkbu1TRo0rt58EC09I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771805; c=relaxed/simple;
	bh=VKS0+pJnSKPr/yDgnLfPzCkGDWYd0/lQhSYDHe/+6dA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6VRBlxAgbvN6VYw7sWEPd9rG/Fb3eBTAfJgQMok2ronPERSjorvui2kLGDG7ncePYDoSOsyu+mRELYxUgmP8Ylw/RTdi7tHKhEFKXiJq3N8aH0M9w/s/7WhjRFUcHiIQLiIi+//8U/TyRx1BwlCAGRYgW59RlvZNflFbEq+Ea0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm4Os5c5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm4Os5c5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04D4C4CEDD;
	Fri,  4 Apr 2025 13:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743771804;
	bh=VKS0+pJnSKPr/yDgnLfPzCkGDWYd0/lQhSYDHe/+6dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dm4Os5c5HiiHKMFMLtyK10MrkoouADFBXOuGYhZ9NYG+RKuB0danG9d8b1/q5omIF
	 TrX9YYN13EKoFIZLIYiBlKHe+lKAcEy1L1g1uHbrpWb8ZPmTknjZk083ADJ7CY4T9h
	 ZKs8y5mZcWkDa3RMOaR1U7pzSypZKfs16w32fRSnPcPOYVNnQi/+sfQD6E7YA2Jzqh
	 rdlCOzX5MN1Rvbu81k42Hk05CJZhvpHd3arNK4CwcrLgvDgWrLofzEhxG2M/PdBEok
	 /lwFrGViHa5QLWag+ztYyVMDN9qMS503HOZ2vJ9ao3p3ODZmgeY/pFXatvyMA+Wd29
	 QzHfPBFrdA+xw==
Date: Fri, 4 Apr 2025 14:03:17 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Eric Auger <eauger@redhat.com>,
	Wilco Dijkstra <wilco.dijkstra@arm.com>,
	Eric Auger <eric.auger@redhat.com>,
	Florian Weimer <fweimer@redhat.com>, Fuad Tabba <tabba@google.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	James Clark <james.clark@linaro.org>
Subject: Re: [PATCH 00/10] KVM: arm64: Backport of SVE fixes to v5.15
Message-ID: <20250404130316.GB29089@willie-the-truck>
References: <20250402-stable-sve-5-15-v1-0-84d0e5ff1102@kernel.org>
 <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b4ce8d2-2e0e-49ef-ab91-4a831e22b8ed@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 03, 2025 at 12:16:20AM +0100, Mark Brown wrote:
> On Wed, Apr 02, 2025 at 11:59:32PM +0100, Mark Brown wrote:
> > This series backports some recent fixes for SVE/KVM interactions from
> > Mark Rutland to v5.15.
> 
> *sigh* Forgot Greg and the stable list here - will resend, sorry for the
> noise.

I think you made the same mistake on the 6.1 backports too:

https://lore.kernel.org/r/20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org

Will
