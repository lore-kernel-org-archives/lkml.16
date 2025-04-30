Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1D67DA93
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746022593; cv=none; b=oBEVdq9QHzAZYB3ptqZ+rzJQGo3+2/kSHoe80B2K90NPLK6dEBN6DOM2hznC+bn5xUKV8dd7+ng1PpC4HVqyiLgDPjU+McuWuVNIRU6YICYQsX+2bkBZDvvrIObC+uYMcl3+JOCG379rFGoRZy4lgjj/Jw7D4P4EHI3PB+dnV3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746022593; c=relaxed/simple;
	bh=AVLzC4whPM4VWTPc+bxpJ0J6VswlHdbhpVLvOK4rnO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=neaiEBxhInJOASIiZEfxU7TPxvhg/4r5BMuGbWgVGGYcbiLUrz1oO1gDWPzdIlWZZH16nDVn1ZbCfmh4/1jQAKQcoFF4g0z5HL82TICfk5jqjylXBceIg0AMP4sUzTEbeyvclGIX0h3bp3/nKBU8sgc3XLL10BP1TOlkaHjTems=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ngKm6RbQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ngKm6RbQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d0782d787so45654515e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746022590; x=1746627390; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4YpL2lxVH2obCDZhbOHkOyzZwrFHmrVV/PKeHOtCQPg=;
        b=ngKm6RbQPAgNtAOA7skACgSoOq/rF8hQgtmZwzGCajDUtH9Uo5kAE1EAh/oBLaP74A
         9SHfC/nt3EoDeS/u6Hlcl87k0n4Wscc3YMWRcpJUlZXwy2MWX3DWPKn9WJ2c61LY7cFF
         b3JBG9z1+YVvb2kAj2kLVlCLdvFtqYNWev+3iPFN3QZJJYQ7LbNAM4Ll31YY8uewUnB0
         wD+hvd30JCeT/otWBRXiR572NxBDljRlc+z3l1ubZHq5ThKkFKYALSrrIdCRoPAbGHl+
         HELI8HhWbA1tK32jIMgg8dWSf196k1kOlvOIb7nZEl66ii9gaMKbCBKS1HTqX/FC6+Ik
         e5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746022590; x=1746627390;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4YpL2lxVH2obCDZhbOHkOyzZwrFHmrVV/PKeHOtCQPg=;
        b=HpQxv1lYO9dN1lVELULxogf2LtC6WdGNjrCiZCEAI1eTna9La4JkI+quHaKpmYWmF3
         sw4Cv1A+4cJbHNY6uHY3vWZvc6jrlv03b9Pwh6/Nmu2tuPhgMUt93GdTJjX2IyZ2Fpfq
         3iTPE7zvz+lJzck8yV5Dyl8ZPc9+FJS1p/Zo+9eFjEWkRXQOXAp00rthc7fYhqtg97/Q
         A0sgyYyPYRLKa3TFt9RKRw+EDEcT6ppd2EdO0+HTvUM1qLGarzU6YPSsNSwc1BnXZfQI
         qKt8twyFlnmAoekb6kWOTkmDsLW5zLMTFGm3bcCjocWGXB/eWnTaLrG+kG6shI5e38de
         wedg==
X-Forwarded-Encrypted: i=1; AJvYcCVACkL13hMfvgE1cpsaAcqSS8DrUvINY3wcqOAKlrkafthxYCR6coOFGvc9AflbrditbKywXlX6GC9gg7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCDquNTflW45VqQhb3IxRyexqHk2s8co7AuI/GOOqWSKGGohq8
	IuNYoX6vGCi/2cac96gRqT6OC+Zlcmv2dq046/uLwISUHeXkTlJWTd2mkO8B7NA=
X-Gm-Gg: ASbGncvgOvcLdxwBU2DtxNxp6L+LZMmEefA9hfzLvHGKYQwcQG5/Q0A0muXDgG3mF5H
	uzyLnGeeomwo5sKSSQ7ixsFEAOAOqxVloxgUwq0KxsMgvIwyGdhQIyw3Xu5n0UWTPCRb/vx5rzJ
	aLu/ICrXT4LGFe6cqlKLAyvL8gZNplg40rA1eS39OJlAtILPCRsJAoF1zCrxzJbUKkDtC/9XuBG
	yO0sRRXPBA+varsnnKrCa+G4r+DLLT2E17RGDl4dBToA+uQ1TZ9Vi8AhgxeD/eeLJcB0vKV5VWB
	SqmvvNMeM7OOcZdGxJaT6RC4s5CQS0BTjMOmF0FZbLbFsYxfEjjAvzmsMrGzl/mBGmS+wXS6V0X
	6pFXnXeQ=
X-Google-Smtp-Source: AGHT+IEbrCNFMu0SFw520s5aIW7UoiCgn38+jJzqIxcI9w0ze0IO171/JSl/nJcS9fmtEe2edXcq1Q==
X-Received: by 2002:a05:600c:458a:b0:43d:aed:f7de with SMTP id 5b1f17b1804b1-441b1f5c846mr26732225e9.21.1746022590215;
        Wed, 30 Apr 2025 07:16:30 -0700 (PDT)
Received: from archlinux (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441ad81c19fsm41853825e9.0.2025.04.30.07.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 07:16:29 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:15:19 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Nuno Sa <nuno.sa@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v2 2/2] iio: dac: adi-axi-dac: use unique bus free check
Message-ID: <l6vu54ltxd7pydkzl6xbbq55gedumzbsllfxnljyngwcg4c6zd@w6qxgn2vby75>
References: <20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com>
 <20250409-ad3552r-fix-bus-read-v2-2-34d3b21e8ca0@baylibre.com>
 <Z_alpFoaQQUlWdfo@smile.fi.intel.com>
 <udqm2qkw3yrewmovua54twfzbsfduojc5f5uoj4nptxldpbbr5@75bb2pldwq7f>
 <CAHp75VfpgqNnLOn4n+Tf03mmLFMj36SsV7j06TvhEhyqmmGgVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VfpgqNnLOn4n+Tf03mmLFMj36SsV7j06TvhEhyqmmGgVw@mail.gmail.com>

Hi Andy,

On 30.04.2025 01:05, Andy Shevchenko wrote:
> On Tue, Apr 29, 2025 at 5:34 PM Angelo Dureghello
> <adureghello@baylibre.com> wrote:
> > On 09.04.2025 19:51, Andy Shevchenko wrote:
> > > On Wed, Apr 09, 2025 at 11:16:55AM +0200, Angelo Dureghello wrote:
> 
> ...
> 
> > > > +   if (ret == -ETIMEDOUT)
> > > > +           dev_err(st->dev, "AXI bus timeout\n");
> > >
> > > Why do you need this? The error code will go to the user space at the end? If
> > > yes, it will be enough to have it printed there, no?
> > >
> >
> > This warning means something very bad happen at AXI level. I never seen
> > this warning issued, but it may help to debug AXI/HDL issues, would not
> > remove it.
> 
> But wouldn't user space get the error code and translate to a message if needed?
> 

depends, bus access is done also at probe level, you would get a generic
-ETIMEOUT, then you need to put traces to understand who is causing it.
I think the message may be useful to check issues, like a buggy HDL.
Anyway, would not re-issue another patch just for this.


Regards,
angelo

> > > > +   return ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
