Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297091C84A6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751457702; cv=none; b=I6omw6BiXwxZpgqUQIU8YWvGZn0f7WlC/DCkP0tkKdnWr1/7l/pN8kWZmZRPv5NyjrSf6G0/e0bI7KnU9AcjxagBOK8BvAZuJGBV1ApP784RMPXnb7jzDngEmbTHQPjc5kjIzGwQUpKYoaHwOJ1TBmCorE9p3LhulHa5bR6aC7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751457702; c=relaxed/simple;
	bh=nIVOyH1pNNhYSIg0y80x9hchFkRGUaJXVGD49xjbamE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK8wHFrvmX7jR/VsFy9ruORF8juJxSG1Gnn417xTaVZmMOEZSq/QZi1CArpGRm3DIGgvZvRdr4vSGqKulVd6o14B1YaTJxbFt4hNWTPqi134vWUCt/dOMQaCUVzqkAeDmHmo2MBhjQ20iB9FLklXZLqkzwXUD9tTSx+r2QkVJxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=HgqKojtH; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="HgqKojtH"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so3910438f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751457699; x=1752062499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GP5yXE53ih0sxTNELPBB00JWDnKqbTnSZYff+1z9sqA=;
        b=HgqKojtHbQIpdtF4QNdC33oTdaStSRuXzRCoQF4Cr2opy0KITR0/uDQsHhcBSgUgIZ
         B9nri9yh9WhwPVki3PgRAoF7vU/xPKBCcIQ6hjzlr/vrlxmK4QcWXDARD4S3B8mA1nIr
         n/tQJZVD+39Kpw/cVjcmzZIE6BjC0VVemiYNmYmPMd6ALH11saxnEkVlOXyT4spcSrwT
         MxL1N4F660ZrphSuhgEzGGIWJz72mub91F95y0osSA3c+NmQRZsYkUVsF5toOoNB34Zi
         2lkSv0/c7cWxzGIJORiEr2BqaTe3ljRKsSytEqjKMtly4g0rN6Wp8Jxu7Lrxx6GaoRKm
         hiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751457699; x=1752062499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP5yXE53ih0sxTNELPBB00JWDnKqbTnSZYff+1z9sqA=;
        b=fr6akIgP0IZ0HZVS0rIzkupXR/KwrYbEUbO0wgf3aCUhP8MMtefU0mog2qXzoy01bi
         DT2WBC4mD/qWyKhg3CEI7Le6PGWrDxB8373osK5N1Zh25ZDsk5X2hWldymFHrTCoU1Xk
         fX80pQ4t2f+8qZ9VseW37B+PnYCNPMWtDlVH7H5MmJsD5+S/v7gGS0A9E2BeOhSwj1wX
         il+XI51iLNZKQQYWP9eYbHjY1ws1Mtzy+VI5baIDswXqkjBpoXIY7LuiNCnNsuC52TGz
         wwoDmi8IUYlOMTj9e0fE8d4YbmERYXMR5T+rAdKtAi1YeQHtNVf4bBSH1en8gnZkgcoF
         Tv4w==
X-Forwarded-Encrypted: i=1; AJvYcCWisde3Vk20/01WrKVU4QnshG+iWT++V4F0RoPkZwUbMAvdoKb+/NF1ZNxjidked0S5siJvvgTd/qFysTU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3/22LItZoA4e1q3j42o2JzQq0U60mtM78b18b2WbvXB30IKFx
	AOpPjwnVxoS1swvx1XAWoU0SHi/cc+HBZmM0X5DPIPRn9G9H7x2c5Ga3JCw8uXvUMNc=
X-Gm-Gg: ASbGncvyz7H7eYvodW9xeUzsC2RdLVuipiOFmqxB8o1P9gLDbcYXnn69yHt4yIJn1IA
	Pv7DCj1+RdTgc6xNf4mSbTpvF+1hkC+eAta+4+RpfbW77RMvM/MhWS24+vbrJhMai5M0stYZb66
	4N23hJEqW0tNeq12qtVQ+KviIIF/wbaW42u0DtbEjZapOhw3EXsee72hIz+MT0yKpBsfRTtoO/o
	cDzxAKdajn71Oh5Aqwpo9XDTMZq5RZxvQS56AFB0EG3a0409i9nl1f3zOMi98EevucaER2XgNf4
	cNBP80gigPEFPgYNn9We/QMdUQbExK5hX+RpFm6dxUNaWFB5vAMGr3gjTHNVjz67RbrLyQ==
X-Google-Smtp-Source: AGHT+IHB1JKTxeR2sHIwzZ+aS7YH5ll4SYWX78Jqml5XoTj/zuWa+7i2inAbVYYF2YrORcoFyNx64g==
X-Received: by 2002:a05:6000:23c8:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3b200c3ed50mr1295857f8f.51.1751457698903;
        Wed, 02 Jul 2025 05:01:38 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c800eaasm16233867f8f.37.2025.07.02.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:01:38 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:01:27 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 07/14] dpll: zl3073x: Add clock_id field
Message-ID: <cpgoccukn5tuespqse5fep4gzzaeggth2dkzqh6l5jjchumfyc@5kjorwx57med>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-8-ivecera@redhat.com>
 <amsh2xeltgadepx22kvcq4cfyhb3psnxafqhr33ra6nznswsaq@hfq6yrb4zvo7>
 <e5e3409e-b6a8-4a63-97ac-33e6b1215979@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5e3409e-b6a8-4a63-97ac-33e6b1215979@redhat.com>

Wed, Jul 02, 2025 at 01:43:38PM +0200, ivecera@redhat.com wrote:
>
>On 02. 07. 25 12:31 odp., Jiri Pirko wrote:
>> Sun, Jun 29, 2025 at 09:10:42PM +0200, ivecera@redhat.com wrote:
>> > Add .clock_id to zl3073x_dev structure that will be used by later
>> > commits introducing DPLL feature. The clock ID is required for DPLL
>> > device registration.
>> > 
>> > To generate this ID, use chip ID read during device initialization.
>> > In case where multiple zl3073x based chips are present, the chip ID
>> > is shifted and lower bits are filled by an unique value - using
>> > the I2C device address for I2C connections and the chip-select value
>> > for SPI connections.
>> 
>> You say that multiple chips may have the same chip ID? How is that
>> possible? Isn't it supposed to be unique?
>> I understand clock ID to be invariant regardless where you plug your
>> device. When you construct it from i2c address, sounds wrong.
>
>The chip id is not like serial number but it is like device id under
>PCI. So if you will have multiple chips with this chip id you have to
>distinguish somehow between them, this is the reason why I2C address
>is added into the final value.
>
>Anyway this device does not have any attribute that corresponds to
>clock id (as per our previous discussion) and it will be better to NOT
>require clock id from DPLL core side.

Yes, better not to require it comparing to having it wrong.

>
>Ivan
>
>
