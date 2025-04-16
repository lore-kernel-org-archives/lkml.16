Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAA12206BF;
	Wed, 16 Apr 2025 06:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785008; cv=none; b=FMIjnLj68QgPiSZGMvSjlvNtWgTaPpvsCdaoO6IDQ1WZPMbsY2Pm/33WuczlAB3nP+cDq5gnOIWY9raYatcREgLX7fhgMpJ9Ew3GWMyFOoJiafKpB1Z2BUvNf79Y1Kj3tfwZtL/fkis3GRfSJBiRx571h4h6nsUoPl617pwvSYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785008; c=relaxed/simple;
	bh=5xWF+LyPoYH5KqxcaJNETqNS28KCaaILPY9hkLQ+CoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhwiAd1VIG7Nqhfyg89m/2Jsux8oHCacCrRJV2aK54UKT8Wsfk5bOAt7W3r/6/Z8UxwLmsMzidlipq4TaN2xdHT3/GRShOVXl7qRu5m0lsUE/aLfPwtnSZLRASU1Bw7SzOuPFr0TAbIcQmb0N+VP27Q2tA/yzVw69AuRHfd4h3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0NVdwl4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0NVdwl4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5499d2134e8so7680493e87.0;
        Tue, 15 Apr 2025 23:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744785004; x=1745389804; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xWF+LyPoYH5KqxcaJNETqNS28KCaaILPY9hkLQ+CoQ=;
        b=g0NVdwl4bGCLfJAZBK2XwvLm413rquB8IsYzPYmnJy0Cr/diYo1oi2WYDa1GUvAHWb
         ZJpGgX4s5DQS46vLJ/WacHhZ2l8XRFg4JU20338UmaDxjpPn1h8XDtvDtOI+XSBpeyWL
         Xi5H27dmWi3wEbIzH9WlT80WK5vWtMLuaH/Y7zobexPsPb2vIDKcJWCrvTL/ufI3j5O7
         nTIZ189ziAer2lDpftmAUlSMiJAAW270+2tK73bP72aUDdQMNvNzZDrZB93qjsSIWIaR
         vlugtyfsyO/6Tk5mGsg8jqBH1m+zQEd2xznWxqleLygXRhWigtjUm0VRNM986myP/CQt
         GgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744785004; x=1745389804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xWF+LyPoYH5KqxcaJNETqNS28KCaaILPY9hkLQ+CoQ=;
        b=eToRKINzrwR0CIVpT6Ng7ibep0khL1KqCuMdARFyAAUiOZ2IduO3yrvjEHDASNFVjh
         +GYw4ScZ/0/nPlaOE6e0iTXILJr4EluvWm0qy+sKjFSrkKQpcAGyUF4HBqVCRIoscx01
         Rf0Br+rkslbLQKfkUCdUgHm1BLaBRybu5pAzhDRWuhR+7LTfdHmMWzpvcJJbDi+Yy8tT
         qirN+HNHKpt3HDebQ18E/vcduHXtEbMUL2kRwYFiIgevuGsQk7hwb+KfYVuXHpFZkknI
         VZBmCIWHMd2AckF+DI7GEMbi6R8OWhqDeKySB7hkg7k2Zqhliz7hohk+PpzlL/3KoAxw
         Wa0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrG4yzGpW7P0dYfe1zUYmiXJnjkSK6RMYipyvlUV/Pys46kjqVhXrzVMOl+VAjb1fK/cmq+d3sdPga2Nw=@vger.kernel.org, AJvYcCX2vu+J8tII4ysvg59yB/8GbGchduVYreJmdWv/Q/2TA2xuQpPcKXwwN6fm57Km+fo0TZGIlUhWq8tJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj1lWp9TNGyg3z45GQslz03PGvzlT1nbkTkPLtn9p2AJiHlpKu
	NKTrlOildz9IzJVSRs9bmIONd9U88k6iISXd+XeC0w49mdlJ6pinYZCyVg==
X-Gm-Gg: ASbGnctDnyspoxLdCCpAU2HjeECcgRw5LXDX7x66vgIx8HG4SzoVMHxK6HNIWzqY+Wd
	rMSZ029MU6PpBJj5uNI+b2i22+XJF3gl/NR3yjlygyxUxB8+AE1dgJERImyp0WJR1tNHI/cHhu1
	0RVQ3jz/wTYXlCQnw4u7TM6VXiJMBraeV0gDHQwMGxRcDOEbztfjSsX9UEiXoha3soxoRW+3u11
	v6/cmlCTVIFpUO98Nu5BnSP1SkXwlvVgfwBsRZRtfGobYIIddK/keBx0xvq0c9GIfxX6WfJHit8
	X+Cq0tVG6KlEfZO4Tcq4TfE4ErVkWlAEzDwvlkRcHe+HT9w9PwdzxngC2A==
X-Google-Smtp-Source: AGHT+IEvrH8c8f4LURx/Hmz8qsDMxpWkZevbXOY94HHXLFvsjSZoFptohIAZ8X8MoMUvgQKI8KBioQ==
X-Received: by 2002:a05:6512:239c:b0:545:1d96:d702 with SMTP id 2adb3069b0e04-54d64afd869mr175891e87.48.1744785004257;
        Tue, 15 Apr 2025 23:30:04 -0700 (PDT)
Received: from foxbook (adtu187.neoplus.adsl.tpnet.pl. [79.185.232.187])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d502579sm1645018e87.127.2025.04.15.23.30.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Apr 2025 23:30:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 08:29:58 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Minas Harutyunyan
 <hminas@synopsys.com>, Linus Walleij <linus.walleij@linaro.org>, Alan Stern
 <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: hcd: Add a usb_device argument to
 hc_driver.endpoint_reset()
Message-ID: <20250416082958.20c34504@foxbook>
In-Reply-To: <2025041508-rockslide-endpoint-a48b@gregkh>
References: <20250415111003.064e0ab8@foxbook>
	<2025041508-rockslide-endpoint-a48b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 15 Apr 2025 14:26:26 +0200, Greg Kroah-Hartman wrote:
> > This fixes a 6.15-rc1 regression reported by Paul, which I was able
> > to reproduce, where xhci_hcd doesn't handle endpoint_reset() after
> > endpoint_disable() not followed by add_endpoint(). If a configured
> > device is reset, stalling endpoints start to get stuck permanently.
>
> As this fixes a bug, can you add a Fixes: tag with the needed
> information?

Hi Greg,

Sorry for bothering you, the real bug is that I forgot to carry over
the RFC tag from v1.

The 6.15 regression is currently solved by reverts Mathias sent you.

The underlying bug is much older, I would have to research where it
went wrong exactly. It was very obscure; a class driver would need to:

1. call usb_set_interface(), usb_reset_device() or something like that
2. submit some URBs to make the toggle/sequence state non-zero
3. call usb_clear_halt() on a not yet halted endpoint

Then the host endpoint wouldn't be reset, but the device would.

I know of drivers which do 1 and 2 or even 2 and 3, but I have not
yet encountered a driver doing all three in this order.

Regards,
Michal
