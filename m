Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6422FE02
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747812614; cv=none; b=pZu8jtuU8pk8O8QYuu94fIU8c/gUg0ysGQoINeTxW4lFHoa/gUNPV23PhNIrvp2KRVZSb4Zbw/vugpk9FrfppSH3N/vzprs+rlBIpH9Tj+VeWPaN1pdoeBq6Bq4iMHwkm3mRP6dihPFRQXCQXxmoAaazDr7JvQejD0B2Dw2g7dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747812614; c=relaxed/simple;
	bh=kHoF45hUCogyr1b9AyVQsB5qBGzunVeolUQxgQ54lzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ub1aY+B8I5ayLjvq8MxwycdMhb1zaAVOJwFI3KjzyG6Kog/nm1GAQHo3/g35B5PZ7zaQ0rYs7eMdC9WEBEdt/iv1wj+teDj+UakLNof1PgMiBJIYuQEsbK7Ba++mocAxveiU/V83ROGmlbVKlzR7DqX9soHQ3kO+S8mpBWHOjew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqtXNqi3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqtXNqi3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129F6C4CEE4;
	Wed, 21 May 2025 07:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747812613;
	bh=kHoF45hUCogyr1b9AyVQsB5qBGzunVeolUQxgQ54lzg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqtXNqi3Vltcn7eXM2pjk8DV8x/Cp+dDz507Gul9YXLQ2p3DvcJnJ+nMdUBia53F6
	 FOiZLki3BNQK8XkwXbxSX9sf+RewnU2jDCtAHvCeh5ZBZT3dkxdtUgvOcysqD1ExhX
	 RhPuJCV3bb6en2HvCBSWiwoiMLdQQ8ck058/8UO/M8SrwlioXFOmBMnHeGaiCx3NMX
	 JYBOyCSwOG+89ofFfbgm5yuNbhBcVrCAmZo3Zc/90xjUPOWaBDsOlNNnoYq3W3F5ZF
	 WZd29o9gFzDO/QUc2oHfGuh2Ezh7P3oDa3LBi1/j/SlRxfIlE6HxyNHpbfFkoiMTmT
	 vozD39dnSmcWg==
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Icenowy Zheng <icenowy@aosc.io>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Ondrej Jirman <megi@xff.cz>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Michael Walle <mwalle@kernel.org>,
	Jagan Teki <jagan@edgeble.ai>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Linus Walleij <linus.walleij@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Stefan Mavrodiev <stefan@olimex.com>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/30] drm/panel: Use refcounted allocation in place of devm_kzalloc() - Part2
Date: Wed, 21 May 2025 09:30:07 +0200
Message-ID: <174781258973.998238.825385797307727839.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 20 May 2025 22:03:31 -0500, Anusha Srivatsa wrote:
> Convert drivers to use the API - devm_drm_panel_alloc().
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
