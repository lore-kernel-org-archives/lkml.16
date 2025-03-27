Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8C3199E9A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743091046; cv=none; b=V9YYJfD5uVPh2ObY0sSgzr6eUob9dfPPO8Qv3v9ydU5dR/3pv0iVIW+t22bR+J+gaVgo1qhsFVoc7MMUmEaUGqgxi5kAU+CVaNnObCjLdgPC50/qwMZj5UOijPqKp137huaLIRhU+PVJ7oWCmsgQFeWqfpO6bx3bNas66adMU4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743091046; c=relaxed/simple;
	bh=25owD1XDTgKtLuzWJ5a0mUHuBkKrhhZhpX4PXAMJu14=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=rHexZIxHHwD4YtFv+QNXg8VmVMsSpLDAqFOLfPER0Uwavy7p8IbRd/idyvfkGfDuzlQOSUu+0dTDQe83BRi72HUMcgeLcNJTsLIeE6wNuzmXIrjLPtNAwukWAY9sKR6YpsiHtecRRgkbyuFA7soP8VdBlLOPTEL/yC8PnGQ7P3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qf5prpwU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qf5prpwU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EDBC4CEDD;
	Thu, 27 Mar 2025 15:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743091046;
	bh=25owD1XDTgKtLuzWJ5a0mUHuBkKrhhZhpX4PXAMJu14=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Qf5prpwU1OpR3ttKNpREsJZKJVq8S+IkyqNc5eNvQey/XQqcUYZEBci8wlHo2evFX
	 QU5vxXHbj2vxq7iCfjdLet0adbUdTO4z1mtJf6XllDwT3PH9I3NxUpNZZJxK42VA12
	 ebspxJsFEXrQ9+DydPkSLPb0QadQfRhybaTQtVyYiRcnXeqd6yligKV+bp/dbWGQSi
	 yw+QcZZl3rMZLpACjJohnsV6TzMfGDpS+mhszkhqPcdj0WXBYrKXNx74qXR/vJcMbs
	 sQdeq0dk+/1tmw3UbCU7wmXGfe8UsAe31xzHl8rPplhKuHrLveZK852va+zXHX5Ix3
	 SMfMnizC03O9Q==
Message-ID: <46fb8e315f68369ebec2d3f211edac94@kernel.org>
Date: Thu, 27 Mar 2025 15:57:23 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH v2 1/4] drm/panel: Add new helpers for refcounted panel
 allocatons
In-Reply-To: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
References: <20250327-b4-panel-refcounting-v2-1-b5f5ca551f95@redhat.com>
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

On Thu, 27 Mar 2025 10:55:39 -0400, Anusha Srivatsa wrote:
> Introduce reference counted allocations for panels to avoid
> use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> to allocate a new refcounted panel. Followed the documentation for
> drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> implementations for this purpose.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
