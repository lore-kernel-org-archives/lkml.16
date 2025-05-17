Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74501B0F31
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747464489; cv=none; b=nNMqray6LElIQAtaqktrb8fog8ZUWdbTBxvTM8/rQVWZbGftbjvnwxEf7LC6YM0PZznzSf2pfdspUg2jx21L51aclzD3kmFinCf1phot7EcYN0FPqkoWe+3KBPbCuE1hUXuFcs88eljsQGaFFyjg2LPdLzww6S9I+/1isHUMrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747464489; c=relaxed/simple;
	bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/iAT1x9AZZN1lspzohRvobTlKOF/kVi+Tpl673/treJiJrOXMx8YUMHRjZiCtc/fwXyZACUCDVe1mPp9QZoJLlzoY8h/trl9prwbKeWlBFi8JIHEa6KkQN4INAMty2ILZZuQ7xkdhx3LKDh2pwiB4pTHKwKYmBG4oQ48oOjDjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeYWhGKE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeYWhGKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747464486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
	b=ZeYWhGKEgxeVT2haqzORPuJsrsYWU2vRnICpbPrNYnRaI3Qrm3yTNc5hdcJ3Wu/kCp1amf
	ReIe84mZFdGorF14qvMU/C3PtAILs03mM7T/I96tqnY7NbTYDwm+aVoxHZEu3gV+FwYVH5
	SGv5BgmcD07ePNUIF46wht76b+12d6w=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-a-FYC73NNam69dS0a6IPSA-1; Sat, 17 May 2025 02:48:03 -0400
X-MC-Unique: a-FYC73NNam69dS0a6IPSA-1
X-Mimecast-MFC-AGG-ID: a-FYC73NNam69dS0a6IPSA_1747464482
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70b3e8ba60aso45987597b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 23:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747464482; x=1748069282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoefSDHoQ2MJkgHc9vHEmIq4AuLZsAA319tBfQ3WAL0=;
        b=jf73jSkMj2N5Fl03/Kxm44haT3909T4iR1n1Z1c5/XGZ2K77t7M89g7xu7kAb9sUH4
         2WALgaU7ALMfymdlUFQCw5ZM/hf/zBCXlvxDSrzefDyh+bc3M57Z1PctN7plZ6d5GgyV
         DZMWof3HO3p/HdqLprIX7WDtSGGThCuprLKplGMK5sviJncOW1yDfuCkgbsIDbq5BQmr
         RaTZ8EK7zVmvvtm2CbziQxx+sdFP1PfF877+oFCXTQdePRGVAHmm1I6x3wW6bwc4jfkZ
         lBB9k8RwZ2IT3bnXcQSTcsgiX7NH86cTBcyuP4b5zXzzcs++hoGkPmi43ZEqbdbDuiZC
         bajQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSEgruzDogADSugeqJfrUZf7brYKrypao+zET8xY+BNk53FoVoZOr0x2+7K4CS5D/+gUJENSkUCd4eJuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwGGb+Id7FQraVP8X3USSCehqw0y1LFdA8cog95uvdZp/C8Nxw
	sAC1ZTHo+NNtgv+rfNKn7sdEem86wqzlMNCackBgA2BOkj/oy4BLWNRXs/62lOwe1xJfA5L2X5p
	PGMXwGUvVHoTVmkn5Y50+Z/xKKpbFZUxHmcsK0YCIUCB6Cyk7FTM2tfrAaFsB0KfJB6ZFn5EAgI
	ksZ8kKUXoJi52PFm62taeoXOwgVPj6tJULDyh62/7F8va6oX5C3SAK9w==
X-Gm-Gg: ASbGncuHpwROe+JHiwLZvP28OvaIEadJNiVNbhJyeTbFwK7LANfbG0Oqa137YrzBcfy
	l5L758IFzjcz8y/EVGmw38wdUiHq6WuKhpQsYn3yYyBVy2Il63/ja46lzUlBkhqQkX5oQlkk=
