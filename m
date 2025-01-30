Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC6374CB
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738206819; cv=none; b=m89Y99dX+kuDxL1KG2coduvrBMkIKEfRup0BjebbAoV59xO30Se+fm0Xx2j5PWj8Hn/k0FwqOV/CSNK37c3D+a5B7hxiwuGw0bnQsE7erFSdENnY6AVXI+yg8/w03jELuRbKhnwS/cp7WgSQFsC3wLIe78if5BRfIit4nY6BTa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738206819; c=relaxed/simple;
	bh=TnNwPULM3qxxhbCJzulo64kP7mzIhD4CvbwNe8fETsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1Mnmhh/CwndZdOcZ1z6bTjmYeEVccwypgqeEp3kscfyOpmpIBiqo64QRX2jf5hYCvzUcMRc1IiYmwXDbjeLuxOmmxdPG45QntnilksRBSuthGtTwk6SKRk17PJw/SgS9QndbeMjdrWa/G/q9U8E+VrqfyS6bpYblyma+n3R/Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NkdfismZ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NkdfismZ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21628b3fe7dso5036465ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 19:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738206817; x=1738811617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0d/x93cfOESF4wEEDnC0hGURXS/QAzV1kY7U+07m9Ao=;
        b=NkdfismZjS5o7Gi/UEfKuW00/jVccuaxcQlFW37lh8EIPOSODOQh4IF6++ZLtf+MMw
         cmMfZXWzjfVw3PFxtGt293A4B39KfVmhl9Fn7jcrLUqnu9hJf94DbwQ9TaG1TTGzI5Km
         DIfy+2OyrVTxZS5IZgFTAx5honoJPwD4o1ZiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738206817; x=1738811617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0d/x93cfOESF4wEEDnC0hGURXS/QAzV1kY7U+07m9Ao=;
        b=kCZ3kY3QorV1VfyyZr/B0gKJdMK6wyrhxi8VRt8vMppVn7xrcLO8xwJTjnGKp+l8Qi
         xFjzj8AMikL6H/EH5oNNNl8DKHpXDzd3paDLLLBa50O+mMCgUmukaKLg2x2N8os9eDtx
         1nyWKIujWfhdQt+AdOZqmLx94Yf0ZhSvOLCa1fxh1HMvJDbsqqAswPuct8FuUAw4IAEG
         n7Jvg/nwhB1JS5trQF82by4LStchEvf30wWmIUlLuVdvBONH1OGllB54ibWqbDrMvOHw
         +m6BKYm+dDgpWwdVuHIuFmLlP69wPN3YHXnKvvZL+xHTtN8apPOa8aeIADaqdL6wJNI/
         55wA==
X-Forwarded-Encrypted: i=1; AJvYcCVLc0ITtbFVf7Am/Oi9nqytrFQOE3ItPsyy8WH5atnPHrd8+bAIF50lorhSoB9SzIAY51xu0DoQeuEHIac=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDwPnqOc0K6lOSWcK04nN6DadIy17pMkDatCE0DjwcdFlMf4/g
	IRo60aB/aRDOv3eQVo3n1o+CCwPYcFg4Z029cwhL24NDOCvtDnKTiEB9/DroWg==
X-Gm-Gg: ASbGnctDiTV9ust4274AGlc+mhheY0BrJ0QWrBhYrxO1kC+fKPlymGF/97ApdYKExah
	H5hXkElKepT3DOVeMsZ6qvYxH0OmhLgGVwDax4L0ZtWrGMJ/CILNORHNWRQ9rJJWNfyxegyXnOm
	T5+xhED77KCOkqKsgBc1CryptiCE5rcJjenIP0Y1SCEpjALmIZZQCI94LSG/RCWm31+qLxbnRFV
	xWUXscAtTB4bhFmiB2p1kDS84VgIcr84i0aUP8+yeOvQdMoLIapSiveod7zYbSR4vdLbYuhfVN3
	KLAtpPzA49n8NN1wQYo=
X-Google-Smtp-Source: AGHT+IHMvgMo+hF/AxtfK+k7syVnWQr6BUsniUgYeHe/ZSrBpJ2U0JuLW0j+hoXy4PmVonRvvUnGnA==
X-Received: by 2002:a17:902:d2d0:b0:215:72a7:f39f with SMTP id d9443c01a7336-21dd7dde360mr86703095ad.36.1738206817006;
        Wed, 29 Jan 2025 19:13:37 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ed647sm3368245ad.133.2025.01.29.19.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 19:13:36 -0800 (PST)
Date: Thu, 30 Jan 2025 12:13:30 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv1 0/6] zsmalloc: preemptible object mapping
Message-ID: <vbw33jnoxvwiuirh3474z7vmjfnai4xowrwzss3v7hknhpte7y@txfwwucv2ljg>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <Z5pPDV3Ub6EeWCxD@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5pPDV3Ub6EeWCxD@google.com>

On (25/01/29 15:53), Yosry Ahmed wrote:
> On Wed, Jan 29, 2025 at 03:43:46PM +0900, Sergey Senozhatsky wrote:
> > This is Part II of the series [1] that makes zram read() and write()
> > preemptible.  This part focuses only zsmalloc because zsmalloc imposes
> > atomicity restrictions on its users.  One notable example is object
> > mapping API, which returns with:
> > a) local CPU lock held
> > b) zspage rwlock held
> > 
> > First, zsmalloc is converted to use sleepable RW-"lock" (it's atomic_t
> > in fact) for zspage migration protection.  Second, a new handle mapping
> > is introduced which doesn't use per-CPU buffers (and hence no local CPU
> > lock), does fewer memcpy() calls, but requires users to provide a
> > pointer to temp buffer for object copy-in (when needed).  Third, zram is
> > converted to the new zsmalloc mapping API and thus zram read() becomes
> > preemptible.
> > 
> > [1] https://lore.kernel.org/linux-mm/20250127072932.1289973-1-senozhatsky@chromium.org
> > 
> > RFC -> v1:
> > - Only zspage->lock (leaf-lock for zs_map_object()) is converted
> >   to a preemptible lock.  The rest of the zspool locks remain the
> >   same (Yosry hated with passion the fact that in RFC series all
> >   zspool looks would become preemptible).
> 
> Hated is a big word here, I was merely concerned about how the locking
> changes would affect performance :P

Yeah I'm just messing around :)
