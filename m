Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59F225A357;
	Wed,  9 Apr 2025 08:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744188684; cv=none; b=kmIjrel3Pxuw6BuoA2CksKEurR6sOnEckIPZtk50TyjqU2cf8Vm3cqA+5udC2jrhksc2QhqAa/cWxNuIp4otBYhn0yY0R4vsSd9yVNAiZKNm5np1oqed93FVvAXa1djwFkxRiyQpcHl/lQS2SvuGl+Sfa3ObeKqmLMeWUrbLyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744188684; c=relaxed/simple;
	bh=AL5W+KRUqaJomjLaLeEEJHtcXw0BSUHBCWmlwEEAeeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKClCRGGcBRWdDzMX5miGnk2Sj6i0yhQfevkCCVc9H8YVNyeIptVmfUiiXjiPS0bE8BBB+jOKdw86CHUdvAVJ7/IjcGWMl9tPxNlWNpOjUtx7H8BWxcZ+vRgtX+Tm2DgM3d3NfEHnk3vXxuCsfvPqI6sLnYiRfeG+RWPgQru5mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJXY6lsz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJXY6lsz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 735EEC4CEE3;
	Wed,  9 Apr 2025 08:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744188683;
	bh=AL5W+KRUqaJomjLaLeEEJHtcXw0BSUHBCWmlwEEAeeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJXY6lsz5OMOeMj5aFUOGvH4/cXFTMy98fHqjKBXPn6omJo8XPcSMFbVhpzjfvhzW
	 ymV7kkvFMyDUReKBV81qFzDN95WZlmJbWrj3ycxUOGkLovmm25el8igW9gbjIUfOQE
	 fv91KZN1oP4bdxPED3xp+DXE/KsEYaSc05uekioxLanU2Xq+8B/DP8l0pKs6ucQtPB
	 OgxmudNHQgpt23WESrBzQcOvtRiHeu29qTjLmr8aQ+USyLnc+cKTpOyKW04KAeuOIB
	 rUlHWKByGkltuVevmK7ewCXZkoWs3y3k9QkjnmNaY0icuCJNsKe0Lm5ZHMH2AqDiep
	 jZiGSMYKyAGfA==
Date: Wed, 9 Apr 2025 10:51:16 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 13/24] arm64/sysreg: Add ICH_HFGWTR_EL2
Message-ID: <Z/Y1BCFxBwV97rV/@lpieralisi>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-13-1f26db465f8d@kernel.org>
 <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1c79f36-322f-4444-992b-1b69d8232124@app.fastmail.com>

On Wed, Apr 09, 2025 at 09:48:49AM +0200, Arnd Bergmann wrote:
> On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> > Add ICH_HFGWTR_EL2 register description to sysreg.
> >
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Marc Zyngier <maz@kernel.org>
> 
> No comment on the contents, but I feel that having ten patches
> adding new sysregs one group at a time is a bit worse than a
> single patch adding them all. The patch descriptions don't add
> any particular information about why these are distinct, and you
> need them all anyway, so I'd suggest combining them into a
> larger patch.

I posted them separately to simplify "reviewing" their content,
I will do whatever is preferred.

Thanks,
Lorenzo
