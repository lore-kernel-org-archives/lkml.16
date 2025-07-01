Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BF221F12
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751363580; cv=none; b=W4FXFRPFmEU6+aqbji3nNkm+0Pze/HhVm+VW0VrwZRsSmXjlikYSu3hhji94y2gJjax9txCJTwO5z4cyFV2z3Y8zx/KrE+H46WlBvoEe6eIABu5N8kwcCR4sCWvw6IdSAIE2XWPqegnL9qQOEcXsWvuKKUkfMa7ADFqwG1CAE80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751363580; c=relaxed/simple;
	bh=Y6Bt7vYqzIddtJaGwQ+/1XfNpiStkL0hYIpIeBMBUOA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KtbnMfoUMMFCX/vQk6Q0rVuSazYLGJlJkDB4E3+Rf0/MfwnPzazpKlmDbRiS2JvKHC3jjRggTwLrpyAkKNtji3ej8An+DopSWw/ewKrY2aRPl31yey/omM0j49wN8LjFgt5ZZTr7jY0DAmZIV2bWJr7b3FBqdMMmDGK2uBTz8tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DJsAi6n3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DJsAi6n3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450d290d542so34554495e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751363577; x=1751968377; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AsO4MNbP6/LHgR7nHvgKu5wEJwKc2jZzt2g+cQIzNfE=;
        b=DJsAi6n3fybeLBAQOnoKzk29BUPNchoF8/xnU/8mODXPTCxJKPSRNKJSIvG98QTIqI
         PmPpBPODIP3Wqxw+v8zG0BofNzyABtmmY2iBUClu6qfMZhoJwPoFbYhf4adm7Fx4FBSz
         aonQ+GrmFdLie/8i9WkrnWMwaZ7+NYsp/A5ahCmzJMT60DhUG5LbOT/jlTwhRE6zuYD0
         zkUjd0XMP1HQSDN/q3GVn3UFwBdtTOiDzI0oN/oDd4tHqsH1OssP6WYXl2XLi6yhH/tQ
         SrzU5N+AXSRBLLN151j1XKoDLNOA2LvDJDH4UwSs9iEl+JRfDlmKb5gWeMN0r1yDNoba
         wPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363577; x=1751968377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AsO4MNbP6/LHgR7nHvgKu5wEJwKc2jZzt2g+cQIzNfE=;
        b=IMvf8UVFlDhD50wjhH1/CQB7fIH+MKvZQm8OFWxPwrKJDugMukGaGQcxa543aafbUV
         4+ouszYjeNOfWSvSz/qgSsLfmouI858A7GDsRurA7STuepRIHaBuYLjqkb8cWxClUyQA
         esa/92TRyiTbEDAoJ39NVnhQRbYCtmU3xCj1vAuMgO1b9QV9pzwkqfKKAkFsacF/ovdB
         nlPmNQ8OdvwXHf8bO2/zsJ+jfLRwLLA4nnXIvO3V2cxjOvK55Zxfw8E3QY0SRFyl0mJC
         x2w3dz8EA7H7tmcaJVSGj7JS/AT2zyXRKOaTnLlcC3vuo2i2HmJJYtthLRGQwa6ZJonG
         70EA==
X-Forwarded-Encrypted: i=1; AJvYcCXiZPE4UTsGL0MXVxg/zCytHcrmhV3fHMdX9+XnWA8D1lPEl1YSrzzEHj/sgbGAXKPhPdlibJFlle5TbNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK9JE4XmL7sGkvzvnVK40Vx4xBH/CYj/aNGqR08XoTmz7HoGZt
	Kh8rgaON1PZfTwu7xduJdIg/HGpizK9J8tfEDds6gG9FGVstbCExCy6zByl0ekTOMX0heYO5ROV
	ZAojGVOvphXrUtQ==
X-Google-Smtp-Source: AGHT+IFvqQhgygm6Ns7DmopGcnlkaCqQTFJuAvO9MrADA3egshrgy5Yzka4HTdvu9aa5pUh3EkhdD3/3DmWlVA==
X-Received: from wmrn33.prod.google.com ([2002:a05:600c:5021:b0:450:dcfd:1870])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-45390259d15mr141264015e9.6.1751363576854;
 Tue, 01 Jul 2025 02:52:56 -0700 (PDT)
Date: Tue, 01 Jul 2025 09:52:55 +0000
In-Reply-To: <2025063054-abridge-conclude-3dad@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250630-ipmi-fix-v1-1-2d496de3c856@google.com> <2025063054-abridge-conclude-3dad@gregkh>
X-Mailer: aerc 0.20.1
Message-ID: <DB0MKNAAHYVK.3V2BN2WP3C7ZI@google.com>
Subject: Re: [PATCH stable] ipmi:msghandler: Fix potential memory corruption
 in ipmi_create_user()
From: Brendan Jackman <jackmanb@google.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: <stable@vger.kernel.org>, Corey Minyard <minyard@acm.org>, 
	Corey Minyard <cminyard@mvista.com>, <openipmi-developer@lists.sourceforge.net>, 
	<linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Corey Minyard <corey@minyard.net>
Content-Type: text/plain; charset="UTF-8"

On Mon Jun 30, 2025 at 6:10 PM UTC, Greg KH wrote:
> On Mon, Jun 30, 2025 at 05:09:02PM +0000, Brendan Jackman wrote:
>> From: Dan Carpenter <dan.carpenter@linaro.org>
>> 
>> commit fa332f5dc6fc662ad7d3200048772c96b861cf6b upstream
>> 
>> The "intf" list iterator is an invalid pointer if the correct
>> "intf->intf_num" is not found.  Calling atomic_dec(&intf->nr_users) on
>> and invalid pointer will lead to memory corruption.
>> 
>> We don't really need to call atomic_dec() if we haven't called
>> atomic_add_return() so update the if (intf->in_shutdown) path as well.
>> 
>> Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> Message-ID: <aBjMZ8RYrOt6NOgi@stanley.mountain>
>> Signed-off-by: Corey Minyard <corey@minyard.net>
>> Signed-off-by: Brendan Jackman <jackmanb@google.com>
>> ---
>> I have tested this in 6.12 with Google's platform drivers added to
>> reproduce the bug.  The bug causes the panic notifier chain to get
>> corrupted leading to a crash. With the fix this goes away.
>> 
>> Applies to 6.6 too but I haven't tested it there.
>
> So what kernels are you wanting this to be applied to?

Right, sorry for the ambiguity.  I've just applied the patch to 6.6 and
booted QEMU and it worked fine.

I have not reproduced a crash in 6.6 but it's pretty clearly a real bug
(it decrements the target of an uninitialized pointer).

So if you're OK with that then please apply to 6.6 and 6.12. Otherwise
just 6.12 is fine, I will send another PATCH if I ever hit the issue for
real in 6.6.
