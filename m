Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3551A94F;
	Thu, 29 May 2025 00:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748478313; cv=none; b=lQoiYsP3Tx8Qud/QoVuRfYk2ID23pLi4VlVY60k9ttaXC91+VREsqiiQaW9+cJshZedK5vlaZKZmgJoe+pw+K51jVms+tLA5TVwzG5BxgBy4BYuGuFhhnCH25EYImljLTIX59+X9HZzdy+fOZoNaIUHX+Pcb5DQyppR42+luuog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748478313; c=relaxed/simple;
	bh=ECHdWWZKvm0KJzc6AblTSgqQuj41CrYftt18OEBTeh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+pEduXXgvknDxt+rXfF08XZC+2OBOPC0HOENe39YlICouWdGddW9ECTQiTzCD/qjl4Lnixst7c014o01WY6WK5AvzP76zsoHtLhebveZhGvsDvYNWDqtiNvyBRcfYlX0frvj+BRucU9nidBIigJGORNJQH2IDY2riQ0vOPzZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KP+DqqoU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KP+DqqoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF7DC4CEE3;
	Thu, 29 May 2025 00:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748478313;
	bh=ECHdWWZKvm0KJzc6AblTSgqQuj41CrYftt18OEBTeh0=;
	h=Date:From:To:Cc:Subject:From;
	b=KP+DqqoUGqpai39Q1CmpI1Xjhiv96ATYJjWkyk6Ehpll8U9hs6AESVXgTo3J3z5bC
	 OA2YMSgUD3fK58z+LTLja8q5o4twmxTokv2y4kmh+o8Sn9aAvdXHwwLDyQozvlsTGN
	 p/sZjvuOyK0IfLH5G68rEweX/cyG6jXdNgNsYbeNUeVU3vyH3965dn45Te9UCXakan
	 iN73VEXwpuB0yEyc6sFo2ARn3hnN48cj/uoJ2WQiCtvHVVYhc2KWZgBE6zZDvgOD92
	 oL245IMY6srQw9rkKLb2Vmg2ayac4B8D1pnnw5l6X1FKQuvSlr9wuoZM5kYgFD4jo5
	 2g3ujmXRcmjPA==
Date: Wed, 28 May 2025 17:25:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.6 uploaded
Message-ID: <20250529002509.GA161456@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.6 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 20.x
series is no longer supported.

Cheers,
Nathan
