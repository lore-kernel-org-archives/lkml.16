Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA19121FF58
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750400794; cv=none; b=LJtPIKmFNXYcKyy1rlX72DNUkeB6sM6YYcEPUWVZqeBuEQbocYlv8CL5vtlfq7PpQLQFD86pxJvQGjfAIeyhV3oEPPZX6OFfGqqKEaTEWBel0tOJ2CCq2CyJbmo90cXKgdiXOAzEmS99Bez18KGjrkt17vsufQbeWKLjfoG+OKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750400794; c=relaxed/simple;
	bh=nfv7fyyMGgpGBArq4sCElYAOSU/nRvtwEU+IIzRH2N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dWfmkvbybQ3dJV+fJS+yZkXszc3PlYdGuzqDWQyfum7acncrKj4aEuKIP6PNKZDuBigbl0qPvl4dToCEmgStCHPIXE2PEyNcP/r5wkVg/r9bGwZvBAZUzVtomHRIF0yNBttwjbGcNkhXGvVK1g4TrGhrx3WJVPYQ3ohcsuBMzSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BR9IUD8S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BR9IUD8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750400791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YBfXFz4P2bTTX7NrGjRC7/OUsN+WdybtXffQ8S+mwq8=;
	b=BR9IUD8ShjY1FUTqTEZNpPQ8sOZlMwfHavTe8eOl/fwDKBO1cOKqrF80p40nDW6oNI6m47
	rkZNhBiCnTSXHw2vJYG6QBxM54Zibu8se1l8jw4rzmovghmKkWCHl2vRXtwYTBqkMiCKJl
	G8i8iPpVxePNWuTd9L2sl2nEbjcm04s=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-EDJ9_kkjOrWu3v0bgaLXQw-1; Fri, 20 Jun 2025 02:26:28 -0400
X-MC-Unique: EDJ9_kkjOrWu3v0bgaLXQw-1
X-Mimecast-MFC-AGG-ID: EDJ9_kkjOrWu3v0bgaLXQw_1750400788
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so2433730a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750400788; x=1751005588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBfXFz4P2bTTX7NrGjRC7/OUsN+WdybtXffQ8S+mwq8=;
        b=H3mffV8J9ft+0zlGVSEiQG6WL4OGzq7aTdc1Y0IXDZrq9B/43o/YtY/9iQH0qN7aEx
         0+TTBfHc/ee3rAjxSRNdxmIrxOUYBRKwOd0yo2/1EMnqOwp4Nn/se3ZMCdjBJJXM0kXG
         jFz0SxpzKEtZHCmiva6IEizGoQ6VorvhGZIqd2foBdQWBTbxgZPZ9q7ukJqm23conPzU
         fwa0pwmEIRRNzYcGwq5OLAH+nSoN4FpH8jggU35fBQNSsGDkMfqfwDbBn8jC/j+uTC2w
         8L9JBOV7R39pd9sP5rfZSH8chgs14v6/eBW17VEHYbkZ7T+S61nv1orIbOHzz3z/SY/r
         AK9w==
X-Forwarded-Encrypted: i=1; AJvYcCWq2hxRdyGC3Cein2V/bby/gRWMCM5xU04goAyJj6g4u22hDt0hQDAcqjs8XHqVfu840D6ePbu2k0xnVsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/w8VfQ9aeNrKX81+4RPrPVIxGSR2HNQ25whW0FSVvtnoNH0j
	aTTIiS2s85XLMi3Y3erk3WwOoBRpcyVwkRmUYfMbGT9D/vwtTTWsFodh7/6gmpmsCNUZ2C0fPx+
	GOETSCMRux3KrBqao45HtL9asbmbjO6XS9sCXXZndNI4E8tw82vDVhM4CzOoQ85qBlya2YS1yNc
	O5qMAI9WnNmoK7/w87fRqkQYNorqTFjuoGjUcJPsaG
X-Gm-Gg: ASbGncvAWNXxiGLU7CAY8fz9tiSDG6nlxcZmVx6u77yFPg0rBXXfrGGtHLNlxNSuIkD
	WS5WvtLodwKC3eMu6xx4LENHIM67Que5ttP6/KNvSZca3TQbj+rntglAmQmBsZl8lDtK+m1TK1r
	Otqw==
X-Received: by 2002:a17:90b:5685:b0:311:da03:3437 with SMTP id 98e67ed59e1d1-3159d8d8913mr2634784a91.27.1750400787915;
        Thu, 19 Jun 2025 23:26:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrfSt05c3qwaOpwK1EXvMYLkUyiY2ouZ/WY58fueqk/Z4N/CP07OyfnNOzZ6tOetmvre0TZnYjmVeJdD3H3Ao=
X-Received: by 2002:a17:90b:5685:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-3159d8d8913mr2634757a91.27.1750400787571; Thu, 19 Jun 2025
 23:26:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606115012.1331551-1-eperezma@redhat.com> <aEZ2SYAXdqffWoqk@infradead.org>
In-Reply-To: <aEZ2SYAXdqffWoqk@infradead.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 20 Jun 2025 08:25:50 +0200
X-Gm-Features: AX0GCFtY271naYjEH-Rfnmg4mrMPUjzaTJaGTs06KwU10BRf_Xo7vYV5K9mdIpc
Message-ID: <CAJaqyWek+ckdXFZdhpcXwDB7a5X=PMSktEADVpR5Nbi-n+MR0w@mail.gmail.com>
Subject: Re: [RFC 0/6] Add multiple address spaces support to VDUSE
To: Christoph Hellwig <hch@infradead.org>
Cc: jasowang@redhat.com, Yongji Xie <xieyongji@bytedance.com>, 
	Cindy Lu <lulu@redhat.com>, linux-kernel@vger.kernel.org, 
	Stefano Garzarella <sgarzare@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Maxime Coquelin <mcoqueli@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, virtualization@lists.linux.dev, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 7:51=E2=80=AFAM Christoph Hellwig <hch@infradead.org=
> wrote:
>
> Before you add new features to vduse, please remove the broken abuse of
> the DMA API first.  Without that no new feature work should go into
> this code.
>

Hi Christoph,

This code does not touch the DMA API at all. Actually, we could even
remove all the DMA code and these changes would work the same. Can't
we just continue with this series and remove the abuse of the DMA API
in parallel?

If you detect broken uses of the DMA API I've missed please let me
know and I'll be happy to remove or change them.

Thanks!

