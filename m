Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A71D14E2E2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 21:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749073623; cv=none; b=gHoq8/3ZppvytX3H2+8CJyrG4h42kd0dpW3pRhWkw8rKxaHfG+cq+e4TzrBHHuPd4nllsh5LwS4QarbRoD9CaHXR+Su/kBo+VqF3DBs9Y3Hv0btDdTGS1HwJou5tOpseKT5nYZmpfjWEjcZrWVK1NCp4COsJ6ju25Xqjxjp49QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749073623; c=relaxed/simple;
	bh=XA9XihKIsnj9/MLkUos7dtn103/ydAh2Lk/L/w5fmG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ldzA830zqFdCNTmDCwMOpCXNIwNN5bAia8HJHKPSCgUUXvitXgzmkCvB866Yl6MMBkg+oexxIPAX8537JIyb8zgRYp/7e89xkO27tOupXpKBxeRelW+t9448z5xRqwfn9ZmtFvaa3YzECCVDQCAb47fy/1SFDrJHgqn1WpEOTjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmpgX2+o; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmpgX2+o"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7086dcab64bso3682837b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749073620; x=1749678420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0PpCKpaMta1amgTiBVrzccEdgEswaJDv3Vwd4G2JXAw=;
        b=lmpgX2+ov8pj5AONlcZJTKiC9Zp4+l2hDi66hmgRF6P80Ah8kyJ+HCclIAatMstKvm
         aW/AShY8wul+3Uqrdd0wPFZOM5F4VHO5j3kMNK23fxd3RsjE/UU5tBUklsYyzF9iAJ7D
         sr2sLxKrbs/xKokaMNz+mac7Wra84GgNrzN4nSlhCzYAzTAzEkeRn8kMaZM9YidICbx0
         yEyZVurJGzrJCASnzhtELglh+bWKbYstldaw8uHUYwbfTkVEZlOmt2SJT1A7uVREmSqb
         J3xerjKoQonTgGMbVdT9rNA6Uqb3VpIqX1QEfIh44WAvKDCdhvs0vSLNeJFVG4U1qHsp
         I8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749073620; x=1749678420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PpCKpaMta1amgTiBVrzccEdgEswaJDv3Vwd4G2JXAw=;
        b=SfGboYBlAdZaMKb3n4dA4DdITJiavHTYbAVzSRHhpTHpnaIXMw8CgR5YMKUeON7BdF
         Dk9+e8kMPfc4h0eZiYfvy1SoM237PyOa33mQr2hNyldoEIVaaev3yjUSRyuSyKkkIQcb
         gEm1y65kRygYUIKfxzI3NU4/nwEJo9kYYnOsG4VJPJ3+/HWku/6uSJITMJZfCUykmJ0S
         odRXmspW+7UBTI/CLEGWqg5EBt1jXf3lqW5tpEpQIMxQ1+0UrVueSi8E3EsicUk0DTjv
         dWuiBxQHWctG8x437anIXLA5G/AAx73XliCaGLi/BwDQz0CPWhZKcUv+y/TfDaaxOBzM
         RN+w==
X-Gm-Message-State: AOJu0YykgWcz60Y2KXV1Mbx3VIv0EabhVTOv3ztu5a3ukv3lwMnPJRg5
	3knX+h4+cAYhpf10DwTQHGHwcEO5KJC9kwLPiGtHqIdj52ASQg6hw0w8
X-Gm-Gg: ASbGncsGyP2Vg+kqQ9DZ0D7LvcPPUFZGXzaOYhZzomTURWDyj1/dUkLxWbjSvYLLz32
	1kT7MfmmjsHnS6PVvch5pGt7IKNNby5VhyEzyVBWknmmPz6r082oujJWF6ixGVDOCpQwYMlly0T
	9Tg75kROsWmuFREX6v1wFBnlyKCO3Go6z5/g3cff0P48ZdvClN+MRdBoi1T2inGU/0Diyb91knn
	e4gwL2q+2o5gLmQ3COrCPyEfEsrH0G/GTNtTe5b77mhV//SdslgkNAYMSpgvYtfxvbXtaaqGzG9
	tEgzHc9Y4vmjD9wf93Zsfs5/52QxEWV+DkWDM6Vhmsk+j/fafV6r+e63q56cuWjnXDBvnov2c/l
	MbqmUrCi43Is=
X-Google-Smtp-Source: AGHT+IGi4TfH9Ic0J+1Dp6iVwMaSWrMWLP9aLsPpx+8LdekKPmkb3XOUX1tG99o9M7tPDcZ+2mbjXQ==
X-Received: by 2002:a05:690c:6285:b0:70e:2d77:3cfe with SMTP id 00721157ae682-710d99fd8f7mr59419497b3.2.1749073620483;
        Wed, 04 Jun 2025 14:47:00 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70f8ac0f42esm31529627b3.68.2025.06.04.14.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 14:46:59 -0700 (PDT)
Date: Wed, 4 Jun 2025 17:46:59 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	John Stultz <jstultz@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] bitmap: generalize node_random()
Message-ID: <aEC-04zhtWh04b_F@yury>
References: <20250604212125.25656-1-yury.norov@gmail.com>
 <20250604212125.25656-2-yury.norov@gmail.com>
 <20250604143442.37635ce63e50a7425a390c2e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604143442.37635ce63e50a7425a390c2e@linux-foundation.org>

On Wed, Jun 04, 2025 at 02:34:42PM -0700, Andrew Morton wrote:
> On Wed,  4 Jun 2025 17:21:21 -0400 Yury Norov <yury.norov@gmail.com> wrote:
> 
> > Generalize node_random and make it available to general bitmaps and
> > cpumasks users.
> 
> Seems sensible.
> 
> > --- a/lib/find_bit.c
> > +++ b/lib/find_bit.c
> >  
> > +unsigned long find_random_bit(const unsigned long *addr, unsigned long size)
> > +{
> > +	int w = bitmap_weight(addr, size);
> > +
> > +	switch (w) {
> > +	case 0:
> > +		return size;
> > +	case 1:
> > +		return find_first_bit(addr, size);
> 
> Is the `1' special case useful?  The `default' case should still work OK?

find_first_bit() is faster that find_nth_bit(), so this is a
performance optimization. See 3e061d924fe9c7b4 ("lib/nodemask: optimize
node_random for nodemask with single NUMA node").
 
> > +	default:
> > +		return find_nth_bit(addr, size, get_random_u32_below(w));
> > +	}
> > +}
> > +EXPORT_SYMBOL(find_random_bit);
> 
> Some kerneldoc, please?

Indeed, will send v2.

> Of course, the hard-coding of get_random_u32_below() might be
> unsuitable for some future potential callers but we can deal with that
> if it ever occurs.

Can you please elaborate?

Thanks,
Yury
