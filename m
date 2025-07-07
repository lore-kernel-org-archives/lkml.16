Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7209E27586E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 06:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751868772; cv=none; b=rb4kO/zZBzKAiveg52g3sMf65eEgoC/bX1I3Ga3BsS4ULxPiQcimE1g5CzSW007xMcS9uUGE/Eqv7HvzLm6iFCIqitXF/79hjk9uD3giQ2joDr3XGRFj4c1Idnsp6OIN3c5LvvGzryB7spAw351Jqb6NHpT9F8BXwgfSWRjbpLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751868772; c=relaxed/simple;
	bh=b1NCztmUuHT7YB6Ei49PdtUDXfM+d5EAuJX4T6h80RE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=XFv5S3LV0IesSsAVBesCWI0x+2gtIx/kNYvtw8afcmdSkV3pZb5NHwrol6GUcajAUwjoT/hCBJM+oA0Hzew4DpuaXKMSNC8yZBXQZVCZFppZGuEstxpggS68atsrF/PReZuyZphxZfr71VCGJ400pD/WVpaCLAhO5rIUQs3kHX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f97oRUec; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f97oRUec"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e81826d5b72so2224173276.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 23:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751868769; x=1752473569; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k47dZt0Crs1sORHhdpWLtZdwuIrz1qyGCHW6wK+Mmyw=;
        b=f97oRUecOZhbnBM/m4NQtu8hTVAW0EhR3/uVGcGQi8SgrgSPDIfEZebTXn/piqsZmi
         W/36VkfZqN2gA1ZYCiMGMbt/KWEnYV0kzVVKLSoUJk572Vzc2BezwpEAPN2uGpQ4MZqV
         zoPhARtnPgiAJDT1U5W1z770zn9FRMU0jtgQSVi0qGE8LbF4vuTrnCRMUCaSDC19LufJ
         Vhc627cZ0H9Tmj6jJPTA3N4qmV8i5OE1vP6p84MPTGE9SoAtyY/121RrDfQhS6UFvRuh
         naf8fjcuK04PaHzXJRvDVN9Bu23R6jGh1hNrF3f3fwz6qZg2LaBCZl+VD96VYRYOCUb3
         2X5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751868769; x=1752473569;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k47dZt0Crs1sORHhdpWLtZdwuIrz1qyGCHW6wK+Mmyw=;
        b=PlFxOLOlW6lv1z30hpxsmbPBxBfxd2umpXj2oF0J7ry/fAnkNpzYy7ipu20bHUM2Ux
         sB6PLGmZhZ+ordbYgVaL0V7uVeaDheG1Rnq+cfo9so5YaM11F43Zq2V5HNlpTNd+tBv8
         zVSgtmgu6VWJ1bbzYouOzfdkvle+R/ktYPxToyer0Jk8aIe0npEvzPLX6bik/SF5BZKb
         EW0U8ie10sI/4wgN1Azejw7U19bpiSA9SA4bXgIVh+q7NIKJe8+O9MBYusuuwlfh8Q53
         Za5xCVxSzQM3jrKw+CQR04nZf1ps2p5zChWHzbMOGNwM5MTofPp4qLEdZASKDN09B/Rw
         nW9A==
X-Forwarded-Encrypted: i=1; AJvYcCVX8LthRmUnLpPVb6QU56SVTtifthGhtVeD2bwlEI50e5nFYNsz+MK+MoYBjfNVh9bRT5HPhd75QNfArHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4wGNq+qQE01g9G26eg5am1QQrdHqdIwguSRdbZVy/bYmPSBH5
	z0U5O+e4jpHOD2fvRVjj+mvUnjXMyKiwMgBWOdelQRBXjoVwifHntwbnXHyuD2y4RQ==
