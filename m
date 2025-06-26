Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 003FD287252
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947161; cv=none; b=Xcz1yzh323daws8gxQZYczRnN2sD7Q4Ts/TnpxPVMw4hM8bNRpAX6JWsv+pS4PBLa6u6rfRHhzYEdJQZ9t2f3/0v37NxhWDGLerFZ6GrAvLCEF31c6SQbbI2RqjvbQ0V4VCYeClQ9H25xxUa1R2+vmrqAxJiDY0u8YifWwRskgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947161; c=relaxed/simple;
	bh=Gm0QvRQ56/WnIZBm/9nzNwHOV1L4gwQUfItzCF/YTfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPJ6nS6Ln/ueU5um9254GkUIg8Wt0HhpsWh6QxrhoDo6Gxjv9IGEZsqaa+8hmFyEjjI/alwq1+4hL6KUigz+xx3PZA0WpknpGhN99pxr7dc1WwzoXzL1uNwsaPWHYrQxW+kek+JRnpgrVVfX+uztAxZgIdxeKE1cxo125YamO/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TKouxU2m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TKouxU2m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750947159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Uyv3ec/MzV1Xj5BxdUYnd2bT62N51ZiEh/oZ2I6KB5A=;
	b=TKouxU2m2Nm39hgn4TR23zZzDQyLYWfkdKWiNvzPsDCoinFK/l6MH3zCN6RimoKj1pBXxc
	BBmv81yAPra3A92geaCsjh2flfBY7kZr/xca7O65N0XBQ36EVtntINk5PtXOPYP+eru4ZL
	dFYQOfETulzhr7z6BoMK0l1dtTCQiY8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-GW_QD9wFNzG2jJnlr5Nsnw-1; Thu, 26 Jun 2025 10:12:37 -0400
X-MC-Unique: GW_QD9wFNzG2jJnlr5Nsnw-1
X-Mimecast-MFC-AGG-ID: GW_QD9wFNzG2jJnlr5Nsnw_1750947157
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabd295d12so21789916d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947157; x=1751551957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uyv3ec/MzV1Xj5BxdUYnd2bT62N51ZiEh/oZ2I6KB5A=;
        b=B+r/vzXtv1FI2jw2cEnlF5TNsORy4ZXZOuJ4pfWKvO9HO0CpphXAvCLYZfRRUL2Twl
         j0DgG71DxRfCV0+AAkE+Wpa262ptwgeDTI2iohOzpLg6StL9EACaHFbFnkUvac91Md2D
         pQo6HctweRdfa3r7I0nvE69psciHobhytvUCq0V8md3X35dOLCMnUdJB+jvI5r5xBgBy
         A2TesuEZbu2/qsmxZWO2chPrChpJyMhnX6/vBsZvmdpLABNEQeS6Gi4cfVsWjQSg2XcT
         76a+dpj5jS31B7gS6OnocNlOuMjj6UP/Gcn99TbgO67u7lULUw/TZjKvtHxc62nkPkg1
         o2FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ497FguL9XItqoyhy2vTJlpa2tMTLdFleF2aQ4fGPqXpLnlCqOc3tHyp4hhFZYcxlIEODISqbm5JrAnA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx81sjljAs5yil8unijINbOGBWDqS/hXhyqPiH4d8uFLGv1TEOs
	7MbfX9iVDIr3wy3OHIIZ2JUnN8i/sQus7m1rImZ1m4wI1NccU9nvOwJo180l1DhS5AcJ63RP+sK
	trS1Fp3dRIqvIAaG71XiwYXmf5zPnNzJFx20w6cUdSm8dOC6CmxmgmAdPTtl+EpxGp193BBB2/Q
	==
X-Gm-Gg: ASbGncv7apAnkg8xWC3lMNxhOey+bWAVQRAk+Shhfqo84H5KVKXykvmzYdJjncvUzqc
	tdC7RaycaWYMgwH/o0CVYaIZoMuS0VdyZGMuG06o3vA0+5VTaGv8cBO0gLiuF7yisQDRGBLJ+7w
	iwTlc8WqJ8BOd/qra0E3LKIh+6k7FfAURe57bx5KAkHtrwsNks9rYxhmd2fX8VCWf1pPyyHn0Di
	2t0iS1kV7vn2nf7peyVwRaWEr16KoNFQHpiN6/zXG4fPQVvG2IX+kKvX6ygl111lFSrvWgPPj4Q
	tYq8dUT00/yBDA==
X-Received: by 2002:a05:6214:2e8f:b0:6fe:a2ae:42e5 with SMTP id 6a1803df08f44-6fea2ae4380mr21124696d6.10.1750947156787;
        Thu, 26 Jun 2025 07:12:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbe7Skv30mDpVi8c1OdB5mSvqSMPQwOwLopFeMM35fdchH46//7qD0uq5v92SEA4/Y3rt+Jw==
X-Received: by 2002:a05:6214:2e8f:b0:6fe:a2ae:42e5 with SMTP id 6a1803df08f44-6fea2ae4380mr21124336d6.10.1750947156263;
        Thu, 26 Jun 2025 07:12:36 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd773151dbsm7672826d6.115.2025.06.26.07.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:12:35 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:12:33 -0400
From: Peter Xu <peterx@redhat.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>
Cc: Brendan Jackman <jackmanb@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, shuah@kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v5 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
Message-ID: <aF1VURZrk4vGlOQL@x1.local>
References: <20250501163827.2598-1-ujwal.kundur@gmail.com>
 <20250616100406.2853-1-ujwal.kundur@gmail.com>
 <20250616172618.0609127a8b1e406d4c228d24@linux-foundation.org>
 <aFGPVPDKGLOIEucg@x1.local>
 <aFGkVh-rs2ZqcL6g@x1.local>
 <DAPKLM86IC4F.1MCOR35P2D9VV@google.com>
 <CALkFLLK2-SCPZz9tOseFp4Ry77GYg+LKik0SEbjK6LuanDyyKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALkFLLK2-SCPZz9tOseFp4Ry77GYg+LKik0SEbjK6LuanDyyKw@mail.gmail.com>

On Thu, Jun 26, 2025 at 10:52:39AM +0530, Ujwal Kundur wrote:
> > Ujwal, can you reproduce these issues and have a look?
> 
> > The script I mentioned in that other mail should help with this
> 
> Sorry about the delay, I'll try to reproduce this over the weekend and
> send a v6 over.
> Will rebase on Peter's patch [1] if it's been applied to mm-new already.
> 
> [1] https://lore.kernel.org/all/20250620190342.1780170-1-peterx@redhat.com/

Hi, Ujwal,

Thanks for being considerate.

I copied you in the other series only as a FYI. Ideally the test changes
should run the same before/after that series applied.  Meanwhile, no
conflict expected between the two, hence no worry on the order to land.

-- 
Peter Xu

