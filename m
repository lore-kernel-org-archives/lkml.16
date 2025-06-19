Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D523A229B29
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750337355; cv=none; b=AEC7UqLmZDaKxn2R27C8D9zDHu5dabB6qs7AlZSvJcNEqgJy2JkW141b4pF+xC1fG0b2qQ7B2MN2tqS4oE0YJ7xCGdbIwHP7Cm8CMdLSPUFvj6ma6xQ2UGGGhDjuFoMe5AC6/PN9PUBG9S4PYx08FoJxsxzB6zIzM8TvppJLPQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750337355; c=relaxed/simple;
	bh=CQ1Ynby7HjlrMEtuy9V+AUygvAtb7qYcvRXtArHF/QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aw4Vj795gmcgjzUoG+C4xVU0rl+Q1CXAnRgJ7oIJhJfcat0DcINwA9zrqz+v+IevXHHOOdWBevTTRnKoSzHUujlYbjk29VzghLyho8qG9i96GYkBQRF0ZPAI418iVi9HK5yZUBOtNSMLkvsMBuSTYLAF5t2Y5Yh14RiffUOcRVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jzF6xH9v; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jzF6xH9v"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235ea292956so8360845ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750337353; x=1750942153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q/lJ+JUjVVRbd58/OtFVRAYdVLmgcDw+VEZqa5SvKA=;
        b=jzF6xH9vCWfwFKWOtxVQdhTOu+g3pZR1iqe5t5kR0vHkDbJSSQJYcoSbEBqBHruEjP
         a7DBA0/MBpqPzLdEmDGe9+C9gYq1c7UIQv3iZ/wiSxNNA7COg6/J82p1GzGDhDK3LU6N
         Kl0CGfabEuH0PjtDzhXg2eH06M9J8LqMb+c7FOfoRpQQ9DAg2eROuj028soRdZTZf2z4
         MPVIfc1Y7qCwj2wFxIjimjnBQzZlFalzBrbKzsIhLMLSusPNT4bnyCYRxE4ncMUsNZ9+
         IaF3YFGevQkKsVu+naUS+AjcM6UgpriTM5beTFK2+g5xd7oe17l7q+4Qxa77sNinob2s
         4hrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750337353; x=1750942153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q/lJ+JUjVVRbd58/OtFVRAYdVLmgcDw+VEZqa5SvKA=;
        b=f2KMs3ZkW/wAo++J8WPc8jPoUGa5i4UBcsFqpr83nLlXmFmD0o6sfQbYeMohmKCcpB
         JmBT4ha7lLILoTHcXL2jvMhO5CMZX6oql9wo/Fi4UFestU/32mo9zvzyTM9TqsKmJC9y
         tbHccDH6+Cz/r1f0a+iAN9Q5adklgTWs7hWoTwYrz3rqAf9BYB2No6GotksWVcA42E/m
         b7EdoxneErT6yMkLhAzfBeltW+2FmGVRwWnCZ8GJQ3nDmB3adCxfdfR2OCdDUM23IcCe
         Syzl3cW2PHLsTUQKlC+tgak76kaWPPGnmE9323UZAW3MO8buGG/3hA6WiwG2QaX/g8k6
         3SNg==
X-Forwarded-Encrypted: i=1; AJvYcCVRRODFP9Mx+FUfLrP1ytoQCWMuCITU1PY4fZq0NZe7pWufl2KAo6Dde0sifBS/AC4cWa4aK2JVqXqhkmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpV5LeQx+fWqvekUJzrbggk8XWLka7HuovsVFOmpZvEPUrpvVV
	QnPfhUpaPWkE1R5FEEcRtmWH8+IJJ8afY9K8ulHRtpNAOt2QyYaGhhoPMNxwHfR/wG4=
X-Gm-Gg: ASbGncvzmtvtsnGLntkLXTHslpHku86ptDxLZhNIXSt6nSg0fQH596ACNc/otJMjqZc
	iYGMEmuX8CPyIuJWCA1iEwgQ1cMTBSeU0tZWitkfQTbSDv15gDUfGFacbw5zaXDOEb7IRdzWCg+
	lfupSMvikfvFp6ee6ditRUHE8gA3wJ+HjNljOxr3ebqbG7Sld+6H0jFdhiwP8EFQ2pfZevng8Rr
	ZE2shml65EwRPfENTVjs5ww36ndZYaVlwOQbh5CWrPTfB5WIpihQY+emggTlwVv0W9pjfu9Khal
	j4Dx+B8/3Idxe+bNJ5Ls+3667HTgO/V0BOjS6dShQegp69RKLIvBtcJTulHRr1Tvbr81zyE9D7d
	ylCewO1gMCv8deA==
X-Google-Smtp-Source: AGHT+IH69LtPDdAgrBovWhMgrSjTEeMKCzKN63Bmw3qGTAGNPNoBSMtG8u3ZPMyzGP1TzYebG5OJzw==
X-Received: by 2002:a17:902:d50e:b0:235:1706:2002 with SMTP id d9443c01a7336-2366aeff7a1mr337959005ad.0.1750337353103;
        Thu, 19 Jun 2025 05:49:13 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a5b4bsm119579195ad.54.2025.06.19.05.49.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 05:49:12 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v4 2/3] gup: introduce unpin_user_folio_dirty_locked()
Date: Thu, 19 Jun 2025 20:49:04 +0800
Message-ID: <20250619124906.47505-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250619123504.GA1643390@ziepe.ca>
References: <20250619123504.GA1643390@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 19 Jun 2025 09:35:04 -0300, jgg@ziepe.ca wrote:
 
> On Thu, Jun 19, 2025 at 05:05:42PM +0800, lizhe.67@bytedance.com wrote:
> 
> > As I understand it, there seem to be some issues with this
> > implementation. How can we obtain the value of dma->has_reserved
> > (acquiring it within vfio_pin_pages_remote() might be a good option)
> 
> Yes, you record it during vfio_pin_pages operations. If VFIO call
> iommu_map on something that went down the non-GUP path then it sets
> the flag.
> 
> > and ensure that this value remains unchanged from the time of
> > assignment until we perform the unpin operation? 
> 
> Map/unmap are paired and not allowed to race so that isn't an issue.
> 
> > I've searched through the code and it appears that there are
> > instances where SetPageReserved() is called outside of the
> > initialization phase.  Please correct me if I am wrong.
> 
> It should not be relevant here, pages under use by VFIO are not
> permitted to change it will break things.

Then this approach appears to be no problem, and there’s no need to
introduce any new interfaces. All modifications remain internal to
vfio. I’ll send out a v5 patch based on this approach.

Thanks,
Zhe
