Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E351EEA4A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 21:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359211; cv=none; b=OSmAgsnwgsdDRPD77DPz145kkNvTmE8p7uLMaSvZooOE+wR8lgeI3Ln/Fw5yyxh+gLnyS3y+vsapN/LJzrH77vSh3Gf9ZGdHi2Xjge+FBNj8YEO/V/3bqEHtd10YfT/RibCyNzwXT8HM78mbi+qW4cEdDTZyuTOycXDUKMTH/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359211; c=relaxed/simple;
	bh=xtcewb2keeFDNgvPxW6fpHtKWZHT/aAKVXRFf8b5FRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ndv7L6S9KptwM8T0vMmpyt96B1gVER54By6V4idMyeMAmJhJSsD+V5rA3ft0FvdVhNb++HaP9k8AsIFxHNkP6BVci7vl9LE828l+ClOcgDaSNop68Zb0Js8C7b6BQYGFGlq5Ezmz8cymT0U85xJLnegrAI7YHB8Hn4J/XtwIWsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1HOYXDHj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1HOYXDHj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163b0c09afso44039705ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738359209; x=1738964009; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gNnceRFPO5fDZxRcbBd7tMfQOg82L8AVSRCaR86RMVM=;
        b=1HOYXDHjmC1Aymz9WE/XWPA8fXWU3jQ14wefatL0NQk/Fl2MZ35Io/y9qaqrtxWeiR
         fVekUpapkpxEWha72gFUW8S5Ru3hbvmCQ6Rh7s0ryeXWy4vfuu2PP6eiUvhMTTRWqg/Z
         sWEKqo3zv1ecBb3XatvHCmKOk9iULDkIw3hQNLOU7RDW+t/qKEOd9U7LORZE3du0vWr8
         L2HM6oXblmewuwu0mtxL69aDfKPyAFhVqLEmrCvU0V7KHu0LxARbBtKgwuUa+HvQrBT7
         wHEr/pRy7V4XTs/YjFoQbGi9qaVRg7qGJa8c4FU7G92lxtWCnIOzkZfq3nk5s+/7vjd1
         e2OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738359209; x=1738964009;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNnceRFPO5fDZxRcbBd7tMfQOg82L8AVSRCaR86RMVM=;
        b=B3bag2VnPjaeJU4aUlh77J0PRKxFuqV6iQMeXXv2R4cMv9Nj2SLUSso8jcdPkcVBa2
         G2/9kwXyfQdF8csHHyBs5ekEU7wKfP2NwoLKAOgLqWR0zAEIEvVJ3M4wfeE/V9RsZkJk
         7pjLGsSPgxzwnrigh8PtLC+o2ay5/mHvmQ1gdBvics0a/hbjtEH1ACBOgYme1+oKqfYH
         431i8/BUDdPdR/0W3s/628dLf7ud9ZPuTng/OVR+4aSvjrv9ZJrK2PjR25SD5KhS5Twt
         YEeTwCCcqFJj12klUaq8Mt2MK3xWstZCgFjs/B0Ue8WOAabi593mht0bBOoZpV4abydg
         VNDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4O72v2q7gSbuuxy0cuXugGA35QYf58Se0siUvZ+i3Zq7RRJ61EvPOv06nSXlSNx2HYOIv4yHEgXCRP8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUlFfKONqejHA8VU7bVscskEtGF5BcR6bWw6ACH2l2OYqKkjSm
	1hdxpxoqzXet5qeYYXzPmt0pMln3itMugRq7TCDsNtjT1GWz9F0d4Zrt2oWnzzDfspimZmL+zOH
	4tiOzaA==
X-Gm-Gg: ASbGnct7zkf7NEU3rfdPFrr29+CXKJw00ZsIMimIykHV5zToHssQ0786+Tj4veyN/LD
	cRwNb7Djp8cadSOI/9EbHbwCMAvnqBBzm00vfB6an9twoCbj+rsMhItjHvg00H65rzrB16xg9h+
	4FEVSBFvTXygs5WKbNxiUlfC8GT9iBiddQ3r/DN7XhIKErhgS/Jt9prZOfNy9ybUGI5jymiD+4m
	qywVpWP263ozyF+zvCc71hVkr7PNR6Yt3UU4FhBIA1MXkanoC763FDuuPb4LmTfBU/VrI8fIlU1
	V8QP9fkxfQ==
