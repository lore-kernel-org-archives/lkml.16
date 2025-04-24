Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAC1DF988
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745521025; cv=none; b=MJq0xA8+z9fLLW6k9+TP9hOhfJgCVPjlR8FW2QuHstIfeNm6nJTtKW9QJvwMtnIB+KBMffl3NNHkW9DvP1BKtK1yefjr1O2UpXCUOv/ubS+M4bjtBe+HhvoI7o8clwryWuN6l033zGKKHxZrbfSLHYImnNby82aT3QbK3sKAj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745521025; c=relaxed/simple;
	bh=0PCrxE+7A1vf6K3VotNkZFsmQ7kJosiH5JYFYju3fXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jjRL33uSaTPBz9ieww8be4rKa7YGmxXrd0jvoXg6njVS1V/iB4ofZFYcUVd+6bNsYpfKOaKxp+uA1xSWav3qiFg3neY+Ak9Q1x3fGLMBkhf/RUSxQymGRUGDsR5xPOToJHa1j46Axxcunae4XAe1adFZ1QwG2QusHLkUTotSdy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJBA7TL/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJBA7TL/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745521019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0PCrxE+7A1vf6K3VotNkZFsmQ7kJosiH5JYFYju3fXQ=;
	b=OJBA7TL/DE31n8Fl+jsKohOK3594Hi4a9RYU00836+rfy3vk2erWH0v5XXwj8gZr9RnHnN
	RmhkAcpVVy+ulT/gzq8sJF5DJfi0NKDWe2qVqfb5ftBKeX9xdogCcwMclG8z2/5qB3IrqO
	mUvP59JPvZQJu3QZSIDccmFT3L/Pg2g=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-ogYqaCHcMOuPcnj1-97MJA-1; Thu, 24 Apr 2025 14:56:58 -0400
X-MC-Unique: ogYqaCHcMOuPcnj1-97MJA-1
X-Mimecast-MFC-AGG-ID: ogYqaCHcMOuPcnj1-97MJA_1745521017
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-70267bb7ed8so15859927b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745521017; x=1746125817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0PCrxE+7A1vf6K3VotNkZFsmQ7kJosiH5JYFYju3fXQ=;
        b=aPeTYF9G2hVaB/6sjKeBLF8E4z7KGEduyJ/xKBTPQmbWyU54jCoVK7mtxItKZRDzrB
         /aB/5/spG0zmGMe7dDHINkKM8xqHJbmRbJNaGg4Qneqx6bvKTwCZ5KoTTAXdlmof2qMd
         rSpubWvl4oAW2JkjxrTDA+mnB2zuhAzqS8Fi92qfyctvmJOz3+n7w04QrTz3WLAYBLgg
         B1yNjJyilMM2mbXK1G+3TkBEMlVzBfy/RmCfIm1qg3dIUrFWJrOpSgpXipgDxADe52B5
         S2hThh3Cr1iynRqXvAYerZSv1x6PhR4sjBOwKyOXGsqcQjDiEOqHO5cqFFG1QgERlaIo
         7KNA==
X-Forwarded-Encrypted: i=1; AJvYcCWJrHCwfkZDbLHWZ/F4pB1DB7YjZUvxrK0lasajfnfW16cxpGX8k9pdOEW6XTbfc0AXUIT4d3/8FWbknFk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4nVHdCnBOx+DZL4mFirbm9tImV3bJZR3+AikCVOMT3h90fg1j
	Zce6Z2+m12JKOXfaVu0bdRFgWzAb6yPLuDG8cB3uyeS9oB5+IdXhNUWSIC7+kodFELCNNtyMAQA
	LOlC9tq6s+9+x0NjoeKFtvKpOVvaCPrYDHtwv33ZjmRwYJdL+/umCpXDowP26adFmXQ2BerM1aR
	Ti5BDXFwpjAR3N3wMdLtuHzfjxwPoKjru+79w0
X-Gm-Gg: ASbGncsb7qz8ZiuRKYedD2SoDjq/wWqLHDaPDmhunWTRKMF2M10Z9fn1+SUPaFkhT75
	1iyObl2FX+ayn872ly76aObKVRdNqn7E8lHKJ0Xgqq+eTVuUYWH3bE9Y99FOBb+kQwlNg43hrVA
	mYKdy+NZc=
X-Received: by 2002:a05:690c:9a85:b0:708:100a:5797 with SMTP id 00721157ae682-7083ec20e85mr62945987b3.11.1745521017384;
        Thu, 24 Apr 2025 11:56:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLq1YlbJnKiQchqS7R3u1IbfLVwKmtMNZfXOw4/4RsExrw85/EL3EEEm81MSFHeeKMeVPc93dtEK5J5CZyQdE=
X-Received: by 2002:a05:690c:9a85:b0:708:100a:5797 with SMTP id
 00721157ae682-7083ec20e85mr62945447b3.11.1745521017076; Thu, 24 Apr 2025
 11:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHTA-uav+jc9WKr+Ye0zoR+niczZLbTKdX1LisR3YSLtoLJ5Dw@mail.gmail.com>
