Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E329A26A1A0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644042; cv=none; b=s452/jkeEfgk0229eLnirBHwFVPNw9XtNxtdPY4f8VyFgSB5T5PoMBjzQ3+uZfFg2/7yiliRUf/FCljuZ8sDmEs+Ca20Ku3Z+RKFhZJtJQv/JzIfT03tCdYk9HrioFz3IdlNdyk8kkpbZE/AIRYcOjdZZ/tviTKImhuoYUByTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644042; c=relaxed/simple;
	bh=rPOc4Bft5rRhKxCkLHq9mBdyIs9V3hmodAMn3Tb++2c=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=JQnlCIYX6Fzo1IcYcg6iKzFTmXAJ+uqzHZ4Eh2b9x8rk+FmlA4d82yxho52/IckG6IsIVOCS1vT74PEjupFFTeKAS76Tf5x2Q2gkEaJ/du12XXDKZpKEJajMW43guBd8Q0L0/9duZC5BOljhq15UMe5ecWQjjRuryhhYbVa84nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4YIcMTb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4YIcMTb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046C1C4CEED;
	Mon, 19 May 2025 08:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747644041;
	bh=rPOc4Bft5rRhKxCkLHq9mBdyIs9V3hmodAMn3Tb++2c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=X4YIcMTbloLlAe/KN7RJ7bnGvjuYxZm6DylStXWQkYmxiCAvjIsb1Qn6wo1y1Bp42
	 ZBQ7Y3wbFc2ABpU9JfIyTZIE4DFWpBdqvD/gkCAKuTOWf/CZzTI5WMxhlfZc/0TfdZ
	 ldewday9tTzVelEHBwePLvRpLhF3vFnKjLA9obphGjDMQPkn3rG63GplhH9PLvqrGx
	 dVH9zusCDejRfWrOvvPdbUL36Nh2X4gI6xuO5Jxq9R9qsuABHV5kSuP2uG1YAhZVx2
	 7kwts8uLlsrYPW/pVGmO4JwF9MIONq23bvVYazWv/JAT/lKAVDmZAhgd35kL2DHqVv
	 D5t3QJynVp5Dw==
Message-ID: <b80e4b6d963e65584661f38fcb0a1781@kernel.org>
Date: Mon, 19 May 2025 08:40:38 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v4 21/23] drm/tests: hdmi: Add max TMDS rate fallback
 tests for YUV420 mode
In-Reply-To: <20250425-hdmi-conn-yuv-v4-21-5e55e2aaa3fa@collabora.com>
References: <20250425-hdmi-conn-yuv-v4-21-5e55e2aaa3fa@collabora.com>
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

On Fri, 25 Apr 2025 13:27:12 +0300, Cristian Ciocaltea wrote:
> Provide tests to verify drm_atomic_helper_connector_hdmi_check() helper
> fallback behavior when using YUV420 output format.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
