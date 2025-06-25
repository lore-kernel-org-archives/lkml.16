Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3A829C33A
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864934; cv=none; b=D11/Cu4Xsh8cvSy58IQxGwLGsLUA/he+RZmLBBSFM4j+NVSv5VE21iN5YM2T0Czv+KeRcldl/e1udhBrN+Gb56M7H8L7ntVs/DWtXRkGYmRHhhhzZiY9tmGSv56mwOFm/8Mcmz9bhr12ugb5ilWBoUApqMIFYFwcmcWuoWNTGw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864934; c=relaxed/simple;
	bh=CkP4Zii5yEFnjEpnjpmU8yomUCDwhFbpaCZV6rMyG4o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8uhGVyoxN57jgkdk0hHgsa+cLixbCmwfgHM0/jnNKbOjlMuMeZ/WzjwxuAzwd8KpkeGkI9E36sZGer0JGZScLnsh30uO6JaYuLOGChT01HAYkNP+zLsZ7131BsIWe9a6Ph5H6/EBfgnaOLPmxhnJDRDpvaEa2qIl/Etw0d8Oug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ac74SO+b; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ac74SO+b"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4a58ef58a38so175001cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750864932; x=1751469732; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJ5P0u/6xcg1NtaqnGcLvqTOCLTnaVcDdgVW1OPXhxk=;
        b=ac74SO+bXQSpktt/NQgPXOw8n0qyYQEtL9Qu8SaqtLijnACeUk3QX0c4Gq3LLWwHvm
         873xAuPBg563ut2+95zgEXaL3KKzEkSyHZ5lTaCVLbjjRKfxjR3tmUe0Irm4cOV2cCDd
         YgRE/5pptYf23aV/5nHnJcvPg7LewX7ze+bYkygHMU0Wk+RqWB7KmJ6HPnURTXGxnLdw
         8Un0uUZ9cgAPOaRAhRkiVUpWiJc7VHhYwH5UT+qnmGBMGKAKsPIeMIYUP1vSzNTPpEu8
         ZKFrvfSTpFDTX0y2Bpn0Pc8jef0pWHerHaCbEsQS2Obg20aby8mMIWg/Jj/R5OAqpLpq
         zPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864932; x=1751469732;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJ5P0u/6xcg1NtaqnGcLvqTOCLTnaVcDdgVW1OPXhxk=;
        b=UvbmOrfLGkqTkkPUEjlFEGDTa+WxYfcvyxqcqtJ22hd6AqDZP6KRKeQLM60fO4KU8h
         cuks4W7/umBdKuT+gv2NGDmZk9XCUY2Wo9NjAQ8hR3JfB1x1zGJtrqt4W2e+ofbumhR6
         sUQqUJuZkequonF0hQpwV/mN+buzrnj0T/nQJjj3R7toFNZidE4xRSgtuKmt7cdAmLQY
         p6ZzNJ2ZjnKmlxZCOydxF4R+qx+PjuT+vfA/VGCINQBs2mdwwaiJjP1wijhOIVq7QXgS
         R0K0RSjlAfcpppUNZPnEd4eBolK2D1hPBhQJdx9DO1rMBjTLovoFmc0XBXC6UnOCTKCU
         rVlw==
X-Forwarded-Encrypted: i=1; AJvYcCUCx5h2GSJNlXYLgjriupDf0oTiqJH5H3+Rd4YGiVbmdxybsqNKPpRH/lpZXV74tqpk7DfBKRgSOAJ2s8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YznEb2xaDRhGVP8IphhLeh9X142S45lZlHIRpqFMBbJjiHijt02
	DvaipDypd3BwFIKkTHR+vPTngkflOimqahXgaKMLft8+/h0qJPeiYgv2gacpSu1oxhMNrhChMzc
	mA3z+v8YuXqIvl4GQVgy/Vs4Zp9gEeShF3bMRpHjf
