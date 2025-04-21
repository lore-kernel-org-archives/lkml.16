Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4123263F22
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 13:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241647; cv=none; b=us4xoJDISaLdgkSlcpX6GOtI0u4HpBwAeLn8FyqP5HKa8l8awMZYuK2LOnyIF4/i9XkNSJLO6eVo02nzO2qA7lGEE/SUZHaNrX6FQ06sJHrJM+hlIwNt8F8q8HUw58rH0Rfz4nBGgYmXft2YHFPmlJe0i97PMnDqgBZNf4uI3uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241647; c=relaxed/simple;
	bh=yr5u4N3yDuIYaV72wLIMS3lZ4xFyEBaA/73ShEQBB+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NnUZ/CCaAkEzGz8f8DYMywemmroc1eOKFkFiSUGt5jIKoo09+U87XjkULPl5poWzi5IdL4Um2IMVeDDi3sBrtPbsd7nux45WB+8XqafgHN1xKDZTNuHF2+uBX30sfuC6zrjGXTIhpOSFBxzVgJ2kaw0O99CdMLAJ8ILfZ30ZC6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3g579Qd; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3g579Qd"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22928d629faso38337695ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745241643; x=1745846443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypsQ6P+T8bstA/K8ioTPiTkgiiwRiP/Vk02TLkIe/EU=;
        b=H3g579Qd+waOSnQ11seVJ0edmTvnk6nhQIMPB0o7z4QPq0mNsDQfGoN+abR/+UcnpY
         CR+WfYgZcJtSH2UYJEIIaPUgKcOfW38jjgL1FEtwnmg/m98yC06XdGv+oR2Tt4xiwh7C
         P9+IOgIuvWFidQO+W3CknNC2QPSjazRQVXRMnjsbn0BZqb8aKzCrTgz7harr5ic3qh0E
         xesxIyltuBO5LcumeOJo2maQVkhBtBt10s3xz5arwB+GIdnQHceUiBHIlpA1GdGZGJKZ
         xDEwaRSMlFS005EE2+58ohOhy8uZUnhZy6b9gaVjCtCYKfTkO9PMODY5Oyf8KkECT5x8
         uFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745241643; x=1745846443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ypsQ6P+T8bstA/K8ioTPiTkgiiwRiP/Vk02TLkIe/EU=;
        b=oCBDHGCR9CmwSfSPxiGRum7mI25FUyjTRWCcmWf+vkfPOjslix3AC/0a2imQ8dSEYn
         0JLCLPHstHRhaEbphAuT5OskFVraIU8gWA5A5B+pXNnFowi8jKQCcNw/b0Pq13XDZlhG
         c4ZdnrU4GL7l4Qee13l/dgb9pP58+DIxPYFowWgL7NRXGnA37mztrN7QCkVPppDGC13n
         oKDa6+bEn7fnN4RRdM9HOZiHLT0zrw9s3CMR1DTu7TM4tl4HuIlAECxJd/QnyLB8fxJr
         UrcJkeKdyabncrWYpcIaWHELGsuoTh267+fd7mQbQrD6TwOzAaEPBIJG5GwN2MdMNRR8
         gDbw==
X-Gm-Message-State: AOJu0Ywj5a8nOHEURX2EJGUuxcEmFxnHWjKFMfrfrAQk/UBxd+SE+DuY
	tglutJU+1mFlz7N12wRGiSDGrv257eV58ybHO6AKqdYRaRWX4pQ3B5hmKQ==
X-Gm-Gg: ASbGncsXg3nml1upMUfQHXZMoqQV0iENAS2KD02Fl2l97d9UucyOfi9+R5c8G4H/YVo
	LArYsZX9IA8CcNdPWi3+zY4XuU7k+54Q2P3no/aNz/9Xv1JSJ6ZvTESc4k5w9jn5iil/oTKU+Fx
	Tzi+HlYzQRYRInUDpUlBGiVOuQUV4ZdIo/54XOQTf+XtKiige0rilnrOQDDDCTAM6sohFTDXDKl
	XKTwfF0KF0IdisIfqNAKL7M2+yM/Fj8lDXUBsEF6stvgfvhqx+p0fADujRJVe9OT7JCeLosTj9a
	1yQMzfwNGAgMXUfNOZI+PSOTFz8QqQBWp0d6PfLq09eee1G9gRAJiw==
X-Google-Smtp-Source: AGHT+IGRY7uEkUe11a/A39zqw+fquFygWl+m9yJFJaMmdCnaVZ5wvdtF1WcAvgZyoBsv0NQUjPA4rw==
X-Received: by 2002:a17:903:1cd:b0:21f:4649:fd49 with SMTP id d9443c01a7336-22c5361a27cmr173759685ad.49.1745241643058;
        Mon, 21 Apr 2025 06:20:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdda5csm64807445ad.44.2025.04.21.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 06:20:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 21 Apr 2025 06:20:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Linux 6.15-rc3
Message-ID: <3f135f66-4633-4a96-86a4-9d89cfecadbc@roeck-us.net>
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>

On Sun, Apr 20, 2025 at 02:01:49PM -0700, Linus Torvalds wrote:
> There's absolutely nothing of huge note here as far as I can tell.
> Just a fair number of small fixes all over  the place - the biggest
> changes are to fix some ublk driver issues, and the related selftests
> for same. The rest is generally one- or few-lines.
> 
> So everything looks fine, and while the merge window was fairly big,
> that doesn't seem to have resulted in any particular pain. At least so
> far. Knock wood.
> 

For v6.15-rc3-1-g9d7a0577c9db:

Build results:
	total: 162 pass: 158 fail: 4
Failed builds:
	openrisc:allmodconfig
	parisc:allmodconfig
	x86_64:allyesconfig
	xtensa:allmodconfig
Qemu test results:
	total: 635 pass: 627 fail: 8
Failed tests:
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:ext2
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:erofs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:f2fs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:ext2
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:erofs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:f2fs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:btrfs
	mipsel64:boston:64r6el_defconfig:notests:nonet:smp:ide:cd
Unit test results:
	pass: 594143 fail: 0

There is a new build failure, affecting openrisc, parisc, and xtensa.
Example from parisc:

Building parisc:allmodconfig ... failed
--------------
Error log:
ERROR: modpost: "__divdi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__umoddi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__moddi3" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "__udivdi3" [fs/xfs/xfs.ko] undefined!

Commit 845abeb1f06a ("xfs: add tunable threshold parameter for triggering
zone GC") introduced a 64-bit divide operation. I reported this to the
author, and a fix is in discussion.

Other than that, there is the known allyesconfig build failure for
x86_64:allyesconfig. I submitted a number of different proposals for
fixing it. We'll see if one of them makes it.

The fix for the mipsel64 test failure is known and will hopefully be pushed
soon.

Guenter
