Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E5F22A7E6;
	Fri,  2 May 2025 23:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229939; cv=none; b=oE/DvbbVv16rGE0utwKJVLlwpJl1lHj/sV5Z8JmCik6G8HhUtTzuxmbZkxE5vgrIMiCICGuNC4C38lFhsqf3Q4A9+H4PxWqV0Eq0WEYaKem+7cJdSheK1YkXLTTzqy8iF2iQ6Jusd18Hl2achvBc2BCpNQZf72KNELiG7OYUUTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229939; c=relaxed/simple;
	bh=/6qP9qVCVKgB0iacvpz5uSsA0b6JMWSlHOczG/mXoKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOxaxRs2rAzEvI7ckcYcMrO1PQsuGAJ2f83E8ykOZJblDwdGlNVCtmaK8043tMrbKs2Ib+MiPHgVm/3pY5ZzQHjiqwFrZdOs8zAjJGJ+2IJrcpKh1rC/VK9wICHLZOv+tBXuuC0xlMLZWiS74n7AVDQ7MzNLYd8ew1SMvg0+GPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=pIuId8dp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="pIuId8dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746229916; x=1746834716; i=w_armin@gmx.de;
	bh=hjHKLKtXun0kxa9uokkbN0zM9P/9kbN/sNgraHZQW1I=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pIuId8dptbRi+FrSGAjXASc+fFwQ5E3LTVcV4jhCMtS3G/uT43TzqM1WPH6vibYI
	 fYQkd/vi/k81jW7f5g387EStQw4XsekJX6EbO9qQcBLSdOvYYQJ/ccdBFEvELwqYj
	 0gkhCK9Vaf5xXFlsPzItME2/fx2ZVzZwVNOCIgmudWQV+05JcbsbHgjfLBh2lNLW7
	 y3Oh0/wjLPO405QVj3BJCXOkTDiJ1JUzQoTRyPGsj9Clg12Vc2qI5JGITRmj+IlGJ
	 IBcJmXpF9Zx/xRlVMUq4DBdMPnM8WSmg9bGMecSPOejlu3QT+SUTK/f9guPlqOgNZ
	 2+Wxolr0qi8O1jdlkw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1uH3uk0Yuc-006Gzk; Sat, 03
 May 2025 01:51:56 +0200
Message-ID: <666a5de4-92a1-4ffa-9535-c34ec7cf49bc@gmx.de>
Date: Sat, 3 May 2025 01:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Suspend/resume failing due to SPD5118
To: carlon.luca@gmail.com, linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com
References: <92a841f0-ab20-4243-9d95-54205790d616@roeck-us.net>
 <20250502230753.616322-1-carlon.luca@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250502230753.616322-1-carlon.luca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:LqToRxxL8TPNH6jVlMuhq74Gh6QZw6yVROtNRygsOv+VwkPmQil
 YLR2KcaNfC3VDeAafrEFg6I/lFagTca+mgNF513UFikIavASnbjPHrTU7cXZsKTnkWwlszx
 v+WZOzPyu/Bhd/zjuukoOk/JNjXvQdL8ygReTEyOvaYwP8fS6/cTCqpEGJEfml9jIh+VnT+
 yZaexJFwapJIn5Nfj/6kA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LFPun9IX9tc=;VVLEk7cIvauHWkVuiMEsmo2KWqo
 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
 YrXt4ss8FRSqPIvHi6UH30l3BwZ1tzE=

Am 03.05.25 um 01:07 schrieb carlon.luca@gmail.com:

>> The timeout is observed when the resume code tries to write data back to the
>> spd5118 chip. It originates from the i2c controller driver, not from the spd5118
>> driver. I have no idea why the i2c controller would time out in this situation.
>> Presumably it should have been brought out of suspend by the time devices connected
>> to it are re-enabled, but I don't see any associated message in the log.
>>
>> I know that others have tested suspend/resume support with the driver and confirmed
>> that it works. It might help to enable debugging of the i2c controller driver if that
>> is possible. Other than that I have no idea what might cause this problem or how to
>> track it down.
> Hi,
>
> I recently bought a new machine, and trying to hibernate results in these messages
> from the kernel:
>
> [  195.176483] PM: hibernation: hibernation entry
> [  195.200054] Filesystems sync: 0.005 seconds
> [  195.200760] Freezing user space processes
> [  195.203723] Freezing user space processes completed (elapsed 0.002 seconds)
> [  195.203732] OOM killer disabled.
> [  195.204506] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x00000fff]
> [  195.204512] PM: hibernation: Marking nosave pages: [mem 0x0009f000-0x000fffff]
> [  195.204517] PM: hibernation: Marking nosave pages: [mem 0x4ee2f000-0x524fefff]
> [  195.204924] PM: hibernation: Marking nosave pages: [mem 0x8b93b000-0x8bb7bfff]
> [  195.204941] PM: hibernation: Marking nosave pages: [mem 0x8eedd000-0x8eeddfff]
> [  195.204943] PM: hibernation: Marking nosave pages: [mem 0x92fe3000-0x92fe3fff]
> [  195.204945] PM: hibernation: Marking nosave pages: [mem 0x944ff000-0x97ffefff]
> [  195.205340] PM: hibernation: Marking nosave pages: [mem 0x98000000-0xffffffff]
> [  195.210276] PM: hibernation: Basic memory bitmaps created
> [  195.212709] PM: hibernation: Preallocating image memory
> [  196.875538] PM: hibernation: Allocated 1013859 pages for snapshot
> [  196.875544] PM: hibernation: Allocated 4055436 kbytes in 1.66 seconds (2443.03 MB/s)
> [  196.875547] Freezing remaining freezable tasks
> [  196.876843] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  197.559071] printk: Suspending console(s) (use no_console_suspend to debug)
> [  197.771716] spd5118 1-0051: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
> [  197.771734] spd5118 1-0051: PM: failed to freeze async: error -110
> [  197.979717] spd5118 1-0050: PM: dpm_run_callback(): spd5118_suspend [spd5118] returns -110
> [  197.979739] spd5118 1-0050: PM: failed to freeze async: error -110
> [  199.028103] PM: hibernation: Basic memory bitmaps freed
> [  199.028080] mei_pxp i915.mei-gsc.768-fbf6fcf1-96cf-4e2e-a6a6-1bab8cbe36b1: bound 0000:03:00.0 (ops i915_pxp_tee_component_ops [i915])
> [  199.029101] OOM killer enabled.
> [  199.029104] Restarting tasks ... done.
> [  199.088935] efivarfs: resyncing variable state
> [  199.326219] PM: hibernation: hibernation exit
>
> the operation aborts and I cannot hibernate the machine. I fixed the problem by
> blacklisting the driver spd5118.
>
> I see that the reported problem was in the resume operation, mine is in the suspend
> operation, so I'm not sure if this is related and if the logs can help.
>
> My kernel version is 6.14.4-arch1-1.
>
> Regards.
>
> Luca Carlon

Interesting, please check which i2c controller handles the SPD5118 chip (cat /sys/bus/i2c/devices/i2c-1/name).

Can you access the i2c bus (using i2cdetect) and/or the spd5118 chip after such a failed resume attempt?

Thanks,
Armin Wolf

