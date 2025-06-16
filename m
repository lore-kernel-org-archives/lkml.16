Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C6DBA42
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 20:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750105453; cv=none; b=T6NLoMp/6pchW1O/mGUJaupHlPiHfC7YkJSYwoASNTIhuj7gVLdi0ithUAzmdUd2VM2UC2eMTbZeEp0bJzf/ibrX7oXfDV0wa6VF0gIx/GS8q/usyztff8pdyNssOWcuFnSviAPTWuAvs75wuxSV0nNx7mQZhrvt5Rws3ZELgCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750105453; c=relaxed/simple;
	bh=UzPDIrXGT8ub1bOR3b8KwseyFtZa+A91NomnhLjV294=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=czdLPLVIu3tvp1lsbVL5QTyI22IxGaukh2xcpcRe8P+q/VPRX9EWfpWq8mDzMSwaSuWUSDcWQnh7jCAYPlLsJrL3oH5MsUQ2Q5azb4bR6UPjgOCU6qDJs3x2clZPUz7r9d7BeKVgU2SjPHSYYv35S41K6iHpK6vS3QF4g99020o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UakSxni6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UakSxni6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750105450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MujpOMnQjLqgp4bdsGzt2203T3X/ak3Vnqd8IfmjjDE=;
	b=UakSxni6PEoqaXPQAIupXxuEFUPFRLt7akyBlBBsmPdhcs+ShiQDusppd/WZ8ZwFphhbXM
	YwZOjKRKxcutmIl770ImZ8xP57Dj8xzJSvrD4IMLgDOz/Y5c4JwaobtfiHQ5CDu81Oux7k
	hho9AneSL9slWb4NX5oflZTDCeq9oQQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-9otZPHXPOneRfDowYepVuQ-1; Mon, 16 Jun 2025 16:24:08 -0400
X-MC-Unique: 9otZPHXPOneRfDowYepVuQ-1
X-Mimecast-MFC-AGG-ID: 9otZPHXPOneRfDowYepVuQ_1750105448
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579728319so764115f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750105447; x=1750710247;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MujpOMnQjLqgp4bdsGzt2203T3X/ak3Vnqd8IfmjjDE=;
        b=o5KQA+9lZTelmKSlPGGKYqezMBK1Fmy+kTraoGEaY/DoXz12OyR3xRMvLXDaVvyhf1
         O0VXDHmfyHJzaJwy3BdHqoJSWA16HkLoJtxWdNzvhs/wEZBlau0DPc+GD55+ItzsTYHs
         pt1tlFBvV8d5fAIb+52eq53AO6X6zxsXEIs/VvCtrxrE0ahfb79Qehz5aVNQf+390033
         qLpx2SW68+tbkPxDrUjlPKbcp0vc1HcL/1AmzMKfyqPfl715MA6pevztuoC+WvOb2vYt
         G2/rEayWNsafhztOBWxUTbwzZZ/RbOuDePEQyDsV8HoBR1d0JCdLaqBMEwYq9n9mQg1r
         hrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUif1BVMOQrMijfnJMMwHuaODK5z/mKeypFXBGD3dCDipOQhM31i0iwj8ABDUJ3sjxsnJy3DDwUUd84qb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk5FhzD/lZ3HW6KwunF5GAJylumUdPoP5WcYK0QrJf4a6SCckt
	9cdQgPkRIokhItwDpAJ3wNFTy13AGDKEe6fSykSoYuKwjtQtVGogRfENTZrTFEyJUpgQFDirqGf
	dxkk/el8Wncm9QxpWNuC/uwWLAhXUachQy1BQ1/iIyK9OnSrGUxsElIKk/lUFz/ZnnA==
X-Gm-Gg: ASbGncuOulZO0JbjRmuw8p6W5H5EUdJsHXPZMDixxZ+YjX978wgCNayJplOhK4guM2H
	uakdidyfar7Kr7r95tmtOgqqAdQPqS04FFhzvXYl+6YmFaFW0GR5Eft39I4UOU+PQtexIEBTezK
	6SW9iOo68xppNY12ciKL6M3Y5qgY8pcXo9KFYdoos0rfHQfLG13/2x4GnTVzWehIN3vbF7KrgTS
	slSD7ljDDaBbkXQA0YapTykbewVId0rswPKF75mOdj49kTjE6FFmI0aPUcLahU98ISAnwXHTmuj
	7kxzwoiCLG1UOgZXAcZvPON9n9boYNgxooNcKHoJoDpIS7+Cq0HkHhl4blIqbFDxvdXZ+A6l5ky
	Kp/2JdpRB76ad6Z0xFmfrkPlpn4v+ode7c79eF0MlZD7BEdtRmA==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3a572e79fa4mr8414005f8f.32.1750105447444;
        Mon, 16 Jun 2025 13:24:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNs1HsVYbArG/PvO9ENQuG43J1s+ttVlfi7JHJJXlZOrnOFgZxTdDyS4Qpy5inRN7IlR7Tlw==
