Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB928CF5E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745523952; cv=none; b=gTwjuUMBj37nsZlDOPtGlqya8NxGtYrKp3Bp8oAMALgDOdJzuJkbXUjrZ1mG/D8YqCeEhCR7v6yNVMg6PWDI0t9qIk8YspoOCo6BkLLpKciEPEmJ14/Y9MkTzQBvPzCynYYj7OwlMa7jAtMIW1fsikauW1HXPh/L7qAcFjVuSKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745523952; c=relaxed/simple;
	bh=E0pEGahBgoDFBAUS4Jz66fixTgxBtIEDKCzGTGdFfoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ot+7mhRjWukK/F+a74I0N/jvACQz8AfzGSJpRcJk9KA5GQoKwOwek47AMMEOX4+WVSr+lAda3XVK27BTr9Br79iyBTi/DIVsevRnvnAXiNf+OBG2YazzjvR3ts3NXa7/2HmFsZbuM5wl1RlDFmZWLXv3s2mZ2X8qwSP3ZCMWM2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Jrqjr4ru; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Jrqjr4ru"
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6043D3F880
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745523947;
	bh=E0pEGahBgoDFBAUS4Jz66fixTgxBtIEDKCzGTGdFfoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Jrqjr4ruZkbuJRGGUQjq2nRzOPZfeTvcbA4AcC2COH8bpXsKMTYZdQcNx0qfz5UW6
	 dnyUUn7bIgpgB13kg/UANcwxRIlKEMwz7MhzXm3soPXUdOTPXLKmo22iqoWHMUYhYk
	 pOVGF2UDyxQ1WOSmMm5oB28NXwm/HPW1aosq4jYEEwyytT+b3Aoj6Or76Nr/b6deF6
	 6bfAKksw/VJ6z+5MVaf4X2ImkY9D62tTq/NVUEUzDupkfcKbWtSshIbmdB7ohoe6x9
	 hK8gaISG869cUYxB2gxIcMWhOJrNboLk8FybbLYq6J6TYZTdBqUFYEzd3XOUkdCA4N
	 TXUrK4aVcbySw==
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5f501ed492bso1447243a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745523947; x=1746128747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0pEGahBgoDFBAUS4Jz66fixTgxBtIEDKCzGTGdFfoU=;
        b=gZmAcu0nychYrR7hCNT/Ci4CjEe4lbgNHNfYEBafczL/1KVAJTw/lTO0YhEJ8AN6Id
         kU/ZCPdQQ5ekrW05ExTFy0j8SRgGXtSDMc+g5UTuKkPaKhqQkpbx7HQ0Zo+vkcEQJ/Zl
         ARjXqhj8lcXoWOm+jQQRQSL+K0VD7HAxhTWUFfkXA4FQeKoTToT2aDtedkFf2N+5yV7e
         DaPyxQyjf/DPOKq1bEkLlvLb/lkOG444168HV6Ot1yc2Aokzvm9J+PrpQdgRixF5l6hr
         XUor+mdnbrwrSYvBuHKe9Qbe1hpqIpB2hHm0JTHdmy/APermE8N+19wz9cKBIR95ifCY
         TH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVovo9F+Js6+h4vO4eTydisbgk+hHvRiWfI4xUwSY4gXSZuHFWfHO0DZYFwB8mISBay79qvvmASUEn1lNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJkOE0b+7RlrFCS1aArJNtI5/65jlZ8kWzrUUmGaa5wYs8LC8n
	qASXokcAvXx1pwOJoal9CfkHAduXRGReua/F/hfZqz0byzPxwhFvDaxvbz9m+HmISEu5OKWwc6I
	6uyLeO5s2kcDCGeAOAr5i7rfp0Gf0ybOxdCBqUjRog/mwDDkiDYiB4VEWpvS77wz+5xWfTE+qae
	5nmCtpwyuJaL1FOIVh+UMixIY1jHNO+VSUeIg+NPS8JgGuV0qFgD/e
