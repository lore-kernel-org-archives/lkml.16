Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39152820BD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745518268; cv=none; b=n2jsXbBpyUUfSa55ixEzZEzqFkpcV/5f6KamgNyaNZPybiiRy+xYo6nImknT+XZDEmJOycXB98jqSUQcP+7ZBFHB+Gzth3BY+AJDyddyk70kGr9j0i/qqw3h/8VbSgeiFrAnKmbme9puENYeMMOF1CjXVo4izQbk5WGPKhB1AuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745518268; c=relaxed/simple;
	bh=/bcV79/hrYhuCYZ9AGewlfKYBwHxoJx9OcEIMx8nyzw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JlaS4ooahyMWTeW0FIUK6p9KiBeIlS+S09EIF3PYEd++hMr7EF6Z4SvPiN7tw1k6quXJeKvZRu7ueLCB0MogePHX8uu4DpUNWNuSzURrC4ybYYlJ+OeNSQ9myJu8o11ov/VXrgFlBDFerzywWoHtsbf5vcHrvov0KrUPFgdkVuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=U9c5Jk3Y; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="U9c5Jk3Y"
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7729E3FE3F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745518262;
	bh=/bcV79/hrYhuCYZ9AGewlfKYBwHxoJx9OcEIMx8nyzw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=U9c5Jk3YF5QpLUfn+1eDdVifmCYqPCbDkB7jNMXACB6E56SBzBc3JChZqNY1zi0hp
	 yiZpKV+m3pirxG8N5aDVkV7CkwjY5JH3gBCdHPmx8+Xxj8IeO2UvGaE3QkZxOjE+D1
	 ZnVSJFGQ2OdZynEyMHLnHrf8J/dmnwC7GzkjGL3W44qBztZlkbUMU2f5E1owH5gXa4
	 b1j8Zdfk8hruo4HgJdiGXnbNzuOetvvbFn2bktNWsXLXFCo7eEo7PQ4uf6bWPNadJp
	 AeiUJxP4r8mrv2fETLEjx3C4kMU1bvRaw+3q+tAZu/MElmZift36HjwgVpq0HwDuAu
	 ZbDprTW+ZNnvQ==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5eb80d465b7so1464786a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518262; x=1746123062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/bcV79/hrYhuCYZ9AGewlfKYBwHxoJx9OcEIMx8nyzw=;
        b=bEYghBza3Mg/ZW1Qs4DRfxtIC7hWwP5MXOKwrLATxMUIVqM3FKAAmSahgjMkGtrXU8
         JJ2hsU0UPNnHvetAxnOiBfqzK3Si0KWv5I+Yn0E7nD922Q22Pr//bOsXUK4BfLpxuPpQ
         dlmkvc65YzMv+ffC+yFhn+asW1Ib3F3uV/LErivnq5ul00TH2mb5H02ii5pDfL1vHZ/S
         Urf4Cdw6uFV4PwAJc044nsoMu+ISYWeqr4i9HjtUxkmC4NyOfAAz57v8jmNTxQYqnKvl
         y6NRfR+qt6osp1Pmay1QEQC4RrKtXJSL4jALRfPPC1G3Eg9O23PfnAUs8lnPiWepR2Zv
         8zVg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Xfc0LGqBMT3SMs5tBoCh0mX8KINOZKTLbyWAPW6p+N28KNEKWD+LVtLGCqIRd7XgIKwelovwpspDHys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/tk38xwVmdjVKdTBgcnwinCC1hGtIIOeSv5TuO1UjXQYD2OID
	tuzf0iWvIkrq+2x2TS+U1DjyD2xkiHFxVJwRtVpOpNXOvr9lcan1t4CRrXS0clM4/vEvQ3ekaJN
	kMBOSNCcPPmTEhW49Gfev+yavsZ4fCapGlFW+lVGJ6MLscDAtCJ26GQASIp/aDX30C0mHg3X0Vq
	HUieE1cNcd0LHkzNHrIB9bumk2V6SnGWqN2/vjLqa1GcoMZk/CEWeU
X-Gm-Gg: ASbGnctv9zmKlVRysxy0/Dat34nOfCcqtHksbt9iKSPXVZVHwqpMsHOZAEMjR0Bk0qS
	buL39V62GQvvrCS9zqEiqqFtXSCuTvHj0MutJWfmJOyVzBjYdfLWhGzAMqE8M7u76qDReWPQLyD
	wQYjBWz0Qz2miX8MIp/jllRp11Skk=
X-Received: by 2002:a05:6402:3546:b0:5f6:c4ed:e24e with SMTP id 4fb4d7f45d1cf-5f6df2334aemr3811589a12.27.1745518261833;
        Thu, 24 Apr 2025 11:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEeT56dfdwXZU9gyfAf1ipXvg9DLJW0BhXvsj463JP8ntSevyGeDPQEmobu4iu7JFqk/KgJMMBCuNsi437xIOY=
X-Received: by 2002:a05:6402:3546:b0:5f6:c4ed:e24e with SMTP id
 4fb4d7f45d1cf-5f6df2334aemr3811537a12.27.1745518261303; Thu, 24 Apr 2025
 11:11:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mitchell Augustin <mitchell.augustin@canonical.com>
