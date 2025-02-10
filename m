Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F1264627
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220535; cv=none; b=W98icqFHzIU8FpqqisYv4qTnIpfCGKDm82sSmCqmKQSpcjicvTP9Kk24Kw1wRvyqORxLDWM8FZBuM9A0KQ+TQAx55ahF1pjVmgl+m1D85+ji5vSejQbCcJSmOTUP5cs7nIyS+rId6hKmSppO/k8Yyq6HBbOjuRA2+XP5r8L4iR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220535; c=relaxed/simple;
	bh=RRRPpwruUsMjT3Xooj+QMNHrLT0enoIwFKJZqNokock=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVM2f1O8omgjiKXLbbHCGHnUdTRbdQ8OiCUEkUTSM+rxh9uR2845tS5ycdJTPS67UwWNdEDogvd3OD3nQtjmtxEg1HuXSZlFckk0itgB5jKCg4iQpks+g/v+rBNJ7R/FimsbousqqD/JOJcg5AVO/w5JDlPeHpFyiJWVkAEOo1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZcI+jwqz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZcI+jwqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739220532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tr6oImSUmoNV37vte3KexwGdDf++3dEa4MUIBt+66BI=;
	b=ZcI+jwqztbba73uhyn888NXxwIb9V0UXFbb27VrWe8bSO854g4kNkXw/GapLL1K09bMtbv
	R8jQpro4mTLVfx2c1Icbjl9kIw9JGu2BSN/nDj651ijyUCtuI36WbC3IOIshcFQFrUIBDS
	nfLzMTdhRfHPkX/E/oXTcU4jiHNFjoA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-OqihmUewNJaulOmMcTVYug-1; Mon, 10 Feb 2025 15:48:50 -0500
X-MC-Unique: OqihmUewNJaulOmMcTVYug-1
X-Mimecast-MFC-AGG-ID: OqihmUewNJaulOmMcTVYug
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-85522c731dcso8621139f.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220530; x=1739825330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tr6oImSUmoNV37vte3KexwGdDf++3dEa4MUIBt+66BI=;
        b=gAivG3Z8XjenayZuBiBbESRS2Vm+oaG2vBLqBbCZe8MvxRDIUIWiGFwz77ZxV6UZxU
         DpdBEf2roYYPB86Fi4kTTSkJiEMosOfiz60JjyC/O2w9qt4LTpF3tbghnx9YBwsDiYkQ
         H0xx9qCqF6nFpzu/JVBmEKeRJh8jAKxOV5RvmCfXmaPdJh8d9Oi8uNnAZdvV1riSNV/O
         Yu4fGAbr2bL8ZcxBwiXdRngQrEKNkdJ7aLdRb4iSYoB9ud823e1rjpk++O5jEEMyTd/A
         ePEnPu4ki4aNSaA0qn7ZlpjsCDdxlpOay0oW9SAOvUHioXddnETPX6mLkk9DMaxoqjS6
         PdGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgieGSfWTTJGwDhSSAHHvznp8Ys7P14uzFZpppE8ZEf+IT2qmes4xR2ebx4fi/ATYoWVjDWXG7cllgR2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS9WlDS0Csp7x/6YYPFT+vJ8X8VT333addZ47bproECAPVDw9/
	0U+Ydsf/Whip9ObK2+YCleQfvh2U+d8WJZaX7RJXYvvaLEWIBZNGANoj/vBp+lT61UbZSkX6RHm
	XVp1oVlgu5ADTRzWhnWQYJRJ8vWSVAkdngK+uG9tzU8+yhQKwxc+y3u3NxdskOQ==
X-Gm-Gg: ASbGncsOz5xzB0SxTpKrskA1DnysKPr1vqTv26I+92STDH4dz5qmDYjVjQWu5sRLgUU
	weK0Ew0NSXPx5rmxZk2g6tD49mEEKbLXsd3ijVpNUJr4C7EGRqDnXKaOjTw3wNBcf9awgSED91Q
	wzLiegMxNeTyRWZHQIoV9rTa1pJ5iXQod9McLvKUhzXu9Shdt0706H0SG4QJaukQfy01KmZ8x9P
	KhpJprcpLLVUZFoSTcaJCC22ZDpoNV5sJpKMWHoMrQsE+pBloL/s/4wb/BYj1cVI6NKnKgGSdjt
	x7uf1R4W
X-Received: by 2002:a05:6602:7288:b0:83a:e6b2:be3 with SMTP id ca18e2360f4ac-854fd9bddbemr395256339f.0.1739220530162;
        Mon, 10 Feb 2025 12:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx7Jnqea7i+39aCAKRmDysnisRHYNE/bnZVGB72yJEa4fDq/Fmq2JBu9PYMb77P0FAI73D7A==
X-Received: by 2002:a05:6602:7288:b0:83a:e6b2:be3 with SMTP id ca18e2360f4ac-854fd9bddbemr395255839f.0.1739220529884;
        Mon, 10 Feb 2025 12:48:49 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-854f6792733sm228731839f.37.2025.02.10.12.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:48:49 -0800 (PST)
Date: Mon, 10 Feb 2025 13:48:48 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, mitchell.augustin@canonical.com,
 ilpo.jarvinen@linux.intel.com
Subject: Re: [PATCH v2] PCI: Batch BAR sizing operations
Message-ID: <20250210134848.78a1ab4a.alex.williamson@redhat.com>
In-Reply-To: <20250210200819.GL32480@redhat.com>
References: <20250120182202.1878581-1-alex.williamson@redhat.com>
	<20250209154512.GA18688@redhat.com>
	<20250210093641.0be242ae.alex.williamson@redhat.com>
	<20250210195658.GK32480@redhat.com>
	<20250210200819.GL32480@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 10 Feb 2025 21:08:19 +0100
Oleg Nesterov <oleg@redhat.com> wrote:

> On 02/10, Oleg Nesterov wrote:
> >
> > On 02/10, Alex Williamson wrote:  
> > >
> > > --- a/drivers/pci/probe.c
> > > +++ b/drivers/pci/probe.c
> > > @@ -345,7 +345,8 @@ static void pci_read_bases(struct pci_dev *dev, unsigned int howmany, int rom)
> > >  	unsigned int pos, reg;
> > >  	u16 orig_cmd;
> > >
> > > -	BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS);
> > > +	if (__builtin_constant_p(howmany))
> > > +		BUILD_BUG_ON(howmany > PCI_STD_NUM_BARS);  
> >
> > Or just
> >
> > 	BUILD_BUG_ON(__builtin_constant_p(howmany) && howmany > PCI_STD_NUM_BARS);
> >
> > I dunno... Works for me in any case.
> >
> > I don't know if this is "right" solution though,  
> 
> I mean, atm I simply don't know if with the newer compiler
> __builtin_constant_p(howmany) will be true in this case.

That I can confirm.  With gcc 14.2.1, if I change the call in
pci_setup_device() to use 7 rather than 6 for howmany, the build fails.
If you confirm this resolves the build on older gcc, it seems like a
valid fix.  I installed a VM with Fedora 23, which uses gcc 3.5.1, but
I haven't yet been able to successfully build any kernel with it.  I'll
post a patch if you want to provide a Tested-by.  Thanks,

Alex