X-Gm-Gg: ASbGncuCW1Slq2653f246LDL8koZ+rN0N+nM6DVbaxgHyZwp0Qlw3G0Z3KyfwL8cOdA
	SGN1ntv+yjYp2pIdM7xxM4xw54EmKktVoOc2ic8WDzvlt9aDQMFRAYZpZk8tELKwXAg6gq3c52l
	Ln5okT0tT7Oq7xYp8oYgLVzOBLsVs=
X-Received: by 2002:a05:6402:909:b0:5f4:b0ab:9df4 with SMTP id 4fb4d7f45d1cf-5f6de698364mr3558134a12.19.1745523946717;
        Thu, 24 Apr 2025 12:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErHtvwjwqvx+Pis5XnNsdiAcxYTGhZDFcjfJc9k5kJvnIKQua237UfaPNOxMAYta3CXqSMi98w8m3kVyj1sP0=
X-Received: by 2002:a05:6402:909:b0:5f4:b0ab:9df4 with SMTP id
 4fb4d7f45d1cf-5f6de698364mr3558113a12.19.1745523946324; Thu, 24 Apr 2025
 12:45:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHTA-uav+jc9WKr+Ye0zoR+niczZLbTKdX1LisR3YSLtoLJ5Dw@mail.gmail.com>
 <CAA1CXcBwO77=4ki8kG93rNhB1BUpGqfvo3UbRt0WQ5pFMDyVWw@mail.gmail.com>
In-Reply-To: <CAA1CXcBwO77=4ki8kG93rNhB1BUpGqfvo3UbRt0WQ5pFMDyVWw@mail.gmail.com>
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 24 Apr 2025 14:45:35 -0500
X-Gm-Features: ATxdqUEuxhcc_Luykb8-WLfPY-ge2-vsyMllMl6kQO2kd6CazCEslzW0Wk192JE
Message-ID: <CAHTA-uZeFEbQw-9UUPEpOQ-tATxnD+-up9=PUhi0dVH8T86yag@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] khugepaged: Asynchronous mTHP collapse
To: Nico Pache <npache@redhat.com>
Cc: akpm@linux-foundation.org, 
	20250211152341.3431089327c5e0ec6ba6064d@linux-foundation.org, 
	21cnbao@gmail.com, aneesh.kumar@kernel.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, catalin.marinas@arm.com, cl@gentwo.org, 
	dave.hansen@linux.intel.com, david@redhat.com, dev.jain@arm.com, 
	haowenchao22@gmail.com, hughd@google.com, ioworker0@gmail.com, jack@suse.cz, 
	jglisse@google.com, John Hubbard <jhubbard@nvidia.com>, kirill.shutemov@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com, 
	Peter Xu <peterx@redhat.com>, ryan.roberts@arm.com, srivatsa@csail.mit.edu, 
	surenb@google.com, vbabka@suse.cz, vishal.moola@gmail.com, 
	wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org, 
	yang@os.amperecomputing.com, zhengqi.arch@bytedance.com, 
	Zi Yan <ziy@nvidia.com>, zokeefe@google.com, 
	Jacob Martin <jacob.martin@canonical.com>, 
	=?UTF-8?Q?Vanda_Hendrychov=C3=A1?= <vanda.hendrychova@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nico,

Thank you for the quick response and suggestions! I'll see if we can
find some time to test our workload out with your suggested settings
and will let you know what we find (although it may be a few weeks).

-Mitchell Augustin

