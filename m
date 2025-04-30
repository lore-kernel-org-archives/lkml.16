Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7552F2EAF7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745977871; cv=none; b=aAZdJVSsz5ybv0NZpxzRlERIH8Z/uh3T2gFR//ZqzPmG7/3p+mnNkZSNzfIpvnlM/GE5jB/6yovx+o/ibKh2JyYZSqc3PEJInmSzv3YsAKpFKl0TxMSUR6bKLY9Qp1ePOXstUIwBVLdHJjmSquqLqRVHbkFrHsVrvlp4AXbkrL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745977871; c=relaxed/simple;
	bh=rfrOgKpBCk7qPpaO75GltUUxet8hLfjCpRs6KwLqCqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMOW7qMQNtEKBzBBfahEOsVrdmvCPK+jMY4w67oJg/X88WtiHIt/r/HlDpEoDGBn4y6LV1eDwYpO0gfk4fmNxPN6emHsDhawkzVn8kB4B/RMukeGivpMPCTPJKWSsz+tC+oXIpVZyBzO5fk+Q/f/PyQxBh1z80bz2g2pQn0Fyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iukovl82; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iukovl82"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736aaeed234so5601874b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745977869; x=1746582669; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x7xSxmgjA4Hl8qCX2/f7trj++E1dgn0NeNi1d5opTig=;
        b=Iukovl82ZHl1ppBm+387EtfClLxZe6Yj2QLC62o8i8UrQlA/oUKm+jFp+9H/+xpd4I
         +ButersfAMeX5/Je7k09mN0iTHG1CSgAUSRF0fi15RmzFyhHSlrk8itB41hQmKH1V4wX
         8Y4QjgcThlx9tM4G1FNAPYI2DwTy3nEEulsPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745977869; x=1746582669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7xSxmgjA4Hl8qCX2/f7trj++E1dgn0NeNi1d5opTig=;
        b=AOf4IkEmO72gj1+6emqUjt6RvUeGyC8k98J7B4SkmhzGaY5CrVQ3zR0uHt1bFEPVOa
         WIeq/DAngdOLWhLmePdecT25LuK4VBNgFXJ2UGJCbj0/0R1izkaM7tfFW+UUuzLisYMb
         BppghpBcgni/537Fdq9Esif/5aJSplA0IGlAU3oSJcsyRf/g1TUQ7bivQjPATzY953dy
         HETuz/ZCFW9qbFwR34XMdkicgklb8oVQgfNTWiKazw4NDrGqFTZFu484dhdOiPYnIqU8
         ROXtSYZzae392ewwCHPGfWPewb9YIP9u9q++eMI9/BrmcQASZ2Hs4xP7VMgxt/rTRIaR
         b3ow==
X-Forwarded-Encrypted: i=1; AJvYcCWHQFRu2ovEPpCcsCK2AFZhnGk/YA4rgajuDqSvwWFpXQRj8ZxMOwyq6TWvuI6lNB7X6eNOflFTFKh6Bv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5UCTCvQxdAdvGJu1Q8DD6zB4XGI9W8wHk+F7DMAORmowGf9HX
	ipo1S9UxdjxcMYhzL/cLtDazTPq0oJN5cfQjdUjsZd4+cpOv69CyTOFMKU9YPQ==
X-Gm-Gg: ASbGncuz5PNw8XITE55MuqbihZG2zDDazpm4RHjpDSUNaACtzBnpEZ2PeK/cu167hLt
	9ZUr///y/i2zoLtoSmD5/ZY+5uKHC24wQ42wiG9gNjILkVUEQaMkEIOe3yJkSgRM1cmxu50r4p5
	ppvR4ZM4i4d8Xcywy75hu7H0EDJQytdjGp7bgcWmx1gBG+WU5BSgBUcubw/JAgS6+OcvOy4g+X7
	eLs2AvDRIimH/nFBHmH2/jxxfThMgVNPuN6C9lGLylvJkz3cE5BlvFCImyp/QRDPQoVPjm96k1n
	kiMmD2k3s8cnjv3LOFqh3BBYaorSwePL/g==
X-Google-Smtp-Source: AGHT+IFRB1rzS2EHxndlOMO/eNYOCxxmki6CfyHz/pgYJY8goCmO9VQbnakhTKfmm95vXeql2kPVtA==
X-Received: by 2002:a05:6a00:3e03:b0:73d:fa54:afb9 with SMTP id d2e1a72fcca58-7403899f538mr1991527b3a.7.1745977868695;
        Tue, 29 Apr 2025 18:51:08 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:d326:d929:40d:c7f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a31018sm416334b3a.113.2025.04.29.18.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:51:08 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:51:03 +0800
From: Sung-Chi Li <lschyi@chromium.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <aBGCB6_4XR4Z-vFI@google.com>
References: <20250429-cros_ec_fan-v1-0-a8d9e3efbb1a@chromium.org>
 <20250429-cros_ec_fan-v1-3-a8d9e3efbb1a@chromium.org>
 <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec2f7e54-0582-475d-af91-42d9be65cd3e@t-8ch.de>

On Tue, Apr 29, 2025 at 10:45:56PM +0200, Thomas Weißschuh wrote:
> On 2025-04-29 16:14:23+0800, Sung-Chi Li via B4 Relay wrote:
> > From: Sung-Chi Li <lschyi@chromium.org>
> > 
> > Register fans connected under EC as thermal cooling devices as well, so
> > these fans can then work with the thermal framework.
> > 
> > During the driver probing phase, we will also try to register each fan
> > as a thermal cooling device based on previous probe result (whether the
> > there are fans connected on that channel, and whether EC supports fan
> > control). The basic get max state, get current state, and set current
> > state methods are then implemented as well.
> 
> There is also HWMON_C_REGISTER_TZ, however it depends on OF.
> But this patch looks very generic, so maybe it makes sense to implement
> it in the hwmon core.
> 

Hi, the HWMON_C_REGISTER_TZ is for registering a thermal sensor, and here I
registered it as thermal cooling devices, so they are different. I followed
other hwmon drivers:

  - gpio-fan.c
  - aspeed-pwm-tacho.c
  - max6650.c
  - qnap-mcu-hwmon.c
  - ...

. These hwmon drivers also manually registered other cooling devices, and that
makes sense to me, so I think it is good to just register cooling devices rather
than make big changes to hwmon core.

> > Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> > ---
> >  Documentation/hwmon/cros_ec_hwmon.rst |  2 +
> >  drivers/hwmon/cros_ec_hwmon.c         | 72 +++++++++++++++++++++++++++++++++++
> >  2 files changed, 74 insertions(+)
> 
> <snip>
