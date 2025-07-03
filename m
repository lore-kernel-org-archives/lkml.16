Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713DF272E4A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 04:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515492; cv=none; b=hdrIQ6h8Wn+HTGZObIZPYY7dJC/3R6CKs79W5t0WWQ5uijqZOSJwS/c272ct7UoDoRSj72NupOJRaAvDKtBeXL7jwuU2g08GKgy61pXcL7NNM2+4UzAw3Vm26UxdvYppZ/0o1UtNUu+yLedrKzpae5fVrYSBttFd4RlAs5o1oew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515492; c=relaxed/simple;
	bh=/FRMU1xCUofCWVy1mC6P0DJD9BtBCn/Ab0qtfEao55k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fHZml4vUdPCSKxli+PyPS08B+/vEPsr7q1x75YXWvPeIp26DwjUyYpcStR83qAK4BvLpXB8N2O2/i8yV0ehb91vewMHrzjyppbK46cWVmIAVC1nnADnzVn4N2ELUiXsdZtizlVyRfLGJysFscAYHbIsFVF+nwh7D+Y7GLF1gMcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=HI8wjHCS; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="HI8wjHCS"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742c7a52e97so7325017b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 21:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751515490; x=1752120290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mWLSE5Y1SoCeLYyPe3awNFueV3rdom+AkC7cd4jy6c=;
        b=HI8wjHCSg71CzE7nL+KF9YPUIsD1CtBXsinF0o+0KXhsBB9bXoMbZ8xNLW3ybjbg4w
         uOFtujfFQO2fjDcSEYZt4hH512AmSVao0osJrNHRlFjnoxWuluSTYRZVL1tMrEDMn58J
         GX62KlKrO/zPvGci8mDU4I8Vw4iA0ZHsucQ3m0h5NCyqNV5kWJ49N2dt3zBGNOmSKRUN
         e6ddGLXoIVDU0rxMbDcF+clJ1viWPnqg94kz1JzwFxfpc8guf2f2oR9Ocr6ATeL8g1Ax
         6ykoGMwMGbl4e/yT4SMOKKeSuM8DioiJ41+QeQp0/wnsPbuvJ4fxK394kAjOxkMBA+5V
         IMFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751515490; x=1752120290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3mWLSE5Y1SoCeLYyPe3awNFueV3rdom+AkC7cd4jy6c=;
        b=OIoM4nRSU3udidd4vANm3dlMGHEpEZabjBCZayZqcBerpvg+KcjjBVlbfc1Rp99oX8
         hxLTRojVy6eESyct+PRVfbTJtpjqqpCbKo7X6zuU+Bdqb7uegjGtppFB/cwO3w2uNvUQ
         +QSSY/FXTWLfNiKDO3lYUbM6j2JpVq7SvbJG2IG4oi+zYm8PFfMwieH+JejXju+gjDR/
         V24FcKNyXVj5Lq86wgItfs04QjF7IeNTVeO98/VwvOXGZ0TiKEzQXZXcT3KOPHwgbJ30
         QdljtCYRiw/s9P9OmZrAUEmnJgnZBsizKRUT+QQMd8lpwDMIlWNfS/qgRD0fo3aEv6ll
         yiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi1mI1M6bKktbyYU0OuDdfKDygIcuqJuqZFZZW2eyNZ/1AxNRrsk+kZs54mIYhiICKWq+sZa/t9jPY3PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywokl4BEX/Eq7Cvz4LXAUdJaSKaLeqjn96pg6O5ftTtZdJnuNSY
	0WBUCp6U3IQe+9UZIYbFKWcRvMgEFG/Hq0ptzt0LR26rqHOM0vNtAcCpmeE/ziW6B7I=
