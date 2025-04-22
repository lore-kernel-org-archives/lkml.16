Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046B284B51
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 16:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337960; cv=none; b=iJgt42QvR5Mds10PzoLEExT/0A8vrqEecSXTtmLNc7huIxU7wQ0JQTw0ujyomysCm1Z/mvxTl5k6kGDLlGbeNC/3at0VMdKF2Ibx9XxHl6ReZI5NPcf+wyFylh/B9rszofTu+gkCwg8NLGKSK8AZaUZo3PLavNAYU1WgO5Xkn1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337960; c=relaxed/simple;
	bh=KDs//5oUpg0VSA3+2RTj00OPt5E7x7Y+uh8cwKS7qGg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PtnGmcAVy7jAZRKLTb1+xUwKk2V1tJ0mN4MrWvFGStLhr/T04xw5e8yLrJY4cu696zdQ/vKXEWdJn/sxxgPnFN2a4cu86nTXRxXXxpC3iQo/zpJPFZudlXfaI95xQ/sxmLhuji6fJdVi6Pi7Gt2bQimuownbEYTA8x+GJ66qHrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1u7G81-0003jx-Ha; Tue, 22 Apr 2025 18:05:45 +0200
Message-ID: <53024a1d-a9a9-448f-9ddb-45efe4bece21@pengutronix.de>
Date: Tue, 22 Apr 2025 18:05:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
To: Troy Mitchell <troymitchell988@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, linux-i2c@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
 <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
 <20250422161213.0000597d@huawei.com>
 <918e0177-8e26-405c-93ad-8b0d2dfd3b3d@gmail.com>
 <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <54d062af-40ff-47b7-baec-c7e883defea3@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-kernel@vger.kernel.org

On 4/22/25 17:53, Ahmad Fatoum wrote:
> Hello Troy,
> 
> On 4/22/25 17:26, Troy Mitchell wrote:
>> On 2025/4/22 23:12, Jonathan Cameron wrote:
>>> On Mon, 21 Apr 2025 13:36:38 +0800
> 
> [snip]
> 
>>> In this path the patch changes the lock release to occur after
>>> i2c_imx_master_isr(i2c_imx, status);
>>>
>>> That may well be safe; I have no idea!  You should talk about that
>>> in the patch description if it is.
>> You're correct that this change slightly alters the lock release timing.
>>
>> However, both i2c_imx_slave_handle() and i2c_imx_master_isr() can safely be
>> entered with the lock held — there's no requirement for the lock to be released
>> before calling them.
> 
> Why would we want to hold a spinlock out of all things longer than
> absolutely necessary?
> 
>> Using guard(spinlock_irqsave) simplifies the control flow by ensuring consistent
>> and automatic unlock, which improves readability without affecting correctness.
>>
>> I'll update the commit message to clarify this.
> 
> Sorry, I don't think that this simplification is worth potentially
> increasing the time we spend with preemption disabled,
> i2c_imx_master_isr() even has a loop inside.

Ah the loop is in lpi2c_imx_master_isr, sorry about the confusion.
I still think that the simplification isn't worth increasing critical
section size.

> Guards that don't increase critical section size however are fine by me.

Thanks,
Ahmad

> 
> Thanks,
> Ahmad
> 
>>
>>>
>>>> +
>>>>  		return i2c_imx_master_isr(i2c_imx, status);
>>>>  	}
>>>> -	spin_unlock_irqrestore(&i2c_imx->slave_lock, flags);
>>>>  
>>>>  	return IRQ_NONE;
>>>>  }
>>
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |

