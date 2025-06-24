Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBF826B09D
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754617; cv=none; b=iSdgtt6otoLM98AYRL9hVuMEh4sDxoaugDskf3FVojCHGMRE0/N+tTRvDH1NhUYowOdjhxhKqs/peetAuKQ8fzaUvyeit5ARMvsPyG9x/OFx4aymqiMjOwvGMTrBq+833Y82e3rWO13xe5zRbrhP4ZxLEj2zT06lRmgUknOtLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754617; c=relaxed/simple;
	bh=MDLkdbQKpX6L1kVDTvL1ELhCaxQXJ4VI/AhlIZSDld8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0OrBWzIyt25RJuawyvbJxFdl80L1/kO0ZEPNeeHgp/EbkSVdjcNLqyXrArsxrvzErjUwdXgwyPInhIh6jMTNyHRL9/t0RURZSH+CUeC+u7oTAnyw1MpVByRJnqZICBfA01pzip0pABOvIGy936WEgK7ysM36g3SUPZ+gyTemXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UAMKcIev; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UAMKcIev"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0753C4CEEF;
	Tue, 24 Jun 2025 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750754616;
	bh=MDLkdbQKpX6L1kVDTvL1ELhCaxQXJ4VI/AhlIZSDld8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UAMKcIevmrWAGtmgySWtqsppLVpApHHKFABFnKmU+gUAJMkxqtAt/xdaKdqIDF5Xp
	 AEs+qandZ4xy+2todezqmOV48yLpGUbJG6H2F4EGWq1iqN8/P1A4PkIAdjuAMQid9S
	 6FZsOmYB0ru/vrmp+e+VcqnZrn5B0xO9iyw4+tAIbfPe6MBvIT1iI49qV6Pz/7N/wH
	 a7D3eMUpJlAXXZw8ManRYYYG8eUyazpp4nHCfRFhY1jNvh6xuAbZOgahNtbqKHG8fB
	 yWGXz3z1irbQYbBHq0LnsTBxNHAxWi3GUrGaFGJvLvMYpOgb0Se1bMkMOqEfufoh2r
	 +tukE/FJOyMLA==
Message-ID: <2ee3d376-bb2d-4f93-93d9-6e017636996b@kernel.org>
Date: Tue, 24 Jun 2025 10:43:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mei: vsc: Drop unused vsc_tp_request_irq() and
 vsc_tp_free_irq()
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-2-hansg@kernel.org>
 <IA1PR11MB6370FA5EEB2D062349C9BC9AED78A@IA1PR11MB6370.namprd11.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <IA1PR11MB6370FA5EEB2D062349C9BC9AED78A@IA1PR11MB6370.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Jun-25 8:06 AM, Usyskin, Alexander wrote:
>> Subject: [PATCH 01/10] mei: vsc: Drop unused vsc_tp_request_irq() and
>> vsc_tp_free_irq()
>>
>> Drop the unused vsc_tp_request_irq() and vsc_tp_free_irq() functions.
>>
> 
> This is proposed in
> https://lkml.org/lkml/2025/6/17/25 "[PATCH] mei: vsc: Remove unused irq functions"

Thank you for pointing that out.

Normally I would say lets go with David's version since that was
posted first.

But David's patch is missing the removal of the function prototypes
from vsc-tp.h, so in this case I think we should go with my version.

Regards,

Hans




>> Signed-off-by: Hans de Goede <hansg@kernel.org>
>> ---
>>  drivers/misc/mei/vsc-tp.c | 31 -------------------------------
>>  drivers/misc/mei/vsc-tp.h |  3 ---
>>  2 files changed, 34 deletions(-)
>>
>> diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
>> index 267d0de5fade..99a55451e1fc 100644
>> --- a/drivers/misc/mei/vsc-tp.c
>> +++ b/drivers/misc/mei/vsc-tp.c
>> @@ -406,37 +406,6 @@ int vsc_tp_register_event_cb(struct vsc_tp *tp,
>> vsc_tp_event_cb_t event_cb,
>>  }
>>  EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, "VSC_TP");
>>
>> -/**
>> - * vsc_tp_request_irq - request irq for vsc_tp device
>> - * @tp: vsc_tp device handle
>> - */
>> -int vsc_tp_request_irq(struct vsc_tp *tp)
>> -{
>> -	struct spi_device *spi = tp->spi;
>> -	struct device *dev = &spi->dev;
>> -	int ret;
>> -
>> -	irq_set_status_flags(spi->irq, IRQ_DISABLE_UNLAZY);
>> -	ret = request_threaded_irq(spi->irq, vsc_tp_isr, vsc_tp_thread_isr,
>> -				   IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>> -				   dev_name(dev), tp);
>> -	if (ret)
>> -		return ret;
>> -
>> -	return 0;
>> -}
>> -EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, "VSC_TP");
>> -
>> -/**
>> - * vsc_tp_free_irq - free irq for vsc_tp device
>> - * @tp: vsc_tp device handle
>> - */
>> -void vsc_tp_free_irq(struct vsc_tp *tp)
>> -{
>> -	free_irq(tp->spi->irq, tp);
>> -}
>> -EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, "VSC_TP");
>> -
>>  /**
>>   * vsc_tp_intr_synchronize - synchronize vsc_tp interrupt
>>   * @tp: vsc_tp device handle
>> diff --git a/drivers/misc/mei/vsc-tp.h b/drivers/misc/mei/vsc-tp.h
>> index 14ca195cbddc..f9513ddc3e40 100644
>> --- a/drivers/misc/mei/vsc-tp.h
>> +++ b/drivers/misc/mei/vsc-tp.h
>> @@ -37,9 +37,6 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void
>> *obuf, size_t olen,
>>  int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
>>  			     void *context);
>>
>> -int vsc_tp_request_irq(struct vsc_tp *tp);
>> -void vsc_tp_free_irq(struct vsc_tp *tp);
>> -
>>  void vsc_tp_intr_enable(struct vsc_tp *tp);
>>  void vsc_tp_intr_disable(struct vsc_tp *tp);
>>  void vsc_tp_intr_synchronize(struct vsc_tp *tp);
>> --
>> 2.49.0
> 

