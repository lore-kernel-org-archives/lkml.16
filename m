Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942820C02E
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747501178; cv=none; b=pWIWa2R/H7uSUA9ntbgF/MyQd5Mvi9BMoih0eBiv+oC11R9zYtfct41C44JdKV+QxeoJeKUSP/eX1Rh7CLUSGxIbxiaFVrndlgtimoxeyUoK04qxYZnXPCFdJWd65tPSuMdyfcNtjKk/NuVg4D7SYrslf6gKJzS1m59FfMWGUws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747501178; c=relaxed/simple;
	bh=U5yxisXAEUHH4RBsfza59ndxttUe5VuQdxmns5/zD64=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EJSKLmmmi6ZMSi+AW5s/bcdr4iipktMvJo+gwLQiH+ziyZ5+DNN4EdCEkrUQp4gEYEIM2FYNuA4EvWV3iEY4yeE2nx3+RiUqADIW8xzUyJl5bPvGLYUdUcSjS+3j5fdxwPaHxtr2G3qxxuw3bZ7Ng55pkEojrzL+3Xb+rubiVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAG6r1S/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAG6r1S/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so33372215e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747501174; x=1748105974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovMyBWjI/BS7sXNtLK5yGRXq7L8WpzdvShUStKOaPr0=;
        b=gAG6r1S/9vXBg+HCSFB+rp6p+/8Dsxv0m2yoycv3GIxhhyBQ9Sqy9OVR+8fSGVlIRF
         4Ss64WEHhlNObzReEXdR/Cur1fKSY833ThcSG9OQYhMcvXX3e3oX9CZSGu10aZqKgeNd
         xxx/UZvmr5wxYeFd4KTJjXbJlhbhtaUP1x+aF/bUKZTqcaG33jGJbq8nLf26xi4zUvMi
         pKgNIMwjkso3+YZAI4UZ0p9DTrxR0L+qupHZb8cDKrLfkXvGJ8WkaLfilhp2iYe6XeMz
         IiCi6hkw+RUmtL0Q0ya4Uv1eMutzCX4WM59lNnkF+wgjSLPPlro7tPog+MG5FxX6q3q3
         tYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747501174; x=1748105974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovMyBWjI/BS7sXNtLK5yGRXq7L8WpzdvShUStKOaPr0=;
        b=hSozHQcozZU3p1ld8nVTB7u29O/vF9AutLcRBLmY/L+gVdufa8N7mkPUwTSd2ShYoO
         oQRWZbNSib/ldJun0eTqMBT18RbK6cQtAvl+Fu/kIeqr/YgeinprVYOwCUrliWjaDGep
         Zc7K3+/UlX5gjrkuzY1K4MHEU21F9dHTr/nnhZyB0RPP7Ij2vfEuRjxKoh6g8IJc4DcA
         +mIt9OC4gmqOBigBPUA8tvgEjEPpJ2DkjX5paupo6Z9vMBbEGwKmha4osE18HMxJrzBP
         kXCkZ48wJgl0HJuMvbB80wQ/4SGK2nSWV1an/tNKCR/U5ELnKkYCuVaAY7KpTEXIRbZb
         7DmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLJKAfFHMBVHDZvx1WX9v960fmFFfgY3tcKBeHVsE0QWGAlI2fWZS+a5co0zw2GnSM7V9KfuLrc3hX6ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbhUvQH9v/K4olSzR/RTKUMsKMmXQIS0dqDiHwGrnp87AiwMBE
	JZlqhOERgSOY1K0gY4xPxkpeyits6dlg77c8ojYreEdOdqJC8G+c1OwE
X-Gm-Gg: ASbGncshQVURlE4QbfPzBEGVhFOLHR/QuWYh3Hu4J2EEEIUREVk9JApsmIva7lRTnoD
	7dtAVgq0fuZICyXQ9u3Y15Djj0ArYt/wzMEJg1M17L8o4ruCjMrwBKEvIxWVGef6cjxSF3NE/hm
	WZI5DB+PBQsHJRgMrDukv7smnAuLV9KR2b95xAUNsKSMRLSPNOlHAU+YDnFSQ43CF3SebOVRs+M
	4E26zvG4icSVG2lHQWDF1/YvA+9CpDrNcys7NBMCXPpW6g2N7UPXv7rKYSpGj5xx+xVmciVsVUg
	5JRDSSRTNJUn/V1ruttu3V1rRrz9ntPsIeJeUQsWvdMStsmVQFHsoslQsC/vLg7XpjyEas6lnMK
	EBCVqBCdp6BRgj3vGfvVpz2hc
X-Google-Smtp-Source: AGHT+IE+1EqF9qjc/huzQ4si1Erz+/CNkHMxr0eOubKHx2Q3y+JCQ1KAn6ZMHC+jbuqH7UpEiy6i8A==
X-Received: by 2002:a05:600c:8288:b0:442:e9ec:4654 with SMTP id 5b1f17b1804b1-442fd6103b3mr73672005e9.8.1747501173653;
        Sat, 17 May 2025 09:59:33 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50b30csm75388245e9.9.2025.05.17.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 09:59:33 -0700 (PDT)
Date: Sat, 17 May 2025 17:59:32 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Ard Biesheuvel <ardb+git@google.com>,
 Shivank Garg <shivankg@amd.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, Ingo Molnar <mingo@kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, "Rao,
 Bharata Bhasker" <bharata@amd.com>
Subject: Re: [PATCH v3 1/7] x86/cpu: Use a new feature flag for 5 level
 paging
Message-ID: <20250517175932.2cd2d678@pumpkin>
In-Reply-To: <CAMj1kXGY0VYLdKiveeznH7+8AVD7Uq4PGEhr=+pcT-Nw3WWvgg@mail.gmail.com>
References: <20250514104242.1275040-9-ardb+git@google.com>
	<20250514104242.1275040-10-ardb+git@google.com>
	<20250515131120.GCaCXn-E8zQutUqKLn@fat_crate.local>
	<CAMj1kXGY0VYLdKiveeznH7+8AVD7Uq4PGEhr=+pcT-Nw3WWvgg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 15 May 2025 14:33:50 +0100
Ard Biesheuvel <ardb@kernel.org> wrote:

> On Thu, 15 May 2025 at 14:11, Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Wed, May 14, 2025 at 12:42:44PM +0200, Ard Biesheuvel wrote:  
> > > From: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > Currently, the LA57 CPU feature flag is taken to mean two different
> > > things at once:
> > > - whether the CPU implements the LA57 extension, and is therefore
> > >   capable of supporting 5 level paging;
> > > - whether 5 level paging is currently in use.  
> >
> > Btw, that gunk:
> >
> > We had started simplifying the whole 5-level crap:
> >
> > https://lore.kernel.org/all/20240621164406.256314-1-kirill.shutemov@linux.intel.com/
> >
> > Shivank, I hear the performance issues got resolved in the meantime?
> >  
> 
> It would be interesting to know whether CONFIG_X86_5LEVEL=n deviates
> from CONFIG_X86_5LEVEL=y with 'no5lvl' on the command line. If passing
> 'no5lvl' makes up for the performance hit, then I don't think the
> performance issues should stop us from removing this Kconfig symbol.

You might then want a Kconfig option to invert the default for the
command line option (and an inverted command line option).

	David
