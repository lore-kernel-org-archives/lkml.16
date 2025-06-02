Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFFA2C3255;
	Mon,  2 Jun 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850981; cv=none; b=DGkqkzp4sjyB6DHLUTRzV3CCeLPuKmynLIweVTYwtv5tG3/An61mscXzJt7M1P62FUykzzjvvPhx+sECd9uroF7cHsen0AtXNp9Lrk9xURAgoR5IJJhvI6kFm/kEXwEVd8hKmprcF99nAaUIDlJSLu9tjAfivbZ1HZRXn7DWsto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850981; c=relaxed/simple;
	bh=G8vHJ1oOdy/gXfGEd+HQJJV4bCKcrAcoq3qPx+pvPHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LmRno2W01kn0haWjebzxYTa35ahcDKXvBLfc6H2vEnc9rfp2nKHub8Wm96XzsGFqJxnwO8MmAGJ8lmOLPUw4x+SvoLIVJISqujsTq3AyvUTzt3FSsuPt1OKDRTrGEbtbTa+/hTkfRlMgd3/5MrS2nCqMoPm9dDaExUsgNOO1ysk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXRnYBa5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXRnYBa5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A6CC4CEEB;
	Mon,  2 Jun 2025 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748850980;
	bh=G8vHJ1oOdy/gXfGEd+HQJJV4bCKcrAcoq3qPx+pvPHs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rXRnYBa5uTwqNg7HrQlBM9RVB+9sd72Lt7mMcN9ryVd+B0s2Q0ReGp4yR93VLwz9i
	 0I9t1xDRdYG9fI6afAYVTQNFIAz6ZUrSnlPUO+ZnrAzTItf9WffI8HDlZcecfdxQA7
	 ceRYtPBBm+dQpbK2f2ZzbMWQRg/VxcX75yIX4NcqDmaH7Cs8wnPOi2fH5G6P0JxugE
	 MOXjngNwVOCO/NnkkyCgwM0lC+DujVdtbR8lgBAFaXFVqb6EXN4xlr//5ilBslQfEZ
	 Sz8a/xPL/LZMw90LqfzMrMX2bXG0n/6FpqgZ7BK3pdL3cw4Di8LfafSkuXQypONmSK
	 W9WFWkfaFwpjQ==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Robert Chiras <robert.chiras@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Markuss Broks <markuss.broks@gmail.com>,
	Artur Weber <aweber.kernel@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Ondrej Jirman <megi@xff.cz>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 00/46] drm/panel: Use refcounted allocation in place of devm_kzalloc() - Part3
Date: Mon,  2 Jun 2025 09:56:15 +0200
Message-ID: <174885096739.421739.9939855699808449174.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 29 May 2025 21:46:02 -0500, Anusha Srivatsa wrote:
> Final set of drivers to use the new API - devm_drm_panel_alloc().
> There are a lot of occurences of the panel allocation across the
> subsystem. Much thanks to Maxime for the semanic patch which actually
> gives a list of panels allocated unsafely.
> 
> virtual report
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
