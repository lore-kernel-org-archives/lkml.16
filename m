Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA42165E8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 18:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738693767; cv=none; b=GysRriqVloKmEhYdXgScG6hhJ7qGEFDubIjh32oa1LItYIWilaKE/HZvIEoBeP22d8dfg9mFXIeoDbW6NKoIafwIROVULYw+xZjT6YTbNc2Uw7Tdood3ED7BQL6PbQCrlmZFXNK49ale4q+BBP1E2wtJ8IysFDYJf526Qa9n67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738693767; c=relaxed/simple;
	bh=YnAK2fA0OmEe/sIg9fxsXd7XWgn/nEQdWhUJr78kOKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TnsQnlsEgcQTX+UG1McVzRKvJa/PHmuRhDjj4nAcbN2NrVjXkxgmQcMXmA9zs8HOl+FMIx4ltPFGMs8WCluR4OCStKajnL3XiHJbUCiZLGgesgGt7ckpLc5CVIjFz9IAbEUS8y6dwg9v5NUVp06l1YdrHJVmDXYowsEXFV7v4jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gATzOHhl; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gATzOHhl"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3ce87d31480so18321145ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738693764; x=1739298564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEPN7BQJIS/NgUdVABl5RKuZM8r7yMxe9P6rzBs6nCI=;
        b=gATzOHhl15f9h3zaAYF0byoKfFBAcr9ueGEfwmkTUqBFycIcS/TwJOterWcr4vtxAs
         vYiUCF236C+9P2Ix08ckFerw9NcKmXdp3jS5EmtJpcxFEmJu0wjQsfK38uzethH/NCa/
         sm4KqtEFpku++DJp+bhaZe6qI0KnZRdLhjY4DzZe0RM1QrO5Oo/VzzQfdamYxSFvmetV
         sZaB3h0FTLp00dm+HUsokSZwCS3TyQf4EU6s/aEh2g/H+e3zIDhN8td6z7kcdJeAH0PR
         s6mS5cKItEsM6VNTVIE84l26WKpH04i3QOfU38Bh0aQEw5Wi6+Oh/t3GTSPyPJdKYKZS
         ohZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738693764; x=1739298564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEPN7BQJIS/NgUdVABl5RKuZM8r7yMxe9P6rzBs6nCI=;
        b=CzokvQHSoUDrHl2gzKepsQSro5SUvuTJ9fvLJOmNxDeDLthHWdFtbQB2TSQgCy5yIw
         BvYOxhj1MvTANOqQ8eqiGXxUDoojd3BlkzZPzOE8U4Wgp2Dtnb9V5uTaGf2g7iCDRwy5
         IsvCZrATH/9vut3fwmhNzmidEWwR4KDNueFxvFkqEngrcUdWPIwc+w0YnPpwbvT+1U6r
         6eYtiMBsGd2lxfu+SlZ3t5O3QfkD7ejognMTFZJQfPn0C+VTL+BTZGq5Vmcf0OUuVLbH
         C+JZ9LqKnnkCgITnDGjzUwsba8XOJAn7M29JL5fJlGp2VX+1jmU6/Eyl4YRLBkp5xyrV
         TAfg==
X-Forwarded-Encrypted: i=1; AJvYcCVk2+3eCw9+5i2kaKMpDBXkfuWcCDleOESw4hQx3QNFmoRDIyGwZ7uOD2LCGhNvkt4R8YlorIQsIFx3fdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VSeiEDV8ue8RRTPKqfsV94v9XAD91mT7uS4PcsaCV/jeG9+t
	+86tKYT1wihO4ukleCzdMoq6YRgxBQC5nge9hnHi+SlODGaPtbOp7NqfKkRf7do=
X-Gm-Gg: ASbGncuNSj/I86Rek1Br6OqNi7zsVOwZaQZb2XR2yuENabu6vMp8uLgaFjyg3bRPae/
	f98g9UPP20a/ZrtUB0wuGet8e0H4hEqSStfA5RDly80a+6rhL5Bg/7dycV+qz0ytMp+kSUQ278S
	Fs1QW+paY+O/DXujZJroTY7dEFFZeHsyTLzpgiugY7ZlgcUQIMa6Ai6Npuo63d9WjxbdjeAJK8Y
	Jjax/toVxQu4d3vXCHV+SuW75GR7Ap2MGL5RAvKa/68DpdH9pHZAFq9+Czic9+W++WpGNwQd2ck
	MmzFCw==
X-Google-Smtp-Source: AGHT+IFbEoBr+a4SvrTbADFqhAkrC2SHJ4FukkyjQjHcwGP861IkITZWGwtN5GxQ+yTOHFoL8NSXOQ==
X-Received: by 2002:a05:6e02:18cf:b0:3cf:c7d3:e4b with SMTP id e9e14a558f8ab-3cffe6b7e26mr278996965ab.21.1738693764665;
        Tue, 04 Feb 2025 10:29:24 -0800 (PST)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec7458e67esm2842974173.16.2025.02.04.10.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:29:23 -0800 (PST)
