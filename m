Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDF72512EB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750338766; cv=none; b=jxrHIsJvl9uDxFSrrIvqb41LndKd9DVzUj+4qLww1N/bVbA2SbXIaFHh0ZuPcGx3C/iBHCeKfT6JjyiPKCGzT17SJWoaT5BLAE/dTVJMHsMhKeIYj9z/u5lwMTwKjOjhdwJ8ZjRfja1nt43OH3eAcuFOmdo7KAFGHliGea7V8SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750338766; c=relaxed/simple;
	bh=7Z+pcU33oyPC7BRqEddWR4+kETEmpiLOQGbuRz0Rh4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EOndNagTlMlSWljzdkz8HAa+FamuIlqdfwRARdC9y9BXI9gH8ws0zElESVXaRQZDTQ9npTTc+UCnQWpVtO+p5EC9fHiTF65BIiQy9oDVIKVlElWVk4xhBjFYRfe05A6G5lDZL/T91NmaGFNS/aztPLlch+Ap5ZApNTpIqF89E4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ajCfAww9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ajCfAww9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a375e72473so374803f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750338762; x=1750943562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RfbU5XwbSP1qLzPO3cyu4dPYbVldE49hn467MK7e3Fw=;
        b=ajCfAww91JELMoD0gRdIDfxfnP7N5r5jAgHqLI+K0jOHf9YYIvY6UxccmL84TIyi33
         WBzxBe+6EcoGeCKZtIZNsfcHU9b4dQLl+LxXJewBg13tKlp54OIm6MUOlcldBsYDgBtq
         7JoSpseRXnp5mOwPnzQsI89MqKRq8Ga8GLVFl8G4kHq4XCr9N0vKNhlCHDzR/ZMdMte6
         1pqAC/w8m7ck/UzhVPkSVabsTH1ebfTLTLo239d1hFFn1uLbkF1GPF/ylfWYjmnW0nQS
         Cc5hsyULGVPBmmD0c3xGAi4P9g0geIDrMUa123V8d6IngNMejK8K+oiC2dv0noi+ckd+
         u7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750338762; x=1750943562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfbU5XwbSP1qLzPO3cyu4dPYbVldE49hn467MK7e3Fw=;
        b=KT5kNChsa255MBOlXT7qWcUx2J8ZMFyY9A+OlIrgTrttie68gy0cL0iyCmnpbRPsXn
         jFa9ZG6M7garQSNku0DeSEAq4eRagJSjyrTFW/Cgm9PtARjBPtXUunOGXEKDauG7b2zP
         h2SHtf72YiwL2H0bUTQvRKas7ZEseAQOCNZhxjeU7uLvc6mvq8f0NKgkej+gVkPG19gx
         WZjNhAEAeAyo+wWZ22D5ob1a+6gQBz5tXye1GhER/v0reb0jAbRTv1/eOQSgolOLvyrz
         j6kIaBFxFPjIjiby+LaIghLuaA8Onoq+ObMvsBA127QBLozhnHD8K7Aj645oTwVS6zG2
         Fvzg==
X-Forwarded-Encrypted: i=1; AJvYcCXTsABMdDVpNNY+Af+MlaY/T7WE20BX4cllmTb7v0B6Pe9xi7ewlNKJxD3FqxLQos0YuR6+AufuTDJ6i9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YziCU00ftlrw/qMv8snhMNgwh30dAFgKyrpa6h4Qp94n71B6krO
	VUSLhcWorzrMAx6RAvfCkjQe/HziK/stBtR26mzYOWjeQli2yiHw+Dmcixv1l1UUDjk=
X-Gm-Gg: ASbGncvUkrNShPZ402jGislfyAkeuFm2UkiVxoYA8NBqVduBA+jHzKA72LCvRzPWyMU
	SQBHEatWwNbN1mg8NWyzDAZbeXKVUucZDxtPIxDfQJfgPUS3EG8ShKZhHrdz820XHRB2eQHfvSn
	0RLGjFT8W3GBCkhP/+M/n234IMPBpwufA2IlA/H0z71ILI7C9qx8Ro5gBotF23vASWRxcxTtfuu
	P0rVyep6FHTQjAhZiGr67ST0Y8RF1N36LdmC4vh6M+ueM7b4LkdR8EtwF8fu+UAXCyqpvmIutGI
	PQQ0mtFsV5+DmKkx2BBQFJWwkVZjrUNGoR5GQKUbPMXXUv6gcruFTyVF045M2GxO
X-Google-Smtp-Source: AGHT+IGMRKN0eJ9M8yQ9jjcFab1egJr8KHPTZoIBqlP7aXsKf+1dslaBz5nlJNNPH1PKzxhd0L84JA==
X-Received: by 2002:a05:6000:1448:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a572367adamr18189709f8f.3.1750338762337;
        Thu, 19 Jun 2025 06:12:42 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365decaf4csm118830535ad.218.2025.06.19.06.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 06:12:41 -0700 (PDT)
Date: Thu, 19 Jun 2025 15:12:28 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFQMvEMzXNQjLvp-@pathway.suse.cz>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
 <aFL7frrstgpzzgan@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFL7frrstgpzzgan@smile.fi.intel.com>

On Wed 2025-06-18 20:46:38, Andy Shevchenko wrote:
> On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> > Add a new format for printing page table entries.
> 
> > Cc: Petr Mladek <pmladek@suse.com>
> > Cc: Steven Rostedt <rostedt@goodmis.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@redhat.com>
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> 
> Please. move these to be after the '---' cutter line below. Just leave SoB tag
> alone. This will have the same effect w/o polluting commit message.
> 
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> 
> (somewhere here is a good place for all your Cc: tags)
> 
> ...
> 
> > +        %ppte
> 
> I believe you can take %pte.

We should think about the future. If we added "pte", people would want
to add also "pmd", "pud", ...

It might actually be a good idea to keep them under the %pp prefix.

Best Regards,
Petr
