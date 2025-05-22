Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393883010C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747921425; cv=none; b=RXFxJzMfB+iC2cZhZObNiZVWTCJ6Ooah1sjhguGpaRw0668c1uBRxzlbHyz2pbrNEQGi+qrhRs38/8w50S3czQOarYyzDy7Ipij4Eglt6yDuoBZ6sWTxtVL9fmLVCttJFFQNzgrTrkc9v0qPVxMUu+qjYB5VOG8UpX63Ru/QS5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747921425; c=relaxed/simple;
	bh=A+7j37YM8CLHuf4M8TE4bEC4Qqh65RglyR9XdNxjmCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QuSZHDNHIKfNeNjav/CoKt6bzMDTZ3ybZNE6rItbpmMcsvt6qxMdW5VlPaVBZVWrrZNCxloW5PGhYRJNI2dyigNtO1wE9dAgEx9pcRNrFzrykXXnj0DCZiZIVp6mNjWePSU68Cxl40hWujWR1g7smO+UCVR1lo8Z/w6QWAG2gME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X9yn/Ryx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X9yn/Ryx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747921423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ki4PGz9MoGwpt59sUdcbcs5elurUJNkygM0DwmzXjgk=;
	b=X9yn/RyxSldV4tN6YPeDi0wWxqu13sfSzg2uc/zjY2nUmJx/syafFrRj6iGzTUZWzI2YON
	RINhXSz6iRSDQTtne00DSGOrcYV0Ht28TWKQxdADW9fGSyloxTCNsUMP/yo+u9XuXTKjJz
	eFWHXsPIFdJxJIWiHD5SxBnsqN6xE5E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-GDpTC-M3PDaAAJiQhQ8krQ-1; Thu, 22 May 2025 09:43:42 -0400
X-MC-Unique: GDpTC-M3PDaAAJiQhQ8krQ-1
X-Mimecast-MFC-AGG-ID: GDpTC-M3PDaAAJiQhQ8krQ_1747921421
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac79e4764e5so757606266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747921421; x=1748526221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ki4PGz9MoGwpt59sUdcbcs5elurUJNkygM0DwmzXjgk=;
        b=QWzqzqKUoYY0V+MnWuDjIgvKjDGHvGcz3UIHV9ZzICFwzVOW33B/sXiJ0lVpCNfucz
         GjsAveouyU0SIY7nn4kn+9/HyK8MIxIVbNAJ4l4tJSU64wHUNYgrPVN25e+jYqlU5ajc
         lAi5MErLcpTS7rMrDzmfQ4qZsbNQQ8kO5NVEqEsIo1BK+HAR/RDMRJ3KzXq7WMkvUOCV
         S809LBwHmCErlpiksheJeRuDP5/5WYpbs5KwUTQ4+ePhAzF9sl2QGOkf1VRR1LWNjFUh
         j2Xf/dTVNQBVca9ZAB5z0irZNNNQYsbkPPr7/ayfoz7uxnLL6fMY/VLkiFF6OHi1+M59
         33NA==
X-Forwarded-Encrypted: i=1; AJvYcCW9gSrKG/w4KVDQc0mJnhPQ/mMbJZw5zny3X2nUFm9o+Tx9mAZIrBorcsjwBcKBZXLAKZNT2y/HY45H8O0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvxc7K+mm8nE+Fk+mIdU9PDhgZL0qAdav118r3zbvgFskTHceR
	9a73znvJKzMYO9+bmQXgIJHDArdmVpTMQOuCih0s2T4ukgtmSz+QKKaANWS1SJJBLGl7QwnS2wj
	3JWIhs5VEaWcHur+M2XrrKuz2Y1QkQcikJ9v6Sn6+apDAz6dkikNRq3va3uA0dtIwJfbmrbFOst
	KSdInBL0ksJyBFpF7Rr2Gdoi4M55xlrOtS4rFTNuzh
X-Gm-Gg: ASbGncsV9KaXnlMw6680OpqtTPXwnRT1WWgGIkCjQTWmvjXvzb5kaZ6+NoI0UDu4wS0
	dvuBgNiOqcZnbWGJJSQ/9PZalYqBKVzrTEFO6WITVxAupJcunpBtFatosUJ9qwIQU8AE=
X-Received: by 2002:a17:907:d0c:b0:ad2:24e5:27c9 with SMTP id a640c23a62f3a-ad536dce79fmr1894668666b.44.1747921420841;
        Thu, 22 May 2025 06:43:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFApJlcKWeBv+I/SZdgDY/l7/3GBrRjoB1/uHm1DvRsrdhnUNEd+PLOFGC7roeOx4o5yrW+a52CQxM2LWr2/4k=
X-Received: by 2002:a17:907:d0c:b0:ad2:24e5:27c9 with SMTP id
 a640c23a62f3a-ad536dce79fmr1894667766b.44.1747921420478; Thu, 22 May 2025
 06:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515162133.29507-1-costa.shul@redhat.com>
In-Reply-To: <20250515162133.29507-1-costa.shul@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Thu, 22 May 2025 15:43:28 +0200
X-Gm-Features: AX0GCFt-etal4vUs3hVowp4ARgqzJUvnCHub4_m7VLxKDnkkY-r7AMpHp_xdrdw
Message-ID: <CAP4=nvR06=j8WpNbHay60_f3bNtYD+0yHdvzEnm3O+7oT6BZww@mail.gmail.com>
Subject: Re: [PATCH v3] rtla: Set distinctive exit value for failed tests
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jonathan Corbet <corbet@lwn.net>, John Kacur <jkacur@redhat.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
	Eder Zulian <ezulian@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Gabriele Monaco <gmonaco@redhat.com>, Jan Stancek <jstancek@redhat.com>, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 15. 5. 2025 v 18:35 odes=C3=ADlatel Costa Shulyupin
<costa.shul@redhat.com> napsal:
>
> Add documentation
> - update Documentation/tools/rtla/common_appendix.rst.
>   add SPDX-License-Identifier
>   add section 'EXIT STATUS'
> - include common_appendix.rst into
>   Documentation/tools/rtla/rtla-timerlat-hist.rst - the only file of
>   rtla-*.rst still without common_appendix.rst.

Those are three distinct changes that should be in three separate
Documentation patches, and not together with the code change.

Tomas

