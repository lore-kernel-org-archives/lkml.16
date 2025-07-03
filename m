Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0951DDD1;
	Thu,  3 Jul 2025 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751548841; cv=none; b=B6mRx+Qg9Lj0OD2tlEbBZqxU2H97xhW3E8wShxEHYkt3cLn3W1HxC5FT3R19XpriSW1O8QSvwd3EL/UsmOp41XBGuXFTwd165inSe4boy2UzJnBfftjAYZzN9hf1RIzc1H+cqE9rrnC9oRxA5ZsQwt3AaXp/fX8V7xSyeC1n6L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751548841; c=relaxed/simple;
	bh=dU8LWmDWZTXWT/eBobaJweK43xARH/rNd+sTP8jr5S0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP9Quu3vWNhiGYEnPrC8cHNxAo78TMEdF13EzFwiZeKqlqsehjf6v/xD4jHTtiUc6HI4/aw91uxYTN0GGgNIs9QLEX7BorhyHxGylLzD0hmOTQm+Lj4YzJgPIVYBI5oBHX7i5wcOhxygn2G1bmTbB+9QBR23+z4ZistIWHyExoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hBplZHlT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hBplZHlT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537deebb01so29817265e9.0;
        Thu, 03 Jul 2025 06:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751548838; x=1752153638; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MqGlLiGt9QoJKvCwgT5f7sBNld7aejdtjuAgeDdmuJ4=;
        b=hBplZHlTXlarfZTec12BTr3COSvRN/JmpBpCzCccfSWDD7VCsURoqehq1Qi7AyGhUI
         DSzHnsedJlaogPUgZzimqExeMx7cCQuY32A00XT+mN1kdK7lfdL0IZLz54YqRWzkT7e1
         vTzv5+InuJR/aCwrngRdI667+hHbzORQtKGEvP+jh0tuNpympElEvgrohswlr7KFZyLC
         Ad36VmviuNa9X0xJwuh9QxzF5Lm+vb6oOxpKjNxPu86/n1RhtT/ogXi3OoF1kdRlRSZy
         02uaz2kugENbnHqq+CMjgXQQI/fKn0GbEi5U2pttooGnwrQrHW5SJr14IS5s6kY/YNul
         UXGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751548838; x=1752153638;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqGlLiGt9QoJKvCwgT5f7sBNld7aejdtjuAgeDdmuJ4=;
        b=BX88wbHDcXQo0yG6R6D6EfIwd7MZbRS+NAPzp2RB3KCwuqSarBHt/iSe6bu3Hfjyl+
         3YoDg/tsL55Dr6QB0Jnzw4LVVFY6bzoY8S0AoYkCtYNDImVuOrwq9GPCAJKC70WWpZ3u
         CnzGVT17xf5PTA1tKKVMjWM6lgZjBRdM9wcEzbGQcaRSPLsAaIMtem9aM7VywZ1URpN7
         h303W6OhGzof3uRZk9bijbW57wqOmo/l7Ehhdan22zW0f4+utzJ5EJcYBKF6LD1YlH2I
         0i1pMU8cK0yKPoS+jAB+3JudnqKDm7ejKi05JGs9CH4qfuVoXNrew2zpr6hvOryEW+kc
         O7lw==
X-Forwarded-Encrypted: i=1; AJvYcCUKbdd3rHD9pMqTidt8MHp4AYr0cpfL42hQ2Y6+yJ79GvRHnJbGZYikSxrNpwgvt1sSHsehwvyhD3RyGwU=@vger.kernel.org, AJvYcCUm04Pn67WE8CzODoG5nHS9rqihJ1FJkTM4hrogvXgq8TkGFlYvV4/qsZVAbZocfrnu+GQOCw40WsUz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0DxJvLcV1cjxdn+8PsqHbbDu8V36Duzzadqu31U+UY3iwNI0
	eHQhJUTB95gMFtsDGd7yMDcEBA8qqaGQeDYfnemZ9rIgWWAF2eXNeoyxxSYkbXz0Qz8=
