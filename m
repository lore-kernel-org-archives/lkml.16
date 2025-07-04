Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78A262A6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751595633; cv=none; b=fdhLYx83PhcDBn8VyhaQ5xG/yUUw5IMb5QLOdltLnyg3K2eJcF3yeb+/JQJ2MReBbonIxfghKToG3gGBiKKGgE6p2+eV/8QJB+M8D/OD9sHWy1WrRub+IFwYDFOyEXK/UoKxuRbqEdA5Qo33In6aqvoqMvjsz/vJ5fGsjhqUU2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751595633; c=relaxed/simple;
	bh=ycIHSnGYILJIPVpfKHa7ftGdGsIB8TwD8cX2/vQx/UY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S+wrpZWhfMNuV26gqGTbzlK6wkxzJkQ5Mb50wM15Phyq4cBV17SvXWXN6eRT+KgtVfeWgpmZTQJ1n6HZkjMr0iAAY71qyu+C8Qs8ctjGCz0N+KIvmt++dR0omJrjJvpKPbibOuMF1aEt63XWRkExsjy3pkIOj4BAU9Cesvzv6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=j1J9cO7a; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="j1J9cO7a"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso624340b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751595631; x=1752200431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB2mhHfPsdN/BAHed7HqkYTpkP4d7ANXryStYAUTRgU=;
        b=j1J9cO7aMDyQmkhusxG8aMeLib4pH2ViQfhYNhQjK2l7KpX3P3V6sZs0WOGgf81Tdk
         6mw5r72IRloqSqxM9cZC1jux+4WOnA98YcT5pNpn9wu5SZoKZJ0RWq1s6I0KKQkOlUi5
         yyA9izam0GT9ilPkO6FbOVCjkuOFKofjwhZMzm0GRbxiIsGiKc1HIvJVO72qudLjEP9/
         fSIr8FFGgBzwkpVB2uDvvkabXc1hOTWuXrvBadyhzEsgTOZeaBWH1Xq47UGhjnNSloNh
         Wkpyx16gp/c7sD4TtKAkBoEyTi0Zlah+ywfq0KKgPT3Rp24NqwQYA5PfeNKp14mNSrvz
         Zv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751595631; x=1752200431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nB2mhHfPsdN/BAHed7HqkYTpkP4d7ANXryStYAUTRgU=;
        b=RTFoanRTDzYBnLHlSG2WKiRiJgiFTqAM1nouhRFxJ5GFEXDMFn2GjJvyX5S9Z2QKd/
         cuinZyTbIsGrULU37Udkd8KgZIPBrjKrDOMhLANQ6GynHZ6tA5wSBFLUlR7J+ac2Krm8
         l7xz/Tq0BwqQcloqGM+rRm3FQBzSbma7zgqSuR/vF5BLn1flhNDUMKuKYGrsxiVyT8ha
         aBZEgbrLgzDXRTqt0OYExPLO7DBgzxztD8sQtuifpIb/WtXYauP/MPWUsS714YsxgPR5
         8lhx4UJJADGCNBpMYtgM+17Q78h+3xzHnBE6GEkDsVTOBYFU3pA+k7Ih7wmzjK/U6/Jf
         OUfg==
X-Forwarded-Encrypted: i=1; AJvYcCViU2ApD5q6lzXAQ6dWURmtlDJBMlCcZJ+Wson79tuoQxXH1aCN8vDV4weugd0I+NcjfRBlAan4inrmNgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxaY78+NYMxyDgpz5C+d9DSlut8QIbAHhHfgyYdgk7j16Xl+wl
	3Qj13jpOmVHJJOxTFAova63lHbeooMR/z19Szg3aUjRsgf+G/Ed5e26b2TDz23Fkk14=
