Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47221154433
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738892376; cv=none; b=aIA8CQMFhr0U08AoUYnsdVqx9S61I84NJeuzEEERs82+Vvzf8FoupgltzSuYhGr0R2d+m76UXwJU6X9QrixBuAUqHJygBtxgcZ+622yG4koC0Ks4T4weSBhMXdim1r3GjTs050csgzXiZf+XMTW++NuNNkHdCeysuI2pvsQItKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738892376; c=relaxed/simple;
	bh=rg6h9j7hSsRLDKpQBSBgp1rUA118C4HJT6vOUsNHgJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDxpdM2MCv1u18cimHcKD2Tb0TCLET4nT6KFfL8xslV6UghB3MMt0/RbteSAKxL+Y23UvOCpSeQvGl3OAqvFZPPZLqJ7YPuRV0BdEMRcSKu1+LHfJRJ0kWzsrkv2BgFWql5k+DM+E95g45hWcyFqO4pGcvlJdtTS/QP+GXvmB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=nCh6LIlO; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="nCh6LIlO"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A5C603F291
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738892371;
	bh=b1dO1A4fPI5eS8WT6hBCvAO68gaA09DjpLJhuG6VUwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nCh6LIlOnjgqqeP9LxXFZRsOb9TUbGy6sVjP5vVSIbwjloFpe15NSIIKLBjRlAzzQ
	 FDeudwsRRE/+qb5s/G4XpdQvTVEloNOogMMApLwQzcVMa9OD2txBQ8vMt90iV+iSbF
	 HWbi13C/SQ10L0+Hh94a/wl8Iw8fJroq5fGGsn3gAbv8IYFljLWUEombSoOpg6HA4t
	 UEQrigZ2UL0oj7zeELSud4T1+tf/0d614ggd2BkBlnikhrDM5s1AiKH3VZ/nOL5QrL
	 IObnomQdfTVqFm+SorR+4GxzYJeXqf3xRNPP5YY986ClqPq8I5on/qBltuD0Aj7bzS
	 sqL99U3opna6w==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5dcd3120b24so1755720a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 17:39:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738892371; x=1739497171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1dO1A4fPI5eS8WT6hBCvAO68gaA09DjpLJhuG6VUwI=;
        b=JJTdrLXR1hNxR79UxxVJKUifl/TUe8GrA7O/ln/eR99AesLvG9syyTF4yyKXjMZit2
         FHnh6xyc03hxkXosEVBLhx+bBDDArg7+uMaXzEMOoJ6J60XY8W0IQgQf4kwtkvk89rmV
         hZgnDYbFfL/5KOE700GL1OoXZJKF481QUGjoz6jUvxiS7YvjiwAN5t3m/I6vBXne86Mj
         3JQ892r8Bp8sOhyEi2/lifS4T8U72VB/DhM/bnPCUyJN9lLRE9JF+6mBmNJYxZCDyTBQ
         Z32py7wcsPXheqse31neq/34FLNr5a/8yNNSch68a8rBRr0HZKlvq6pJLm1XMvFHdc9E
         Veaw==
X-Forwarded-Encrypted: i=1; AJvYcCW5KN2poMFoLbYv4ZTPkS22OThVbi5s5Jl5coH/mjVLf4LKMXoltv5cGhMB92Ky781Gqub8TM/xD0/jgCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXDWJ4hZogYXcXYnwqP+ZuWjI+h2D7+9eXXI4J5m/VuR+mp+/X
	J2OETGhhjIqvBEw2RbELP2XbNfffemFEjb0os49ztF/LvqdGV11C8mPT6DEtSzCsnlOc85Tgivd
	O3wPz6cqTSiJStSBX383nzjWFHBJhTfOJnmf8mCVTqZ8NfbXx4vWjvs5oFcAbUXIgNuoI7gnr3P
	Il0o2YODA29t22VoZUjrQL/7XIQdoTbA9AahR1kE1EoraK9cDUB/BB
X-Gm-Gg: ASbGncuJGEYveFT95KebUCdd8Cd00cNHZ8CWFVT9dKee867xr0Ehi9RDBBFx7yjE0I5
	0EvPQMxy3XsK0KOEUGyZthyDTaDSdAHDgwSQOig5KfiqJgzYL0mtPj7eq1w/2
