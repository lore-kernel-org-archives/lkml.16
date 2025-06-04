Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311C426981C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023921; cv=none; b=s42hiCSTDga39g9X6k3F9qfUEQnsZ5zET/jkOQA4RS3gtuOx3n9GTQ87rtzINa7NA0ZU0T+V6PILuXVnVONHVb7Vi+7+hpDlNQtwIiUPPZVs6kMBEAbh45n/9bwhZHnpKMyqbufkrY/0A5dU6RYFOhmximIQrdJpaYSp63FWJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023921; c=relaxed/simple;
	bh=jXoEQa4n+T1Kw1wrWF7p8M6Blxs7hSx8GnF38itpWII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCdRCVORm4PwF014duUbz1D/NzEsdOAU6HvpGO09qwfFFWv4EyboNrVkGGDqj+W3jydzcPK4hxrn/Hcqk4Lr7H79zJdNytclZxVN8elHFCsH1YGuqstbRn8MUdxfgU+STK/WupkC5r1HvC/d8HdZo6eoauoFmLC+EK/9sh5B0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=aw4NBG5w; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="aw4NBG5w"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-312116d75a6so5370172a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1749023918; x=1749628718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvXmFFuXZemPVLmDJrliCn1kqX4Z09vjc+TkZ/tmAug=;
        b=aw4NBG5wRT7xpyXCZ3nqWi+Xa2HptsL5rEKIGtYA77WZUZADBwzOU9yGUzKUkzMCMt
         pmlnUH5xZxhPH4I5oBrzFO7A6IyfLWR2T4pmt5CrqiEAS0bgJQ1XbRQtogLCbitjinyc
         82BverSgckxJUT2AcyYMNEQINvt0pBZ8T/IdPQfWniC+OD6zilo9bf3jC6d1TRmBwrKV
         73GIBXoxAEz98GD48oaZMS1me6H8tWMRhlrebZj98U/lQTgOrOdCzVM9cIUvu3OJrGFS
         8dFVLeLtPOrPYe7XBJm69cl28sLNilxCODUSoIqiZrovXQPRONwyiB8U6h8OXwGwszJs
         dZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023918; x=1749628718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvXmFFuXZemPVLmDJrliCn1kqX4Z09vjc+TkZ/tmAug=;
        b=ICXs8ALg+z4boYKKmstl4H2YnYsHZWXTYy2Pi4NCfcnMNKi8N7B4G/MGU0TaLSLc/I
         FwEwsgbb7jjf2Kxezkg5BTXIfqhT8JyGMqOMTEuzc7cNrPPvdqBMpKdmwhtPNa3eg6c9
         gMrJ3vIzUo5RVuPB+HSlQsO3GGYD4nc7Uawc8/rhWmUX9O/vwvsOihcebtDC3XBA8LO8
         HW9z07LjpvKyjCe8c5oQ8/5GQ5teJx+q9DEVtVzSXKUUQf/fnLOBZCTkk/briHIzt2Bq
         AXnTg1ua6qfZsoAe0HGjVk4LbZho37PJMOfQOSMbziquWJb2sNCu2RLa75xzH+ma2d3a
         zvKw==
X-Forwarded-Encrypted: i=1; AJvYcCX/iKRBhDtZGc8KPDQDoXKrce8B9PMOoEpfjUJYNfj1Vx48p+AN17BvDWY89kFC1M9AYDYZaJ2w6K65TcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycWy+434da0eDdqb0D1NHF6Eslg4JjntdaXZAZdr6OnQGpsZ9
	KNOg4MFIsvNaEgy0fdLk8qcRMn5Ive74icopRl0R1oStzj2Xf7OD62fjHx4U/FCwPDg=
X-Gm-Gg: ASbGnctDI305nZjf+TACOgELo15X5B9+MYYDDYlbW5xx8SwV5dolb3jk0Quie9h1/WX
	AwhGKSC7rs3HI8CMOriUp0/JMF5JvrwfauyYqYNEsuranM5dlM2XAUbt47d1dThpVH3x6AilCxv
	+gZq9VaAL0NnWX9ng7/1DKSd4+sGsTUWrQmp2WBPR6c8SfJUEEAe9k0zIIDgMTRGcl/f51Um/De
	KikA80a/ZtZPPoT4y4CGeIBD24h59qGRcwX8qz4uVBKvfRCjojW88cEJnNjJOUoN2+vzN9KX3UA
	e7FRWALieQCG64m4fusCddI1yhDkprnqTFJTDjZ0rKkbDem+kV6X5FnHigzhTIvFdl6rJacjSAV
	9XQk=