X-Received: by 2002:a05:6000:24c8:b0:3a4:f918:9db9 with SMTP id ffacd0b85a97d-3a572e79fa4mr8413977f8f.32.1750105446913;
        Mon, 16 Jun 2025 13:24:06 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5? (p200300d82f3ae300c6604ff55bfbf5c5.dip0.t-ipconnect.de. [2003:d8:2f3a:e300:c660:4ff5:5bfb:f5c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a734b5sm12221372f8f.33.2025.06.16.13.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 13:24:06 -0700 (PDT)
Message-ID: <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
Date: Mon, 16 Jun 2025 22:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
 <willy@infradead.org>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lorenzo,

as discussed offline, there is a lot going on an this is rather ... a 
lot of code+complexity for something that is more a corner cases. :)

Corner-case as in: only select user space will benefit from this, which 
is really a shame.

After your presentation at LSF/MM, I thought about this further, and I 
was wondering whether:

(a) We cannot make this semi-automatic, avoiding flags.

(b) We cannot simplify further by limiting it to the common+easy cases 
first.

I think you already to some degree did b) as part of this non-RFC, which 
is great.


So before digging into the details, let's discuss the high level problem 
briefly.

I think there are three parts to it:

(1) Detecting whether it is safe to adjust the folio->index (small
     folios)

(2) Performance implications of doing so

(3) Detecting whether it is safe to adjust the folio->index (large PTE-
     mapped  folios)


Regarding (1), if we simply track whether a folio was ever used for 
COW-sharing, it would be very easy: and not only for present folios, but 
for any anon folios that are referenced by swap/migration entries. 
Skimming over patch #1, I think you apply a similar logic, which is good.

Regarding (2), it would apply when we mremap() anon VMAs and they happen 
to reside next to other anon VMAs. Which workloads are we concerned 
about harming by implementing this optimization? I recall that the most 
common use case for mremap() is actually for file mappings, but I might 
be wrong. In any case, we could just have a different way to enable this 
optimization than for each and every mremap() invocation in a process.

Regarding (3), if we were to split large folios that cross VMA 
boundaries during mremap(), it would be simpler.

How is it handled in this series if we large folio crosses VMA 
boundaries? (a) try splitting or (b) fail (not transparent to the user :( ).


> This also creates a difference in behaviour, often surprising to users,
> between mappings which are faulted and those which are not - as for the
> latter we adjust vma->vm_pgoff upon mremap() to aid mergeability.
> 
> This is problematic firstly because this proliferates kernel allocations
> that are pure memory pressure - unreclaimable and unmovable -
> i.e. vm_area_struct, anon_vma, anon_vma_chain objects that need not exist.
 > > Secondly, mremap() exhibits an implicit uAPI in that it does not permit
> remaps which span multiple VMAs (though it does permit remaps that
> constitute a part of a single VMA).

If I mremap() to create a hole and mremap() it back, I would assume to 
automatically get the hole closed again, without special flags. Well, we 
both know this is not the case :)

 > > This means that a user must concern themselves with whether merges 
succeed
> or not should they wish to use mremap() in such a way which causes multiple
> mremap() calls to be performed upon mappings.

Right.

> 
> This series provides users with an option to accept the overhead of
> actually updating the VMA and underlying folios via the
> MREMAP_RELOCATE_ANON flag.

Okay. I wish we could avoid this flag ...

> 
> If MREMAP_RELOCATE_ANON is specified, but an ordinary merge would result in
> the mremap() succeeding, then no attempt is made at relocation of folios as
> this is not required.

Makes sense. This is the existing behavior then.

> 
> Even if no merge is possible upon moving of the region, vma->vm_pgoff and
> folio->index fields are appropriately updated in order that subsequent
> mremap() or mprotect() calls will succeed in merging.

By looking at the surrounding VMAs or simply by trying to always keep 
the folio->index to correspond to the address in the VMA? (just if 
mremap() never happened, I assume?)

> 
> This flag falls back to the ordinary means of mremap() should the operation
> not be feasible. It also transparently undoes the operation, carefully
> holding rmap locks such that no racing rmap operation encounters incorrect
> or missing VMAs.

