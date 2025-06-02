Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BB52C3255
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854812; cv=none; b=bykl7aQMbCGI0zRJE9PdrarvW/vr8xmSMoKyrZNhxMYe4n8Iw5sMq3GMTeK0i5t0MOLdWiH3cBZwpPvRnCuNFKD1iSdl3as6OlfVwFdmS8ebJFSBDiKUmphqAowkkIS6tiosJq16J2X63NzNjSxkOgkLxPPJEY0o9QbqysIGWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854812; c=relaxed/simple;
	bh=mR7WQZqIAy0dtBgED8On5JHRNCsxwQ5Sf5Md6sldvVs=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=C6ASYzVbk01GFnO3jOT8tsVdu9KE7NM7AODD6oMppxX9bstWTOaL/ixBKUAa2Wig5cvW8rlkW5Y9qA2GdZnN7/u5yZ7jdj1MCNBQo3U4HyaAbTCAs2xmfHXMacU1ryQ0Q0tJJszAXMTNoRX4f42+rkQmnoLZHub9IHPse4Vg7EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWW0vzFW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWW0vzFW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44CEC4CEEB;
	Mon,  2 Jun 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748854812;
	bh=mR7WQZqIAy0dtBgED8On5JHRNCsxwQ5Sf5Md6sldvVs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HWW0vzFWfcvmZVYj+WhxFAU+kcMXCRf6AF88k/kPOI0zJ9nkhpm0xbq0c19+XFJkX
	 0x5cTpJx012nnKqjwrPxyYCXex7tZNfED9MU36paQxrkOHSBts2ePMT5nPCboOvnrU
	 xOAIMEuZxOynsLnFyWebQG7B5V3SEORXyLyYTYvPhGC2H//tKsv6c20qiVDMnNe7j3
	 zvDMBj2lULgeKTAYK24v0gB4eU6VGfMh/yu9BO6PZuPJnwyDCRELHpo106U5HIlI5W
	 9XoxDbu5aJu0u4VBTN2Oz4ysKG0ozH8rsEOG9JaDvVPq2bD0RRwBZ0HNkrlmml+5J9
	 E1pWQfbHAFRiw==
Message-ID: <3e9e8c1aca41aacda7ae12408712094b@kernel.org>
Date: Mon, 02 Jun 2025 09:00:09 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v5 01/19] drm/connector: hdmi: Evaluate limited range
 after computing format
In-Reply-To: <20250527-hdmi-conn-yuv-v5-1-74c9c4a8ac0c@collabora.com>
References: <20250527-hdmi-conn-yuv-v5-1-74c9c4a8ac0c@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-kernel@vger.kernel.org, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Tue, 27 May 2025 15:11:09 +0300, Cristian Ciocaltea wrote:
> Evaluating the requirement to use a limited RGB quantization range
> involves a verification of the output format, among others, but this is
> currently performed before actually computing the format, hence relying
> on the old connector state.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
