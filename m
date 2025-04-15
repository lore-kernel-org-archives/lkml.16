Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAC2535D8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730955; cv=none; b=h+XILnmoJhTIMWqsDfFE/em9/hl+qU8/QyZasYKLlvPX6XGB7Oy7rK0PVsQ7FIEMxbRc5b2swKhTyUIlRG4zqmHwJUq2Pih5N5zr/gwwDdngkax3K6uDtLHQgYy8KG+iq6xoDLdh4opZs+cys1gUuySVkHJ1gKYpobasIIxCMxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730955; c=relaxed/simple;
	bh=245uPgAjq0DuLIQiQTeNyrixfMQkPyaf8ibRk1MsNlU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaxoMvGk063mzOxkv4+CpoLTx6NBU907JT5O/0liYI/KiFzbblNFZ5Am/o85A3BgR8lxH7YWvDv9looGKE2gyLAPSGVNcs6fm54CmQ/fR/YtfUmaZv04IbfmlBY5Fs1uZ81YogJD4/GRiWCjo4MV5W2lY8k+sOZPAtG5ttJnzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuU3HVPK; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuU3HVPK"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5499d2134e8so6887254e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744730951; x=1745335751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jJkk1wWpcI9CJBo5G8AdG0tP+GsY23btFhNdL79cMeM=;
        b=MuU3HVPKA6mHqAUkAf5d2HhdtvUm/DHR/3xI7I9frhDIjk4rGJ+rlaUQFK4+e1e6Xf
         hezk6NIkehzAgfpTKEr5ei4nOyC7vQpM+sO9E0JkOApd4668/fwyW++QxaMeYy1fIjNu
         03azdcbYWzcNSHs8oSLOnN/Id396CvZHJNtFSZ70GpNjW/7EdSxr1tBZz/D8CusCwzwY
         rrcvBJawAIaKU1hnQ83XciHOhAdpIZZvB3ZiwihQHrv/4UbonoXaTmye7jc0TTNj5a/H
         TkfstON19D2XtGzR65W8mEq/mUTnFhCK7RBZ6ySonhNWBMTXrgad9rJm82L4S8+ydbw7
         Qm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744730951; x=1745335751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jJkk1wWpcI9CJBo5G8AdG0tP+GsY23btFhNdL79cMeM=;
        b=w+3PfQ3Y8ExVC5esb1jy0FozmwCin7vJQ5XfUrw23HmZZp1GKiK0GAWXg40P59euM7
         sw2kCU1s+dKr4RtqSuXPtokywscmGaN4RW6indnTTDTcSKhYtokKQoua5Nk5xsPV/2eS
         0TK88sJZhCagWgCB7GyrQ4KNdeHdyhhLmZTT4eAW4iMIRCGeeOUtBJl0FHpnsbByokN/
         hb+2na/blUeemjLGmPJAaqyoxlCUvFjbXRDMAcE5tXJNDkeIkngeMPi9mN9JDFpDMqMI
         PW4b82n5P+X9AH1z7528rQyjCqjZIGTEffhj0clOuP8oueb8H21jqP/bcSZ88BHUHE55
         JTYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJNMZcEHxKe6rzQVOIt8SvkOD6GFsj+zB2S8y8RESPBTrIbHyRxMqm/YF1e9+Oxe2IXwO80pGAzQz4np8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6NGbjhyVh10AusH6zTNBexlltSbnf46I8T70+I39zJFvD6KM
	FqdQAjm3TwpfJyA5RStPQQWH0Y3Fgh+zm8ip70rltj6gc7IxbIoR
X-Gm-Gg: ASbGncuaZzXMy0nhqjsXuYlPf9Gv4atGCyWX8CljEgts1D0/PtP3vx+R0b0azVUE3w2
	RAPgdqwoDIxSQY90hdjW3Hy1nl5aJDjSQ7r2OlW7SwgsaqjoC0ykh7gX6ddCSAI3vpbZkGkSw8e
	uKUUCZ32g/AkYdSquBylCGrVDaanf14ExCyhGBJTicNFmJucfXFEAysXqzxJZEhBCTwjZDHh9Mi
	nO5SBBfe/gPMZzY7ooyaVJEbFjD2gM+OjC4IbA+REmJy/vdDBLgLpYejyXmfqlG4Nhfw8UP1EzK
	SIey+FCMe/a2Q97vBhsUWtrCpDrjjsgtjkdTK9WY1wZktbgeq7mqfTpWZDWXjDjtN43f
X-Google-Smtp-Source: AGHT+IGthHCiCnSTOdaKz2P1xlRe4YqTl43iv6lmCdhGP8sdcumtlSnQXLNds04x4aSalCSuTBLeJA==
X-Received: by 2002:a05:6512:12c9:b0:549:916b:e665 with SMTP id 2adb3069b0e04-54d4528d0ecmr4338831e87.1.1744730951219;
        Tue, 15 Apr 2025 08:29:11 -0700 (PDT)
Received: from pc636 (host-90-233-217-52.mobileonline.telia.com. [90.233.217.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d24277esm1459193e87.103.2025.04.15.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 08:29:10 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 15 Apr 2025 17:29:08 +0200
To: Baoquan He <bhe@redhat.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, urezki@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] mm/vmalloc.c: code cleanup and improvements
Message-ID: <Z_57RKPhHm24kMRu@pc636>
References: <20250415023952.27850-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415023952.27850-1-bhe@redhat.com>

On Tue, Apr 15, 2025 at 10:39:47AM +0800, Baoquan He wrote:
> These were made from code inspection in mm/vmalloc.c.
> 
> Baoquan He (5):
>   mm/vmalloc.c: change purge_ndoes as local static variable
>   mm/vmalloc.c: find the vmap of vmap_nodes in reverse order
>   mm/vmalloc.c: optimize code in decay_va_pool_node() a little bit
>   mm/vmalloc: optimize function vm_unmap_aliases()
>   mm/vmalloc.c: return explicit error value in alloc_vmap_area()
> 
>  mm/vmalloc.c | 68 +++++++++++++++++++++++++---------------------------
>  1 file changed, 32 insertions(+), 36 deletions(-)
> 
> -- 
> 2.41.0
> 
I have review some patches, the rest i will check tomorrow!

--
Uladzislau Rezki