On Thu, Apr 24, 2025 at 1:57=E2=80=AFPM Nico Pache <npache@redhat.com> wrot=
e:
>
> On Thu, Apr 24, 2025 at 12:18=E2=80=AFPM Mitchell Augustin
> <mitchell.augustin@canonical.com> wrote:
> >
> > Hello,
> >
> > I realize this is an older version of the series, but @Vanda
> > Hendrychov=C3=A1 and I started on a benchmark effort of this version pr=
ior
> > to the most recent revision's introduction and wanted to provide our
> > results as feedback for this discussion.
> >
> > For context, my team and I previously identified that some of the
> > benchmarks outlined in this phoronix benchmark suite [0] perform more
> > poorly with thp=3Dmadvise than thp=3Dalways - so I suspected that the
> > THP=3Ddefer and khugepaged collapse functionality outlined in this
> > article [6] might yield performance in between madvise and always for
> > the following benchmarks from that suite:
> > - GraphicsMagick (all tests), which were substantially improved when
> > switching from thp=3Dmadvise to thp=3Dalways
> > - 7-Zip Compression rating, which was substantially improved when
> > switching from thp=3Dmadvise to thp=3Dalways
> > - Compilation time tests, which were slightly improved when switching
> > from thp=3Dmadvise to thp=3Dalways
> >
> > There were more benchmarks in this suite, but these three were the
> > ones we had previously identified as being significantly impacted by
> > the thp setting, and thus are the primary focus of our results.
> >
> > To analyze this, we ran the benchmarks outlined in this article on the
> > upstream 6.14 kernel with the following configurations:
> > - linux v6.14 thp=3Ddefer-v1: Transparent Huge Pages: defer
> > - linux v6.14 thp=3Ddefer-v2: Transparent Huge Pages: defer
> > - linux v6.14 thp=3Dalways: Transparent Huge Pages: always
> > - linux v6.14 thp=3Dnever: Transparent Huge Pages: never
> > - linux v6.14 thp=3Dmadvise: Transparent Huge Pages: madvise
> >
> > "defer-v1" refers to the thp collapse implementation by Nico Pache
> > [3], and "defer-v2" refers to the implementation in this thread [4].
> > Both use defer as implemented by series [5].
> >
> >
> > Ultimately, we did observe that some of the GraphicsMagick tests
> > performed marginally better with Nico Pache's khugepaged collapse
> > implementation and thp=3Ddefer than with just thp=3Dmadvise, which alig=
ns
> > a bit with my theory - however, these improvements unfortunately did
> > not appear to be statistically significant and gained only marginal
> > ground in the performance gap between thp=3Dmadvise and thp=3Dalways in
> > our workloads of interest.
> >
> > Results for other benchmarks in this set also did not show any
> > conclusive performance gains from mTHP=3Ddefer (however I was not
> > expecting those to change significantly with this series, since they
> > weren=E2=80=99t heavily impacted by thp settings in my prior tests).
> >
> > I can't speak for the impact of this series on other workloads - I
> > just wanted to share results for the ones we were aware of and
> > interested in.
> Hi Mitchell,
>
> Thank you very much for both testing and sharing the results! I'm glad
> no major regressions were noted, and in some cases performance was
> marginally better. Another good set of workloads to test for defer
> would be latency tests... THP=3Dalways can increase PF latencies, while
> "defer" should eliminate that penalty, with the hopes of regaining
> some of the THP benefits after the khugepaged collapse.
>
> I wanted to note one thing, with the default of max_ptes_none=3D511 and
> no mTHP sizes configured, the khugepaged series' (both mine and Devs)
> should have very little impact. This is a good test of the defer
> feature, while confirming that neither me nor Dev regressed the legacy
> PMD khugepaged case; however, this is not a good test of the actual
> mTHP collapsing.
>
> If you plan on testing the mTHP changes for performance changes, I
> would suggest enabling all the mTHP orders and setting max_ptes_none=3D0
> (Devs series requires 0 or 511 for mTHP collapse to work). Given this
> is a new feature, it may be hard to find something to compare it to,
> other than each other's series'. enabling defer during these tests has
> the added benefit of pushing everything to khugepaged and really
> stressing its mTHP collapse performance.
>
> Once again thank you for taking the time to test these features :)
> -- Nico
>
>
> >
> > Full results from our tests on the DGX A100 [1] and Lenovo SR670v2 [2]
> > are linked below.
> >
> > [0]: https://www.phoronix.com/review/linux-os-ampereone/5
> > [1]: https://pastebin.ubuntu.com/p/SDSSj8cr6k/
> > [2]: https://pastebin.ubuntu.com/p/nqbWxyC33d/
> > [3]: https://lwn.net/ml/all/20250211003028.213461-1-npache@redhat.com
> > [4]: https://lwn.net/ml/all/20250211111326.14295-1-dev.jain@arm.com
> > [5]: https://lwn.net/ml/all/20250211004054.222931-1-npache@redhat.com
> > [6]: https://lwn.net/Articles/1009039/
> > --
> > Mitchell Augustin
> > Software Engineer - Ubuntu Partner Engineering
> >
>


--=20
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
