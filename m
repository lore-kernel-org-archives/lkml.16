Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129E14830A;
	Sat,  5 Apr 2025 22:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743891801; cv=none; b=uVeKFazsdQrVPPY0jvRgiJT1QhrkC/TJZk950UFBsTxBTIHF16VjGBQcd+65kUPq2Nf8bcGcUcADfEHl2OOXaWgAvUSWITUp2A/Ne2eT7J8ScgLk+tKsPXumhP6b18jo6foaYQMgdiiMEg5OnDQbOEImicx3NeaIpK1s3pzPiOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743891801; c=relaxed/simple;
	bh=oSOxn6FhZZvHYraduFxsagghJPONh/WWivVo7aF/Izk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gP6e9NJAQY/SNFdXzXwoHy4SOG48oeMT9603KRox72qZzVMXE3R2MX9G0XRihEGHue/FEU4p4pFnJd76fHHsQF4JKswyW+MpeFkWsH1lnoXP2AXKXXQ5K67sxS3XNxAkTJ5EhlinZ6J9jqjmsoovB4BH1ThkwRpvCN79i1cs5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUgbedQS; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUgbedQS"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30beedb99c9so29636181fa.3;
        Sat, 05 Apr 2025 15:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743891798; x=1744496598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipwWy+VwOq5W2zp861WDwncOrbNpmHHEfeOWsU6uii8=;
        b=KUgbedQSFaqhA9PEdNe78Q2lYvZ+9rdfUnmOTwEnyWAhA50RWkUTgwWi4coLNqpBti
         AyOi21YMpCsQTcff6k6Q910iAOpNM8f7pkIDR4EO3qNjC5G4ztaqq3PBEgOnSQtiizDs
         36iz09VrWdTbzcIe80ZpnOJiMWx5H9s7y67GbM8OyW8nyIEl7x2oD5V+VZxEGz57w39V
         xsfk+W3ksBtYqPRNd74bKQV8g87gGvFDkSWievpAyRkWcDOmoSqbxDmkkcjTgw4i+kth
         +wYpCy34QO3RGgM+cNVk+fAZ/ts5Edn89KHxOGb82SESD3KqJjwtFzyecCWbFXolL6dt
         mmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743891798; x=1744496598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipwWy+VwOq5W2zp861WDwncOrbNpmHHEfeOWsU6uii8=;
        b=fKBmTtLjEmjy37QEXBw+Ta8N3YRrVHgkGbacWQXRs9+O5Nt3Cneb5+srpj6kZryO4P
         OfMSVdLbBLDf0YHonR8xKH1M4QG9D4a79EQh63h9EIfwZwbYihIVVOeIdzUI1XOGD82S
         RMW0fDpD3xItnWvH5eh4EqA+7J/Hwu9VCEVFCmJgj+/0ytIgdnOLAeoecZfzMml/52LX
         eK8AYoDibPGXY39IXRX33XNy1GmV6Hp7eDoQcJWc8Imt2x0L5MRF3xrenjZoAH/IlNIM
         pglVROBR2MOrS5B6P0dgI+d9ZRsE63UQrsq+nuGbPVdERFpTU9djIPnUGsz6rmqnqEmz
         mzWA==
X-Forwarded-Encrypted: i=1; AJvYcCUJeRDGC5RFzHpD6g4QSKrLoWFz96FRRU6ryachHYuIhAgiRGXgElzxatR6WoPyU95/MR9+jNZ2PjRcgcw=@vger.kernel.org, AJvYcCVRptOi/QrLFYFcIIouK7jFWDjmF7ZAeoZVcmju8k/6+r7UuuhuNia5cYFu6UVWDs04bmiOhMCOaABV@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRcACwyfNjigOGQAkJo6IfiWFA8XeJASI8x2bnCU8dEDd+C8e
	Rx2R4khTf7NSHGr0mQQUjJ0feSLTM0GXKDk4hXMVZMeibdo9PYPH
X-Gm-Gg: ASbGncuFL3Jt3Cpf/fykcI1C9W+hyQFyxch1/cl/osUWMFuZtYzHpjAoczwfhZZ2Aae
	CHOYqMNuEeitXFKJ5D4gvrHivhKPKeKqc4j7OAA52CIcQZuLdz049LgR1ApebZD5zuTIzgTCJA6
	KyvGnOjPcnS6S7c0E5oMnU6Ziaj5jf8QSC6sFDtt+aqAa6Q8afFfdjgjXXLUNQ+xTnoO3r5ivlf
	H6/EYEl50x5XBJxoav5Rt3yUKyWIt6/PSXNjBiSqlL6VX+LIvVVK5ULVNwWWZ8aVHHe42UNyKSs
	X2zExa0i80nSbJjYWexJwx/7xjTvQzZ48n1Br+tWObGVBA7VizTRAIrz7rO2UA==
