Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175B418DB0A;
	Fri,  7 Feb 2025 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946656; cv=none; b=MtXyorEWG8gyFBPoBNAoDKJFSD9B2C/omtZB0haxOMlO3GH3B3W/LZfRVnbTfRA/dtAxjdJrGINVPcldYTjOdn4kRepmZ28RarmFepr28N2IlK1NBKshNbMF4CxV0ayVFiEzs+b6wzms40kSmuSd3mlQn5HyK7DYxN9hGFhqnL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946656; c=relaxed/simple;
	bh=mpfqKzszvYHRVS4h3ZzegMtUNRbdbK2CRVu0Bq65xww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jcBywXVfdo9M/SaIti4GdJUOy4p5mjrLtai3IE8aT7RHWD9MleIwT5JDKNNfP0boGKYWkR55do2UCxpPp6l28rFkdSohKfbfDzDkJXF08MNcP4Xwl9nLoUp8Y6rVs83OIuWxbaE3ZZMiirDEZT43xDQK0y7R2vU1QAc5pojA9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fCCFcmaq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fCCFcmaq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738946652;
	bh=mpfqKzszvYHRVS4h3ZzegMtUNRbdbK2CRVu0Bq65xww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fCCFcmaq8dKOMU4WC5ZB3w0+2+aY8xIkb+k8lUyjSVhMX+EU7P6HG6608ayjEEZhU
	 gVdl+vuvhRar9+nEB2rthByvchRftzrK5owsHjRMTFa97uRqZ7lAoGK5jqufrGWzKU
	 C0sUUWg9BLpq/Cr7jOxExsFEwJdaTal7sQSO8y15UieIsy6fHYb9/SxXIUezqn/BH5
	 WQF9U9X8W/nwUtaNLUmTYZLoHgJv3/n0pgzbLHIR0lpxwxfVCvJDk0+HxiEYN2qElY
	 xgu6T630ApeQXmVCgoYWWJU/WE3skvTXrqqC/EvKUGLu4fXzCBenkl6FeCAd4tzjkD
	 QNjt5Ip4JwwXw==
