Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3B27817D;
	Mon, 19 May 2025 13:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661432; cv=none; b=T2eWwnKOd4JmjzEmcMiODTzpzkI6J7ejmqVNYCSDZ3ADnrZ3AcLHE3P+bA0L1gHOOePojliKy7pcTiyo8T+4aifkEzbIn/GAyCL76sLPXcxfpyasi9J1tDNjDH/HpgXBlhOgKWC8oe4boa0m1+j3VoXDm5/a2gXaz1ATPAXXFF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661432; c=relaxed/simple;
	bh=DPoruo9qQTrNctWvWNyzHaBywaGz8a9+j/y1eqiQf2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u45UrrtCH+ySlc4lU5GznNtBW/jVtJd83YE9K4QCKnZYBFSJXDP+g43TTCj4ak/VTbltbd0+bz4GP09IVKCCtiP+Yu2aIoW/IfxGo30nOngPnVvDEIlRZyKnEtv4OYYxJmu/6ETpEuD1gKwsLau51a3djcZmgaVxfppG+YN0Waw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pY9rjHj2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pY9rjHj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD800C4CEF0;
	Mon, 19 May 2025 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747661431;
	bh=DPoruo9qQTrNctWvWNyzHaBywaGz8a9+j/y1eqiQf2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pY9rjHj2fcKhknt0g0a8DTsxJ6X+mJyeKHcHw+fmJrxiPLzmFYFfrWrhKxWaqVFMn
	 TWu7RNV5LYObBLB7EP8tPlbORI1nxyJBc2eCXA6fOShl73WEZkHqP+Mz5JiVFWgMFs
	 dbzYtN5X3zDCAMtj6nEnTFqosyfaObsdklDX+Nix995PnKz3Xh/hSOal5pTbnE9Uzg
	 7FaGUyeeoSS1LuIYO25QT/smyMQRTmjGtB43gysXScFsgMyozXRPZyPqBKkXJWWavw
	 /K32rG2BIYcPnm4Wk8ZZZHcazCnMWLfh2FJG5PVd5Fby6aMcqugwiTMtHl4YBH57Th
	 wb2kfr2VI4pXA==
Date: Mon, 19 May 2025 08:30:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: ~lkcamp/patches@lists.sr.ht, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add VZ89TE to trivial
Message-ID: <174766142752.2072750.16067990362790818431.robh@kernel.org>
References: <20250515000225.79239-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515000225.79239-1-rodrigo.gobbi.7@gmail.com>


On Wed, 14 May 2025 21:00:40 -0300, Rodrigo Gobbi wrote:
> Add sgx,vz89te partnumber since it is equivalent to sgx,vz89x,
> which is at trivial-devices.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> At [1] "add support for VZ89TE part" was added, but
> no binding were updated. This is similar to a existing trivial
> device, so just add it.
> Tks and regards.
> 
> [1] https://github.com/torvalds/linux/commit/0a735aa07f2eb5bcb04fb022b463c70cd1cf1399
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

