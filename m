Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFB819C543;
	Fri,  7 Feb 2025 17:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947640; cv=none; b=nBEtj98JPZOihg3i6xVjb+u4rUpOhJIa2HLptuYib8wje8DlWshjIOOH+E9tekX+C3+EsbA6G49fVKFUuHtn4vOhMYSCuiezKHIZSy9Bwa5x9BEiioyG+sT+2aAB1X0Q0vjsJzEKADGuaOcdIIReDIARrdAy6LZkmAHNbF9LCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947640; c=relaxed/simple;
	bh=T83UNy/ANb6ddMae5xvV5RRqK7/Hhz51DSgxIMludyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GvbwHKUvUOGsjQXPqQSPlFrttRFI+yw+FJHWR6KAepoc+RMIqUPpJZBAIYa9zxSVRoS4C53ww2B0JISe4SZb/iGPTcX+v6oCTcJpppl17e70S/HEMmU042GfcnDnz+PH5Zz3aKOXXK0qahjcffvOE/4fuzWfDT2T8gFa7Ul29Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HPgt1Ria; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HPgt1Ria"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738947636;
	bh=T83UNy/ANb6ddMae5xvV5RRqK7/Hhz51DSgxIMludyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HPgt1RiaBA5U3DG580fjHfoCNUUjQf/AKUBfkRR5lonYfsuNyDT5qquadYc7EhW/z
	 vwEzausCbtFiYu3VcUpQVTkF7DMfm0McP8WqwDQQHb5iA7uZzDt6lY0+Rhr9qvptlL
	 v2LySaFTROv6CDa7bJtKC7DmM462wzt7HVNU/6QbBN/KgEdm8R3SYxbb5/SLzDiOsr
	 A6kUPumSWbcgPXhOrdUxqZKWgKGfKwC9eGb2UNS0Kb4L9pVZXe6PJzVfzmw6zqTVJR
	 jIb03IPmpSHtkSfa4BS05/TI7r4TpfUAQQdDOfcDWM3+AyxJM48FKMd6WrGe+j5Tp0
	 fcMrgqA4F+A3Q==
Received: from [192.168.1.90] (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CE7B17E0F9F;
	Fri,  7 Feb 2025 18:00:35 +0100 (CET)
Message-ID: <f253bb70-5991-4ee6-9f44-ac59751c6a38@collabora.com>
Date: Fri, 7 Feb 2025 19:00:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: Handle IPC replies before
 FW_BOOT_COMPLETE
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 "Hiregoudar, Basavaraj" <Basavaraj.Hiregoudar@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
Cc: kernel@collabora.com, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250207-sof-vangogh-fixes-v1-0-67824c1e4c9a@collabora.com>
 <20250207-sof-vangogh-fixes-v1-3-67824c1e4c9a@collabora.com>
 <cd64ea3c-fbb4-4c97-b369-dd78942a522f@amd.com>
 <49744378-f63c-4096-a055-00abaed688d2@collabora.com>
 <eb1628c2-b209-40a1-9f20-1057c2815536@amd.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <eb1628c2-b209-40a1-9f20-1057c2815536@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 2:24 PM, Mukunda,Vijendar wrote:
> On 07/02/25 17:46, Cristian Ciocaltea wrote:
>> On 2/7/25 1:55 PM, Mukunda,Vijendar wrote:
>>> On 07/02/25 17:16, Cristian Ciocaltea wrote:
>>>> In some cases, e.g. during resuming from suspend, there is a possibility
>>>> that some IPC reply messages get received by the host while the DSP
>>>> firmware has not yet reached the complete boot state.
>>>>
>>>> Detect when this happens and do not attempt to process the unexpected
>>>> replies from DSP.  Instead, provide proper debugging support.
>>> As per our understanding, before FW boot completion there won't
>>> be any IPC responses sent from Firmware.
>>> In this case, do we really need such a condition check?
>> During the suspend/resume stress testing I was able to get this kind of
>> messages, and that's the actual reason for introducing the verification.
>>
>> Also it doesn't seem to be uncommon, e.g. Intel HDA IPC also provides
>> similar checks.
>>
> Could you please share reference logs to know which IPC messages
> are being received before FW_READY message/FW boot complete?

As mentioned in a previous reply, I couldn't enable debugging during
stress testing because it had the annoying effect of hiding the audio
breakage issue.  I will try to experiment with some more targeted
instrumentation and see if it's possible to extract some useful data.

Regardless, I think it's worth keeping this check in place as it's
definitely helpful to spot potential FW issues (for current or future
products).

>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  sound/soc/sof/amd/acp-ipc.c | 23 ++++++++++++++++-------
>>>>  1 file changed, 16 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
>>>> index 5f371d9263f3bad507236ace95b7ef323c369187..12caefd08788595be8de03a863b88b5bbc15847d 100644
>>>> --- a/sound/soc/sof/amd/acp-ipc.c
>>>> +++ b/sound/soc/sof/amd/acp-ipc.c
>>>> @@ -167,6 +167,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>>>>  
>>>>  	if (sdev->first_boot && sdev->fw_state != SOF_FW_BOOT_COMPLETE) {
>>>>  		acp_mailbox_read(sdev, sdev->dsp_box.offset, &status, sizeof(status));
>>>> +
>>>>  		if ((status & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
>>>>  			snd_sof_dsp_panic(sdev, sdev->dsp_box.offset + sizeof(status),
>>>>  					  true);
>>>> @@ -188,13 +189,21 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
>>>>  
>>>>  	dsp_ack = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SCRATCH_REG_0 + dsp_ack_write);
>>>>  	if (dsp_ack) {
>>>> -		spin_lock_irq(&sdev->ipc_lock);
>>>> -		/* handle immediate reply from DSP core */
>>>> -		acp_dsp_ipc_get_reply(sdev);
>>>> -		snd_sof_ipc_reply(sdev, 0);
>>>> -		/* set the done bit */
>>>> -		acp_dsp_ipc_dsp_done(sdev);
>>>> -		spin_unlock_irq(&sdev->ipc_lock);
>>>> +		if (likely(sdev->fw_state == SOF_FW_BOOT_COMPLETE)) {
>>>> +			spin_lock_irq(&sdev->ipc_lock);
>>>> +
>>>> +			/* handle immediate reply from DSP core */
>>>> +			acp_dsp_ipc_get_reply(sdev);
>>>> +			snd_sof_ipc_reply(sdev, 0);
>>>> +			/* set the done bit */
>>>> +			acp_dsp_ipc_dsp_done(sdev);
>>>> +
>>>> +			spin_unlock_irq(&sdev->ipc_lock);
>>>> +		} else {
>>>> +			dev_dbg_ratelimited(sdev->dev, "IPC reply before FW_BOOT_COMPLETE: %#x\n",
>>>> +					    dsp_ack);
>>>> +		}
>>>> +
>>>>  		ipc_irq = true;
>>>>  	}
>>>>  
>>>>
> 

