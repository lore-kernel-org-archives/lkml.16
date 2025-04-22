Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035C7201262
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316299; cv=none; b=lyaLv3Ii5QTEIy+cqyW5LfUO4anU/17UiFWwD1vOSEJogZnZ4NYovRqeYOufT1y5hXq7lKXZJzhWAAfiR6cMcAIcHrq72AIcns/mJ+LVWY9HhrBmQyb4/qdpeb8uixHfTFFOTepvbz8MxpjoIR/WoWdqPeh+r5ABSw1ecNZq6hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316299; c=relaxed/simple;
	bh=CdPcvhf/ahPmKmIC1CmEeJxNI7czNB0FGTHZ5c1mbVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kk2TJEuWaHW/QZAodOuDSR/3o9yPYtw2dkCwQ6epLkaP/uS/sSZsEda7SwXCPdZ3YQU6n3hOxnqOv6hqjGJL1FAoM06LwGA9Lw6OTfeXZUfzbBqQmRSx5AWfnWYkRKZIG3Yz+ny2NViGPkXNb+QyA3ytH8rfgnN5hxONeoJs944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvMJRwDT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvMJRwDT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745316296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CdPcvhf/ahPmKmIC1CmEeJxNI7czNB0FGTHZ5c1mbVs=;
	b=DvMJRwDTetzN9slqQeTdtJn653dVKzOtiXuGrjQGp8rljQVBPc326+XuH48sgNmLUagTBp
	pXQxhj3IYYcoAWk8w4/wjwQWZLLGH4YYFn5/PjpS2Mj9mtnDNmvIA+Vd3ZFKckot3nSBaj
	oGi8kcAOtx3b+DHaWW3viQrigGeK7dk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-PiMt-4-TOCyV6SugMz3YxQ-1; Tue, 22 Apr 2025 06:04:55 -0400
X-MC-Unique: PiMt-4-TOCyV6SugMz3YxQ-1
X-Mimecast-MFC-AGG-ID: PiMt-4-TOCyV6SugMz3YxQ_1745316294
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb23361d73so215377466b.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316294; x=1745921094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdPcvhf/ahPmKmIC1CmEeJxNI7czNB0FGTHZ5c1mbVs=;
        b=PbGusi0U5OAiZnZD8Lhj+QwDpA7NumkESWA0fEEV0hlTZOW0i2dWHq4i9EXJGH6MD+
         CfdEXP0UbrizcxZlEZ2LuX1XtzR3ng4wjXS5+MZUxVJu/Rr1mYkaPfY8affUCXoiLcAe
         10QV+63DvRexTzlmtAAn5QTSR/aSXwEL0f72WNxqKcOZ6Iq1XoCFG8ANL3MbUB0xDkOJ
         ray93bNb80NuMtYxl9KXGjXLw4vN8nec+pOudXjmRvARWdKuAgUcLah4X684u1obU+QQ
         63DzKEKuDk8WaZi0HdIyXf3gXXAc7W23c1n96wMNY5hkahPMuxqXveA0/JfE2D2f9bsT
         jv6w==
X-Forwarded-Encrypted: i=1; AJvYcCUu3vSiyLA1MeJZlahgy72F4E3QeI4VkJitHv2wcWrs7d2b0onGtxriOXPXP9AVzej1cnPMLlUwYpnehCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM9kIzq1zZpsiMvKM1010fJihFpsyrdbUBzbdkKThuCrOzP4qR
	zNRNOqhpq1YDm5CfuoTYa8c7qBPpMobxXwOe2xkd9bSQ+cKQZBGUAIdQ06pw5pcXLmNPDChHnbo
	PFYQc3Y8i1jzKPfkF4s3QPm1ywahpwxVDx/p99mdAt86WwL6xM0epvkwBu3xQy04N85Lumi+OwF
	IIdc8OzJt/fEK2o/j1jHfgTYrqtH7Xw4t6dt4i
X-Gm-Gg: ASbGncuy+YEhFe7MTzYMK/awLx3gxzGiH14W4x002NfaWYwIbK3oHN1UJWNhMKGaMRX
	FMjo3T474fbc4rZRs0vQBlxEugecb3BWs8GuuNS+bLgjyy4MDQiR7tZL/wZEx6fWhpqA=
X-Received: by 2002:a17:907:da5:b0:ac6:f5b5:36e0 with SMTP id a640c23a62f3a-acb6ee25062mr1472998766b.19.1745316294158;
        Tue, 22 Apr 2025 03:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEocv/L0nToQ7kYM3gB28uBuFBeg8ALFgkKHZKEf3amBvzaQqbbtvC9G/XmbyN3ShDIskp2cRqNYtv1TgpjpYU=
X-Received: by 2002:a17:907:da5:b0:ac6:f5b5:36e0 with SMTP id
 a640c23a62f3a-acb6ee25062mr1472995866b.19.1745316293811; Tue, 22 Apr 2025
 03:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417185757.2194541-1-costa.shul@redhat.com>
In-Reply-To: <20250417185757.2194541-1-costa.shul@redhat.com>
From: Tomas Glozar <tglozar@redhat.com>
Date: Tue, 22 Apr 2025 12:04:42 +0200
X-Gm-Features: ATxdqUHcspjbOIWY14j0F-oPXOZj_P8-oMYmXO0yXpJlZ0dsTkm6nnAn_YYmvic
Message-ID: <CAP4=nvSf=iBs-nLQj3RVm+xeQyh6_5++qeb0+M4W=0Pqzcu6bw@mail.gmail.com>
Subject: Re: [PATCH v2] rtla: Set distinctive exit value for failed tests
To: Costa Shulyupin <costa.shul@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	John Kacur <jkacur@redhat.com>, "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>, 
	Eder Zulian <ezulian@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Jan Stancek <jstancek@redhat.com>, linux-trace-kernel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=C4=8Dt 17. 4. 2025 v 20:58 odes=C3=ADlatel Costa Shulyupin
<costa.shul@redhat.com> napsal:
>
> A test is considered failed when a sample trace exceeds the threshold.
> Failed tests return the same exit code as passed tests, requiring test
> frameworks to determine the result by searching for "hit stop tracing"
> in the output.
>
> Assign a distinct exit code for failed tests to enable the use of shell
> expressions and seamless integration with testing frameworks without the
> need to parse output.
>
> Add enum type for return value.
>
> Update `make check`.
>
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>
> ---
> v2: Expanded the patch description as requested by Tomas
>

Thank you, looks good to me now.

Reviewed-by: Tomas Glozar <tglozar@redhat.com>

Tomas

