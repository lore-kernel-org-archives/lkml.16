Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947E42222CC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849062; cv=none; b=akxCBbejwofb4w2luF+pgQPuVTqLYMJdMZWxNQTrv+zgJ7+pHHxQejVEUKu6Wy+gw5NWnDO6bl8OdD8Ry6e2aW84kSk7vJEYB4VZWK2YdSXEl7Brge+hsBHA/6QyQ9EdAtDCOMaW0a4W+gqWh8NSCudERmXj9Z/DYkA78PwbeuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849062; c=relaxed/simple;
	bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Omg8Nhuy4+e4clfsqZ6PiNp1G0YnCHZCvcaT80/sI5zFREoqRy+lMhyAqPU6l23RZj8Mfs2HxfR0HcFeSh1dHBBIPueC/lYupCmTMRaJAkP6jqOOuApO7CotGJzxaysC+adbG0qyR4F7Jbag+O1ar72b9yUYWFEo6m387edaoFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hr27pzgp; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hr27pzgp"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7fb730078so1756363137.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750849059; x=1751453859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=;
        b=Hr27pzgp9T5SM9zsh07l6MGvGqdVbyiZSHPstLdMGCnDeuTaLzYLOuAZKQAnzObJp+
         MwFXASmj8ZEKgwl6t1iVcrRorA4Ut4ovljHa0Ak2b8t5oY88Qn8kAaYhCBoWbPXpzhFF
         ekb1QZdv6/gjh37OD3SXf1lDbj+xp0uKyBZV/H5j9ACA/Ws5aCtmibst27K3bLpYoabM
         7S7AT8ZHmGs4g0JcmQksNWXkxVh4c9HYFnfP38e7K300z95vUAQ0XHv8RT2lD2zTOjNM
         LFVUlxI4OTQu4x9bvmIh4lgeEVadd/8R5SldKv15fgk5FcGArpx1Kux4plGmUvm0Vx3J
         wK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750849059; x=1751453859;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj0STZsYtbu1kQ3gPY9FIOxyqjDAl+wTNEIVZVCZURk=;
        b=DbBfxFciI3Efepm1zOR0KfIHsgo0xU5eR+aHHLnsBZZ53pautWZrQZI82rz/Z3JMSk
         8FcoTOoE3NwlM9+I/AI/IXiTwdo7Sv9WGeJ8h0I+DSsH5DpCnXYvEVoRy2xbkoTRnoV/
         xgoTm8TZftlNLM6qtoh0anZfK2pLNqKCim0oOMDXdJjQzrUb2X/fqF18ijF/Eh8BG5yy
         IrErM8RglFHpmNVr9nO3v4cdzrRGqEXFDLs2nHPhNFwC+9ETRCpz7fe2HZaKyxxp3JDW
         zfSFlNvJ21SyKOjU1Mfhyn/Q2fmmZ1eJAy31T71pUQ9VMH1X1kEKUS/LOEtsuV1Ce7Z0
         BY8w==
X-Forwarded-Encrypted: i=1; AJvYcCUaRcWixn3yFimPKSsJA8bvKSQcgnXq5y0/By71gYgq9tMnp9iEWRYBmrOLJpwd4Rr1Tu65aW4XyrOGM0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWNAkFuhKAH6U1zBFB5xUKeYNWyXvj+jXRoiECLh9FZ+zuFTHG
	nEjBVYlAuGbvQ6owFotHziYNcodFrG7xrePNLbxhE5poJ6DGGfXphCYC14xwNt5T02Ba42wwfYB
	PP6yjZ/A6ZyWTWWhg9AppMjZTYCbLbdI=
X-Gm-Gg: ASbGncu8k581jPtgA/XIXNYWj8h3ElklXDxgzkWqFu5LkqCIqffP0I/yyesC6PDpdZy
	oNX/2uGPlossogT1dA73uRowUKboYaNmSlLF2Ci+gLstx7d4Vu7jpVStvrG3kAcojEjTil1TZaq
	3oeHrHAWvOBKLuEkDJurxd86RhRQX9Q1BNETUZP/x+0GY=
X-Google-Smtp-Source: AGHT+IHxYZQQdKiWNAVrM7n23h4q54LeHy4Ec4zMJQOJpG9fbtf7HmW4k7rR6lcFnPnH4b5aUcO70ihcOUZ137GEwrE=
X-Received: by 2002:a05:6102:919:b0:4e9:add0:2816 with SMTP id
 ada2fe7eead31-4ecc6a6eea2mr1102553137.5.1750849059136; Wed, 25 Jun 2025
 03:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
In-Reply-To: <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 22:57:27 +1200
X-Gm-Features: Ac12FXzTXMGVnpcik-Ihc93WyWfYdygYrAzrCh0xDLBYAYx4TBPj8MQP9kn6COg
Message-ID: <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: Lance Yang <lance.yang@linux.dev>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> >
> > Note that I don't quite understand why we have to batch the whole thing
> > or fallback to
> > individual pages. Why can't we perform other batches that span only some
> > PTEs? What's special
> > about 1 PTE vs. 2 PTEs vs. all PTEs?
>
> That's a good point about the "all-or-nothing" batching logic ;)
>
> It seems the "all-or-nothing" approach is specific to the lazyfree use
> case, which needs to unmap the entire folio for reclamation. If that's
> not possible, it falls back to the single-page slow path.

Other cases advance the PTE themselves, while try_to_unmap_one() relies
on page_vma_mapped_walk() to advance the PTE. Unless we want to manually
modify pvmw.pte and pvmw.address outside of page_vma_mapped_walk(), which
to me seems like a violation of layers. :-)

Thanks
Barry
