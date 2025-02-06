Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DC155308
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 03:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811701; cv=none; b=LSTM5OaCHiS8F+0bkgnjWPQqzPC+uwQBLCpoKQR8v8xaIhL5O5J4pwf+ABNf+XB6no1EGg50kmP3dmjbeJkMBpvDgOxcAt0pDyhfJdKqwNL2HgDgauwB7dGXPlgMSvSScsQ6Xgh8FMPYsfIcl7xVLbtcjGtD+c5A6s3Fp8Ll4H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811701; c=relaxed/simple;
	bh=/JeFWiTSOl1cDmmcwJFbN19r2ymeaCQGzWm+iagJ3x4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HNol1gerD5YaRwrGbMNks0++R9nDx2ckY0tzUj/k0UuvE6XDXMcYgHw2iyUWobNhbZ/LpN+dhsCZcgeyC7HqID6upQReBvLnysPY4Ox9E+kxNH8hva53deIrxJlBG9lZ8jTjRd8UPe62g8gKfrIJXJcni3Pz+iKNTDQEdJrLRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HG7qGK3b; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HG7qGK3b"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f032484d4so80205ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 19:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738811699; x=1739416499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JeFWiTSOl1cDmmcwJFbN19r2ymeaCQGzWm+iagJ3x4=;
        b=HG7qGK3bY8HigikhhenFEb+wH03XAh78jeizTSWtdwWNaR4aQ2lvkEDmQoMA4KxOb/
         BmgbucFTzG06Cxsiq6WBhUJuebcKj1fRpjN0i/H0eKFbhhs9/vg/Ccc3ihVJcCGD0KbZ
         rVH408AbPaJkOAtfgGsaMNOIo5xUsNk8L3+DffQ6hTd/jbmXOfBjYSTde9/hB/yRWZd2
         Tc+HDiYbJfZkNTLAPqvk+haH42xt+Hcnl4hutuP/nJntjJn5DRo7+gtQxFtEdAY2+WWm
         7pdJ/75I0dfm+MQxQqTUYmavw0QUAcdDISW6lvCe69aAeYaRmAeHR+WHLEtQ9lhXW821
         EioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811699; x=1739416499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/JeFWiTSOl1cDmmcwJFbN19r2ymeaCQGzWm+iagJ3x4=;
        b=rfg+J25b+HpxKfWueByB/U5VxtJYI4NDxKhdCRNod8kUMUwpXTpGwBtZUlqWQYI82r
         mSyt9FbDEqNCfaDe+JCLgDhzxNygBOZuHI6TfvpfFEJ/bUAzRa+Yf/McLM1tPg+7s4vO
         60IDRBPchsP9h3f5JEWl9wwgDRHKjV+FKJapXALIzSAB4BUfsJllVcalEPnlepSAjfo3
         gf595CSiemV9Ir+H3jsJofMLiIxW4gNql9jZgMzhpJRSMsf4JMCDby9jCrQ9e0aAQvjX
         qeoF82JCDT7aIF2cmqYLQcvve2XBj40Pbm3w+Al5KRySaFOaHNXIj99QqT6sPzBKEsAC
         pQJA==
X-Forwarded-Encrypted: i=1; AJvYcCUqaewf+o6ZolM8PLK6Y7eGjj4HUa/aIiMAKmXMD9n4TjwBL6CMTUQ5CcVOhQeFBZ8XKHDHCSX6FT5A2/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwIJzt122NQYBE+zvyYId3edyUhKXtXhXcBSRBzGD3npHs0dV1
	ck1IGNk2j9znYOuAQ2Wip3HW1RhSU8zE+/MBTPyWN5C63kf7EUaihznl9sRSsDJQ2hWE/9k994T
	xbdblVoBK0NNjrBuk1VshHrV18J9ndYm1LnnG
X-Gm-Gg: ASbGnctneeVKkLsYOqPa1lvDlo7djGMCi2E9LE253whcKxblxFBgyE2Ek+BYHsMDV6C
	sYs8tQPmS1uIgIHODeGCTsDinXx3kYOKqy3njWdA6YFQq06YjeJFPfL8MgFbh53wOon9jY/iYSX
	LdKI0RgcrpK6OESJ34cqrsiqdbtQ==
X-Google-Smtp-Source: AGHT+IEMYysos1RIWu4KraSQB7jvZmlFjQnYGI8ubCzHGgNPVyVmEnJ253SjiVzHGIflpLdIAjZFieoErSbMVInlLmY=
X-Received: by 2002:a17:902:b589:b0:216:4d90:47af with SMTP id
 d9443c01a7336-21f34cc65ddmr583825ad.29.1738811699233; Wed, 05 Feb 2025
 19:14:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123105721.424117-1-raghavendra.kt@amd.com> <0a9914f8-bec7-4e58-ab12-a87fe3876187@sk.com>
