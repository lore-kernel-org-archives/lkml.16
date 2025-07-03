Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D320136E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 06:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751523168; cv=none; b=sj0Qgxa9fTk+mXVH2rrO3PdjOinGxHy4Sj0suzb5cD8l/vdMYGjrn/uuXDlLN43JRrYk84vdnFTWVGNcYif4dUxI8hqRwkwPxmZjgX+2iWmVSyxnXBEaqaL0907oFJed1I/2DkVKibQinQMhsOaeZ11LZi5OEpmKKVai0ZJ10q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751523168; c=relaxed/simple;
	bh=+GFrTEQW4VtQLeGxZZJBvJeNWOVxp3sEDmGVQ5Nt8qE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9CKXpcGR45DVY3kYeXMRz24I+DWoSIx5FN1YPokK/j0XIG5us3JNutLkH0KPxnAdJPV/mcVyHBZ0boBJFXkbuuGnnUx1QCc9lTQ0yUAJz8cf8UUwAIKkeQRjiWvZ23J5mgKG6nWYBciBulyjtAmshWWoX652ETR6ulXsIiFXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OjuXXSNh; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OjuXXSNh"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2366e5e4dbaso4367365ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751523166; x=1752127966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZP19DwcEqNYpAz3GY1aNZTVSSoO+WvR4gIwyuoMkaTw=;
        b=OjuXXSNhA7MbOjma8nSVYDPKGGcIDb+y+JxRgacrPai9Af+lOar7eecZt4DS8VvvQx
         UNNlVYQ36LTO3mHJbSgLLW6EltQvMFsJ5fKsxFmazzLwgUiMn0JEwbAQOFo7ZKx5kUkT
         dl8+SxFnBd9Y5gGx1jr7RmMhKbuMH0zN6pc9/EbWSPs/oB7Z/MfN+Em6akEtRmJK48I9
         +h6qk4gwqrGcw/BI59Dzs3hQ3H7Y0fXn9GKznLiWwTkRveeX+7iHGsm8y3Gb5G1T0dP/
         AmYMNd7fTa35GA8f7Sm1sUWdTpDsk/umGlVq0atuKgkaLbeyTJDmpjsB0noFuL09ZOKR
         nzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751523166; x=1752127966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZP19DwcEqNYpAz3GY1aNZTVSSoO+WvR4gIwyuoMkaTw=;
        b=W3Wow+8ILX5TlTC+C4XdHGW2bBGSfDGUgp8dGkzHeiswBO3SqpQNAyiCffkTLDZHET
         0+4VyVYUP44LauXduoDzx2CVg7xPkkKLGX9370fT7fU43Cwz6n4xcMkIaSNK81/5NmgO
         1s6MpvcdSe62F21I912FdDY1d+eGs8xxexhmrYTtfkftl7+aBOPJT11DR4Jce0YY7b3Z
         2T0cs1WAdcucyj3PL6/XCJ0HYoYQWQtB1b4E+rqLcwQHfxm451Pi6yykT2557SrJb91k
         ik2SOEG1vIo5M+/PJwKf8q5PMzGrlmKnsFpiPzm5mzjIe6ctkNQOw5PZZlcCknTuoF6H
         Dfgw==
X-Forwarded-Encrypted: i=1; AJvYcCXzQ0PsoJl2l5HmZ8lJdRabq6r0qfON1yDWhEEyKaqC1qTVxkp0ABtmFa5mJSOfJXMrJYzjm1ZdYUyUEIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+oAF+h1kBhJCbRE0T5rUXzZewNnV2G+sort/UIxlVen92t4ci
	MKZxmInTqcs1ft985F4tVfBaXnoPh6r2xvkBc1+8XjSoT8ZyhMDMscSie+UqxKUfTs1RokK41Ew
	+LZbb
X-Gm-Gg: ASbGncsa6oCEvBXhCh4TXQvIPvFoaDy3pJW/6Ghuw5LHkxB+w7CnEdB6Q+ydSwkXiTp
	5XtOK+18aJ5ETPDu2zAjh35y1LfLGg7jsyLl9kzzND6RgjcMmRaTm/s5D7KDj/yiS62db88wpVS
	Q9pCjgdGnpNMbJs2cn/5C9O1WVEMuJFIsoHe5o9ipMHj1nsIBwEyzbRKN9lMXSmTEDT2rIK0FCa
	jB88eTBx2bHJ9aqJBxSMlhqJhsiVV5aJk8r0u19s348cLYZL8BSbtPYwreOF9+nel0ZhuwElYK6
	j3y0o8d1tXYoF3504cDg9B9vblptjm5cdddLaTlGtwJrg7saVlCb560Bw0t8t8GZAwALhuSK6U3
	ed4KRReAn96dFXg==
X-Google-Smtp-Source: AGHT+IG9TJqwTNtfxrPH58LfJ10nO1Soztf0kKYr0OvPKIYoj8BHcKplX2cGlta/2DTSLXVu9jZNTA==
X-Received: by 2002:a17:902:c40a:b0:234:b445:3f31 with SMTP id d9443c01a7336-23c7b8e0d02mr15568795ad.17.1751523165729;
        Wed, 02 Jul 2025 23:12:45 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bc7dsm143087765ad.114.2025.07.02.23.12.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 23:12:45 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@ziepe.ca
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com,
	jgg@nvidia.com
Subject: Re: [PATCH 4/4] vfio/type1: optimize vfio_unpin_pages_remote() for large folio
Date: Thu,  3 Jul 2025 14:12:38 +0800
Message-ID: <20250703061238.44078-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702182844.GE904431@ziepe.ca>
References: <20250702182844.GE904431@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Jul 2025 15:28:44 -0300, jgg@ziepe.ca wrote:

> On Mon, Jun 30, 2025 at 03:25:18PM +0800, lizhe.67@bytedance.com wrote:
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index a02bc340c112..7cacfb2cefe3 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -802,17 +802,29 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
> >  	return pinned;
> >  }
> >  
> > +static inline void put_valid_unreserved_pfns(unsigned long start_pfn,
> > +		unsigned long npage, int prot)
> > +{
> > +	unpin_user_page_range_dirty_lock(pfn_to_page(start_pfn), npage,
> > +					 prot & IOMMU_WRITE);
> > +}
> 
> I don't think you need this wrapper.
> 
> This patch and the prior look OK

Thank you very much for your review. The primary purpose of adding
this wrapper is to make the code more comprehensible. Would it be
better to keep this wrapper? Perhaps we could also save on the need
for some comments.

Thanks,
Zhe
