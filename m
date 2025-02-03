Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9462063C4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596763; cv=none; b=STUBdisWink0hORiJ/b5BKH3sU8z8iKUlE0O+q2R9QyxoUwDcxBwXDiz44wNVXtLDua/30VgK9ltt2cQuEoCP3jhgelkwt4fdrKNJzZysx6zYTbLMXR4pSf+i60XNE5x5yQ3iv4kah/pMF1bLgcGiPsl2pPC78FOTWso5MYxQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596763; c=relaxed/simple;
	bh=aVs0339rK+i2NEgNlf9OaZRidgVZu+tpkNfGjOGSoa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f+7XP0hrx1ETpww981wC/S1+1ZrSzzEDidK4dDtrDfSL2s8+mB4ucH/1OlI7OJ5AAiMA0EmdgkaFP83K/pGmfud1u02WIoM+nql9eZltzCCkmTdGw9LxioousO5TXPyWGi/Mq6Cg/betYrSGrWeZnsCcN1xEluq76r7Ebn3OcrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=QKOdFNta; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="QKOdFNta"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361815b96cso31265745e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1738596759; x=1739201559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tASHm1C70jhwuX5F01PGLvuq2V3W2OhvSbK9UTRx0HY=;
        b=QKOdFNtaCFlwFJIKYY1+QPV9/xVADV6mwVcZGTbCtZDxbdWXRoqchOYi0WCDLFeEKJ
         U9POSfPEyE2aGmI18Zal4AXaqKjOMa5BZVHvY2vR1m/MOo51KzsoUz5B5fdkWRhUtQ4K
         7/2ZeanfqI4+CyJuQek2NcWO1kyXQwuELP1ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738596759; x=1739201559;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tASHm1C70jhwuX5F01PGLvuq2V3W2OhvSbK9UTRx0HY=;
        b=U6eNikh4sD+z4Q2aJeqrKOeFTpu+iidwUORfjsmAiznc9RDEDv1hZyTtaeWtyC+OTX
         JQOOmQjN7t7ms2YFzvbBflNgUGc/j+BQMQO+BSKgCr0k5PaPXUpxZh2N2xHCTU6PqJ8N
         lG7SRU2VWQ3YSSgO1ViC6bzi8tIuT85tMORYsWj2ay7rHmtbxtPqMrEIxWmfPcp+qqOb
         FG6ZcmtJbzJZbp9OQzKWgyJPhZGgMSSqU2oOo1LHk3JDFrVLn3fO3PYo3UL7YCTyYUoE
         chnCq+L9HylJ7fir7L2QrUmdegRhigX353HeQlt6aioJ6+6T8G2/x0KD7VPX+7bDTSBa
         cMZA==
X-Forwarded-Encrypted: i=1; AJvYcCXbk14DmfAuTd5uqvdIiHvbk48giJcE12lJG849GSdxpemqBSjqMe4lngMi2YDazR9T6WTnGFKFThk51x4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn0IqKvcXuYY+wnj7KLUOVpsmT8j9rRh+eQ3cAPE/fwpktTv/b
	1qtC11c92vDmbyz1WajFQfv007RZ74qQngqWROy08Co7zSeyWO3LxW5la16+hqU=
X-Gm-Gg: ASbGncsmluZUKy+7s/Zxo1TXEQD1PloykF+1/AiUFIeqeiWlZGKgE8TRBKTrxwx+JRX
	xi6S7XnIyKzZQhdY5T4zQMm7VkCl9+D2qq1VuFOi/m8Rjh1hX6DzK/v8eEHJmyAGKo/eLvP12y+
	Y0bLO1aNcGdWNlsvpHX5XmNRYM16vH4ubc/gWBl20Bz959E2jvlRIqBmF9D/+J6hRv/TSKwBASM
	54r0Q2r6dsdGAzBKrUOI7ABOKBWn8BA1m81onHNy5wvd664gm1UXHgmiELnCxxHmScLFxl2J2Xy
	AIp3a5qkQdKpeb62kkqSWtemcQg=
X-Google-Smtp-Source: AGHT+IFTO5pDwjknvUWwhFFT0g4Fb+OGxLnooPPpMroZTN32fq+W0h8vJSj97BCGcY8k0kSqU5MzWA==
X-Received: by 2002:a05:600c:1d07:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-438dc40fd65mr180957655e9.19.1738596759171;
        Mon, 03 Feb 2025 07:32:39 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f28sm192800955e9.7.2025.02.03.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:32:38 -0800 (PST)
Date: Mon, 3 Feb 2025 16:32:36 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC] driver core: add a virtual bus for use when a simple
 device/bus is needed
Message-ID: <Z6DhlC2t4R5vHtam@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
References: <Z5Nw8kaieLueWyUu@pollux>
 <20250130212843.659437-1-lyude@redhat.com>
 <2025013159-shabby-professor-515b@gregkh>
 <2025013140-propeller-dirtiness-6cb4@gregkh>
 <Z50ZuzrDn-GQWOuP@cassiopeiae>
 <2025020106-avert-senorita-4181@gregkh>
 <2025020306-overhang-glider-7d42@gregkh>
 <Z6Ch8O-0oY70Jhi6@pollux>
 <2025020307-cavalier-knapsack-7f89@gregkh>
 <2025020300-carol-emblem-07ff@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020300-carol-emblem-07ff@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Mon, Feb 03, 2025 at 03:33:32PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 03, 2025 at 12:25:23PM +0100, Greg Kroah-Hartman wrote:
> > > The more I think about it, the less I think it's a good idea, since it'd
> > > probably trick people into coming up with questionable constructs...
> > 
> > No, I think it will work, let me do some replacements later today after
> > I get some other work done, I think it does make sense, don't doubt
> > yourself :)
> 
> New version is now at:
> 	https://lore.kernel.org/r/2025020324-thermal-quilt-1bae@gregkh
> 
> I've renamed it from "virtual" to "faux" as virtual can easily get
> confused with virtio stuff, and we already have a /sys/devices/virtual/
> that is for something else at the moment.
> 
> Let me know if there's anything I can change that would make a rust
> binding simpler.

I think this should work, for vkms we can prefix the names with "vkms-"
and then add whatever the user used as name in configfs (the instance
directory name or whatever it's called) and it should all work out. Unless
the user does something stupid, in which case it's not our problem.
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
