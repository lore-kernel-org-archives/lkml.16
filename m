Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D02857F1
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097282; cv=none; b=mx2P1GBHL6Oe9UgtbboWxGt9ifxw/cU6OduKp4FFriv+McPGuMGOdVbPfX+gbR4ElbAjbzLrgPyYPy15MTPn60omPNi3bDcOLat9ykhg9WpEUNcHqR2yuzeON9M9goBAakAaIfcPGs7MD4fRlNAOPq2UDGQKUx/MeLC8WDu4pfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097282; c=relaxed/simple;
	bh=6cLdgidlJv6w6KQELlVvmDxiRDMx1k7iQtBaw/5LwaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjU5q6Zd3QFF2ArGz9X9q7NCvFGYPhJSREPpiCJu1R3Fkz8+LZE/zVo7r2YH3g2jNfX41hvAILlqAhK069XJue4Tp6l2rYO2BYjKvJg2lo28VcLBNwY/VKk3ObfQT8PG9xqTbIN2domYd+CehjI20BHLDua5IOPy5USd0IcOX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ksh5lAx2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ksh5lAx2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-236377f00a1so41548935ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750097280; x=1750702080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19cd+2622jkVW4A8W/znmrcI/n7aq9QpatNtRm/ZHls=;
        b=Ksh5lAx2lxn6BFW88hu9zqfP3Km7goJaV1LC01NMVin32PgIgiB/C5ZsVLtLqSeXrg
         PPAg8Usdlux16VfqUwt1gjwa/4EGUvNiVoDPW2Cf6lxs6iq1DL7tIjuJPwGgwWRW/p4Z
         IdYVk1s0ULwLXt35UEEyZQUGIViYH8xgT28eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097280; x=1750702080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19cd+2622jkVW4A8W/znmrcI/n7aq9QpatNtRm/ZHls=;
        b=paLVtQ+l3zVIb23v7AFOXDgTfIIWvE6+P0FVVO7s1ZoHZEGC7Tlr2cTQ6GnqkXh7E0
         OLKwwPmdGKvXggEXlFS0Q4eQKROWDgWBTfpdlJT0QnnvCx2RfI85PsKVQNfQCTmrMLxd
         +fAOK6C9ypXQsH25a/161OrQwvH4fXZnYrGaILC6Zl1zkm3ondd8Rcu0eTsuh8XTxeq7
         jBVRA8P2evMdy8A7Nrnava/TzFjVJ50a5JHOPAj4bSLvCxJUypexPg+TdgV0ZQ8pt+P3
         ogrw/jwbCPwZRSfzUYNv2WOKzsJafJb4+M5tLfYH99Q0JPnszxeLaWWAVEkrZDbC8M6I
         XXFA==
X-Forwarded-Encrypted: i=1; AJvYcCVSSzqAafjqOP1CgZlwhX/m7qSFL5R641p1/WhSB9LSqXW3IZEe9RYNZO3NtL8UhUX31nXoEyyTU8NNYgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUGrjE8m0cKZnr8WYKMAUgT0qEpvODnc2w9JtgLQq/LDyQGQn
	TYQppBIBTA0sS4QQQpNiFJfdrpzEBg2PYUwYvNp++lgoiK5lpkIaOYu48VRmooDYHA==
X-Gm-Gg: ASbGncspuPXa54kTIzChLwDXDlV1SGJ+NB5+axPDfuNAajx+mL5QosBjiQIDgecHoGL
	Ni5JrW6ZhYVYINjMdbZxXRiLNIpy8eiBML9+fI4a8ENGKNzo81S0JuXEEpzDW6ndUsJBL+hMBRO
	fe25R2xRqzwYtKC+lskq0Rv/2h21FBAXiWGPdmaABUaeZPbyL+eXOD5nact34/3JdkGGLBtUNs0
	nghaPfhVgwTesFsTFmzM3RvkFbJ7TWm7FGC6ro2Sh3ivnTExHvnnTNcj9H1XOEag7lTcQBUvlwK
	TpFsj2xyKRsDXJpsL+vyz0NOifpZwOgEQ7fFuGM7wMEEcy1jx0gQYPhnwdc+V+jCS7o1TgAuDbd
	PDsyGfFEXfzI5CJEzU7L6u0I=
X-Google-Smtp-Source: AGHT+IF9wOdbzTX5SenKvPHOb9O6Gh1k3ujxoM4nMHpO2ER/DcWiRytNzZjlYy7IS2Qj18nFSYbPLA==
X-Received: by 2002:a17:903:2ac7:b0:22e:421b:49b1 with SMTP id d9443c01a7336-2366b14a654mr163999985ad.48.1750097279978;
        Mon, 16 Jun 2025 11:07:59 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:89ef:e9ef:a9e:d5b3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365e0d1444sm64124785ad.256.2025.06.16.11.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 11:07:59 -0700 (PDT)
Date: Mon, 16 Jun 2025 11:07:57 -0700
From: Brian Norris <briannorris@chromium.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Julius Werner <jwerner@chromium.org>, marcello.bauer@9elements.com,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aFBdfckccRv7Pbc6@google.com>
References: <cover.1749734094.git.michal.gorlas@9elements.com>
 <6cfb5bae79c153c54da298c396adb8a28b5e785a.1749734094.git.michal.gorlas@9elements.com>
 <aEtW3e7mwjTTvfO9@google.com>
 <aE1yNZ484DcWjR4h@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aE1yNZ484DcWjR4h@cyber-t14sg4>

On Sat, Jun 14, 2025 at 02:59:33PM +0200, Michal Gorlas wrote:
> On Thu, Jun 12, 2025 at 03:38:21PM -0700, Brian Norris wrote:
> > > +	mdelay(100);
> > 
> > Why the delay? At least use a comment to tell us. And if it's really
> > needed, use msleep(), not mdelay(). scripts/checkpatch.pl should have
> > warned you. And, please use scripts/checkpatch.pl if you aren't already
> > ;)
> > 
> 
> Long story short, SMIs on real hardware like to take longer from time to
> time, and the delay was a "safeguard". It is probably not the proper way
> to handle it, but locking here was not helpful at all, lock was released
> regardless of CPU being still in SMM context (I assume due to SMIs being
> invisible to whatever runs in ring-0). Have to admit though, that 100ms
> is a consequence of trial and error. I would actually use some on advice
> how to handle this properly.

Sorry, I don't have any advice here at the moment.

> scripts/checkpatch.pl was not complaining
> about it. It only gave me:
> 
> WARNING: quoted string split across lines
> #57: FILE: drivers/firmware/google/mm_loader.c:57:
> +		     ".return_not_changed:"
> +		     "movq	%%rcx, %[status]\n\t"
> 
> total: 0 errors, 1 warnings, 0 checks, 186 lines checked

I must have either misread or misremembered checkpatch's behavior.
Possibly both. It has various other delay-realted warnings that point
you at the kerneldoc comments for mdelay() and msleep() though, and the
mdelay() comments say:

 * Please double check, whether mdelay() is the right way to go or whether a
 * refactoring of the code is the better variant to be able to use msleep()
 * instead.

Brian