X-Received: by 2002:a05:690c:3:b0:707:dba5:2e44 with SMTP id 00721157ae682-70ca7ba0d8emr93966497b3.30.1747464482202;
        Fri, 16 May 2025 23:48:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNMmgN96ppS4R9A56rSKNlS+EhkQE/xJYfY1RrmT+t29R40GTIUMkgVA9ErgvZMyurnYk8q2A+N4SmrSywNXI=
X-Received: by 2002:a05:690c:3:b0:707:dba5:2e44 with SMTP id
 00721157ae682-70ca7ba0d8emr93966347b3.30.1747464481896; Fri, 16 May 2025
 23:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515032226.128900-1-npache@redhat.com> <20250515032226.128900-7-npache@redhat.com>
 <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
In-Reply-To: <9c54397f-3cbf-4fa2-bf69-ba89613d355f@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Date: Sat, 17 May 2025 00:47:35 -0600
X-Gm-Features: AX0GCFs8Yc5oWY97Oxpxk79pJ4fpAxS1pc4Oj0m-wPhCk0WUp_t3490TgtutRYc
Message-ID: <CAA1CXcC9MB2Nw4MmGajESfH8DhAsh4QvTj4ABG3+Rg2iPi087w@mail.gmail.com>
Subject: Re: [PATCH v7 06/12] khugepaged: introduce khugepaged_scan_bitmap for
 mTHP support
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	david@redhat.com, ziy@nvidia.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	corbet@lwn.net, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, akpm@linux-foundation.org, baohua@kernel.org, 
	willy@infradead.org, peterx@redhat.com, wangkefeng.wang@huawei.com, 
	usamaarif642@gmail.com, sunnanyong@huawei.com, vishal.moola@gmail.com, 
	thomas.hellstrom@linux.intel.com, yang@os.amperecomputing.com, 
	kirill.shutemov@linux.intel.com, aarcange@redhat.com, raquini@redhat.com, 
	anshuman.khandual@arm.com, catalin.marinas@arm.com, tiwai@suse.de, 
	will@kernel.org, dave.hansen@linux.intel.com, jack@suse.cz, cl@gentwo.org, 
	jglisse@google.com, surenb@google.com, zokeefe@google.com, hannes@cmpxchg.org, 
	rientjes@google.com, mhocko@suse.com, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 9:20=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/5/15 11:22, Nico Pache wrote:
> > khugepaged scans anons PMD ranges for potential collapse to a hugepage.
> > To add mTHP support we use this scan to instead record chunks of utiliz=
ed
> > sections of the PMD.
> >
> > khugepaged_scan_bitmap uses a stack struct to recursively scan a bitmap
> > that represents chunks of utilized regions. We can then determine what
> > mTHP size fits best and in the following patch, we set this bitmap whil=
e
> > scanning the anon PMD. A minimum collapse order of 2 is used as this is
> > the lowest order supported by anon memory.
> >
> > max_ptes_none is used as a scale to determine how "full" an order must
> > be before being considered for collapse.
> >
> > When attempting to collapse an order that has its order set to "always"
> > lets always collapse to that order in a greedy manner without
> > considering the number of bits set.
> >
> > Signed-off-by: Nico Pache <npache@redhat.com>
>
> Sigh. You still haven't addressed or explained the issues I previously
> raised [1], so I don't know how to review this patch again...
Can you still reproduce this issue?
I can no longer reproduce this issue, that's why I posted... although
I should have followed up, and looked into what the original issue
was. Nothing really sticks out so perhaps something in mm-new was
broken and pulled out... not sure.

It should now follow the expected behavior, which is that no mTHP
collapse occurs because if the PMD size is disabled so is khugepaged
collapse.

Lmk if you are still experiencing this issue please.

Cheers,
-- Nico
>
> [1]
> https://lore.kernel.org/all/83a66442-b7c7-42e7-af4e-fd211d8ed6f8@linux.al=
ibaba.com/
>