X-Received: by 2002:a05:6402:c4b:b0:5d3:e766:6143 with SMTP id 4fb4d7f45d1cf-5de4509b566mr1816317a12.30.1738892370708;
        Thu, 06 Feb 2025 17:39:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA1P4T7CyKNlBjCPd3feXPu3bSKDsKVxl2JRQltjEhhWAvnx988Pg7gPW3EJvoLdjd/bz9pbKIj2MWA4uYR6c=
X-Received: by 2002:a05:6402:c4b:b0:5d3:e766:6143 with SMTP id
 4fb4d7f45d1cf-5de4509b566mr1816302a12.30.1738892370367; Thu, 06 Feb 2025
 17:39:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250205231728.2527186-1-alex.williamson@redhat.com>
In-Reply-To: <20250205231728.2527186-1-alex.williamson@redhat.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 6 Feb 2025 19:39:19 -0600
X-Gm-Features: AWEUYZkVdVSE3YCdOATSd_ps38BYnjbfjtvXK9l_0oGFFYSaahc9EADcxC_JmYI
Message-ID: <CAHTA-uajC=5ou5dixDkhF-Fwibyk23vCykxwtFquCnZJW+hwvA@mail.gmail.com>
Subject: Re: [PATCH 0/5] vfio: Improve DMA mapping performance for huge pfnmaps
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, peterx@redhat.com, 
	clg@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Alex, this all looks great to me and completely eliminates the
boot time slowdown I was seeing in my tests on our DGX H100 and A100.
I also double-checked the memory mappings reported in /proc/iomem, and
everything looks consistent with how it was prior to this series on
both devices.

Reported-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Reviewed-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>
Tested-by: "Mitchell Augustin" <mitchell.augustin@canonical.com>


On Wed, Feb 5, 2025 at 5:18=E2=80=AFPM Alex Williamson
<alex.williamson@redhat.com> wrote:
>
> As GPU BAR sizes increase, the overhead of DMA mapping pfnmap ranges has
> become a significant overhead for VMs making use of device assignment.
> Not only does each mapping require upwards of a few seconds, but BARs
> are mapped in and out of the VM address space multiple times during
> guest boot.  Also factor in that multi-GPU configurations are
> increasingly commonplace and BAR sizes are continuing to increase.
> Configurations today can already be delayed minutes during guest boot.
>
> We've taken steps to make Linux a better guest by batching PCI BAR
> sizing operations[1], but it only provides and incremental improvement.
>
> This series attempts to fully address the issue by leveraging the huge
> pfnmap support added in v6.12.  When we insert pfnmaps using pud and pmd
> mappings, we can later take advantage of the knowledge of the mapping
> level page mask to iterate on the relevant mapping stride.  In the
> commonly achieved optimal case, this results in a reduction of pfn
> lookups by a factor of 256k.  For a local test system, an overhead of
> ~1s for DMA mapping a 32GB PCI BAR is reduced to sub-millisecond (8M
> page sized operations reduced to 32 pud sized operations).
>
> Please review, test, and provide feedback.  I hope that mm folks can
> ack the trivial follow_pfnmap_args update to provide the mapping level
> page mask.  Naming is hard, so any preference other than pgmask is
> welcome.  Thanks,
>
> Alex
>
> [1]https://lore.kernel.org/all/20250120182202.1878581-1-alex.williamson@r=
edhat.com/
>
>
> Alex Williamson (5):
>   vfio/type1: Catch zero from pin_user_pages_remote()
>   vfio/type1: Convert all vaddr_get_pfns() callers to use vfio_batch
>   vfio/type1: Use vfio_batch for vaddr_get_pfns()
>   mm: Provide page mask in struct follow_pfnmap_args
>   vfio/type1: Use mapping page mask for pfnmaps
>
>  drivers/vfio/vfio_iommu_type1.c | 107 ++++++++++++++++++++------------
>  include/linux/mm.h              |   2 +
>  mm/memory.c                     |   1 +
>  3 files changed, 72 insertions(+), 38 deletions(-)
>
> --
> 2.47.1
>


--
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
