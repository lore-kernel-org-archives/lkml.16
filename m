Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2D1D8E1A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747635669; cv=none; b=L4758eSU8BXVQwqOYVQixDvTduo/C7TdTO6GJZcIBwWGN12JOGmBfhoKMQNrPVnPCs/UrAlx/9Rox1R/Q7jwblUqbWgLOOQUHRQMMaNkgWuWEBFGysxNwx6W1Dpl8MkYsi5XCcbS641EABxthC7evQlBBWoNK1rRFSzJYH5VXuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747635669; c=relaxed/simple;
	bh=fH4ypnsI/MfhhHZ+DxWHo23PH+rJEDeMHxcWT6aZwo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rluYQIVabgQaM4YF8fBji/61a93cWIAyMAfDdJcPFcLNLLeM0Mwcxs505EZfMyVujg1iqEmw8uS45gUPAopj4PLf55JgxGJY8gznrqiOO2UAct8jPJGQLyZaz2S3UgmDGldio83rA44CVbTTM+7NkAuWCGPHfbR+bp8Scq1jj0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P30h46wv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P30h46wv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747635665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DxY7EgT/RNd0tv3+QSKlLScSTvHaTBPFXOYePAlhj1I=;
	b=P30h46wvBaj+p8/JfFj/2aYaIusliad6C0U+JC+CTutn3a+Dz8tfJPuKnsUPxbRKqBmWHq
	AixpdeFeLRuQCF0+7Mz83+AjYziDC1L9tuqx9yQ+aIJHg9lkmPhymq94YYDN2I2m/hVSzg
	h6KN0DknBhG9rWbEadIrug8U8gV/3fA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-P-bwJeHjPPSVk2uH3a9jMQ-1; Mon, 19 May 2025 02:21:04 -0400
X-MC-Unique: P-bwJeHjPPSVk2uH3a9jMQ-1
X-Mimecast-MFC-AGG-ID: P-bwJeHjPPSVk2uH3a9jMQ_1747635663
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ad56222a1easo82931266b.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 23:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747635663; x=1748240463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxY7EgT/RNd0tv3+QSKlLScSTvHaTBPFXOYePAlhj1I=;
        b=VdbDhfNkFMQfXUlg7nZAViozCkgVPeABNKjSFO8zaZctyLS/WJBF4kY0hxQNuPti3G
         04ITZIncuwdrPsPCOYxwmr8Ny+hdgkWqcfqBbaD5hOZFQdFsAjUPt6mhadcZrVS/505g
         qODnuL6LeeU9ReAzckOXoEkRqdyZxzeVlQ2A5NeWxUzmKwyoAwbcPCekpfuD8h6/PLWW
         lkX3dOjlC+GysyLqMrWeg/TM7Cu9UpdVeC7SAP7g7agWlXHw/M2iVgNSwiNi0bbG7rAH
         v+9fXnJvk0qWLDSVW6YQfkE0lCOUDuy8yApKv68P9wSULOQCZ1swF4C5/MKcHn6j0CHQ
         moCw==
X-Forwarded-Encrypted: i=1; AJvYcCVz4wcq2dKQ/+ajtwzae468/6aPzaowJCUPk8ADUN4R20p+BPGzWvIXOqeZOuMoqqxOnHD/wt8U9Am/5/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyJJBtkjjYX4rcK4pvXKBkhjqi0OXd4UtxJ/V/VWpQ+WV1jvGw
	sQTM2MZvr8AoxmBa2BCdABMdqBD48Elw5oPSjsetwHqFMHqq9wZB7HOQW6PIHKZZ/lxtf6DwyE0
	4WMo0+a9Pi2H39OLzzGhvjnfn66GZaX3yvPGOQUNr8IGVXsIZQSxRGswwotpEVVx7avPAn+WF90
	Sq67wGzHTjXnJU8UJNddm2/7zk/olx7iYNyZj+CpRm
X-Gm-Gg: ASbGncsv7zWKDYmacyWVmYoBmpB+5OpycAyKSa2ozRbTpQj2FBHc4PNfGMDas0eJJVd
	xveUg+kCwqV0Pk57+sdKfbOD3+IRIUmoeE+OT5VzPzVS7Zx/j/oreAOBm6+j/BSEEBbIpL3AkSk
	vnH+k9IUX1q9m1tuxo25Xaf3g=
X-Received: by 2002:a17:907:97ca:b0:ace:f2c2:5a4 with SMTP id a640c23a62f3a-ad52d49e2c7mr1055602366b.13.1747635662897;
        Sun, 18 May 2025 23:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAmjmvIL3o1iKm123C/5o27j1Q6dvBrOmlO7D05cMeFXjqCGVtdtOGto6dJkIIUfbXvpluId+XTMClkgAgqEQ=
X-Received: by 2002:a17:907:97ca:b0:ace:f2c2:5a4 with SMTP id
 a640c23a62f3a-ad52d49e2c7mr1055600666b.13.1747635662518; Sun, 18 May 2025
 23:21:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430144651.621766-1-tglozar@redhat.com> <5c64d78a-1650-5404-c2cb-8190627d10fc@redhat.com>
In-Reply-To: <5c64d78a-1650-5404-c2cb-8190627d10fc@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Mon, 19 May 2025 08:20:50 +0200
X-Gm-Features: AX0GCFsSVtCoIj9QVehT1OHITqlahuu0UR84rYeizFCjucynqTCzS0iI1MSeYnQ
Message-ID: <CAP4=nvThhq_0vF_xGCEnT6oNhpt_JHoEuOPmy3uT7jR_0r-YbQ@mail.gmail.com>
Subject: Re: [PATCH] rtla: Define _GNU_SOURCE in timerlat_bpf.c
To: John Kacur <jkacur@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luis Goncalves <lgoncalv@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

so 17. 5. 2025 v 0:22 odes=C3=ADlatel John Kacur <jkacur@redhat.com> napsal=
:
> Question for Tomas, should we spend sometime to make this work for older
> versions of glibc without a definition of struct sched_attr?

Older versions of glibc without a definition for struct sched_attr use
the one in utils.h:

#ifndef SCHED_ATTR_SIZE_VER0
struct sched_attr {
    uint32_t size;
    uint32_t sched_policy;
    uint64_t sched_flags;
    int32_t sched_nice;
    uint32_t sched_priority;
    uint64_t sched_runtime;
    uint64_t sched_deadline;
    uint64_t sched_period;
};
#endif /* SCHED_ATTR_SIZE_VER0 */

In fact, this one works fine in timerlat_bpf.c, if you build rtla on
older glibc, it will work even without this patch. It's the glibc one
which is not defined without _GNU_SOURCE.

Tomas

