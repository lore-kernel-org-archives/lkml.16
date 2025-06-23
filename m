Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AE6C2FA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 03:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750650026; cv=none; b=HM0bKBr8DhFDEK4poWaRaHW1A9yz9by60VmwJCQHjhmv+1tL5yQT/x92+pkDdBSH2/XAS+f+jXgOyQseSuATUT7broMJRG5j0xkZWhcuSfMM9pjcxeGMFy3+Mn3pNh+E9V0n/USkeDxf9Zm8SiWLPwLC4OTBz3fdU+vgt+IPuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750650026; c=relaxed/simple;
	bh=yDoF03TxQWhSAvbPkAwLLDT/B+stLK/or3RHqbQBhRM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OuVH38XDEJAlC6HL/fGa07EOX8xesVY79SHjgRk/xFpAQocFvEGQrBPUoM7MfYaQnO7h+wRkD+12YfyR2xFkrmzOVwCG9qZ2lS0Drvk2mSZn/73m7Q8BJY0GbbTW+5EzWKRNgDuQ1+1EKfviqsGYfkiQZ8jRGVNhao9/NdfFSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+35QUL+; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+35QUL+"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32ade3723adso43525051fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 20:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750650022; x=1751254822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDoF03TxQWhSAvbPkAwLLDT/B+stLK/or3RHqbQBhRM=;
        b=E+35QUL+VXmPM73JMdFIsyYg/kJ7XFqmreko7L4QNVDSAbHnjgbBNBS/0TaW/m+gVk
         SZG+ur0I6B6hC5tbsQ39420QgefpgPu2s6v/AUH7BdHaBd/81xHH1QQHtApYJ9G9HU/L
         S3bG+JJHduL25DWL+tKCCjGuSNH5tb5QaXqVpiQ8V7EOO98kqWy2bDB4UlooSWT6isNX
         T/Ibjriny3GEBoc4e6CMJuyjifw84pWovd9MpEiwN/RbqTFdVewmilzdqdFXszrJhxEp
         yzSbefI3512kA6d/jOLXDjDfDYSlFAgP4F+PamnTnXgc96L0tCoABCR6V7i0aBibVlFD
         0p2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750650022; x=1751254822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDoF03TxQWhSAvbPkAwLLDT/B+stLK/or3RHqbQBhRM=;
        b=upE0tqOZDTTzGkxesrSEYaoZvTG84r0xNoQvRIFsRifluVVkZogbQMPOFVUcgGxoXj
         TIPaXUO5vfDF5g24xl2HMUdEQr4+xPfn/OgedGruijBEt+5q03W46mE2tTIJNHA6VOny
         J6xFKsyKbimCJyavmSrq9yPbw2gC8KEsq2KRdoKMCHVhEQmcj+zFMQtAcRiBI4FQyAmn
         BaUX0+jAsMx7QBrZnfl7rlMhDQnhGnVQOtQrfMZ1wwku9X4EVaRlii0ga6INwvptLqfr
         hRQuU7RjpI/T98zQKpC+Le3DlEEJ/UtTa8NjQLwns3oYqRyyC533ZQNaxVDez5UDbE/e
         ZtUg==
X-Forwarded-Encrypted: i=1; AJvYcCXIhAO3cPZ29ePVE4hhtMb7S74rPXne2eriQcmJgq04/+Bwo8UduwmCCzR4RoAlbsv5JBy4W+8rEo1M9zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYNjXZNu3U+OK6DwyOQ0PR3hmP5aiF3tcmRrYkNZbuvGAltK9h
	NHhKVYSbGf/4F1vYJpj4QrWvpfv6Looat90kJxTuYqlZADVsE1SzleIPqZagMYDZyw6swbiXe0c
	Q7vJZe9PanPXlWuyNkOmPD4G4NnZl2i1I1WdfMow=
X-Gm-Gg: ASbGncvxdEiRg7J4GmNCeNCKu2jQkrm8Aa2s0sZrOXEiqlnS/e5nAuw7vWuYZP/vrTk
	dFoqHM0Rxs9OdZt2KFILeulED8N51tMH6uL79uZK2HBGu5iZjHN883WrsRWbyCT7i+y5assUZHV
	baHmG+b2dH/+GpjzWJAE2jvSMWo1rFPMhrXAAmiNHfCFCu8TeecGGfgw==
X-Google-Smtp-Source: AGHT+IFzu9XeDSJkp18AF54E2jAv5YoPqCFuBJ9XhvTtkEz/nvJAl0XG32h0L6kafuyNKUPhrahczosykAa/BQw8BeA=
X-Received: by 2002:a05:651c:514:b0:32b:72c8:9a6d with SMTP id
 38308e7fff4ca-32b98e5d447mr19622141fa.7.1750650022129; Sun, 22 Jun 2025
 20:40:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619175538.15799-1-ryncsn@gmail.com> <20250619175538.15799-4-ryncsn@gmail.com>
 <e7b6b4bd-5294-4fe9-bcc6-225013e7828c@linux.alibaba.com>
In-Reply-To: <e7b6b4bd-5294-4fe9-bcc6-225013e7828c@linux.alibaba.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 23 Jun 2025 11:39:44 +0800
X-Gm-Features: AX0GCFv3l5trMOnOMcrNf1BGLJQO46hGJCwwfEzTCxFRGb_QjfFdFC5DBQ-f3G8
Message-ID: <CAMgjq7ARvaHqxcyO+wFPJ8RtTCdHoc95FnWjWdDywLGyYDq+WA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm/shmem, swap: improve mthp swapin process
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:37=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Hi Kairui,
>
> On 2025/6/20 01:55, Kairui Song wrote:
> > From: Kairui Song <kasong@tencent.com>
> >
> > Tidy up the mTHP swapin code, reduce duplicated codes and slightly
> > tweak the workflow.
> >
> > For SWP_SYNCHRONOUS_IO devices, we should skip the readahead and swap
> > cache even if the swapin falls back to order 0. Readahead is not helpfu=
l
> > for such devices.
>
> Yes, agree.
>
> > Also consolidates the mTHP related check to one place so they are now
> > all wrapped by CONFIG_TRANSPARENT_HUGEPAGE, and will be trimmed off by
> > compiler if not needed.
>
> I like your idea. But I found this patch hard to review, since you you
> mixed too many changes into one patch. I think you could at least split
> it into 3 patches to make it easier for the reviewer to review and test:
>
> 1. consolidate the mTHP related check to one place (cleanup)
> 2. tidy up the mTHP swapin code (cleanup)
> 3. skip swapcache for order 0
>

Thanks for the suggestion, let me have a try, I will send a V3 later.
