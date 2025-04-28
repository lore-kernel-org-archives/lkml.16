Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241221E884
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849835; cv=none; b=rrKFxxPa0OO+j8QCCFKuNLWDA70F4aHXUfcL/BoiwxAmVZPy0mcA3a1Cq1MOmAIKpiZotktdonMZbiUleo2n1Nc1FN271+2HEhsVvH/BEX4n/mAhDqLYP/kmdBHaFQ9StzJmERSDXbAATJzinPBz5taSMxh7sTK9JgPwNoL9nzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849835; c=relaxed/simple;
	bh=TG3qiJ8FxpJ+JhDJyMQMenN08PNsduLpDMO/zg592Wc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjo3mAKzdzwu3CA3iwtFC6APQ6geopUn+sH1VKOW5e4GBZktLoKEfkXP8zAI5h8k4VX/4XGighvlAN1I+FsVuksDgmDMewKqPzhqq2//eaC9OKJm6LLE2gZkSdNewLOIk/pC4SCbKjeXPIJc/jTVFYYg3oh4MCb1jsblJlqcESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bkTVUxHh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bkTVUxHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849832;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TG3qiJ8FxpJ+JhDJyMQMenN08PNsduLpDMO/zg592Wc=;
	b=bkTVUxHhifEKIdgBP41Ivrtkb/o+gJhuemM60gzcbY5JuRGMb3GYPPE2KknzC8OxaFs7TZ
	4RRTIBJHYCL00RI8GiIR6zwdjdFfilrzsODg9/0OR9fkwUlS3e2Rw7OZGSaEUGNliOh12z
	92NtbP/N/ygz3gXLpfkgYdQznnF5cQ4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-DXEtVFEnODOVvMljwxNmLw-1; Mon, 28 Apr 2025 10:17:11 -0400
X-MC-Unique: DXEtVFEnODOVvMljwxNmLw-1
X-Mimecast-MFC-AGG-ID: DXEtVFEnODOVvMljwxNmLw_1745849830
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3db5469fbso407775766b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849830; x=1746454630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TG3qiJ8FxpJ+JhDJyMQMenN08PNsduLpDMO/zg592Wc=;
        b=WILKha4MoKIm4kWc7WtNns6S8NbSS3imU61sJKjpLe7XdEYFEAfgSSNkae4tZpYoaC
         pz4N+k1GDC4/iNMw+0JXJ4QdH1uXShbSXpyZcOD2Rx7bjsi9z+oTsEMoq0OzVK7wq8dx
         t8qoBMqYCf8Y+JYrJwJ/bMteI3lvt9WkwsgSTBCxWp/8pqozWjxDcceoCqpMWU+qhRi+
         vSvxEyAz9KjaX4gG9fM9u8qg4L55kQv5GqMq5GwRBrfeNo7iNzRMEnG8DKEB+tqdD4bH
         EzyJSd2mAC6IpF+cTiVO5WDfq/sNwb9LVQqWyOunRy5iUzGhYvj1bPN9N44Zpa61Pyds
         H1Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU2X0XThH22c9H8p3UBn4KVc86hYm+PW2X0SxRFz6I20h4hvCK2Dxta7fHP3JoQ5LK2kTCQd3zRyoRd9CI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WGfA1a6y30EaPuMxSjZvlzf5e1uJqou+DO3IJU6Ua7yo6/45
	XEaK/sWy75JMt1vYgnDKPRKJ2dHH4BSYA62zt/J+6k62bu7WMoJ4/ae/q+HWWWu+Vz7pTLFN20q
	sVBuIqSLJEhVhxLNYKSd/quX0IofuD6adKiIfesdpzr8D89K9u1mKy7SabfartsAG4AUd4UpeU/
	OYQQ2urLVIffNmVxLnvwz8QFPsx/pERrOSzXKM
X-Gm-Gg: ASbGnct4wRcpgZDWmqp1ULqXMa9Xk6I918cTmXJZl2ynUUqMxd0mivwFbkKPKwhHmx4
	YgdWpj0OXmxdNCS+EbpSrZqu8PINIKHwp2gA6wpf7L88fSQgElc/grWDwvNZi5wi+aVjIP1AUt0
	c0QIhtQR5e0g1CqRhxdX1YTxA=
X-Received: by 2002:a17:907:f496:b0:acb:b9db:aa22 with SMTP id a640c23a62f3a-ace70e91b4dmr1008720366b.0.1745849830107;
        Mon, 28 Apr 2025 07:17:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbJTr40xzov/JpEN1AZCFq/hEiKT9H91c5FgG1/zMnJuTUP4Lf2zreV1Yqu5sM418yv7kpmQlzPbxZhBEi5NU=
X-Received: by 2002:a17:907:f496:b0:acb:b9db:aa22 with SMTP id
 a640c23a62f3a-ace70e91b4dmr1008717866b.0.1745849829773; Mon, 28 Apr 2025
 07:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAP4=nvTab7BnT4uu0iCuFJpZ-_MdY-MYU+Q25QnpygEZKmsQ8A@mail.gmail.com>
 <20250428101234.GB551819@e132581.arm.com> <CAP4=nvQ_7oS5ZAsKmOd_ORg0tyHS=B+i2m63K=TLg22rTEiRGQ@mail.gmail.com>
 <20250428124727.GE551819@e132581.arm.com>
In-Reply-To: <20250428124727.GE551819@e132581.arm.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 28 Apr 2025 16:16:58 +0200
X-Gm-Features: ATxdqUEGAw_xe9AuQufWCZ0vkmil018tY3jNyZt-_SnQ-ewecW2yh5rZ4pI92sw
Message-ID: <CAP4=nvTdD=eKcO_sJL3G7U0KxRTQ6XjJeJxNrmeD3n8UGBv5+g@mail.gmail.com>
Subject: Re: [BUG] perf segfaults when combining --overwrite and intel_pt event
To: Leo Yan <leo.yan@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-perf-users@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, Wander Costa <wcosta@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

po 28. 4. 2025 v 14:47 odes=C3=ADlatel Leo Yan <leo.yan@arm.com> napsal:
> I would leave this fix to the Intel-PT developers, who know this part
> best.

Makes sense.

Just FYI, I tried applying the patch above, and after swapping
mmap_ovw for overwrite_mmap (which appears to be the correct name in
struct evlist) to make it build, the segfaults are gone:

$ perf record --overwrite -a -e intel_pt/cyc,noretcomp/k sleep 1
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 40,533 MB perf.data

However, the data cannot be read:

$ perf report
0x7620 [0x30]: failed to process type: 71 [Invalid argument]
Error:
failed to process sample
# To display the perf.data header info, please use
--header/--header-only options.
#

Data generated without --overwrite is fine.

Tomas