X-Google-Smtp-Source: AGHT+IE8ZdBcfHRqeD7gLSsugXNBHZwBfcGsxChnuZcWsLIjnwQIZA7o60dEujqTl4yozJp30iiVog==
X-Received: by 2002:a17:90b:388d:b0:312:e76f:5213 with SMTP id 98e67ed59e1d1-313110995cemr2085795a91.28.1749023918030;
        Wed, 04 Jun 2025 00:58:38 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cd362fsm98677305ad.116.2025.06.04.00.58.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Jun 2025 00:58:37 -0700 (PDT)
From: lizhe.67@bytedance.com
To: akpm@linux-foundation.org
Cc: david@redhat.com,
	dev.jain@arm.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v2] gup: optimize longterm pin_user_pages() for large folio
Date: Wed,  4 Jun 2025 15:58:30 +0800
Message-ID: <20250604075830.27751-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250603204414.f2963e4a094e360cad7f966e@linux-foundation.org>
References: <20250603204414.f2963e4a094e360cad7f966e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 3 Jun 2025 20:44:14 -0700, akpm@linux-foundation.org wrote:

> On Wed,  4 Jun 2025 11:15:36 +0800 lizhe.67@bytedance.com wrote:
> 
> > From: Li Zhe <lizhe.67@bytedance.com>
> > 
> > In the current implementation of the longterm pin_user_pages() function,
> > we invoke the collect_longterm_unpinnable_folios() function. This function
> > iterates through the list to check whether each folio belongs to the
> > "longterm_unpinnabled" category. The folios in this list essentially
> > correspond to a contiguous region of user-space addresses, with each folio
> > representing a physical address in increments of PAGESIZE. If this
> > user-space address range is mapped with large folio, we can optimize the
> > performance of function pin_user_pages() by reducing the frequency of
> > memory accesses using READ_ONCE. This patch leverages this approach to
> > achieve performance improvements.
> > 
> > The performance test results obtained through the gup_test tool from the
> > kernel source tree are as follows. We achieve an improvement of over 70%
> > for large folio with pagesize=2M. For normal page, we have only observed
> > a very slight degradation in performance.
> > 
> > Without this patch:
> > 
> >     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >     TAP version 13
> >     1..1
> >     # PIN_LONGTERM_BENCHMARK: Time: get:13623 put:10799 us#
> >     ok 1 ioctl status 0
> >     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >     TAP version 13
> >     1..1
> >     # PIN_LONGTERM_BENCHMARK: Time: get:129733 put:31753 us#
> >     ok 1 ioctl status 0
> >     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> > 
> > With this patch:
> > 
> >     [root@localhost ~] ./gup_test -HL -m 8192 -n 512
> >     TAP version 13
> >     1..1
> >     # PIN_LONGTERM_BENCHMARK: Time: get:4075 put:10792 us#
> >     ok 1 ioctl status 0
> >     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> >     [root@localhost ~]# ./gup_test -LT -m 8192 -n 512
> >     TAP version 13
> >     1..1
> >     # PIN_LONGTERM_BENCHMARK: Time: get:130727 put:31763 us#
> >     ok 1 ioctl status 0
> >     # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> I see no READ_ONCE()s in the patch and I had to go off and read the v1
> review to discover that the READ_ONCE is invoked in
> page_folio()->_compound_head().  Please help us out by including such
> details in the changelogs.

Sorry for the inconvenience. I will refine the wording of this part in
the next version.

> Is it credible that a humble READ_ONCE could yield a 3x improvement in
> one case?  Why would this happen?

Sorry for the incomplete description. I believe that this optimization
is the result of multiple factors working together. In addition to
reducing the use of READ_ONCE(), when dealing with a large folio, we
simplify the check from comparing with prev_folio after invoking
pofs_get_folio() to determine if the next page is within the folio.
This change reduces the number of branches and increase cache hit rates.
The overall effect is a combination of these optimizations. I will
incorporate these details into the commit message in the next version.

Thanks,
Zhe