X-Gm-Gg: ASbGncs13J9VR8b6zZfJec5hbLA+eyZg7jZ5RKmkJTD2u0kof5yAsbGw5d6++4F83B3
	ocoRTQrZBVgCiLYNKK5NW6O4OGslAqmmPvw872imJYCJ+9rgha8p4dv1nbjd5AMOsAy+6F3u8C9
	S2sBsKEUlH36tBoURJisqX9ZMBDhcrT4joWOWnq9Ro7MxhCcf+wcipt7O/QhoQTy+eZg4UkjSa7
	d9SicyLFe3vpmHlRCjUpi+DLhKdr35UsCa1foVsQyDPW/VFWGKshQWpQTN1YioRIqPxUXY0C6Qk
	JCyUzatL/c1xiJ+ZRKYsM5uWjEgTCPHWLQBE13MMcvis2OXcvTqM7xdnjI0NLIsEFhKT0/8xtE7
	Embk2ivOVpjFFzm5iq3IqYb5h
X-Google-Smtp-Source: AGHT+IF5FgaG48Lz7SQabgqQ96oyxCzyELFi6hJD/bR45TR94ijLKiZUWTQ6L0DOK/RO4NSLyKHLaQ==
X-Received: by 2002:a05:6a00:3e21:b0:749:8c3:873e with SMTP id d2e1a72fcca58-74ce8ad900emr652873b3a.24.1751595630812;
        Thu, 03 Jul 2025 19:20:30 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cc722sm799335b3a.49.2025.07.03.19.20.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 19:20:30 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@nvidia.com
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 2/4] vfio/type1: batch vfio_find_vpfn() in function vfio_unpin_pages_remote()
Date: Fri,  4 Jul 2025 10:20:24 +0800
Message-ID: <20250704022024.14481-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250703122756.GB1209783@nvidia.com>
References: <20250703122756.GB1209783@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 3 Jul 2025 09:27:56 -0300, jgg@nvidia.com wrote:

> On Thu, Jul 03, 2025 at 12:18:22PM +0800, lizhe.67@bytedance.com wrote:
> > On Wed, 2 Jul 2025 15:27:59 -0300, jgg@ziepe.ca wrote:
> > 
> > > On Mon, Jun 30, 2025 at 03:25:16PM +0800, lizhe.67@bytedance.com wrote:
> > > > From: Li Zhe <lizhe.67@bytedance.com>
> > > > 
> > > > The function vpfn_pages() can help us determine the number of vpfn
> > > > nodes on the vpfn rb tree within a specified range. This allows us
> > > > to avoid searching for each vpfn individually in the function
> > > > vfio_unpin_pages_remote(). This patch batches the vfio_find_vpfn()
> > > > calls in function vfio_unpin_pages_remote().
> > > > 
> > > > Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> > > > ---
> > > >  drivers/vfio/vfio_iommu_type1.c | 10 +++-------
> > > >  1 file changed, 3 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > > > index a2d7abd4f2c2..330fff4fe96d 100644
> > > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > > @@ -804,16 +804,12 @@ static long vfio_unpin_pages_remote(struct vfio_dma *dma, dma_addr_t iova,
> > > >  				    unsigned long pfn, unsigned long npage,
> > > >  				    bool do_accounting)
> > > >  {
> > > > -	long unlocked = 0, locked = 0;
> > > > +	long unlocked = 0, locked = vpfn_pages(dma, iova, npage);
> > > >  	long i;
> > > 
> > > The logic in vpfn_pages?() doesn't seem quite right? Don't we want  to
> > > count the number of pages within the range that fall within the rb
> > > tree?
> > > 
> > > vpfn_pages() looks like it is only counting the number of RB tree
> > > nodes within the range?
> > 
> > As I understand it, a vfio_pfn corresponds to a single page, am I right?
> 
> It does look that way, it is not what I was expecting iommufd holds
> ranges for this job..
> 
> So this is OK then

Thank you. It seems that we have reached a consensus on all the comments.
I will send out a v2 patchset soon.

Thanks,
Zhe
