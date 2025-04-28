Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F1C297A41
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870726; cv=none; b=oy0R9yNNEC4tOJdm7bkfplBtvkGqPoaWNaGYeEsDmJCUwkwKx3JXsyhLEt59q+mV+rmJVSstCWTl1K+j7r+acxliczm5wTHnBifNW+xEcIJu/nOstYf1+XgpV9517/WnbANVlQqgvKhAAjrUjvwTfPnQRgUDO1qLJvuAvNfN7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870726; c=relaxed/simple;
	bh=BGGQziuv/lYVsW0mk/PAsB01Cz1s9yFETH2cvNVISOA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VckFZS0Xsafd8n9tYr3m+5L7ur12HKOBKssWjpH7v7LVfVLbk/zW7f5DwGc17wF306gxbLEjgs3vx/5MJWQ6aGp9L/nDGOJBXYE9Xp1ZoIaHCYmu9HMmUWjSvzGfP7HP8NhyycgzW0F0bybGZSAJ/ng+GTz3C3qmr9UPoC27UlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1kRzmbm; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1kRzmbm"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c336fcdaaso62407735ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745870724; x=1746475524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxyrDhE8jmQtvHV6PswKMRFgs02pHatPr/gPH7+1bK0=;
        b=g1kRzmbmv9q/8Ct4lg9Ol5plGCXTzsB+l+e2c2YSs9CtWmwtl4a/jXvmGUWwi/eg7/
         LOUXyiQSg+QdHdGJtXdDmNPbx5A22+dmKBiDf5ytA9GqE7VsUf7eFlLNkeuwIFfGoxs6
         PupbeV1WJZUWO7J3vPKQPYQ+Onpebk2zzg44wT3Aac4VRD+bPtXZcN+2U9tRl2TJi9VT
         aAsUJ0j5eShEV8w2CF0Ld7vY+ea8fS5HMI2zdPF9vcyeeCUqkcjPtytNHou6O7gwMxtS
         7fq2YKN54yOikpNVQb6xMS/oGXi/KiTIXACc1sEXDhzDBfWucvqv4QxF/ma+aypFN38i
         rbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745870724; x=1746475524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxyrDhE8jmQtvHV6PswKMRFgs02pHatPr/gPH7+1bK0=;
        b=hRuS/cTKnkgU6tNJgu7LBL0HghPKuqXL1tHwZikMZ8Qup+ePGed3k611j1Nh+JnWzu
         m9Yl5HJXkK2f++QjypUT11FowL8dEcC5UQ3Ork6RMfz/gZKckIU00RFGHam61guDtFG9
         AdqFvtQxtkc8Xwz4Xq1+aEMemfNdlUXDnrjKK7WMa9eWTlukUoKTs/S6dplSkg3zVX70
         r+JblZfveiFf3hSzHjIbdUgmj/7KpBfX66bR7YujD1B0Zoa5eFTtvSRppoWWNnE0qLrG
         EiioeWwjRwXTMrZPeVm9rWThjQ4XzdhaVsX05ezn9mHuriVxYF1DAHFMKCBLxLx6HFID
         kVog==
X-Forwarded-Encrypted: i=1; AJvYcCX+gKySXRNucBSM5Ek35RUosYp1rSOb5E6TJQKMFF5MQ74ZK0ATiLF0fOW1uz1tFapltLH/+xms5ewdYoc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd3ZP2ONyjFeKrZPqF1JEmhzlpLtxnYoo8dbHhxAsz447jyk9c
	gPrxnNzx4nUPxGSoj8qiRkEnVa91h/DmLEI5yxuYhf3DLQUNBo+c
X-Gm-Gg: ASbGncsG0p38axjpoYXO+U+birizdOEi27lOG8ZI0Cz3hBdtetcZU36fvJd09DouGFT
	8RvB+ima6X6gGU9v5Te4P07b9STb+GStSWmSQzugR0OsKTZgNq+9LB3iPRsOWOZVX36Ty6D1TAJ
	WwbHwgDyE15+L5PhDBE4T3BgNSYdiMsaRRd5lck2lWcb6VQ/ikW1kpU0D49b9AWsVVfOs5PL4sc
	ktcNlX7+KGT4tGWyFTflYG5hny4KLDCEDjndlp9o3xh2JBXiWmEdNe9sjwGalqjqro/1ylsw8PC
	jrlJ5Db8IIOp/HF6KvJYOY15DGN5sOiU5HQrgFTuIw==
X-Google-Smtp-Source: AGHT+IH1y922T1WGx9eO/AaDQqOJysDoIdHH2z29azrS/HLMzdIB+Jga9P8fDo7rV9Sdq9L2x+WzSQ==
X-Received: by 2002:a17:902:f60a:b0:226:30f6:1639 with SMTP id d9443c01a7336-22de60a3e8amr11608115ad.51.1745870723558;
        Mon, 28 Apr 2025 13:05:23 -0700 (PDT)
Received: from pop-os.. ([177.21.143.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbd432sm87683855ad.90.2025.04.28.13.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:05:23 -0700 (PDT)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: surenb@google.com
Cc: akpm@linux-foundation.org,
	andreyknvl@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	pasha.tatashin@soleen.com,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH V2] mm: alloc_tag: change the KASAN_TAG_WIDTH for HW_TAGS
Date: Mon, 28 Apr 2025 17:05:17 -0300
Message-Id: <20250428200517.4956-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJuCfpHngGX3doDEZOCSqh0sT25q6kNutr_NO6kV0pKZNWviLg@mail.gmail.com>
References: <CAJuCfpHngGX3doDEZOCSqh0sT25q6kNutr_NO6kV0pKZNWviLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Suren Baghdasaryan <surenb@google.com> wrote: 
> The title lists "alloc_tag" but the change does not directly relate to
> allocation tags. I think it should be page-flags-layout.h instead.
Okay, so, I will send a v3 with commit prefix "mm: page-flags-layout.h:"

Thanks.
