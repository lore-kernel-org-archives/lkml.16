Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7379B20322
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 04:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738210680; cv=none; b=Pb4nVcjXFjfyYgo/Et1qi4bsRzb/bkLBcmzSsJ4SM4FC2A5nfrBRyxosp/SVk5giFquFrQSNm8v2eumEqavnVfE+FZ9OVAvp8fXiBG057h+2T/wNm/X5Efp41wjglbXLvWp+6cV34E7cmcpiDgLP3zIg0yaP4ogthP5zbAFzgEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738210680; c=relaxed/simple;
	bh=qJQun/DMi9AnD+8P5QmoFQ5vtir1JIBqeG+5Riz4R6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcLd90z2+eZvMagjRziIeQjzE4Ey2YlPzpN2UNuYW5znBlac2Dli2BtjwGpp6Jcmqr+orRKIINgCn/gMcXABkPWrbSil6psBiuJSPERAk0Bla8o10Tk9mDSZN+/LbhM7uHbPi3ySzY7GPZMN/jAP8G11k1jD8unYefTycAIDXe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Kic6haes; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Kic6haes"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2166360285dso5347855ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738210678; x=1738815478; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbVmipZxDWpo6Z9tCHBKgiSQkT0hrik0e2MSWS1/34A=;
        b=Kic6haesbrbvfaMjeQTvz9XIxOJVzsQXdfUINk33ECakjqe95HccjUf3zhkxlObcdN
         hH2NjJH9QzLnbTVif9Jc4d0F20GHNhJNrukreKaeNOrz909wDUDgTSYGXFECgDDyhKQP
         nzBfXZZTG2TKpPXb9bnAsofkI0EHO2P31cPkM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738210678; x=1738815478;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbVmipZxDWpo6Z9tCHBKgiSQkT0hrik0e2MSWS1/34A=;
        b=mxMEeBiE0F+0EjonhPJWFAKLOPcUGMr4K6KGYWzIY1tMDohqJVM+1Gu0QqjnDHQEoB
         9W0Xnb7pX5x5od5yMt68BbMXa7F2gjfTiuycTtWPd/VVbuP6mmI4/r0GFW3TZHqz02c1
         VvcjqIwdbhcKKbTVCcUv+MmjzhIILcDQw2RHr6RmO/e71vEMO6mcZg3g8EC18qQHBgBI
         +xqHerf1IVubjaU3W0wFEkB/tQ7Qi3WStCiphXNcahmIUd0K7lg6ke6yUmNWRbRFkduG
         O1HX+zqyK0iBCkBZn7ZrzPfNbSdP/giaZCPVB0UJq5mCF73/CXnNCpW5AntsIC+AwBja
         osAw==
X-Forwarded-Encrypted: i=1; AJvYcCW2saXCntldr744XsGN3UdQ0CSK7CkkEjcsYQxOzwP/5Qcu5n/tgI0tIwDCW7laz5orgPFy1PAxZ+2R/QM=@vger.kernel.org
X-Gm-Message-State: AOJu0YySp8jFcq53GwmKIOV2QhHvs00EEnv7xA+oFn2QS+JVYGEWRNOf
	JhNKhcT06SeTbcuIp5quSxxkSkqKZrrpj4F6YF8BBXu6QG1uOR3dUP/VFfdn1g==
X-Gm-Gg: ASbGncvkUP5XGe1gFB5R0cH3UCim3Ptz96IzsCqnfcha+Q0yEj88AM5jMRBs1f0U/Jy
	nrAcAbS5Pe+MFxup1tylwgzY3Z8fssr+w28/MNr+q53Fma+mPiOJeJKflZFT3cugD4JLSAsmgQG
	NEnQ7RK8s9vfvpBsdN78rt70QGWae2hYBF4vgZHJI1YiJacnshc22QfHMLaWnpXHk8L0Nw19NxB
	mMVKZgiXFgqTLd8Sso0t4tPLlnTQQa9zxO5oTW1Gq1+h0oU3lxGbo381R1VW6kcInCQFsWwnRpD
	cmn3xldcycdfyIIsyus=
X-Google-Smtp-Source: AGHT+IFWuvYasF8o3OJ1SD9TIFYaWHXUkIZ7JhULFO0j2t+mr7YlRb+gTsnOG52HV2sksPQRlfE5yg==
X-Received: by 2002:a05:6a20:729d:b0:1e3:e680:8c91 with SMTP id adf61e73a8af0-1ed7a6b7a42mr10596235637.31.1738210678676;
        Wed, 29 Jan 2025 20:17:58 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:d794:9e7a:5186:857e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe6427548sm370906b3a.60.2025.01.29.20.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 20:17:58 -0800 (PST)
Date: Thu, 30 Jan 2025 13:17:53 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCHv1 4/6] zsmalloc: introduce new object mapping API
Message-ID: <tc37ejw7blw4gglcrlik6faak24zml5pszqba3gam5ttbf4u3n@5jxgj5m7kump>
References: <20250129064853.2210753-1-senozhatsky@chromium.org>
 <20250129064853.2210753-5-senozhatsky@chromium.org>
 <Z5pl6OOVcb_rsgTC@google.com>
 <4slya4kbgfvkvlgkvwep2cgghs233lfhfpctfrrgvho4fpgzwr@cjp643bd4ml6>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4slya4kbgfvkvlgkvwep2cgghs233lfhfpctfrrgvho4fpgzwr@cjp643bd4ml6>

On (25/01/30 12:21), Sergey Senozhatsky wrote:
> [..]
> > > +	if (off + class->size <= PAGE_SIZE) {
> > > +		/* this object is contained entirely within a page */
> > > +		void *dst = kmap_local_zpdesc(zpdesc);
> > > +
> > > +		if (!ZsHugePage(zspage))
> > > +			off += ZS_HANDLE_SIZE;
> > > +		memcpy(dst + off, handle_mem, mem_len);
> > > +		kunmap_local(dst);
> > > +	} else {
> > > +		size_t sizes[2];
> > > +
> > > +		/* this object spans two pages */
> > > +		off += ZS_HANDLE_SIZE;
> > 
> > Are huge pages always stored in a single page? If yes, can we just do
> > this before the if block for both cases:
> 
> Yes.
> 
> > if (!ZsHugePage(zspage))
> > 	off += ZS_HANDLE_SIZE;
> 
> Looks good.

Ah, now I see why I didn't do it.  off += ZS_HANDLE_SIZE before
if (off + size <= PAGE_SIZE) messes it up.
