Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B00E5661
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748290800; cv=none; b=cw9r20dbq2hPop3brMCb8/67y9SpzLWgqfgNu08t5mty3Ku57qH7A9cpOBDkr0vH2nzskDFyl+IfjfJy5aWeQOpdeeuKVN1Fi0WSv1VXWjsBkCrEh6Tm5c+pePu/d5nAwLbM4Seo1/jkJ8fSJX2QdPXAJhHYLTaEx9VByBa+Rhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748290800; c=relaxed/simple;
	bh=o5gQ5x0CBQ2LeBkPQqD92Vnk0YT48zi3/abof9Kr7J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVoPYoBD4Es7vZf6sUHYrr6NT0LuxDwoF/7BcOY5V6ck2hI0xUXOljk/IUknaqUHvNxaxxQWME7GynKgW+69XGiSzGOxhPVVtm2FL2jzP08FTQyXbTHAupzggXzjsDEAgpDZEQiRcpXDbz5h1lIzM8IqdDbJWg9cDeiwK7u5MXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=EWSfJNH2; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="EWSfJNH2"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so24923976d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748290797; x=1748895597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hLps+JNcyParOfDXS9JzFuLbkraKablpTP/PpVjY8aw=;
        b=EWSfJNH2OS7eXS5AadrkMnsUFh4lfgsS+45mZ83t54Fzu6KNdTFO6TCrrx5XVwMA8r
         uatDdgZ2wRrNfxzXezYm8lCtBF92o5BzvjNoMEh7s0kziKRX5YUh28B5qmDzXSP68Dlg
         1xlAjsuEbpaxgnPX4CCItTarHTgRu3VlpBAeWtTkOiWMEvEUDpp2iacOXFOCf7QWTtGT
         8qa8Lcw9KioNrV+LTz8fRLz1OeHF9Q6hLYb+ScKLVc431nu1oQ2VHfg977Tbw6QD8Tn+
         Pn+4qsNY/0KUQ0ZPf2iqHq2wUj7hWXU/rYkEit12XeodDJ5TV6hLtFjWNw5vyUvGvfFA
         v8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748290797; x=1748895597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLps+JNcyParOfDXS9JzFuLbkraKablpTP/PpVjY8aw=;
        b=ECxHbwHF4meW950jSEwUcgZI46b83XOOys3WahtoFv7/kvE5deNihQVK/lfgzOGrT3
         GZsqrJuW+BY6fsw5+bl1JNIlfFPER5PoFvqL9sH8HYwD7xbrMoc7wCTe44MkSaa6lTGv
         oPitf3IFaV69KFzdYOtOB9CoxgPWoAw7U5QhD8sKatfUvUM/k/MOm1uAr7tjUHbcQr6Y
         tx9je+bIVNAK4ACUlbqtDRMyM5rsTho2s72ZWw1DRdyF+jxiht3lLDIPYuA97vArJoyz
         TZpYO1FyMf4aaSUvrtOxGgjNOvbcs4Q94pjsJOHExdWx7HMSG+fkqz2Boo5YDP5gfHEc
         VyKw==
X-Forwarded-Encrypted: i=1; AJvYcCV12lc10wj9/Zvte7vbUHJemnwLdJwNS+y7CuCevAfEvnb01e3tNGzAb05Fr4knKARy4sMiTuF9ZfGKe3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5yCHp++/PtH4P3VdV3XeVltNCqwE3rAXxoswDM1QFSZPWMpoy
	wxh2Xu0c/dKTLklYQBDbm2EC01R7+Ee0TEDbwLTwC5JEXH6sp/e0EJDpp50rf9KUu18=
X-Gm-Gg: ASbGnct54Yf5uWry9qXfq1ZGESN7YcZsBFTfzoGcJ/3lZdED2E5JRodRrCs/z/FAf6L
	r8Jvn5n1vIgkXlR8KayhivYY07lO0qXr2dy/6w9s5xbw3ztBfCGuJCLDRXOTEW0OP4qz4t4yyci
	1PQvo087zltwMgP0KGtSaiArGcHN8G8FBjuQQS3Cy+sTC85xFvEqIueDRarORLQKxELxgDjdShz
	EjlzFb8wjjnhD+/95cd1Mg9qEHQqeMjGYmfoY91O+hIGi8OjHvOQTqTe79jat61VpHEnxu8WwLH
	G2VLJ7a2we0QO6Slc5xlpnPNaJ4a+fqEMtgceVVtA5AhZ1AV0VAFi4IHDXqiTUDmuNCMHpVu4JL
	SUGLTYCM/sOEWiopJpn9htfvQY5w=
X-Google-Smtp-Source: AGHT+IGgTwiyg5eiY7T72449r0+RVPoXtu68z9yqpkDUhC5jnCxOtecB9Azj5gEYa//3ikcBXT1glg==
X-Received: by 2002:a05:6214:f09:b0:6fa:a5bf:2595 with SMTP id 6a1803df08f44-6faa5bf281dmr99808036d6.16.1748290796961;
        Mon, 26 May 2025 13:19:56 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fa9a3dbd2asm45191276d6.48.2025.05.26.13.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 13:19:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJeId-00000000UuV-48LG;
	Mon, 26 May 2025 17:19:55 -0300
Date: Mon, 26 May 2025 17:19:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: David Hildenbrand <david@redhat.com>, lizhe.67@bytedance.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: Re: [PATCH v3] vfio/type1: optimize vfio_pin_pages_remote() for huge
 folio
Message-ID: <20250526201955.GI12328@ziepe.ca>
References: <20250520070020.6181-1-lizhe.67@bytedance.com>
 <3f51d180-becd-4c0d-a156-7ead8a40975b@redhat.com>
 <20250520162125.772d003f.alex.williamson@redhat.com>
 <ff914260-6482-41a5-81f4-9f3069e335da@redhat.com>
 <20250521105512.4d43640a.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521105512.4d43640a.alex.williamson@redhat.com>

On Wed, May 21, 2025 at 10:55:12AM -0600, Alex Williamson wrote:

> This optimization does rely on an assumption of consecutive _pages_ in
> the array returned from GUP.  If we cannot assume the next array index
> is the next page from the same folio (which afaict we have no basis to
> do), we cannot use the folio as the basis for any optimization.

Right! I was wondering why this code was messing with folios, it
really can't learn anything from folios. The only advantage to folios
is during unpinning where we can batch the atomics for all the folio
sub pages, which the core mm helpers are doing.

Which brings me back to my first remark - this is all solved in
iommufd, in a much better way :( I continue to think we should just
leave this type1 stuff as-is upstream and encourage people to move
forward.

Lots of CSPs are running iommufd now. There is a commonly used OOT
patch to add the insecure P2P support like VFIO. I know lots of folks
have backported iommufd.. No idea about libvirt, but you can run it in
compatibility mode and then you don't need to change libvirt.

Jason
