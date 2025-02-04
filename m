Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01D72153EF
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738686608; cv=none; b=BeoBhp8/LxGXL5yqyBJdZ4QtgdsP2usRWoCVfaY1MXrqNZz1Pv1ICLvcxukFMuX6/0JvIDCRGREzGHzvZ2sLAFTPimheJE3YNBMMKF7nSjbmapEbSgrDQT/quFK9TvKzHRXWfoyhgN77N0D1TrN2sd56wxswSX+NOmGuRUWqm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738686608; c=relaxed/simple;
	bh=V1x8m7b7vL2eJxLoRBO9nQ9eFgSItp4xy5V5pKofc5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NDY0Syfk3eWTwVgXsVGvlIf/keGwcSRL/tH3A6XdHRmbdM5GwKmRU+g91Ioy2o/t0MbYvKOiwahM/pojB+XXsMmz299procVJQNP/jYVHpCouYnYuxWGqqohnR6YYC9xnPD8So4U9Dub7OoOqGzSuSYIB9R1akCChEGR7UfsS8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=rITZ5tH1; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="rITZ5tH1"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6d92e457230so53087856d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 08:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738686605; x=1739291405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D71GlxrE7tpGvGKymFaxu1Uf5BNrF3hZ/vpbqLGWS1M=;
        b=rITZ5tH1v2E1kf170/btnHDYTpp0oIJiNM1ITknozR7VWYBe38MpS6NMYOOduXuZvu
         oebP7k3LmHgQcsLksjeO3/suiYUw6qfBTL/k5e3vCUS8WFXQNh/C4iTe11HBt9owUfak
         SwDXheDtgAMHZZdOo57TwFdP+Bptf07Lx1Pk6beAtnCdVS3N82KHJOc0nsGFz/zueR3u
         QJ4p2nFIzK1ulnwy7exdoYexPL7i01MNjPszJXKV/WHrZNcuqE6JPogpkSeh1LK1fcvZ
         illjenTYQUZoGwtrdZl6wgosLujhaAZA5hKPkcA31WUgWCjI4qnD+neI1QsWFmqEPOHD
         +Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738686605; x=1739291405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D71GlxrE7tpGvGKymFaxu1Uf5BNrF3hZ/vpbqLGWS1M=;
        b=AYxxIcMKxijXW99E7fnqnGift/WzYXWixkSmtOuMR5fBX4woQgbP9H5NI3uJd5V82V
         SgL4jUeBrUPNJNeN9g9T1OGigB5GJBdTLyUIOaxlWF+CzggYdRViTFAddg5gjXirBeDA
         Ag9QY7sJbWMN8oaOBcPbgYAKJdTR0do42PJUq3vfddn1t+rgPZnTbXTZwF/W7Xue+WuA
         Z75XXCaRU82E3JHle3cciK8SBlIRkh2j7CxT7Epkkhrol0GzrRkOvMJxVbFEd3VvJLz+
         N9BRa+lSfDUEKT1Tt5vZM7dtQQ9dsF2QQHnhlugAMGdFezOLyuryy/acLcxhwX4nPWrv
         Dk5A==
X-Forwarded-Encrypted: i=1; AJvYcCU/2gcz5kwQ3Zrf+LQLsQao6ZIZOXQFIkRHYGlkqVTfpU0pgaGB2Iad7RUrlD7NKRYHHTA7d1Ttf1yreYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YytPNj+i9fjbL7QCpUpM/AifEiB2KNcvC8XfsSg3f7B5cSVLJaB
	wc/zKfL4qf6OXNikPbNAUOmQMcuSl5qLGOli5TTvvBAE44E03Auxla4CshJmZr4=
X-Gm-Gg: ASbGnctrWnzrC9RBOc/4Db6Ea06F4Q8l/0Y6zqqNmt0+vW0sFwgp1m8EQAipPFYmRbT
	oQZVwV/GUmSHZCYJMzFU/WfUVALlZXWbY9DDVmK/op9pZbjY2Jj7lPlq3q25Ki9jLQ4gVb7lfpx
	ub+82maOO6lF1M4ny3jbLZvL8ed9uUOp+B1qPYiq9tQJSNx5z2Q6UexuX3Fwn2cYNKqepgoNfNI
	jZhl+6kzIXaoi/SVqAcTHJMpvIxqx7ZRPUmefq4XUWCcxu2crR/ikRVdtqIFJZAzcl7HKs/h+D7
	WtGxLNq7YEgpLFI5xMBkBpIz7C72ZngYm3cHEBKLwe8AdZPafwPsivzr4tJwAQX9cyk7N5k08g=
	=
X-Google-Smtp-Source: AGHT+IEh7NY7KtYyUy/WcPTOaeu6nFTa5IBV28uuo68I8Z2SH3+2+Dfjrn1+lGtIZSDuaDeya3rq6Q==
X-Received: by 2002:a05:6214:408:b0:6d1:9e72:596a with SMTP id 6a1803df08f44-6e243c7d3bdmr431683986d6.37.1738686604013;
        Tue, 04 Feb 2025 08:30:04 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2548357f9sm63652056d6.63.2025.02.04.08.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 08:30:03 -0800 (PST)
Date: Tue, 4 Feb 2025 11:30:01 -0500
From: Gregory Price <gourry@gourry.net>
To: "Harry (Hyeonggon) Yoo" <42.hyeyoo@gmail.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, hyeonggon.yoo@sk.com,
	ying.huang@linux.alibaba.com, rafael@kernel.org, lenb@kernel.org,
	gregkh@linuxfoundation.org, akpm@linux-foundation.org,
	honggyu.kim@sk.com, rakie.kim@sk.com, dan.j.williams@intel.com,
	Jonathan.Cameron@huawei.com, dave.jiang@intel.com,
	horen.chuang@linux.dev, hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH v4] Weighted Interleave Auto-tuning
Message-ID: <Z6JAicm5VxE6HKnO@gourry-fedora-PF4VCD3F>
References: <20250128222332.3835931-1-joshua.hahnjy@gmail.com>
 <Z6HGwq731v+VX1CP@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6HGwq731v+VX1CP@localhost.localdomain>

On Tue, Feb 04, 2025 at 04:50:26PM +0900, Harry (Hyeonggon) Yoo wrote:
> On Tue, Jan 28, 2025 at 02:23:31PM -0800, Joshua Hahn wrote:
> 
> I believe the author has successfully addressed major concerns
> through the revisions. The interface and the code now look good to me.
> 
> Reviewed-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> 

Thank you!

> > diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
> > index 80a3481c0470..cc94cba112dd 100644
> > --- a/drivers/acpi/numa/hmat.c
> > +++ b/drivers/acpi/numa/hmat.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/list_sort.h>
> >  #include <linux/memregion.h>
> >  #include <linux/memory.h>
> > +#include <linux/mempolicy.h>
> 
> nit: is this #include directive necessary?

yes because hmat.c now calls
	mempolicy_set_node_perf(nid, coord))

and best practice is to "include what you use" to avoid hidden
dependency issues should another include be removed later.

~Gregory
