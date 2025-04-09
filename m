Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E2F1D6DBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744192414; cv=none; b=qZD9NGbICnV/f0kMy6QfgicVHqC4avulIBICKeML4uUpOOuPi3rYrVOu84dvyat90E3bqiMRBSokKsuFoacIfNsl0s+eHGP5WMHfyVd+UgfF5FUn06dk0wXOLJvXk3WIQ+6eSB4yjEshiGNlV4toDF4qP+SNscxFwf83/G7SUd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744192414; c=relaxed/simple;
	bh=3cQPyIkae8cWLjjEcRpQg8NmLh8Vkl6t2hjPRg3q/ZM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TRGIRJkbYkSG7GdyItf+0Oijbk+vMw3qzZ98f40WGTMdA64a1iKVRsE5a1LhWLs3v13NvHhpYLWPUPZqbyx2fIgHRg0f1FNRKhdMcxhT3RMBWO1VRh5SJjYbegLF9NUbDI2r5bwg8BMfz0B2Q++oACB49l4vpE3nkE5BIKYNwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q31xA2U4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q31xA2U4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CA8C4CEE7;
	Wed,  9 Apr 2025 09:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744192414;
	bh=3cQPyIkae8cWLjjEcRpQg8NmLh8Vkl6t2hjPRg3q/ZM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Q31xA2U4aNO/OXoCFbd/1rLSQ4CkT2fP6yI6o4fHsLS/jrb4FLDTkUgJLxeXjA5yi
	 qd7Y1Rz4PXljUDs3yEiYer5OQ4nq9POm0iAfhj28JYo0wlkS2SxyhfuRrjPgYftgK6
	 xovTGdOaSh0HU7bLNO8WyVaQXkH9ba8ox/25FOyJl+H6/NmF48D+uM3BuL+l3ExmCW
	 t7X30skUtS3AtemVMAFClqhO9StVb/2EvSZN4AZwIZoqo+VhXYVKplJ2lOqka3Rg57
	 pc9VL0Ne38kfpl3TJjSGdSSeq6JKiyUwQqKGEE7+dFEV9blDInSiPzwCIcPRwahvHs
	 750+ZgtBG+mSA==
Message-ID: <92a0ae4b84b47e6bb3a0cef0d051ae53@kernel.org>
Date: Wed, 09 Apr 2025 09:53:31 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Vignesh Raman" <vignesh.raman@collabora.com>
Subject: Re: [PATCH v2 1/2] drm/ci: Add jobs to validate devicetrees
In-Reply-To: <20250409061543.311184-2-vignesh.raman@collabora.com>
References: <20250409061543.311184-2-vignesh.raman@collabora.com>
Cc: airlied@gmail.com, daniel@fooishbar.org, daniels@collabora.com, dri-devel@lists.freedesktop.org, guilherme.gallo@collabora.com, helen.fornazier@gmail.com, linux-kernel@vger.kernel.org, lumag@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com, sergi.blanch.torne@collabora.com, simona.vetter@ffwll.ch, tzimmermann@suse.de, valentine.burley@collabora.com, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 9 Apr 2025 11:45:38 +0530, Vignesh Raman wrote:
> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
> exit with a non-zero error code while configuring them as warning in
> the GitLab CI pipeline.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
