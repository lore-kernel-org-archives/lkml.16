Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997912BD586
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749652241; cv=none; b=K1A0gm81KLhuX4SAC8SCiNxk5SNqqkN8MZlzMzGITn6/CaGODHnoGDlnkah81n1zMag1dQTu8L+J/IztLSnnpXERjNW+BCt+m0yAD7tmMQKR8VxUnPZJ8EnyGQP10wyXdwy+gpwLfhpKpDqjQWOmhEaOZL/jlxUWnlp+q2Txl9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749652241; c=relaxed/simple;
	bh=aFmitG4GGLZP2RIysH0rFcAxmrewRQ4O1r7kUt3WQyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbYmp0/ZAOnJiW5mdrSVlK4DBy6UKtsWsakuJk+mLh7RVl4nFOl7Cvs897FgY6mSLU+h0IyvJ+Y4epjcr3M+dwXMIbjueYZuq9f78lFznzbLGm+qPCeN5xbEhKBk+gYgRibVZDcHqhSBoK4xzDxjK1UABQLoHgFReMBgApSssys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7a+jsUm; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7a+jsUm"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4091180d3e5so2204466b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749652238; x=1750257038; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enQPgRCJmFw7LiR6Wl3Xr1k68TxIo9wg2ECQ7hgm09c=;
        b=W7a+jsUmWKMq8brHIpXffaEVBhXj/u7qebeLNYNkrrsgqTmy5oQhZkaDlUKM499buF
         ObDC6EjNkIZ6Vm8Y7mLLynA0TevuBVcLDTUXEcHZYx7SNS4JDdG+jMIcpxmbBg87Ta6I
         Uw6MaGOp95aB17yEBdOkACR3j4I1qGXL3FCCBdKo45QOAktgW6PIH77QT9soDgesByjA
         aNXryQwvhLnm6Ug10/f9au4uKRLAMHQGnPO+As0aiV51ZEwqHOuLvdPXcKlq3L+xZnAF
         JjxIJPlmOGhn5LP1WCTmj/zEUxzTydUdd9bx7XcYUMn2rbZbOgdRXs4DvBIG5cnvbiWR
         U+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749652238; x=1750257038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enQPgRCJmFw7LiR6Wl3Xr1k68TxIo9wg2ECQ7hgm09c=;
        b=pAYDI5M03lSPk0HhLPlULd02P5F1PJuiqmwBTPD1Z+X3WYU9u5FQPgNUPdrguFhvvN
         Zepic4LcmQXHnGstpQy96gPmWlTpWwMsPg/QdPFrXGpl6Ytetwpkok8NfdtNOrUWKxTa
         j6qNsDI3fwRUGz/aLLpPG9Loa4uEmk/lSVq4DzvyFvjxxYcjwc8ihnEWQIqFuiAHPRRc
         lL9+BPQGXLJGlnKh9HLo6UJZj7JvBn+Vw8sk3MgDRPmkffhF+e4jnNmTG/jia3MYcdOA
         NGoX6Eif1vxw+eswSBPYdvwVn+shdJ0SPqzK2jxSLKfSMh7otF7M/Ywln76iM+NPj4lM
         k5vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSyopPyqHeNllSMJGZHvHY7KD0BgOdz5q/nsVwW1G6f1GmV7oGpcKt1fwwUW3sVXeKI/8uslw0lQtAHV8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZufM21ZO6yQaQ/yzF+vmiYHuT2T2OgAMQL4udL29k8xeZEItm
	2F26KWh2zfBGTyCbe6egCU5A67yF9+5T68qVez5oYp3VVPNSSsDLldpp3im0Rw==
X-Gm-Gg: ASbGncvmLcx8Ce3vMU4i/Lhxp7rgGignar+9GNE+By/n4nMByepov20eOe82OI2x/CA
	k3Aw+kUFutcOXvQpEIKZ/hA9jfyVnrI1FwB4MzrHy3MKI1ojSLy2Zax50wQ9ClqofLFstEag8+j
	NnAJQJkcmBwrebI2pRc3uybIBbqNShgtzSeaefPMy03QTai4R/2TGnIGXhGM7nxpRLUKknbmcbH
	5BpPe0eTNFrYWIA4qe6EJGNxdea8nvWY7dVvke3+gtf2pkv3Lbg2BYRaCwkwIUlenmSgt7FG/80
	7Qd+Go0PkCebcx/fZa+Bz7fYbEvp09YNQGusoObPd40hDDM/QZizG5EMXgjygw==
X-Google-Smtp-Source: AGHT+IEnHE0kT21oftfwsFW+OjfecHVoI/p6aDA1O1Vjub713TCN6oc5+A6aaLJ5zxZu4lw4K5Xq3Q==
X-Received: by 2002:a05:6a21:999a:b0:1f5:8eec:e517 with SMTP id adf61e73a8af0-21f8660015bmr5487664637.9.1749652227533;
        Wed, 11 Jun 2025 07:30:27 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2f5f782594sm8558433a12.60.2025.06.11.07.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 07:30:27 -0700 (PDT)
Date: Wed, 11 Jun 2025 10:30:24 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: jstultz@google.com, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, yurynorov@gmail.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v3] clocksource: Replace loop within
 clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Message-ID: <aEmTAMc9stMWMMI-@yury>
References: <20250611073608.2049793-1-richard120310@gmail.com>
 <aEltbEpA7US9h8qN@yury>
 <aEmSH50geb-2qTBb@vaxr-BM6660-BM6360>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEmSH50geb-2qTBb@vaxr-BM6660-BM6360>

On Wed, Jun 11, 2025 at 10:26:39PM +0800, I Hsin Cheng wrote:
> line
> In-Reply-To: <aEltbEpA7US9h8qN@yury>
> Status: O
> Content-Length: 5191
> Lines: 144
> 
> On Wed, Jun 11, 2025 at 07:50:04AM -0400, Yury Norov wrote:
> > On Wed, Jun 11, 2025 at 03:36:08PM +0800, I Hsin Cheng wrote:

> Hi Yury,
> 
> Thanks for your suggestions !
> 
> > 1. sftacc is known to be 32. Comparing against 0 is useless.
> > 2. Just use __fls():
> >         if (tmp)
> >                 sftacc -=__fls(tmp) + 1;
> > 
> 
> No problem, I'll fix them up in the next version.
> Just wondering the reason to use __fls() directly, is it because we're
> sure that the value of "tmp" will definitely fall into
> small_const_nbits() case in find_last_bit() ? 

That's because tmp is not a bitmap. It's u64.
