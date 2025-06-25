Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D53328751F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843607; cv=none; b=sc+GmsGvF1lmzgYx44CEsNOY7FYwfpWlBLmgOmgR+SOMdUrIlm5WtmK99C7lerWA+hDXDNMkkrbJuw7R5QGpRaQiKERufdCsX8154i69mq/wFGvRk3OQ7hs1XvqpUjeZwEvwrpMS/+0x+qA4BYtpoJ3cWOh4wE15MA3mCgN6Nd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843607; c=relaxed/simple;
	bh=oU56uCoxi5MqAItg8ReBro2yvSnZ3Pqq4fySq91RXeU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=YcE0kq2e5GI1MVtlyPW+pdgvMFeM59gcpPXvObbZYt0saWNS3fjW6wYRslKe2LTnHHbBLj2T5MOuFLf98LLO5Xp98JCiJks8QXmedC6Z+rK7S/RU2V9K2EDZ0Facl790lswWEw9EF+rQnxHGTOehuuiW0GuP28BTh4YVMPz6p7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwFFDBAg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwFFDBAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE20C4CEEA;
	Wed, 25 Jun 2025 09:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750843605;
	bh=oU56uCoxi5MqAItg8ReBro2yvSnZ3Pqq4fySq91RXeU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ZwFFDBAgMnc9DfHIRY3jMSq3hkxd3C+cg8rfhzfQh0Eh0mX6cJ4ijvTBa6irliBpI
	 m+5WZnF2suYVwclFCZ55QLxe+TyGVc9j9wAGEX1iXzLZyEZssm6LXdsF0fwiywvV1E
	 i8s2ZTzHnqZuuMrI0yeQwRwgJ39+eDanfAtRpAAmcgyYA0as+i027VAab8RS1MtjR/
	 7Y8YvtB4lHJhi6G/Epgai1yjHNUk05vE1RAQYorRv+MyaaGIMD6V4NjKq3WRmFM3xi
	 nAvZKvuk79DKJ8yaJxxnCUIktyvzXvngyy3HFYdnQ5NIH48QldBRDHXVsECmiy0Ovl
	 SvZi6Y4FrSKgg==
Message-ID: <54f17c19-63d0-41a0-9d31-aff5fb73e99b@kernel.org>
Date: Wed, 25 Jun 2025 11:26:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] mei: vsc: Event notifier fixes
From: Hans de Goede <hansg@kernel.org>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-7-hansg@kernel.org>
 <CY5PR11MB6366468BAEADAB94B7286AF6ED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <9836099e-1162-4965-bf77-cded23fc811f@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <9836099e-1162-4965-bf77-cded23fc811f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25-Jun-25 11:23 AM, Hans de Goede wrote:
> Hi,
> 
> On 25-Jun-25 11:12 AM, Usyskin, Alexander wrote:
>>> Subject: [PATCH 06/10] mei: vsc: Event notifier fixes
>>>
>>> vsc_tp_register_event_cb() can race with vsc_tp_thread_isr(), add a mutex
>>> to protect against this.
>>>
>>> Fixes: 566f5ca97680 ("mei: Add transport driver for IVSC device")
>>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>>> ---
>>>  drivers/misc/mei/vsc-tp.c | 12 +++++++++---
>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
>>> index 0feebffabdb3..76a6aa606a26 100644
>>> --- a/drivers/misc/mei/vsc-tp.c
>>> +++ b/drivers/misc/mei/vsc-tp.c
>>> @@ -79,9 +79,8 @@ struct vsc_tp {
>>>
>>>  	vsc_tp_event_cb_t event_notify;
>>>  	void *event_notify_context;
>>> -
>>> -	/* used to protect command download */
>>> -	struct mutex mutex;
>>> +	struct mutex event_notify_mutex;	/* protects event_notify +
>>> context */
>>> +	struct mutex mutex;			/* protects command
>>> download */
>>>  };
>>>
>>>  /* GPIO resources */
>>> @@ -113,6 +112,8 @@ static irqreturn_t vsc_tp_thread_isr(int irq, void
>>> *data)
>>>  {
>>>  	struct vsc_tp *tp = data;
>>>
>>
>> The mutex overhead looks out of place here in the interrupt handler.
>> Maybe it can be replaced with something lighter?
> 
> Using mutexes in *threaded* isr handlers is quite normal, e.g.
> both the SPI core (used as transport here) and the I2C cor will
> take + release a mutex for each data transfer over the bus and
> a threaded ISR handler may do more then 1 data transfer for a single
> interrupt.
> 
> As to using something lighter I could not come up with any lighter
> solution then this.

p.s.

I forgot to mention that this interrupt also does not trigger
that frequently that we really need to worry about overhead.

The VSC sits between the user-facing camera and the Intel
CPU/SoC's CSI2 receiver. So we only need to talk to it
(generating interrupts) on probe() and when starting/stopping
streaming video from the camera. Each start/stop we'll get
a bunch of interrupts but outside of that the interrupt never
triggers. So overhead is not really a big worry here.

Regards,

Hans





> Also note that this is moved to a workqueue later in the series,
> since the threaded ISR actually waits for the wake_up() call
> done by the hard part of the ISR and an ISR waiting for
> the interrupt to trigger a second/third/... time inside the ISR
> handler is just plain wrong.
> 
>> BTW is it possible to have interrupt before call to vsc_tp_register_event_c
> 
> The interrupt gets triggered by a GPIO connected to the VSC,
> so if the VSC is well behaved then the interrupt should not
> trigger. But we cannot really count on that.
> 
> Regards,
> 
> Hans
> 
> 
> 
>>> +	guard(mutex)(&tp->event_notify_mutex);
>>> +
>>>  	if (tp->event_notify)
>>>  		tp->event_notify(tp->event_notify_context);
>>>
>>> @@ -399,6 +400,8 @@ EXPORT_SYMBOL_NS_GPL(vsc_tp_need_read,
>>> "VSC_TP");
>>>  int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
>>>  			    void *context)
>>>  {
>>> +	guard(mutex)(&tp->event_notify_mutex);
>>> +
>>>  	tp->event_notify = event_cb;
>>>  	tp->event_notify_context = context;
>>>
>>> @@ -499,6 +502,7 @@ static int vsc_tp_probe(struct spi_device *spi)
>>>  		return ret;
>>>
>>>  	mutex_init(&tp->mutex);
>>> +	mutex_init(&tp->event_notify_mutex);
>>>
>>>  	/* only one child acpi device */
>>>  	ret = acpi_dev_for_each_child(ACPI_COMPANION(dev),
>>> @@ -523,6 +527,7 @@ static int vsc_tp_probe(struct spi_device *spi)
>>>  err_destroy_lock:
>>>  	free_irq(spi->irq, tp);
>>>
>>> +	mutex_destroy(&tp->event_notify_mutex);
>>>  	mutex_destroy(&tp->mutex);
>>>
>>>  	return ret;
>>> @@ -537,6 +542,7 @@ static void vsc_tp_remove(struct spi_device *spi)
>>>
>>>  	free_irq(spi->irq, tp);
>>>
>>> +	mutex_destroy(&tp->event_notify_mutex);
>>>  	mutex_destroy(&tp->mutex);
>>>  }
>>>
>>> --
>>> 2.49.0
>>
> 

