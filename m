Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3005B189B9D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 07:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789694; cv=none; b=YKb8QxY3Trh2dhWDdYSIx6vkVgO1OULjCUguBp1gRPO0UEmLd0pwH3j3JBEOihaCz3utOzOhhVHaTDRcdVSDZF471vMOb6riJFDaW0+w80jbFq9AfXC1sJBl5Mkcr1fcJC2JiCtO8gUsPPGp7w0WbirraCFQyNgU+8mytyDfsLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789694; c=relaxed/simple;
	bh=mlLugVIgUXMn68LUKrSnqKZfI+aiuTTmcGRKFxZQE4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjdub2KF6hy+6xe07KpSj8Vmwq7oCSkwUYIckj6a5RMYigy/uBgAa8PLWuPP66VB/+86lTfNQRsNjD3ll4Wq0Das3MoGt2jp/Ig+dBJoaB2d0urprGKWe19u2BAaUd37l6NKs0wBzu9ScU6lIqzmVAUYsur8yjc3f7p2Glo3eYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jt5UjPgz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jt5UjPgz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso8122075e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744789690; x=1745394490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTvOaDEQG30yWMqYolrBjhpkdSkM8de0KjZNMFJpHHE=;
        b=Jt5UjPgzrvOaax5/Qeg5J5Xy16YvkCOVc4HtM2AuF51gyQHKFZggelDMuKijMuNg0g
         RPvDbT0ZhKZL5PxUaTquwS23aOgWNVsD/AHXFMVQ9vnzXchG8EjEXx2nXnafAGBFS8zZ
         95C5/w1YIiWs/w3/pJXy99B7GKf4YI+cWVoHn3tzoVlFg8T/0zL3i9gzBcWgRJh8lOMh
         aH8X5PHWN5MnOmT6vB+b8QWSDCt6rgkSMaB4wmvSCxUmGjT41Qi5E6yJaQ+VsKxBuLfr
         EbCWNEsHI/PjhzlJtPYvp2Z14fyU5uad39e2bo0bH5e4hx/nyPm2OJA2UPinLnaGusR+
         R0lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789690; x=1745394490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTvOaDEQG30yWMqYolrBjhpkdSkM8de0KjZNMFJpHHE=;
        b=fB7p8HBwQ30NL6dNwVQVpyq3WYSkNlfbkxHOQ9emylZdLjFAxeM1s+KoBz42IEIc+v
         GIr3XqwRCLX1t6OiMoSVXGliCIFky/QRnLuSe89lckDrjGN+zV3nTcJM5sV6smvX1YIx
         ifGSaOcwSur0xYzHUfyNbTgv7/AaZssa3eSGkKN1OJ1uqieHU0YcEWRx7LDxfUPJopau
         YTfoROK6KnsFC3P7Bzj9b4EE7oS6Wryo8JkOpd/PskHbEPv5RRGXPwfu3EbPHKrRFO/T
         Fp8LkzfenhA1Ps2eILZGrEn7FpJblrmcSMzif8RQ87lyA+LClsbpKkWwnp/kV+Wfuw9Z
         769Q==
X-Forwarded-Encrypted: i=1; AJvYcCUyo8eY0dVqyaDNJwKnUV4338gchxNTxvXqeP+klvFzXxhTt1IBGuMSZ1V5EWm/IXk8nZM8Zzq0r6ewdMU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlY4AEj8PCIpJzLwDqeyP8S3ibjFa7FFVp9kAbBbYN8FZGgPk
	bRExS25egkzA9Koci1OCR6dzz4bw1Am8/Y79sAoQfwSk9yBmNsTbw0AzvUU4KRc=
