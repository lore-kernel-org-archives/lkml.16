Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A641760;
	Mon, 28 Apr 2025 20:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745872634; cv=none; b=Tx9s21sPWvjmp+zeNkrQSOPTd1Jni3dVvxWWZPN92wZ0y/nw9zgTAmDxH+TNQd9A3quUmyxKKMRNbibfuszf75gLilRXO5OFPP9OaK0cQmL83boKdeB8LI3AB4YvvxDIdUJDPCFKJ0g913nOZ1RnCAjKphfmM9l0qUeZMpJpKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745872634; c=relaxed/simple;
	bh=8jVpVG3eSi/W+hXkKvLGMs+z346LFKAt5v7fk9++Rw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VUhdpvuNIOLMHpHDl4zkK9e3K+ZNXTdipiZQh1R+B7++WeuGaophuR2gL5YqIcyYf5CCnNreJEzyMkLltKuheyAXzgKpMBEYFnEMg/wq3qR5bG2f1kVXzTqgemylVUl6++mbrKB2/QQ2MHoGEptfQj4c2da382bzUbQ8x+v1a+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=E0ftaA6O; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="E0ftaA6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745872630;
	bh=8jVpVG3eSi/W+hXkKvLGMs+z346LFKAt5v7fk9++Rw0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E0ftaA6Oq8ITSsPQS52FY9yp8III2TT/QguTTqX5DWcLRFTLC7Or917Iu2v9Jbh9K
	 q/vxWNu0GWbkjMuG2Ba9BBFZ2jJrOlxlNk49Fe908ctSBsXhFV0Ef0kKIj8qe8gwhw
	 XHJYtRahtMRroo7pP/JlGa06/aI/qMey9msgbIfF1s3Fn/Jv382rE39AUtryTlhEgq
	 T/WESZig/ICLE2YgLmvbkKjomPt9bihP/FEJhm/2VmSuQZw5S/fQdOqihH6pFCLo/Y
	 Ak9503da/9nukL8ScBf18b0VLgjwyRfmZ+K0OVfnsp9RcxVjgFBpd24afyLv/YspdX
	 DpTlWZ3IgSIEA==
Received: from [192.168.1.90] (unknown [84.232.140.122])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5CEC117E0657;
	Mon, 28 Apr 2025 22:37:10 +0200 (CEST)
Message-ID: <f31be238-b281-456a-9069-554e7b5b7019@collabora.com>
Date: Mon, 28 Apr 2025 23:37:08 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix null pointer dereference
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
 linux-kernel@vger.kernel.org
References: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 4:32 PM, Julien Massot wrote:
> Prevent null pointer dereference in snd_sof_load_topology()

It looks like the commit description is now incomplete.

> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> Fixes: 6d5997c412cc ("ASoC: SOF: topology: load multiple topologies")
> ---
> Changes in v2:
> - Better commit message as suggested
> - Link to v1: https://lore.kernel.org/r/20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com
> ---
>  sound/soc/sof/topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

[...]
