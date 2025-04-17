Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459C253355
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900065; cv=none; b=VPZehycKxByjUkGawWBfnNREGFeFBMJOq6K1gZglkZHhpg5BIPWzeibaEk8lZTVr7OKVaUQOuiIzryCJkOIYWPUNBG3qX+blvGrI+UouG+Jmefz8OVUOE9rffucwSlHbU74LODyPTV/054Ju1Vdy2ZLEJJVZT+jfVisuP1H+e3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900065; c=relaxed/simple;
	bh=nu5w+lI6jf2LoOP/AZC8IFj/m0okyWNkNm6LHYmTWbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DqHf5ICZWd0Y/jOWEymKxZN79R2Pk0lynSsg5nLmOV+9U5Set7/TQZP1RcjPtszsqRCC6hhBsT/2wWXqkU4ZdV+TJTlWVgIyo6F1FGVohte4j1GvYygUMe4FoUMaQZXtUUzX+ZyJ3DqIDeIPVFzzBkNZbTqYW+zelU0OcGirF4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRZsqjoN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRZsqjoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7991C4CEEB;
	Thu, 17 Apr 2025 14:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900064;
	bh=nu5w+lI6jf2LoOP/AZC8IFj/m0okyWNkNm6LHYmTWbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRZsqjoNt7FUSi7OB/LX0T0PhgWMozBEV+mdFBszNlYUE7tCZDLO0XpU9r8LoBlBc
	 jPEQqoOxuwbutl4BRzaulT/csCqprOlgOEocxIKEX3QOJUUSdmDKtAJvMYx+C9CTJ6
	 ANadM/2Y0QtyaYEYmXhgAabpmfJmYPBuj8xr0UC/TRruALpCkdOYAOea327Shjvfhl
	 SkUWcnbnnaE5nV8/5LlnsX56Hultn5K6KGkf12b4z97WTwGGf/9EICTJVxkUP2qol7
	 rladiWdLrHyDcKLl2mf7Gu0to6awHMTJr0quhMMp+N1l0kk10VUB3suh1oi0pca9N6
	 yrxKE6AGVATzA==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Hongbo Yao <andy.xu@hj-micro.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH v3] perf: arm-ni: Unregister PMUs on probe failure
Date: Thu, 17 Apr 2025 15:27:24 +0100
Message-Id: <174489608350.2694212.5228130661148329110.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250403070918.4153839-1-andy.xu@hj-micro.com>
References: <20250403070918.4153839-1-andy.xu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 03 Apr 2025 15:09:18 +0800, Hongbo Yao wrote:
> When a resource allocation fails in one clock domain of an NI device,
> we need to properly roll back all previously registered perf PMUs in
> other clock domains of the same device.
> 
> Otherwise, it can lead to kernel panics.
> 
> Calling arm_ni_init+0x0/0xff8 [arm_ni] @ 2374
> arm-ni ARMHCB70:00: Failed to request PMU region 0x1f3c13000
> arm-ni ARMHCB70:00: probe with driver arm-ni failed with error -16
> list_add corruption: next->prev should be prev (fffffd01e9698a18),
> but was 0000000000000000. (next=ffff10001a0decc8).
> pstate: 6340009 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
> pc : list_add_valid_or_report+0x7c/0xb8
> lr : list_add_valid_or_report+0x7c/0xb8
> Call trace:
>  __list_add_valid_or_report+0x7c/0xb8
>  perf_pmu_register+0x22c/0x3a0
>  arm_ni_probe+0x554/0x70c [arm_ni]
>  platform_probe+0x70/0xe8
>  really_probe+0xc6/0x4d8
>  driver_probe_device+0x48/0x170
>  __driver_attach+0x8e/0x1c0
>  bus_for_each_dev+0x64/0xf0
>  driver_add+0x138/0x260
>  bus_add_driver+0x68/0x138
>  __platform_driver_register+0x2c/0x40
>  arm_ni_init+0x14/0x2a [arm_ni]
>  do_init_module+0x36/0x298
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Oops - BUG: Fatal exception
> SMP: stopping secondary CPUs
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: arm-ni: Unregister PMUs on probe failure
      https://git.kernel.org/will/c/7f57afde6a44

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
