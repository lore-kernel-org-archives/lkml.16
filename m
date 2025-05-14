Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766151C862D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747243386; cv=none; b=t+6jAkvPP9eBNRLSVXSiXk1YNckinrPR922b19cldp+qEgHBZ4ynDTQWB5MXWhualEtfAkxNg6owWz00dFq4Z8wagb/S1Qofez0OefY4v2HvcRoSTyT4CFcmGtmXmMKJh/4y00lP9u3ATjXo8zWHTi6cmcoXedp/Cr6lk3iwFlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747243386; c=relaxed/simple;
	bh=X4L9dP5e9Ou7Dht7qWV02nDeywOY9NeHjoxT0uRXMD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfmEpjae7eGMXMWvQRR3Vmm8zRH//4ntS2NkkCaF+MI3Eb+GlSBiOHG3LfG+IYDd/sy6GcoXwAVQMHFicp29WfjWsQYBc9jO+BRRo5NK/1JdZ1Aptb6Q22OkfRMETmVHLJu4vcwo92V7YI+Oy+hlgARCiFnO6SwJJ0SbGHc5La0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wzb6dnkv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wzb6dnkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747243383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/oElXM1ODP5fr3xuW+gv4HSACPr/9xzmW3Yqp8drdpo=;
	b=Wzb6dnkvshPX3LPuhz2sJ78Rf+3Veu3xUMehp18KYCYgvqUJWCx/gQk/YF2vSSZqv8QFtQ
	G6hMVUk8Thsem5Py4zs6OCrRDM7NhJAFHR3HquMNhbMRr9R4OrgZI2w+FRcUGIESTXGcWA
	dGTEBeb7R95gkW2appzzJK+SmHcyC44=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-xnWetLSCOmmM4S6x-Iiqeg-1; Wed, 14 May 2025 13:23:02 -0400
X-MC-Unique: xnWetLSCOmmM4S6x-Iiqeg-1
X-Mimecast-MFC-AGG-ID: xnWetLSCOmmM4S6x-Iiqeg_1747243382
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c790dc38b4so22010985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747243381; x=1747848181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oElXM1ODP5fr3xuW+gv4HSACPr/9xzmW3Yqp8drdpo=;
        b=KJ4+h3gy+CB/RDtXJ6vq22tzZrWP7Fa4mHWqvX0lpBzyvGo2RESqGkGm5aK9mmGq6W
         C18LRTp1SKXfk2Sgb0vvUcWnBPb/BArXnjBR9GVXmR2B5GXjoHpYbAYToRDSxBZX9Egd
         iFHCQZkLEhQKHK5ElH0et5NyMfbTfjEQ4ieXCwspzU9iQZdUBP7QztZGolHT/8Jf0vEw
         70RcfYxhQfosQrDU6sPIz8/h42iPuLwlCfYseLt5dP6M3l0d6q9L5AwVQquAOo10BCgz
         t2sDMva6mvr1Lbr5Ee+IV632+vcSJQczeBE7VmCXZng4bBSozyHiA3IVPZMngu7MMouZ
         ezZA==
X-Forwarded-Encrypted: i=1; AJvYcCUj3v8t6EyRN99P4L3aN3GzkXwqxiDs2C2gJa3wDf8EbtxNVii8KvEIwCdajRKt1F42fQD6pEXKH9aBVkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL752l7gR9yBHt/VSQrriYYLSW+RkBDC0AO1RThpHbMUIQmi/B
	+VogswqWqRw2AtpDfD4A43DjPHpS8cydv/e0W6nwATVnn6VGfWzYcGeZq+y/c8/iD5Z5rO6N7J2
	mWG+aGXBfofETURE58E2skI4DvpWeq1hLtfoOvaqjn+AH1f9iv0thU/RHkNq/AS+H+zwUsw==
X-Gm-Gg: ASbGncvvIglN78gYWh96S+jU0RQ7LizwzwhgaaXGRFLGCKLIovEyLKyWL02A22cBHS+
	101LREmzeZ19Upgv9S3aJeN+F+dVggLMK7M7BTC7hXMx3uN8aR8w+M6JdZkA3UDhVhuFkJ3ymNq
	l4uDpGIqXAjaAAtNclGEdZorslekk2RTQhybeDkNkIRcMrHRR95ul8YC5Zdp9dvVkjLPWIgETrf
	UgW45ma2rxVxTTOtYFlPKqIVvmd/c7LYj+/n4h4HyHE8CU4YQuowsxz0Fz6crK+3w6vqBcivLZe
	X/4=
X-Received: by 2002:a05:620a:4256:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7cd39e0b62bmr46161785a.23.1747243381553;
        Wed, 14 May 2025 10:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTGZ9NJoeSdVbaYm/syrhmviXCEheXcLINvfYcLnmeElUJOkvK5KSz5hTibErul8dXI9ys5g==
X-Received: by 2002:a05:620a:4256:b0:7c5:afc9:5144 with SMTP id af79cd13be357-7cd39e0b62bmr46158985a.23.1747243381236;
        Wed, 14 May 2025 10:23:01 -0700 (PDT)
Received: from x1.local ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fe9909sm877643285a.113.2025.05.14.10.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:23:00 -0700 (PDT)
Date: Wed, 14 May 2025 13:22:49 -0400
From: Peter Xu <peterx@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Kyle Huey <me@kylehuey.com>, linux-mm@kvack.org,
	Robert O'Callahan <robert@ocallahan.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH 2/2] UFFDIO_API.2const: Add an entry for UFFDIO_MOVE
Message-ID: <aCTRaebpHZjVJHut@x1.local>
References: <20250512171922.356408-1-peterx@redhat.com>
 <20250512171922.356408-3-peterx@redhat.com>
 <sxwdi5itwngdermj4w77ycwgyes4x7yyfl7v66mxj7co4xm6xm@27aqjwxvh4qk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sxwdi5itwngdermj4w77ycwgyes4x7yyfl7v66mxj7co4xm6xm@27aqjwxvh4qk>

On Wed, May 14, 2025 at 05:02:57PM +0200, Alejandro Colomar wrote:
> Hi Peter,
> 
> On Mon, May 12, 2025 at 01:19:22PM -0400, Peter Xu wrote:
> > Add the entry for UFFDIO_MOVE in UFFDIO_API.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> 
> Should we add the following tag?
> 
> Fixes: d7dec35a3b19 (2025-05-01; "man/man2/ioctl_userfaultfd.2, man/man2const/UFFDIO_MOVE.2const: Document UFFDIO_MOVE")

Sure.

> 
> Also, I think the subject should mention UFFD_FEATURE_MOVE, or at least
> somewhere in the commit message.

I'll rename the subject to:

  UFFDIO_API.2const: Add an entry for UFFDIO_FEATURE_MOVE

I didn't know we need Fixes for man pages.  I'll also attach a fixes for
the first patch for commit a252b3345 ("ioctl_userfaultfd.2: Describe
two-step feature handshake").

Thanks,

-- 
Peter Xu

