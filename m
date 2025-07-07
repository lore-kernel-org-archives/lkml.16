Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B3261595;
	Mon,  7 Jul 2025 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881046; cv=none; b=XC0CY3jL/NmMX7anWmjGsHn9w9LvuD2YBn0pHIvHQ6O9Ousaz+45j1MlAkF8tDOiZr8almVosJYsqKeqCGG0YYTJsCY5KljUXtNq6wklZb8TEIamXg0bSjel5LHu6kJipp78fTu4V8DKo3wpSSerELFuwwekGjqcu7eWCCEZ6M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881046; c=relaxed/simple;
	bh=+HST+oI1csepHuidMdAGM1zRVBg04v+JMM5to57Ig68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POzPOhWDe7Rw+GMIK2IbIv/g8VdeECLWJt0uZtjx/yAJNJEwMrjBAgy/rIq56onTaKr8pHISb2vWGNKnnfAWmE9O0Mrj1XEUVXM1R299bjVDkvmm4IY+MiXbgSsOUwur4Cj5XMhWD01JlCdOkBK0Adn7q9i2UdZfTtDNPKUKLPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z1P6IgIo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z1P6IgIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751881042;
	bh=+HST+oI1csepHuidMdAGM1zRVBg04v+JMM5to57Ig68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z1P6IgIo/+1evlnaLwfZqWS+jqcAJed+atKLO6Ei1hkuFdreiBTqnfQ1dAIlnIJst
	 IYMc6ANZ7W7EWKqOh2xRv+HpkoqDDLKRNQN6lT68oFAwnVIsDf415vVBe6S/FIhyrs
	 lBD4CbtluH+YkKDhmnTNiI7mOepa+PCKysVGEYsjli5quGyQ4mgFvel4pR14jKOGxy
	 ot0v8H8oUlb8NwwFvtPGjKKtGlzlF3DxhqdyJYla/0NFsVSMOPKazgRgoaBUqX7fZB
	 AuxKOCS6NE7+e9qBwIcaDU8YgaDe10YOndP0u9KML9TyNIdfyh9Jc8+LZu8uSfF/Dd
	 Cpdyd1E97ArjQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E45717E07C9;
	Mon,  7 Jul 2025 11:37:21 +0200 (CEST)
Message-ID: <d79e0e46-87ae-4d9d-ba67-41e3055c809c@collabora.com>
Date: Mon, 7 Jul 2025 11:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250703183523.2075276-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/07/25 20:35, Rob Herring (Arm) ha scritto:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