In-Reply-To: <CAHTA-uav+jc9WKr+Ye0zoR+niczZLbTKdX1LisR3YSLtoLJ5Dw@mail.gmail.com>
From: Nico Pache <npache@redhat.com>
Date: Thu, 24 Apr 2025 12:56:31 -0600
X-Gm-Features: ATxdqUGkHN0DmvAZCO60egd059xRcfAJHhIl46i1OjI1cjRSg7_Z47yjLvR87-U
Message-ID: <CAA1CXcBwO77=4ki8kG93rNhB1BUpGqfvo3UbRt0WQ5pFMDyVWw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] khugepaged: Asynchronous mTHP collapse
To: Mitchell Augustin <mitchell.augustin@canonical.com>
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

On Thu, Apr 24, 2025 at 12:18=E2=80=AFPM Mitchell Augustin
<mitchell.augustin@canonical.com> wrote:
>
> Hello,
>
> I realize this is an older version of the series, but @Vanda
> Hendrychov=C3=A1 and I started on a benchmark effort of this version prio=
r
> to the most recent revision's introduction and wanted to provide our
> results as feedback for this discussion.
>
> For context, my team and I previously identified that some of the
> benchmarks outlined in this phoronix benchmark suite [0] perform more
> poorly with thp=3Dmadvise than thp=3Dalways - so I suspected that the
> THP=3Ddefer and khugepaged collapse functionality outlined in this
> article [6] might yield performance in between madvise and always for
> the following benchmarks from that suite:
> - GraphicsMagick (all tests), which were substantially improved when
> switching from thp=3Dmadvise to thp=3Dalways
> - 7-Zip Compression rating, which was substantially improved when
> switching from thp=3Dmadvise to thp=3Dalways
> - Compilation time tests, which were slightly improved when switching
> from thp=3Dmadvise to thp=3Dalways
>
> There were more benchmarks in this suite, but these three were the
> ones we had previously identified as being significantly impacted by
> the thp setting, and thus are the primary focus of our results.
>
> To analyze this, we ran the benchmarks outlined in this article on the
> upstream 6.14 kernel with the following configurations:
> - linux v6.14 thp=3Ddefer-v1: Transparent Huge Pages: defer
> - linux v6.14 thp=3Ddefer-v2: Transparent Huge Pages: defer
> - linux v6.14 thp=3Dalways: Transparent Huge Pages: always
> - linux v6.14 thp=3Dnever: Transparent Huge Pages: never
> - linux v6.14 thp=3Dmadvise: Transparent Huge Pages: madvise
>
> "defer-v1" refers to the thp collapse implementation by Nico Pache
> [3], and "defer-v2" refers to the implementation in this thread [4].
> Both use defer as implemented by series [5].
>
>
> Ultimately, we did observe that some of the GraphicsMagick tests
> performed marginally better with Nico Pache's khugepaged collapse
> implementation and thp=3Ddefer than with just thp=3Dmadvise, which aligns
> a bit with my theory - however, these improvements unfortunately did
> not appear to be statistically significant and gained only marginal
> ground in the performance gap between thp=3Dmadvise and thp=3Dalways in
> our workloads of interest.
>
> Results for other benchmarks in this set also did not show any
> conclusive performance gains from mTHP=3Ddefer (however I was not
> expecting those to change significantly with this series, since they
> weren=E2=80=99t heavily impacted by thp settings in my prior tests).
>
> I can't speak for the impact of this series on other workloads - I
> just wanted to share results for the ones we were aware of and
> interested in.
Hi Mitchell,

Thank you very much for both testing and sharing the results! I'm glad
no major regressions were noted, and in some cases performance was
marginally better. Another good set of workloads to test for defer
would be latency tests... THP=3Dalways can increase PF latencies, while
"defer" should eliminate that penalty, with the hopes of regaining
some of the THP benefits after the khugepaged collapse.

I wanted to note one thing, with the default of max_ptes_none=3D511 and
no mTHP sizes configured, the khugepaged series' (both mine and Devs)
should have very little impact. This is a good test of the defer
feature, while confirming that neither me nor Dev regressed the legacy
PMD khugepaged case; however, this is not a good test of the actual
mTHP collapsing.

If you plan on testing the mTHP changes for performance changes, I
would suggest enabling all the mTHP orders and setting max_ptes_none=3D0
(Devs series requires 0 or 511 for mTHP collapse to work). Given this
is a new feature, it may be hard to find something to compare it to,
other than each other's series'. enabling defer during these tests has
the added benefit of pushing everything to khugepaged and really
stressing its mTHP collapse performance.

Once again thank you for taking the time to test these features :)
-- Nico


>
> Full results from our tests on the DGX A100 [1] and Lenovo SR670v2 [2]
> are linked below.
>
> [0]: https://www.phoronix.com/review/linux-os-ampereone/5
> [1]: https://pastebin.ubuntu.com/p/SDSSj8cr6k/
> [2]: https://pastebin.ubuntu.com/p/nqbWxyC33d/
> [3]: https://lwn.net/ml/all/20250211003028.213461-1-npache@redhat.com
> [4]: https://lwn.net/ml/all/20250211111326.14295-1-dev.jain@arm.com
> [5]: https://lwn.net/ml/all/20250211004054.222931-1-npache@redhat.com
> [6]: https://lwn.net/Articles/1009039/
> --
> Mitchell Augustin
> Software Engineer - Ubuntu Partner Engineering
>

