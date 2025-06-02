Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E994E21B9F6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 13:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748871739; cv=none; b=X/tEpqmEFpBtT/QhMPO3QMitbVlFRx+Uu7fLH48HjSA1QcNd1UXrMGQ4rIPBrNgSgn8OH91Ks3GnAyfjwLAHW/OfsJwZ3XwVnry5QN1giyaLT0c54BL5NdF8ef/7/vqNlWknq0i+ZtMZo+In02UycLXaY0rBexRjt2sgS0nQVYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748871739; c=relaxed/simple;
	bh=QGP116vocQSl0XnSlDwq9B8Uh09Tx/0uFirdqmSCerk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f7f2yjVX5QVCurQ7trwmztRUHrxbmDLqgbVNo90GA3Rf/6Pk1uF6IT7g6146eaPNXVsaMXQeTer5FHGXqfREn/KjxXuWwZGc4KCZCiko24qXxGHk/ltHL9kOlCLCatVYpCtV8RVcDR+/mSzfeayHOTK+L+rRRwtGBr7GM6bZ6Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhted7lw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhted7lw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D6DC4CEEB;
	Mon,  2 Jun 2025 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871737;
	bh=QGP116vocQSl0XnSlDwq9B8Uh09Tx/0uFirdqmSCerk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vhted7lwJWdHYWPPoC+r65ItQeB21VPbcME3yg5VqfPf9Qr/yJGrNpMJVYqKY/Q0J
	 9vzjpLmhOOBmeFWwEwMcMjsH0WfA+nIZkxjJy1VeUIzOX4a53PKwQRi1egy5vp/EZE
	 v3a/yv5CsfsxPhNy9U+WO7wXA+cMSjBbV2+DqZvLwMqHTWPIuUeE2EAFifyY5ckZjA
	 Z07E7YYvEnbRNdDAS5nqFaCmLQWo6L02tBQ4Qm4u3YY60ZDUDxGWSeAz8ovUBFGCv1
	 uYDrAc5WE1SJ8fi3LXBL62bjtzl95dFUoM96vReCcwzte4bfp9giHRX3TmRY6ypmo1
	 e1X9sV0nvcFuA==
From: Will Deacon <will@kernel.org>
To: James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Xi Ruoyao <xry111@xry111.site>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Mingcong Bai <jeffbai@aosc.io>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: Re: [PATCH v4] arm64: Add override for MPAM
Date: Mon,  2 Jun 2025 14:42:05 +0100
Message-Id: <174886855062.2951814.2307723986328064576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250602043723.216338-1-xry111@xry111.site>
References: <20250602043723.216338-1-xry111@xry111.site>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 02 Jun 2025 12:33:21 +0800, Xi Ruoyao wrote:
> As the message of the commit 09e6b306f3ba ("arm64: cpufeature: discover
> CPU support for MPAM") already states, if a buggy firmware fails to
> either enable MPAM or emulate the trap as if it were disabled, the
> kernel will just fail to boot.  While upgrading the firmware should be
> the best solution, we have some hardware of which the vendor have made
> no response 2 months after we requested a firmware update.  Allow
> overriding it so our devices don't become some e-waste.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64: Add override for MPAM
      https://git.kernel.org/arm64/c/10f885d63a0e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