Date: Tue, 4 Feb 2025 10:29:21 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z6JcgeDmt63MupyW@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
 <Z5xzkwwZAWRRLCdj@ghost>
 <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost>
 <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>

On Tue, Feb 04, 2025 at 01:04:26PM +0900, Masahiro Yamada wrote:
> On Sat, Feb 1, 2025 at 6:33 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Sat, Feb 01, 2025 at 12:10:02AM +0900, Masahiro Yamada wrote:
> > > On Fri, Jan 31, 2025 at 3:54 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> > > >
> > > > On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> > > > > On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > > > > > On riscv, kernel modules end up with a significant number of local
> > > > > > symbols. This becomes apparent when compiling modules with debug symbols
> > > > > > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > > > > > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > > > > > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > > > > > (--strip-debug), and 20MB (--strip-unneeded).
> > > > > >
> > > > > > Use --strip-unneeded instead of --strip-debug to strip modules so
> > > > > > decrease the size of the resulting modules. This is particularly
> > > > > > relevant for riscv, but also marginally aids other architectures.
> > > > > >
> > > > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > >
> > > > > Is there any sort of regression risk with this patch? If so, another
> > > > > option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> > > > > INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
> > > > > opt into this option. No strong opinion because I am not sure but was
> > > > > not sure if it was considered.
> > > >
> > > > I do not believe this would cause regressions. The description on gnu
> > > > strip is:
> > > >
> > > > "Remove all symbols that are not needed for relocation processing in
> > > > addition to debugging symbols and sections stripped by --strip-debug."
> > > >
> > > > The description on llvm-strip is:
> > > >
> > > > "Remove from the output all local or undefined symbols that are not
> > > > required by relocations. Also remove all debug sections."
> > > >
> > > > gnu strip --strip-unneeded strips slightly more aggressively but it does
> > > > not appear this causes any issues.
> > > >
> > > > >
> > > > > Regardless:
> > > > >
> > > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > > >
> > > > Thanks!
> > > >
> > >
> > >
> > > It is true --strip-unneeded drops a lot of compiler-generated symbols, but
> > > it also drops real symbols that originate in the source code.
> > >
> > > So, this would give user-visible changes for kallsyms at least.
> >
> > Adding INSTALL_MOD_STRIP="--strip-unneeded" would be sufficient for
> > riscv. However, this has the downside that riscv will require different
> > flags than other architectures to get reasonably sized modules.
> 
> You can use INSTALL_MOD_STRIP=--strip-unneeded for all architecture if you like.
> 
> I assume this is a riscv issue. Specifically, riscv gcc.
> With LLVM=1, I see much smaller riscv modules using INSTALL_MOD_STRIP=1.
> 
> --strip-unneeded is needlessly aggressive for other architectures,
> and I do not see a good reason to change the default.

Yes it is primarily an issue with riscv GCC. I was hoping for something
more standardized so that other people using riscv GCC wouldn't
encounter this. Would it be reasonable to add this flag by default only
for the riscv architecture, or do you think it's just better to leave it
up to the user's choice?

- Charlie

> 
> 
> 
> 
> 
> 
> 
> 
> 
> >
> > I believe these symbols are only useful for debugging, is there a
> > usecase for them to be available when the user has modules compiled with
> > INSTALL_MOD_STRIP=1?
> >
> > - Charlie
> >
> > >
> > >
> > > $ riscv64-linux-gnu-nm  -n
> > > /tmp/strip-unneeded/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > >  > /tmp/symbol-with-strip-unneeded
> > > $ riscv64-linux-gnu-nm  -n
> > > /tmp/strip-debug/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
> > >  > /tmp/symbol-with-strip-debug
> > >
> > > $  diff -u /tmp/symbol-with-strip-debug  /tmp/symbol-with-strip-unneeded
> > >  [ snip ]
> > >  00000000001676cc t uvd_v6_0_ring_test_ring
> > >  0000000000167802 t uvd_v6_0_ring_emit_pipeline_sync
> > >  0000000000167a02 t uvd_v6_0_ring_emit_fence
> > > -0000000000167b58 r CSWTCH.2
> > > -0000000000167b68 r abm_settings
> > > -0000000000167b80 r abm_config
> > > -0000000000167b90 r min_reduction_table_v_2_2
> > > -0000000000167ba0 r max_reduction_table_v_2_2
> > > -0000000000167bb0 r min_reduction_table
> > > -0000000000167bc0 r max_reduction_table
> > > -0000000000167bd0 r custom_backlight_curve0
> > >  0000000000167c38 r abm_settings_config2
> > >  0000000000167c70 r abm_settings_config1
> > >  0000000000167ca8 r abm_settings_config0
> > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
