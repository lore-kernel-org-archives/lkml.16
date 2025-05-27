Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BECA253B73
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748341353; cv=none; b=eahQi5y6ac1meh1j6ASRCbi3cqFGLf1kKUfE1CaGVgWszYB1cqU3U/v4LOQEmb859xfjVSvaMy3hYBgzN/xNkqf//DuUnKNut9W76UJ1MxhrG6VW3YtWC9L86SPv0TNs1hlQYw8t2zBLOBv9zlYFKJK1dPtZ9xkCp8vOojNk6Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748341353; c=relaxed/simple;
	bh=CCmDBe2cHO/aj6GjU1F7qAtsjhmTjEzQv7ntUYfF+dA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tk9SnealqhgDc5teBnHUijsRvSSDulJp3inX42h6f79nRPTWd1Yz5M6LZ4PSjsLHOK1NBFhnO5bS64gpmYKLgcL1piK8olYCUH3M7SlG8VCEg0b8GtDvxOmBfnTAM8GH5yHK9X2RuCkkhCf7xo1hgb6UEpa2r2D7Tp6Q98RrY5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b=S0m9jXq5; arc=none smtp.client-ip=62.149.156.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=aruba.it header.i=@aruba.it header.b="S0m9jXq5"
Received: from [192.168.1.58] ([79.0.204.227])
	by Aruba SMTP with ESMTPSA
	id JrOuu1Mg9t6p9JrOvuf7yy; Tue, 27 May 2025 12:19:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1748341157; bh=CCmDBe2cHO/aj6GjU1F7qAtsjhmTjEzQv7ntUYfF+dA=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=S0m9jXq5TWiK7ybu9uri0Zz1LwNmk4wuJ68g6WXZtGP4sXVj8sNx8IFzxRd15oK9D
	 5IMXpPJ2rWJlepW+Bw2usSKQB0BXQuVxytSd5A2mWY3DF9wyU5sMDSgqv8YKMj87IY
	 E6mOx+TfolgLZF98oIh4YL7xVWEjpmFxeJnzE+U+y5Lx/Zi1p829jWaFbttm3XE8oY
	 /pxzAYlkVTdZ25VRZv2m+vsNdRBsSdn7n9wzxnOWxJTUaYVYpF06nysl6aucmlwHgY
	 JkPpHw+ddPj1YrJylDlQvMxoa9X2Ly+cTnOqUEYnGNSXNFokp8D8raiTKlcGC5uMk6
	 3kJG24aZ+VUhA==
Message-ID: <20ba69f0-7ed9-48e7-8239-74a55c993c0b@enneenne.com>
Date: Tue, 27 May 2025 12:19:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pps: clients: gpio: fix interrupt handling order in
 remove path
Content-Language: en-US
To: "Farber, Eliav" <farbere@amazon.com>
Cc: "Chocron, Jonathan" <jonnyc@amazon.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mschmidt@redhat.com" <mschmidt@redhat.com>,
 "calvin@wbinvd.org" <calvin@wbinvd.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d6358648c5b9420d8202bb9c23ac1824@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <d6358648c5b9420d8202bb9c23ac1824@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFzSurw6zXn+B64069VKGDJ13c6fpEMW36yi1QY0PdUgpc0HVLtIEny5UwT1FlTkXm521Tb5gQFMAtFPZUXQ7w5BWyVp/TN8bAbP5sylm0Rxy3l8Fmxw
 jAH1z4oZ5WLi+i4IoHADljsWvTTYACYMk3Oy8vVALnpN//4d3GHiIS/xtnS492WRXSmGQlTqNgPnr3GapIweex+KY2WgTWnMVJtySp/UM9OQFE0LDlJm/5Wy
 marv0ds7ryQjL2VXkkzdPvuhghz1ol4t6o3TY0CJRSyHaskxY5L4HSmiul10AYhCys60TkaICGD3Z9//pmQIvG5Rlaiekdk2il3AuqCOPLPM/fOs+By9/5rS
 ylSEljaKsE9R1AweZYgOLAq5XQHcyg==

On 27/05/25 11:11, Farber, Eliav wrote:
>>> @@ -228,6 +228,7 @@ static void pps_gpio_remove(struct platform_device *pdev)
>>>    {
>>>        struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
>>>
>>> +     free_irq(data->irq, data);
>>
>> Why not just use devm_free_irq()?
> 
> As far as I understand, the main purpose of devm_*() is to provide
> hands-off resource management. devm_request_irq() is intended to
> eliminate the need for explicit cleanup in the remove() function by
> automatically freeing the IRQ after remove() returns.

In linux/kernel/irq/devres.c we can read:

/**
  *      devm_free_irq - free an interrupt
  *      @dev: device to free interrupt for
  *      @irq: Interrupt line to free
  *      @dev_id: Device identity to free
  *
  *      Except for the extra @dev argument, this function takes the
  *      same arguments and performs the same function as free_irq().
  *      This function instead of free_irq() should be used to manually
  *      free IRQs allocated with devm_request_irq().
  */

> In my opinion, calling devm_free_irq() undermines the benefit of using
> devm_request_irq() in the first place. If I need to explicitly free the
> IRQ during remove(), then I’m no longer relying on devm’s automatic
> cleanup - I’m effectively reverting to manual resource management while
> still using devm-style registration, which I find unnecessary.
> 
> That said, if you still favor devm_free_irq(), I’ll revise the patch
> accordingly.

Since devm_free_irq() works exactly as free_irq() and can be used to manually 
free IRQs allocated with devm_request_irq(), I think it is less invasive. Isn't 
it? :-)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming

