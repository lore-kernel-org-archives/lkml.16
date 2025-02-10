Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E3E81741
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739191701; cv=none; b=rC2myN7wOJjIJqc3yuNbEP+XtsLZF7BcnAb0ixVGB/3pJ2DZ+DNECtSmJssJJA9NWUDIC3a8vKc+B31F2m7VybsUX2j02QUGgIwyzEZp28+lS8mepSAV4qAMn1Y18ccUdQ8ck1uZmHt7Q+DPgGBOqtb3IZEikhQVyRtQUTUQevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739191701; c=relaxed/simple;
	bh=UuOxa3/8YwZ78k9m3M65j3xGXFN7L5EHG19EDz75sHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KQtHH97pSNBVSTXNtjpiH9TRC8UUbXrYOCLgQ3rkDk/B4QEnty9bCsvG/8kh/SvFubm3DpHLHGyiHeWNJLdmnaOixmxazFxbZhJFPcIFNihvCBP9jQXT+hFJUfvQBG7SFPcbC+vnnZO+xnT4Z5000WSdh7lPCqzrCiFwXbMFKPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BayaZx5j; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BayaZx5j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2513FC4CEDF;
	Mon, 10 Feb 2025 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739191700;
	bh=UuOxa3/8YwZ78k9m3M65j3xGXFN7L5EHG19EDz75sHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BayaZx5jHk0RZCLgwWPGoagU4uTRa21H89Q59uSPhLo6bS8l7C9MXFqI48Ro17nwg
	 yDPQSiALavRSLLd3UBaQR9X42TxQRtbBbrnFG9mUU6SI7S4EZGTFi+XOxTUrr/ShKj
	 AbEE8rxOq76rhhuI1o+LAtoFJ+jMVOpwy2RtFFzAnsL0pPlA8JkdLRIs1M0JOaOSX9
	 m7pBSPB5xblxpfB5XRoj7kiNNmg+VLWxT3pmQS1bI4Rcp76TAcn1zv7HsNrZiZNPNF
	 5FZ1x0Uf53TUrNzHgy70dnct15WPRyc2PFEajdSknbqH6GRSpDdoeWIJMtbtY40/x8
	 SOMSIbNL9xqZA==
From: Robert Foss <rfoss@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, 
 oushixiong1025@163.com
Cc: Dharma Balasubiramani <dharma.b@microchip.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Shixiong Ou <oushixiong@kylinos.cn>
In-Reply-To: <20250206071713.180471-1-oushixiong1025@163.com>
References: <20250206071713.180471-1-oushixiong1025@163.com>
Subject: Re: [PATCH] drm/bridge: convert to use
 devm_platform_ioremap_resource()
Message-Id: <173919169685.3912267.6367298600066886391.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 13:48:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 06 Feb 2025 15:17:13 +0800, oushixiong1025@163.com wrote:
> convert to use devm_platform_ioremap_resource().
> 
> 

Applied, thanks!

[1/1] drm/bridge: convert to use devm_platform_ioremap_resource()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/aaad45cfaa1b



Rob


