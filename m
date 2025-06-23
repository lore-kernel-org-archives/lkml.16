Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D5C347DD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750685824; cv=none; b=Ci0+Z6Gt/IQ5eeEINhpBmC4fwvSW5SZnrZpTrmZeWbUIc1AeCDuGeGRDQHMpJIgxK0IsIrDQ/gKoy3pfM9oZDikpOr3uP60g9RP7wn294r33un3DWeL7giJOvWkGJWfF6Hr8MieMXvdxVG1XAwzdmniEWbQz6VGe1jWfVzRZ7bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750685824; c=relaxed/simple;
	bh=pwT8y0eW+0eBgpWUCfJztVLj16jy0yZHFfiCTqxMPRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kkKb5OKNf55PwkT+7ibAaE/90jBZ1LquaPYoZ+woylHmpNpaE23TcAEq/KV8nEAgODTJBn9n95MY2Y8PiptMjLKE5rW9VAHE7AkYBpiaGesTu+pGUGP+0WypJsfqxDwsWtjmCvZy8Nf02TXokkvXer/vYCX879WIba/St4n/eBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J5QSU9Ny; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J5QSU9Ny"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750685822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1IKaC1EApM7rce8Uqj2pcO/2+UrvEdu+0b1GMTglfVs=;
	b=J5QSU9NyOdjIfthP54pqwsw5jpaWVlsKHlzVnH253687oo7qzdGy7n07QTrRFyE3Ct5m8q
	kSmtb++riwnOF5vc72RApPiV1yPwNunhbCb0w66RcfziEAY5qrzVQQC4uCUBj6lLkquNcj
	v9bbnkQq+LSZcxKE9wzsWSftb0EiVsI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-WaSlsKjXN5WjMb3cnXlONg-1; Mon, 23 Jun 2025 09:37:00 -0400
X-MC-Unique: WaSlsKjXN5WjMb3cnXlONg-1
X-Mimecast-MFC-AGG-ID: WaSlsKjXN5WjMb3cnXlONg_1750685819
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23638e1605dso29585895ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750685819; x=1751290619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IKaC1EApM7rce8Uqj2pcO/2+UrvEdu+0b1GMTglfVs=;
        b=c1Igoi4zoP8sOVbTnsR/e/9Q0o0OuP0d3bVqBzPUub0dMCTMWt+fJGZ5WxSCoMkx2N
         gZFYKVOdyjnvAuSERiuYZZ8dAcmin867RRpN3HM5hTVH8x3in4esMyMrpUNAzplKOG2c
         m9M7+a5chpbJb4J7sg/jSuUV/VYTFpdN4cUSzk0Oh+68j0DrlM2Ek2dkWM/MxDI10Lg+
         RNWdIoypLesKbTxqukU+lk/Ud23eSkkc4xcpGkTYE7WtY/HYtSe2dQjIiJo7CUA6LWrh
         CILh/nC1JHk8mPmJ7N5+m08EU+7m7UHYRynqJ+UO+IDssKrePWT11Xjm+ksegc21pKb8
         Jwww==
X-Forwarded-Encrypted: i=1; AJvYcCVfIdHQtu9P3AJDPjmcK+23j9HvUXSCjZFw5HfqoJjq4fU4DHApn8RIrfSbkRvBUZ2AxLGuv02NKMVgrGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS+dlKKfH7cbFCJ8jqAgR7Ta5Hg7E4m/ZA0MTRHMZgof5st8r3
	/xcxtviQ978JiyJaNiSX2WpRGiN8O2lJmaMMLq5KM3lYuW+7AGKLPXnArJ7pb11MlbPz+KeFKyg
	RkPX4w8cdjtQcpH9wOzJ8Kg2dnYbsIgyZzF7xnnBH0WKzMQZGKuE2tNDqH8bX4pLgBw==
X-Gm-Gg: ASbGncuN1k+MwuTYbSXDfmGfM5IykuLcO1PawoKm1rdpR4zotwh6gbgD0SunhtoTC0U
	7PICpb6AbeQkAFeORanDttsOqEqVpQLtzMTGYZP0lUam7BFkrsfFwXy2iqTahmzzLvPDzvOw6Ww
	z45LklDRPzkNsQyV6UlJRH04eIZoDmJ8O2raC2AN66al8pK4n0DVPKC0v9iAF/j4PyxMEWhANJU
	WQ1csTwVX+z36OCSwhohEgD8ZQdfQjLahwiPTGR91bs6DTYkudSJ3h4TR8IhNdwdL7pzOjDmYNY
	QdWVMGyL+MWDwg==
X-Received: by 2002:a17:903:6c5:b0:234:c2e7:a102 with SMTP id d9443c01a7336-237fd86fa81mr20632485ad.43.1750685819315;
        Mon, 23 Jun 2025 06:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ9pfKhkybFZwMEoVKus4iI+b0f4cjr3Sy9/3yjSaxYwi3uzYoQTJpcEDNdnM1+apKZuSA9Q==
X-Received: by 2002:a17:903:6c5:b0:234:c2e7:a102 with SMTP id d9443c01a7336-237fd86fa81mr20632065ad.43.1750685818935;
        Mon, 23 Jun 2025 06:36:58 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8393535sm85291215ad.8.2025.06.23.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:36:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:36:54 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Muchun Song <muchun.song@linux.dev>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	James Houghton <jthoughton@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Axel Rasmussen <axelrasmussen@google.com>
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aFlYdmBLWGP8KWmJ@x1.local>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <aFewhN5AF2d7vJFq@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFewhN5AF2d7vJFq@kernel.org>

On Sun, Jun 22, 2025 at 10:28:04AM +0300, Mike Rapoport wrote:
> > +} vm_uffd_ops;
> > +#endif
> 
> Can't we define vm_uffd_ops in userfaultfd_k.h?
> 
> A forward declaration in mm.h should suffice and modules that want to use
> uffd can include userfaultfd_k.h.

Good point, I'll do that, thanks!

-- 
Peter Xu

