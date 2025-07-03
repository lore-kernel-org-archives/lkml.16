Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B73E275103
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542460; cv=none; b=sG8pBIjd9Cu5q1rPMEsDenn9+cmzSDhBHARarjK+F+KlJFK7Toj9gD+Kk8e9IoSw5abIleFY4q9/NMN2vBWluF0CXXMOm3//AGbZ3/5jYTQ6Z9xy+ov1GUJWgjs/DaV7tGJcRyPljp9YPmfQfxz6DFyfjEYuu0TZwsrgRRTZM7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542460; c=relaxed/simple;
	bh=xfHWw/4xeCnV4frnXxcZaPH9XjO9y3PSObid74MxSbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gpgqk/eGmFhdkMjNLIxJRFt0JYYPRgpD7Ivxku2ETwWZ9TjgPslvwVpinnvJfZXtWzNw9h1xcPVVb0tTbXJCjREeocmc0kT4N6o96T8Xv/S4dEoxjaB0xEAR4rxUDOXimYsJIq+ooM19hUS7t9L6hsHdbWyeYJRdTRVBoqn/Nnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HsqVMXQX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HsqVMXQX"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-742c3d06de3so6564696b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751542457; x=1752147257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKuqSD41yM47qtIosyJtUok1+70r4BndprRJCiZqgqk=;
        b=HsqVMXQXpeEvUIFargZQwfFp7GuJvs+0LRz1UiuwyS/eJGzUBsu0V7fEIEob8jieJl
         cW/Bchx96lM75+dZqU/yKB3EDhe5zeEkkUeIrwivhRlJCZ7S2GtdEc+onlDoKYPTOtjp
         m/inJpGkfxmgYq6F51ktZc/8kC+am1ICThMAmfE2+K1xVXPwQH6alfphNdvYHGcQtyc5
         R5+BkS7lc1+iUIu3CtIE/OorFOgCHyYV+7YLQK+e0thjJS9GONWesDYV4FSES9mXtZfs
         dlUTU3V/IQF4lTU3csyDnfQcvG3FFIFc8MGWCHuornzwElkPJ6d5TIfaCTap7ThT/WVh
         JpQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751542457; x=1752147257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKuqSD41yM47qtIosyJtUok1+70r4BndprRJCiZqgqk=;
        b=FBJ6UGorybJpHbZw4Febf3K/i1LM1iuJ03+jfAoQBmtKvI424qRxtmM/qR8+Au9fHW
         GYVZN1qSDxE/XNotSkc1ZfT+LIT1s9jV+ZEhweEikJhNvzii793eIXTm9Iv+m5yiw3FF
         RalI6YZ6Sx/004FXISJkEAVS6UTfgONM8aq/GAe5BV0lvKRNBe0tG/LbzU2j1Z3+9Hbb
         JhCaTOIaeYNolY7aKcakl3biKaUz8ASRfvgkE1pwLxmvAhP3ewRM2XajIFaXHQZBPR+8
         h10fnBjrUT/9nzy+Ug7s4s+p206DRjWbSJlHVuIGTQR/C1ngoqS9vOo8gQGt8EnpCBMp
         9xZA==
X-Forwarded-Encrypted: i=1; AJvYcCV6qE4478GR/VBwUKfOQ0mY780F5kB6WsVth14QDhHDkPsnOf6ldueeU+JaeQTnGmsIb55OwIUJoHQrtYs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx00MdXnOtlmNdPYYtUgMajtDOrbKLlS7K1rlNTt4JO0XAre/eQ
	ieXfsaH9sqSvhUoncR+xPdkzs0YYH26oe0l1nYl18EYjgPK1/0mg2/ATGfaKop1IsDQ=
X-Gm-Gg: ASbGnctCJ8s81fWnTur27i2iONlN+J61RMgi+zKCJbUVzGzSZso7rpEO6FLrS+Te2UB
	jHc1mTovdMZDuFfNZsC2E5dyxYbUko9OBZyc1nxCu9Ygys887fRTPFtSUJ79+SBrq7cOdg4o+F/
	5r870fsxib7OW8tvdC0k3TA10fTawkqNWikzAAid3aS8c1nA+n5krWTK1go213Q0uYaNAuxRTqa
	KOhVDG2bxnP73iCxOtAs6Pd3V7zmORKS/xJMleymdQK+LORZoClWI4mp2ZY/hYp5kJt2rmJphwg
	Rb6+WgW4+Sx6rNrRXYhwo1X9oH/faLiqxlO+n4j1I/HQu+Jfs/s+q72YrxTqku/gG4Y0bbdbOZV
	PZbsppPsMyV92
X-Google-Smtp-Source: AGHT+IEaIcX4g7FJqZ33HWQn8jLj6CTJN7wIjTiYoZNHvn71uhXUfhBCcEbREOtjdOaQlb8z5oxu8Q==
X-Received: by 2002:a05:6a21:999a:b0:21f:4459:c032 with SMTP id adf61e73a8af0-2240aafc33amr4657333637.18.1751542456824;
        Thu, 03 Jul 2025 04:34:16 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31db02esm15080898a12.63.2025.07.03.04.34.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 04:34:16 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: alex.williamson@redhat.com,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Thu,  3 Jul 2025 19:34:10 +0800
Message-ID: <20250703113410.66696-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <664e5604-fe7c-449f-bb2a-48c9543fecf4@redhat.com>
References: <664e5604-fe7c-449f-bb2a-48c9543fecf4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 3 Jul 2025 13:06:26 +0200, david@redhat.com wrote:

> > +static inline unsigned long contig_pages(struct page **pages,
> > +					 unsigned long size)
> 
> size -> nr_pages
> 
> > +{
> > +	struct page *first_page = pages[0];
> > +	unsigned long i;
> > +
> > +	for (i = 1; i < size; i++)
> > +		if (pages[i] != nth_page(first_page, i))
> > +			break;
> > +	return i;
> > +}
> 
> LGTM.
> 
> I wonder if we can find a better function name, especially when moving 
> this to some header where it can be reused.
> 
> Something that expresses that we will return the next batch that starts 
> at the first page.

Thank you. Given that this function may have more users in the future,
I will place it in include/linux/mm.h instead of the vfio file. Once
I've addressed the comments on the other patches with Jason, I will
resend a new patchset.

Thanks,
Zhe
