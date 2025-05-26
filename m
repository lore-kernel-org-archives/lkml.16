Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5395019047A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748230666; cv=none; b=TP0OGtfJEKq3VmS1ueP8cZQtE4jOevwCxX5jjgUfaRL1SRLNraBii26aQNt2k8Xe7tBUry3cnnKy6jmhDzrjUMFe6FTAuQzrG36kCR5m9EB5RoX6IOWP3/TjdDcdwCvOSoP1ZvSNnCodW+mpTnwlLqkZKOC0sRhXKGXSpqB/wMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748230666; c=relaxed/simple;
	bh=0z3DW3eLiT/2glKaCIDZdbh8rsKGTVe5AAcsr06pFM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGRVpaDcrD82kDB6c91mAf5CZHAYKH3rc2RmcOau1rumDxCreIzxJeK6VozrhxB12AOy3Q4XuQNqhfiKpt6zxhuYAbp5P3HTcTUgRg5IN+bdu6InqjIoL2tsum1VSlxSI4E1ii/wn5Ys5EJiI/OlUYXwR0PQ4+s+f2r7+V+5xDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OSDNFJmK; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OSDNFJmK"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2342867786dso9436105ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 20:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1748230663; x=1748835463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vLgGkN6Vnumpz6d29VuOLpHKqUjZ78pRp6q7r9W+mI=;
        b=OSDNFJmKWS3bacMH9gBXbPhnb2dnFRUUhdmfOly8Vw4TABMt2E/n0vEKU5WsoNoP0W
         xp1U+zyN4Bn6CPRK/skiOm2/hvAr/VS3VCKhvQ7dStBXqRjR5FFIQ94KmGuRFiGTiqs5
         4CbMnTPWpYpO2vg+2ncehDW8KgyIPKmyDX2GWUYgezV8VYI/TPud/Xe9cIyFa5RSZ9jX
         oyjcOXfqZVydocThKMPJsG/LpeL0c8UJFA6r+K+xXI4FhTYroWSYKsECufWK6gsZ+SnH
         RzFfYuZmhR3LjpAgEmQsCVm5ZvYl5cfvEwa6JddiNDg7Y4QtdgeqiRyCbAThw/jUAs4E
         gK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748230663; x=1748835463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7vLgGkN6Vnumpz6d29VuOLpHKqUjZ78pRp6q7r9W+mI=;
        b=igudeY/4Mpi08CHxH0AICY4pCG9H0W44ABEc0I0/NIdxUg8RSV5vJcDuxSfXZkgdpk
         qPiqiQu7eWlZ83wPJ++qf23WZRWC7EMf2tn7SlgrJAKIUwL89jl01/yeohvVHduKsKrN
         Y3myD7CjAzwag8w3UyFnpA6TA7nMZFsJoSD+0XPqWhKOvZq9VvZEkQ1TOcus93x+ihOA
         G53FiN2e1QPEMYNOjge0z1fN7Q0z+etjUO7s/sZ6Tm74qkms0dsjtz/z5xyP8+7+6N0P
         wTCV/Ly8EMt2BPRf8Fr6AHUCetaPAGRcCcIRMbZRdyBOYVONMTInc7Ev29a+rFZywRjA
         hN/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRf5KeSzvFDyuH0q42XvNk/ikLm5WQ+e633MtqJB2GfIQPUA413pKgN0I/Vue3ax3Pl5cGzgrQgfMVfKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLeDHZ1rNePaDZxzhBAMTrLg8Cj+7Kwt7Ql0Msni5fjnvBlhHA
	SiiqnLHLQbkeD2lGdRQTA3+Mxvxpg+Raeogp9YFxtZR+Pi0pGavYbHX0xXvKQy8Fg3c=
X-Gm-Gg: ASbGncv7yZCM2B2GXvsf+EtS2DvlrfjlxmweigtO/D9+6Hq09rJwF/x4v+NNDi4bzhT
	3kW+5FIG+Kz2aNF++0aA9DOuCrR5rbxV0Hn9N2jcdpzDH1LScLRmGYkYfCKuGj1onIGTNmWM8im
	cBcPgJegwHxvM1X/Dw0JDklPkXJjDD6hte+mm6OFf/wRCm+JLslXIJ4swThLJBUV7xZxRUte9Xw
	YWA1zF6QvHpmBvuj/J2MUCu16hacSY7UtijSo1QyML5HHHnbaFci9F3ybQlRvM9L5leHJHRZI/h
	qLke5sFixubzDkexG9myJ2mP1FgkYRkypRogok8xGyUHhWsu5rc5Hk9LiI9zELhaKPphn6M/KlC
	fshw=
