Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582781FC3;
	Fri,  4 Jul 2025 02:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751597215; cv=none; b=CbXbK40R+Hoh/ERnbQiV8hghuDWzepuDcffP+0JtQXIj+e7lMBG/t5mGVdER8YKPf0kjhWIJl50Pm6AMtzMADZOH8noejg9M1Vb21flr9XpgQvJE+LLQ+yBKdsseDS14fuIemkdsFzqrMikbcE1F128wUyAa+55xTstJyGdy23s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751597215; c=relaxed/simple;
	bh=Sca8HTXk5lZZ2amtFEuOyYMdTFnNHWuwQHd/51XoroY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQTV3fNrqAWxmwEESIfmZV01c9AqNkQpCyPJR7vXP8uWH4bk2JiCsTeew+6EuT8MjUz1bpzepeUl8e8IuPTWURFTsIMaqH8Zcgb60RzvqjrFO2UC1zkxjqPdULqLeY1sOUe1gckjaoHRnjWFFrl/VqE3fSyOIerHbXxkRifiIks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYF9lCGn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYF9lCGn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 226A2C4CEE3;
	Fri,  4 Jul 2025 02:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751597213;
	bh=Sca8HTXk5lZZ2amtFEuOyYMdTFnNHWuwQHd/51XoroY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYF9lCGnUe2vTZcoR1TTsdrbES2lBUjW4wGSn23VOPVXSffrX3aSJAySG5TcohdM9
	 RzqAupM5aXPVlSOVBTSPfWCRNAaqfmsXDU+7vvOeJjRT/32LcYIsUXz5SJMxBGF5TN
	 YFGUXHOt0Xqaygz3dbRoV+Kfzese3uTTkvjLYnv0HWWwgy79XYujKJIdJmS/uwW/d0
	 ktMtjeai4R+pn+y1p5ybFod4zXFVn/UImeaU/7Gey2ZHg4wnKOZY5cEXn2J2JqmFk8
	 fCOI49sDyVXqC4GDAWhfo6gzHVziJoj4yO3Im3qnrd08LRk94epIYbDgrYAE/7qfuw
	 hFfMVjtrUOZjg==
Date: Fri, 4 Jul 2025 02:46:48 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for
 "memory-region"
Message-ID: <aGdAmGGPDA71rDE3@google.com>
References: <20250703183523.2075276-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703183523.2075276-1-robh@kernel.org>

On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
