Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECDC21ABD5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746050092; cv=none; b=YYzjy8yH/5cizTO0QlV8VCke7TPCpHrKfoPHdywuAWukj06J13Bl35li4FZQlsHTU+AuN/ih652ZOVs++q94pPsOz1i1X+vSCvzxQyTH193kWzrNLDDPwRF4J/ZZeLTiXhMsqdGIVXdwPr06PjD7aE3IW6D2GaUFTYw2LhwO7Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746050092; c=relaxed/simple;
	bh=05YuOZ9u2Ax2071mGFpU77j1rtYz0lEQ4c6l0mKCvLI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToNcoJIvuJ9FSI2oCagNUqMZ3Wg1L+6V4o1o99ZouYmm/W8ogMBL3xoB3sw3uQl96sZLHvIp4/NBr1/8dcdL0pFehywBagU6tlbA/EDCIFgF6McK3anSJn6YDTmhr/S4JX+Vyc/JpELlpUVWgxDHvUaUydDwXomcwdmZvAjQOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCP+tu6q; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCP+tu6q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so209256f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746050088; x=1746654888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYwPY9LcGQn9xEedkkJssMJR8SpMgX9yYbZ9xU2Kw1Q=;
        b=ZCP+tu6qnA3hz7Wow14D5RbRV6FFA5m6dkjSHz7USv0aBbXMqIChdj8dIdBSWjo6KA
         nIkJQcZHGFfG7ympVi+H8Ojp/a58z01uh0zLZXft+3h/dC/vn1IH4AApIJkdDRv/QTNM
         GMUuxPm9X9sKFARflgfeYrDrgU007IrjNkxleUIJgzHXoraekBk5z5rcqrfMBdG0LqFN
         HcoY+Zdj430ctAY7451TmY/HfKW+ieu8TKC4RrXZgjysrzMPQXmN8tpVgORdP+pCa0Kk
         XP7Klc/UCTLMi83KYZZnN9nstayBWMBdjlEX/EVz4r4bYp/50Pm1k3gZB4ViKM+19R/l
         US3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746050088; x=1746654888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYwPY9LcGQn9xEedkkJssMJR8SpMgX9yYbZ9xU2Kw1Q=;
        b=F4A6+zWXK/x7guuw+q6bk+v/8WTZwJjL6N3HdtzAOgBw5uKX2Q9zseWlQxUvHEezfV
         wIvt4hcuY/L1cIiy07Wc1JW791et/sjzq8Bd8Y0xqLlVkDSJqGvhUFTPS90wVNwdnlin
         6H3U6fLdmMOt+lN+2QYN8vMD/lYSO73CqttZfzXPcKcaFqECYXZiIgMM2reRwCct8dJR
         4pB+IXTHQ4Q04f8mtsWTYfD4W/1o7rREI4vDsMNXMQhkoPzniioZRWGQ8Co/pjKoAQTT
         jKWpHKPbt4m4O2aqP+HI9tnmafL0WWNF9yp83gMQv86iIO75NcS5zdyyguUJ7g2x1Tjn
         MzRA==
X-Forwarded-Encrypted: i=1; AJvYcCUw0pxA8Hbb+R5H34q69IDSZ8sHx/3omKoFswBRKRmln9aR+LtOsNg1nzNa6Lf1dhxeLbREVesl3BNMsIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw6/AFkutqiZ5iNJOwcTuORhHHTToDuAFu2/eJuMTtXI2/eYNs
	5I/3pakVdRLZtHa9+kLQrUdSEBhzwCJxwISMaD9QKwxO7kxM4uDR
X-Gm-Gg: ASbGncvY8pDP4r4COwtvx4P0kZxevrybxe3ZDa8FtDcETtmpmcPY97Knt8Fpr8bKJ52
	5IDUsdMPlp/O58qHzei+u9v1L4EUUizSB9YQ4ivEd2r8a6lQYauPeF3uLKy5YXISBlRz4eB6mDF
	GsUchD26iHVaioFcGti4Hhwy+gjfftTEzRfsCZ6X19yQvNX7UYcl/Nziy6VqSaKTPuYwjQSiGST
	O0uwJywYYi6ZOCZDWIM18eUO1MhvaTTrOYbitl4QTz27iz9TqbgTEyxC8OVCn342h54DR6snlMv
	8MW7r5wsF+pK+k7ixKBm07DLXO13VmZRFChZAxoo99/vncBClCwwwdUpRhJnTKjYXGdlzY0rZi9
	VpuI=
X-Google-Smtp-Source: AGHT+IHjAqJ79pkkDz5zjru+SMdLoVTLndQi/ZIga0WuF+YpJuQH2nBdUTfVQHtyHM6WEGGcBqs6ow==
X-Received: by 2002:a05:6000:2401:b0:391:4674:b10f with SMTP id ffacd0b85a97d-3a08ff50b88mr3633952f8f.36.1746050087874;
        Wed, 30 Apr 2025 14:54:47 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8d60asm18388090f8f.18.2025.04.30.14.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 14:54:47 -0700 (PDT)
Date: Wed, 30 Apr 2025 22:54:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>, Arnd
 Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mateusz =?UTF-8?B?Sm/FhGN6eWs=?=
 <mat.jonczyk@o2.pl>, Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
Message-ID: <20250430225442.7b3b471f@pumpkin>
In-Reply-To: <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org>
	<aAyiganPp_UsNlnZ@gmail.com>
	<d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com>
	<CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 26 Apr 2025 12:24:37 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 26 Apr 2025 at 11:59, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > Right. With the current set of features, CMOV is almost the
> > same as 686. My reasoning was that support for CMOV has a
> > very clear definition, with the instruction either being
> > available or not.  
> 
> Yeah, I don't think there's any reason to make CMOV a reason to drop support.
> 
> It has questionable performance impact - I doubt anybody can measure
> it - and the "maintenance burden" is basically a single compiler flag.

There is also the user/kernel address check for copy_to/from_user (etc).

The 'cmov' version used for 64bit is nice and succinct (as well as being
speculative execution safe).
Unlike the 'sbb' version it doesn't rely on the first access being to
the first address of the buffer (or page 0 not being mapped).

But I'd guess that the kernel ought to have a boot time test for some
of these instructions - so at least it fails gracefully.
Which would required compiling some early code without cmov.

	David
