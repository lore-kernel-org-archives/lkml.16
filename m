Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03562989BA
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750769963; cv=none; b=TrZ7Ddw+KU2GU+cm7yH2I4KGlTBp53UspbX/Bx7KVm61t2iuWDiR6/1HpUq3a+FcSB8gS+a6z4U0vVI+vHpEaN1ZPd0vKbmbaWtQNPFdR4sr2WsvJhK012dOf5cW8zSld2i9sPwmpjbDY7M5nw1qnOZsgAp4ttCOs1Vmxx8tEBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750769963; c=relaxed/simple;
	bh=cvjizOyEIrXT0uNzm92zKYYShRNkJo9Vg/UPBBijHiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS91nx56LkUwGJ4kLxpujuiBkgLjt4rQTRDT+Kgr9IM/qzrIZM+2YF7LZS7KJnocI7wfF24bYMCDL0xZXMrK54rAHwvo7E0et5VjPpPk9BS89eXppqEqzHdgGPSf/3mDkrYTOBfQjQVJGfLeZgHBM46d83A7OX5pFggH+C36/q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/Q4qtrZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/Q4qtrZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750769960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cvjizOyEIrXT0uNzm92zKYYShRNkJo9Vg/UPBBijHiE=;
	b=U/Q4qtrZGdrzjCv8wXEu8VgUPxieiG7B+xBcXJxxC0+/JS0/1866Y7fNHgNd041YFvP5BC
	PllQUyXs0IC/24m0zU59R51+Ax6hWGqlpELfnXp6ffHU1ypN0l9puiQpnWVfVxWtfKXlmw
	aMxcAAkrrqk6fkOoC3GDVSO6d5EmbuA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-HN2R91cOOBm627y49SaxvA-1; Tue, 24 Jun 2025 08:59:19 -0400
X-MC-Unique: HN2R91cOOBm627y49SaxvA-1
X-Mimecast-MFC-AGG-ID: HN2R91cOOBm627y49SaxvA_1750769958
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d244bfabso42548885e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 05:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750769957; x=1751374757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvjizOyEIrXT0uNzm92zKYYShRNkJo9Vg/UPBBijHiE=;
        b=k0ct1sGukmLFNkeXPlXQqhjbfDhFuBluENlOYd/q4Ccpo6uGlv1BCVYYRWVkxM6Z+w
         ELnOylnOC/ciclGkXEO9edXFxFkcUaMqjP4Kp8POvmoVPdTEJZy/K9NV/gDADMeexoe4
         9ePYqCEo2M2s5Qg4SRJwQeMUt4AoZan/Np6r5OBNsySfTlhUgQtluvhEFnYdYPDfwSQK
         RK/gnD3x53u2iv+WcctUQw0n4DLhSKzN1ZJW9JLAUs4XbX3PY4zOgLJbD9MuF18j4YMU
         LbctwRA9cS/2XalXwbbVaZmTjtf4JglJhC4Jh+52MLgUGubv6UQ1nzmG9sNUFy+cEGn3
         c9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVU2URVgszQTShIroQ36eEUWBbEr8Sg1QU8d6TfzNbcojqHDERVHk+xlcDVGTFVGP+DDcRvMPUaaCrVbmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI9uRLor+mYGXinTLuOaojzOL3yiCp0b2tedXkJpBkixCvr9Bw
	gfQLYu9jBsysCNSN9cRQ+/rV38ET7+tpPMSLvD7ByG+J+xcxUIbwokPx05l5YebF5YLGJ0DMj/R
	MwCZuVSPn5KY7leKUINt+ekITWwsm48kHNWMYdxOw09d1BsSwFLHfdm1DPOAd/BUQyZaQ+AEVmQ
	==
X-Gm-Gg: ASbGnct2IUdklB+cINhjq0fKqaWqJXpvPgrHvIX/LvUyCQMPFaqziVHQwuLwfbaIBQD
	EkfuV3g8vzcp4UW04CEC1EIa0PdKdyijKnY9kXjGKmf5Gazj4QQytzsdAQ0PcX7ZayNK67oKvEw
	W6zx2n4r8W405TckbKCy70kXxhFqoPVkYSeexOPzBXpfIj9CEu6D9OgWmx8o4BVwDMtMB9mcOKA
	lUuMs1ffQbvqo+q+4LEiO19wttzUd9WrvFw5Qpid//fz9tgaS/0Y+RGVJwJtzwHMAyccCzHIA4i
	xCCSOgznNy+fhqLcYkXDQlMQBK0QPXDuMGTBPbqncXH9p5PpDcA=
X-Received: by 2002:a05:6000:2a11:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3a6d5fd4736mr7854409f8f.18.1750769957119;
        Tue, 24 Jun 2025 05:59:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdRZ8CfwkSXztROaY4TycHnHhL1k06+rocp1kDLUayQBRlXpJlPKQEcii6Pk2TGDSE1aNzuA==
X-Received: by 2002:a05:6000:2a11:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3a6d5fd4736mr7854390f8f.18.1750769956710;
        Tue, 24 Jun 2025 05:59:16 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.4.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8106a69sm1868210f8f.79.2025.06.24.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:59:15 -0700 (PDT)
Date: Tue, 24 Jun 2025 14:59:13 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: luca abeni <luca.abeni@santannapisa.it>
Cc: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFqhId-qMFNyPD1s@jlelli-thinkpadt14gen4.remote.csb>
References: <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
 <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
 <20250620113745.6833bccb@luca64>
 <20250620161606.2ff81fb1@nowhere>
 <aFV-HEwOTq0a37ax@jlelli-thinkpadt14gen4.remote.csb>
 <20250620185248.634101cc@nowhere>
 <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFpYl53ZMThWjQai@jlelli-thinkpadt14gen4.remote.csb>

Hello again,

On 24/06/25 09:49, Juri Lelli wrote:

...

> The following seem to at least cure the problem after boot. Things are
> still broken after cpusets creation. Moving to look into that, but
> wanted to share where I am so that we don't duplicate work.

I ended up with two additional patches that seem to make things a little
better at my end. You can find them at

https://github.com/jlelli/linux/tree/upstream/fix-grub

Marcel, Luca, can you please give them a quick try to check if they do
any good?

Thanks!
Juri

