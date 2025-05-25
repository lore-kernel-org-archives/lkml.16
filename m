Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD161805B
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 06:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748152911; cv=none; b=mWYsOfQNdt/jf1mfnGY3qlnCnQN+rOh05KfVCakHD+Kg0ZGM8zEsnTYT1GZycHOBAfqT3efRRjfjtHy08zqYiYqRLs+DKxiuEn2Bx1AtmBjzXg4oW7lYKkw+rnEVKTnJgDddJDu/Iq9rHRv2/N1mWSSVs2Em9e/SyyVsqjbOr2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748152911; c=relaxed/simple;
	bh=a3sQdXwai7T/TfheTun+Bf+Z1neZyDVcBKPlpqcwthA=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=c4GJFF3F4ampkAHziNcGF24YgYzEpvMMmwCUCgXaMOWCEy1Zl5aVyzBvQI/frKKpkOZ2Mn0m/50XGQpjPLlDTxko7AuwBJ2kGqE3Q1JyvgKRdXrW6Nrxi1v1oVrm9UsyElcZizVoSpfLMfZ2GOnLQxbdRBih0WS5FupgmomV/UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.107] (p5b13a30a.dip0.t-ipconnect.de [91.19.163.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 685D661E64783;
	Sun, 25 May 2025 08:01:05 +0200 (CEST)
Message-ID: <c8a64686-f1a2-44f1-9d13-fd5b4f923e0f@molgen.mpg.de>
Date: Sun, 25 May 2025 08:01:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 LKML <linux-kernel@vger.kernel.org>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: MT8183: Only maximum resolution 1280x720?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Linux folks,


On the older MT8183 device Lenovo IdeaPad Duet Chromebook, running 
ChromeOS with their Linux 5.10.x, connecting a 1920x1080 Dell monitor to 
a USB-C adapter using HDMI, only the resolution of 1280x720 is 
configured, although the adapter also support 1920x1080. It happens with 
all adapters, for example, LMP USB-C mini Dock [1].

I reported it to the Chromium OS issue tracker [1], and the last comment is:

> It seems the display pipeline for the internal display (DSI) has
> higher clock rate. Also, the resolution support depends on the
> refresh rate as well, so the claimed 2400x1080 might only work on
> lower refresh rate.
> 
> For the external display, the display modes are mostly rejected by
> the pre-defined max_clock_khz in mtk_dpi.c:
> https://elixir.bootlin.com/linux/v6.11.4/source/drivers/gpu/drm/mediatek/mtk_dpi.c#L940

Can you confirm this? The font rendering seems not so good in the lower 
resolution, and strangely, playing movies these seem to be rendered in 
higher resolution (or the monitor or hardware does a good job in 
up-scaling).


Kind regards,

Paul


[1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/
[2]: https://issuetracker.google.com/issues/295666708
