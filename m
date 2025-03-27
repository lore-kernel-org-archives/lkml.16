Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0319F111
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091147; cv=none; b=Fihycv1wWXZPXYcxGGaRPZAxABqp4mgGwjJnSIRUHp0Ga8RQGyCU6Eg+OYAU4cWeO5fLPAoYX6z2MmjQWo1uloJH9VZEbUQy9RRpd6DuyF0i1EWiHeD990t8xNvEION575CWQ1jeDshZhSNUrkNs+GSFvJWdx0ouRQAMarb8opU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091147; c=relaxed/simple;
	bh=Krm6CknLwx+iHmzOtIZuwzrkbo5KwtW3IeEEu7Mqyi0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=WkUN6t/13ZQ0F6cqoRDpbvFh327t3mBQd+sthhkWy+jdFjid0qOFRTb2Xi6ivc0myRiaftuahaI7ggzhA2hI8w5RWg1GAbLKjgM5ViTjeqYFlgJdVX1xSfxaqmNNm4IKA0h96lxm3WDNZ+1aunDlINvQkIea/byZRfaN1CXVzT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP71873K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP71873K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C63C4CEE5;
	Thu, 27 Mar 2025 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743091146;
	bh=Krm6CknLwx+iHmzOtIZuwzrkbo5KwtW3IeEEu7Mqyi0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=FP71873KpBim8kOOn4vFXqHw/Hv3OCydscKR8G8mNNSd04Yv9rzYWq0mIWAvvmE1j
	 n/uJQUc1R197VOWk+fO2y91gtr8ZPxXudGgFrRJckpfwSt2GK3hvWaTmsmQqF1q3op
	 rx1rLzhtZqthp93Av0cCyK5/m/AeLyWAFDdT5CvkI9n6MSUTzHN0grdQZZd486NxIZ
	 yl5RFA30NuIjx6Bn0aJBGWmwcaJha+NEBENAeZja5KDGRv2FOZFt/BEqAdmBQyxPLR
	 n3Q4kpHl5a+mh7Dq32L2rebXrJTAEB/IBniRkTgy3PRTntnw0f3qoHPtlsWdITqSj3
	 xLmTqR3o4SQaw==
Message-ID: <d94d67e3a5fbaaa7291ef3358eb5bb35@kernel.org>
Date: Thu, 27 Mar 2025 15:59:04 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 4/4] drm/panel/panel-simple: Use the new allocation
 in place of devm_kzalloc()
In-Reply-To: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-4-b5f5ca551f95@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, "David
 Airlie" <airlied@gmail.com>, "Jessica Zhang" <quic_jesszhan@quicinc.com>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Thu, 27 Mar 2025 10:55:42 -0400, Anusha Srivatsa wrote:
> Start using the new helper that does the refcounted
> allocations.
> 
> v2: check error condition (Luca)
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
