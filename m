Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4161A9B3D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235337; cv=none; b=ZLjF6ihUhNRBrw649rFB2DtJYS+HE2AnlE9jr7O8Ft4yfkm/tB/JUE1q1HtFgzTnsdKBY84jb3tbN1cEMicdfQrXAbC8S+Zh4ZfWKLqu2ft5rr/q5WqHSAfJIvamLLnG8somdol61eOuAwG53UCP+XXyR40Q/A9F6u7ICRkk6l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235337; c=relaxed/simple;
	bh=JQrsvG3tyIE7uUwdQMrPu0jtyB3RFUhMEsosIMER4Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJpARAZCY2mttSRG1FTVMZmxR6+BhYxhvBg5vWYztBC03nobxHsqFOxpJULk8N5btFMrCaoJi4rFyJ3+xbtTvSj5vE3iAXRQgnvkwtMD5V/Ta+4NQrIu3p70IL3XqTpLYTp8VBs+v9s6DifbaEmX3EBXedecms5tBjKmyuQHJLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Kp4ZqwJF; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Kp4ZqwJF"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fafdd322d3so28225236d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1749235334; x=1749840134; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UIWRWZxV/p0xSjEz7FnPnZMyLQBnVez8LgmKnErYtcc=;
        b=Kp4ZqwJFwyzCxD4dSvj7H4uImMo8faTQUsh7JJrOYp80rRe6Nu32SGRuUpHX9yMDWj
         seDVuipQSXb9ZIa55wmmYETLlxIizE13T1Nc/o774uspV/HJQt23Wzzm6p90fBUWcXJA
         0CE21JzVV4o1pnskFyglUNuGXRC0izhON2rMOd3WXGGgdF98CzdcOSiZFw7heMB/+y8Z
         dZ9WI7syn8DkZHIdFrI02zXZCLf0ZutDn8iLyoVmBnYKJvFO8DywhZEUoeHucclIwl4J
         vwj+TpkSmvbPdoJ344v2f67T6pgmRWdrNgif5wjbUXnBOS/Pt9vPuXcZK/1TXJrbbhy8
         EE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235334; x=1749840134;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIWRWZxV/p0xSjEz7FnPnZMyLQBnVez8LgmKnErYtcc=;
        b=NKnTC9tLd2yWFutNgmsAKLyj9laO2mNKyXJyTroEU2BIevBr9UK6dC9zSdtYwGaitp
         aVR2MG+34iAsaH/W+di4admujVXxBHgd3NP90j7N5Pvft2u3XUew4ZrntL+uRR7d5w3g
         Fmku32VdbaVid+WZbuiInb/Culq4vDSoWoU+qt1DasZllSdSxeJww3YGzvLWiOD/hAqP
         Gul+MUrUqpuydnu1JgS1R4m4+YQnwiDPy0LdTDKU7A6VdxC2WuOJiVI0rQkqNteFmxZz
         TZWcDHMXtH9/treC3uhEU/668ngXwfjUD88XXld3s706Jzz5DzJf07hu0mGN6I0vXRvJ
         Q9QQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAnQ7ESnTfimqwOlRj8zU7+R16NYR5OlrP0StFB+4nkwBx3G+LZo035ARq8raJ5iudYpHQ8Ly78LI7Fcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHdtvik5QxybN4sR29g6+gRQRWEbke3SGi/T4bQojXZHWgTZAX
	bwVWJMtm2K3KfvfzMCENLp7E6RRq6UgGmxjDiwfn0HsBjpXNgVDrj0mJ7ZSt4tWWYUM=
X-Gm-Gg: ASbGncuP8tR7GlGZ38X/GumvQHP5qs598Ud19dNuSNYSCTpnXGADehN1IFDHE4x/suF
	j8HShT5QIof/9YZym9xpI+QLvSRTVC95ix/Z2PcAxJJHFC09smsKm5MUfGtV3HIm9DXm0wOm+6b
	u+L+oJ1U8Z78CayY0llfgJ9QPt9RvaKTR6xMxnIsyj7/z6M+ssrfjg3A8NFsDfaXpDiRZ5A4xfz
	mUtF3NngBT6Y+OlTssGCy9O9PDAdX2U/t8z3BzdkGwgnI7KkEI7MLdP761VBueB1TOvcYGV5oOU
	LWZhT7qWaCjhaNSDY8Z5RM+OwrdIIJ4b1UpPUGPPfB5yoM0EAeBrRo5c9/jl8kQMgOOVc8kM2Dm
	TCJIqnCHiAa9gKbKCV5A0TZpmllbZZ3gPQ+5fxA==
X-Google-Smtp-Source: AGHT+IFSiaH4qNveUr41mUFrPUHA3YO5ABeezzAAMvW87dhqrIPrTwsERama2dq7gCiRZA1rfnwHFw==
X-Received: by 2002:a05:6214:2426:b0:6fa:bf2f:41a4 with SMTP id 6a1803df08f44-6fb08f4d14bmr66807746d6.1.1749235333864;
        Fri, 06 Jun 2025 11:42:13 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac85a8sm14820006d6.35.2025.06.06.11.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:42:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uNc16-00000000fH6-2wHx;
	Fri, 06 Jun 2025 15:42:12 -0300
Date: Fri, 6 Jun 2025 15:42:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <20250606184212.GB63308@ziepe.ca>
References: <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>

On Fri, Jun 06, 2025 at 08:23:25PM +0200, David Hildenbrand wrote:
> > One last data point: I've often logged onto systems that were running
> > long enough that the dmesg had long since rolled over. And this makes
> > the WARN_ON_ONCE() items disappear.
> 
> I think what would be *really* helpful would be quick access to the very
> first warning that triggered. At least that's what I usually dig for ... :)

That's basically my point, it doesn't make sense to expose two APIs to
developers with a choice like this. The WARN_ON infrastructure should
deal with it consistently, maybe even configurable by the admin.

Keeping the first warn in a buffer is definately a good option.

Otherwise how is the patch author supposed to decide which API to
call in each case?

Jason
