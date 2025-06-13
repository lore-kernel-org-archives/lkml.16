Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C0124A06A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 18:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840281; cv=none; b=RC2gYRKKnxHvc1klaV1XM+5BhDrmQ5XDSQCZxTT0FNxP2GyoWVkl72WBWrcZUG4aDIi5cx1yW3pXt6PfQhBZ+FAdzMELP/X1Ts4RUFB34zyPxCTgPIPd4Qr6/MfJNaQPkC0DD3ornRwD+vY7dlJXygL7416nUaDnWEzCp3YP6jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840281; c=relaxed/simple;
	bh=6a70mBR5gM1AQKfRy/dUnWS6O9hJAYlZjtVP0CZvFOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CeAWXEVCvcWAFOp3CPOA5AH8EHMAXQpuHwfH80AB0RuSf3r+DygBk0zuz+qFBUPwV5ZZrMLRg8Mkw17s8Hq0p29LVMzmGRAafJ+bqByVIT8LfsLi3zaSBkdnfSKmOX5SNKz5TlOeepkMhyAGrj8q41vvYpTl9SlnM88nBYwjWrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UxG1HErR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UxG1HErR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749840276;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e+HeKj0oPbKzFuBluChGm7JvkbynPMItuuvMTMriiCQ=;
	b=UxG1HErRzGAFkjZHhObKg6xdfZTb1vIlbmKh/nIorAdNwVYpHPZZmyVlwBvpm2EOeTgMCD
	69zu4WihUM3I3eGklGkcUXASWns2LqJ+B/jPUBegF9ZbnwOFT8Bs3itqvc0NVgdS9L5YL4
	bzA87YCReCRfJJr2K1dPkqfR8WPewbE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-gHqv_wOTORWW4tb8m29bkA-1; Fri, 13 Jun 2025 14:33:41 -0400
X-MC-Unique: gHqv_wOTORWW4tb8m29bkA-1
X-Mimecast-MFC-AGG-ID: gHqv_wOTORWW4tb8m29bkA_1749839621
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb3487d422so31420816d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749839621; x=1750444421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+HeKj0oPbKzFuBluChGm7JvkbynPMItuuvMTMriiCQ=;
        b=pagScNJpci0y1pM+Oc5BvdkeWPOZ4gb/RJx0NR3vulYkarOQOqV3iJOgKFG7pL1QFB
         2pnX74SuWqTYMlSdhWMtUr4li44r+ItanrCGgEWudpO8G7YMXL79QXkIfpCds4o32nbr
         ZpPLIS3duljMYZkOwaaOjOhgsj14zxGTnfJox3RTfbpkiJJoGOgOXuvM7sBdLcWjesoN
         HqkNnRZFcKkqNK/PdHvc6tcRgzTaOVbqJZWvsi0Cj43/irpweoCQyxtTwn0QkRcbcZOK
         9sMZVQUb5dL1WEVz5NdKMD677HnXE/9oRhTrnQlTW67Z1MagSUeSahbPZJ1js1be1LAH
         NjpA==
X-Gm-Message-State: AOJu0Yy2A/3FRO59Md8P4ELtrmcCp3V+VX2jXrfzQ+ZLGHFh7+0MppP6
	XlljHSe+RXZOZejnshUeyX5qr57KEX6bW5VS6P3uPOceBokO1ideVSMhNm1EZYHKbvawnTntRmn
	aK08XMYg2xQdD920IpPuiPT9cqV1TIP0qCLWtMO/oo78g5SLoIMZWD7cVEMY+d18VLw==
X-Gm-Gg: ASbGncsnwA4MQW73dXzoqR8VJ2ISI0wSkcWO8gFyRiv1oO3LXnrqjryqfA9dZcSUG/G
	xfUb1yPH2dZg6ajcsso18+y3szldePBPV6Y/WrSzz7UYw/LJN6P3BSpSPOES5q+gtyv27S0Edze
	d8z4Alh6KoHQ5CCZ5DtxbD6RZ7fyt+m7wMa/z6a2axPpW4BI9I44SouyVeQxs/Eh0w6o4knm9CI
	vVKuk2b1CNCtGQQF/+hw0gFDkmXIYOr7KxIy1inNWGq5c3/Yw2AI2iCJj1VwKdjSAN2H5isHvJu
	aR4NVFlCc6664A==
X-Received: by 2002:a05:6214:501a:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6fb47735b76mr7440966d6.3.1749839620701;
        Fri, 13 Jun 2025 11:33:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaWsfn6vwDb+V9X/y8MAjOX4XGXG/TuLNUm9j1qtPaErCuoGm23yBpEJIBRHMnqiYA3mkp6Q==
X-Received: by 2002:a05:6214:501a:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6fb47735b76mr7440706d6.3.1749839620374;
        Fri, 13 Jun 2025 11:33:40 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c8662esm24512436d6.115.2025.06.13.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 11:33:39 -0700 (PDT)
Date: Fri, 13 Jun 2025 14:33:36 -0400
From: Peter Xu <peterx@redhat.com>
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Alex Mastro <amastro@fb.com>,
	David Hildenbrand <david@redhat.com>,
	Nico Pache <npache@redhat.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>
Subject: Re: [PATCH 3/5] mm: Rename __thp_get_unmapped_area to
 mm_get_unmapped_area_aligned
Message-ID: <aExvAJhKNITCogmK@x1.local>
References: <20250613134111.469884-1-peterx@redhat.com>
 <20250613134111.469884-4-peterx@redhat.com>
 <AC89F7C8-C6D5-46AF-BF2E-35D81A3F4928@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AC89F7C8-C6D5-46AF-BF2E-35D81A3F4928@nvidia.com>

On Fri, Jun 13, 2025 at 11:19:30AM -0400, Zi Yan wrote:
> > -static unsigned long __thp_get_unmapped_area(struct file *filp,
> > +unsigned long mm_get_unmapped_area_aligned(struct file *filp,
> >  		unsigned long addr, unsigned long len,
> >  		loff_t off, unsigned long flags, unsigned long size,
> 
> Since you added aligned suffix, renaming size to alignment might
> help improve readability.

I'll use "align" per Jason's suggestion, assuming it's ok and shorter.

> 
> Otherwise, Reviewed-by: Zi Yan <ziy@nvidia.com>

I'll take this though, thanks Zi.

-- 
Peter Xu

