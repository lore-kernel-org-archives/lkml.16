Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9C290092
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558402; cv=none; b=OP1Li5pS/ZwDdDdXSse7LemxEJHv/3bVVRUmfk+DgqjRMNc7E/ioe6CwaA/6C8S5PsYVaLmNzF1kQ7ELKyNJU8TFjsBD7eminNpIqANRNjYdhzd3h1GvtZBFn6KaW3FFO8SXaEsBwBGw/+fadi/FXjxPFreQIrAAGMSsNPlgjc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558402; c=relaxed/simple;
	bh=rHnF2H4xDxmzgJJK8ue4DNUikXpyNoPKMl4RAjR4bP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K5IQXyiTsqwz7ZhhnQaoYwr4yO3Iv1DDixPidBZWUAAo4ybzKM6dV7eHN5ZhZX4e8nV/wryDkiwSxVzhsYrYZTB4Z7b6WNPtLzhWqrdg90IsI47CWE2toAumgSZN7Zr1g2QYOlFgAtPKE1bsCJHcJiYWeNolGKzEqMpaN/x6ptc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGXMSR5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGXMSR5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8651AC4CEEF;
	Tue, 10 Jun 2025 12:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749558401;
	bh=rHnF2H4xDxmzgJJK8ue4DNUikXpyNoPKMl4RAjR4bP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rGXMSR5RNpmU77M870XfjsGPHYJr3+loL9DtfdlkOEdjEOBibj55R2+xY0BMXPRn8
	 w5zm9nkTlfceX87y/Dl0c+lrz/9sN2daTxsZBTUhVh05L2X/pa22HX2Nl8rHwDhDNN
	 B40lXLWDT24GvUVqRZgbAD3SD0TYEVtgtWq/qlN2PZ4T5JUhSTOBopcMRR2Juha3tR
	 WgPU+FX8tMB7T8XDNC+YLCiFHxs5YSRcOZhj/Sj2VGIssFCPah5chPFs+Pg72KKJYF
	 Vvfv+4APQ0mfZ4Jcg0qNlFzxTt3qFOUkmodr7eVGEPTr2HtTLNxIEnAyyiR/qL3vyO
	 GwdIWTcD0xdPg==
From: Maxime Ripard <mripard@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Gabriel Dalimonte <gabriel.dalimonte@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] drm/vc4: fix infinite EPROBE_DEFER loop
Date: Tue, 10 Jun 2025 14:26:37 +0200
Message-ID: <174955839350.2151021.5976827283402219676.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
References: <20250601-vc4-audio-inf-probe-v2-1-9ad43c7b6147@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 01 Jun 2025 12:45:36 -0400, Gabriel Dalimonte wrote:
> `vc4_hdmi_audio_init` calls `devm_snd_dmaengine_pcm_register` which may
> return EPROBE_DEFER. Calling `drm_connector_hdmi_audio_init` adds a
> child device. The driver model docs[1] state that adding a child device
> prior to returning EPROBE_DEFER may result in an infinite loop.
> 
> [1] https://www.kernel.org/doc/html/v6.14/driver-api/driver-model/driver.html
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