X-Google-Smtp-Source: AGHT+IGtV2TYJwc8Rghm6y+ELcvh6mAobsDIIs+HgTVDhBkhgylQ0meJoVWxHdfv9B3r/OPi1a/Cgg==
X-Received: by 2002:a05:6a00:2e27:b0:72d:65c1:ad01 with SMTP id d2e1a72fcca58-72fd0c8bb54mr18663860b3a.21.1738359208746;
        Fri, 31 Jan 2025 13:33:28 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b67e:25c1:3d0b:392b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bf82sm3910729b3a.17.2025.01.31.13.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 13:33:28 -0800 (PST)
Date: Fri, 31 Jan 2025 13:33:25 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Message-ID: <Z51BpVEkmVCg7gTX@ghost>
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162>
 <Z5xzkwwZAWRRLCdj@ghost>
 <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>

On Sat, Feb 01, 2025 at 12:10:02AM +0900, Masahiro Yamada wrote:
> On Fri, Jan 31, 2025 at 3:54 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
> >
> > On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
> > > On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
> > > > On riscv, kernel modules end up with a significant number of local
> > > > symbols. This becomes apparent when compiling modules with debug symbols
> > > > enabled. Using amdgpu.ko as an example of a large module, on riscv the
> > > > size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
> > > > (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
> > > > (--strip-debug), and 20MB (--strip-unneeded).
> > > >
> > > > Use --strip-unneeded instead of --strip-debug to strip modules so
> > > > decrease the size of the resulting modules. This is particularly
> > > > relevant for riscv, but also marginally aids other architectures.
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > >
> > > Is there any sort of regression risk with this patch? If so, another
> > > option may be to give another level to INSTALL_MOD_STRIP like 2 so that
> > > INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
> > > opt into this option. No strong opinion because I am not sure but was
> > > not sure if it was considered.
> >
> > I do not believe this would cause regressions. The description on gnu
> > strip is:
> >
> > "Remove all symbols that are not needed for relocation processing in
> > addition to debugging symbols and sections stripped by --strip-debug."
> >
> > The description on llvm-strip is:
> >
> > "Remove from the output all local or undefined symbols that are not
> > required by relocations. Also remove all debug sections."
> >
> > gnu strip --strip-unneeded strips slightly more aggressively but it does
> > not appear this causes any issues.
> >
> > >
> > > Regardless:
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > Thanks!
> >
> 
> 
> It is true --strip-unneeded drops a lot of compiler-generated symbols, but
> it also drops real symbols that originate in the source code.
> 
> So, this would give user-visible changes for kallsyms at least.

Adding INSTALL_MOD_STRIP="--strip-unneeded" would be sufficient for
riscv. However, this has the downside that riscv will require different
flags than other architectures to get reasonably sized modules. 

I believe these symbols are only useful for debugging, is there a
usecase for them to be available when the user has modules compiled with
INSTALL_MOD_STRIP=1?

- Charlie

> 
> 
> $ riscv64-linux-gnu-nm  -n
> /tmp/strip-unneeded/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
>  > /tmp/symbol-with-strip-unneeded
> $ riscv64-linux-gnu-nm  -n
> /tmp/strip-debug/lib/modules/6.13.0-09760-g69e858e0b8b2/kernel/drivers/gpu/drm/amd/amdgpu/amdgpu.ko
>  > /tmp/symbol-with-strip-debug
> 
> $  diff -u /tmp/symbol-with-strip-debug  /tmp/symbol-with-strip-unneeded
>  [ snip ]
>  00000000001676cc t uvd_v6_0_ring_test_ring
>  0000000000167802 t uvd_v6_0_ring_emit_pipeline_sync
>  0000000000167a02 t uvd_v6_0_ring_emit_fence
> -0000000000167b58 r CSWTCH.2
> -0000000000167b68 r abm_settings
> -0000000000167b80 r abm_config
> -0000000000167b90 r min_reduction_table_v_2_2
> -0000000000167ba0 r max_reduction_table_v_2_2
> -0000000000167bb0 r min_reduction_table
> -0000000000167bc0 r max_reduction_table
> -0000000000167bd0 r custom_backlight_curve0
>  0000000000167c38 r abm_settings_config2
>  0000000000167c70 r abm_settings_config1
>  0000000000167ca8 r abm_settings_config0
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada
