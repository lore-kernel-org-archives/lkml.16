Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE681F09AC
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110105; cv=none; b=Vs4JQsX8A2u0Zp97+JFL8/9t4fNSZASC82lKx4/YeubSzsv4oVOo2E+L1StsbrQOkSqALG1kx1wpD+kN9Lj+SPDn2CifvuBwjNB6vM53rhPA8mi2aSn9GVsXKLDGhOdB1tsrJedAl9eNIUIHNDF4qVtnGl0jheKCAcYISIi1l3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110105; c=relaxed/simple;
	bh=tQMM+75jA9ckLpPNcKYLC9AdwJIGbn6UaTM8//de85A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hbzx9ibfSsnTbQ8QZw9IelDWW9H2R+K1UerhODwDp42V+jtF+tgTvNrE9hNienW4BJ+mm8NkFtNvHXBiZaPbsFZoGep4+d9lHGvEZBcpWOLviRmpah9JgefvuA+WZGInHlAzkIrtp2dyXzW41r68pdkj6A1ynzwgHIrnCrnimqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=meQ4H3wK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="meQ4H3wK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac7bd86f637so391427266b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746110102; x=1746714902; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9RchDfxr18I4yVQggiBSgsgcddCi3qc3FrSDx0hpRw=;
        b=meQ4H3wK5wXeps21a7+OniU8d4Wr0iiKta7ei43Q8Q/w8Kf+4t1ewfz6COOs2FgNuw
         elGY8tlePX4JxreO0wi/aH6eMMxB6ZnQU8/Z6ZaJeMD2Xj3A9we1dEZKnDtOfxtaZLqk
         wrDgNKl1aCAiTnNgTCWBerWm+JgzM7hkHHHw4YLr7KvkTAzNPH5X32ZErtGWudNEcgIx
         8MYrNK1aBG215qGavURdY5wxe5e63w91vOhhyeKgHHgEMsBBWM4Y4tumw2sSfXo+2xbi
         GnfRqrU4EMny51GRUBqJM0WPxF2FVc20YvJRUNN/CciB6zBZ9RW1PX6V1z7fSOxvWfDK
         P+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110102; x=1746714902;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9RchDfxr18I4yVQggiBSgsgcddCi3qc3FrSDx0hpRw=;
        b=YZokpVOGlZeBUcIP4wt2BiEmqLAdaGHUu7lUAEx9ZFlqJfFDON8wXHHVvS1D0uPCyY
         EGDtwCAR8hNaAoEGNrlyKdvD1nNImrddUyvgDJz8MpPhr5Outma90HCT6iB4PmH/+frY
         t6O9OHzs4dnqZ74cC6s+ssdBKI4LqOG6ULjzxyxMALalclFCBVYlBG+pdsLUUsxDNAu0
         WrjXvx7M5VuyGE6JKPkNXU63WUhTxGa+/88Wcm2WM7muXYZw4f2z01aE1+61iBtPciE/
         mtxY/2YmymdHZZXrUbLt+tbl7lt3qlhITlh7LIB138/vla1T1xd9gba7E3Pavsp0tNwM
         gUSA==
X-Forwarded-Encrypted: i=1; AJvYcCWzxxlrQKutBfJ9DBuVkEGpgK/mp5q6LthzMi8030JOGmHWhdO36c37qoDVtXsiGyAILcUD0gt5z7lR+eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/6OZkYn0F0n3gcQy4kJmi5DH/XMbT062tDqdGWpkNmdWdS86
	Gk676mfqr1AGBW4hcZoh0RN/gumMbhHW/37wjZA+WD7rOImLpak7
X-Gm-Gg: ASbGncu2U2shIhS5k7PBSTWnsBFN4BvBEuc/0K/RU/VDw/NURTofZm4AliyMuDPkGur
	4C0bpQIAjlKRfs/Mcc+fANmHS3PGuMI6TPQO8wyHmwn2APcU/OusJREm/oAiUVWyPN9lIrH1cyZ
	i84zIyQoUd+Ol5rRNpRxltIe7qx+xs63X1JmJp09Xnnu38TeHVq2N3yyR5KUKcnazFqii3+Bxrg
	Z4Efwt/W/jM16dSb4kf6r39j1ff7f0md0EmEzFm+ya1uHIsfHez2Sgr4ZjXzoIyflAxJevmh37/
	TjK2WZLWWCVW5wGgAM7fzP1rLj8zWsPMSQutPaFLzLXDmIq/y2I=
X-Google-Smtp-Source: AGHT+IHqQnlYEtWKs1L/q6Y1WTjJOwVkcw6HSTXvKSrxnXSL6DopuLIS+y7zHYniOgUGfSme5K/rWw==
X-Received: by 2002:a17:906:2b14:b0:acf:dca5:80f7 with SMTP id a640c23a62f3a-acfdca58dbbmr101326266b.26.1746110101957;
        Thu, 01 May 2025 07:35:01 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55bc49sm46906166b.158.2025.05.01.07.35.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 May 2025 07:35:01 -0700 (PDT)
Date: Thu, 1 May 2025 14:35:01 +0000
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
Message-ID: <20250501143501.vljk4hriuc3c2yrv@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
 <87e668d54927bb4ccdb7d374275e0662de667697.1745307301.git.lorenzo.stoakes@oracle.com>
 <20250430004703.63rumj4znewlbc2h@master>
 <8c052822-5365-4178-8e06-ecd4f917cf8a@lucifer.local>
 <20250430154119.a5ljf5t5tutqzim5@master>
 <ae3717ca-42e7-49a6-99f9-73a4c0be70f9@lucifer.local>
 <20250501011845.ktbfgymor4oz5sok@master>
 <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6d5a67e-efcf-4e23-90c4-4f6e370bde32@lucifer.local>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, May 01, 2025 at 10:27:47AM +0100, Lorenzo Stoakes wrote:
