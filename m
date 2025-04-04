Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890DE847B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 06:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748911; cv=none; b=LmAGEAsAz+hdwk9Ia6V3J4Ty+DQYBCo+yafph0q5AY9rPAPApnPuRpDr2H0+hnSm29znae8XUjMfrviVVEeUv7ZQbESvs1//vdYqz+nGQKy01UCndwvbzMSQf31iiLOWKeHoXVuoqJdGXVubLJDmd2jycq2P2VWKKtDqz+OGceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748911; c=relaxed/simple;
	bh=gNKz3ftSm+WCqgxdAGdG7TwBCa2MkJq8Xh2F2CQKuCg=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=XWrCCatPJ+McT0NsF+HMilPr2e6GmwU5vz/Rc+CIUwu7uUeS0LANWruhW62Uaoi1iTj1QVIvrfmhzIP3rwm+VTxA58bsXK7q6q8OtgvrdXObZigfcmMnsyWOR+pIQV9gwnFjjz44lsnoNGcuExl5bb//8jEmXTR5VbxQd3gb33E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDzEykG1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDzEykG1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93B7C4CEDD;
	Fri,  4 Apr 2025 06:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743748910;
	bh=gNKz3ftSm+WCqgxdAGdG7TwBCa2MkJq8Xh2F2CQKuCg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PDzEykG1/Osw1rmGAXcH6UBaAVJjINdrYfQIZrv1QW5fcr7rMtvtdA9citOOR8Lx+
	 wL/T6VdxmRwLpRSfMohNdGbzzytrdggVbMyiYxWJvHrysJTN83dsI9Anoax6m3AmEm
	 R98MwLA3MK8br3YGNOiBhqJQ4MV6Mee52BJGto4FNXg7gqppy4HxNa5jopbMyo+HFo
	 9qSKauy2CblOeLXKLrix0VTtqMAf+d02qOtEHuTSzuo5mYIMrY/AC7JUqEHjkRnWL5
	 aQmnEsLUOaK+jR6hrB08oOxDMeC29KlddDXgN9u7qthxIT8tDoKiqptEx3HC38blcA
	 8oO8rvowKjFSA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 04 Apr 2025 08:41:44 +0200
From: Michael Walle <mwalle@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki
 <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, Javier Martinez
 Canillas <javierm@redhat.com>, Michael Trimarchi
 <michael@amarulasolutions.com>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team
 <kernel@puri.sm>, Linus Walleij <linus.walleij@linaro.org>, Jianhua Lu
 <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/30] panel/ilitek-ili9806e: Use refcounted allocation
 in place of devm_kzalloc()
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-9-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-9-260c8a44c56b@redhat.com>
Message-ID: <0fed1ed195aac73395f20c14c29ef9af@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael
