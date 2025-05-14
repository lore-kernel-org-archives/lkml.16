Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F2813CA9C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243286; cv=none; b=FLcirTqLdqNxFgpZODeLUz7Z7bjVQpdPqFHeBIP4WxQTHqOktcgzuBuzO5kwlpLB2LjK4gfptT+6JLu/LipUTZKAFJJWuPaw/OUT2O5kysdcULrIPR6dY8y3BYiz0RlTue498Sa0PJUycMVSK6zsKwvPxLd4AOcET6dZfzJX/bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243286; c=relaxed/simple;
	bh=xGa9vmwXydEwlPLupPDKkTKtG05KmVxcjZ3uA4nOhuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ha+iSH+FPVhoga/o4x1dRcEj1Ao36QMOLOBvJRI7AcPu3BiuQDMkSdIGFrO/Ip8fEsW5xNvLvqah4I5EUz4lvz6mckxCcdjfAqff2UZvoAE4t/x/9rWh8DA5YqBObMv3OUFf2fbS2i64atdmn0hL5CmZkzTLDXJIM/Sn35QcgD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K89yV6R0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K89yV6R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747243283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XrntOKw058pFaozmugo5yCPQxOrKWoF9hOsnY8/r2Kg=;
	b=K89yV6R0mC8ZhJ4x1hpqYxrxtaPzB4jcwFinXFMO5cdLpPW381UoDuU8bjvPJ26gWpOJcB
	nwJ1viWXzNmrnGS5GpGcC5BNCsJl2sxwesq8HYYntg/wn7ty9U/TT3NiabRjl1LVhhgP2b
	zk/U7v0qfSxU6tBH2g5U2saWTdFLEvw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-RLIcapC9O1aIr3hpKHi2RA-1; Wed, 14 May 2025 13:21:22 -0400
X-MC-Unique: RLIcapC9O1aIr3hpKHi2RA-1
X-Mimecast-MFC-AGG-ID: RLIcapC9O1aIr3hpKHi2RA_1747243281
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso1294607385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243281; x=1747848081;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrntOKw058pFaozmugo5yCPQxOrKWoF9hOsnY8/r2Kg=;
        b=V1+wRcsrWII+UbKaH/sR29kiUuuHvLUT2RbyOjMqi75aHr2TzwMVh/AR53A8n8++yx
         YbGUE6IEd2+C/s6lY7zLcDIXYCBea5PQ9pg3b9yIbGJZAzOft7tiYblfGQuBArSbZkta
         JjiHSndJkTEi4Gcrz0oNCU4qZ6HjD6/BV0k4XPQOzt+vuOVgcxZYluJi4g0KJkItVxVt
         XKa2OtHxJnDddKgljqf9cF41Ax5XxjVxiHyiEtUFtL8vx8/6rk6Wv21d6XWbEoLZ3IH7
         x5WgNDfk7fauFGWy34AEzj8yooTs9azZK5W141vDOLL69Gqu1i0Y0KBHJ0ZNzCPcZs4p
         xmhg==
X-Forwarded-Encrypted: i=1; AJvYcCULRLG1ujsZm/DkCOW5mEJKL4t/rG2flikwDBcfaVjl+o9u+M8KQgawzbLrfQjBTSwqCSrITBaQvZKJwio=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy77gGMiXTJudCUc7uV24Konb8p98fQARdZFOa4Ygr3klV6YU0M
	enhCEWN1y5TLE31zbDtgxtx5NLk3zAzfqhipqhhHUyl2UuJzzhEJLDHfoOXQMputt3djp7LrbUw
	pBMmR9x27rQgMgZy9rrTmg7sZqv7Aq4jkK+yzz2Qp/e8Dr5UIsTcL2oKhrDNBzw==
X-Gm-Gg: ASbGnctf1HrnvPCF6+Uivg9ZmyQA6R/xSKfljalky3t0ajI+SIkD6XqxPuN1se0gt/K
	A1zoDxdfbEg11j7SPs7Sv+ARL1wGAsflsg6cicKgwiynMtZGu0Axnu8bDjGrMUDqusCqn9+Gbd9
	w8N0tDA7zCnWDpO76d+uVQk3Q6q+nFCwg973WGTU5r/p/Dr0wjvGWoDNzU1Co1tlywv/UrrshNH
	fcvgd7MmoNrDfh9tz1/IBrgACrx7HOdC6b7JG9OQpcyevmbZncGlNKS7kgQ2r6Ve77QD4/1hlMD
	Q10=
X-Received: by 2002:a05:620a:3902:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd2885ce98mr656490285a.48.1747243281673;
        Wed, 14 May 2025 10:21:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlRhej31PFKXT+uomnSZgUi1MBJW96d3uyGJIRGzzt4n9pb6pmzr2pMVVfkmYyry22hZPjdQ==
X-Received: by 2002:a05:620a:3902:b0:7c5:94e0:cafb with SMTP id af79cd13be357-7cd2885ce98mr656487685a.48.1747243281342;
        Wed, 14 May 2025 10:21:21 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fe77c6sm874667585a.108.2025.05.14.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:21:20 -0700 (PDT)
Date: Wed, 14 May 2025 13:21:17 -0400
From: Peter Xu <peterx@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Kyle Huey <me@kylehuey.com>, linux-mm@kvack.org,
	Robert O'Callahan <robert@ocallahan.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 1/2] UFFDIO_API.2const: Update userfaultfd handshake and
 feature probe
Message-ID: <aCTRDSCSiRrswEXP@x1.local>
References: <20250512171922.356408-1-peterx@redhat.com>
 <20250512171922.356408-2-peterx@redhat.com>
 <6eobuzkwm6xhpis4s52dtit55fws37elv5d7zygaf64czcjag6@brz2nrc6qptu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6eobuzkwm6xhpis4s52dtit55fws37elv5d7zygaf64czcjag6@brz2nrc6qptu>

On Wed, May 14, 2025 at 05:59:48PM +0200, Alejandro Colomar wrote:
> > +.P
> > +For historical reasons,
> > +a temporary userfaultfd is needed to probe
> > +what userfaultfd features the kernel supports.
> > +The application needs to create a temporary userfaultfd,
> > +issue an
> > +.B UFFDIO_API
> > +ioctl with
> > +.I features
> > +set to 0. After the
> 
> Please use semantic newlines.  Break the line after the '.'.

This one was overlooked indeed, will fix it.

> 
> $ MANWIDTH=72 man man-pages | sed -n '/Use semantic newlines/,/^$/p'
>    Use semantic newlines
>        In the source of a manual page, new sentences should be  started
>        on  new  lines,  long  sentences  should  be split into lines at
>        clause breaks (commas, semicolons, colons, and so on), and  long
>        clauses  should be split at phrase boundaries.  This convention,
>        sometimes known as "semantic newlines", makes it easier  to  see
>        the effect of patches, which often operate at the level of indi‐
>        vidual sentences, clauses, or phrases.
> 
> Also, please say "zero" instead of "0", as was in the old paragraph.
> That will allow git-diff(1) --color-moved to detect some movement of
> text.

This was not part of the old text, but sure, will do.

Thanks,

-- 
Peter Xu

