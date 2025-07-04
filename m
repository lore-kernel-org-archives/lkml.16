Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B461DE2D8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641205; cv=none; b=q6aIUlJHJ88bAzCuCsJup+Kmd21PwMHSh83UkTR8C0Kd/6t4TBE+IfCFHHT4D4lLh7r3QUF8CKsRWFSi6ERQhv0UTtb/G4g51Qp1WIuFGGqgv7BkrcIOP0yaBDzYKqTbgji9THMXLQg6lwWX6eGtFg8ejqQ4oJ5N5d289yYoV08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641205; c=relaxed/simple;
	bh=ncoj26+lyaPht5HUIEmB9mXEdtS/k7RH3JG1ghEyD0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUf8x7e01whY753GU6rsMBivLSL/JUisMWP49u1iYY3EC56Z3iYm3RMbqamOO2GU0lXC3Frqahl0/3yk9FOvfbTknU48A1gfOqr8eG/7R2QcwlVhjW5IY46pDCuvlvWxQbJ5FvSWBUrDOyoUT8VDbj53TpX5O0a3n4/l2mpwEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VBZ036KV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VBZ036KV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751641202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C/Cwj9oRPW2MMTaqz9C0MJPxO4pJHPnVvDIUyE/4QRA=;
	b=VBZ036KVTl03UZXAssrOfBfPe3+bqaZiGCmnJ798eHSTsqUwhSSWn1bkh3fAc/exoFG7mH
	2Ryugce/0HCiL7TkcwU5OVUjV0pS+lGMVJ4gF1hDNEu1EwgpGYCYIzNXqwDfH8K4ss5aVs
	4dkEWHbkCYuA1sg8atqeNceF9F/fDLE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-J25P5JRbPLmVyWh4TM3CzQ-1; Fri, 04 Jul 2025 11:00:01 -0400
X-MC-Unique: J25P5JRbPLmVyWh4TM3CzQ-1
X-Mimecast-MFC-AGG-ID: J25P5JRbPLmVyWh4TM3CzQ_1751641200
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fad2a25b65so15901026d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641200; x=1752246000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/Cwj9oRPW2MMTaqz9C0MJPxO4pJHPnVvDIUyE/4QRA=;
        b=Sz7RkAJiCrfDj7i9bOmFSose+CqYbT2PRbuInn0DYYCtqR/hxSfsTl2PnSd4KpHoQ6
         7tDQk1NmKWhgzdvvQWl5MtQnu3sZg0RdwYRBXGiDoFCOODl0011eEMLB421hMDslRowM
         KYTfCHNdxocqw9mFtLbwvTVE/65PdSbyKRSV4x+FIgpEPTtWRPXUKymu7TnaSC8V1hKX
         vJAsv8qNTSgO+wLZA1BQUXfdfCuEbPQtjjFNg3rHpAtdrh38ABnRH+kS8xS8hkJT+uKb
         v+N0d29OGJa8YZ1jDs6UyJ+D4TlKzMMU8Sb3HopKfAbMzq5fWnwp2MBDRnbXRmCqv3uR
         QHgg==
X-Forwarded-Encrypted: i=1; AJvYcCUliWJXaAYv2qpFX/dvkZXmBYzQtYEovKLCmAC1h3Ff+hdelCffcaCocDiu6vVmdA3qoiUTB0hE2AZ7Ju0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+5xONIlMJ7yC89EGhd8+uwBUkwcuB7UKqVrmL7FqzXNnQBia
	bd/D9iu+PYjIeQainleGXUwliyFBL0E31CHypQKIwvQ+8lVpo2jT7RLDzUTPPqoeGmTy6DWvbYs
	RALnlR73zH+Exyd4Y9DoW+wcn+6vY3qJ+d5agGuvVKNU1lOf/MAh0rMSHVeVvn3XrMQ==
X-Gm-Gg: ASbGncs6Gien6Cb8AdFldHFxERiSN46BPUsQh6SD9PrNJdg0RRFCMekPooN0TIZog/n
	5mAFzlThy1ak+NeDHq4Nq5l+ct5I6mayVU8w5rgs5ju92ruixU7OZuf3DNWtqzD+tBpiJU6A9d6
	2pvV+9WnWbPlUo4JKnE6YGptojmCD28IxFiVQtQIB/QK14NbofHzpOnQ04UwB9EwZBgt7ylSHj+
	Bn0Ew1VCGmoA1qy8PPQIF/PKPF9iDxHOaT8bYMeO0kppum114+ODJ+OHcnpHNOG4xBWGKL1m4em
	SdrbTKuEwWO4xQ==
X-Received: by 2002:ad4:5f0a:0:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c8b72059mr36080746d6.10.1751641199554;
        Fri, 04 Jul 2025 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhPr2MJbmotTsNytY9PPizY5rZHNJJDa1rC3WhIDApCHnYhg45xf20jKrYIUTpS+SAQb2S+g==
