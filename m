Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534F1FF1D8
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 22:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746225989; cv=none; b=piW2Wu5kNOOgPbE94gGmy+I1nUEHp4utNQDg4NgLg3eMg4ClngSo1tKucTl5TID0SmfMw4p6WxLgWS8lWWQx9cdGq0rpvknKOgZ5806KVTgmH9ZeclInU5KSzhvXiokObWVo+yjLU0y68zmM7nVmE6swDQzDZzUW7X+is6J/kEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746225989; c=relaxed/simple;
	bh=MohwM7fVbor2Vyoh5g3MSChXrAJLw55GPUSBDMuPcGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfUxGy+IRbW+XJD9usYQ8RvGrGbIXMm6gLyNkjRlR5gCPzCX8D2W8ToYwjLfzGL6sIFPu0SmimfG+HkYuGY4Tq5eqNO4+CToRTbKhomRInMFU8NLnscQOUZRSjhtGz3JuxZtKZrYpsqAT/5jEY+O7SQpI8UFN1+GqtJVZPfevHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VdaIQ9o0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VdaIQ9o0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746225986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HBpwNFNUcKXm2mDG6MpS+gQbwBietEpngWQL4+w2ZxM=;
	b=VdaIQ9o0muyb3kx84nhRREkINiCtdPkYpFSqR/mUSKEnv0Os08JhfjQHEEgiCLE8eFPeOO
	oJN8i+Ib0aw9RWLw6xYLHu2pbqqZvgRmGyBx4xvTK5Gui4Kb9uUlcvpmeiZl5Z+nEavyQs
	aqvnMabT8vtNUC6lHBzMxVqYfvV+/gg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-MuE9_rvZMwKkD5BpHaRKRA-1; Fri, 02 May 2025 18:46:24 -0400
X-MC-Unique: MuE9_rvZMwKkD5BpHaRKRA-1
X-Mimecast-MFC-AGG-ID: MuE9_rvZMwKkD5BpHaRKRA_1746225984
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768656f608so52484461cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 15:46:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746225984; x=1746830784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBpwNFNUcKXm2mDG6MpS+gQbwBietEpngWQL4+w2ZxM=;
        b=DAwqAp2FxT/kC4GtCOa8nAqzkieZDbYQbbEbiDMttMzGa2uXQwGfW7+DdXTHpbD7nz
         9hXyUvT3EKMNfFFCgyaVQNjwZCJSspwhuB6QwCjKf+EjVzI0TfX3dLLI8RkagVyJQWnY
         ZXhEiGSzH+rjKCFhhWtT43tbxUpPbEu/W1/PTUP3Nu90bOYqbW2M67MKiqUZTX1LXKsO
         GcUm37ukEWazZnFtqwIZPMtH+CESTkRhz2FucQtbTuuwzTGC9BDvzCjiqz+Q8B8O19U3
         V4nBZPvzWXDfn8mR0+9aFUVICaEDy8IcvFxeWTtqHCOLtesk9v8H5yHDj7Zgls3ZQoGp
         JiSw==
X-Forwarded-Encrypted: i=1; AJvYcCUBIaCT16RCedh4NSnZXznQpyjANi1C0GnYhmc5GXxcJhebwxZhzP0CqTpJUOLeAV5Rzl9VELcCw/c8Niw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYiqqrVk+BZdoZeCXzJK32wLEmTFS3XEj+4lt4Y9Loj4qyX+8
	7h14YyxL554bqPj5MCHWPuBQS2M6pZZsKA/3jdGUp0MOKDi9PWuQH1p+LXVHlZjD6Cnkg9EVGvf
	lGuzncaUJuXtFylNYfEEVvLiqSu5788MtCxPstgFxJIJZFxaKUsSspkEtSs22ww==
X-Gm-Gg: ASbGnctYg8d+Km7XkLilU+VefNf+KOQZypIBWXN9GaTAN05ARTrIXAlrjXRZYpE+akH
	PhJKNSEXRIdEVRuKVGS24KxlRaXwgU9rkHpVWs5lFdZfmSg2xAc0coZQsZHy76omg3WEt9O39Pa
	J6Qs7TIUitySri4EjNRKUAehFa10pWCzamFmXckgPzYv/QcDglileViIg++H/m+Huic7qC7fmEW
	Ax7O4dVVLQsHWibKUWV5K7QcgrYCvyH09mIalHBr19dT2RMj1fE8xPdNvcNZTkBfaJYXFiBUm8Z
	E4A=
X-Received: by 2002:a05:622a:5908:b0:47a:e63b:ec60 with SMTP id d75a77b69052e-48c31c182d3mr79854231cf.27.1746225984214;
        Fri, 02 May 2025 15:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUFR3XpnaIDy4pwFEqipRCtx1dBpoUtjuA3Eh3W7Ph6JfUfxzzQ94OxMVeRO2kYgTbY3OQoA==
X-Received: by 2002:a05:622a:5908:b0:47a:e63b:ec60 with SMTP id d75a77b69052e-48c31c182d3mr79854051cf.27.1746225983976;
        Fri, 02 May 2025 15:46:23 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-48b966d7907sm24561601cf.30.2025.05.02.15.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 15:46:23 -0700 (PDT)
Date: Fri, 2 May 2025 18:46:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adolfo <adolfotregosa@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: Align huge faults to order
Message-ID: <aBVLPAJVbyIrFjLS@x1.local>
References: <20250502224035.3183451-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502224035.3183451-1-alex.williamson@redhat.com>

On Fri, May 02, 2025 at 04:40:31PM -0600, Alex Williamson wrote:
> The vfio-pci huge_fault handler doesn't make any attempt to insert a
> mapping containing the faulting address, it only inserts mappings if the
> faulting address and resulting pfn are aligned.  This works in a lot of
> cases, particularly in conjunction with QEMU where DMA mappings linearly
> fault the mmap.  However, there are configurations where we don't get
> that linear faulting and pages are faulted on-demand.
> 
> The scenario reported in the bug below is such a case, where the physical
> address width of the CPU is greater than that of the IOMMU, resulting in a
> VM where guest firmware has mapped device MMIO beyond the address width of
> the IOMMU.  In this configuration, the MMIO is faulted on demand and
> tracing indicates that occasionally the faults generate a VM_FAULT_OOM.
> Given the use case, this results in a "error: kvm run failed Bad address",
> killing the VM.
> 
> The host is not under memory pressure in this test, therefore it's
> suspected that VM_FAULT_OOM is actually the result of a NULL return from
> __pte_offset_map_lock() in the get_locked_pte() path from insert_pfn().
> This suggests a potential race inserting a pte concurrent to a pmd, and
> maybe indicates some deficiency in the mm layer properly handling such a
> case.
> 
> Nevertheless, Peter noted the inconsistency of vfio-pci's huge_fault
> handler where our mapping granularity depends on the alignment of the
> faulting address relative to the order rather than aligning the faulting
> address to the order to more consistently insert huge mappings.  This
> change not only uses the page tables more consistently and efficiently, but
> as any fault to an aligned page results in the same mapping, the race
> condition suspected in the VM_FAULT_OOM is avoided.
> 
> Reported-by: Adolfo <adolfotregosa@gmail.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=220057
> Fixes: 09dfc8a5f2ce ("vfio/pci: Fallback huge faults for unaligned pfn")
> Cc: stable@vger.kernel.org
> Tested-by: Adolfo <adolfotregosa@gmail.com>
> Co-developed-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