X-Gm-Gg: ASbGnctmvrJ2IJLAcm9u95zxejw7MlhvG9bedW6MVmJQMjq6PR0T2sJ+C/gvYLHLpEz
	ObBSnSR/fMUaeIDnFgffQWEKzp1dogQYvw8hltP1I8OzTkb80ahpKA5gwIYpXBa7c8fFEuG7hpc
	lkBmRPZn/16PmUg84qIPUaACx8bqeEKpvZB1QBZyUt7QB0GEehDDuDCCOzlJwiFHoK/5nEePP+0
	veqE4iai7lJzY4PBubYxqO/TC+ipT4l+9I0FlXzNBOYfGOywCi01PDIcfPAeLCouSMBKLeQ4zCA
	s1Gh7qFejsIJkiFHX9rbfV7dxtzwPvpxJtFgMygW6tBZivlOoiUxqaU//8qygL6678MsCZ96EAe
	D6uhisLxBtF/6ibDgf0DhK/voyC5Q6w==
X-Google-Smtp-Source: AGHT+IFOauWmzV5VTo8P00eam5tza1oS3n8d1LwySwXAoWJeZ+FWxgBAT6OBdbDfI53apvgsnPAh3w==
X-Received: by 2002:a05:6000:4205:b0:39e:dce8:1c01 with SMTP id ffacd0b85a97d-39ee5b99f7emr245421f8f.12.1744789690290;
        Wed, 16 Apr 2025 00:48:10 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3ed7sm12862225e9.24.2025.04.16.00.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:48:09 -0700 (PDT)
Date: Wed, 16 Apr 2025 09:48:07 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: core: warn if a GFP zone flag is passed to
 hcd_buffer_alloc()
Message-ID: <20250416094807.2545efd8@mordecai>
In-Reply-To: <522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
References: <20250320154733.392410-1-ptesarik@suse.com>
	<20250325134000.575794-1-ptesarik@suse.com>
	<2025041110-starch-abroad-5311@gregkh>
	<20250414090216.596ebd11@mordecai>
	<522b3049-8e7f-41d4-a811-3385992a4d46@suse.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 09:53:24 +0200
Oliver Neukum <oneukum@suse.com> wrote:

> On 14.04.25 09:02, Petr Tesarik wrote:
> 
> Hi,
>   
> > That's the point. AFAICS there are _no_ in-tree callers that would pass
> > GFP_DMA or GFP_DMA32 to hcd_buffer_alloc(), directly or indirectly. But
> > nobody should be tempted to add the flag, because I cannot imagine how
> > that would ever be the right thing to do.  
> 
> You do not dream about putting USB onto PCMCIA over Thunderbolt?

Oh, I do, and that's precisely why these GFP flags are no good. The
address (and other) constraints imposed by different buses may not
(and often do not) match any existing memory zone.

However, zone address ranges are determined statically at compile time,
or latest at boot time (e.g. arm64). It's too late to adjust the limits
when you hotplug a more constrained bus at run-time. And I haven't even
mentioned bus bridges which add a non-zero offset to the address...

> > I can change it back to mem_flags &= ~GFP_ZONEMASK to fix it silently;
> > I simply thought that driver authors may appreciate a warning that
> > they're trying to do something silly.  
> 
> People rarely appreciate warnings. I think we should limit them
> to cases where something goes wrong or something unexpected happens.

I'm certainly no expert on what is expected to happen if you include
GFP_DMA in your HCD buffer allocation flags, but the current code will
*ignore* it, unless the HCD uses PIO.

I thought this was rather unexpected.

> > Whatever works for you, but please keep in mind that there seems to be
> > agreement among mm people that DMA and DMA32 zones should be removed
> > from the kernel eventually.  
> 
> Well, if somebody finds a legitimate use case for these flags, the mm
> people should deal with it. They are likelier to find a good solution than
> all driver writers being forced into finding individual solutions.

My goal is to provide an allocator that is a better match for the
constraints defined by dma_mask, coherent_dma_mask and bus_dma_limit.
For now, I'm trying to clean up some users of GFP_DMA and GFP_DMA32
flags which look obviously incorrect.

Petr T
