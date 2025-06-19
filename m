Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6D229B02
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750336508; cv=none; b=Td2d7g8VaHLbSEx0ZcD7At7wczmt4bEvm1UVK8UM3gFqxHyPXOJuWxdWV+MUIooX3CSsRmraY+V1htjsnBlrmlVKNGqYY2k+DYcYTfCqVoNVpngNYs2xXrHv4MaOI/FOgH49XN7z4s2Wsdz2FP6MGfRgimSpWtIbylYxtpXJPYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750336508; c=relaxed/simple;
	bh=WjdsIi+G5XBXNyHZUuYu5bl9fEH438XZmC6V2xW/tbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oh1kigRvhxv9K7m/63aM7gSmOembKC9cxCdYXHo1iWQanTQD5y3rCLbtuUHuPjIoIAMo/0n2RQOOeY9WxfTkto0oPfW88OuVpE0zOALRZpnOi4ETvIsY9rzmrc1nkCkMz4s6nqFT3vvGZUheLPMKPnORW5VArGlpYYMaiStIhn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Y8o2u/DL; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Y8o2u/DL"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d09ab17244so80734085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750336505; x=1750941305; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nGeLPnPcEKHJ2UTkFmEAzCnzbAa63HR34D5qxwVpPx4=;
        b=Y8o2u/DL6rINOXOGCQNqrOBd5glayOKlVYhHaoTcp4v+ebTGQQVFGz/NEUcj8rAQ0G
         ejMwuIFQT1q8rGmL5QRny/3TgytvQybRP8Dgn1AKj3yVwdpd5RTzpXGFq/H2lE1KKNHz
         F4giBz0LajOSWnlOzdg+Xk8DQiNHdgwN6EV4UOjrEcsGOCIGc61FstCwaTRlJ6I+huyB
         WF5+DW4vaHvarAG5BqIHu4eBOY3Ad3+pyZrx4yoK+HoCtrp8SY/ZjXyXA36p/zXoW/qh
         fPN56wKGatdadK4JEQYjju9eC69tenO9jIYOtqvHyrfQKIxKnBv7okxwwezm0TO9H6t7
         PJMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750336505; x=1750941305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGeLPnPcEKHJ2UTkFmEAzCnzbAa63HR34D5qxwVpPx4=;
        b=BxtyvLgLw6EMHBvN0jEFH6lqVqM4jOIlVxuUk7ynHPVEAGhO21ewFDUTMaq5gIqhJk
         ayLAqOmccI7+5JogRqVLVwxELnsjRGKUhgcR/p9PM4IsKb9dfhAMyzaud+5yYkQF6yyD
         KTz1vIqHwhpp8WpIWbQ2Z81MnvlfDSNDgoBJElVnJp6onM8/Oe2F89fclYE4FUeRm0a0
         X1yaJ97AKMzzTXY6Se80ofz2tJWMr/im2DEMp4bRS7Xrr+pJvVvYk1hukzhNEfJ9Gc5O
         c9wiOlhF0kbZJDIlaSBnpdwek3BsRWEdueRcokMf39huMUlselRFkHLk0y2sXXjp+z4X
         23qA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Gk+h9G7Oi34s6rW+xEHai6Vl9pRKfH/OLUGyi0kCage0u2LX8we3ku/BbiHG4S3+O6uxR3YIx14zQSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/MBAJAtTug2Ri5KDRSHxglDZ6bBVso0uCa4/8yq2JzYzAqCK
	km5I4LWqyKSVfyN1OKn4t7+VQGbUKEuFtbNvOs1krjndPkssSWSqC1iPzZlTiamPyfQ=
X-Gm-Gg: ASbGncvU0vDpfNMfeV+r7nQ38vdmqzkUop3p/JjX/0Xc3IjWVNnr9t27lZWNbvBmKCB
	0ypunMi8ns0MY1Hc6zbIIzgobt7Qg0ji5DFvk8bmx0UbtrL4OJBMpVnTrQTXgg6bnIvdAOVGLsH
	FcumueD5aabADv/pAqwmKm9GhptU6RjVeT/vdLQUA8N7zimK3kAg2/nHgqwTx38Fc5tZNNC3yWR
	3d/77bTAKiEXj4Kx8V4oA79TQX5tsTn4QRDp2xEdxvkvvqTmj35l93AZN0QZ9YNOVw8uF5XLabN
	phCUhpVHqjS4MlE+z/t1wjtEoWXMlcUxNi3BpOXMfmH5KJrUIg9YAxpXYhlGjfFtV/Q3GYfGBu7
	6mXnm/tAOq/f7d0g1VyjYsReNxgynSydVZxz0Xw==
X-Google-Smtp-Source: AGHT+IFtAzqq2Fu5GuVgOUj/d61P9ZIrRTWdTIfqS29I/fFKuDckrmDGU3li1DAgHyAbFg6OSuPLrA==
X-Received: by 2002:a05:620a:4486:b0:7d3:e710:1d3 with SMTP id af79cd13be357-7d3e71008admr1128571785a.7.1750336505250;
        Thu, 19 Jun 2025 05:35:05 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8effa47sm876704385a.101.2025.06.19.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:35:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uSETw-0000000796Y-0nGl;
	Thu, 19 Jun 2025 09:35:04 -0300
Date: Thu, 19 Jun 2025 09:35:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: lizhe.67@bytedance.com
Cc: david@redhat.com, akpm@linux-foundation.org, alex.williamson@redhat.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Message-ID: <20250619123504.GA1643390@ziepe.ca>
References: <20250618132350.GN1376515@ziepe.ca>
 <20250619090542.29974-1-lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619090542.29974-1-lizhe.67@bytedance.com>

On Thu, Jun 19, 2025 at 05:05:42PM +0800, lizhe.67@bytedance.com wrote:

> As I understand it, there seem to be some issues with this
> implementation. How can we obtain the value of dma->has_reserved
> (acquiring it within vfio_pin_pages_remote() might be a good option)

Yes, you record it during vfio_pin_pages operations. If VFIO call
iommu_map on something that went down the non-GUP path then it sets
the flag.

> and ensure that this value remains unchanged from the time of
> assignment until we perform the unpin operation? 

Map/unmap are paired and not allowed to race so that isn't an issue.

> I've searched through the code and it appears that there are
> instances where SetPageReserved() is called outside of the
> initialization phase.  Please correct me if I am wrong.

It should not be relevant here, pages under use by VFIO are not
permitted to change it will break things.

Jason
