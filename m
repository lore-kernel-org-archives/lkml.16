Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11C0230BC5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 05:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743571422; cv=none; b=QHHtQftKlNLbQumCfRkEOQlskyzOWYJ87CvMhl9elIGaV6jdqJ73odCggE3x7F7CvyeHSctK1Mkd02rUa9xI754aIW6KmRkMu1H7RoSN/ziqoMlbO1uX2KtSS0sYIgC0UBR2k4Yh8IqCWI585TCxJEIUdbrdg+PRuvIoav5Sb9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743571422; c=relaxed/simple;
	bh=+UmaRoDqvDW86/fEtlINGKafVKZHUZdnazmF5EYjlN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1K4KpDg/ngjhVarhMcTfWHZZEDU0a1FL1bMuqzzsRjTpEj16y8KmfIcotx3lALDAh/HRUW7hY8Wp2VcFDIhB4qrVZCVdX1NIv3YPO743Qi2eDjLtAEMD30EtOYqUy4IHwP01f22LelqyXRXDtEpz/4qZFxJExLq2QhKkaybDHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=f+oE8L0v; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="f+oE8L0v"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4774193fdffso98700191cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 22:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1743571419; x=1744176219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=//DbTDEcSvt5t441A9CDCqGLvkxicVZgky98zyXoT0s=;
        b=f+oE8L0v2GR++FZtQQDdGmFdkCZ8Y7TrP+5YTcJLke0QmuaVevG6ve039nGVv5z1Q5
         ZJoTCnjdSjHFYhMnduaI1fJtJ7R87AHu9Spz7vXALWfpwuhaLCD6RyN+GxRQdlxYa1mE
         du5dT5zYdv6B12fy0vC5BeUO1aY9zsZYtFdihIQOKitXo+nUAmuWX8seGAJqjDauMs7C
         z/XqahbctlszYvNOkrz0ZQ2QDq6tzDUrmOedhtURTJHcMp8+Y5ss1zD+hfQNXATsQo3H
         6fia3jBNgJkUogQGQOmg2wPxpLAzif1FdLB/xhoNF7N42GK2ixAYF1Sique7blAcBdXH
         t5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743571419; x=1744176219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=//DbTDEcSvt5t441A9CDCqGLvkxicVZgky98zyXoT0s=;
        b=kkosYSIJau+9y+Ulkq8ZgKWgKyhk0VJreB2YVhSIsyFqsSl1Ipy0XdYs4GDje5BSsA
         LTG9PmXctsuxz7a/OuY/MLr2re/tMwmd+GbG5pI4KhXuLajPwf78xINc0EBK6TO8BJIP
         hsbr0v/aNtlfxsPdLypbIjDhW6m9FuierWYmuBg2Pqt0jixhxdguoE5Ob+fSTC64QqgD
         kgaG9sdZNCJkPE5yb389cYDqdtqSUbpqAqq+KnSpKlfBlxzk3vN73ZWEC/LaMhmJ/Uhw
         A3t087sOBpq2t2Gqgvo6iMnf0e+RI0yN6B6gO5h8XZxj3t1UDohXBdPWpOA0zqSEN9P1
         CPmA==
X-Forwarded-Encrypted: i=1; AJvYcCVCXhn609dItnycjlY1LIVAlTKRoNNkK6XiD/rJLnfn1jov6D71QIG1lshZrPJrsttRmabhjvF5WyKjFV4=@vger.kernel.org
X-Gm-Message-State: AOJu0YznHqXQWXfnQfco6XVfqe1xn0dZ/JCi+6bucFlwaLrr9ozEsesf
	AqQOxZ48tWkA0jZB13EXDM3p6LlQS02VKQTmBp5/IPIE3XUcFS+R9iYsr5JcflI=
X-Gm-Gg: ASbGnctAyU7HkEeLlqsagOubAm6p9mpL3bmHekB0ERVAAxqUamr98ZxABihF1JKEKm8
	mSxjZRNhU3MXwLuu64LJ+GGNG6nz6MYjglD8orRTr3s/Q5gXFCjOGfEQFEpd5Qcfm/q7j2OnJZM
	TFmWl2tVia5c4367OoC2mGmtzpSj4h8XwhBX9z32LDoLXmuZcQcxDT2sissgGpzEGBJfcmFP9pX
	t6JpuXsQD1jM43cbOi7mjxm67ld0blkF0bEp4iVYZBW9R6RQC0rUslImWRotWf3Qkq2kE4qpRVd
	iBg8eiwJam+ppK1M+VDDfQ5pSDOiJRVCb0XDYcTkpkuCYY6D1wGdC2C8fZKy7+5PpTVmfrj00gm
	Y6AP7GI+htEiz+ZVc+Lvo40LwNBo=
X-Google-Smtp-Source: AGHT+IFsnRLFii7aJks49fGZdpRukd6mP6AgJi3iKowJwSiUR6ljlZas0sjb3UYH+V9YHKOEbrIUgw==
X-Received: by 2002:ac8:5712:0:b0:476:8fcb:9aa3 with SMTP id d75a77b69052e-477e4b59073mr247210131cf.13.1743571419473;
        Tue, 01 Apr 2025 22:23:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-477831a4472sm75294181cf.75.2025.04.01.22.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:23:39 -0700 (PDT)
Date: Wed, 2 Apr 2025 01:23:37 -0400
From: Gregory Price <gourry@gourry.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Honggyu Kim <honggyu.kim@sk.com>, Rakie Kim <rakie.kim@sk.com>,
	kernel_team@skhynix.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	joshua.hahnjy@gmail.com, dan.j.williams@intel.com,
	ying.huang@linux.alibaba.com, david@redhat.com,
	Jonathan.Cameron@huawei.com, yunjeong.mun@sk.com
Subject: Re: [PATCH v5 3/3] mm/mempolicy: Support memory hotplug in weighted
 interleave
Message-ID: <Z-zJ2YlvXtP4ziyH@gourry-fedora-PF4VCD3F>
References: <20250402014906.1086-1-rakie.kim@sk.com>
 <20250402014906.1086-4-rakie.kim@sk.com>
 <5462e706-5b29-495d-9af9-1945e8a5445e@sk.com>
 <20250401213439.4e7a124d94aa42603d31d45e@linux-foundation.org>
 <Z-zIBM4zQ0LbGPYZ@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-zIBM4zQ0LbGPYZ@gourry-fedora-PF4VCD3F>

On Wed, Apr 02, 2025 at 01:15:48AM -0400, Gregory Price wrote:
> On Tue, Apr 01, 2025 at 09:34:39PM -0700, Andrew Morton wrote:
> > 
> > Do we need to backport all three patches into -stable?  If so, all three
> > should have Fixes:.  Preferably they all have the same Fixes: so we
> > aren't backporting untested patch combinations.
> >
> 
> Patches 2 and 3 aren't fixes, they're desired behavioral changes
> to the feature. An interface being confusing doesn't mean it's broken.
>

Just some added clarity:

The behavioral change in sysfs change goes from N_POSSIBLE nodes always
being exposed - to sysfs entries coming and going as nodes transition
between having memory and not having memory.

I can see the argument for wanting this backported as a fix to ensure
userspace software is consistent across LTS.

So for backporting: all or nothing - and all the fixes tags should be
the same.

~Gregory