I absolutely dislike this undo operation, really. :(

I hope we can find a way to just detect early whether this optimization 
would work.

Which are the exact error cases you can run into for un-doing?

I assume:

(a) cow-shared anon folio (can detect early)

(b) large folios crossing VMAs (TBD)

(c) KSM folios? Probably we could move them, I *think* we would have to 
update the ksm_rmap_item. Alternatively, we could indicate if a VMA had 
any KSM folios and give up early in the first version.

(d) GUP pins: I think we could allow that ... folio_maybe_dma_pinned() 
is racy either way (GUP-fast!). To deal with GUP-fast we would have to 
play different games ...

Anything else?

> 
> In addition, the MREMAP_MUST_RELOCATE_ANON flag is supplied in case the
> user needs to know whether or not the operation succeeded - this flag is
> identical to MREMAP_RELOCATE_ANON, only if the operation cannot succeed,
> the mremap() fails with -EFAULT.

How would an APP deal with these errors? Do you have a user in mind that 
could do something sensible based on this error?

I'm having a hard time imagining that :)

> 
> Note that no-op mremap() operations (such as an unpopulated range, or a
> merge that would trivially succeed already) will succeed under
> MREMAP_MUST_RELOCATE_ANON.
> 
> mremap() already walks page tables, so it isn't an order of magntitude
> increase in workload, but constitutes the need to walk to page table leaf
> level and manipulate folios.

Only for anon VMAs, though. Do you have some numbers how bad it is? I 
mean, mremap() is already a pretty invasive/expensive operation ... :) 
... which is why people started using uffdio_move instead, to avoid  the 
heavy-weight locks.

> 
> The operations all succeed under THP and in general are compatible with
> underlying large folios of any size. In fact, the larger the folio, the
> more efficient the operation is.

Yes.

> 
> Performance testing indicate that time taken using MREMAP_RELOCATE_ANON is
> on the same order of magnitude of ordinary mremap() operations, with both
> exhibiting time to the proportion of the mapping which is populated.
> 
> Of course, mremap() operations that are entirely aligned are significantly
> faster as they need only move a VMA and a smaller number of higher order
> page tables, but this is unavoidable.
> 
> Previous efforts in this area
> =============================
> 
> An approach addressing this issue was previously suggested by Jakub Matena
> in a series posted a few years ago in [0] (and discussed in a masters
> thesis).
> 
> However this was a more general effort which attempted to always make
> anonymous mappings more mergeable, and therefore was not quite ready for
> the upstream limelight. In addition, large folio work which has occurred
> since requires us to carefully consider and account for this.
> 
> This series is more conservative and targeted (one must specific a flag to
> get this behaviour) and additionally goes to great efforts to handle large
> folios and account all of the nitty gritty locking concerns that might
> arise in current kernel code.
> 
> Thanks goes out to Jakub for his efforts however, and hopefully this effort
> to take a slightly different approach to the same problem is pleasing to
> him regardless :)
> 
> [0]:https://lore.kernel.org/all/20220311174602.288010-1-matenajakub@gmail.com/
> 
> Use-cases
> =========
> 
> * ZGC is a concurrent GC shipped with OpenJDK. A prototype is being worked
>    upon which makes use of extensive mremap() operations to perform
>    defragmentation of objects, taking advantage of the plentiful available
>    virtual address space in a 64-bit system.
> 
>    In instances where one VMA is faulted in and another not, merging is not
>    possible, which leads to significant, unreclaimable, kernel metadata
>    overhead and contention on the vm.max_map_count limit.
> 
>    This series eliminates the issue entirely.
> * It was indicated that Android similarly moves memory around and
>    encounters the very same issues as ZGC.

Isn't Android using uffdio_move?

> * SUSE indicate they have encountered similar issues as pertains to an
>    internal client.
> 
> Past approaches
> ===============
> 
> In discussions at LSF/MM/BPF It was suggested that we could make this an
> madvise() operation, however at this point it will be too late to correctly
> perform the merge, requiring an unmap/remap which would be egregious.
> 
> It was further suggested that we simply defer the operation to the point at
> which an mremap() is attempted on multiple immediately adjacent VMAs (that
> is - to allow VMA fragmentation up until the point where it might cause
> perceptible issues with uAPI).
> 
> This is problematic in that in the first instance - you accrue
> fragmentation, and only if you were to try to move the fragmented objects
> again would you resolve it.
> 
> Additionally you would not be able to handle the mprotect() case, and you'd
> have the same issue as the madvise() approach in that you'd need to
> essentially re-map each VMA.
> 
> Additionally it would become non-trivial to correctly merge the VMAs - if
> there were more than 3, we would need to invent a new merging mechanism
> specifically for this, hold locks carefully over each to avoid them
> disappearing from beneath us and introduce a great deal of non-optional
> complexity.
> 
> While imperfect, the mremap flag approach seems the least invasive most
> workable solution (until further rework of the anon_vma mechanism can be
> achieved!)

Well, at that point we already have these new flags ... :(

> 
>   include/linux/rmap.h                          |    4 +
>   include/uapi/linux/mman.h                     |    8 +-
>   mm/internal.h                                 |    1 +
>   mm/mremap.c                                   |  719 ++++++-
>   mm/vma.c                                      |   77 +-
>   mm/vma.h                                      |   36 +-

~ +40% on LOC on mm/mremap.c :(

-- 
Cheers,

David / dhildenb

