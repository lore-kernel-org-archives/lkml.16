Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C4921FF2B;
	Thu, 12 Jun 2025 07:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714530; cv=none; b=esFhdazeoa0EzK+RDx83ueookVTRcaU5nTf/um6QWMPMjeW74PJmW4c8Pp+7OuUN523cnPttJ16YGOS9k84tDUwQc3XpjqFTWYblY7+pWMR1rgsDBzo9V2eZEhfGMo1JjNsOepP/Gsn62JmWumPj1Cu5AawHljlhGOllPwflslI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714530; c=relaxed/simple;
	bh=pGrWzWrpTEMKsYBNAeH/vQhaAU86ivNDkNoEIlv2dK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e6Nwaf5FufHEV7EcwLGIJ0/aDYOsCgOUD8jKshtFJeb1viqlVC+9oV+N98i/FsMYVF+bz+705DgBqF5f+wij9DgewGsUlA23brKlfvIWa04j6lUXr6gfH+vVKd8iaEmTISBZVIlb9kxIRK0sGymiJF/pvmgsQABrUSH4B8j9e3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JGnb1JkT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JGnb1JkT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749714526;
	bh=pGrWzWrpTEMKsYBNAeH/vQhaAU86ivNDkNoEIlv2dK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JGnb1JkTrhRE4lAyZDaBEsGAHx1F+prufkguqK3N+O+KmjNLCUIcOxcm2sqdVN+vv
	 sjf3f17/UWcHfYmIxdJuZov1N3BG8LETCrvroKO83MclK4x6l70sw+cq1xJKrgQBsm
	 tFg0pzly3ttHGPO66I2nSu8qIBSlZBK1sKNLj1f1bSUhZEV85GTj9zwUz+hIHELVyi
	 8ARQo7lJWX3kmOLWc1pphgaZyv5tPF2TFqQPoWf6gQ2befgHBX4nObvKg2nfmzlEFs
	 9SuinJxCcoIZxYTu7wRa6AaF1retQk+UEhGwhCBQaRkPH8cl0cyAOYxqy5X7FmRVwy
	 2dmnTodz3GglQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADEB017E00A3;
	Thu, 12 Jun 2025 09:48:45 +0200 (CEST)
Message-ID: <644a7d9d-c2b4-412f-ab6c-860f5fae3676@collabora.com>
Date: Thu, 12 Jun 2025 10:48:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Convert comma to semicolon
To: Takashi Iwai <tiwai@suse.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, perex@perex.cz, tiwai@suse.com,
 franta-linux@frantovo.cz, lina+kernel@asahilina.net, livvy@base.nu,
 sstistrup@gmail.com, s@srd.tw, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250612060228.1518028-1-nichen@iscas.ac.cn>
 <87ikl1v4cj.wl-tiwai@suse.de>
 <b8f6fb15-cc77-41c5-b362-70cfd6be6f37@collabora.com>
 <87ecvpv2mf.wl-tiwai@suse.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <87ecvpv2mf.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 10:30 AM, Takashi Iwai wrote:
> On Thu, 12 Jun 2025 09:22:36 +0200,
> Cristian Ciocaltea wrote:
>>
>> On 6/12/25 9:52 AM, Takashi Iwai wrote:
>>> On Thu, 12 Jun 2025 08:02:28 +0200,
>>> Chen Ni wrote:
>>>>
>>>> Replace comma between expressions with semicolons.
>>>>
>>>> Using a ',' in place of a ';' can have unintended side effects.
>>>> Although that is not the case here, it is seems best to use ';'
>>>> unless ',' is intended.
>>>>
>>>> Found by inspection.
>>>> No functional change intended.
>>>> Compile tested only.
>>>>
>>>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
>>>
>>> Thanks, applied now.
>>>
>>> At the next time, though, it'd be appreciated if you can put the
>>> proper Fixes tag.
>>
>> Considering this is not really a functional change, I think a 
>> Fixes tag would trigger an unnecessary backport, wouldn't it?
> 
> If it were in the old released kernels, I wouldn't be bothered,
> either.  But this is still in staging for the next, and having Fixes
> tag will help to track if someone tries to backport patches.
> Otherwise the code differs and may give conflicts in further
> backports.

Oh, indeed, thanks for pointing this out!

Regards,
Cristian
