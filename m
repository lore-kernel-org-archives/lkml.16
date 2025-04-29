Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F5A274FF3;
	Tue, 29 Apr 2025 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915014; cv=none; b=b+PTsqaSq3W4YV6G6Zgo0sShH53RNV60Djhh/O9Vti+Fx4mTUvtgalwG7A2MEFlZF0wUNEq3cHOTz7y0OlwQpaGX05DF1E4+F4ZqhxYavxAvgA2tKAe5EpMPqovxutFVDSW5XX7npWaHUKrZVowMSkYACHwwCTkF936PqNvUKw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915014; c=relaxed/simple;
	bh=iC4tDPfw4UC8fYfG73ZLD/qQqPlSEGFL9tSlzcxuolU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c1VEmx0jE2L99Lozas8nI90zCNXyZ6rtPwWb1Rw3dDwrcDdUyk01A6OkiQ4PVX+39NyBb2KDoFjNw8zwhMrpIrzmKEIe1Si7Dm3mSXzd1pL9gPH4ku6oE4/aPTaq7FPYdgY1N4UDhBhqEbPXixhx5ixlqJiC0QmB/Sx+YFip+OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=e1D45ZEy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="e1D45ZEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745915010;
	bh=iC4tDPfw4UC8fYfG73ZLD/qQqPlSEGFL9tSlzcxuolU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1D45ZEy6XfHfmHTEldk/tORA2lgxGXC2ZezhbNTeHUyMrpYQHSIBrqIxFsO5aI7H
	 o7oQXsMDWT0fQKrtAa5vsggcPldI5wqiMcKJ7UN31gUdOGnSXkKjztQEjIxy1aQ4AZ
	 ryu4l07hUls509BO7HZNPXCRt6b0BqQxUqisz6dlbwLdHou/o2sc008TAbGZisuDdW
	 jAozW0lg4nxJnIb+UQHmrYORG6U9z5MbgYX4IBxCtvFh2rGeFkORPVmS4Wc5FdI/lm
	 7sICLqg+Jv3XdPLucd5h8tp/57jK9Y3QYnn5cYyJOl0wqAN8niLjDzLjYuZO7AkidD
	 kUcf2CV9tdNtw==
Received: from [192.168.1.90] (unknown [84.232.140.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C446917E00FC;
	Tue, 29 Apr 2025 10:23:29 +0200 (CEST)
Message-ID: <3fcc3871-4367-4ff5-9529-d1bada6f06e1@collabora.com>
Date: Tue, 29 Apr 2025 11:23:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: SOF: topology: Fix null pointer dereference
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
References: <20250429-fixup-of-sof-topology-v3-1-3a15b8db7696@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250429-fixup-of-sof-topology-v3-1-3a15b8db7696@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 10:07 AM, Julien Massot wrote:
> The "get_function_tplg_files" function is only applicable to
> ACPI-based devices (sof_pdata->machine and sof_pdata->not of_machine).

s/not //

> Skip this check for OF-based devices to avoid a NULL pointer
> dereference in snd_sof_load_topology().
> 
> Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
> Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> ---
> Changes in v3:
> - More detailled commit message
> - Link to v2: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com
> 
> Changes in v2:
> - Better commit message as suggested
> - Link to v1: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com
> ---
>  sound/soc/sof/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

With the above fixed:

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
