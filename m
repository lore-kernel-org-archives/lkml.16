Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB90026BD90
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270279; cv=none; b=Nen6ho8HsNFJaF0x9i5Y4xXMx486TfplYTeUFryq+iiIkItOt/zV0EStKRIiAjOYmUGxgfaSdHX5NUno3/47+WuZn/OTXrS0FCB2nQ5ISAKNQJc6gnNSEzyepI6VqtsEhzYnR1oisA55HMxto/YzOhoB9AD6PG+RKaVPr5MYa8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270279; c=relaxed/simple;
	bh=228N+TTbA+zIcna5fmkdxbamDR8vWO3y3IGeKqwyG28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjxHZ/r1B+E0f5nk3mVkG+B8ZkK49IcH2D9HEjqpbS8ydI8TcLplUXh5koiQ5YUrTb/NvSD6IF0PUyi2Tb5xuicA39J86CwBJjv81fULLFcWdQwOc2zfC5uUsHTRLTVH4DeAhPDgXpdTbOi6XXBqFN8dCSEALlGuotqlrQAfwzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMVHxUbM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMVHxUbM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439473da55aso11583115e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739270276; x=1739875076; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPih6RmxhXX44zZpcRb42vvRRosF1lmIcSHcvUi6Vl8=;
        b=bMVHxUbMd26KWMMabAJZ3JLLo3vFTbv8klnk8j9upQITiBprcqGJxvLiJ1yT5sZiZw
         cc2LwDh5ztMVygEFIXmtGbYcJm+HnNCeHAKY2IZSuKvHcC/8TH25YYek3yKeRv1Y5mhF
         mf4Wgt1Gtpz5Hf7eC/Gzr5NobxcfUn5zfFVFeotFj2pCioKfGsKkLcrz29bJ79Zsu7ly
         uKRI6wj9jrHGz66j6KGq5MCMTLdxMsKC5S3GpTGY/CDnR5dsQKGep2cwzANPJ92ub3fp
         9wpfzaIWheDnWYVOPd3Afxr9AAnfuBpCqRIn/eXPfmxG+fyObooL07WLDjaFum3UXc9n
         T3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739270276; x=1739875076;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uPih6RmxhXX44zZpcRb42vvRRosF1lmIcSHcvUi6Vl8=;
        b=CsKySF7AlfdwhvEU4Fy8LmJAEOVPnWdRz8nb1b1MFaPqOFg7iI5AXPeafgud3W/+gj
         64CgXqpbSceT3KVsj8HYN5ydeEcVn5IFYctB+EOQo9NvbcgjQPR4/sVOyqxI8QDS2kK6
         YyNdrDeWDjsKjSl15GJtH5ru4k4mPYPpjpVjDDKk8v95NFj40ztq9FfWyhKZCg9Y0RiV
         ngapcigV/TRiV2zxHSBgsx9w1RG3juYQ30acYXzcNGMbbVkCqKOmaGeGnEEE2pOdoTgR
         2wuKJNqgce3cOGJcaaUUB2VcHoj/gE92Xzdfuzc1MhLCzfKW8NZ5LiDhh+PWhQsHCQn8
         sIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWuGd4F/7ErRlnaUHQFkUwl45mGGnAHt0raVtt5UxRNqVZgP//bhASPk027KC8/azkWUQVDZJQtpRH0aUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAiLz274U9mY2d4iHMlpZSLsZMBpUne1TeM0qGib6NWtUwXjks
	+8URItMREXgz0RChtLxSC+n/VdgBZRgwcWtHZ+skdhFuDER3lBkT
X-Gm-Gg: ASbGncsc0GBE1pdGVg9qffS+PqUginFq96CZk9Y5PfcjStjsp6OqXLcqTRHEm7Cy9hz
	eUqe/t6rC012yI5PuXzfnxTZsm2mMZXimK3dGnHwkBsAuBKk6S5fCY0YLacf3z6A67Y5j2l9arM
	Jd6VXSrixNoFV/hzcf8v2m32MFaQZd63P6oxaEQ/nMpwBTPQReU+BIO2oqjiiInzlRvOh5GpbqY
	DrkHP2qWxDe7k0qVMwo4A6QdGQssxfFnMtiI9fmexHlqRVZHbsDvuZ/YmpHG2TpEzH7+BxyWknL
	+dc/JCxaqC4q7g==
X-Google-Smtp-Source: AGHT+IHUAG1gQUToW8Ldg3EJ+gI5dVHjjkhF63AvJE2KskYLs9RhNP26TOiIKV8k+wycWw6OVBDjoA==
X-Received: by 2002:a05:600c:a45:b0:434:a923:9310 with SMTP id 5b1f17b1804b1-439249913a5mr150762675e9.15.1739270275823;
        Tue, 11 Feb 2025 02:37:55 -0800 (PST)
Received: from fedora ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm11826410f8f.5.2025.02.11.02.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:37:55 -0800 (PST)
Date: Tue, 11 Feb 2025 11:37:53 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/13] drm/vkms: Extract vkms_connector header
Message-ID: <Z6sogfnUBv0dVln3@fedora>
References: <20250129110059.12199-1-jose.exposito89@gmail.com>
 <20250129110059.12199-2-jose.exposito89@gmail.com>
 <Z5uDGhcvNIGDwEr-@louis-chauvet-laptop>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5uDGhcvNIGDwEr-@louis-chauvet-laptop>

Hi Louis,

First of all, thanks a lot for the review.

I applied all changes you suggested and, especially thanks to the
iterators you suggested, the code is way cleaner and simpler now.

I'll send v2 in a bit, but first I'll comment on some of your
reviews to clarify some porints:

On Thu, Jan 30, 2025 at 02:48:10PM +0100, Louis Chauvet wrote:
> On 29/01/25 - 12:00, José Expósito wrote:
> > Up until now, the logic to manage connectors was in vkms_output.c.
> > 
> > Since more options will be added to connectors in the future, extract
> > the code to its own file.
> > 
> > Refactor, no functional changes.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> Non blocking issue: Do you think it is possible to split this in two 
> different commits: one to create vkms_connector.h/c and one to create 
> struct vkms_connector?

Done, I split this patch in 2 in v2.

> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> [...]
