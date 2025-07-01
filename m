Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD0272E48
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371593; cv=none; b=eVixFxYH6Fh2OToulEPtLCphsoN3pnJ6BSEqCO1SqLP+OkEY3bxJC8E83k/3t7UbI6TFm35qnaf82EelpBTicc0RQL5mDWjFvBiB0FE5fkWFQpjjNdGLkf2FGnB6RK8FZa6Ao7sAtoQO61H+UPZnXxzI8+Bv2M1U1vHijQKVEo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371593; c=relaxed/simple;
	bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gdwFi9eQLXtLKOkb1/sHxyKpihA86/2ybrvMLQhTR0Ziv7hQfmfrURbYQqNgfve6SwPNpgOIBuyizsGm8p+mQUQgt6kU1Ry0uS4y75gZ0wFkmF9S0wi0aByxMB8xTIeSEOA/neRIV7NjG9ffLEZ9Aoiv7p6ZLnXb+TaaFPC+B54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Egebe6Xk; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Egebe6Xk"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2357c61cda7so114235ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751371592; x=1751976392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
        b=Egebe6XkkWWxrWmyUivjX5aWl4O1EcZh3DITP/UtDfB1mhO+muB5qow6N1ZSls2gV8
         jPiPC0SxIzQpJEdcctPszgOWwCIp+qa+HSOh33xWTR//zOV3FbuneW51yMYEDIknGEN8
         NzA55UM/nuwG25Kdc+J7PMt+fvJj2hO9nQmYSQM9Jb6ELKUo18gvFjVDDbyaDP1HXHRs
         wpnvSLVjofERgNuAmibJDgFZ6vznKwN8ggjzGeWY8f8s48HgdjmnNfN88QNwpPoWMphc
         KcWMCdVYLeof3RIGs5/550xMt09mJ/Af0ybTHbC5IJ/XRa9afEgw3aX8jpETkCiZcMGj
         zoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751371592; x=1751976392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwZQhFulCtk6W9St9reCgVe3JkeISDZLWskJCaogHtY=;
        b=pTZak5GmJLqbltrXHJFGJJft3AJDKFfdJGrulgC5c28fIfMQwql0Fr70nnBvGhKPrf
         xiuwrGyRl45ZJou486LXoOQPdr90m9ruxMXz5oVxp0N2R8lBiRnEp1argQFss50Mu7i8
         TZR19YqNRpAsRrGk9g42SBbVvaV6bPu7HrwypJKzrlQFLVGnOM2lut3sNITXwmjG7UR8
         3/MJXDY0M7g21YjmahQvzNH1KcycBR1V8eNMD/JlOMRoJS7z2Yv+42aLzmoxETLC1F/0
         NIVHqW5SBMZMOjEWYWC7s8vugyqGhvg7DZ0eRtQL2KTrDRO5RMHn5llRQ+EMdwNnTu//
         JSIw==
X-Forwarded-Encrypted: i=1; AJvYcCUuGPlK7dnYHeoqp7FMXDSQbvP3tFlg97i9cAjf7ujWlsX8z6S2xJ94DmblJKuFqwzYuhdGuZ493XWgw/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ7gw4xTWnKNfFKNUV0MzF9nNT9d7zOYf07nkTsJpA9luuBPDq
	QrB429XxfUPEXCTZVOhahJo+XUOH0qXo62mu/uQXJdG1m0srGKzjirT7MAVqaLrIYYoZ5d58Fri
	l19625akKtXRA+gChgwKjA16w84PHdJIGCUDRMmz0
X-Gm-Gg: ASbGnctNQy557z6ksBHoWU5TDRRZz4m7/K0z0g9uOt+GDwav0PcqIOsoiKmhB6qwlfH
	GMdwusCdf2IW83nrZW0yNULvPnWT/Y1TY7la1EBWpoUVAhqn4CMeqB7RNH2HYz7Qe/gFTH2WYuR
	J6Xh0lx8WELVprqdbk9ztURVe1vzNhrYMSWclzQWPvDQ==
X-Google-Smtp-Source: AGHT+IGFAwjulo/i4stzSeDZyvangI+UZ0rJXA7wz0l2gf+G3c7FdoUDkNvfVQlKGJ7tNf7XQG97q/uJgkbiheh/1nA=
X-Received: by 2002:a17:903:110d:b0:23c:5f63:b67 with SMTP id
 d9443c01a7336-23c5fef26b2mr2103895ad.4.1751371591226; Tue, 01 Jul 2025
 05:06:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612114210.2786075-1-mclapinski@google.com> <685c67525ba79_2c35442945@iweiny-mobl.notmuch>
In-Reply-To: <685c67525ba79_2c35442945@iweiny-mobl.notmuch>
From: =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>
Date: Tue, 1 Jul 2025 14:05:59 +0200
X-Gm-Features: Ac12FXxGIEan-Q08VvikT9LVQKRxgvs42efMWiz53YaKommHJZr1vh6fiZw9HYE
Message-ID: <CAAi7L5cq9OqRGdyZ07rHhsA8GRh2xVXYGh7n20UoTCRfQK03WA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] libnvdimm/e820: Add a new parameter to configure
 many regions per e820 entry
To: Ira Weiny <ira.weiny@intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Dan Williams <dan.j.williams@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, nvdimm@lists.linux.dev, 
	"Paul E. McKenney" <paulmck@kernel.org>, Thomas Huth <thuth@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 11:16=E2=80=AFPM Ira Weiny <ira.weiny@intel.com> wr=
ote:
>
> Michal Clapinski wrote:
> > This includes:
> > 1. Splitting one e820 entry into many regions.
> > 2. Conversion to devdax during boot.
> >
> > This change is needed for the hypervisor live update. VMs' memory will
> > be backed by those emulated pmem devices. To support various VM shapes
> > I want to create devdax devices at 1GB granularity similar to hugetlb.
> > Also detecting those devices as devdax during boot speeds up the whole
> > process. Conversion in userspace would be much slower which is
> > unacceptable while trying to minimize
>
> Did you explore the NFIT injection strategy which Dan suggested?[1]
>
> [1] https://lore.kernel.org/all/6807f0bfbe589_71fe2944d@dwillia2-xfh.jf.i=
ntel.com.notmuch/
>
> If so why did it not work?

I'm new to all this so I might be off on some/all of the things.

My issues with NFIT:
1. I can either go with custom bios or acpi nfit injection. Custom
bios sounds rather aggressive to me and I'd prefer to avoid this. The
NFIT injection is done via initramfs, right? If a system doesn't use
initramfs at the moment, that would introduce another step in the boot
process. One of the requirements of the hypervisor live update project
is that the boot process has to be blazing fast and I'm worried
introducing initramfs would go against this requirement.
2. If I were to create an NFIT, it would have to contain thousands of
entries. That would have to be parsed on every boot. Again, I'm
worried about the performance.

Do you think an NFIT solution could be as fast as the simple command
line solution?

[snip]
