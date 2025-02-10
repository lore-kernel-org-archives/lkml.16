Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D3C2F2E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739175349; cv=none; b=kmqKRBaVjV0VSolQ3oFXlm7qo5RWlmW/Ntsi/7hmrspGb+vNYDaIUMaRMZ+u3M+w8691caEMfbQ+cZ9fWsvmzCjcm7xPh+EcnDl3bqZ5e4o+nanMEtPWLy3uRSAP0Gqd8eh8zQ/raW6SgV+wKj8OrTviWqnLTOyTyM5GgOSptaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739175349; c=relaxed/simple;
	bh=nhBe7JI6RHHOjcxbUYkg7spziIQy6QIjVwXBPoW/sFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUzHS7G1p4jai4pRN4w9ayHW32RcGnZFwuygpB6vHX6ahe7KlUM6PGAGuk+yAH3tI3Ra6W5bhy4q1r+vfzJyoYMkXAankGxAtI3hPksYJsule6zuUa20o67Z5hVGjshkDVZ8g+//trdZuK/fr+MObW87o527hnLxvaNa6ZtinrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iomRLUpc; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iomRLUpc"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fa2c1ab145so4687088a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739175347; x=1739780147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ml4rSKpiSvTQQDtnOz6xcoonf4YdYnP7/dhLitCjHE=;
        b=iomRLUpcENx84iQC1XB+JbImwVoZbdeP7YTKWsLgjnfDCcPUnqtNyPq2UNBqPiWIDh
         uzREu55RJgPLKfGUdRCt0ypQjPvSsW52GVUgaDA3dyT4r5RvDGlxyAk7ncidiRC7S4G0
         t1TGn7W3ZreelKZsaKUbWZ9lpZFpX01ODW7DJEByjZmibJFNT6WQQWIV1mccuBrqfXJJ
         vAcKXr0bHtZWevHZZ9QYl2ncoMQ9rG34l3wx9hfjcO4V6S/aprdYzZBbI8ByDTRuGi4a
         8VmmCKjb0l5xCk0gy6RpD8QitbACRxfCq9e9GQwgT0t+2ZKWflBAqgB5v24Qg4rjQje+
         RaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739175347; x=1739780147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ml4rSKpiSvTQQDtnOz6xcoonf4YdYnP7/dhLitCjHE=;
        b=B2Wqo0OIXFBmZSBRmAS0onz+4xdrGL0MQBjqXIaqjDQJ+3ds5LsScGXziAhfv151b8
         mS2oy++w/YX69EkGRhRGf56Kn0Od3Owo1mkLRUCRoY6QlmIfftezn0T1D+hbiX65cove
         YQfDcSGCatNsdBkmS+HCYh8rDGHu7HNNVpvfz9aJ5u95+ik+JzcJWQvkhFZG2GT/LDQ6
         IhTZNfJQiDYm8+GcZy8kyQ3cnfFitJjcZEGORKJjm9X2WxsaYFiaPhQj4KM6e6FISJnw
         o8VC6OWjP+m9D1z7iUdKP9DcZhzTjtjBF5j9pLRh1YFcDj/VWU2lOeovHsQc0DrFZ/9a
         AeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU32qt5lqkMEKOol2XANmVArMJnGUVynjB8In7YTweJ7oH0a8qyRLrOW8gzxucCb1B/StA9U4NLWbfLcbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPb71iIT6bM3Ieg0oTQwPau4jMKxVSCR2GLygMzi/j+K1tFSgu
	D18c87pcy+EkkzSdBGcHNk5mEEkAw7a/FnR4gq16PS0ovy9IJ3qn
X-Gm-Gg: ASbGncuPAafpzEIxBgcrKNSYBDK7zYrwhvTYdXa/Ql7DkjKrzFcVADaRXRgr8fqGbCe
	VjnVpYjpcfjG+RgMfePvaupo2ETiI07E4j/8Qumuxj1cl7aYijkxVHoSgQC6mPer4aj0BPmMpQO
	fI1gQpxbAonQrTmmpRco/GWcujpJ5Ah8V0EaUvu3RwYDlv76yXKdXLFitlNnrtTfEnZWc3FmhKB
	o18bQegoacbthigEii0XKXlM71hCMD3ieuS0PMTCQRbUC7eNC5Kf70MK8SSkf7ffec3KFNtUauQ
	+M9Jy5Hj4kMobT3Z5DM1Q9x89u55gy51
X-Google-Smtp-Source: AGHT+IGoDbkTWPSTheqmeHSujVB/iFFj1uuZWFHQ5fFwT+0nDgJOHi3qnHnnI5ud8S3TbwU/4YE/Rg==
X-Received: by 2002:a05:6a00:2308:b0:730:8d0c:1066 with SMTP id d2e1a72fcca58-7308d0c27ebmr5251641b3a.24.1739175346752;
        Mon, 10 Feb 2025 00:15:46 -0800 (PST)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:83e6:5a50:60c5:d373])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7308aa3a1cfsm1799436b3a.137.2025.02.10.00.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:15:46 -0800 (PST)
Date: Mon, 10 Feb 2025 16:15:38 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, linux@rasmusvillemoes.dk,
	senozhatsky@chromium.org, akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	shuah@kernel.org
Subject: Re: [PATCH] vsprintf: Drop unused assignment of fmt.state
Message-ID: <Z6m1qtlyCece4e2g@vaxr-BM6660-BM6360>
References: <20250205172508.55358-1-richard120310@gmail.com>
 <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6TWEHvBF0HOxKsY@smile.fi.intel.com>

On Thu, Feb 06, 2025 at 05:32:32PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 06, 2025 at 01:25:07AM +0800, I Hsin Cheng wrote:
> > Remove unused assignment of "fmt.state", in both cases the value of
> > "fmt.state" will be overwritten by either "FORMAT_STATE_PRECISION" or
> > "FORMAT_STATE_NUM", the value "FORMAT_STATE_NONE" isn't going to be used
> > after the assignment.
> 
> ...
> 
> > struct fmt format_decode(struct fmt fmt, struct printf_spec *spec)
> 
> >  			spec->field_width = -spec->field_width;
> >  			spec->flags |= LEFT;
> >  		}
> > -		fmt.state = FORMAT_STATE_NONE;
> > +
> >  		goto precision;
> >  	}
> >  
> 
> While both are kinda redundant, this is not obvious what's stated in the commit
> message. Yes, `goto qualifier;` is straightforward, but not `goto precision;`.
> Which makes me think that these assignments can make code robust against
> potential future changes to allow to catch up the wrong code paths.
> 
> Whatever maintainers decide, technically the change looks correct to me.
> 
> ...
> 
> >  		if (spec->precision < 0)
> >  			spec->precision = 0;
> >  
> > -		fmt.state = FORMAT_STATE_NONE;
> > +
> 
> What's the reason to add an extra blank line? (We have already one here)
> 
> >  		goto qualifier;
> >  	}
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
>

Hi Andy,

Thanks for your kindly review!

> What's the reason to add an extra blank line? (We have already one here)

Well I think I didn't intentionally add a blank line here, I simply
delete the assigment but left the line there. I'll have it deleted as
well if the maintainers decided to make any change.

Best regards,
I Hsin Cheng
