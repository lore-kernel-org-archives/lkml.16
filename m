Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674DD14A4CC;
	Mon, 31 Mar 2025 06:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404309; cv=none; b=bt5ZDObqRxfWFC6hTXkE2/atQ+59xoA2xtDKUXVVHDPZ5IZiYy7frSfhuuCdjqR86g5omjoNlu1B1zpviqQf3SzfERqqzHDFvOiLEtvQ5I783EDrLYJ/QLE+pxZlZcdN/yw4teGp4QJU31OLr0C/ozfQGibVOyAieHw2GkHG2I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404309; c=relaxed/simple;
	bh=OsZ+EwP4sbJVInU0CLRGNObI/igq4UBpRNLJtpCydRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmNMrkpD1VxR6f+70XjkF+x6QKUfE5B2XPaVKeYgEbaN25/WSG6NeofqrYb4pWWBCZ/KojDl8c17qUgDKOt8TkXbDp16J6ujyZUsbUTNGmS+m36C6wPeX6ZkWfqnO71i/WEqSEvT9IN5FtRb8qUZ6QCGpMVfYc5EISpMXWBYSUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt/J+2Lj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt/J+2Lj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7E8DC4CEE3;
	Mon, 31 Mar 2025 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404308;
	bh=OsZ+EwP4sbJVInU0CLRGNObI/igq4UBpRNLJtpCydRQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vt/J+2Ljuf5GEYZTpYFFKloXVr5Dex8vDKDdEFCNm8W6bzxU/zgaaf6Z3EJjQmyBG
	 PxnL6tvTEVsLe4n4vxjvuqrDADr6yLjUP5Diz5EOxI2PXhwWqmKOBoVUdyDy752/RP
	 CWy4VaZaFIi/OooOs1Qdv0JLhD1dYt2nY0MEruTLhaKLwM1xLdn3l6GR2cdTFMl5dF
	 vDVKr+oR7c5HbMBgmxWogNDy7CUfqJfescqUNVcowndnne9+1Chr/9k0YMCv1HQVc7
	 tSDggmDb49ysKpXOUDxX3e5EbbjU1QuE7SG5gp2xIQUK2bEJvQVIqPPUJuK2jAVV1Q
	 UATVa2YFFzpHA==
Date: Mon, 31 Mar 2025 12:28:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Liao, Bard" <bard.liao@intel.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select
 CONFIG_SND_SOF_SOF_HDA_SDW_BPT
Message-ID: <Z+o9D7FhTyUp2Y9o@vaman>
References: <20250328132438.1024742-1-arnd@kernel.org>
 <SJ2PR11MB8424B5677C548803F2F2A513FFA02@SJ2PR11MB8424.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ2PR11MB8424B5677C548803F2F2A513FFA02@SJ2PR11MB8424.namprd11.prod.outlook.com>

On 28-03-25, 14:15, Liao, Bard wrote:
> 
> 
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@kernel.org>
> > Sent: Friday, March 28, 2025 9:25 PM
> > To: Liam Girdwood <lgirdwood@gmail.com>; Peter Ujfalusi
> > <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-chuan.liao@linux.intel.com>;
> > Ranjani Sridharan <ranjani.sridharan@linux.intel.com>; Daniel Baluta
> > <daniel.baluta@nxp.com>; Mark Brown <broonie@kernel.org>; Jaroslav Kysela
> > <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Vinod Koul
> > <vkoul@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>; Kai Vehmanen
> > <kai.vehmanen@linux.intel.com>; Pierre-Louis Bossart <pierre-
> > louis.bossart@linux.dev>; sound-open-firmware@alsa-project.org; linux-
> > sound@vger.kernel.org; linux-kernel@vger.kernel.org
> > Subject: [PATCH] ASoC: SOF: Intel: hda-sdw-bpt: select
> > CONFIG_SND_SOF_SOF_HDA_SDW_BPT
> > 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The newly added driver fails to link without this:
> > 
> > ERROR: modpost: "snd_hdac_ext_stream_start" [sound/soc/sof/intel/snd-sof-
> > intel-hda-sdw-bpt.ko] undefined!
> > ERROR: modpost: "snd_hdac_ext_stream_clear" [sound/soc/sof/intel/snd-sof-
> > intel-hda-sdw-bpt.ko] undefined!
> > ERROR: modpost: "snd_hdac_ext_stream_setup" [sound/soc/sof/intel/snd-sof-
> > intel-hda-sdw-bpt.ko] undefined!
> > ERROR: modpost: "snd_hdac_ext_bus_link_set_stream_id"
> > [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
> > ERROR: modpost: "snd_hdac_ext_stream_reset" [sound/soc/sof/intel/snd-sof-
> > intel-hda-sdw-bpt.ko] undefined!
> > ERROR: modpost: "snd_hdac_ext_bus_link_clear_stream_id"
> > [sound/soc/sof/intel/snd-sof-intel-hda-sdw-bpt.ko] undefined!
> > 
> > Fixes: 5d5cb86fb46e ("ASoC: SOF: Intel: hda-sdw-bpt: add helpers for SoundWire
> > BPT DMA")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> I have the same patch which is pending review/apply.
> https://patchwork.kernel.org/project/alsa-devel/patch/20250321023032.7420-2-yung-chuan.liao@linux.intel.com/
> I am fine if we go with this patch.
> Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>

I have picked yours as that came first, thanks

-- 
~Vinod
