Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BC52FEE39
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265682; cv=none; b=kRJJqp9zIdoT7sTY61rFyTH9PWOCbFGldzkVElgD+VtmSBAUqo8zMsiUwPAQMkkx4Zr1wh5Yc/kn0nLe35zUXnxXckhDiD4RptTgphQcEi7eK2a5RdIifPVuuuzDvU9oEHKoLIXKPfcrGBaPKUTFRXCLu+DAcgGeYW8KnR5Anqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265682; c=relaxed/simple;
	bh=sXlM/5b6UbLkhX3RwTHPV6FZAK/HSY1yU+UtlGN4JQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSy01Uu27jCOlTHBguTzSz9P/zqFpi1u27Z2Bb3PGdPo3hR21Tbw+oqgx6c1oT6cbEZ7wRNIrEE7U1yiZZIj7SsCOimWz5OSDlkFAWgHH1EAcCVOxHEOhepPLJQxmYG9GTstdFq3wDlCwnY+nOn6NYDzQtluWhl4lkKo6gmXQ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZZ48aJb1; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZZ48aJb1"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-408d7e2b040so4370329b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750265678; x=1750870478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
        b=ZZ48aJb1dMdpytzm74junYZ8Q+Zxr0HKOLUY8GU7LcZGT8KsJW4bRX8oDXCB9MQfGW
         doigudOaVfs3errm7BS6qWAuRyZ8WEjMHQDdjOJle7J306Xg7Wi8AhKnwN1EMpj7ovHN
         ueToXRxF2mFKjYgjL+iuYfMuyDBmM4eu/bswkBD4elxJlJu5sD/zSzIBKM8Yij4LfT78
         kOVgBpol8j24TrrGtLlMzflYQHig+eHy/TfaWnhgOZiodNi7SwD7ODGxl0DRRlVoDob2
         UfQwmo9lSm+7dT2f8UF4InJqBa/vA1iS0W5h2IgCpLmy3RaTTPbZHf/WBJzRAuBqBi0o
         lwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750265678; x=1750870478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ2gcooOP07f9omnCEawJUw60wsToiKqAdT6b09wVWg=;
        b=g+EtcRTsTgmFuZYbyAkovVaCYzy6oJ/49r4xYfNZmBtZuY0yWhDa89JLzFTYjaqJOT
         yzV79kWCBOGhbIMcdbma2GkzCZvm15+CbIeLzfnH6Xq6LY9ULfJdX0xNTIsGX5Dm2Zd1
         RDGZji+ZvArGZ95DXdwCaTWlZH9Pf84JaWR4hIPd2JekZ9sUYrUowIPcx5BxjdQk4+o/
         RNQ6gSg+q1qW3o2yRcASoHBPq00J/aZcC/IV5Ys9NABt4szPzFqnFbGJvv2fJnUaLtCZ
         aUFSzB4TLY8SZGWsD8COmKtAFfBaq0GkPBOunfeKp3hageH55OHGlTIuIMMAL3I1RdBa
         4UkA==
X-Forwarded-Encrypted: i=1; AJvYcCWKbi8n46XsqGXW9YEXg1PCvumdlm5fRagGqzbvatp7UGEShTtiOKgjecbzMxq4beYgrQp+eobTpypxM4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2lyNYdHH4LIcAHwaFWHG2zppgTRwRXKVQwbzHbEFP47DawZ0A
	28UtK3TByLEPfY6UlAPuI+Z+2bDaxXfF2XEpW2YOwswCpmIhcD2PNma7VhUe3/HyEl4=
X-Gm-Gg: ASbGncsg+pD5UDm9yjV6pM+IVYwIny5DLHF/E7mcgRuG/8sQfPNa/UmaVZ3HhNI1m2p
	DkfynTBUPVMYuzD49X9/PW4bMpBW4hrN8RpEVQMSoctfimKkzZipEFEGGLO6sJeNbPbP0pqGhKm
	8jAs7f9vgqLMCxNTLRVJXVmzDfpE77PV9Fu1i4by6nQZfR8LuRz3R+hWWJYFXjxi1T3nc6PKLnI
	2L0q5oIRDjcIqw7diEJfpANWwE+qButg4CoIzFUxghZu2hHX5+mquRW9LHLV0q8qzIsA9KncBqH
	iGSOjveRMc0MoBvkAxnKKbOdaSNjwngLL3Zw5oBN3FUju04It/BIUKnS+yrGrX7NEM5ZZg==
X-Google-Smtp-Source: AGHT+IGZt/Sr44zCZuiDpdUzJJJDzC8/TeAfQmItZfKDDSRquAFIHhPkjBQpw4diPA+6hMtv0/zkrA==
X-Received: by 2002:a05:6808:3083:b0:40a:54f8:2cac with SMTP id 5614622812f47-40a7c196bf8mr13387419b6e.37.1750265678596;
        Wed, 18 Jun 2025 09:54:38 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b2808sm2399744b6e.6.2025.06.18.09.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 09:54:37 -0700 (PDT)
Date: Wed, 18 Jun 2025 19:54:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frederic Weisbecker <frederic@kernel.org>,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/selftests: Fix error pointer vs NULL in
 __mock_request_alloc()
Message-ID: <419d4155-af68-4264-81df-f882c481534f@suswa.mountain>
References: <aEKvMfJ63V7i-6xU@stanley.mountain>
 <aFAxtBT7z4XphADq@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFAxtBT7z4XphADq@intel.com>

On Mon, Jun 16, 2025 at 11:01:08AM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 06, 2025 at 12:04:49PM +0300, Dan Carpenter wrote:
> > --- a/drivers/gpu/drm/i915/selftests/i915_request.c
> > +++ b/drivers/gpu/drm/i915/selftests/i915_request.c
> > @@ -290,7 +290,12 @@ struct smoketest {
> >  static struct i915_request *
> >  __mock_request_alloc(struct intel_context *ce)
> >  {
> > -	return mock_request(ce, 0);
> > +	struct i915_request *rq;
> > +
> > +	rq = mock_request(ce, 0);
> > +	if (!rq)
> > +		return ERR_PTR(-ENOMEM);
> 
> I believe we should fix mock_request and make it to stop replacing the
> error per NULL, and make the callers to check for IS_ERR instead of is not NULL.
> 
> Then don't need to make up an error here.
> 

Sure, can do.

regards,
dan carpenter

