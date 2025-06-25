Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F031D25F99A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865637; cv=none; b=etjKZ1jUJAXkrKp2YZNGNh6oXmbmUzJZG9RmurAxzGuer7YhNgsQbTL9tR2pqoyQel0jRhfOtFv3uSit0E/cCYCv+rGwkd7vFCaP7LteicF78aMNc5ujM8jqPCLHQVx8wL5WlByNKf9UoXcwTkYzKx0DrMnxy5lpqLha8uD3cX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865637; c=relaxed/simple;
	bh=oeDVbXzYCMu1RsPKrLrCYA5wW/CpYO+WF4MAGS9OyyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cv7p/OZtOzbdpXiGW8HPaF+zJqSELXAW/cT6lt6ACBW8OaE2WId8aTi4mdL7co8asRcEMJ1XVGcjtH9Vbnyuf3TGtSBAOEVMcFnr3OmnA+ShpY+IazoCW0q/jE32iQGvf6ExFKnbCFVvQrRn3tCZsGx11E5uxwxZziOxMhvTg8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LyFfbnK0; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LyFfbnK0"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72c172f1de1so4250031a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750865634; x=1751470434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VZqhEcxBQhbzOh6JVaGxQL694yeYlxvz6oZqmaMRq08=;
        b=LyFfbnK0RWpT7DhguTiH2xr4csnVfiCzm+elCqg805kgp4iOo9WvBXkmgL6erYf5z9
         I/vK6S4/7UsWRbcgEhI0EXtlP1am8vYVUgZs/sIOoYraurQN6ugZnz9tJiSVQRYHKz3a
         LuZT5nwgVSMAdrNBI+GMinrxv9Czwb2qb3sVf1lw14nrr5iDmqHPrldJcm0I/2oFZ6A/
         1BSc4WApbaRSoqIsYgyJ49kzjQt29XSDNMxuuQexO1y03fhqGhDzmW5/fJ2rgRmveceh
         dYRPqaYYcxIeIRQyG7w8RKuXiNnOWaqgw7r8fdpSqQNAzWbZYGYaQ4/GxZ/zKJDsW7ss
         zeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865634; x=1751470434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZqhEcxBQhbzOh6JVaGxQL694yeYlxvz6oZqmaMRq08=;
        b=v3irTTWMA/mLl2w4ZzYJ6h9QeHWqPLE4ofiGkET7dwIzqR4QVGwffLWtu84dc7Or1i
         nIdd7W2oPNT3RP0RPv+TidzNPRsMbfJGtBv1I2famimdYBrKousT+EgusRwIaHt+HeoH
         IwzXz/g3C9GH9foR8tp3puVsugz9pbxghh6xoRjnXkrn4Ok0mQd3NKIb7BozDuw4OMqe
         uT8qf68abbsSBCiphl5j4nt9X+GyFE4EV5CDlLpMF/98B8Gb8zJTfghUPN+rX7l3fqKt
         thg5XymWRmrbxUCNMShS6O8FekLFQARflknfrbD8VDDZ7GQRaLB9hPUPqrfw7jLE2yY5
         0tEA==
X-Forwarded-Encrypted: i=1; AJvYcCX4R3ogoPpt8jrNlOIMH30yuANL75Rsi/UcsQr+Tyo+4swYBXwXbxXkEfbwmG9ws97LxC2qA9N6ztryJ80=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhJYJxSNtzWTaxFE8tTn6orFDSxbJLLX3wsROv31jh+1at02c
	JwgvZeh6vxx9Kt4psqA21QsAVfKGDWfW4J/0q+Gtnyc1G9kgQg0GstBNuTNiHUpeNQY=
X-Gm-Gg: ASbGncuKL4HmvI9Gd64jP/vVVgHp7zAOvH0fKPSCCQuGukblnrXT3S9SoMXtExYKCuj
	JzLryfngMUe+ZmPz5EJQu/jIMrGLM+zabDplxpSssnoV6bfIaBw4SILRwUvjQsNHdXxSEuPgyi1
	hLXQbPRXm7NXfTXqKiClVV7YagF6RZ0mkJX1Ck2+wzxd7T5wGYDEuX+HQB7WL7KGTPuk4Df+1pO
	KoDgFBpXWs4IgaHSRD8cs4e1GujRslYJaDkU5wOtp8UL2ZQaO2DI9teBcHMgwPUP2Wlz3X+zXVh
	LUEPJy05QXQoaZ5Bx6u/vTtnp4PHpUeSvFdljoTnSUwvqEyRwuIq3gcC/RSkwOYkUps=
X-Google-Smtp-Source: AGHT+IHocp2lWjY0ub02K97anAYnYNyxecSqopXbTvdpz/db5rpNAumtukQSZFEpei331ZTaZVEUDg==
X-Received: by 2002:a05:6830:2112:b0:72c:3235:557d with SMTP id 46e09a7af769-73adc7b4318mr2366572a34.13.1750865634096;
        Wed, 25 Jun 2025 08:33:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90aee8ecsm2293133a34.10.2025.06.25.08.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:33:53 -0700 (PDT)
Date: Wed, 25 Jun 2025 18:33:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Harry Yoo <harry.yoo@oracle.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mm,memory_hotplug: set failure reason in offline_pages()
Message-ID: <c20a5cde-671c-4f71-995e-779fb6778273@suswa.mountain>
References: <685c1428.050a0220.346d5e.eafa@mx.google.com>
 <2db18566-f864-44f4-bd0b-baa7cc4bebea@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2db18566-f864-44f4-bd0b-baa7cc4bebea@redhat.com>

On Wed, Jun 25, 2025 at 05:24:01PM +0200, David Hildenbrand wrote:
> On 25.06.25 17:22, Dan Carpenter wrote:
> > The "reason" variable is uninitialized on this error path.  It's supposed
> > to explain why the function failed.
> > 
> > Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >   mm/memory_hotplug.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> > index 4d864b4fb891..e954f81b55a0 100644
> > --- a/mm/memory_hotplug.c
> > +++ b/mm/memory_hotplug.c
> > @@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
> >   		node_arg.nid = node;
> >   		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
> >   		ret = notifier_to_errno(ret);
> > -		if (ret)
> > +		if (ret) {
> > +			reason = "nr_pages more than present_pages";
> 
> "node notifier failure"
> 
> With that
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> (likely should be squashed because the commit it might not be stable yet)

Oh, yeah.  I misread the code.  Thanks.  I resent now.

But, ugh, I forgot to add your Acked-by...  But this is likely going
to be squashed as you say so hopefully that's fine.

regards,
dan carpenter

