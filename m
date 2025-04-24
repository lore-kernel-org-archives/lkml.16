Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EFC290BB5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519966; cv=none; b=hqswuHlk8xLmjCbxE8c0/lKYWPMdH3bVkatSDDIBShRA59LpgwnZWtplSezgaNYsKICUbilHAiOBSGrsvI6JqbJpbUwZipdS/2gbuMcRDcHMaCxsZfqGpZitGtZXL4LeQYtMl9qvYKi6jfO9kJ4UxNVLSNe6/+IOv20JEIcFX58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519966; c=relaxed/simple;
	bh=HHntclg02aE3QvSZCu0iP1oyCiCoXRfU5bg0zfetSmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F540OiEv+SXMMrGD0J8V2GJEQ2047s0MM5XkAsee66LUrx8JJliAaDetn3plhO6mQ7JM9yrYevED4HVwdK9R8vpVPSRUUttznS7ozGLsCxVFtj/6gRsDPJQvDS/LfUVAK/W+dwPFXHOpQUzK0fOnzXvopn8S9DD1VsY8/3rJ0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xTlqli5D; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xTlqli5D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d5f10e1aaso8835e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745519962; x=1746124762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHntclg02aE3QvSZCu0iP1oyCiCoXRfU5bg0zfetSmM=;
        b=xTlqli5Dv3jbHjEnY18jBp+nHvKem/VrQOc7/NYM73+kUVUnzm762ywoeY0gjiJbb3
         cawy8+IeC20/eltoiEi/iWAejD0n+fer0PjaHHeJaL8yP8zHwXTrTgbRsB2pRV71+ZqD
         /tcr3vrO0WpXrLk0TMVtVMvKDbhVh+qVqMmLhkhmbVZ0PbYq0xqd9IUw6A7Ub45DsKoz
         I4lOA7hLgqIcIlp8T3Xvkwyun7Dh89IBzC2fwuIGrg9olnRvvRVewj/YhfxkezE7dD6w
         brbX7mrICZXr8UcMWMfynrOLT0uNdcLHptIf/bqalT2+d/6YKGJ2H7f4KkR0SS03IDa1
         LxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519962; x=1746124762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HHntclg02aE3QvSZCu0iP1oyCiCoXRfU5bg0zfetSmM=;
        b=WpAOWJh2L+id+hAfCY+PuaU5WxZAsarf9vDd0eMui+pqAs/HgPBo4pSJkVuc8WLaWA
         PrtRNkuL40Tf+TkBYuD0Yq452+j7PCwuzlVnBaNbkLAWELzyEdQAt2GclYs/VKkbX1di
         pVBEnj5oOxE/O9w/RkXNsbqJHsyAozABaQYNa1Fi6Jjz9beYULU9B5xGCQEoonVcXO/z
         /KZYrVnqKSK/WQO5JRmHpvd4UPQuuz84Ef7EonaghsPl0ciUYxDALFwc5ucZjh7A5FDa
         77A8JJyg2NyNMkNzkBYaxwSRSovK+mzHUJ4B3I5guxDY6IKoSdvibtTfJqkOZARhtriz
         /JsA==
X-Forwarded-Encrypted: i=1; AJvYcCWQMW9zMdwaSANoBq57bAUVlV3uUeyXOBMmAaG4qRK18QU2CjpAHcw8zRyyUOgjnnAbFob9gAzlIWbFZMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF3OJKfSA0NH/8WGe6kX2qll3uQPzZoFwRmaPNPjrgIGhEmB02
	Uz0a6GpbEMfCRi6RlzRfLxCyBtunBVnIvCYc8I49kZLVZlk71G/gje4qVOOd/JpGC7A5Ujpk5B9
	0rKXYHB2RKi8ORdDBKpl86c8ddLsv5wTdD4OU
X-Gm-Gg: ASbGncsqBaVJ1Z8JO55Z+T0FUW/33pq0+IZITVfVvx+/2vNq1GyohVbmzlLA9bFkhCA
	kqEEdZ6sTGBmbsoiV8GW30r2CZiVUBYll7haKwUReyDuksT3bk2kixsLNTRtkoEn/lz2u583mdm
	JX5JDMI0vSjkW7+8aYBLlDbxjhp8oARdYILVQQhdf0Z3KTaeuEg50T
X-Google-Smtp-Source: AGHT+IEgclIazfJ+afZgykhy/OrxVQxEpacPbvwDO8iTY2TatSu4aC5rLgtRnnAAjK8iOSfQX717oIm/EvLzW6yrBVI=
X-Received: by 2002:a05:600c:3d8a:b0:43d:5b3a:18cc with SMTP id
 5b1f17b1804b1-440a40e281bmr190475e9.2.1745519961980; Thu, 24 Apr 2025
 11:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418221254.112433-1-hramamurthy@google.com>
 <d3e40052-0d23-4f9e-87b1-4b71164cfa13@linux.dev> <CAG-FcCN-a_v33_d_+qLSqVy+heACB5JcXtiBXP63Q1DyZU+5vw@mail.gmail.com>
 <99b52c22-c797-4291-92ad-39eaf041ae8c@linux.dev> <20250423155636.32162f85@kernel.org>
In-Reply-To: <20250423155636.32162f85@kernel.org>
From: Ziwei Xiao <ziweixiao@google.com>
Date: Thu, 24 Apr 2025 11:39:10 -0700
X-Gm-Features: ATxdqUHYUp1bexngYV8CrablkfZbm2LmJaq8icVIQy-Bgdr5dvFjF-MM_4ZrPrA
Message-ID: <CAG-FcCNwOUQc2gRB83Opf47K0HdbHdw1aCo+aQEBQ5FVqrixAg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/6] gve: Add Rx HW timestamping support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, jeroendb@google.com, 
	andrew+netdev@lunn.ch, willemb@google.com, pkaligineedi@google.com, 
	yyd@google.com, joshwash@google.com, shailend@google.com, linux@treblig.org, 
	thostet@google.com, jfraker@google.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Vadim and Jakub for the suggestions. Will send the timestamp
patch series with PTP device together.

On Wed, Apr 23, 2025 at 3:56=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed, 23 Apr 2025 22:06:22 +0100 Vadim Fedorenko wrote:
> > It looks like it's better to have PTP device ready first
>
> Agreed. Or perhaps it will all fit in one series?
> --
> pw-bot: cr
