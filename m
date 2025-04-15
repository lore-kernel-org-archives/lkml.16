Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80386275105
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701873; cv=none; b=HP4gVXAQzzAVK3kxmRL9nO+0y/yWqGkhnrMPDj0NH3aI7fXhWlbcrsODGUtmFAgHZ5UvxFhE4y8Rnpt9GhX442nRHcu3+NwMvzOItvGNh6h3LvRAiarhy3H0C1Z4N/Fe1qR0RgyOcEj65ngwbWOxOQ210cSL7gM22JBtqt23bas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701873; c=relaxed/simple;
	bh=au6q9Tu2dUAZ4s8DofqOWQ5I3CRvyrypPI+uPHden64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+eB6h56yzqdK3u1pjbDjvFS2kg/bdXUVNZk8YC1ZnaI9gJ++mCEDMZkne0rf/hFGxXSgWhv1eWlYuJtFQPpd0aIA0sgrdhzZPtMMtcG9HTPOHGlkSlz/+LFE8Sv4y9r45fTSfvOdKWEmhSo1jp3aADOgeOYAk5kEukbWXdeWVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KsjWuSGo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KsjWuSGo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2295d78b433so54071965ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744701871; x=1745306671; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qu8kD86AXuKJZy4HIshJdpK/xBfLXn4kgIsnyKTrc7I=;
        b=KsjWuSGoO9RHeu2vKaj1xW+H/U8w7dKS3afNqRRriNwFwtNQJSlewIoS4K4K8cvcR3
         PPC4u47YwHLP+ttjIkjPXR49f0xxYtfEm+oDRIFH/o+aAqQCMht+n93oVq0HOG8IoJOI
         kQMJtNubdalcQww90VDwzM2T+u0JNZMBHNXtESx6sHf7lKOGGpXDXYbZGM9/GsYeh6o4
         1xUYVoxGiGmtDs6+ARdXkLc+bzFw8Gh2ZWBPUkZY8MigaYsZLcEdtx3/h+asHSRLXI7U
         XR2XkHRf1IqiXZeOWjxD73kTywlZB/yQeTdRXdbJOmX1uyFO0gLsMBS+2aHHJ4cx+CM9
         TVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701871; x=1745306671;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qu8kD86AXuKJZy4HIshJdpK/xBfLXn4kgIsnyKTrc7I=;
        b=LGGPOgNsKarlUNjly/u6JGB5kwv2SY3yGFrTE51XetM6mJARPBx9iA/J04760m44Fq
         Wm7PNCITFXF/4p0P+MUsT4hfL/GhxVhkWyjn8oUTzMllO0mT03mR9CpOPLVzkBSVJ8zO
         SkfKe9L1z6weZ7r2KT3TlcRJYC7cNom2FI01Rs062fyF/52WWO6j9hCGa3QMwhvQskvr
         hnBDwb98fulnuhiydgUNYOI/0CodL1K0ahJabESDJvWXAKVio3dHQ0FyoMx+rOG4zhub
         pyoVvtvVDFfrgUrGDhrsYyJHpg4r3L3um80hB3CeuJgwjvBwC33gPH9ib3/+eUq6jbGx
         q6vg==
X-Forwarded-Encrypted: i=1; AJvYcCUMCrhH1hLaV0pVsRJrHqY/2RTgYyhBsNXq00qR3JvRxe9F02d0Nnyu46PPMOdLzu6gn58FU6mhMM4rmy8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9i+1tkaRRltYknEdGV1NI+O6dT0CUFSKgZ0NGtfalkicpK6pn
	uOH/9vhiBimRoP5+AM4CARVqPcsaMWbTiqibmjKFUO4WQidNNzg8QsbMti55Bg==
X-Gm-Gg: ASbGncvKdQDe+gYAWeGGqwERGh3HhEriyOmaYszqH2nJ0BFubt31tUa2wfgQW6HEfFE
	4PgkYHKW6NncS13/ibLXtsPvsizwaR5lE9J//xvYnPpQWReCPKX9IXcmM2/OD1DlKVNQWNVZqGp
	LS15YPjEqoOE6OgjRnYHhRqPpbUsoz+dI7wauQRT6jqAYIv05tsnEU9Re4wEEjCOlUGyPwCPtf/
	UMJ5mXfsEzrmpZPMLyv5UbcZvArEq29X9Y6iKuOSw0u4zJHug2ze2GCpw6akdmxD+pZvMS5kDKG
	i5R5wDh/+NpscHUUDcrYK5N15NQmV2cR5Tf3mNE7f8MRFfvSRQ==
