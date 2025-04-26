Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D13A1BA
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 00:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745628989; cv=none; b=sEgMfYx2W1U69gQKQKVDXTTt6qVHhxTXq+CuKC/nLQZ+He1KNcfZtbIZW0LSoi+S/f7EHurT2e4t3wy8HgrUIa2PqagXqCSfSAH0lYa1JMGmuNYpUhAxlh/a9MEV25MC7wE95HA8zt69PgcQlZbj9K3eSL6tjTAoyJitwZH661M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745628989; c=relaxed/simple;
	bh=YNqrg8Gr6LknvkSnE39xuKcwg34P/Fnl13QkwkqPjak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UfpzMZsMY36dxdO9mf2R0IxNv8DrDncZeH5SLWEc19Ddj+5aXgxRPe5r+SS4zIXY8Y+b3WYOcAGNgTXewn/PK+QobjS6+a4Epbhyj2nUH/7O/+l1QIm7MrXcfDqYLSRiHBWBjSYz6NwqvGhEx+FQcRaYHr5WHRIUB/m9dNB1TFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=cplNAm4e; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="cplNAm4e"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac25520a289so449746066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745628984; x=1746233784; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Em+2y0/Onk6EnYtiiChWd1rtBYQR732zIpd3lcrr3Xk=;
        b=cplNAm4e6nKveh5crIpZIgSsPTMwSzCHYSULlDl4yvGTrhD2LQjbBvkFv4lWSb+rqL
         JCGTAzBUoS8XRrbi+6xvVVy7725Hh7QsKj5G3I/jWGDyFcbDcP/rTHkXSw7XYkJMSkT8
         Xingrgaxow396cKvfZ7mAkcarpeiJZkeDnmaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745628984; x=1746233784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Em+2y0/Onk6EnYtiiChWd1rtBYQR732zIpd3lcrr3Xk=;
        b=I18T7VKztzbSSOhMBfRHxD3V4d6A08ULM8tb7f68PkRoskRSAwwZnQ3fbcLHiKOZJ+
         1m01OvA8a87urYxm5bxLSVSNMGigJdpOYqDqeerIG34TCpey/tKVLJJqKtTYLCT1jk1s
         xuMojNKqYB6r8fCq0gsi0fyLmrE87w4u+jIIDrdyyz/WGsvH2vf8rXtXLJpfuo4i2aRi
         2KKFTzo0VYfjUtqV3AZ2X2yPH61/j1iA5usl+zyhZ3OSxH7YBRwGMjgZMmsFwNU1NYh9
         n/df+elarLUCdtziH1KMaRyU5dnJVo+SuT4zTSSZ3zsOlj2STV6tH5X7asrpeZsxy1BA
         dF7w==
X-Forwarded-Encrypted: i=1; AJvYcCUvrlbF6xBXQ26tAd58OdPbH1/et7AsZZvqRHnLx2kQpfROBjg+5mNobzghYFE2anY1LYuaFM3w2Lrh3uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrXw2GrdO1zRnfZiphwRxgq3faFMii49+ksi7ZJMKT1CMgFvCM
	qu/16024b0jJPVWvGfztnRuycFOZXdeODblpeLeI97lL8oPxRR80Ty6lgCxLPp6hn7HLZgxVpQY
	R/tQ=
X-Gm-Gg: ASbGncugp51l0WJYgRIzL5mpFlsALIAQBBwe6/MnjK3iPXpSFw9FnEZxDPzNDoWum2Y
	O+n/EtDorUdQd780glDQk4BskZfG6yv06xYB7cFb7999hHhz4v6QuPXkvi0Rube4SJGEb4qfiQ4
	PCAeKaY0z7XSqmj+PpbcgO66Wr/PPNMOIrZx9b78LbM/hAUwLjp5ZQ9LJN17eBZFcGceo9LZiNJ
	QvclsmDFL1Ki04goXpJ/tXRzm4EUSqs6I4arxLvjO2Y1EdyHop/pFmPYRtTVQqhjKMqR0P3EjFl
	1QEHyFNGk8x8yswJY4KJh5MAck2DtyvVsr8Ch9ncbYwO3EjiYM6Yv54RGNv3xezBAKiaEiHoEnT
	iCxv5OdZO0OeB8jc=
X-Google-Smtp-Source: AGHT+IFm+d7HRsVHy8WMz/RtyGTXahcthJBBSyQh7s+3hgCoH1EzRz5ETp3CE+sGBxynR7VaSvai8Q==
X-Received: by 2002:a17:907:7fa4:b0:ac8:1efc:bf66 with SMTP id a640c23a62f3a-ace713f9b38mr346967466b.50.1745628984059;
        Fri, 25 Apr 2025 17:56:24 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafed3sm211730666b.180.2025.04.25.17.56.23
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 17:56:23 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e5dce099f4so3636695a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:56:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkIQMjgISGPT2KAGK3XaXkco8Xfoep/ubseM8q6DfK9eeuWJzLDHSMbHHZCEH5m6I1Bty7qiQDja7b3vc=@vger.kernel.org
X-Received: by 2002:a17:907:9492:b0:aca:cac7:28e2 with SMTP id
 a640c23a62f3a-ace71399bdcmr380685966b.40.1745628983049; Fri, 25 Apr 2025
 17:56:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
In-Reply-To: <CAPM=9twNOWYCQ6vXZqUAu8G=oxGrKUvcTYz-SL6Jc=4+8ivVew@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 25 Apr 2025 17:56:06 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
X-Gm-Features: ATxdqUFsc5Vl9i5t5E_wRus16PP7tDoqjOmUpZWiYCSfOvKDtoPPplMogMN2b3w
Message-ID: <CAHk-=wj+h6i94DyxGQ2Ez6tvp2sBs70EfY7Lp0N1umpwHL_VrQ@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.15-rc4
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Apr 2025 at 16:12, Dave Airlie <airlied@gmail.com> wrote:
>
> Weekly drm fixes, mostly amdgpu, with some exynos cleanups and a
> couple of minor fixes, seems a bit quiet, but probably some lag from
> Easter holidays.

Hmm. Is freedesktop.org feeling a bit under the weather?

I'm getting

  remote: GitLab is not responding
  fatal: unable to access
'https://gitlab.freedesktop.org/drm/kernel.git/': The requested URL
returned error: 502

and when I look at it with a web browser, I get

    HTTP 502: Waiting for GitLab to boot

and it talks about it taking a few minutes, but it's been going on for
longer than "a few minutes" by now..

                         Linus
