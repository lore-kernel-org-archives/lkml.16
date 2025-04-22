Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330CC1E990E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745360746; cv=none; b=DUJxeNhSBQG1twcORTeLZ9z4BhPhSL684/w+D3ToVKcDbyECD1+O4CjOh7qh6Z7olUQUFz1oyy3f4VOUbgde2doVQq2HvZUCQW6oLLn4bpx1j34YL96PreHOnQsYsEikXobYh44XxmmSwycIziSv4OrktwsqPHWZi/w+7z86vVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745360746; c=relaxed/simple;
	bh=7HqP6IOThqTCj6+KwEK9pl+t3S1elMAtDPI4WqhbDrk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=C6GQayL8jyg9obxnhZheJG9e73aNGk2jAmdTmdLAtq9O6P+f+QxcyXJeSqrg3hHbV+wWpuwVMS1tfTQYhFSSa4bO79wVzrL2U14uYwvy9RDFkbec7gjY7nF+5KiKgZ5sbbtieEFHgOCzNiydIk5dfjD/OCrtbLr/FPvoFHBWocg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FEt4no6J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FEt4no6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745360743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4vRslFe4cN0lEvwN7grLmrzlhqlPU6F80LH1oewlaaw=;
	b=FEt4no6JUnZa6Fz1Alux0u3c9Dm6oQzwCVglUPDqDSIq0VSGUfuZ/OUfRBZStmF7DEi9j+
	uuHOMAeENVKi3p3dgCRGD1grpqdE2G+Kuvir/ENrDJ6+b0gxquAz+fKf7nsbqA9AZiexjl
	1OhxcPLzNvwaI2gOBoO5c1awi8L6tZo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-l23vhqtPNrytXuGj5M9fEw-1; Tue, 22 Apr 2025 18:25:41 -0400
X-MC-Unique: l23vhqtPNrytXuGj5M9fEw-1
X-Mimecast-MFC-AGG-ID: l23vhqtPNrytXuGj5M9fEw_1745360741
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so31158435e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:25:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745360740; x=1745965540;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vRslFe4cN0lEvwN7grLmrzlhqlPU6F80LH1oewlaaw=;
        b=XFzN/i8fjqa9VMtIId+O1ZcWQgkZFAAcVEhqIPuO6dUXc4b+4CGQeXmSssg/coUkAm
         fVZ/XF9KRcozj2L7w6rJwx+o/ZvNEfKfsJu3R99rRq4sUfOBVquP8HT04CUKt4YVQDcZ
         ImbhOVhh49D0We87ffEOHWa+HRLxVRgCP1fRWwpMOM67wjC1N4voin+jACUlHnOyZSUN
         7dsW2SqwQQCbNM7GAx2m8TT4LrxPN/wTb8KnCM/QFiZlXnHwPY3Rc3E2zNgJ7K/GIUjl
         NGA9ILnZq3z6sblOjPLk2sAIv3ietrJpJMybEixs9c3kdvvO6OOlOm5nESdA0tWAQoj8
         ZHiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPkjbcid9BQOrDBclQoKRsr2nMphiC8gIUx58Fg57khogXZTcGVZt254OPTL/FRHHHxoC9yC24d4eiWkY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeGT2NY8LVKceeHqMbjFsddNWJt9x1ObHbEhtiiAnhmQl6Uhti
	i04UgPpt1DBc4+sdmGbatuJ5ycIfEtG7XWWW46Ec2SCM+g795GGM65tOI29VmUl6Pr9qNirluCJ
	bQ4uiXLY0MCDgUEGOrupWIyeOrzAY+7DRHwabyiy+PvEPstbjVbS1q2q//M9LXg==
X-Gm-Gg: ASbGncvF0+dGtYjYgcuj70xq6OkSle9d12EWk6nEHY5wcV3/+8n+z7RamG6DyjFgPiW
	c8TFkUQPI1UpLruQkkCFOBeEJX1Kz1Uwn1CC7X7OnAUVZgeI327nqGFcMHXGLQYI06ilakqs5XC
	mSvSuEB1Hfs7YFSc1Fwn+XZFC6ouO9c8MAF92eytxdvkueBaF3+wPYUBKMCr3AxRaw5YqFUjlN/
	XjZyKIkEBSx03J0SHkNJVWFPxPZq0fs31pOQg169KA8X3NJ55e/jSBuT+OF4KE5XZ/AiaRsziL/
	I6qgxKp74HLhxVNFgjL55Inv5cm5OXYVqIIRRTRN/sBzxWt7m7IMIlvtYo3H6lb6ZKfVQg==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr138387095e9.20.1745360740674;
        Tue, 22 Apr 2025 15:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOs7XI0oTVw+DKb/7MP/FHJt4LRqW8okLBk6z7fJGL0tMZ+Jiu0PXC4iek8XZZs+XJeZ3sSQ==
X-Received: by 2002:a05:600c:a363:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-4406ac0a8b4mr138386945e9.20.1745360740331;
        Tue, 22 Apr 2025 15:25:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44092d17086sm3525365e9.4.2025.04.22.15.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:25:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Marcus Folkesson
 <marcus.folkesson@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Add Sitronix ST7571 LCD
 Controller
In-Reply-To: <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
References: <20250415-st7571-v4-0-8b5c9be8bae7@gmail.com>
 <20250415-st7571-v4-1-8b5c9be8bae7@gmail.com>
Date: Wed, 23 Apr 2025 00:25:38 +0200
Message-ID: <874iyfbzq5.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcus Folkesson <marcus.folkesson@gmail.com> writes:

> Sitronix ST7571 is a dot matrix LCD controller supporting
> both 4bit grayscale and monochrome LCDs.
>
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