X-Google-Smtp-Source: AGHT+IFad0LPAwoSJ2xd14ieDtcaVkm6Sw82CnPHctH4LC9DfuTYjPEFmqrTy7QJo2jkpnnH4m5VQw==
X-Received: by 2002:a05:651c:1b06:b0:30b:c96a:775 with SMTP id 38308e7fff4ca-30f16517206mr9882131fa.14.1743891797303;
        Sat, 05 Apr 2025 15:23:17 -0700 (PDT)
Received: from foxbook (adtt225.neoplus.adsl.tpnet.pl. [79.185.231.225])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031bcdd4sm10453821fa.69.2025.04.05.15.23.15
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 05 Apr 2025 15:23:17 -0700 (PDT)
Date: Sun, 6 Apr 2025 00:23:11 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250406002311.2a76fc64@foxbook>
In-Reply-To: <84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
	<b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
	<84b400f8-2943-44e0-8803-f3aac3b670af@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

OK, I think I see it.

On Sat, 05 Apr 2025 05:23:12 +0000, Paul Menzel wrote:
> [  326.543262] xhci_hcd 0000:39:00.0: Resetting device with slot ID 5
> [  326.543294] xhci_hcd 0000:39:00.0: // Ding dong!
> [  326.543549] xhci_hcd 0000:39:00.0: Completed reset device command.
> [  326.543588] xhci_hcd 0000:39:00.0: Successful reset device command.
> [  326.543730] xhci_hcd 0000:39:00.0: // Ding dong!
> [  326.543838] xhci_hcd 0000:39:00.0: Successful setup address command
> [  326.543858] xhci_hcd 0000:39:00.0: Op regs DCBAA ptr = 0x00000133845000
> [  326.543876] xhci_hcd 0000:39:00.0: Slot ID 5 dcbaa entry @00000000ced6807f = 0x000001339f4000
> [  326.543897] xhci_hcd 0000:39:00.0: Output Context DMA address = 0x1339f4000
> [  326.543904] xhci_hcd 0000:39:00.0: Internal device address = 5
> [  326.543935] usb 4-1.4: reset SuperSpeed USB device number 4 using xhci_hcd
> [  326.560391] xhci_hcd 0000:39:00.0: Waiting for status stage event
> [  326.560446] xhci_hcd 0000:39:00.0: xhci_drop_endpoint called for udev 000000008c832e88
> [  326.560465] xhci_hcd 0000:39:00.0: xhci_drop_endpoint called for udev 000000008c832e88
> [  326.560483] xhci_hcd 0000:39:00.0: add ep 0x1, slot id 5, new drop flags = 0x0, new add flags = 0x4
> [  326.560499] xhci_hcd 0000:39:00.0: add ep 0x82, slot id 5, new drop flags = 0x0, new add flags = 0x24
> [  326.560508] xhci_hcd 0000:39:00.0: xhci_check_bandwidth called for udev 000000008c832e88
> [  326.560520] xhci_hcd 0000:39:00.0: // Ding dong!
> [  326.561031] xhci_hcd 0000:39:00.0: Successful Endpoint Configure command
> [  326.561209] xhci_hcd 0000:39:00.0: endpoint disable with ep_state 0x40
> [  326.561217] xhci_hcd 0000:39:00.0: endpoint disable with ep_state 0x240

Looks like some URB stalled and usb_storage reset the device without
usb_clear_halt(). Then the core didn't usb_hcd_reset_endpoint() either.
And apparently EP_STALLED is still set in xhci_hcd after all that time.

Then usb_storage submits one URB which never executes because the EP
is in Running-Idle state and the doorbell is inhibited by EP_STALLED.
30s later it times out, unlinks the URB and resets again. Set TR Deq
fails because the endpoint is Running.

> [  326.562226] usb 4-1.4: URB 00000000a9556a5f queued before clearing halt
> [  357.198396] xhci_hcd 0000:39:00.0: Invalidating TDs instantly on slot 5 ep 4 in state 0x240
> [  357.198405] xhci_hcd 0000:39:00.0: Removing canceled TD starting at 0x1645d5000 (dma) in stream 0 URB 00000000a9556a5f
> [  357.198422] xhci_hcd 0000:39:00.0: Set TR Deq ptr 0x1645d5010, cycle 1
> [  357.198429] xhci_hcd 0000:39:00.0: // Ding dong!
> [  357.198435] xhci_hcd 0000:39:00.0: xhci_giveback_invalidated_tds: Keep cancelled URB 00000000a9556a5f TD as cancel_status is 2
> [  357.198505] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
> [  357.198516] xhci_hcd 0000:39:00.0: Slot state = 3, EP state = 1
> [  357.198525] xhci_hcd 0000:39:00.0: xhci_handle_cmd_set_deq: Giveback cancelled URB 00000000a9556a5f TD
> [  357.198539] xhci_hcd 0000:39:00.0: xhci_handle_cmd_set_deq: All TDs cleared, ring doorbell

Not sure if it's a USB core bug or something that xHCI should take
care of on its own. For now, reverting those two "stall" patches ought
to clean up the noise.

Not 100% sure if this caused the stuck task issue, but 6.15 has this
CONFIG_DETECT_HUNG_TASK_BLOCKER which might be helpful in such cases.
