Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD7523CE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 01:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749605150; cv=none; b=ZrKiRG43tu+AmKyGAmustBYK9NO/nAQlq3opeTGCTT/Loz/yNyHrs9BKRPuSUX9jCQNJzd2qRJG5tzKItGlx/aHMVKEH3oQ+lKY6rgUieiCOikpXWxAzYVWFkP9/ioNN9RJtMO/tkRh/zfxoCKEvc72P4yCKrlu26vrndET8ipg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749605150; c=relaxed/simple;
	bh=IRhxgU6JKIyB7m9jXHMqe73TuKZ3Mt9ctR3jIbEoiUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azJ4c3ydFjoMFUnuwGewGZwAtAkGl97OkvKLOgjGLcpU97h8TuyDnJ+mrNVoqKMM7EioEO19Q12gjOc7pRaQwgyFwbODf7NN0uUZqn33Z5QXYt2Sk2i2Ze3G8zJKGmB9b62x9+i3yhO2m0Mvy0xDtRDdDnM/qvy5Ql+UTKf7LzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EumtmMPq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EumtmMPq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235ef62066eso76023495ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 18:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749605147; x=1750209947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtgExWEw247NLLRqm8dXAR7WlHirMc3hSYEwjl0JFcU=;
        b=EumtmMPqjuchqDGIwe18bTkTbFbQyu1woOn05l49Vwm/lRswsPLPJJUD0OkfOLHOPp
         IexW664QMNEsOaKLCxCnOq/WrZksBO+uuvDqwhA6J8e9Bpp/s+tvpxA77PW93IRbZP+4
         Tvt0KilojrzA5GSpYKh1lpkErE/wqzdSKogMdmUMhW3PB/3x9D/TMQVzKdOOWOkhltV6
         KjgCjkKbUz2P1hql9INWLNM8NlzaBSm76TiFBRyngtyM//Ca8k7dm6GoxfwvEEP//vPA
         55vhkCZcU+rfr+6IDJDQK/Tv2C5BtpXXhmnquj+PJjad0u06YAEUmxIF6VYmSOzIGCqz
         txdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749605147; x=1750209947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtgExWEw247NLLRqm8dXAR7WlHirMc3hSYEwjl0JFcU=;
        b=OiXEG4O+2JhmBmJhkB2Bp9Gnj096QLrs2vIUjnUpZdYZL80jeeLyWw9b+1JRwj3Kqy
         9ulLoQYxfWHFZr94xSSe04qgD8NKoAxyhRWewn9TbmOucVCjib04LIzAqbSJKWCuvhcu
         chu7YnjiGCUIzgCLH4fl9caC8zjff+T0elIdDVX2brcBLwKrO5hXD1MTizY7MP7yiWfC
         emsKmGFufsk+5GvIVRZvkv8Wizq1w3ah4McJGR1NwJqSqiZLVcj+Q1k2RvxM2NU7koh/
         qMS1CTqeorgez3nn0ewLu+dbcOhlUssQucu+OW64KPWmNf5RCzIDFsOKdJWzZRuOB5U7
         QO+A==
X-Gm-Message-State: AOJu0Yyjuq438gHZs8tV/rb/oxA4OjBVwxw2nZnhAXFpBJ6idXTddTNW
	L4pQQU7R2fOSwR5CHAXRJBtvRK5SjeCfgN1huzLNgDXyoXHiLHwczbDTKdEhiKVI
X-Gm-Gg: ASbGnctASrQ5uSCi7g+YG8nM6cH1g0qgRNKpj3JUIN/cjojSWTdBrQlOdAUXmNIrwIe
	YjykjrTbeuTd3uxjnVG/wzFjrQaPTiyPQd9ZaHKpAkFvsQuXHeOBPO7D/M50MF3u4EJ2rByQssQ
	9zZ1kQVY0axFJYkNoDLZNosh/TuillZ0LWhoXrsStxdJgx3oASCYUfCEGVpB2KCnPvuGvXzFDk5
	Kn/bmvkB6U+V95xIu7M/CLyIu9U40XP9Qj7vsNFXdr+MvK1Hnhg+4iu2rKjolIIj+Aq6ddgO8/W
	bmtwpRSsJM4mBdNQsO1DPUeeV7jHnhL4UMyCklJG9oBenAy1soYMmOyA8N4grj9trvBHKHtKNME
	=
X-Google-Smtp-Source: AGHT+IE84HHLxP+v6jbyWfTIDJ3HcWl2J6zVcdW2mV1hEKJlgHqD2vkB2W0OXi7dq57CqqsY3JVPaw==
X-Received: by 2002:a17:902:f68e:b0:234:8e54:2d53 with SMTP id d9443c01a7336-23641b2e245mr19008575ad.45.1749605147120;
        Tue, 10 Jun 2025 18:25:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcf0csm77343525ad.91.2025.06.10.18.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 18:25:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Jun 2025 18:25:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: Linux 6.16-rc1
Message-ID: <241b0829-5fec-4d88-866a-ba59e2ca748e@roeck-us.net>
References: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiiqYoM_Qdr3L15BqJUyRi6JjR02HSovwwz+BXy7DdVeA@mail.gmail.com>

On Sun, Jun 08, 2025 at 02:17:49PM -0700, Linus Torvalds wrote:
> So it's Sunday afternoon, and we all know what that means by now: the
> merge window is closed, rc1 has been cut and pushed out, and we're all
> supposed to start testing (and fixing) all the new code.
> 

Build results:
	total: 159 pass: 159 fail: 0
Qemu test results:
	total: 633 pass: 628 fail: 5
Failed tests:
	arm:supermicro-x11spi-bmc:aspeed_g5_defconfig:mtd32,0,6,1:net=nic:aspeed-bmc-supermicro-x11spi:sqf
	arm:ast2600-evb:aspeed_g5_defconfig:mtd64,0,6,1:net=nic:aspeed-ast2600-evb:ext2
	arm:fuji-bmc:aspeed_g5_defconfig:mem1G:mtd128,0,8,1:net=nic:aspeed-bmc-facebook-fuji:f2fs
	arm:g220a-bmc:aspeed_g5_defconfig:mtd32,0,12,2:net=nic:aspeed-bmc-bytedance-g220a:sqf
	arm:qcom-dc-scm-v1-bmc:aspeed_g5_defconfig:mtd64,0,12,2:net=nic:aspeed-bmc-qcom-dc-scm-v1:ext2
Unit test results:
	pass: 592743 fail: 0

The test failures are all due to commit 0aa7b390fc40 ("mtd: core: always
create master device") which breaks mtd partitioning.

One side note: Various qemu machines configured to use Macronix flash chips
are no longer able to access the chips. This is primarily due to commit
947c86e481a0 ("mtd: spi-nor: macronix: Drop the redundant flash info
fields"). After that change, SFDP support for affected chips is mandatory,
and qemu does not or not correctly support that. This affects quanta-gsj,
kudo-bmc, ast2600-evb, and supermicro-x11spi-bmc machines (and possibly
others).

Guenter