X-Google-Smtp-Source: AGHT+IGdiWkQMkaHTsiVcI4z3x+X4VzKPfKH5y/vEQa4WjmVHEMVpLvUUGLit5iWi2cXVeIM/nOIpA==
X-Received: by 2002:a17:903:41c2:b0:224:3db:a296 with SMTP id d9443c01a7336-22bea49e9e4mr204502495ad.2.1744701870704;
        Tue, 15 Apr 2025 00:24:30 -0700 (PDT)
Received: from thinkpad ([120.60.71.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c993a7sm110714665ad.146.2025.04.15.00.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:24:30 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:54:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, stable@vger.kernel.org, 
	Youssef Samir <quic_yabdulra@quicinc.com>
Subject: Re: [PATCH] bus: mhi: ep: Update read pointer only after buffer is
 written
Message-ID: <74azjehrnf57ruhrkcqonuakm2iro5ehdvtudolcbrlrcjfvj4@ylqmug3wqdhs>
References: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250409-rp_fix-v1-1-8cf1fa22ed28@quicinc.com>

On Wed, Apr 09, 2025 at 04:17:43PM +0530, Sumit Kumar wrote:
> Inside mhi_ep_ring_add_element, the read pointer (rd_offset) is updated
> before the buffer is written, potentially causing race conditions where
> the host sees an updated read pointer before the buffer is actually
> written. Updating rd_offset prematurely can lead to the host accessing
> an uninitialized or incomplete element, resulting in data corruption.
> 
> Invoke the buffer write before updating rd_offset to ensure the element
> is fully written before signaling its availability.
> 

Hmm. I was under assumption that the host wouldn't access the rd_offset before
raising the interrupt.

But anyway, the fix looks legitimate irrespective of that.

> Fixes: bbdcba57a1a2 ("bus: mhi: ep: Add support for ring management")
> cc: stable@vger.kernel.org
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Sumit Kumar <quic_sumk@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> ---
>  drivers/bus/mhi/ep/ring.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/ring.c b/drivers/bus/mhi/ep/ring.c
> index aeb53b2c34a8cd859393529d0c8860462bc687ed..26357ee68dee984d70ae5bf39f8f09f2cbcafe30 100644
> --- a/drivers/bus/mhi/ep/ring.c
> +++ b/drivers/bus/mhi/ep/ring.c
> @@ -131,19 +131,23 @@ int mhi_ep_ring_add_element(struct mhi_ep_ring *ring, struct mhi_ring_element *e
>  	}
>  
>  	old_offset = ring->rd_offset;
> -	mhi_ep_ring_inc_index(ring);
>  
>  	dev_dbg(dev, "Adding an element to ring at offset (%zu)\n", ring->rd_offset);
> +	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> +	buf_info.dev_addr = el;
> +	buf_info.size = sizeof(*el);
> +
> +	ret = mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	if (ret)
> +		return ret;
> +
> +	mhi_ep_ring_inc_index(ring);
>  
>  	/* Update rp in ring context */
>  	rp = cpu_to_le64(ring->rd_offset * sizeof(*el) + ring->rbase);
>  	memcpy_toio((void __iomem *) &ring->ring_ctx->generic.rp, &rp, sizeof(u64));
>  
> -	buf_info.host_addr = ring->rbase + (old_offset * sizeof(*el));
> -	buf_info.dev_addr = el;
> -	buf_info.size = sizeof(*el);
> -
> -	return mhi_cntrl->write_sync(mhi_cntrl, &buf_info);
> +	return ret;
>  }
>  
>  void mhi_ep_ring_init(struct mhi_ep_ring *ring, enum mhi_ep_ring_type type, u32 id)
> 
> ---
> base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
> change-id: 20250328-rp_fix-d7ebc18bc3be
> 
> Best regards,
> -- 
> Sumit Kumar <quic_sumk@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
