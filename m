Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A6021323C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751016254; cv=none; b=KCK7OtKb9KmQFd7YKUsMU+x12eaEMxsDPprooyuI/tjNBC3M9wfxz8rTn3ovdLwnkcmH+t5jR7gLIgyI37EwhQ69tg66677rH/b082rYGIVf0E4FCZVX7dR8a5D37n0Luv7/yD/BcMbNN08rdk2P9OQCUsTU0uU6lj39qhyxqhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751016254; c=relaxed/simple;
	bh=+Od3wE0MGFoGPTGx1Gj5nP+HNuBZqUzPen/YCc0gtO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DH7J4o/yQa0qpM2/oXNbkA1Ip+k9Zxh+JNm3t0REU1nu3fLq4KGruBOpdzYhqrczhKf2pBELvfCP8ZbUf2mjVP9wCzDzebdMNIVOGTX0zrbeVHJciJkuohUJLR4wF9aEVvaKig4U/RG2q9UUFM1v10x8zwHZx6rez5fpvM23Atc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JYsmuVEK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JYsmuVEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C54C4CEE3;
	Fri, 27 Jun 2025 09:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751016253;
	bh=+Od3wE0MGFoGPTGx1Gj5nP+HNuBZqUzPen/YCc0gtO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JYsmuVEKovtOUzfIabnNWZx4uk3ktHt55QJP98lONt/RCoDY6q8uRP68Rv/g1HxBJ
	 tD1TyUtxMwOZuhEEGrRIjXqgGsepStH/ZK+jKbG21kqv/yrYrFBkEHHdCw68vT8P6J
	 m39Irtk75Z4KpExqt90GKottBh0p8QfOkhadJnGVVW18ymWWLlNTQeyZrUOz1SZ3Wq
	 gzB4IvtqIiF3Gsq1Au7YbZe9hooVjD556gsGjyEnriNSVuw7a11Y9h3q4mZ8J6TrtM
	 ZGoYp1c+EQy3mqLEQbURVrKYJLu/MU6rKbAYc6COo+e1iQQtCOSzuEJ9zDQmg1HyL/
	 bEFWDRiWYCVDw==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/panel: panel-simple: Fix panel-dpi probe error
Date: Fri, 27 Jun 2025 11:24:08 +0200
Message-ID: <175101624570.44642.13183466384528927408.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
References: <20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 Jun 2025 12:04:58 +0200, Maxime Ripard wrote:
> Here's a series fixing (hopefully) the panel-simple regression for
> panels with a panel-dpi compatible.
> 
> It's only build tested, so if you could give that series a try
> Francesco, I'd really appreciate it.
> 
> Thanks!
> Maxime
> 
> [...]

Applied to misc/kernel.git (drm-misc-fixes).

Thanks!
Maxime
