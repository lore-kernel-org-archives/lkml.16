Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FEC293B46
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788979; cv=none; b=QvDdLYfkJjzSBegC9wGpqkhUalVlrw9eWNY3QbOLMS6i7VhENuu3SWu+vahvOQoyGl8udKmLgKBYq4Ai35gtfq/6xoRuh3RutOf42tK9X6ByuMJ1NW4q6PXW8NoYoXUoMuuWtJq5ifb1t88nXNbt262iV+NSEy6NVHl0cCBT5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788979; c=relaxed/simple;
	bh=DA/D38PB76BVpZicl9d8McqLird9x5AUMZVDHvIa5Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAOmCvXJV3G2PmH2rvA2+6kWpn3T1QAs+9uW/cd1R5lTwBZezz9q6SVT7Ke7pZ9QXNXB5ss0wv+bXs4F9vSeacmRM0TDLHjX6r/PhFEQSfalScqOo/yIVVaXvK8ihaDqA31DZOmrzVGh6H4DNY5YqHcn7n00Odtrj347PjcVBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Hob0j6YN; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Hob0j6YN"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a44b3526e6so9173071cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750788977; x=1751393777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RUtJ9tEA29eCjDyOeDq5s8JDWFGttISewMfomLtSMxY=;
        b=Hob0j6YN0h3KLU+6VmkZ6QuH8xtxGbZHNOWQaJa3pCHZdbZM21YX27pnysdRMpNOpb
         UzMHboljgSpQXKNI4Tg7NfqQTfiluCQzro4N/OVMRYzHWKPXCT20EjfBCws68pjDB7FL
         OC/xAiIoN3sEpbxczwx6FugEYJ9eAdcL9e1SUjQHW8P55NlkZ5PrFZKt8vmyRtPsMquh
         cW7L6EbnWkPS4KgC0E8HMZL3s9mWjQ59iUANMR8zMzUjdLplnsEMxca1400FfA4sj51p
         jWgOlSz9ThUQbZsMdhESayRiq3RFbc101exJ98nAzAzkYQvkp49AJtgAQYcZyrvy63jQ
         RZeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788977; x=1751393777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUtJ9tEA29eCjDyOeDq5s8JDWFGttISewMfomLtSMxY=;
        b=hU18OZaY041Z8uZMu7XeQstzYy2W0/c9OIMEWCogii7FQqFAJ7CL25a29qCbi8Ute2
         x+0zbZk6hYQpgIubcLR6r2WrtU7SHX1c02PloRXde/XS2T7/509AW1SvdAmnU5Xg68zy
         KVngCnvbYiXuWsL0PJbUaHoC2l5u8UFYg1c2yGh6L2/ngZBK6Y0f3ll34lHjyIam1dQb
         XvPwHXj6ZaO1v50ur7dAofUIHfO8eMbUE1Rz7XxDf/+bXGJEOj93hujzgZEJiaWvUTNF
         M5aDLqGMIqZ68DZDrfzOFxuGhSABTmJ6y9sYmsXorSY4xH8LTlJ/5EZ8g7Lq8AyB+xhE
         5T3w==
X-Forwarded-Encrypted: i=1; AJvYcCVj1HRF2VBN2cPU38oDYfpnKdmKf7PVjeJFvrTrK/VxYY3ScQxwHDYgrPGJrC3LoSpj+GkezPEcRvre5xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCHkUXxv3M708xg7c8C9kbEPqoEgPc4JQOFUkRwezUn35JLbZf
	7XwEPFElHuAZ+rSLE61d13VSAzQSQ6JWNOk17Ji+mQeoRK9PWGrM4x1YDjZTSt0OxAU=
X-Gm-Gg: ASbGncsSDzZ1KVgXWhbXOVM3UTXBZpZwYQsI/D7Ti6i2GhArgtfLCk/9RxGHd882clA
	EOuAkdz799mEz7YW14bCFavulkBCUtpQmiAzPvraetqFpNPJ/DxT4zPiX+Bce+J0uge5E+S6hq5
	80nDbaKK1/2t62or0BRo1B9Q3Sq39l0XPLKwk8Hh3CndlGFxeD6nZlm/uy4++tPe2qksdWiiIgg
	oeOOk5iUqQkKFHPwA5KbpcY2fUFGi7UqtE6Y6VfM1Xav4Z6x71FJV7hlYpEgJBotXpSSmjSmZNr
	cx9jIm35prrYONwyo9d0z6UfGxR1CwGoPkKU8FpHcie6OWtblpKJE4m1rxL7aMsKCwwaWG4Hk8y
	XHDy4Cb5GyxexuxuYBJbgVNAHIQssG18PmGypRA==
X-Google-Smtp-Source: AGHT+IF6I3w46MYeQWneTxqWC3YDA/b4GfvnKogo4xGCeiX5WBI7oCdnuJ/jwqVwtuKe0ddn/P8YxQ==
X-Received: by 2002:ac8:57c1:0:b0:494:a30b:e27c with SMTP id d75a77b69052e-4a7c080060amr5144121cf.39.1750788977151;
        Tue, 24 Jun 2025 11:16:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e5d2b3sm53372151cf.43.2025.06.24.11.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:16:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uU8Bs-00000000hCY-0nqw;
	Tue, 24 Jun 2025 15:16:16 -0300
Date: Tue, 24 Jun 2025 15:16:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, peterx@redhat.com,
	kbusch@kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Message-ID: <20250624181616.GE72557@ziepe.ca>
References: <20250624005605.GA72557@ziepe.ca>
 <20250624163559.2984626-1-amastro@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624163559.2984626-1-amastro@fb.com>

On Tue, Jun 24, 2025 at 09:35:58AM -0700, Alex Mastro wrote:

> > The userspace can deduce more information, like the actual PCI BDF, by
> > mapping the name through sysfs.
> 
> In the vfio cdev case, <pci sysfs path>/vfio-dev/X tells you the
> /dev/vfio/devices/X mapping, but is there a straightforward way to map in the
> opposite direction?

There will be a symlink under /sys/class/vfio-xx/XX pointing to the
<pci sysfs path>/vfio-dev/X directory

And another symlink under /sys/dev/char/XX:XX doing the same.

Jason
