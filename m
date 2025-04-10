Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C221F0994;
	Thu, 10 Apr 2025 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266076; cv=none; b=d4SR0OlsdMaMC5rqd0NJYx2LaHIrWXCB8P6WgAhrqimB68DIHawk7Qta3cd1g0DF/E/IMKXCTdrWLXgqHmNBufoJ02uO4DOUjWQAC2UFnQWELeQzsHWr+USPhjzNh1cF4qJBolOilD9Orz4lKk2AXJzSNtJgRmNQ+XnhDmyosSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266076; c=relaxed/simple;
	bh=7xepqlm4gCU/Ww3EhNzYHo6ZFL4CPZCCufVKyvfw45c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4CiT/bfLCacIuu5zPJBEpt1gyE0BisDfbLibSAf62LEIpIKxISz9+xg9Ackq1OTPCh6llO89+ETVQmjHs054+dd8/peiEsul5/5i+mKvhsFXIqC9e3FOzn5dRnj8totBJmaMe966O6Y8fiBpqOUGLXClFLXzJ4g9e2K475uvlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCRbJL2A; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCRbJL2A"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso94652666b.0;
        Wed, 09 Apr 2025 23:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744266073; x=1744870873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l8HXpljqGzNKzwWw8Wpk4q72W4CJWSNEl4nwRLmttsw=;
        b=fCRbJL2ACq6AnjNz9g005xuNWw9CqEnHsn7dqBKl/l5jGwbD5Z50v1SzoPLVefXUoP
         SwinWijg4wOLwa0VhZpkwkIgm7Bqlx7rLOpznVZJNE8sxBC6u4lCpvbO84vdZosLlpdl
         5TYi1X5TqO0XUbjBQ3yrzHvjW2P1cR+Lubc4t0H93FEElJDVonRswCD0giR34gbFYyvM
         SQDW9NkZRzz+vdcUbcdQlJe5F3/rAXckkMJvi7r5I7FaLu8tUgVcxqgaE77mtnh/6p5E
         q+C/u5PmI9PJa0fh2/PzG4eP9C/av1JTIZxiQQM7yV3B2qw94uAW6jmx7M0Jv/fvXv7u
         MrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266073; x=1744870873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8HXpljqGzNKzwWw8Wpk4q72W4CJWSNEl4nwRLmttsw=;
        b=oKHPYYjcEerz0KQgkCbou/P0HKLAvGgKSAq5t9R7dCF338zU7YAKmEWfUcborcuBwJ
         u/cNTRhGdBexXo5qJ7cqIOcDtu++ICC5DyqpfSzy4xeYTpP9O3eDGd3me5TPmGRUmvk6
         3YXSKKAjGPikzUlrO79HvGUyzT56/LtbIUokjDcJNAXxXTvcMBrVyZPp8eIh+x7GADtG
         DvpEH+Nn8u9uXxLEf7adJm9M7Bg5XItu2HC6NQ/sW8P9PB30Ca4ofN+5M7nJ1nBJ67fu
         5UdeHM6Lh4io9CGlGQfjzRXf+amrC5jZ2/vKouqYKCCMd7YeRkXbuU4S4bmuVcEOge8z
         uTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8JWpShNo8FxH29B0Bbp1k37NuqHvJtMhS2RF1v8GIi+00xbAHe4xVdn0PYy4BP4uW2RMwiVWega2pwUA=@vger.kernel.org, AJvYcCUoldJZVoCebB9QB2AQ0M3YrbUHIRiigfb/P0er+9mZXC6w4K5IKHYxnBQf205bttfuGvg5ewokNFYxdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjruevbAUj9+yNbJW5CVk6lhkeMpxd6r41Xr4wT1JL8dTvhigm
	hxpFrS27Vwi46jrT7hQhAUbBzr5HquckFKYEyvmN3M/+3o5vuOMe
X-Gm-Gg: ASbGncsLL9oBC8ImKSpIXkE/wqj03EfD1PAnOkxr1b1hAnKM/+TEvmcvDZgo3zlgnjD
	NWSQ+nnys2xBXFR8sFIBMFQI7qCqji6Wpufz4oXBswu5hx5R7hGvu2ZhoYWvkZSqLmhsIiooT+a
	pwvK7q3Mbn088m2gIkuCsGZ561DyRMKoB1X1tVo9EboyX3fIV093i37kq27eYyHuM6s3F6iGnLo
	XShUuoIXWsST//7hZO+ctDkPXBoC3HoORb5e3b2wFuzgTKmvpZZyw2mQGyPR0/MFol9k+kT1sqD
	72adXC7XTizslRss78bLmoWELlhwKruOvmBt5g==
X-Google-Smtp-Source: AGHT+IGElzb5nlkvHFTXESPjcNirPfs0j76eDgiqhrMtnUzsJRzei3Kmh/hZv/M0UpGQr2hf/rZmnA==
X-Received: by 2002:a17:907:96a5:b0:ac3:d19b:e07f with SMTP id a640c23a62f3a-acac0334f91mr78923366b.41.1744266072202;
        Wed, 09 Apr 2025 23:21:12 -0700 (PDT)
Received: from pampelmuse ([2a02:810d:a1:6000:959d:6b59:1561:d2b4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9c37sm213073466b.38.2025.04.09.23.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:21:11 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:21:09 +0200
From: Gon Solo <gonsolo@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v2] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <Z_djVbSqYhKM1ZAO@pampelmuse>
References: <20250409-spx-v2-1-168115798db2@chromium.org>
 <Z_bbHP3JeRh2hLe2@pampelmuse>
 <CANiDSCvLartP0qB1WN0AaqJ3KP+aOhw0KcPGMK4oKx=QpjV-DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvLartP0qB1WN0AaqJ3KP+aOhw0KcPGMK4oKx=QpjV-DA@mail.gmail.com>

> > This is not necessary as it was Python's fault and is fixed by 3.13.3
> > which came out yesterday. I just checked.
> 
> It will take some time before this reaches all distributions. This
> patch is relatively simple.
> 
> I might be biased, but I think the benefits outweigh the cons.

3.13.3 is in Arch core-testing and Debian unstable, Debian stable's 3.11
is not affected by this bug. But I agree, it's annoying to be hit by
it. :/

g

