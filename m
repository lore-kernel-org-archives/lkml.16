Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894CC126F0A
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 00:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748479911; cv=none; b=Sa/4lM3UsPW2fKqg0wuKz5sMtR0L3m7R4leBX3iAnWsN1mLla3R+Vfx5hz4Bgklc/MifKv5NHjeN/B+4cIY5QYYleObKKm7ilSO+rk4VEP1LAZMI+XcrtbQ1TrlPx2UcEwmugSHn/U25TDHSZ1ZhQZDOdgbmhOumna7mDMd4beA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748479911; c=relaxed/simple;
	bh=+rTKQnGeZgGs8YdLx5axg77Ntzhcx/Ihh/cognEzwc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raucAhEan5liFQQrmXa00UEMltLpSZ9fRW91h9ptFFZjmKCOP4uAg6Fbd86agwpVHSFY2ycEjmXcxu1LFy/Cedy3UYDnM0eh2MxgIFIBP4CucoocnC+kkBq4/TaT/YC0rE/j6bWessm/QFd6vKlRTWIERkyckxi/d+q6UpleSI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BS6iv+2k; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BS6iv+2k"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fab5a9a892so5456886d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748479908; x=1749084708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7hRdgXGTQcuakis/eDxmYU/0eDxi3NnS4HETM1OC1w=;
        b=BS6iv+2kOb9vopg+dkpNMTqE3pVepFkqbpLFmFYPQLmjuauAg6nq0itmLCBO/sskwD
         HLI87HikmV/nQbC+v6gPEx1GGkYJayW22o+3HteJuKP36RCIgMuQCEr+5SgJTNcn0ea0
         JZXXr9Ib93RH3NFkqvrhGrMppckAYpEVr9QI2zmuriCdb9vLb+EF4cyUTE4vlLF7wGPr
         oEvWFb/UaVKdtV/1YQ4LbKTiKSPsyh4JoH3j7RI+VhvFzpN54twfxwTDgsklOAuGh5zJ
         67UpswwVyLCPFqgyhIggADBGzhLASeX0DYjbVRTGUBSuER/Va4+PEomyRINJZe9huUDP
         hLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748479908; x=1749084708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7hRdgXGTQcuakis/eDxmYU/0eDxi3NnS4HETM1OC1w=;
        b=HGGqbXZ/ctmNjYHrfTxfpNw4z5fR2WUKEPHA2gPKotPjpvz+bjp6PaRbgmUEBEO52R
         7I240myaZ1lzCXMKA77PzcnMpJvhdGHzDnTSOG1+r03kApW54OUng6k/Bofr8iQR2ot+
         eAV1Qtp1KHEJposEA3chprQE8Fsw9T4k6SgOrtHc6qtWc598CmbV1oBf3jmpYIwXp/gs
         2IZywvo4lJrS21zWM3rSG1Dmf3rF2Na5cmUoLrl1LkLqNGumpb5o1tRwA+zNBtTSiTlm
         le9kX1BC20pP9Mk7RWHcAm56lYeQFVfgBlVKKu9bZrEEYPcfI90mVBsSkr5MG+9TwuTx
         o4wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcbVIPZTwk9IMw2JG73gW7DkHTX28XkT6W7SI7zjfkvuvAPuo8dTaMDwjy8aLJ3lxuJ09q9Li2hFwte6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6GZGg6m322U63I3V9pozROiW91G8Qdrd5Z2XXgxVEU/QurtmR
	+inV7rXMSuJte568W0kvx1zsc+8e1+g2++w+Z0iFnw1ybQkje28jZpv2/0egU3+7UNk=
X-Gm-Gg: ASbGncsYsP+LaSZOJI4yjhIu6u6MXaIA6Bh4MNdN33iH+rPiMOvAT+V9gcxmE/9D0mN
	L99thmRxFGSH2iglsrvzNoKQaewho8BoK0m5WcEX8hv85J9/uDtqkcSKv4nNbHd70pRpiGL0iQ/
	0byfq8+e4pNDEZeXByF4ArZtQfEZ1mLviFz6Q8I5yu9uf9nBR4Ow/zUjSnKQuTn0b02byJd/4lU
	CIDiH0y4OUbrNZAfPVKCspXIFrqbHZDZmLKN41awwdroz47xTXp0CbNCeCsjjru6/zjmbRQpoo/
	eRvUCGX1sLwwRtrrTRBkwBey0kHwbZwVoccpZbOo72Ndavr4zfXkLCkav/aeReGrC7kBwbunEge
	BzgLFi575w1uI69bkp2e9lThOEgU=
X-Google-Smtp-Source: AGHT+IGpc+ZrCcP1p+D1/956SbBLMRbvPN3eHwEszsC6VMHgEK1hA2/nvP0rMBMUIf+3RQJEGLeGmg==
X-Received: by 2002:ad4:5bcf:0:b0:6fa:c0ca:c75c with SMTP id 6a1803df08f44-6fac0cad375mr62565836d6.42.1748479908389;
        Wed, 28 May 2025 17:51:48 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5b139sm2637706d6.53.2025.05.28.17.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 17:51:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKRUp-00000000qrb-1bN9;
	Wed, 28 May 2025 21:51:47 -0300
Date: Wed, 28 May 2025 21:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge
 folio
Message-ID: <20250529005147.GC192517@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
 <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
 <20250520162125.772d003f.alex.williamson@redhat.com>
 <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
 <20250521105512.4d43640a.alex.williamson@redhat.com>
 <20250526201955.GI12328@ziepe.ca>
 <20250527135252.7a7cfe21.alex.williamson@redhat.com>
 <20250527234627.GB146260@ziepe.ca>
 <20250528140941.151b2f70.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528140941.151b2f70.alex.williamson@redhat.com>

On Wed, May 28, 2025 at 02:09:41PM -0600, Alex Williamson wrote:

> To be fair to libvirt, we'd really like libvirt to make use of iommufd
> whenever it's available, but without feature parity this would break
> users.  

If people ask there should be no issue with making API functionality
discoverable with a query command of some kind. Alot of new stuff is
already discoverable by invoking an ioctl with bogus arguments and
checking for EOPNOTSUPP/ENOTTY.

But most likely P2P will use the same ioctl as memfd so it will not
work that way.

So for now libvirt could assume no P2P support in iommufd. A simple
algorithm would be to look for more than 1 VFIO device. Or add an xml
"disable P2P" which is a useful thing anyhow.

> Zhe, so if you have no dependencies on P2P DMA within your device
> assignment VMs, the options above may be useful or at least a data
> point for comparison of type1 vs IOMMUFD performance.  Thanks,

Even if Zhe does have P2P DMA I have a feeling the OOT P2P patch may
be workable <shrug>

Jason
