Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448E42F5324
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247785; cv=none; b=uL/w9jNx2UnEgnbYeCCYQ4HIScvEvqR92NIef54n2yhblIfKe/RABK7LXs1RAhIRsYEKTyc69Idto/ai4mKUfRFCiif/c/Tdmz1shB2AjIruEkXwbnu9CSbeUIspLoZKhVrJ/jqPqp0wvCFZrOBm52jI0Jp4Rtg12M4ng5Iw3Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247785; c=relaxed/simple;
	bh=eOLPsPcgBQpr9WRtPyiXFyxl6s0ASLsL9YN12T1AgKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IcwKO+rkLbMeVhuic4bW/djOstqe5Z5Iq1FPIcTcJnekjFBqf3Cn4uej09SzfpBcrZbb5CJF4l8UBCR/lp42ipMaIgxLen/cfK+ooyzjkVI7JncwZhVznKSuiq0y1u7PJSY+JdC4eacJSILjZSg1aEDOJ6DQjF+P1STFco2Au2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BBXh0cuK; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BBXh0cuK"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d20f799fe9so804028785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750247783; x=1750852583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eOLPsPcgBQpr9WRtPyiXFyxl6s0ASLsL9YN12T1AgKg=;
        b=BBXh0cuKC09VWRRVdBr2rUPTicDCGcEZhmTbwDjWsqaRBs7XQtqQSR+vrGUJEocIBC
         murMuHWIGO4fJgRdKYCn4Nce/ES7cMZCJ7cDTQgq5icJJnKK2PRfLCNhmfnJ4/EWeC+j
         /JPMSmLv6CkkU3HZ0F6iZJDNhExMt2KyHyzleW6jbuZfPEk8owFXi3bxXhkBSa/C/oao
         JMHeAKdOEh6yKR3dlXm65sU4PHPJxBh8WI7yrZ8EDDk0EVQ1mruN0VJKWYQ1ikWtsy+x
         UJqihGcwrM4KuPxbD7IdPsECMkQLE2Vp9q8ux9OOUU9nsZ4NqAVYPl9IjwOY+r+ExQwr
         SsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750247783; x=1750852583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOLPsPcgBQpr9WRtPyiXFyxl6s0ASLsL9YN12T1AgKg=;
        b=Z1MiWjs7lxiC7am5OVq1MHAFZ08P5YG0UxDI6ziu2/1Ge2ALbqL79qC7omSFjvFeSr
         i/1neJ9lSTUwUbNyeIhSl33WHVoPHtNSxJF3mM7HGQCLcP3Sji38Fr69mUYlDRpHRtUc
         d4hDPaRNgqHhXLV4FoTBBrPqaGs6TYRQ78PhrAmQN4nTgccIl/kUqqzXpDAjDHAjZSW8
         bXtQXbPFs7FJgrjmH+naqLbWPQcc94RoiYUOIeY262qZIXqbKtHkYeincL+YrTHRHrYH
         H0iE3c0aZonxTc6Lv8BIGDGPH6aACcTQy/9hqlxOleOMHPxEMdHeDCKI5aEc0Opj4oIr
         KZrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjtYJeSEe/oN8vSarCN9wtBWQ+5IFpOcZlT9/LUyhrzqSUfF0v09dHewgWklQQfbDArmcGZptTeU/FkWw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvaAU/FjyEVh8ETcV8gQAxL2oATf7e0L/dUGo22YNIGVnv+BVV
	Op28K61ctmWzuauq7CI9utulsaP2JmGqCzuniRx762zhR/IhfFeX22lkOfD7IH5O24g=
X-Gm-Gg: ASbGncvfsn2sBt0fqT2U/BxNB7k42Ad/R80gD7CJh+6OvUaeRu7R1AvfBSiOUX0D+gk
	2P8RMplXCjBPkKCWrECHT41w4VdMYSaJ4bWVZ+VwZrUYdPn594ypgpjgBQBq1UlaW5FETNSNQmc
	GHaLUS2+LvbmhE3Ximij6ElZ0s6wP2hcIQ6jAeObqVewTESAisiwl7YsYBebsvnk4wfgEkXGcwb
	0lUJexebinCTw/2S2D6DO6GXnLWwaAJD4ixRr3CYhR0jjSaHKQGcimONFho/V5IOQoA2s2NeBGz
	KEjrPMQ2/Q64V9gN3NP2XGKhjTqG0FGzDE0IvcJAUjXWpj25lVZ+blAqC745DIX6Dsaap78LBOX
	KPuMYll2OF8wt6E51kG5HWKwkyhpfCCnMO+Vepg==
X-Google-Smtp-Source: AGHT+IFK5sEY0xKiG/3LSQ/e2KNGGOzNmfpbdDjrbjeKIyXRBISXKdZ2vU04k+YsgVsnDuL9/XDSDA==
X-Received: by 2002:a05:6214:570d:b0:6f8:bfbf:5d29 with SMTP id 6a1803df08f44-6fb476297damr257611906d6.5.1750247783171;
        Wed, 18 Jun 2025 04:56:23 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c841d0sm71929076d6.111.2025.06.18.04.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:56:22 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uRrOw-00000006lbV-0sBw;
	Wed, 18 Jun 2025 08:56:22 -0300
Date: Wed, 18 Jun 2025 08:56:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: lizhe.67@bytedance.com, akpm@linux-foundation.org,
	alex.williamson@redhat.com, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250618115622.GM1376515@ziepe.ca>
References: <20250617152210.GA1552699@ziepe.ca>
 <20250618062820.8477-1-lizhe.67@bytedance.com>
 <20250618113626.GK1376515@ziepe.ca>
 <9c31da33-8579-414a-9b2a-21d7d8049050@redhat.com>
 <a1d62bf1-59e5-4dd5-926a-d6cdddf3deb5@redhat.com>
 <20250618114629.GL1376515@ziepe.ca>
 <cb926401-6bfd-44cc-b126-28204225b820@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb926401-6bfd-44cc-b126-28204225b820@redhat.com>

On Wed, Jun 18, 2025 at 01:52:37PM +0200, David Hildenbrand wrote:

> I thought we also wanted to optimize out the
> is_invalid_reserved_pfn() check for each subpage of a folio.

VFIO keeps a tracking structure for the ranges, you can record there
if a reserved PFN was ever placed into this range and skip the check
entirely.

It would be very rare for reserved PFNs and non reserved will to be
mixed within the same range, userspace could cause this but nothing
should.

Jason
