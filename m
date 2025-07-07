Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6427702E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751877131; cv=none; b=FUSiFs5CdjLX7Qkqzh0MuKZRx9Do1YUgsMfpBvwiGLA4EEh8TDJW90g+0RkuQNQ3RdFx2CcJRKVYTfRw85C4Y5XNhr3xJnvavLct2yazA/POH6w63vTiNzD/s6JarlyVWcD8NK1qWeiVUy9yZBifFy9yYiJWgf6CaFX+1Ky7PAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751877131; c=relaxed/simple;
	bh=EokrUka+8q9BFBcMOPMx0zXPzrf3e9HtqUOEMOxQYtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBlhOveFnOAEoXJsRca/q+ZETsfKpaTAz4E9ks59AiEPocsYZjqjfHH8Y1cJXeTKNKpvu7CS3lyMyt7B2KnZpikAuw8B+yKB2Zq4ntWj2FTZ0qxbRFtF7rPaUxIewIrXqZ2IM6K7vJf8E4zMO/wbl1CZb1arXLWSeVHTT9eG+7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=i9FgiCRt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="i9FgiCRt"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso21344875e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751877128; x=1752481928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jk0DSP+snP0yxTTILdaG1XmNWZzWY5PtYg8JXeBa+lA=;
        b=i9FgiCRtgGBuQvQOEKORkT3H0sX2nO/em8+ZrCYIaUIlgt+jU5ak5liBvkDdwPE4cn
         HmvOFeKwbokzfBdnw1jVAWGGHWGH+8aL2q8ruNVM3EepuI25vMPk7YMYdio45hMb4yK5
         ef9lBfUIQEwVgGvYx1VU41wxXL8b1FZ/fKPRIso0G60Gjm5zCMFzy0RvBMbOSxg3wxEi
         qIsTm7h7+Z0DfG1BEGJ3NvmFAvM5glsKe9hf12aiB5xDKyF395OCTTzju2tI3mpsobx+
         HgPq0C+r3g/lUcrFzBoJI4Vr9a+F1nW9HlfnWZCnUwAVT6JKc3XdYNwzo7BPfOrlg+N7
         bpdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751877128; x=1752481928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk0DSP+snP0yxTTILdaG1XmNWZzWY5PtYg8JXeBa+lA=;
        b=GcWTwKBs0cCBFNGKMe8K0efZ/MvRodCAbWgCg5apGa3/THV7ZsHQhGC6In7ikjgcHT
         XvEvl5oYNMjMC6Nnz+5BVgvwMUu2ntoOztyMeLkWzBkoD0Nq/LaO8mKKVqeLBnV6F8HF
         aw1SULeYg50WgMirwybXCQAVEeIhNjFvhg68qrGcDjypZIXSrXWbG/IzFiHBUfq/TfBh
         LYewVaSifKgNpHbbSj+sod2PQtUZJqVb26B4b7GtJILnFn+tN0zE3UAdMvUwrLCiuOhp
         MCgy1GCHFdTQgtCgi0jxX8TvZ00TNaeZsUL4y8IAXnRjzZSQeG+tca1EwD8q4WPyTjfd
         PtDA==
X-Forwarded-Encrypted: i=1; AJvYcCW3/EnVNQ7JEx/RM0BK6e+23Pa/PkeNgGPgOk33CDL7lXAfkzAYmReJ8vfpqomIen9E8l7X+NnnQlBtfn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRxTJEXk5xfHYaedyIzCnv4Z08WgWJorel8XzrkU5pggnpR4eg
	6DGu0uClVlIFpTyqNOS7yo1NO+r809hxqdu4RafsH98YKb9anuTpk5xSyn6q/i3MVkY=
X-Gm-Gg: ASbGncvK+7DoEvwHKZuVY9gYp9kDX8fFO1FW2OPM3zakXLflFLDxNuZ1lUNM6jJ0qh2
	+l7PaLwKGSsGPzI4/A40SQ5gGZKPUuejPRaxwK2PCjXGrKqg+ws5l18DpyTLzm9q9hOSR5vsjn2
	Lp0RtXOIeC4OHZfPOV8RjPFKm72szFbsir4oUZJxKCDPSbm8D3bESeHE5R9uzn2VqxEIEKyDq/S
	J4K9q7K08+Nf09zqGiVQMQ4cGMUQu95EP/8Pc5ESL+2IQrq+mhQ6T2PKiU8ttm8tO7apLkagNcj
	6tWW9UVG7kOYXU/LGG7vJHFJrYWW14dKZ/2ruq32xWYPGc88hKvXnZYa9PA+PqY=
X-Google-Smtp-Source: AGHT+IHColHEC/SleUA2FaGBvscXm99Qomr8ucT1fEnsASZPSUvkTO+j3OPSIwgqWNk5VgdiiF29Ag==
X-Received: by 2002:a05:600c:3b1a:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-454bf4092c3mr47838765e9.8.1751877123334;
        Mon, 07 Jul 2025 01:32:03 -0700 (PDT)
Received: from jiri-mlt ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454abea60d5sm94590505e9.1.2025.07.07.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:32:02 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:32:00 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v13 12/12] dpll: zl3073x: Add support to get/set
 frequency on pins
Message-ID: <idzmiaubwlnkzds2jbminyr46vuqo37nz5twj7f2yytn4aqoff@r34cm3qpd5mj>
References: <20250704182202.1641943-1-ivecera@redhat.com>
 <20250704182202.1641943-13-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704182202.1641943-13-ivecera@redhat.com>

Fri, Jul 04, 2025 at 08:22:02PM +0200, ivecera@redhat.com wrote:

[...]

>+static int
>+zl3073x_dpll_input_pin_frequency_set(const struct dpll_pin *dpll_pin,
>+				     void *pin_priv,
>+				     const struct dpll_device *dpll,
>+				     void *dpll_priv, u64 frequency,
>+				     struct netlink_ext_ack *extack)

Unrelated to this patch, but ny idea why we don't implement
"FREQUENCY_CAN_CHANGE" capability. I think we are missing it.

