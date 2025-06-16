Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC7D38FB0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080035; cv=none; b=km5A+gmZSCn3MAbcAjAm+R0KE1EwHkoJyjteFimTq4B/Dg9puZxCxar46MEoc8mRK1lAmxIa79XGQBuurORl35Gm9//PWCJ6VSIgtRFZXdNvayM/51KZ8sEkCO4cnJlav17F2Pc4CSDoGH0F9WfRk7xbQ4s22SlagEwYK+sPcjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080035; c=relaxed/simple;
	bh=KsZELZeWpT03UnkqhlfBW9r1APWyBQkH9RXynD91+cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnACLZ1UR8/+0vQf7R1NJE1cfFXd2TqJaX2HEB0T4oWZDjINqVz08eZPBCY3f1EhEmBmR1US8FiJs33ujVNtj3A8JQ2M7sGUbAvQo2zQsRtivjfklv54Ba+COhoIGlCScqfCpdKluFKoXR7/54xTCveo1elwCf93Dg2C4J293XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=InQhBDFO; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="InQhBDFO"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fae04a3795so47947716d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750080033; x=1750684833; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KsZELZeWpT03UnkqhlfBW9r1APWyBQkH9RXynD91+cs=;
        b=InQhBDFOUPFGiSZrpdHxGtQG4VaKBdkr+fPJaqwR90/CiqoYaCxVmSn7QxrXNoLn1F
         WBPef0OK0r+/TpY5qmsEnBqsb+iNAweOH++O1rQaBUo7lZqGOIWYyQ9FNr75CpyP7VGl
         mVG8fRbp/yBoCPW5lcTUhWmD1iehkQ7MjS5bL7nO0uOEiTeH3DPKOGSlRqxug8yqSYn5
         Ve6ZNIF8ZqjZvhJSc+ESyBZRqzMP+yLVb0oef1VZwF6NxRm9kHLZnzxQHarmc+twT2KM
         J8QKvEsVOW0VkISB6x1WfonpZ6zurE8ezUKd7oWNnx8FXuMefw61z+pPmLyI3TbmbY5d
         eF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080033; x=1750684833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsZELZeWpT03UnkqhlfBW9r1APWyBQkH9RXynD91+cs=;
        b=aAjrZBkemTW12wNh5t8FpYF+sakgn7sb0zOlJzNXg7vtYakx1fj/Pp/ZXNI0aR80il
         WuojIr4gBrPzF2032BJjTheYPZ3z/2pvB59PJergus4e1S8kHBqXimuSF0mdOWFUvgit
         E8wjHrRa5dJwKoqxwWPUmzp9EJ3gHmJ1Ps23oxgFIlD88MftgD6st8k9pFcUw9VZrDwc
         T9wt+WrW+v/Gz6TizHGJWyVBRB70Aj8wmVgT3030FtrNhnxQ1dBthj9iH82m+jel7ukI
         6bQMvU+nBzqZODOc3WaqTTTFvPDFb/Eswkce9hASvQ3SYMA0OWYm0RGYt0b4Nik4sjMs
         wF2g==
X-Forwarded-Encrypted: i=1; AJvYcCWLmJWPh0Pp+uWdAKwyqXyFAh8DYHNwWS7sLbn7Z+zCh+/ih76aelfirbyo9tDABVB3GPIWraRL6w/+B2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrs54jOGMZqY62cWcLs0mi/tMWSyfQs/fv9B4w7CFZSbNTMFo3
	5tlaoWMGWiOfKHT2fPyOaLBowRlXkNdkmNs8JkxfBbhc8qs0a4SkQ486YnN3fc+mw2A=
X-Gm-Gg: ASbGncu+woR6szKug7AU+1mr+ej8ijaaEiND0chWPNGGDMIb1yrDkRc26GbGcYixTI/
	Dk4yYgJdYoZ1fwTTLKAMSXss1sGeJK0O5DJo61d+uielbdnZ1E1w+KKBZK6hicPsPwVBDbfsAdz
	2CNpyoqzRmAsXF+iBvivNJGjtTInB6QZitvwrE3HJhVazb6N4OnSz7gVvrYJ5UY6rfZWDMD3ZIT
	rbxSQsOeAAHB4LoT+4gLHNKBcEaoIb/YmoNX8++kEB23yCTwBp2vzaF20hutDpSOLz6aMyOCbmL
	k4ne+UqQjUrbxLLPXgDcKcn3wtG7aZV+aKsW9qGynLhsCckpMxAfvlIblVHznC4nJ1OVW5HV192
	XXysTzImSIl2ZULcqj5S2EvCfhnmSPQmNWSIeSA==
X-Google-Smtp-Source: AGHT+IE1qGI9XHVDxJuyvFi/df2zVObBdJYoDm6YGOjnmbu+H4OWYnM+uHkjohkUfAcq9uWzh1e/Fw==
X-Received: by 2002:ad4:5c6b:0:b0:6fa:c99a:b5e1 with SMTP id 6a1803df08f44-6fb47725fb8mr166833186d6.17.1750080032894;
        Mon, 16 Jun 2025 06:20:32 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c84148sm50822446d6.109.2025.06.16.06.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:20:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uR9lH-00000005gVt-3sIA;
	Mon, 16 Jun 2025 10:20:31 -0300
Date: Mon, 16 Jun 2025 10:20:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Alyssa Ross <hi@alyssa.is>, virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	iommu@lists.linux.dev, x86@kernel.org,
	Spectrum OS Development <devel@spectrum-os.org>
Subject: Re: Virtio-IOMMU interrupt remapping design
Message-ID: <20250616132031.GB1354058@ziepe.ca>
References: <>
 <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a65d955c-192b-4e79-ab11-8e2af78b62af@gmail.com>

On Sun, Jun 15, 2025 at 02:47:15PM -0400, Demi Marie Obenour wrote:

> Is a paravirtualized IOMMU with interrupt remapping something that makes
> sense?

IMHO linking interrupt remapping to the iommu is a poor design,
interrupt routing belongs in the irq subsystem, not in the iommu.

The fact AMD and Intel both coupled their interrupt routing to their
iommu hardware is just a weird design decision. ARM didn't do this,
for instance.

So I would not try to do this at all, you should have a
para-virtualized IRQ interface, not an extension to virtio-iommu
adding interrupt handling. :\

AFAIK hyperv shows how to build something like this.

Jason
