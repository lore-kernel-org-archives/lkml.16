Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6117C25291C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717832; cv=none; b=HJKpe4pjUA6U6frKL6dLqSdHJ9ZkPQP4ICkGQOCeL7JWUr0W8CqDfTiZSG1WIHSB9N/pcUuJJ85jLvlOzFQjbpSJfKL68ljvxrOXGPd358ZqVPZzVHuGopWXjbIe4GzGDnFx3H4Yj+KQT4c6AOVkNbKU2AIufgGvilYdKz+5BTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717832; c=relaxed/simple;
	bh=UjVSOkc72L6KXnOBhHPewd2yG704iQi5eThAz2GFAiY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opE/iq9DlSYQ10/fTQV3nulsede97PamHNqX5pStAii36uKuvpSRejSV1Dl17AQRhArBcAmXl2I3AVLX2aaXoCN4FOGsfRTmx4b29xUpA7hQFtwC318xpi+faNDAbMUPb7g3+qmDQFOPR/Rv0+yQFwhPPfWaA45ulpL7waB6ERo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kb+TN+dr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kb+TN+dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746717829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LmtLx7Rand6Q1RhHvZvf339T+gMnpgr8dRSMfTD9lZQ=;
	b=Kb+TN+drfW/T26TmHDBke0+caK76oIUA0P/1ylj2BvZn3ZpYA1mZiyau7KBC5uFZb8hH7R
	hI8LpmyEJyD0wX+gUcIRNGbI041s0ECd8EPDM+Sx7Gu/f1WGYgeQWszhtXzGRMmWrtP+Za
	ESDZMYZZnruHh1RHJgR4pDwHEAgJp0Q=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-_y33MF5vONSKqugeMaqFuQ-1; Thu, 08 May 2025 11:23:48 -0400
X-MC-Unique: _y33MF5vONSKqugeMaqFuQ-1
X-Mimecast-MFC-AGG-ID: _y33MF5vONSKqugeMaqFuQ_1746717827
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4768f9fea35so24160891cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746717827; x=1747322627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LmtLx7Rand6Q1RhHvZvf339T+gMnpgr8dRSMfTD9lZQ=;
        b=jxLHJA3hBYFdFdm6jVF6qiapJQb3Uveka22CJXgEY2kiwXfJYe7RiASwty0r5MkVzm
         ykCDnAuMk/eSKasFKAyLxw71uV4zHtTSwQofDfVZFmb+N9lwS18RXwSlUQxP2j0Ie3/P
         S2jwdj0+mUoJwylAU1GxJey+3ZzrgBKblKex930KVQDWDimdsgDghFTXx0vpMQsgVfkn
         hhADMlcnCXLbpG40LqkpD6PWMleWTVzUwmbOR4w4hdIti4bZF4vB1ynSOmVoN2Fbn7fE
         MAxcIFQJIvkKrQuin4yILzTR5hwybY11RYV/1gKtZhHXvg8tBsNizVOYXiiBL+03vhRR
         L4sg==
X-Forwarded-Encrypted: i=1; AJvYcCXWgCMhxW7+SUPaHHziFatwtOIU5sKQra9l3U0fWuWqTLfZVy2dYQTZ/iBI0BKOc4/ta4w5nbPa8kwWudc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpJH7E+khOyg8h/3HPcWbC1AKxyvIejUhwGN54gKohxsX3y76g
	6Mcqzg1eksPFCgAWimJoXbxIPFJsw72Ep85znxAGYPwH7ZxQnUfpVAVN2NWTVI5HdBLUcUVAmnc
	p4Sa6N3xy7VyEpL2YWE7ByR+zRWdFhsRHPVj130GvbazJzsh8EF9NR6TePJyPJg==
X-Gm-Gg: ASbGncvBmf3qpeZH48xypgg9d6HXJ+PpO8GnWiXljQJcMpLDDjz1zepvjRLrbkmLSF+
	i6ixulLNU6ujAFsFM1+5pasyC3vWns1Vn5m6nvqp0Lp5+XaIC1JMz1MDWObppnCiaLsaUcS2DA6
	g5kQsryWSs6ahpAX3v4xoNMyZXlyYjw6Fgy9PoYwfRAuMfKNijcvtODRenHRTLwJK7EZkXkCOG7
	aofr9cWB+M1JfeDdUkotG+MOQabBwGIPXKwBFNd6CoUTty9VNpBP7dIKE9+jYqLB3h6UgIBGXt1
	LVY=
X-Received: by 2002:ac8:5890:0:b0:48e:9e05:cede with SMTP id d75a77b69052e-4922795d397mr104895481cf.52.1746717827342;
        Thu, 08 May 2025 08:23:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwQWKOyxL7yTe7WTS/VAVIG3t1FeqJdgFw+aUKFJf4zGei3LL4swQHmoLoCdwSeBUi1GtY0w==
X-Received: by 2002:ac8:5890:0:b0:48e:9e05:cede with SMTP id d75a77b69052e-4922795d397mr104895031cf.52.1746717826831;
        Thu, 08 May 2025 08:23:46 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-49222d9f706sm35091881cf.53.2025.05.08.08.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:23:46 -0700 (PDT)
Date: Thu, 8 May 2025 11:23:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	David Hildenbrand <david@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Lokesh Gidra <lokeshgidra@google.com>
Subject: Re: [PATCH RFC] mm: userfaultfd: correct dirty flags set for both
 present and swap pte
Message-ID: <aBzMf6H9Lad6CaFQ@x1.local>
References: <20250508090735.39756-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250508090735.39756-1-21cnbao@gmail.com>

On Thu, May 08, 2025 at 09:07:35PM +1200, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> As David pointed out, what truly matters for mremap and userfaultfd
> move operations is the soft dirty bit. The current comment and
> implementation—which always sets the dirty bit for present PTEs
> and fails to set the soft dirty bit for swap PTEs—are incorrect.
> This patch updates the behavior to correctly set the soft dirty bit
> for both present and swap PTEs in accordance with mremap.
> 
> Reported-by: David Hildenbrand <david@redhat.com>
> Closes: https://lore.kernel.org/linux-mm/02f14ee1-923f-47e3-a994-4950afb9afcc@redhat.com/
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Lokesh Gidra <lokeshgidra@google.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>

Acked-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