>On Thu, May 01, 2025 at 01:18:45AM +0000, Wei Yang wrote:
>> On Wed, Apr 30, 2025 at 05:07:40PM +0100, Lorenzo Stoakes wrote:
>> >On Wed, Apr 30, 2025 at 03:41:19PM +0000, Wei Yang wrote:
>> >> On Wed, Apr 30, 2025 at 02:15:24PM +0100, Lorenzo Stoakes wrote:
>> >> >On Wed, Apr 30, 2025 at 12:47:03AM +0000, Wei Yang wrote:
>> >> >> On Tue, Apr 22, 2025 at 09:09:20AM +0100, Lorenzo Stoakes wrote:
>> >> >> [...]
>> >> >> >+bool vma_had_uncowed_children(struct vm_area_struct *vma)
>> >> >> >+{
>> >> >> >+	struct anon_vma *anon_vma = vma ? vma->anon_vma : NULL;
>> >> >> >+	bool ret;
>> >> >> >+
>> >> >> >+	if (!anon_vma)
>> >> >> >+		return false;
>> >> >> >+
>> >> >> >+	/*
>> >> >> >+	 * If we're mmap locked then there's no way for this count to change, as
>> >> >> >+	 * any such change would require this lock not be held.
>> >> >> >+	 */
>> >> >> >+	if (rwsem_is_locked(&vma->vm_mm->mmap_lock))
>> >> >> >+		return anon_vma->num_children > 1;
>> >> >>
>> >> >> Hi, Lorenzo
>> >> >>
>> >> >> May I have a question here?
>> >> >
>> >> >Just ask the question.
>> >> >
>> >>
>> >> Thanks.
>> >>
>> >> My question is the function is expected to return true, if we have forked a
>> >> vma from this one, right?
>> >>
>> >> IMO there are cases when it has one forked child and anon_vma->num_children == 1,
>> >> which means folios are not exclusively mapped. But the function would return
>> >> false.
>> >>
>> >> Or maybe I misunderstand the logic here.
>> >
>> >I mean, it'd be helpful if you delineated which cases these were?
>> >
>>
>> Sorry, I should be more specific.
>>
>> >Presumably you're thiking of something like:
>> >
>> >1. Process 1: VMA A is established. num_children == 1 (self-reference is counted).
>> >2. Process 2: Process 1 forks, VMA B references A, a->num_children++
>> >3. Process 3: Process 2 forks, VMA C is established (maybe you think b->num_children++?)
>>
>> Maybe this is the key point. Will explain below at ***.
>>
>> >4. Unmap vma B, oops, a->num_children == 1 but it still has C!
>> >
>> >But that won't happen, as VMA C will be referencing a->anon_vma, so in reality
>> >a->anon_vma->num_children == 3, then after unmap == 2.
>> >
>>
>> The case here could be handled well, I am thinking a little different one.
>>
>> Here is the case I am thinking about. If my understanding is wrong, please
>> correct me.
>>
>> 	a                  VMA A
>> 	+-----------+      +-----------+
>> 	|           | ---> |         av| == a
>> 	+-----------+      +-----------+
>> 	             \
>> 	              \
>> 	              |\   VMA B
>> 	              | \  +-----------+
>> 	              |  > |         av| == b
>> 	              |    +-----------+
>> 	              \
>> 	               \   VMA C
>> 	                \  +-----------+
>> 	                 > |         av| == c
>> 	                   +-----------+
>>
>> 1. Process 1: VMA A is established, num_children == 1
>> 2. Process 2: Process 1 forks, a->num_children++ and b->num_children == 0
>> 3. Process 3: Process 2 forks, b->num_children++ => b->number_children == 1
>>
>> If vma_had_uncowed_children(VMA B), we would check b->number_children and
>> return false since it is not greater than 1. But we do have a child process 3.
>>
>> ***
>>
>> Come back the b->num_children. After re-read your example, I guess this is the
>> key point. In anon_vma_fork(), we do anon_vma->parent->num_children++. So when
>> fork VMA C, we increase b->num_children instead of a->num_children.
>>
>> To verify this, I did a quick test in my test cases in
>> test_fork_grand_child[1]. I see b->num_children is increased to 1 after C is
>> forked. Will reply in that thread and hope that would be helpful to
>> communicate the case.
>>
>> Well, if I am not correct, feel free to correct me :-)
>
>OK so you've expressed this in a very confusing way and the diagram is
>wrong but I think I see the point.
>

Sorry for my poor expression, while fortunately you get it :-)

>Because of anon_vma reuse logic in anon_vma_clone() we might end up in the
>situation where num_children (which strictly reports number of anon_vma
>objects whose parent pointer points at that anon_vma) does not actually
>correctly reflect the fact that there are multiple mappings of a folio.
>
>I think correct approach is to also look at num_active_vmas which accounts
>for this, but I think overall we should move these checks to being a 'best
>guess' and remove the WARN_ON() around the multiply-mapped folio
>logic. It's fine to just back out if we guesstimated wrong.
>

Would you mind cc me if you would spin another round? I would like to learn
more from your work.

>I'll also add a bunch of tests to assert specific fork scenarios.
>
>>
>> [1]: http://lkml.kernel.org/r/20250429090639.784-3-richard.weiyang@gmail.com
>>
>> >References to the originally faulted-in anon_vma is propagated through the
>> >forks.
>> >
>> >anon_vma logic is tricky, one of many reasons I want to (significantly) rework
>> >it.
>> >
>> >Though sadly there is a lot of _essential_ complexity, I do think we can do
>> >better.
>> >
>>
>> --
>> Wei Yang
>> Help you, Help me

-- 
Wei Yang
Help you, Help me
