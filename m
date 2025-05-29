Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94D52CCC5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748558599; cv=none; b=c+fp6djvPmgdnp6+3xkw1x/lD3ntolDkG8dNuVhdajle0MynblFvOLtzBkmAWWPCwjygW+MteYIRtgbDJCDSrYYyp90fkcLeQi7HLEu2BI/rBr7pMtH73bu73Gc9S8SqfVLMbKREUrtMptfLKEccL/1sSfvxqw7wHknJUgzSevk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748558599; c=relaxed/simple;
	bh=lbw2lnbOO4oeJwKYWFP9EJOeucCSNfWDA0xulO+3eeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kocflic6aySs97RdF2TIpxZ83MIuWmaIC5imRqb9vM3+8NaQxwwlj225CvGxOt6A8b2csW07sAh6HxOf2FWzFZZH9xKv3ZoPMtsr47XUYcUCrGUL9PceJeWLAJupCVcz6/eHkDK5vgC0uy4vxFSzyM943eNcD1/Orto1+jL441E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HPypaMYA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPypaMYA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2351ffb669cso7179395ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748558595; x=1749163395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+h89UbQKlTz+8ebMW+43AutxM9BGIUxfQhvYLMcdjk8=;
        b=HPypaMYAaaIlP3tDs4RYzBMk1rG1BRbB+DKnPOJEnrThmlvPjxVa8oHwt0Oy6AJdb9
         sQWpTAiccdic09l3Nr6CkISJvSYRfKoNDVgXWPOMHIMaXr1dj2IYDa8rONcxDfhbzQzu
         4pY6A8UsPTtp/5nEQaRzo804wgE5ywnmClHP2d15SMtBBtX3dReZwdu4+2DiMi+brCRA
         J34DgJ7gqEa869Wjj7pWYW84cYVI0PqpveubrN0m2/+MBNOyUN0RjdjSDiXMy+WrtrGR
         j0CGHKHhiDEpgNppXcK6u7P3JEu/TDsZYYzk6opBrkyPslI5jtcSuWyxK2wCkg17bfuy
         NjlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748558595; x=1749163395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+h89UbQKlTz+8ebMW+43AutxM9BGIUxfQhvYLMcdjk8=;
        b=peu170FYyiU6iwOlMJDW+Qfsn7fbio92CQIV1MIR5BMkraAd0gf3moh6Kp8+64HzLw
         X4oMXlwbtJxmfDcokjLv/XAmDVRgU+oIkbDoWM2QEpM+78yVyd4eHyyr69aELg8uIWbz
         OkxrX6wtLrkLXSvvrAfZjVxi772fxLW43PMDTeSl7/6+KM4x0SNU39JcxQVfHYrZwkgc
         xLqFeKHG6U67mJxwEyd/M8OeP15L/D1sL4MFLFOxoz9Jq6PgcA9AFWOD9Z36/KWNk2Sf
         KGFJn+oVBoBCgFcBwWdpZ+E1FEdlWFwATWDd27OQfDhKL90jus1boBTb7NgDBRd9a/kq
         2TFg==
X-Gm-Message-State: AOJu0Yws4z3KlF4P0H1a7cMm1KrKU3g2YTI45AX/6MHTzlBxOVx1dtEA
	dnYhZlSND7N/rRuRHuYXMGFkLfvk9dGq7l7QWvzEi0lFnu3yFGs95CkI
X-Gm-Gg: ASbGnctQUavnKll+YFft3Q5RFMe0A1mJSabuORj15wR+4WLMdaGhCj6q7lMqZbLkhXM
	OOQIW/LoDfB8bqhrgWmS3vg6cVI0NHVqogJMZX34TSC7bTHhtYqDIZyzBNhnY1/M9jlYl1NAjPq
	dWzlBeSgMPW1ebEsZiQ3jKrpS4JzXWwJ4DVhGa5z0qCVCGO7Vih3QZQL0VJwQv70Pag1t2DcMNW
	EDW6A+v1Xz8AkpSbnBGKfAfUAT5FZujoS/GP1PZEjjwE4tmiS9O85gooPJCSH7EcLFciNsfWzKC
	7KWaW4YIlR5wwqADtTcfPzZUjJOvnCiWpxsg1Hog72t0RTY/w2Y=
X-Google-Smtp-Source: AGHT+IGDAL+z/UbZ6/hub5IST+q+DNRxrk8+8y/iusVGxk1kDe/DOQqdPd8daTJLFHfWWaB5VIMNPg==
X-Received: by 2002:a17:902:f64d:b0:224:2207:5130 with SMTP id d9443c01a7336-2352a17dbddmr16293525ad.45.1748558594847;
        Thu, 29 May 2025 15:43:14 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d14c58sm17049295ad.217.2025.05.29.15.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 15:43:14 -0700 (PDT)
Date: Thu, 29 May 2025 18:43:11 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Luo Jie <quic_luoj@quicinc.com>, Andrea Righi <arighi@nvidia.com>
Subject: Re: [GIT PULL] bitmap fixes for 6.16
Message-ID: <aDji_0NEVRpIZMKP@yury>
References: <aDYMkVGnByTn6HBQ@yury>
 <CAHk-=whi6O47-0r=eOJHnd1ACa83Kd-aaELi=Tw4p4HwJ74q2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whi6O47-0r=eOJHnd1ACa83Kd-aaELi=Tw4p4HwJ74q2w@mail.gmail.com>

On Wed, May 28, 2025 at 02:42:36PM -0700, Linus Torvalds wrote:
> On Tue, 27 May 2025 at 12:03, Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Please notice I changed my pgp key.
> 
> Well, I'm not finding your new key anywhere, so I can't even check
> that the new key is signed with the old one.
> 
> So I can't pull this.

I have to admit I'm not an expert in pgp keys things. So when my upstream
laptop bricked, I switched to a spare one and just generated a new key.
This is obviously a wrong way to go.

Today I bought an ssd-usb adapter, plugged my old ssd, and it is
fortunately alive. I was able to copy the old key on my new machine,
and it seemingly works.

If no objections, I think the simplest way is to resend this request
with the key you're familiar to.

Sorry for inconvenience.

Thanks,
Yury

