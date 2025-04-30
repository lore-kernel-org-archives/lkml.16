Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D686F1DDDD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746027684; cv=none; b=j8DbRZpEaq2v4F84zYXcEqqSvP0R1GVJLgb2gxr7OK9IZfxVkQB9blJOC0FXCV+CKfpFiDxI092vrMsuhSpi01XVSZ8idBhh/41X2rLnQPym9f9vFjja0F6UdRDDXUdxb0VEkZaKRhW/GY//BvwyTTp0hD9DPAbc5YFhUpvrJUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746027684; c=relaxed/simple;
	bh=xh5H2N/iDuCwLGa5mRJ0Z/L4JXdvrwwjrCZHvm+rCvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhVPQebhImvle3o3JVAnO+yFRyEpPV/6TPrmm9KLNg/Xk9/RzSYIJNDlCFD8CbVDu/bHIogW/lQF+8FTFV1cpDLSTEe5OMwpe/bO7W6REv4MZQq8a59zO3MeBYWMBc9nhi8eILHL9mio3WdlP9pokQvtQRA8LuKSOuBQXUrYmxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcqZBOi9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcqZBOi9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1246025066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746027681; x=1746632481; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfyKUadJ0haqkkB988x/rHrEeo5+2UssFKWrz8PjHYg=;
        b=HcqZBOi9qUolPX8q5gEKi2lrGa0QDXfjaDbPLuW7wzHuAPRTPIeYpxyqylbZs7/VJX
         0/msSOW7jRHiWa+9qC6r3V2kIesYRtEt/nQlDRgVedA7mkmaYZZ5IqC1yhORiczg2ZcD
         2TfTsLY2VY7G2BTC4zvj3fQ2sxdCLHZSXTTVOtIhIfGexckrvRHR3OUfieqw5qwBPDxT
         sOSUUBSmfD9PJRQPrf8JpqVz1I8c9KOabVfDfH0+JVCvpdwW7AW6LweVf7vB0z7PNiU8
         VmpvzuFfnOb8h1oQrYlDhU1H/I30r42Z9FNIScZfTRkBaEe6crFPvCLJ3Pme5ERK05fP
         OZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746027681; x=1746632481;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YfyKUadJ0haqkkB988x/rHrEeo5+2UssFKWrz8PjHYg=;
        b=MXbiSFHGJrbz0+LmXi+DP6G0TzFitszLLjqmbwlPE6gf5trL+QHHSCBuXaCZDXGhUf
         cVrCWM7N6TA61Kiz7h6BFeR7F8KtusKPiymBrbvSWTmUhbYNHsupO+eYEVdedcdfKx84
         Fcq+iROzpE3UC1iJURxMei7DCRJ78PMfe2MJuJY4swee4LjxNzffyQ12lxCWlULtAdjn
         KilLQc/hhQ/gEIyXBGDqHAdMEjrQLk0RJ8Qln1H6DvPjIqLwTcbDeH4m7s9Q191i6idP
         psWmvyuzknGHSbFxU91ZnA1i2e5TWKRraoUiLJohXer+gQAIfPuIwSg4wMUalvRjGA9s
         eT/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKafk+EIhsszQUaF8/mHHQkCTR/YPMVAEpNa92Q4YQ53WGoSB2tS9ZneCMYUnkUNEo+WhAsByqkpTfqvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3TRwpk50nfJv5WWnDV7SQKB/RIzF31nPLdlXIZRUcuUaOwEf3
	dLthvVKobsTXTc1Yd2dnQ4Ddi7l+o/9eLNu5ScYSby2oIwoE5JzQ
X-Gm-Gg: ASbGnctIiBqmtKqLV1w4paxtkwp/mB9dBSZgQyc3o+oZslGQ9ri/2Me3D2fFDqe37wW
	MDMrUjqVN6w89JoetAACd+AwhY7DZCJYVjfZwVmMtVcRsIPGe1m5C5yGNbnYxThdpaTEjduh+mv
	x1y4YOzAnqzs1YeaT1fA8BR5wfyZ/psf5qL+lRR9J5pum+keVslS4LIeELvlgc1pgnC/svmJbRh
	A2h/9h+TenxI9vEyDNdmiFbprJ4JQZFnPbAvpT9+9dOV/Pm6fOxCu+NL2jJjW0ZVZMI5uqjk4Ot
	hafqNdhHQvSE8xTvya2iLTCZIYZGIa3fqz8C4ppm
X-Google-Smtp-Source: AGHT+IGSyic0dPJtX+Ik+7S4pDm8t86RGJG82R8MJKs94VNWbpTldcwQG7XiUdABSDG8EiBdG/cmGQ==
X-Received: by 2002:a17:906:6a10:b0:ac7:3911:35e6 with SMTP id a640c23a62f3a-acedc76a255mr396045666b.58.1746027680824;
        Wed, 30 Apr 2025 08:41:20 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4e70bbsm954013166b.63.2025.04.30.08.41.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Apr 2025 08:41:20 -0700 (PDT)
Date: Wed, 30 Apr 2025 15:41:19 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Wei Yang <richard.weiyang@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Matthew Wilcox <willy@infradead.org>,
	David Hildenbrand <david@redhat.com>,
	Pedro Falcato <pfalcato@suse.de>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 01/10] mm/mremap: introduce more mergeable mremap
 via MREMAP_RELOCATE_ANON
Message-ID: <20250430154119.a5ljf5t5tutqzim5@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
>On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
>> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
>> [...]
>> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
>> >+{
>> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
>> >+	bool ret;
>> >+
>> >+	if (!anon_vma)
>> >+		return false;
>> >+
>> >+	/*
>> >+	 * If we're mmap locked then there's no way for this count to change, as
>> >+	 * any such change would require this lock not be held.
>> >+	 */
>> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
>> >+		return anon_vma->num_children > 1;
>>
>> Hi, Lorenzo
>>
>> May I have a question here?
>
>Just ask the question.
>

Thanks.

My question is the function is expected to return true, if we have forked a
vma from this one, right?

IMO there are cases when it has one forked child and anon_vma->num_children == 1,
which means folios are not exclusively mapped. But the function would return
false.

Or maybe I misunderstand the logic here.

>However, with respect, the last drive-by review you gave was not helpful,
>so I strongly suggest that this is not a great use of your time.
>
>Again, I _strongly_ suggest you focus on bug fixes or the like.

Thanks for your suggestion and patience. I would try to focus on bugs and skip
those subtle things.

>
>Thanks.
>
>>
>> >+
>> >+	/*
>> >+	 * Any change that would increase the number of children would be
>> >+	 * prevented by a read lock.
>> >+	 */
>> >+	anon_vma_lock_read(anon_vma);
>> >+	ret = anon_vma->num_children > 1;
>> >+	anon_vma_unlock_read(anon_vma);
>> >+
>> >+	return ret;
>> >+}
>>
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
