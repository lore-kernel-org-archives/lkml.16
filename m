Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698AA259CB5
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 19:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751569502; cv=none; b=p/w4K+ewo0t2Eqs8T8Yct93nWsGaJAdCwYB+WOJtiZZVqD8SOHErSQD/41EwY5+2RP6kT2C90MfJwsTn4VFgQpJbr0+vgfD8juj4isU4z4ZDHLfJAqgLLfoQVx5M4UHaxU510eFtHrKc78+XOAtDyrmnl4ZKbMr8DupAZdHCsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751569502; c=relaxed/simple;
	bh=i3ZC/vTGg7StNLuWPZMRoWqyoyBIHWoDNXbFWm2U/mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dTFKvyLlBT7B7czwiN5MVe5+jNCmJVlnlpQClzQT2x6bVkT4pPTbwOEMeoAp4xrMZRaIwMiPcTn/RAbku9FPL9VH7Y6BGMevQi/cU+1KX8bPdn5/M+VV8IhzoO4Oz69DeZ9Slo7vCDz49si60EOwviWA2CYCJLExJOrgO7zfPyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D64DC4CEED;
	Thu,  3 Jul 2025 19:04:59 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	dev.jain@arm.com,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Xavier Xia <xavier.qyxia@gmail.com>
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
Date: Thu,  3 Jul 2025 20:04:57 +0100
Message-Id: <175156948681.3519813.8652806937156134172.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 24 Jun 2025 23:25:49 +0800, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
      https://git.kernel.org/arm64/c/093ae7a033cf

-- 
Catalin