Received: from [192.168.1.90] (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A3D0817E0239;
	Fri,  7 Feb 2025 17:44:11 +0100 (CET)
Message-ID: <648b2706-ba92-4ce9-aff0-0ee8f3e051e6@collabora.com>
Date: Fri, 7 Feb 2025 18:44:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ASoC: SOF: amd: Add post_fw_run_delay ACP quirk
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
 <20250207-sof-vangogh-fixes-v1-1-67824c1e4c9a@collabora.com>
 <b9c412cf-32af-4cc7-af6d-d4be5b796ccd@amd.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b9c412cf-32af-4cc7-af6d-d4be5b796ccd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/7/25 2:35 PM, Mukunda,Vijendar wrote:
> On 07/02/25 17:16, Cristian Ciocaltea wrote:
>> Stress testing resume from suspend on Valve Steam Deck OLED (Galileo)
>> revealed that the DSP firmware could enter an unrecoverable faulty
>> state, where the kernel ring buffer is flooded with IPC related error
>> messages:
>>
>> [  +0.017002] snd_sof_amd_vangogh 0000:04:00.5: acp_sof_ipc_send_msg: Failed to acquire HW lock
>> [  +0.000054] snd_sof_amd_vangogh 0000:04:00.5: ipc3_tx_msg_unlocked: ipc message send for 0x30100000 failed: -22
>> [  +0.000005] snd_sof_amd_vangogh 0000:04:00.5: Failed to setup widget PIPELINE.6.ACPHS1.IN
>> [  +0.000004] snd_sof_amd_vangogh 0000:04:00.5: Failed to restore pipeline after resume -22
>> [  +0.000003] snd_sof_amd_vangogh 0000:04:00.5: PM: dpm_run_callback(): pci_pm_resume returns -22
>> [  +0.000009] snd_sof_amd_vangogh 0000:04:00.5: PM: failed to resume async: error -22
>> [...]
>> [  +0.002582] PM: suspend exit
>> [  +0.065085] snd_sof_amd_vangogh 0000:04:00.5: ipc tx error for 0x30130000 (msg/reply size: 12/0): -22
>> [  +0.000499] snd_sof_amd_vangogh 0000:04:00.5: error: failed widget list set up for pcm 1 dir 0
>> [  +0.000011] snd_sof_amd_vangogh 0000:04:00.5: error: set pcm hw_params after resume
>> [  +0.000006] snd_sof_amd_vangogh 0000:04:00.5: ASoC: error at snd_soc_pcm_component_prepare on 0000:04:00.5: -22
>> [...]
>>
>> A system reboot would be necessary to restore the speakers
>> functionality.
>>
>> However, by delaying a bit any host to DSP transmission right after
>> the firmware boot completed, the issue could not be reproduced anymore
>> and sound continued to work flawlessly even after performing thousands
>> of suspend/resume cycles.
>>
>> Introduce the post_fw_run_delay ACP quirk to allow providing the
>> aforementioned delay via the snd_sof_dsp_ops->post_fw_run() callback for
>> the affected devices.
> As per our understanding, Till ACP firmware starts responding to the
> driver's IPC messages, FW won't acquire the HW lock.
> Adding delay in post_fw_run() callback seems to not a correct solution,
> as there are no IPC messages will be sent from host till FW boot ready
> is received.

I suspect there is some sort of a race condition or hardware fault that
causes the DSP to become unresponsive if the host attempts to send
messages too fast after the firmware boot completed.  Delaying the
transmission by 100us proved to be a reliable workaround (going below
10us was not enough).

Please note this was not always easy to reproduce, e.g. in some cases I
had to run hundreds of suspend/resume cycles, hence I think it really
points to a timing issue.

Moreover, as soon as I tried to enable SOF debugging, the issue was
gone, no matter how hard I tried to reproduce (ran thousands of cycles).

> Is fail to acquire the HW lock is for first host IPC message?

That seemed to be the pattern, yes.

>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  sound/soc/sof/amd/acp.c     |  1 +
>>  sound/soc/sof/amd/acp.h     |  1 +
>>  sound/soc/sof/amd/vangogh.c | 18 ++++++++++++++++++
>>  3 files changed, 20 insertions(+)
>>
>> diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
>> index 33648ff8b83365e76d7d90e52c2cb8f884a2fe72..9e13c96528be3371e063072513c118cfc8b93fe8 100644
>> --- a/sound/soc/sof/amd/acp.c
>> +++ b/sound/soc/sof/amd/acp.c
>> @@ -27,6 +27,7 @@ MODULE_PARM_DESC(enable_fw_debug, "Enable Firmware debug");
>>  static struct acp_quirk_entry quirk_valve_galileo = {
>>  	.signed_fw_image = true,
>>  	.skip_iram_dram_size_mod = true,
>> +	.post_fw_run_delay = true,
>>  };
>>  
>>  const struct dmi_system_id acp_sof_quirk_table[] = {
>> diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
>> index 800594440f73914e7b8ccaf86369ac686e1da630..2a19d82d6200223cdfccd49fbcf1b52968ae1230 100644
>> --- a/sound/soc/sof/amd/acp.h
>> +++ b/sound/soc/sof/amd/acp.h
>> @@ -220,6 +220,7 @@ struct sof_amd_acp_desc {
>>  struct acp_quirk_entry {
>>  	bool signed_fw_image;
>>  	bool skip_iram_dram_size_mod;
>> +	bool post_fw_run_delay;
>>  };
>>  
>>  /* Common device data struct for ACP devices */
>> diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
>> index 8e2672106ac60a22824836a944503a05616f8661..d5f1dddd43e72dd62b3d031130193e6125edf9df 100644
>> --- a/sound/soc/sof/amd/vangogh.c
>> +++ b/sound/soc/sof/amd/vangogh.c
>> @@ -11,6 +11,7 @@
>>   * Hardware interface for Audio DSP on Vangogh platform
>>   */
>>  
>> +#include <linux/delay.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/module.h>
>>  
>> @@ -136,6 +137,20 @@ static struct snd_soc_dai_driver vangogh_sof_dai[] = {
>>  	},
>>  };
>>  
>> +static int sof_vangogh_post_fw_run_delay(struct snd_sof_dev *sdev)
>> +{
>> +	/*
>> +	 * Resuming from suspend in some cases my cause the DSP firmware
>> +	 * to enter an unrecoverable faulty state.  Delaying a bit any host
>> +	 * to DSP transmission right after firmware boot completion seems
>> +	 * to resolve the issue.
>> +	 */
>> +	if (!sdev->first_boot)
>> +		usleep_range(100, 150);
>> +
>> +	return 0;
>> +}
>> +
>>  /* Vangogh ops */
>>  struct snd_sof_dsp_ops sof_vangogh_ops;
>>  EXPORT_SYMBOL_NS(sof_vangogh_ops, "SND_SOC_SOF_AMD_COMMON");
>> @@ -157,6 +172,9 @@ int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
>>  
>>  		if (quirks->signed_fw_image)
>>  			sof_vangogh_ops.load_firmware = acp_sof_load_signed_firmware;
>> +
>> +		if (quirks->post_fw_run_delay)
>> +			sof_vangogh_ops.post_fw_run = sof_vangogh_post_fw_run_delay;
>>  	}
>>  
>>  	return 0;
>>
> 

