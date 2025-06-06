Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7096227FD5A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212761; cv=none; b=lgm1SyIRsovvCavvZ/xO79thwZ3saRAt6cjP1HZ9A8t2X8H/uFr2aRBrcOyhrkZTMDI3aGN08qSytHPCqgycOr1FbVaMgPce+SIGWM+L8poqo8b9q8rLfNEHpTMxrgBYRTbXMp1FKX0ShAVIGKrobvIs8ILofBntEiXJD3W3aVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212761; c=relaxed/simple;
	bh=NzZ6wArFnrGATALrD5br9/mTy388nlgqYwCWAd+sWQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qUYFhvKG9bg8H+Wz6GdGe8waIv9BcjZqYW7c3833dz5aieX+01rh1YeQng3xmqfW58HttWvep02tQpUqiubxeEWriMmQi1T43u/EOnotQk6kaqUR7gKACx1+70K3l7uj1N7q7iZQOUkDjoqLDxfyfYXGgLHZa5o9tSmUmQ4fVQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EiZ2fPYn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EiZ2fPYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FC6C4CEEB;
	Fri,  6 Jun 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749212761;
	bh=NzZ6wArFnrGATALrD5br9/mTy388nlgqYwCWAd+sWQw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EiZ2fPYnGmkyPX43Dw4Rbvx0AEMETr9vcxm2Uo5W72lIl260ACm5TTMQN7pzV4K+j
	 GxMnTyYsCT2e80eaEf29V55iZTp32FuhkSxJf7FicEaV8UvsZGBj49Gwwb2p58PCdG
	 fU8Nj6EUbDTbjyWZ8/yDfinwty/dLFKVVsgbRML4KnaVCTtK0tSH9ezBjb+7F2rP6+
	 /0GY86t/VVfdd0OEF45x2lbI8reWsnjBlrDY+5hGlIejnWZDx1G2+afosGADTlXc7I
	 o6GRTORi+JKxTchsxcKyD+Bq2TLV5BivvUwhmDjQunad9C9NQAsGapU/G7f2lGK6oA
	 6v4vy0rqS1evw==
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Maxime Ripard <mripard@kernel.org>,
	DRI Development List <dri-devel@lists.freedesktop.org>,
	Linux Kernel List <linux-kernel@vger.kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: Re: [PATCH v13 0/4] drm/atomic-helper: Re-order CRTC and Bridge ops
Date: Fri,  6 Jun 2025 14:25:56 +0200
Message-ID: <174921275438.1606688.14453750248073205511.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
References: <20250605171524.27222-1-aradhya.bhatia@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 05 Jun 2025 22:45:20 +0530, Aradhya Bhatia wrote:
> This series re-orders the sequences in which the drm CRTC and the drm
> Bridge get enabled and disabled with respect to each other.
> 
> The bridge pre_enable calls have been shifted before the crtc_enable and
> the bridge post_disable calls have been shifted after the crtc_disable.
> 
> This has been done as per the definition of bridge pre_enable.
> "The display pipe (i.e. clocks and timing signals) feeding this bridge will
> not yet be running when this callback is called".
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
