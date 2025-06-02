Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8931386344;
	Mon,  2 Jun 2025 19:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748892927; cv=none; b=EDbrdQdN8sC44JjoCBTW0rVbqJW4YAOP3LLh1k+xdiLplWNKIiEHIzFDSwCmhnJvXH3zKqiZFE/qa0XeB8o0tU7DbPhDbsi7ywgL6JNyTtRlIkPjjTxDsQFoLeRF2AuAH9/tY21kyqi2XN7BlVU0Mc6gTggyXHKIbNfWHE0nYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748892927; c=relaxed/simple;
	bh=DzeqapKfXOeLo/h40hwv/+ekVEA5yJxW5rpifuUtKjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CW5SUTBf9SX5NpVxWJ0DgS9JsJ3HnntFP1yTiN5pnCXHQ1PbXPqIUKsBb3Bfl/yYIPu9Z+EzR+qwbKpw/Imc/dMCUJUEGli7D3lp3O1+VRh/ICHQbpe11rN8K1JnL948Io4n22icHDy58ha0Ie66P7BK5bat3PkVBW9ltcdq4pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MG5NioNS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MG5NioNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1748892923;
	bh=DzeqapKfXOeLo/h40hwv/+ekVEA5yJxW5rpifuUtKjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MG5NioNSySBYdaSYee23zZ9tOWszOvcJenenQ/r0eYJd3aiRJj0jJRUafFYs7rFny
	 g8olPb1XAt2UrCW46sjuXWrKyLXwzUIJyec5o/Cp9X9wNiDeVUTd489B1/3qHPzX+N
	 745SrbFGHs+NCVvEgy6xegZHRhN1YALKH2x+f2UDVOHgz2vowfV9bzH3l848Cif3Fz
	 jUoa4LGl0MNJLL1uRWVppSzhFgqAS2WGKlUOQi6+WENGBn1mlDcTpAevH5VcwNAP/c
	 q+B0Zq18E5IXRpmS1lkWBol+dfmzXnD4oi1huIMGQN2cL0Y9x7ourl1EHvJAyxYMNg
	 h59QuRQbuF6DA==
Received: from [192.168.1.90] (unknown [188.24.155.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6126F17E088C;
	Mon,  2 Jun 2025 21:35:23 +0200 (CEST)
Message-ID: <0c2b3de3-700c-4ee8-9650-6033a4882d58@collabora.com>
Date: Mon, 2 Jun 2025 22:35:22 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] ALSA: usb-audio: Support jack detection on Sony
 DualSense PS5
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250526-dualsense-alsa-jack-v1-0-1a821463b632@collabora.com>
 <87jz5uxkej.wl-tiwai@suse.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <87jz5uxkej.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/2/25 5:55 PM, Takashi Iwai wrote:
> On Mon, 26 May 2025 16:07:39 +0200,
> Cristian Ciocaltea wrote:
>>
>> The Sony DualSense PS5 controller has an internal mono speaker, but it
>> also provides a 3.5mm jack socket for headphone output and headset
>> microphone input.
>>
>> Since this is a UAC1 device, it doesn't advertise any jack detection
>> capability.  However, the controller is able to report HP & MIC insert
>> events via HID, i.e. through a dedicated input device managed by the
>> hid-playstation driver [1].
>>
>> This patch series implements a quirk to create the jack controls for
>> headphone and headset mic, respectively, and registers an input handler
>> for each of them in order to intercept the related hotplug events.
>>
>> It's worth noting there is no hard dependency on the HID patch set [1],
>> as the usb-audio driver will simply bind the jack controls to the input
>> devices when they become available - this is managed internally by the
>> input handler framework.
>>
>> Unrelated to the above, the series also provides fixes to a bunch of
>> general coding style issues as reported by checkpatch.
>>
>> [1] https://lore.kernel.org/all/20250526-dualsense-hid-jack-v1-0-a65fee4a60cc@collabora.com/
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Thanks for patches.  Through a quick glance, the code change looks OK,
> but since it's with significant amount of changes, so I'll postpone
> after 6.16 merge window (once after I'm back from traveling).

Sure, no worries, take your time!  Thanks for the early feedback!

Cristian