Date: Thu, 24 Apr 2025 13:10:49 -0500
X-Gm-Features: ATxdqUFujSrsGNEgNvqrB8juFL36ME4oAr4i3skXtmwLE55l7TtL157IXwsVQaI
Message-ID: <CAHTA-uav+jc9WKr+Ye0zoR+niczZLbTKdX1LisR3YSLtoLJ5Dw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] khugepaged: Asynchronous mTHP collapse
To: akpm@linux-foundation.org, 
	20250211152341.3431089327c5e0ec6ba6064d@linux-foundation.org
Cc: 21cnbao@gmail.com, aneesh.kumar@kernel.org, anshuman.khandual@arm.com, 
	apopple@nvidia.com, baohua@kernel.org, catalin.marinas@arm.com, cl@gentwo.org, 
	dave.hansen@linux.intel.com, david@redhat.com, dev.jain@arm.com, 
	haowenchao22@gmail.com, hughd@google.com, ioworker0@gmail.com, jack@suse.cz, 
	jglisse@google.com, John Hubbard <jhubbard@nvidia.com>, kirill.shutemov@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@suse.com, 
	npache@redhat.com, Peter Xu <peterx@redhat.com>, ryan.roberts@arm.com, 
	srivatsa@csail.mit.edu, surenb@google.com, vbabka@suse.cz, 
	vishal.moola@gmail.com, wangkefeng.wang@huawei.com, will@kernel.org, 
	willy@infradead.org, yang@os.amperecomputing.com, zhengqi.arch@bytedance.com, 
	Zi Yan <ziy@nvidia.com>, zokeefe@google.com, 
	Jacob Martin <jacob.martin@canonical.com>, 
	=?UTF-8?Q?Vanda_Hendrychov=C3=A1?= <vanda.hendrychova@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I realize this is an older version of the series, but @Vanda
Hendrychov=C3=A1 and I started on a benchmark effort of this version prior
to the most recent revision's introduction and wanted to provide our
results as feedback for this discussion.

For context, my team and I previously identified that some of the
benchmarks outlined in this phoronix benchmark suite [0] perform more
poorly with thp=3Dmadvise than thp=3Dalways - so I suspected that the
THP=3Ddefer and khugepaged collapse functionality outlined in this
article [6] might yield performance in between madvise and always for
the following benchmarks from that suite:
- GraphicsMagick (all tests), which were substantially improved when
switching from thp=3Dmadvise to thp=3Dalways
- 7-Zip Compression rating, which was substantially improved when
switching from thp=3Dmadvise to thp=3Dalways
- Compilation time tests, which were slightly improved when switching
from thp=3Dmadvise to thp=3Dalways

There were more benchmarks in this suite, but these three were the
ones we had previously identified as being significantly impacted by
the thp setting, and thus are the primary focus of our results.

To analyze this, we ran the benchmarks outlined in this article on the
upstream 6.14 kernel with the following configurations:
- linux v6.14 thp=3Ddefer-v1: Transparent Huge Pages: defer
- linux v6.14 thp=3Ddefer-v2: Transparent Huge Pages: defer
- linux v6.14 thp=3Dalways: Transparent Huge Pages: always
- linux v6.14 thp=3Dnever: Transparent Huge Pages: never
- linux v6.14 thp=3Dmadvise: Transparent Huge Pages: madvise

"defer-v1" refers to the thp collapse implementation by Nico Pache
[3], and "defer-v2" refers to the implementation in this thread [4].
Both use defer as implemented by series [5].


Ultimately, we did observe that some of the GraphicsMagick tests
performed marginally better with Nico Pache's khugepaged collapse
implementation and thp=3Ddefer than with just thp=3Dmadvise, which aligns
a bit with my theory - however, these improvements unfortunately did
not appear to be statistically significant and gained only marginal
ground in the performance gap between thp=3Dmadvise and thp=3Dalways in
our workloads of interest.

Results for other benchmarks in this set also did not show any
conclusive performance gains from mTHP=3Ddefer (however I was not
expecting those to change significantly with this series, since they
weren=E2=80=99t heavily impacted by thp settings in my prior tests).

I can't speak for the impact of this series on other workloads - I
just wanted to share results for the ones we were aware of and
interested in.

Full results from our tests on the DGX A100 [1] and Lenovo SR670v2 [2]
are linked below.

[0]: https://www.phoronix.com/review/linux-os-ampereone/5
[1]: https://pastebin.ubuntu.com/p/SDSSj8cr6k/
[2]: https://pastebin.ubuntu.com/p/nqbWxyC33d/
[3]: https://lwn.net/ml/all/20250211003028.213461-1-npache@redhat.com
[4]: https://lwn.net/ml/all/20250211111326.14295-1-dev.jain@arm.com
[5]: https://lwn.net/ml/all/20250211004054.222931-1-npache@redhat.com
[6]: https://lwn.net/Articles/1009039/
--=20
Mitchell Augustin
Software Engineer - Ubuntu Partner Engineering