In-Reply-To: <0a9914f8-bec7-4e58-ab12-a87fe3876187@sk.com>
From: Yuanchu Xie <yuanchu@google.com>
Date: Wed, 5 Feb 2025 19:14:42 -0800
X-Gm-Features: AWEUYZn6MPTY1_MU1S8hLVyAdHYXGxJzF-tVdC8MWzr1l3c8Snt-2ud2DsTxV0U
Message-ID: <CAJj2-QE10YknASd9b=_Qe8dWt4eRD1ZtOSFMYe3-26M0aEpUcQ@mail.gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion
 based on PTE A bit scanning
To: Hyeonggon Yoo <hyeonggon.yoo@sk.com>, Raghavendra K T <raghavendra.kt@amd.com>, 
	"bharata@amd.com" <bharata@amd.com>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>, kernel_team@skhynix.com, 
	42.hyeyoo@gmail.com, "gourry@gourry.net" <gourry@gourry.net>, 
	"nehagholkar@meta.com" <nehagholkar@meta.com>, "abhishekd@meta.com" <abhishekd@meta.com>, 
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>, "nphamcs@gmail.com" <nphamcs@gmail.com>, 
	"hannes@cmpxchg.org" <hannes@cmpxchg.org>, "feng.tang@intel.com" <feng.tang@intel.com>, 
	"kbusch@meta.com" <kbusch@meta.com>, "Hasan.Maruf@amd.com" <Hasan.Maruf@amd.com>, "sj@kernel.org" <sj@kernel.org>, 
	"david@redhat.com" <david@redhat.com>, "willy@infradead.org" <willy@infradead.org>, 
	"k.shutemov@gmail.com" <k.shutemov@gmail.com>, 
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>, "vbabka@suse.cz" <vbabka@suse.cz>, 
	"hughd@google.com" <hughd@google.com>, "rientjes@google.com" <rientjes@google.com>, 
	"shy828301@gmail.com" <shy828301@gmail.com>, "liam.howlett@oracle.com" <liam.howlett@oracle.com>, 
	"peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"nadav.amit@gmail.com" <nadav.amit@gmail.com>, "shivankg@amd.com" <shivankg@amd.com>, 
	"ziy@nvidia.com" <ziy@nvidia.com>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, 
	"AneeshKumar.KizhakeVeetil@arm.com" <AneeshKumar.KizhakeVeetil@arm.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jon.grimm@amd.com" <jon.grimm@amd.com>, 
	"santosh.shukla@amd.com" <santosh.shukla@amd.com>, "Michael.Day@amd.com" <Michael.Day@amd.com>, 
	"riel@surriel.com" <riel@surriel.com>, "weixugc@google.com" <weixugc@google.com>, 
	"leesuyeon0506@gmail.com" <leesuyeon0506@gmail.com>, honggyu.kim@sk.com, 
	"leillc@google.com" <leillc@google.com>, "kmanaouil.dev@gmail.com" <kmanaouil.dev@gmail.com>, 
	"rppt@kernel.org" <rppt@kernel.org>, "dave.hansen@intel.com" <dave.hansen@intel.com>, Kinsey Ho <kinseyho@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 9:53=E2=80=AFPM Hyeonggon Yoo <hyeonggon.yoo@sk.com=
> wrote:
> On 1/23/2025 7:57 PM, Raghavendra K T wrote:
> > Bharata and I would like to propose the following topic for LSFMM.
> >
> > Here is the list of potential discussion points:
> > 1. Other improvements and enhancements to PTE A bit scanning approach. =
Use of
> > multiple kernel threads, throttling improvements, promotion policies, p=
er-process
> > opt-in via prctl, virtual vs physical address based scanning, tuning ho=
t page
> > detection algorithm etc.
>
> Yuanchu's MGLRU periodic aging series [1] seems quite relevant here,
> you might want to look at it. adding Yuanchu to Cc.

Thanks for the mention, Hyeonggon Yoo.

Working set reporting doesn't aim to promote/demote/reclaim pages, but
to show aggregate stats of the memory in access recency. The periodic
aging part is optional since client devices wouldn't want a background
daemon wasting battery aging lruvecs when nothing is happening.
For the server use case, the aging kthread periodically invoke MGLRU
aging, which performs the PTE A bit scanning. MGLRU handles unmapped
page cache as well for reclaim purposes.

Reading through the kmmscand patch series.
Kmmscand also keeps a list of mm_struct and performs scanning on them,
so given there're many use cases for PTE A bit scanning, this seems
like an opportunity to abstract some of the mm_struct scanning.
Code-wise the A bit scanners do very similar things, and the MGLRU
version has optional optimizations that reduce the scanning overhead.
I wonder if you have considered migrating pages from the MGLRU young
generation of a remote node, or pages that have remained in the young
generation. Some changes to MGLRU would be necessary in that case.

Also adding Kinsey Ho since he's been looking at page promotion as well.

Thanks,
Yuanchu
