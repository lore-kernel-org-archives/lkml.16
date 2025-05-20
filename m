Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A85217733
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747784819; cv=none; b=hizjk+FF7tBipnlNlwAPOSKjBW2KN9Xhwh1lTVIaCD13BYrX0iwkenUMzStznpv3udni+uqYt6j6SwA2vQH2yV6UqmoG0+LH+SGuvnzS7nEeBhwxGTpI7ukS/xqimTCQNWoKhGfj7ZnlGBy3FautvntNO5G5QwNTlTGocwPTEnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747784819; c=relaxed/simple;
	bh=Yq4HYpfhUCfzoOsCPE1QdzGf4m2iO+EWr/iRDSqOabo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3lxa9DyVpclqA62kn/WUw9PjP13HnszmDfLG6KzAG1jPsU4wifpsC2vDSZj1kka38vbyLR34l8JOypO7GNCrX3HLsLugqF9/Xm3oRFptpt23XKIl9YsQf5ETl4iNX3WzRSVEnjierX1KlZKFUGYh/7X8DhTl3Ix1isl7ppc1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=WFNxh4uI; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="WFNxh4uI"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-70de22bdfaeso11034337b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747784817; x=1748389617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yq4HYpfhUCfzoOsCPE1QdzGf4m2iO+EWr/iRDSqOabo=;
        b=WFNxh4uI2Q5dz31eMYwI1czAbR33ceSO0mlUn10O0LdFYfy3F8IXPaTAUI+hG6lRp8
         TJDJQJOWGIRxBBb26lik8zLphNz3MWvTKEFtkhCVwoTYZq0Y21q0YjdLxP1VnDpdHwJf
         Ti94nHdgFOO8GbzSeWhq2JQCJcAxzezB3ZF5u0qPcHoiv9ywm0NbW3CCajvE83sQUNt2
         5eivyhlIolmFhPg7bwFsQySnUjApeBCA+K2iug1EnL2KaQBRSqkSl1Gqek8eGI7XObyt
         7kqOg07iFcIMdc/GmJVMA+q+IOLlhFn6FDeNLRflcVE+Bxrbf2BEfdNUzurS83Lh5T3S
         65XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747784817; x=1748389617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yq4HYpfhUCfzoOsCPE1QdzGf4m2iO+EWr/iRDSqOabo=;
        b=OcY5n2mde/hMTQ7SVDZWcA+JLEHYQVnj6jo1pDKiwECI+QzbHZ1z5Nio9MPrCJVj1s
         o+Mqq11tjiKnLD6UFFCjfdY8I+QeTx5EzJaQkRC+tAl7nMv1uukWNjWqy25Oa6Y+ieNP
         5/lJbVdZJ0gt5b0kqWV1HnSBI4OPR7/fZF/h3owgBivTemHidu8FsjJcJ9JwQXll4NZC
         DdvqSJqkR1au2dlzY03gMIsmQLgvmADhA+YVcfRQVGVOlnGEWCOKTrBTQpMiU29qm/k3
         dyxKvC3i49OXRegnXfRr8NEWGqEqTQxMvdXNaFi8LU70FMsv9LdyIykgJhEdUR5V841/
         XVwg==
X-Forwarded-Encrypted: i=1; AJvYcCUqmLTII0ALi2+c5cqlCF1BSgFFdm98DyIit7mf8vC4q4geOpAWvVASxQ3QiewQ++vz9XhrNqLClXF40kE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0bQKRi/UEUDeC0r5IbBY2YoQXMU87YLxrytaj87GiAQXvk4Ns
	B3hcCDE2bm3r3VRp2oJcRo1YbI/UW1DdieKwLpDUFDlhjhT9iHADipHh77i3QOLOrPy/zhIPXki
	fALSY1gx5CURCr8mTT9pT1f6hGS/+pVGJYELyF6QyGzi05D1Y99/zdQ==
X-Gm-Gg: ASbGncvn/w4LPEXQLo9Vgxw4st67O4X4cjZAT30Nc4sLTb7+ArXaiAr6tv1DEXSJK5w
	CNvs/bD6qravW/eF5lxFv8NmvHJT8Jzcambj8cZy4Ffv7DecEI/eniNp5OJeScWAlM5RKOZtbMl
	zS6bT4cMHem+7pjIYYYWXJKOeXHYr+cnPn
X-Google-Smtp-Source: AGHT+IHJcBO4BYxHzd54ZMIX+sDvUsrmRaER0cU5tHMU5i88RsMg+/6LGiRjXzPUqsqqWVXR2LteJoE7pgou+j+U3wg=
X-Received: by 2002:a05:690c:6e10:b0:708:ca91:d583 with SMTP id
 00721157ae682-70cab0b8e9amr251259677b3.25.1747784816903; Tue, 20 May 2025
 16:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506031833.6107-1-caixinchen1@huawei.com> <6f9de6c4-a2e0-4423-b581-dc15822fc641@googlemail.com>
In-Reply-To: <6f9de6c4-a2e0-4423-b581-dc15822fc641@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 20 May 2025 19:46:46 -0400
X-Gm-Features: AX0GCFvoL84BT-dY8Jn-b03a1sTYavgsX95-fSUXRtRCJcGmdSnei1aQcwknin0
Message-ID: <CAHC9VhR5a8Wuj9hkgj2AgCGzk-3dmSHDoMr7AY1qOtLaPbj01Q@mail.gmail.com>
Subject: Re: [PATCH] SELinux: Add check for the user data passed to kcalloc in hashtab_init
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: Cai Xinchen <caixinchen1@huawei.com>, linux-kernel@vger.kernel.org, 
	selinux@vger.kernel.org, stephen.smalley.work@gmail.com, omosnace@redhat.com, 
	ericsu@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 4:14=E2=80=AFAM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
> May 6, 2025 09:20:51 Cai Xinchen <caixinchen1@huawei.com>:
>
> > When the user writes some data to the file /sys/fs/selinux/policy,
> > there is no check for the user buf passed to kcalloc. Syzkaller shows
> > this warning:
> > WARNING: CPU: 1 PID: 6642 at mm/page_alloc.c
> >
> > __alloc_pages_noprof
> > ___kmalloc_large_node
> > __kmalloc_large_node_noprof
> > __kmalloc_noprof
> > hashtab_init
> > common_read
> > policydb_read
> > security_load_policy
> > sel_write_load
> > vfs_write
> > ksys_write
> > do_syscall_64
> >
> > This warning can be reproduced by writing this content to
> > /sys/fs/selinux/policy
> > 8cff7cf9 08000000 5345204c 696e7578 15000000 e0ff962a 08000000 07000000
> > 4cf523cd 7eec2688 6d70a6b7 c78b496f 1a0a192c ea34ff41 70581a74 3ff0cfb9
> > 7ea0f0d1 70d1fe14 41c2f7c8 ea1c78dd 17a19249 35210081 a83c30ec 4171450b
> > fc1de12c fe1ff342 a887
> >
> > Add check to prevent the size passed to kcalloc larger than MAX_PAGE_OR=
DER
> > after get_order.
>
> This might be similar to https://lore.kernel.org/selinux/20241216164055.9=
6267-12-cgoettsche@seltendoof.de/
>
> I'll try to respin that patch set in time.

Or we just use _GFP_NOWARN which I believe should quiet the warning
without having to do a lot of extra work.

If someone wanted to track down all of the different allocations that
can be triggered from a policy load and mark them all as NOWARN, I
think that would be time well spent.

--=20
paul-moore.com
