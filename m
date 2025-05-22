Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F32770B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922988; cv=none; b=gm28YYUzkd0Reb/CtABU19Dtb2IP2ipLht6zMBbo2wmWQUSFvpi53KsAzTcXmUhoeVrkcvvtF2NzTCn7oXhdxDoi+7JeMcrAValL5gLIFBQGT8PCOcs7jswtKNPXcx5NAJV/aH24c8ekj/yeuGxx09h7fSF8ObbKHYhGzjPqJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922988; c=relaxed/simple;
	bh=IeQXHvH63KjFVJfVDenDpFEsDhKB6J/AC9/3elS2Rmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlyqSxaD/pQyUNzaLd40Olx3Pgd2Z0OYH6e4LCXJoeMTCsQ/ngNUuHUgnwvG2xmD3ldN5Ub/udzGXRMfOUQOZfIUdqX1odhesQB/qTGPP8LfyQwpVdtqjD7zVKP8TZszEjginEIVtGo3pXb85uMJiG5tohjuLWVjYO9WbkWnnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F182EC4CEE4;
	Thu, 22 May 2025 14:09:45 +0000 (UTC)
Date: Thu, 22 May 2025 15:09:43 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vc4: tests: pv_muxing: Fix locking
Message-ID: <aC8wJ9EbkB0x5AUP@arm.com>
References: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520-drm-vc4-kunit-fixes-v1-1-ca281e485f8e@kernel.org>

On Tue, May 20, 2025 at 02:08:36PM +0200, Maxime Ripard wrote:
> Commit 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> removed a kunit-managed function to get a drm_modeset_acquire_ctx.
> 
> It converted the vc4_pv_muxing_test_init() function, used by
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid(). However,
> during that conversion, it went from being kzalloc'd to being allocated
> on the stack.
> 
> vc4_pv_muxing_test_init() then uses that context to allocate a
> drm_atomic_state using drm_kunit_helper_atomic_state_alloc(), which
> stores a pointer to the locking context in the allocated state.
> 
> However, since vc4_pv_muxing_test_init() is a test init function, the
> context is then cleared when we leave the function, and before executing
> the test. We're then running the test with a dangling pointer, which
> then leads to various crashes.
> 
> Rework the context initialization and state allocation to move them to
> drm_vc4_test_pv_muxing() and drm_vc4_test_pv_muxing_invalid().
> 
> Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
> Reported-by: Catalin Marinas <catalin.marinas@arm.com>
> Closes: https://lore.kernel.org/r/Z_95jWM2YMTGy3pi@arm.com/
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

FWIW, I no longer get the kernel panic:

Tested-by: Catalin Marinas <catalin.marinas@arm.com>