X-Gm-Gg: ASbGncvbM2AqHzfu3/QNyA27d+OPcpcFPY7mqPLsymzPLtY2ESYuggWX3BMtcrRKuye
	OXIUU0DSE4+GYQHDJZlrdUW+OAS72Lm+llNAqWchG59cWhShDvLFldFfcN5HXH6xmBI5rEDoIOP
	GP/JoXaCpdNuRGGSQF8WoUc0ErEOwEYfkBIMolreot5YgO9EJB9pzcs4Od1YFe8Bp8QQAKixrPs
	GnjWCpqu9H8Tu6CE0+scgdbHD4qeJu2qPPpyUfOtam3yOUTEO2GKIR/GfSWKYrbS4H/SQkmuR6k
	zFSoG+jil68KRmDvh3q9274xq8/dm5T0NjArNFy7i9vGyghUoBDWDZAhMkccdN2ZqZPsKrgfDEL
	2KfrydZ6p0Ja6t+3D/WD74qc2O6fRTWxo/v8EkQrluamf5+0=
X-Google-Smtp-Source: AGHT+IF9uQB3C/Tk35uzYdwuZvbuiSoulQvT3LDcgrKfi8L4w4dnTGxlaUN4ZI/H1HoNYSPT7Y5GKw==
X-Received: by 2002:a05:6902:18c7:b0:e82:1c60:4f7d with SMTP id 3f1490d57ef6-e8b3cd8d184mr7723935276.39.1751868768837;
        Sun, 06 Jul 2025 23:12:48 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e899c440860sm2451588276.30.2025.07.06.23.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:12:47 -0700 (PDT)
Date: Sun, 6 Jul 2025 23:12:35 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, 
    Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
    "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>, 
    Pedro Falcato <pfalcato@suse.de>, Rik van Riel <riel@surriel.com>, 
    linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/10] mm/mremap: permit mremap() move of multiple VMAs
In-Reply-To: <cover.1751865330.git.lorenzo.stoakes@oracle.com>
Message-ID: <4a4344b5-ff68-d57f-de7a-68a091bcb092@google.com>
References: <cover.1751865330.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Jul 2025, Lorenzo Stoakes wrote:

> Historically we've made it a uAPI requirement that mremap() may only
> operate on a single VMA at a time.
> 
> For instances where VMAs need to be resized, this makes sense, as it
> becomes very difficult to determine what a user actually wants should they
> indicate a desire to expand or shrink the size of multiple VMAs (truncate?
> Adjust sizes individually? Some other strategy?).
> 
> However, in instances where a user is moving VMAs, it is restrictive to
> disallow this.
> 
> This is especially the case when anonymous mapping remap may or may not be
> mergeable depending on whether VMAs have or have not been faulted due to
> anon_vma assignment and folio index alignment with vma->vm_pgoff.
> 
> Often this can result in surprising impact where a moved region is faulted,
> then moved back and a user fails to observe a merge from otherwise
> compatible, adjacent VMAs.
> 
> This change allows such cases to work without the user having to be
> cognizant of whether a prior mremap() move or other VMA operations has
> resulted in VMA fragmentation.
> 
> In order to do this, this series performs a large amount of refactoring,
> most pertinently - grouping sanity checks together, separately those that
> check input parameters and those relating to VMAs.
> 
> we also simplify the post-mmap lock drop processing for uffd and mlock()'d
> VMAs.
> 
> With this done, we can then fairly straightforwardly implement this
> functionality.
> 
> This works exclusively for mremap() invocations which specify
> MREMAP_FIXED. It is not compatible with VMAs which use userfaultfd, as the
> notification of the userland fault handler would require us to drop the
> mmap lock.
> 
> The input and output addresses ranges must not overlap. We carefully
> account for moves which would result in VMA merges or would otherwise
> result in VMA iterator invalidation.

Applause!

No way shall I review this, but each time I've seen an mremap series
from Lorenzo go by, I've wanted to say "but wouldn't it be better to...";
but it felt too impertinent to prod you in a direction I'd never dare
take myself (and quite likely that you had already tried, but found it
fundamentally impossible).

Thank you, yes, this is a very welcome step forward.

Hugh
