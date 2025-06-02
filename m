Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9D42A92
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748855121; cv=none; b=UAv3cViPetXr7Z1drntmz8wsxnMesDU+DMU50/gKBQKkSY067cQVh6/58P8C5HjHOGupZMUttuR2pVW7JG+BjbUKqjEH2FDmOV7AOtN68CcQWShHarf4BQBpYyNnSVCfc/DIWy9TYijY3/F7BMi4i5OS8BGuBAn6NKiCUOI2nhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748855121; c=relaxed/simple;
	bh=Uf1WNjJF38/Gl/qOZlM8Xtt9ZN9OemNHzI04tFgW14k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uO7QFkKN7c3qzrzgdP7Wu7T0fnSzRGOWxtwDGzBv58WcjbhJfdQaaCwDlCRlTDU9qJ9OPWUi+iUF1GjJnYm8o3uMB9ocky5u4k2HgYMVRTikRz0QX1X3gd0uoQ0+CBFBsBuypDGMBbUWDTmIZ5s6eGG5zV53NaVq8sH8KFWjyDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSxLqWR/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSxLqWR/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A56C4CEF1;
	Mon,  2 Jun 2025 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748855120;
	bh=Uf1WNjJF38/Gl/qOZlM8Xtt9ZN9OemNHzI04tFgW14k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSxLqWR/uyOmiyASifCcWPAuLRcv8cTBhK/6hTXPKBA574kCzYvTWiqy5krX3zHfc
	 GFwEDhrUlUQEw2lPszPQaOQLXd/TTXpWjvCZNBbpPg5SQP+ZrEKpRXTfo2EyD8Mjk/
	 ZvfjHRcBhzlF8ZctWTXqfqsG3hIFjt5Q8qniRanTi2W6LzuivccMf8NXexQqYMD8J2
	 CTcqMg/docRrfzoE040y7vBjcjemAHsAPZEDy8iMh7e6q6QrJCRvMZ3n0YU1+XVLrm
	 eP7GkdJ3BpvMnEV1R/d5k6gW/uk0lrkFadNy3fuRRGRRyXzGADfjypIUBHQbpM83gR
	 rJOHpwb4/VoiQ==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH v5 00/19] drm/connector: hdmi: Allow using the YUV420 output format
Date: Mon,  2 Jun 2025 11:05:16 +0200
Message-ID: <174885511345.447765.15117962049678380491.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 27 May 2025 15:11:08 +0300, Cristian Ciocaltea wrote:
> Provide the basic support to enable using YUV420 as an RGB fallback when
> computing the best output format and color depth.
> 
> 

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
