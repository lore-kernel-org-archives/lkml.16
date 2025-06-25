Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C0722097
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750833701; cv=none; b=pT3Lm0CBa/CbvNK1E+jdMrsbftwp1YZItdeFvIwy7GUq47eCHaRMJbtZm3ZVpiJNPZES3gqrR6mBPfK83vMG70rahDujKoJTNZ6hr+d29AjEikBQadxUKkc6m1pZsft1sVl3vKvxUQAVQnovEINPWBLqARE6Thw63scUdRwk+eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750833701; c=relaxed/simple;
	bh=VjQgB4d2oSebEr2mIns82XhjpF5sZibBpb/xXzXzJR0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BpMEcnnt7BctoFGw5FOFcKEb8Yycovv5SD4kTXcKW0rT/AS8lA0rVf37Uzfc+uyGNhoXWZiMlIMmbi8CO2/70dT5us7UM67in/oHshF/mXdhoG4jbzidK8RGUO2AFtvQnC5r/Ly61LlW8coEWEGB298Shyx+PzSJXRAcQyJpGzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gCzSYMhb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gCzSYMhb"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so911385f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750833698; x=1751438498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nv4j46Gn/Kvr0K34agGb6tcrNF0OwBTrFfOvFYIVMos=;
        b=gCzSYMhbvO1YxUuqxWbIzQijy7lZFL1v0S1jHa1Abt40+32aD6vNfxY9Rnu7ac+vhZ
         jxspAAsIdo1t03uN7vg1/qHfFNAcrJd2K5olYbuajh8T/w/ejv6tS7U3Gy1j0QWNy85D
         9n+st+be8Y3MvB8Vl4+3SSxHjDCJpRpJZWRvuMMUM4XoZilZS2vmRt1DZzWK8iRU2+Jq
         65KDkidny+SHskUKQchcUyrNx8EAAXBoijcnwQeM58rn3u3I7tbsqThVc+ibOJaVl1Vs
         p0WQ7CnbiJF9lzsn/xe9/p0FRHm9UI9qWEMuVBHXObkov+LeBCsuDkabpYuNdWwxq+bs
         DvUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750833698; x=1751438498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nv4j46Gn/Kvr0K34agGb6tcrNF0OwBTrFfOvFYIVMos=;
        b=YbyyK2ZWsx2MDSlF29xKBIM+7PvTmCxAc9/u2vlKrV5AyY3PLWpFosE+8P4vli6TIa
         uX/aVo+TL1hWwUG5vw5kbSQyWyjkVu6krntVWCOh+Y5pX5r4ppk8UUo3TxxZwIc0hMrj
         k/h5o9Iu/7jkkkSnXl0E6bnJrXOSjjh5iNsSISlWtTYeO8+rqQSBoB1n6tRUU9INYEH9
         UzoZwfnitDw+lnn1pAKxCq5y9Ofj/UcvnytXyVpENYbiYKf4AUv2IaR482kHdfTlv4So
         L4F0YmXdg7D0Eovi/hWy+t6ZqkMGUPjJMNM5eVMJ8KK+OI3uJ1VWXBMYuJG9EBAMZBqY
         3fLw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6YZ1Ru+hdwbFjopsgG60FkIb7cm8s5LmuqY0wQfG88gtnWDAeVWaudsNl88H6rWkzR3sMkSWlQguKUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+MKNGjIEFNFegJzIolfCyhAZXitvXevvKS/8uUpKstCV7ynDD
	f6kxGFo/4PERL5BkUFC1NepIWuQ+aaqP/yb38hmqIBTBgmn7v+rYB8Pa9mYNeNls4S4=
X-Gm-Gg: ASbGnctDxa/zsRXnLQPnQ6aBT7WtgwW8Aiy+Aa8wGtC87geW4lt7epoL6WJ22N6BD/3
	AD3ZasV0hrpxObZmEeIlS7YKAy8KcA3BBnqQ2VtLFTI9L76XSP7LYj2Zc1za8RPq7N6BLMtpFF3
	CMZ6KFJKM0IZOiGS0bDlWRk4KOqVFVRk+XiyMjBc3HQKbLDbOI2kpzSyu/dqAsp07SmCt5Hwd1a
	j6erG+hmB2ky6ky12ri9NU+G/s4vWmCf9Ol9tLzdI7M5UfptoOtQEO1x7pScDKwFaemrC1xqqNL
	kqc8SfK/i4WttcJB9VhrObPOqinqRDkMFpObOdo9JZsr236NJyKfGEzpgE9ph7LB3KbIbjRGc5a
	ZUWU1BSD+gABTAVBtyAlgNPU7w1msYdLiUreWk2Ub5GosWytjMyZf7RwABSkD+6+WSM8=
X-Google-Smtp-Source: AGHT+IE7FEwxOxfhEE+iSFV9n5lEc4KGhMLsGRyFhWyAeSVP2PCDplXp/ktSglgcn/Fs2s3oXQVjvw==
X-Received: by 2002:a05:600c:524d:b0:442:fff5:5185 with SMTP id 5b1f17b1804b1-453821a8633mr4333875e9.6.1750833698266;
        Tue, 24 Jun 2025 23:41:38 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069467sm3646226f8f.42.2025.06.24.23.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 23:41:37 -0700 (PDT)
Date: Wed, 25 Jun 2025 08:41:35 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Leon Romanovsky
 <leon@kernel.org>, Keith Busch <kbusch@kernel.org>, Caleb Sander Mateos
 <csander@purestorage.com>, Sagi Grimberg <sagi@grimberg.me>, Jens Axboe
 <axboe@kernel.dk>, John Garry <john.g.garry@oracle.com>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:MEMORY MANAGEMENT"
 <linux-mm@kvack.org>
Subject: Re: [PATCH 5/8] docs: dma-api: remove duplicate description of the
 DMA pool API
Message-ID: <20250625084135.02a1ab09@mordecai.tesarici.cz>
In-Reply-To: <5ea93880-72fa-46c7-b69b-82e2021aa567@infradead.org>
References: <20250624133923.1140421-1-ptesarik@suse.com>
	<20250624133923.1140421-6-ptesarik@suse.com>
	<5ea93880-72fa-46c7-b69b-82e2021aa567@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 24 Jun 2025 19:40:37 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> Hi,
> 
> On 6/24/25 6:39 AM, Petr Tesarik wrote:
> > The DMA pool API is documented in Memory Management APIs. Do not duplicate
> > it in DMA API documentation.
> >   
> 
> This looks like it works (from just visual inspection), but I'm wondering
> why not just move all DMA API interfaces to dma-api.rst and don't have any
> in mm-api.rst... ?

That's also an option. As long as documentation is not repeated in more
than one place, I'm happy with the result. Now, seeing that it was you
who originally moved DMA pools from Drivers under Memory Management in
commit a80a438bd088 ("docbook: dmapool: fix fatal changed filename"), I
expect no complaints when I move it to dma-api.rst in v2.

Thanks for the idea!

Petr T
