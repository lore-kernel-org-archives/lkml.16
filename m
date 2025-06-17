Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194E23FBB3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153642; cv=none; b=srPk6/+gB/HFP5S6eWMoycSSl5iVLRKy7wB5HcBHtV608oVcM+0Cr8dhWZD9XufYplHoJalJXZzrXDIgO+ozMz0z8a4ZTGM5PtUNKAmpDrb3TovAlELOD+T0GNVuvaKRNKntnnRscdB0VXH5lxRVWSZqoCwOBOXUZP4GkW9UNJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153642; c=relaxed/simple;
	bh=hbAOen0mndnPVGThYal48b6Qsq8ss72uXnGVk6FVKsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONOIn8Pi+cMdfI8D8TrMaLXHIfasQJ7os5q68oIG44ItVJQTliJhY8KOIQdmmoFb9NnBIPN1RT479XFjEaZUuUxPCQHcqQx8OkOEAtkucUrZGgIefPTRjUV5/Qw+gfWaDtAR5Ihtzyyq3M2L/WZ1XIR4cy81I8k0AJUSnuvoWWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=MkUrAEwK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="MkUrAEwK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2363616a1a6so42692555ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750153640; x=1750758440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2kX7kwU00/VILvEVMTOYheAsMG6cGeF8RMM8/0Bh3M=;
        b=MkUrAEwK4ZO20hxafHRzVYQqAQYR1X1nBJlbObr9mEfq1j4StlF/OU55/RW8WVXbDH
         Xr1O8DATOQADHUQ3CUD8P0z6ToQibcyatijCUkbJHiJvtJaXi/FX7JwyQfnwWH/SlJ3m
         RiRH8z5nCLaqE6YckjSQd9WRXBl/iqTyExIWOPzDvodXDggT2mOtyvFmdH+LfLg9BpZI
         rcKPD3VENeokf5A1pCUK5Zi88w83S0+sRND0x40rw/2EAvGsbFGtP/aJ88D+r6O4oPfj
         vXz6yddLO/r+sqSek8bwrptXez26wN+ujM6tN+bzsF4dP4OMf/Yj1vsrO30KNpDJlRxn
         rXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750153640; x=1750758440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2kX7kwU00/VILvEVMTOYheAsMG6cGeF8RMM8/0Bh3M=;
        b=wPbB4lSsH34KLvKjKSKrIYaJRM5WiFthN8i/wBP6a7G8lBVdNS2en1deeO5MzNlJjV
         XFRnEWGkVXAfk2jBg3jqzqXrH4JxBvkZ3HpoR0UmQKOR5rTTp0ZjnSncA2c/KGczbL0w
         KMuSYaG8i4BItjVZktLyHOpUXy/jB7azOWbR42DWI1oUBcrEyoaqPYVeAUToJL5xdZNy
         VM9Xx1/CD9T4ErMn1e2GjgUxDu90g7q5IcwEJW07XZpSf5Yo55XazmnZkQq+U/80GfVC
         r9O55C1d300yiPQYYqK+6hXCO9WsiJ3bhejjXoo3QBV2jw3rAPABofw/35HpsuH/bPEJ
         NaSg==
X-Forwarded-Encrypted: i=1; AJvYcCWl1ZzY6oHAYTMXlAoeAdqxc++ILOC6lcLaxwZsLPBMpKBOoIRfA4djm4LEq6Hd8RSXZ48bNvtHmGkvxB8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAeXxCcs9jSus8l+tOXtdF6DaqkW9q+a0t/2TRzaEv4o8oExYz
	qdhNvCQbKXOjFsCFASJICVDJ3qnGqs/HZQEALVir15iSqdKmPJ/KBsgvNSxh9QQX+Sw=
X-Gm-Gg: ASbGncuV6dg5OpwaFEv9NEyCD3CKR8jvsrhSMnX1zrBCgP7S0BidqEcC9LltD2xJejE
	ZXA4EkrXsHJtZhGju7X4WJcc5tTp35YhIWuf2iIMe/NjX22iLY/4yIzCm/qkgfHntJdnZaOLCNq
	cxG6GZxnWM2ojiG9mpr8WDyJ2mqElyNfb/+ADBhvOJ59QpIjekP95XX2u2nAcL/AeDo40K5dNor
	/jO6VxlLKj6gSk9SdkmX7ffUW1z/29nrxkONEAyugsd6PvWOyniOS2r1BIXlfhByEBB4Sf0L21n
	XsQYl9vdJVfa2yPSGwDPm1mltDMvsJ+tSgEua3DLx15+ElQIX4L8DOQq8Me9MrVvBXvQny2gBck
	FZz1HRhbTqieg
X-Google-Smtp-Source: AGHT+IESDTvDlZtVICySxxTxUX5c7za0ABSNQvG2zk5eRdds5SR0YkPg1SIYIgfPcl4/b4u45DB0YA==
X-Received: by 2002:a17:903:22c5:b0:235:779:edfd with SMTP id d9443c01a7336-2366b14f864mr187735825ad.39.1750153640379;
        Tue, 17 Jun 2025 02:47:20 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781dfsm75975395ad.131.2025.06.17.02.47.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Jun 2025 02:47:20 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH v4 3/3] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Tue, 17 Jun 2025 17:47:13 +0800
Message-ID: <20250617094713.12501-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <e0c741a0-450a-4512-8796-bd83a5618409@redhat.com>
References: <e0c741a0-450a-4512-8796-bd83a5618409@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 17 Jun 2025 09:43:56 +0200, david@redhat.com wrote:
 
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index e952bf8bdfab..d7653f4c10d5 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -801,16 +801,43 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >          return pinned;
> >   }
> >   
> > +/* Returned number includes the provided current page. */
> > +static inline unsigned long folio_remaining_pages(struct folio *folio,
> > +               struct page *page, unsigned long max_pages)
> > +{
> > +       if (!folio_test_large(folio))
> > +               return 1;
> > +       return min_t(unsigned long, max_pages,
> > +                    folio_nr_pages(folio) - folio_page_idx(folio, page));
> > +}
> 
> Note that I think that should go somewhere into mm.h, and also get used 
> by GUP. So factoring it out from GUP and then using it here.

I think I need to separate this out into a distinct patch within the
patchset. Is that correct?

Thanks,
Zhe
