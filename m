Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C7722FE17
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806099; cv=none; b=NvLS/7PGHIfSu3HfqgG6IsgKHfpswzNSGxc4i6BEioM78kV5bjCuqviE93iOW9mvTnwT2NFPGEg3BsW4Y+zmOBq2uOBCEwabj2NCT57V5g/rjH9yfk12TbLlUWcbMLsdoJZj4GVjouL7SaRvEjh+lrqXJQcwi28+fRIDz1fhejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806099; c=relaxed/simple;
	bh=gVMYi2KXFIxkgo1AzUtu6TFWb8Gd28Rl9AtJgWeGwxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aiAlbJ8w6tBtkJLdBn1gNgceFUt0pvkfPXgYYQMoPTww0GwGFdmNqGWkvn+WwoQpFWjoom9x+JAOs5C0Xxhy30nj4DvdLUvDQdegU/jMxJPUMbZ6zFlwSRmJkJFTMGCyY+LqKaxYKG4TnSuqXCxeRebGoMU1Vt1e1xKBXqMpOO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JKkEMKAh; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JKkEMKAh"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ad52d9be53cso762605866b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747806096; x=1748410896; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfw7r6IjPRXEXEyQv9Fnmp9CqnD74IPvRrDSDuZuNUA=;
        b=JKkEMKAh5qq6km3th1iaqQdRpQt04GB+8oDFKIvzCm543Ff/bizd63oLYAr4Qg2404
         bWHPzcqMgzUU9QNnfCvgg6avHuNZ1vMl+YOCHSxivCN700JW3XSGezAVKgd8OLzfD61H
         FgtHo0CC9C93j8KEC0eWCLcjEHVt0DMmzppCBPhjFTc2AMHK9ksozkPHEmGwLkV81Cy/
         xBqh/XUWZO2HUY9K2nSE/+OJP1agT0id6zhHVpBhr/eJmouEvqO5gEfpdz3tcWP4hoXW
         VMOsKa63zORjJzR8NDz696yFYuAYKb6DiGXhJsba7rBXjXsy6PXc4PJZkAotPSgZizFZ
         ve5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747806096; x=1748410896;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xfw7r6IjPRXEXEyQv9Fnmp9CqnD74IPvRrDSDuZuNUA=;
        b=lqjbyYFix1sxucqJ1h44WQWhdtC8+9bVjL/Qz5uid138On+3SJSSewj7+7F2WjZMx5
         lv4aQFk3RFSXt+589tVmh+DxYQM+UzlrNnFQGTrQI/ztXbzenRKKt0ILZDVlbZS+GDrp
         B5YtsB10Mm5YT8p+VvrINKoeczsFKkWAeoZzAMvF8q7i7NLPQuIwvoE3UkVKFsYPvXBL
         eVaIDRkhSM8HUd+WdhBWVy+7S2bvDLGgScEp5UmD11bB9rW4s1zRuP6btgTE8OHMfHs0
         fWwtGq4RL6/jNHdpphbwrbxYZkYrsp870n4NLvWs1I9H8hf3g2OojSG1bpaiHInyHy3a
         wCrg==
X-Forwarded-Encrypted: i=1; AJvYcCUoAgiacam1qJwxgflEjW5XzQLeCcI9MMd/1/8/Ilpz5YW+/jEHi9DTr6KwhmnCxe0NH8cWO9b+Krom7ZA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwahWYXnuXAMKPbfSOCFxDc6fUKr3EsbNNDC58wN6pVQfrp2cUx
	u4le4D5kM18qDKMOAqxvPRRbGZT0CSd0BwIlTK+nNxM/YNAhbmwzRPXBinWgD8f6aJg=