X-Gm-Gg: ASbGnctYMuK+hmOEOo6ZeT5cU9Wa4Jb3dXzWluqBQyv3wsu4clXxf6WpT2MmYAdeYYi
	A6Hb+pJnGqQw+OukUNhTLta8/fEM+aaoC/8xRYlylNgDx3OffGWt6qDdBK0raIjQAfAE7UqobmU
	+gyCX+KjaS9+lvdnEfZdLQNpdgQez2iUxCx+9+DH3QlHEVjgwd0Pd931JDvODNqfjD39RT5z+ob
	660B6ac7MvDbbwLPfnyYRVpN8OIgEvYn9tqa+xI5SkhW/OGLAqfXHQ+PF93KaWPso4zedhU+Yy3
	0p10IG/TRKV+5rxGzGiqjK2+YJN9TOHjwOgW2HU+zHZIrcheR2ZK2XmILQL3dgYhEBkqpk7RKTu
	ThRr3PTisRnj+W5t9hORaT/s=
X-Google-Smtp-Source: AGHT+IGSsvWC8ZxvQcZYIXYUuXnmAP195Px/lHFliWsXc1Vp1+S8zPZWZQ5hbU9Kz2VMpnRlsvbFkg==
X-Received: by 2002:a05:6a00:399d:b0:748:e4af:9c54 with SMTP id d2e1a72fcca58-74c99821e50mr2396962b3a.6.1751515489639;
        Wed, 02 Jul 2025 21:04:49 -0700 (PDT)
Received: from localhost.localdomain ([203.208.189.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557441asm16842969b3a.95.2025.07.02.21.04.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 02 Jul 2025 21:04:49 -0700 (PDT)
From: lizhe.67@bytedance.com
To: jgg@nvidia.com
Cc: alex.williamson@redhat.com,
	david@redhat.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lizhe.67@bytedance.com,
	peterx@redhat.com
Subject: Re: [PATCH 0/4] vfio/type1: optimize vfio_pin_pages_remote() and vfio_unpin_pages_remote() for large folio
Date: Thu,  3 Jul 2025 12:04:43 +0800
Message-ID: <20250703040443.36566-1-lizhe.67@bytedance.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702124756.GE1051729@nvidia.com>
References: <20250702124756.GE1051729@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> On Wed, 2 Jul 2025 09:47:56 -0300, jgg@nvidia.com wrote:
> 
> On Wed, Jul 02, 2025 at 11:57:08AM +0200, David Hildenbrand wrote:
> > On 02.07.25 11:38, lizhe.67@bytedance.com wrote:
> > > On Wed, 2 Jul 2025 10:15:29 +0200, david@redhat.com wrote:
> > > 
> > > > Jason mentioned in reply to the other series that, ideally, vfio
> > > > shouldn't be messing with folios at all.
> > > > 
> > > > While we now do that on the unpin side, we still do it at the pin side.
> > > 
> > > Yes.
> > > 
> > > > Which makes me wonder if we can avoid folios in patch #1 in
> > > > contig_pages(), and simply collect pages that correspond to consecutive
> > > > PFNs.
> > > 
> > > In my opinion, comparing whether the pfns of two pages are contiguous
> > > is relatively inefficient. Using folios might be a more efficient
> > > solution.
> > 
> > 	buffer[i + 1] == nth_page(buffer[i], 1)
> >
> > Is extremely efficient, except on
> 
> sg_alloc_append_table_from_pages() is using the
> 
>                 next_pfn = (sg_phys(sgt_append->prv) + prv_len) / PAGE_SIZE;
>                         last_pg = pfn_to_page(next_pfn - 1);
> 
> Approach to evaluate contiguity.
> 
> iommufd is also using very similar in batch_from_pages():
> 
>                 if (!batch_add_pfn(batch, page_to_pfn(*pages)))

I'm not particularly familiar with this section of the code, so I
can't say for certain. Regarding the two locations mentioned earlier,
if it's possible to determine the contiguity of physical memory by
passing in an array of page pointers, then we could adopt the
approach suggested by David. I've made a preliminary implementation
here[1]. Is that helper function okay with you?

> So we should not be trying to optimize this only in VFIO, I would drop
> that from this series.
> 
> If it can be optimized we should try to have some kind of generic
> helper for building a physical contiguous range from a struct page
> list.

Thanks,
Zhe

[1]: https://lore.kernel.org/all/20250703035425.36124-1-lizhe.67@bytedance.com/