X-Gm-Gg: ASbGncshT2d/w/Zgkow7bU3a+gQ6VbvylZWCqsCiE9r5XAclP5Yu8Zx89R5KQa4pUeF
	FWgNdOdsDVjIH8r/I22E7CO8q6bBI5Boc9VEbbN0Z3rlOj4JR+JVsCnrXoNgXLHbvDU3zZf1m/z
	p6qcbVXYEiyHaoGWMBt1GdgVtIuL3tEsv6G8qTq2sn14aH+FxlhTKT0gWrLjUf29JB20b3+OX2W
	H6J8+wGbS6A3ltTUvLbdxrfURkxMj6Q1ul5CJVRJhaafMZ0Y5C+wMJeB0BHlX5Ho3p12CrOywY/
	Q1p09rq8um9s/oj5JUaRk7sRpfUoAuHHxLzQYxjyYv8rAYOQMTKkfW3WTH/wtCaatFsSMhWjbFO
	9NztqQGbhrA==
X-Google-Smtp-Source: AGHT+IGdbVBsdjaXGKnWJL6/Me2LFoH8Pz92HGIJbguP4AOhBwLes9ljeQqgXg8uDTeaavxwfW2MVA==
X-Received: by 2002:a05:600c:3f0e:b0:43d:160:cd97 with SMTP id 5b1f17b1804b1-454a3728d1dmr63080385e9.25.1751548838184;
        Thu, 03 Jul 2025 06:20:38 -0700 (PDT)
Received: from ernest.hoecke-nb ([89.207.175.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcebf7sm27340905e9.21.2025.07.03.06.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:20:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:20:33 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Roger Quadros <rogerq@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Chance Yang <chance.yang@kneron.us>, Prashanth K <prashanth.k@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: dwc3-am62/usb-conn-gpio: USB gadget not added when booting in
 host mode
Message-ID: <jhlqcoxnvpw5tndmty322y64n4d2me7mkp45nikos6fzamcs3u@kwahmdbv2zgx>
References: <taw2mvbj6a2lqwy5h3tuqeifqy2w4gt4pzh4uahxuw27yw64q2@koxg54wgp2a2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <taw2mvbj6a2lqwy5h3tuqeifqy2w4gt4pzh4uahxuw27yw64q2@koxg54wgp2a2>

On Tue, Jun 24, 2025 at 05:08:32PM +0200, Ernest Van Hoecke wrote:
> On the TI AM62 when using a USB OTG port, I found some unexpected
> behaviour when booting with this port in host mode.
>
> This happens, for example, when booting with a USB pen drive inserted
> When the pen drive is later removed, the OTG port correctly switches
> to "device" mode instead of "host" mode, but the related USB gadget
> does not come up (in my case, a CDC NCM configuration).
>
> This issue only occurs when CONFIG_USB_CONN_GPIO and
> CONFIG_USB_DWC3_AM62 are set to m and not when these modules are
> built-in.
>

Hi all,

This turned out not to be a kernel issue. For future reference and
anyone else running into this I'll document what our problem was
below.

The systemd target `usb-gadget.target` is triggered by udev when a UDC
first comes up. It can happen that by the time gadget-start runs, this
UDC has been removed from the system again.

For example, we saw such a situation using the DWC3 USB controller and
usb-conn-gpio kernel modules as loadables. By the time of the DWC3 init,
udev was active, and during init DWC3 started the USB OTG port in device
mode. If a pen drive was plugged in at boot, it would quickly switch to
host mode right after initialisation, emitting another udev event for
the removal of the UDC. The systemd target was thus reached, but by the
time gadget-start ran, the UDC was gone.

  dwc3 init       usb-conn-gpio role switch
      │                       │
      ▼                       ▼
udev: add UDC─┐         udev: del UDC─────►/sys/class/udc empty
              │                                         │
              │                                         x
              │                                         │
              │                                         ▼
              └────────────►usb-gadget.target─────►gadget-start

For us the solution was to add a udev rule to bind the gadget every
time the UDC comes up, so the situation can resolve itself.

Kind regards,
Ernest