X-Received: by 2002:ad4:5f0a:0:b0:6fb:59de:f8ab with SMTP id 6a1803df08f44-702c8b72059mr36078116d6.10.1751641196742;
        Fri, 04 Jul 2025 07:59:56 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cd4128sm13562166d6.52.2025.07.04.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:59:56 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:59:52 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Muchun Song <muchun.song@linux.dev>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Ujwal Kundur <ujwal.kundur@gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Introduce vm_uffd_ops API
Message-ID: <aGfsaIIzHWfjcNFd@x1.local>
References: <20250627154655.2085903-1-peterx@redhat.com>
 <20250627154655.2085903-2-peterx@redhat.com>
 <aaaca9d4-b8df-45b8-a3a4-a431c99f26c7@lucifer.local>
 <CAJuCfpHN6vpDx+UNPEzJgZ_qD9USTJZ_+yZzQg2BpF_aRpufYw@mail.gmail.com>
 <982f4f94-f0bf-45dd-9003-081b76e57027@lucifer.local>
 <cda7c46b-c474-48f4-b703-e2f988470f3b@amazon.com>
 <aGVu1Isy-R9RszxW@kernel.org>
 <aGWMsfbayEco0j4R@x1.local>
 <aGbCbW7hUf3a2do2@kernel.org>
 <289eede1-d47d-49a2-b9b6-ff8050d84893@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <289eede1-d47d-49a2-b9b6-ff8050d84893@redhat.com>

On Fri, Jul 04, 2025 at 11:34:15AM +0200, David Hildenbrand wrote:
> On 03.07.25 19:48, Mike Rapoport wrote:
> > On Wed, Jul 02, 2025 at 03:46:57PM -0400, Peter Xu wrote:
> > > On Wed, Jul 02, 2025 at 08:39:32PM +0300, Mike Rapoport wrote:
> > > 
> > > [...]
> > > 
> > > > > The main target of this change is the implementation of UFFD for
> > > > > KVM/guest_memfd (examples: [1], [2]) to avoid bringing KVM-specific code
> > > > > into the mm codebase.  We usually mean KVM by the "drivers" in this context,
> > > > > and it is already somewhat "knowledgeable" of the mm.  I don't think there
> > > > > are existing use cases for other drivers to implement this at the moment.
> > > > > 
> > > > > Although I can't see new exports in this series, there is now a way to limit
> > > > > exports to particular modules [3].  Would it help if we only do it for KVM
> > > > > initially (if/when actually needed)?
> > > > 
> > > > There were talks about pulling out guest_memfd core into mm, but I don't
> > > > remember patches about it. If parts of guest_memfd were already in mm/ that
> > > > would make easier to export uffd ops to it.
> > > 
> > > Do we have a link to such discussion?  I'm also curious whether that idea
> > > was acknowledged by KVM maintainers.
> > 
> > AFAIR it was discussed at one of David's guest_memfd calls
> 
> While it was discussed in the call a couple of times in different context
> (guest_memfd as a library / guest_memfd shim), I think we already discussed
> it back at LPC last year.
> 
> One of the main reasons for doing that is supporting guest_memfd in other
> hypervisors -- the gunyah hypervisor in the kernel wants to make use of it
> as well.

I see, thanks for the info. I found the series, it's here:

https://lore.kernel.org/all/20241113-guestmem-library-v3-0-71fdee85676b@quicinc.com/

Here, the question is whether do we still want to keep explicit calls to
shmem, hugetlbfs and in the future, guest-memfd.  The library-ize of
guest-memfd doesn't change a huge lot on answering this question, IIUC.

It definitely reduces the use of mfill_atomic_install_pte() so that we
don't need to export it.

However if we want to generalize userfaultfd capability for a type of
memory, we will still need something like the vm_uffd_ops hook to report
such information.  It means drivers can still overwrite these, with/without
an exported mfill_atomic_install_pte() functions.  I'm not sure whether
that eases the concern.

So to me, generalizing the mem type looks helpful with/without moving
guest-memfd under mm/.

We do have the option to keep hard-code guest-memfd like shmem or
hugetlbfs. This is still "doable", but this likely means guest-memfd
support for userfaultfd needs to be done after that work.  I did quickly
check the status of gunyah hypervisor [1,2,3], I found that all of the
efforts are not yet continued in 2025.  The hypervisor last update was Jan
2024 with a batch push [1].

I still prefer generalizing uffd capabilities using the ops.  That makes
guest-memfd support on MINOR not be blocked and it should be able to be
done concurrently v.s. guest-memfd library.  If guest-memfd library idea
didn't move on, it's non-issue either.

I've considered dropping uffd_copy() and MISSING support for vm_uffd_ops if
I'm going to repost - that looks like the only thing that people are
against with, even though that is not my preference, as that'll make the
API half-broken on its own.  Said that, I still prefer this against
hard-code and/or use CONFIG_GUESTMEM in userfaultfd code.

I'll wait for a few more days to see whether there's comment on above plan
to drop uffd_copy().

Thanks,

[1] https://github.com/quic/gunyah-hypervisor/tree/develop/hyp
[2] https://lore.kernel.org/all/20240516143356.1739402-1-quic_svaddagi@quicinc.com/
[3] https://lore.kernel.org/lkml/20240222-gunyah-v17-0-1e9da6763d38@quicinc.com

-- 
Peter Xu