X-Gm-Gg: ASbGncu6ILH5WNmx43OBcHVrx7tzwElh7r/FBhPcKuMBPRVXBa/MrttZDSqkYu9UVQN
	0nrp2agH2BT7eMXznFap03qCCrNd8nbxFCc1KTUMPbSRlR22J8++r1V5jZoIsTZKN1coOjFWK03
	rans1+oF34xUzCGI/RjKjGZlFb+Z+pDaqHmZ9YyjTyTiwvGfUQbr98fegGfznMfl82gLaL5LC2A
	h7xxvM6DjJa1N37rHg51Qxm2F5oc+BaizwU1WYv44Bg0syIAsdt9Jv41B/Smd8G4TX/uO1n0EkK
	wk8CU30cLktu+CLgrshVC80LgUtGdvK1+Nivfpt3J2+kU+6nOgTvBeM6Clg=
X-Google-Smtp-Source: AGHT+IEHcpkHL7FVjfhOCs3RSSgST9xKyVYzTeL//ZqimrYsmpvzaIYc2ltC9ry3ZT20xorhYqoUSw==
X-Received: by 2002:a17:907:7d86:b0:ad5:61fb:265 with SMTP id a640c23a62f3a-ad561fb301dmr1098617466b.47.1747806095547;
        Tue, 20 May 2025 22:41:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06d299sm843248766b.48.2025.05.20.22.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:41:35 -0700 (PDT)
Message-ID: <a20fc6ee-c6c3-4013-b175-4918b9a44380@tuxon.dev>
Date: Wed, 21 May 2025 08:41:33 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] driver core: platform: Use devres group to free driver
 probe resources
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 dakr@kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 bhelgaas@google.com
References: <8d83ea72-bb81-4c63-bf69-28cf5848ae20@tuxon.dev>
 <20250305140309.744866b2@jic23-huawei> <Z8k8lDxA53gUJa0n@google.com>
 <f74085be-7b14-4551-a0a7-779318a5dc70@tuxon.dev>
 <20250330163129.02f24afb@jic23-huawei>
 <5bca6dfd-fe03-4c44-acf4-a51673124338@tuxon.dev>
 <95f5923f-7a8f-4947-b588-419525930bcb@tuxon.dev>
 <CAPDyKFoMqmCFBoO8FwQe2wHh2kqQi4jUZNFyiNckK7QhGVgmvg@mail.gmail.com>
 <c3a2950a-17ff-444a-bee7-af5e7e10e2bf@tuxon.dev>
 <CAPDyKFozR4qDq4mzcZBK-LcoPf=fGyuJTXwdt=Ey+_DcQOAp0g@mail.gmail.com>
 <4o3wo76st7w6qwyye3rrayuo2qx773i6jfzcnbkhdj76ouh7ds@3e2mblehkgwf>
 <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAPDyKFqMB7XutXba73YHx1X4rm6uc3Fz6yMZ8yM=wgduEmgUDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ulf,

On 20.05.2025 15:09, Ulf Hansson wrote:
> For example, even if the order is made correctly, suppose a driver's
> ->remove() callback completes by turning off the resources for its
> device and leaves runtime PM enabled, as it relies on devres to do it
> some point later. Beyond this point, nothing would prevent userspace
> for runtime resuming/suspending the device via sysfs. 

If I'm not wrong, that can't happen? The driver_sysfs_remove() is called
before device_remove() (which calls the driver remove) is called, this
being the call path:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      driver_sysfs_remove()
      // ...
      device_remove()

And the driver_sysfs_remove() calls in the end __kernfs_remove() which
looks to me like the place that actually drops the entries from sysfs, this
being a call path for it:

driver_sysfs_remove() ->
  sysfs_remove_link() ->
    kernfs_remove_by_name() ->
      kernfs_remove_by_name_ns() ->
        __kernfs_remove() ->

activating the following line in __kernfs_remove():

pr_debug("kernfs %s: removing\n", kernfs_rcu_name(kn));

leads to the following prints when unbinding the watchdog device from its
watchdog driver (attached to platform bus) on my board:
https://p.fr33tux.org/935252

Thank you,
Claudiu
