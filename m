Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C54423ABB6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 21:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751492206; cv=none; b=EW9NNhT4ZKWIz6P7WmtnmxtRmooPO4kaw2i2TvOosvi9+gBOC8Z2IMxju2xfSy7yiu2FHUnWZZDDALU2Ofjc1CxZPgl6oSrfPUTXMm7rXqzsuh+moi5BUTrH4V1NZ2yZR4WfoXaCuTkWyXMjG1xIt58TappHTiGkO1XPzgiKn9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751492206; c=relaxed/simple;
	bh=8Fqe0kjEomMWsMSKVyzjrmRMhL/AUi1IZRqMU4/tjfY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MwZa/Uit9AQORUT09hmuVDDDeNP/g3iTDPlXK4YYJwndG1xZJPSfQyKlT+Vh/jY/0R+bLNx+IMsD0a6LtLYPNCJI6WsYO8ZMTVv8hJsN/xiX+efwGf2e7Nn1WHI1NVi2RkLWX8qgUtILfvlobnU6ong1oFx85+Vh21NTerx58oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P64ackUB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P64ackUB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751492202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=h07oimLa74ucXiY4ftxEEPwLCrCe6bmiVQuBJAHpGhI=;
	b=P64ackUBtMlbKAqr2wepS2jqsPqIhs032TsY3yzDLZXG8m9cNpdxfh//g/9+l/mkU7uyOZ
	G52gK2aT3pwOqL2prO3ZDZy1sS5nLue6z25pYp6FAhbS//scvfZw3P6YjNUGytolky5H0v
	YbWaREevTU9EluCahxTv81IfsKn9uRA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-876ztkxmN-eRR6YK--vRcw-1; Wed, 02 Jul 2025 17:36:41 -0400
X-MC-Unique: 876ztkxmN-eRR6YK--vRcw-1
X-Mimecast-MFC-AGG-ID: 876ztkxmN-eRR6YK--vRcw_1751492201
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5cd0f8961so1023975785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 14:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492201; x=1752097001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h07oimLa74ucXiY4ftxEEPwLCrCe6bmiVQuBJAHpGhI=;
        b=SBsu07H1n0/xLFHrJopLioLRT9P5oRfks0v5nEedUilmySeBdqRCCYEF23wsloVwsI
         sF0exhDKdnsC93jqoGwFlK0+mVCUjK8W3sRffOE5IrDztOyWQmD3VGmVO86RtN0pnIAv
         rYH9GdiG63QE+iCoMuNCbkDC91QQZJ/enqNJohLM1R5+IEtEURIBbcV8mVctrDHnmPRz
         BMBlYdBzmmgipz+3MPYTm5IrngMhifbl4lNWy4UB8Oo2flnnw+xKtnSwjYlL7lbG3IZY
         D2w3Xmxx24BFwC8kbrehlLuHKIcvAVJpXJTqZvT7r41w2UtXI74CZVPAdvxm7TF7b8be
         b2CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSx7ern9brvuatypOYa0QbN4JxJalXjG8PbIdrmaBZqZ4h66Z/v8DE6Un+IHvL6CSQRxa/5/55dagWJT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg6z9hiHniJnSMIx+O6DKvXqeNwrEd14v6efZ9u9JL6hFdgbXz
	K/yqkXuaotmuhyb9QUroX0E5lRsiDKqnYegdviBjS9JUi2eznhU6u+NI3NamD2b8JUTtmseiueJ
	NF7XbxLI1XLU3/8Rw0YjGy3iHS634GBPP+ATVs9G2J631oIFJfm2oKtLubi8XkdKXDg==
X-Gm-Gg: ASbGncuGQ7XJxV5HNA8w/fjfgwM1pZn0DVjxPiGKLLqPmMm2zpnHZRUBzi7mhZia+dD
	vB8BkH6WTx8Hvcf/EY302t47Zt5Eq/4HEx47o9xOvSccE2KXmTG1S+5NZ77aMSNyiOJ8qJC93zS
	U17CgCQ26/fkiOds6r05shwQRqQESyACqNiQ9fmgjS1Ds3F6Ue7xrrFvhIltFNY32X7foMWXkVv
	G1FZ87FV+eZnXsEiPOsyH2w6C/Wr+BGuX3mkqfwIPrYqpr5vx/+H/VRaWA1oLmwNhRIswICOThV
	nySIsNXZHyIghQ==
X-Received: by 2002:a05:620a:469f:b0:7d3:f9a4:d2a5 with SMTP id af79cd13be357-7d5c47bb48cmr710925585a.45.1751492201184;
        Wed, 02 Jul 2025 14:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQk2dmd0YnRgZM/tjH4XnWsIoSijGwQDjq22S5yhXVeXQ/Dn8aZMxrOlZ39h+ETr6U85Ygpw==
X-Received: by 2002:a05:620a:469f:b0:7d3:f9a4:d2a5 with SMTP id af79cd13be357-7d5c47bb48cmr710923185a.45.1751492200849;
        Wed, 02 Jul 2025 14:36:40 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d443139b31sm1010630185a.7.2025.07.02.14.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:36:40 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:36:36 -0400
From: Peter Xu <peterx@redhat.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Mike Rapoport <rppt@kernel.org>, Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Michal Hocko <mhocko@suse.com>,
	David Hildenbrand <david@redhat.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGWmZKwcpLMfAN2O@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <rsumpavnbe63jvfz7w63batked4obgnzmz4boeee6q3wiv7smi@rkok2a4vug72>

On Wed, Jul 02, 2025 at 05:24:02PM -0400, Liam R. Howlett wrote:
> That's because the entry point is from a function pointer, so [3] won't
> help at all.
> 
> It is recreating the situation that existed for the vma through the
> vm_ops in mmap, but for uffd.  And at a lower level (page tables).  I do not
> want to relive that experience.
> 
> We are not doing this.  It is for the benefit of everyone that we are
> not doing this.

Is the vma issue about "allowing vma->vm_flags to be modified anywhere"
issue?  Or is there a pointer to the issue being discussed if not?

> 
> We need to find another way.

Could you suggest something?  The minimum goal is to allow guest-memfd
support minor faults.

Thanks,

-- 
Peter Xu