X-Gm-Gg: ASbGncuWndF4P3A8+jEUls03WpV9IvNwZ8vt9NGNkKSqxj7KtL8iC72XTqNh3xkW/TP
	UH9B8lgkhMhnSuPlhjBoaI0ZYyIyk62ncFQAKFPCPZTMatYF2C0JWzOjdlE9u3v++ydgCS55va4
	f5NrmMVCitDiwpenjCGyw7XDYXo54eFOIBVg9F/RHBCg==
X-Google-Smtp-Source: AGHT+IG8U6qG5KYMo+nkavpDTx/PPdha23r+RnimIC8ktx5xvsAvgguafO1U53hsdch5/27popiTWWkJKAGkT/NKfVc=
X-Received: by 2002:a05:622a:85:b0:4a6:f9d2:b547 with SMTP id
 d75a77b69052e-4a7c236b037mr3595081cf.20.1750864931337; Wed, 25 Jun 2025
 08:22:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624193359.3865351-1-surenb@google.com> <20250624193359.3865351-7-surenb@google.com>
 <fd305c41-b2a3-4f0c-a64d-6e2358859529@lucifer.local>
In-Reply-To: <fd305c41-b2a3-4f0c-a64d-6e2358859529@lucifer.local>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 25 Jun 2025 08:22:00 -0700
X-Gm-Features: Ac12FXxttU6uD8NTsD-TnCGNT9pqqB3547DZqQ19Bc1hh7qCrrhXbmy4EDhP4xU
Message-ID: <CAJuCfpEpshf7L-Axt4MJf=onoz4F=Sw4nk5Z1yVwvwkzSYx9qA@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] mm/maps: read proc/pid/maps under per-vma lock
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	tjmercier@google.com, kaleshsingh@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 5:30=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> This patch results in some spam :) there's a stray mmap_assert_locked() i=
n
> anon_vma_name() that triggers constantly.

Ah, damn! This was triggered before and I completely forgot to fix it.
Thanks for reporting it!

>
> Andrew - I attach a fix-patch for this, could you apply as at least a tem=
porary
> fix? As mm-new is broken at the moment with this patch.

Yes please.Andrew, if you would prefer me to respin the series please
let me know.

>
> Suren - could you check and obviously suggest something more sensible if =
you
> feel this isn't right.

This is exactly what I was planning to do but it slipped from my mind.

>
> I'm not actually sure if we'd always have the VMA read lock here, maybe w=
e need
> an 'assert mmap lock or vma lock' predicate?

For now this is the only place that needs it. Maybe we can wait until
there is more demand for it?

>
> Worth auditing other mmap lock asserts that might have been missed with t=
his
> change also.

I'll go over it once more but this was the only reported issue with
the previous version.
Thanks,
Suren.

>
> Cheers, Lorenzo
>
> ----8<----
> From 1ed3bd12d43be1f8303fd6b7b714f5ef7e60728a Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Wed, 25 Jun 2025 13:28:36 +0100
> Subject: [PATCH] mm/madvise: fixup stray mmap lock assert in anon_vma_nam=
e()
>
> anon_vma_name() is being called under VMA lock, but is assert mmap lock w=
hich
> won't necessarily be held.
>
> This results in the kernel spamming warnings about this on startup.
>
> Replace this with an open-coded 'mmap or VMA lock' assert to resolve.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Acked-by: Suren Baghdasaryan <surenb@google.com>

> ---
>  mm/madvise.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index c467ee42596f..0530d033b3dd 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -108,7 +108,8 @@ void anon_vma_name_free(struct kref *kref)
>
>  struct anon_vma_name *anon_vma_name(struct vm_area_struct *vma)
>  {
> -       mmap_assert_locked(vma->vm_mm);
> +       if (!rwsem_is_locked(&vma->vm_mm->mmap_lock))
> +               vma_assert_locked(vma);
>
>         return vma->anon_name;
>  }
> --
> 2.50.0
