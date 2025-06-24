Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0102E7645
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791509; cv=none; b=td5f/uXW3rki39BFPK7L0olh+ABInV4Ppp3mclmTBnpy11pn7G/KF2hgoLFeUJx+cJvRzmV5AGlYcgQwXZb3Euw2t85yqx/cImkki5hw3wM5KqR1DJF2I8M0JDV/tbifVyeMU4NYedRCP4hvX5vJBpZnQ80y6t83E6Y6tDj8CcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791509; c=relaxed/simple;
	bh=1euhTr1m2G8OQzQdrKy8My4UoIQ7gLuT2G550ln9JUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UwP13G9eepFOmZTxL0Vv5Bi/YYQlOkzNKHh0/vY7JEdIXnwH4rqJOXbX4oLstsVYd4Iwg4u1xrY6FyRNLT24ZGxD+yMw56W5nn0VU4Qzdv3vXpP/0OWitbKkpdaUcarxzvIUwtcSVKJluwvF+5vpTfw7+YRc9DwuH8VPq6e2tGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=c827gbcI; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="c827gbcI"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fabe9446a0so7783696d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750791506; x=1751396306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/dPp8G4B6NbKyt49W8JBKu/RwFw1JJYSMb2wc/ipDrg=;
        b=c827gbcI/fKUBgrBkKz1q1ByPM5kuZTugw44g/ZayhjByUzo/dVeYWx0RzYS9Xbvsv
         mRrob7+RXy4y9I+ed6JojPN3otwuZXRoN5DZzKm9OjxB/uc9yLSM13K+KbDuinaIhdbQ
         Ejzst+nWYiGgDlR/Rhx6lvqNA1NpaxPTzYmF5pZEcYzANpZr3pe65aY/IhC/wMEysgmf
         aepe/kFxIGxVE/puJ6psLWcqSP6yF1c7lND1ddsHE5gsHzneUVj8zKkv4dY2/LH0PAQg
         N6UiAJ8IVoTT2UvoRiqi2ra9SLJjNHyY25CvwR7W+VGuS55ePhdHU4Ybk8VFo3UCIaA/
         LzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791506; x=1751396306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dPp8G4B6NbKyt49W8JBKu/RwFw1JJYSMb2wc/ipDrg=;
        b=X0X8P57iIS4KaB2ihXdV0oxW6KNFBVtlnX4bER5+J699/6HWwM4Fc6D7RTc/blLQ9x
         yn1niLRDXJ0hSX5ZO45V80u+AeSoG4Y2YMuUYQrlvklsC87U1kjiwIJd6OijTixIZwBd
         5Z2gE47/aMtbP9OC/7BkRn+8Wr0IiDiG8wX1OieEccwRCSzDLvxJz+ZUM1LyEYYCPOin
         /V7NKplALGEa4qqxuxfiHvngOrYZCfFSjn9PErHBR2OHZsivJ6BeSBSsRemsI7mj6fjH
         b5///NCMRenEIGj9MU1jMTDRoGdlCM2lgVfTfbH05pcofIiwLJkiMGR6AynpJsztWaQp
         4nJw==
X-Forwarded-Encrypted: i=1; AJvYcCV4dTHb9TMxTrwvpUfEZSJG4G1YEGa1SiekpbbdPSvjWPg16V1TRYaZ2hvlzBj1cgahRTbsoYuEplGfULQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMa9M/zclvw9AKn8CTJELr5Y8jKfJJF3u+ZySUeJjpzdqx0Yv0
	YBwhuRP84sWz8YlnnZtiYo6lDv4Trf+bMGxBZSuPxQB4soo77WwfXSvbgD0A2TKZe9K/TrQf+x4
	gaDMh
X-Gm-Gg: ASbGncviccyU55a47LiWPgJdpFvqF2b75PJtL/IHp3Guz//+N7BfjEbyDox/lvrFIj5
	wY6G5SUbj9AHPl/qYvL1PB+f4kV29j9nRoXSWCkVtyWV6f87COHQ3Ia1C1q2EQzjEqOs8CIxQgR
	jInKLpAEGbj1Va3SaxSs/iyPriau2CKfrabcOJhjBZx3Ld9HqhBPS6f0KAkEjVHosLPYqvYUwM6
	dcPedGueM7gWV4nbxCB9bBohPpjuCRl77W0xdEe51r3lBAdCy3ghxUOeisYr9c+CtW67sVl3O3V
	XnDt6gC1MJ2FTYWIIrzqJSagSfygV2pasg3VfpNaR8Qsj/z2Jepd5988az/SzfFxF/SSPj9DaWH
	CFpx1hRtFwmeTws9fM6Lp/cDtaNgWwVviV8WH7w==
X-Google-Smtp-Source: AGHT+IFz3e1ntqjNO1Li+kLYqmbgAsr0uEr0UDFV5QwNps+7VApXi86JZ/fZAMhsoeN1Ap5x/7nhoQ==
X-Received: by 2002:a05:6214:4283:b0:6e8:f433:20a8 with SMTP id 6a1803df08f44-6fd5ef29729mr1069556d6.9.1750791506488;
        Tue, 24 Jun 2025 11:58:26 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095ca02bsm59491686d6.125.2025.06.24.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:58:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uU8qf-00000000tXN-2UjT;
	Tue, 24 Jun 2025 15:58:25 -0300
Date: Tue, 24 Jun 2025 15:58:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>
Cc: Alex Williamson <alex.williamson@redhat.com>, peterx@redhat.com,
	kbusch@kernel.org, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Message-ID: <20250624185825.GA213144@ziepe.ca>
References: <20250624181616.GE72557@ziepe.ca>
 <20250624185327.1250843-1-amastro@fb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624185327.1250843-1-amastro@fb.com>

On Tue, Jun 24, 2025 at 11:53:25AM -0700, Alex Mastro wrote:
> On Tue, 24 Jun 2025 15:16:16 -0300 Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > There will be a symlink under /sys/class/vfio-xx/XX pointing to the
> > <pci sysfs path>/vfio-dev/X directory
> > 
> > And another symlink under /sys/dev/char/XX:XX doing the same.
> 
> Got it, thanks. The issue does seem solved for the vfio cdev case, then.

I wonder if we could arrange things so that if the cdev path is turned
on then the device FD created by the ioctl would report the same
/dev/vfio/X information? I've never looked at how this works, but
maybe it is easy?

Even if userspace is not using the cdev it does exist and is still
logically affiliated with the ioctl FD.

Then we'd have a nice consistent user experience.

Jason