X-Google-Smtp-Source: AGHT+IGbfiSdJOKz3VR9Jajl4YpNiSwAfCQWBstzwpdi7q7BkwasjxqLVZbvgivWpF4goMfpxNNnZA==
X-Received: by 2002:a17:903:22c6:b0:22e:7c70:ed12 with SMTP id d9443c01a7336-23415000f42mr140216175ad.48.1748230663605;
        Sun, 25 May 2025 20:37:43 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2345d5b7952sm9760505ad.145.2025.05.25.20.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 May 2025 20:37:43 -0700 (PDT)
From: lizhe.67@bytedance.com
To: alex.williamson@redhat.com
Cc: david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	muchun.song@linux.dev,
	peterx@redhat.com
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large folio
Date: Mon, 26 May 2025 11:37:37 +0800
Message-ID: <20250526033737.7657-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250523085415.6f316c84.alex.williamson@redhat.com>
References: <20250523085415.6f316c84.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 23 May 2025 08:54:15 -0600, alex.williamson@redhat.com wrote: 

> > > +static long vpfn_pages(struct vfio_dma *dma,
> > > +		       dma_addr_t iova_start, long nr_pages)
> > > +{
> > > +	dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
> > > +	struct vfio_pfn *vpfn;
> > > +	long count = 0;
> > > +
> > > +	do {
> > > +		vpfn = vfio_find_vpfn_range(dma, iova_start, iova_end);
> > 
> > I am somehow confused here. Function vfio_find_vpfn_range()is designed
> > to find, through the rbtree, the node that is closest to the root node
> > and satisfies the condition within the range [iova_start, iova_end),
> > rather than the node closest to iova_start? Or perhaps I have
> > misunderstood something?
> 
> Sorry, that's an oversight on my part.  We might forego the _range
> version and just do an inline walk of the tree counting the number of
> already accounted pfns within the range.  Thanks,
> 
> Alex
> 
> > > +		if (likely(!vpfn))
> > > +			break;
> > > +
> > > +		count++;
> > > +		iova_start = vpfn->iova + PAGE_SIZE;
> > > +	} while (iova_start < iova_end);
> > > +
> > > +	return count;
> > > +}

The utilization of the function vpfn_pages() is undoubtedly a
good idea. It can swiftly determine the num of vpfn pages
within a specified range, which will evidently expedite the
process of vfio_pin_pages_remote(). Given that the function
vfio_find_vpfn_range() returns the "top" node in the rb tree
that satisfies the condition within the range
[iova_start, iova_end), might we consider implementing the
functionality of vpfn_pages() using the following approach?

+static long _vpfn_pages(struct vfio_pfn *vpfn,
+               dma_addr_t iova_start, dma_addr_t iova_end)
+{
+       struct vfio_pfn *left;
+       struct vfio_pfn *right;
+
+       if (!vpfn)
+               return 0;
+
+       left = vpfn->node.rb_left ?
+               rb_entry(vpfn->node.rb_left, struct vfio_pfn, node) : NULL;
+       right = vpfn->node.rb_right ?
+               rb_entry(vpfn->node.rb_right, struct vfio_pfn, node) : NULL;
+
+       if ((vpfn->iova >= iova_start) && (vpfn->iova < iova_end))
+               return 1 + _vpfn_pages(left, iova_start, iova_end) +
+                               _vpfn_pages(right, iova_start, iova_end);
+
+       if (vpfn->iova >= iova_end)
+               return _vpfn_pages(left, iova_start, iova_end);
+
+       return _vpfn_pages(right, iova_start, iova_end);
+}
+
+static long vpfn_pages(struct vfio_dma *dma,
+               dma_addr_t iova_start, long nr_pages)
+{
+       dma_addr_t iova_end = iova_start + (nr_pages << PAGE_SHIFT);
+       struct vfio_pfn *top = vfio_find_vpfn_range(dma, iova_start, iova_end);
+
+       return _vpfn_pages(top, iova_start, iova_end);
+}

Thanks,
Zhe

