Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CC27CB04
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613897; cv=none; b=nmYeRHKYLVrA327XMrBR54lhRM29om/Ual5Nx77zlBcMWJgLEwri2YE3In95h7gxMNVLNQzJhWTM586I+4zyZnzY73DFevgeN5I3VAPvTTGr/E9x74gxlFaWJVDgEWR0yvK35T2z/MLyGbFlWddt9yG3+Vjtqoj9og4/62LuBss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613897; c=relaxed/simple;
	bh=3K1sd4yIuQoltmtm6gOcpuZlUjkPbijpd9gUOFmGIDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tbYxAEOx7GKOkzVsmO1VwYCXFo58WOnjqEglAtPQC/Im+O5fRd6ppqFLmYOjF9jpcyEpugOZzLAuPmSFw0UThucFbihvxyxKSQtXFnz4PH5zB1LWkyZyAkRsVClktMziTmjp+RYts792Y61xhkTuW5UtVi4o/yqwR6DiS2hH38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DazL03ji; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DazL03ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751613894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t3pqzuEU6lUelyChR2FMIfflTZdeMGcMf4whExnv6QE=;
	b=DazL03jinUVbULnxVLZPyhZTlvEFzU01z4hpIWhaGH4jppL6eTYSmR6MVGQougu6qCKqaK
	a54kL1hVCSZy7zvwegVHq+oGs4X1nU8Xu5d8on7cxamhlQp3VPDlgt5/jKOpLla4yuwmTl
	pfv78s3mzDQc4d9rBmx0wRU4lW9+hT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-404-68gUFKwDP9-C8TuuliOwtA-1; Fri, 04 Jul 2025 03:24:52 -0400
X-MC-Unique: 68gUFKwDP9-C8TuuliOwtA-1
X-Mimecast-MFC-AGG-ID: 68gUFKwDP9-C8TuuliOwtA_1751613891
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d1fso3291035e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 00:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751613891; x=1752218691;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3pqzuEU6lUelyChR2FMIfflTZdeMGcMf4whExnv6QE=;
        b=sir1H4vLJZP2Ey9dP7gXIWfC/LYZYxoHxQe9wAE3j/NsGYbr3X3naACSHH2kVl+BcL
         Jv/grM6NQ48pX/ZGBbY/+DsLGXOR3TLvbjOzfmT8mNTbX8jgx3nNi4OgEqLQA0Wr6y9d
         8og5ClL+J5otiysOS86ijuAPmi49Doxq3Lq6pEuBgjqFYXo8csQh02Z0ufjo2vn5vuJt
         /cB0XvSHuzw2Sju9g5uacCiZO9fIpcey7olAM638I3fP3AAD1ZdOntmm1o2DPJJbugIi
         OLwbUvfKgTvihkbaKCWOI2NL4JYhhA4feNHoas1PDz5mrzzK+2qn9bbzF5Q0SW4GRgeH
         xo2g==
X-Forwarded-Encrypted: i=1; AJvYcCXmnfBUO3jUNlLP1yB2iKImAdpx6PuNsmmcuvdjYDhBF5WjtaUPMVM37GcDfTS+7ExX+/RVfjUaNnJ+O4M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6g6FD+UyjfQxmjlDamdSuDjfDFtd0u4ADVjUk4/7pbtafx3P
	HnIJE0m6JpMjor4u1OEMuT05ly4oQfP63AiAek6smE0rrkxKOePKVWUts29VkW5iYFLQAaQwgNb
	rHLdtwz4EZ8rzlSzzBS4EB0YNKYAFYlq1oA9UVtsOHh0vhVXi0bFdD/f54B0TXmjxCQ==
X-Gm-Gg: ASbGncsGpYUWhC6iYLtKo/QhNMupBY+sFFoYvv3b7YnXQ7Q/S3WreIhGWz3N2uxMh5x
	BN2wYBDuZuMbLcy56RNl5paohag//oxE7UUxW7VWKdc2FHZf1eTzwSpzf15mT0wNXwPlk/jKwPO
	CYez3zUkQYI145euEJQ6qRQueqH/C7cwIxaw4UjXZ2Hnl6IOPWyzt1B3M50Bzwxtzcxt63esLXI
	AudC4eubfKu+x+1xhWufiEcwyLH8nHIV5bCs47ByIwzxti2AWXAS3yi8nnPPvTVchDXOzZqODFf
	EXq1xrx3mrEdM+y8/YLCOBUVadoFisrAung6uXffif2gse990GdELDNsH8675oLHU8euO5kguuM
	pXR31
X-Received: by 2002:a05:600c:6819:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-454b3116294mr11787345e9.11.1751613891311;
        Fri, 04 Jul 2025 00:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFawS16UWK8Cei2oxJozQ2xoL7ukg0sVAQfQL7XriXZDXrLUvcPvBSiszYsy2Vr1Z8y0Jkzg==
X-Received: by 2002:a05:600c:6819:b0:43b:ce36:7574 with SMTP id 5b1f17b1804b1-454b3116294mr11787045e9.11.1751613890789;
        Fri, 04 Jul 2025 00:24:50 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bea4a9sm46322055e9.37.2025.07.04.00.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:24:50 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/simpledrm: Use of_reserved_mem_region_to_resource()
 for "memory-region"
In-Reply-To: <20250703183447.2073902-1-robh@kernel.org>
References: <20250703183447.2073902-1-robh@kernel.org>
Date: Fri, 04 Jul 2025 08:24:49 +0100
Message-ID: <87plegju4e.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rob Herring (Arm)" <robh@kernel.org> writes:

Hello Rob,

> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

