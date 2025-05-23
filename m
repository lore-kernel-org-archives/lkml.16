Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3647DA8C
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 08:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747988731; cv=none; b=BX/Kp2viYSYwb3eJybPeNJ7zKVSgU9u9ZuM/VyIRnBr+D0p7DhjQmGtuhpKV+uo1xLLjOl0UpLM2JZMFqXIu6tQSnTAy6sr9V4yCf+mn/KMODfgE68U7uRiWbdbncP+Ul08JMZoj2PNSxcEzB73TRBC7eqrlb2mzuOptw15xyzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747988731; c=relaxed/simple;
	bh=syZdn22mtC9a6JaxyAM/BrgpfIFusnd2D6Ww+l7k5A0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aP5ixKrL2SGPB9xuunBYzoep6EDT54Zx6xtAT4Lc26K8nvfHmTreAPiweFUyf/XlenxrIWDg8SDykWNAP2FCF3SH8+/yx4dlL9qGKFWs1kSc9LJ0hsrUrFMHef1u8KVpGaBuXKReSuEqeMZNZt5a6jH+6xy0rg1o6rSIOIJXaKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifj7PTVa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifj7PTVa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-742caef5896so4992117b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 01:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747988729; x=1748593529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YIt+tQvqN/b+WOLsIlbdB6d57Op4QEcknN1TYeFItpA=;
        b=ifj7PTVaIyHQhlSickgHRHZ3nqXvlUB+yXjhQvN/umPoA064eWkGnXNXHmJq8whCRh
         PBQWLUoqYty2GpOYaMdA3fSSakjxvQkC1+0Z3UpkJ8zY7pb4ee3Kpu6PmUobZZB5BasV
         OGWQzoU/GIgJrmgZqyNzeQP95BN3nTAVqQH13bb0m7xiEXJG3zd56vecmBuq8qun8qV2
         5wjotSmdKhA1CFi8W0YBt3U4hrSTANh2PPEq8qbTPQTWTBycszeKeOQVneb3agTUUdUm
         zdK8IGC9lYhZYq+D+tPWOE3oean+5N5+KADn0G22IX4pyiBf3F6OiKAC4YppGQrR4rvF
         lp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747988729; x=1748593529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIt+tQvqN/b+WOLsIlbdB6d57Op4QEcknN1TYeFItpA=;
        b=OZ5CIbrWUjTNbptWhTt6/7kKwEddwu3c1SruXOkNmmgpq2c3KfytroLZ2v05bVj1o6
         kPrVUYCk+9bxn7a35q0D7FZ1vsaxvNRrknppCy/rI1L6jYnNf5IckHQKA/sg4xcM8n/M
         XwdXpTY7S4wY6pe5z/BtFPqTpyT4U9+RRzwhMRsd+u00WC5x4GbrSBeIvHJNbHltJENr
         WtE9pTKSX5r5uBY2q++i6I7dMPjySnECh9i6pSHB07X51bo/9NsJUR9T7k4skNsKhtg0
         gnyHErx4Fa7GfDdbeh2UYhzMjYkt4NHPfwRaleQPWaKHlP31uLcYFVxjj9eOqNw45q34
         z5Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUked+N3eFUEmQnejQUac06JQzGqPfNZY4zqv120UsQ1CTZLdX79X3Dm2xIGzF9eLo1z6i4s5zulTn7Hpk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgnNGjgf85nF4pb6B6LXpCnvIFSmcEeepLt8bgwPb9tnTSjW8p
	jMJZid0RHexHpqjRIEalHIuxsNh2+QFHXsBT6Kbhmg40B2PknuU1AbJY
X-Gm-Gg: ASbGncvuLSjVyoxohkg/XNrDPcBv/GMRw8qGntEC1/O2nZNGUmg72A2c+Zx4vkBPxld
	QLejNH9cbDmn5JsxKhlIUdLf+a30dh4+l1Cj12VecZsRacimYbFcmYApPFtndVwg9BDvZoXs6Yq
	w5Al8jwqCqvYPZWxk5xjf8+t6ilG1R5CBnA+HFfKu+Ic4CPancSDdDtBQVapA3hVmCpH8iuF5fT
	t844lXrrD97rYQoUlfff1ABasmY/erb0otWVt5h1zZHyFktBelcDJHjXoMXYU+jbUki6N6h2TmI
	IO+2nnkfFxlJiypkadbC1ssgGV4sRxFvhPER1wzz/iUq2WS9qOvuYa0QFYW5MwUxDkah
X-Google-Smtp-Source: AGHT+IExkp2mLsDMFw66X43a+5MBxL+Wj6GFFM5Mc2D21q6j82/DMbt7bLVlk5NMNu3vKnXP05HHjg==
X-Received: by 2002:aa7:88c8:0:b0:73e:2dc5:a93c with SMTP id d2e1a72fcca58-742a97c4fd9mr35894458b3a.11.1747988729060;
        Fri, 23 May 2025 01:25:29 -0700 (PDT)
Received: from Barrys-MBP.hub ([118.92.145.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a33c3sm12799448b3a.176.2025.05.23.01.25.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 May 2025 01:25:28 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: 21cnbao@gmail.com,
	david@redhat.com
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	bhe@redhat.com,
	chrisl@kernel.org,
	fan.ni@samsung.com,
	harry.yoo@oracle.com,
	kasong@tencent.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	riel@surriel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	schatzberg.dan@gmail.com,
	surenb@google.com,
	v-songbaohua@oppo.com,
	vbabka@suse.cz,
	yukaixiong@huawei.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH RFC] mm: make try_to_unmap_one support batched unmap for anon large folios
Date: Fri, 23 May 2025 20:25:17 +1200
Message-Id: <20250523082517.3144-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250513084620.58231-1-21cnbao@gmail.com>
References: <20250513084620.58231-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> @@ -2159,9 +2179,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> 
> 			/* See folio_try_share_anon_rmap(): clear PTE first. */
>  			if (anon_exclusive &&
> -			    folio_try_share_anon_rmap_pte(folio, subpage)) {
> -				swap_free(entry);
> -				set_pte_at(mm, address, pvmw.pte, pteval);
> +			    __folio_try_share_anon_rmap(folio, subpage, nr_pages,
> +							RMAP_LEVEL_PTE)) {


I have a question for David regarding the __folio_try_share_anon_rmap()  
function. I noticed that it only clears the Exclusive flag for the first  
subpage, even when nr_pages > 1. Shouldn't we be clearing the Exclusive  
flag for all subpages in this case? Could this be a potential bug?

Thanks
Barry
