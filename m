Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525E21B9CF
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749493570; cv=none; b=e+6uIkOByUEZxkJpKAGL8TCrQUNbEX0+CqC0o/xDfWNu/4Z8NRTw46jZGPBFlnlsxeVTM/qjFBSTcy2sUcpdYqjbIsWELQhT0X57eh+6a7vjFFrRxqM3e3GkR6uJzuXSRSCrYJBcKZF29CIzWmjt+r7a3lG9jgsA0m+qgzo3dD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749493570; c=relaxed/simple;
	bh=tL9R02ldAUSNG9dn8dvHZp9439IzJZ8R9LrzxvELkcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZA3d3zuX6OTm1PaROyJ17n19WO9G0iJb29c1CnccGnmP7Ms/t9nlviHItLHagLVTAElpipJ1Fj0EfyT7ctaUQH4ScdFTkpSmC0nfi74r825gT7Cai9mIaiMEgxToc/uU6ZKIGtgek9KAGKJaZTU98f9I2hdktmB6QwhtUtKT0os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o8X0ydzm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o8X0ydzm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF1EC4CEEB;
	Mon,  9 Jun 2025 18:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749493570;
	bh=tL9R02ldAUSNG9dn8dvHZp9439IzJZ8R9LrzxvELkcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o8X0ydzmMHmfYRhKHhJcMUC1yXoMzjvwDvFY4IGL+bfd8xxvDL8Ol7a8PlP7kQeJU
	 E8o8mtpl72nTCgxMQfLaQr35a5yF7Ol4bbPUc/m24TKiCg0bjYbme6lqpKf18X2qbe
	 Uluzyzfi3WNvr8P4XmM9xO/q8Zyb0fU+5HFuFIVjXAzjaXRnpgATSf1zLJ3ghl7sz5
	 xBulVJu6lV7ErjwqlfGXcUiNmA7wlhB6cIL98zy9YTd1n6W0R13tyOMxXA2DbWZNix
	 VvKfxVXbsLR+b1RMy0FmBNWJEqXDu0N9hZaD1Cqtj6i5N5IW0mYbm/2YKhTz2gIDe6
	 y29sG/dKTSUKQ==
Date: Mon, 9 Jun 2025 08:26:09 -1000
From: Tejun Heo <tj@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] workque: fix opencoded cpumask_next_and_wrap() in
 wq_select_unbound_cpu()
Message-ID: <aEcnQfdZj7j5Ydcc@slm.duckdns.org>
References: <20250605002138.47124-1-yury.norov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605002138.47124-1-yury.norov@gmail.com>

On Wed, Jun 04, 2025 at 08:21:37PM -0400, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> 
> The dedicated helper is more verbose and effective comparing to
> cpumask_first() followed by cpumask_next().
> 
> Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Applied to wq/for-6.17 w/ subsystem name fixed.

Thanks.

-- 
tejun
