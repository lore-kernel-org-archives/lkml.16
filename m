Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9042065
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702522; cv=none; b=YYxxyMperNpfcxYEsSSxH48Z4eVLnCrdm8vwRz/3j7Lu+m3JZv2VSoMLGjR0Ed2qLlEG4LwztFlcDqL/1pARZ3zvQQVD83HQIG+puF0gDP7DI9n3g/Ewc9kPMKJc5u9rs7JvHgMkPR5Eie6H3ZVnndrwA1qeqwZS8IhdvASmPw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702522; c=relaxed/simple;
	bh=qHBMAsaApPmhKsTCmZJq70aN2rwdUBw17hmPBgj67oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+EBaheytenHhz6AlCx+LOvcV03flprxyGj7g9rsYBRq6EPWKMpSAITxLavCI2TNMuCnN7iZy5jT0IQ5jeAcHezeiLTXuUjTRDR9rwVdgk6hxZ3QH5fQZLanz8pvFaU/MhycjP3WCj6uujemJyaOE8xQolCu0ia0UkP2CJaxgH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dhJzCHB5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dhJzCHB5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606fdbd20afso8628351a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750702518; x=1751307318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=msCODePLaL9Ns7dKXDzKfUzUu2zUpB9LEBKE4TL1kJ0=;
        b=dhJzCHB5/qXYHpqjp0sd4VWgwbbeKLO72VrPP9U1LIv3OpNyVDJgLyUMzbDfpEsYzp
         KJ5LsN1Vldl8fIDM+m0UkMXu39+71uUqOBt3x5qkBEM5qmSVBLi9mjmDMHgvGmZlRKIp
         EPNIae0bMxifP6P4bs0uu0uZEw2qYIGKbcaxfVQUOu6YozAcSA1htVWEBbpdS16YALpM
         tvv3Pu9AXjezS/hDgCVXYeOAknpoF1bVS8Wiz8Lvc6xpNy2zUyMzKNjNwe4cwIf50fa4
         HMGdl2mRHwl0fD6hQ7+yR55i61krV5+iCGtEeK1S1BjDJvNh3IbYUviEaWnIjWVWyWpH
         S6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750702518; x=1751307318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=msCODePLaL9Ns7dKXDzKfUzUu2zUpB9LEBKE4TL1kJ0=;
        b=l5uX+5OmQ6WpUq2SHhDQodsaLswEd/wVPrqTHsuJBrWlqguG5CmVyJwTuBbAWsHTzI
         MjTL/x+1Rd74l20OyjNG1LB1GAXn02A0z9VSbEew3UJwKEAIOdRLixuJ4dW1l6uq647E
         vbXjK7cjhgWnvrx8DGl2zwIz4zUmAoY9jNHwXsul+aZ1QvHDV+NwrDVLgVdp4eNuoS9T
         +sGGtKbX681vgLR+fXovNE1Y/ieor+Yc+XdDuAaLaGWMTzBEGTwNwRKvaHK5u9b1d6ve
         QFbYmD+qojWuC6zLeNJSyG1EPWRrt2ypPnLWnLCAXPI368SCGL9qn+nEDE5eknUFEeUz
         VUnA==
X-Forwarded-Encrypted: i=1; AJvYcCXllEiHKkR8NmDtWjdolV14mIyxoa1EEvyy/M9s7/tfEbMsDYOLfMmM45xD47abbxcNpUH0NXf6xTVbLS4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpRKy+rDjnsqY79BYvIVZV/ImUYQfNQjzJNEbAhqpySM+OEBU
	9o6IY3e3FFEdsLnYgbwb+uE9QIh43QYxrSs7FzJOliLBp47L53WOhS4Lz8VX20yO3YQ=
X-Gm-Gg: ASbGncvKBoPZZtOyj9qWfyg5BIv/reyAWWuDraem5YfnMU3qix51oPNinEAhuxce7oq
	RLRNgJzR3KnUby8rOjbxdz6OUTaZ+WSVzm/oqCupPHoSgNlbPxvNdD1OtkTNuG2aQyXWB6uSpiJ
	BZ1Pm3CWBLqXfLyzIAUFdvUyf+aAfFbGloELq+/z04mEMPlQIto+lWBpKVPEXwxNO4FOnHHBjFZ
	4T10nFdN6H91D+PQlJBgOOFwJbkoPacT4tUNbVAdpCSPyKIaNU4ucwcJa+OYcyQ8DHGPWQAsdqU
	bsFIL7qr288mqnOVH6eQswQmPQryg4kBwIWauxaGL1B237PEjFvu6vzcwCla4vasDYz6Dv8FnFu
	IMttjDwfJF/YszfAN+iF1mE3WpxF0
X-Google-Smtp-Source: AGHT+IH1tEALmUTcVQpI9ENMqVe72xFXEMTIZ+9bnTMjGihOc4F50NxUKXfA68F+eXlbbK943xUU/w==
X-Received: by 2002:a17:907:72d0:b0:ae0:1b44:43c9 with SMTP id a640c23a62f3a-ae057c7e07dmr1178168366b.60.1750702517709;
        Mon, 23 Jun 2025 11:15:17 -0700 (PDT)
Received: from ?IPV6:2001:a61:1376:6301:325d:baa9:c6c2:4aae? ([2001:a61:1376:6301:325d:baa9:c6c2:4aae])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b6e04sm740918766b.115.2025.06.23.11.15.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:15:17 -0700 (PDT)
Message-ID: <94cd36e2-db7c-4693-9f43-01c855dc6891@suse.com>
Date: Mon, 23 Jun 2025 20:15:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] usb: core: Plug the usb authentication capability
To: nicolas.bouchinet@oss.cyber.gouv.fr,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250620-usb_authentication-v1-3-0d92261a5779@ssi.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I am afraid someone has to address this.

On 20.06.25 16:27, nicolas.bouchinet@oss.cyber.gouv.fr wrote:

> +	// Set a default value for authenticated at true in order not to block devices
> +	// that do not support the authentication
> +	dev->authenticated = 1;

So the default is authenticated. OK.

> +	if (le16_to_cpu(dev->descriptor.bcdUSB) >= 0x0201) {
> +		pr_notice("bcdUSB >= 0x0201\n");
> +		retval = usb_get_bos_descriptor(dev);
> +		if (!retval) {
> +			pr_notice("found BOS\n");
> +#ifdef CONFIG_USB_AUTHENTICATION
> +			if (dev->bos->authent_cap) {

If the device claims not to support authentication ...

> +				/* If authentication cap is present, start device authent */
> +				pr_notice("found Authent BOS\n");
> +				retval = usb_authenticate_device(dev);
> +				if (retval != 0) {
> +					pr_err("failed to authenticate the device: %d\n",
> +					       retval);
> +				} else if (!dev->authenticated) {
> +					pr_notice("device has been rejected\n");
> +					// return early from the configuration process
> +					return 0;
> +				} else {
> +					pr_notice("device has been authorized\n");
> +				}
> +			} else {
> +				// USB authentication unsupported
> +				// Apply security policy on failed devices
> +				pr_notice("no authentication capability\n");

... we do nothing about it. We enumerate.

The purpose of authentication is guarding against unknown or malicious devices,
isn't it? This behavior seems to be kind of incompatible with the goal.

	Regards
		Oliver


