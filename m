Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FBA246BA5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751449113; cv=none; b=O+wQPALmS7SIC9zQWhgW436T7Vp8DifeV33jUnrYq8YTpRt5LQDT60vUDhBaagfFAc9FLI58kqTSixjvE6SHkljtuvDPfNMN90ZuXrRjV6rlNIIkdnQvQ5rNcirLk7wXl7AoKjlQZyfJI49hhv9v55QsMXiNOyDDbcGQVtRQjPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751449113; c=relaxed/simple;
	bh=m2wyl7kz+6uvmmXfe8oX2ix01eADdAyzpV7Qj2FgNzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IhPyEBlSajYpgmIZ2Qu5Ch1wDXAF5+PZjhJ5yJpDLiX/YQTv9Sj3HAZVTjNBZro5BEmTJuei2VSLRhjYmfIic1d4G/3Lzs+4mzZf3qZW9ZGJcrIp9PlUAATq4RpW67pK9wz76EhwVCK//Tjvj5aLX23CI3rdKfZqNs07AAubUK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Cwh40Ej9; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Cwh40Ej9"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e92cso5005479b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751449111; x=1752053911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTjwaEFPERHrYF9Gap7nfZ/7bPQeZGoi21gGb1ngn+I=;
        b=Cwh40Ej9k08gi71cELpAAEsOkellRirr9wJIZzKHIIc+7VVjX3TXyDqCDgsYhkGUPE
         dnsTZJ8+Hhkyd0IXdthsbIcSW3hvX6C0f7Ow4rKSaKL0YnenOHsJXGCNAKVcL4QLtX4G
         aX/G6W7iKSRjOvwlGlq3Ds16wKcerKR6TSgzSBBCdUAJqdwRM/flnEl9tdTDPMbD/IPY
         x/w9kO+XTAqp1xFDFSicgcZayrjJY5p9GnqO5wMlgYai5isSLgiVyZSHH1qbCuXbcNr/
         iPXmviFWHN4OXGC0LenyMOGPKF+fIxIa91Vb+pm3pE75YQhDlpoe+8ymHZ+o++ar0hgG
         QTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751449111; x=1752053911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTjwaEFPERHrYF9Gap7nfZ/7bPQeZGoi21gGb1ngn+I=;
        b=foYlLINCclVz275MutkmtgHHReo7PBPJ62iLr/MqmBjJDF5zu3GUFBHm6g0foWr6iV
         LvAXeN00Tw3VAy7lUMAQBZPY85e/kZ3kSKRX9kpB37olpLHUbNdmfUow2pE629FI2avb
         ZNYCEH0g/THEO++kccAaxl6/uezW58p8WCEceRhKamuiETyTCFXveTv6G6qIQmQi6ZI6
         R3F+D7DpdDlMPqzUDjE98a+3YZKGHJN34yb0cHvn4GSx05/ipotom84OH7/6GYs76012
         IcUYlySxSneyiSWejAsKmDn1mpNYgoguWYZ1h2E/rI4JhMvk6/E3f29UCybraPyBi/U0
         flpA==
X-Forwarded-Encrypted: i=1; AJvYcCUd4U1Sd9nqZBCpvCuUQSSxrV272hzE+hqM7TO8xVcBNQPBTt/LAJqYWb5EWE4FPqSzT5Bs1cnX7Tdfe8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMOJjMWqXg7T2QXtNuAjAVkgfEbtYkz0Sv2YfFFEK9imaU0Rj
	J3JFUjbqjJDMCeaPf/qP1CJg3go29jR4T3LWHsjI0HB4OdC82Cg10pM7DjKvNwuLMVo=
X-Gm-Gg: ASbGncuIzyZYet+5P24ZLS4udAR1CbfTlCcJD1V+IQHOWXIjsSZzEv2kykwTrPOhP/R
	Dp1dLw+LYDHHJ/8HcvfYphoEWdw2DLW6vwnGZiO/cMlsiF36DliPiFyvrlWTt9w/HX7VlAv3ZGd
	Yjn3FF/dLZgrghXxUp4N1heSe8l/Rjbi0v+DXci5lUAFZXFBtatiGDwZH+a4z31gblDZ7l7mGom
	ChU6n9tt1bc2SRTonBIbNvrV7IrNLyyH0FgVZyGCAg256OGMR29Ny/LCn4BD+T59F2MvIvfySIj
	THswjIc3rBeBuiOAelBKI1RQ7ScUqQ7poADtRA+/alIOZPp+rdcJTcc3dUr2XXXK9LDzaqFIaVN
	BQ9diUPHLRlbncg==
X-Google-Smtp-Source: AGHT+IGUO3B6nRDUzdmIQ2oO+7AEV740xR2OLJFkN6pT/Dska04jgo/ItMW9V4JJBw44CxgrOpO0sA==
X-Received: by 2002:a05:6a00:2eaa:b0:740:9d7c:aeb9 with SMTP id d2e1a72fcca58-74b512bf44emr3128818b3a.21.1751449111276;
        Wed, 02 Jul 2025 02:38:31 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557439csm13901447b3a.80.2025.07.02.02.38.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 02:38:30 -0700 (PDT)
From: lizhe.67@bytedance.com
To: david@redhat.com
Cc: alex.williamson@redhat.com,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Wed,  2 Jul 2025 17:38:24 +0800
Message-ID: <20250702093824.78538-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <6508ccf7-5ce0-4274-9afb-a41bf192d81b@redhat.com>
References: <6508ccf7-5ce0-4274-9afb-a41bf192d81b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Jul 2025 10:15:29 +0200, david@redhat.com wrote:

> Jason mentioned in reply to the other series that, ideally, vfio 
> shouldn't be messing with folios at all.
>
> While we now do that on the unpin side, we still do it at the pin side.

Yes.

> Which makes me wonder if we can avoid folios in patch #1 in 
> contig_pages(), and simply collect pages that correspond to consecutive 
> PFNs.

In my opinion, comparing whether the pfns of two pages are contiguous
is relatively inefficient. Using folios might be a more efficient
solution.

Given that 'page' is already in use within vfio, it seems that adopting
'folio' wouldn't be particularly troublesome? If you have any better
suggestions, I sincerely hope you would share them with me.

> What was the reason again, that contig_pages() would not exceed a single 
> folio?

Regarding this issue, I think Alex and I are on the same page[1]. For a
folio, all of its pages have the same invalid or reserved state. In
the function vfio_pin_pages_remote(), we need to ensure that the state
is the same as the previous pfn (through variable 'rsvd' and function
is_invalid_reserved_pfn()). Therefore, we do not want the return value
of contig_pages() to exceed a single folio.

Thanks,
Zhe

[1]: https://lore.kernel.org/all/20250613081613.0bef3d39.alex.williamson@redhat.com/
