Received: from mx10.gouders.net (mx10.gouders.net [202.61.206.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571D925D8E7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.206.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195827; cv=none; b=nKDQKj+vpeZ7Ux7/f0iIwANWz7qQdEDfrl0TgyltNA2R4mI3djdNuZRqHPWWdUnfP1ezNw920DxQvCnc48TkEQuNg/f14UD2MHvXMHYNE5gJBuFnVOXFj6UjlP8PyYuryItdzvQh0T90Q+AlnRw1csnLi7a2NLyGzFH+iMGuFAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195827; c=relaxed/simple;
	bh=PM0AyRSsUqDr6yCZI2UpnzigVHNUW4oNFNQ/8H7gw4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rckGqtAb1miLOpsfOLFRSTJlWYyfrAKMoZHW1RwSKbMo0Cb+jQmGWz25y6yMD+b1pGA5W+uOiWxAz7YHGYopoCIHse5Bma5zJ7IUVZvPL0uE57ISH7BXnbClwXf2wEFDqinkrQ8gsf7kJgQktnZsheWZyPK41NA1BQ6T61AXYVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net; spf=pass smtp.mailfrom=gouders.net; dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b=HRM4Zk7d; arc=none smtp.client-ip=202.61.206.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gouders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gouders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gouders.net header.i=@gouders.net header.b="HRM4Zk7d"
Received: from localhost ([193.175.198.193])
	(authenticated bits=0)
	by mx10.gouders.net (8.17.1.9/8.17.1.9) with ESMTPSA id 539AnKlw008265
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 9 Apr 2025 12:49:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gouders.net; s=gnet;
	t=1744195760; bh=PM0AyRSsUqDr6yCZI2UpnzigVHNUW4oNFNQ/8H7gw4Q=;
	h=From:To:Cc:Subject:Date;
	b=HRM4Zk7dch3Md6jhowa2N/GHSFhJq5XbJtPKfSa057PAdeN+UjqjBXl+y000xwoU5
	 IQNRO44XbFjMXQMDg/F73n6orxeexLPasNiLck1D+Ms0QAFQnTNepvlKabn2Xo5MOl
	 QL1uBtCFtnZmqE5i+DRWA/taKH9xJTkBbRb++F2s=
From: Dirk Gouders <dirk@gouders.net>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Cc: Linux Kernel <linux-kernel@vger.kernel.org>, Linux x86 <x86@kernel.org>
Subject: AMD Ryzen 7 PRO 7735U: 8 instead of 16 CPUs?
User-Agent: Gnus/5.13 (Gnus v5.13)
Date: Wed, 09 Apr 2025 12:49:14 +0200
Message-ID: <ghlds9lidx.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I got new hardware and after setting up everything, I was wondering why
I don't see the expected 16 CPUs in top(1) or /proc/cpuinfo...

From the AMD website [1] I read:
------------------------------------------------------------------------
Name                    AMD Ryzen=E2=84=A2 7 PRO 7735U
...
Architecture            Zen 3+
# of CPU Cores          8
...
# of Threads            16
------------------------------------------------------------------------

But lscpu(1) shows me:
------------------------------------------------------------------------
Architecture:             x86_64
  CPU op-mode(s):         32-bit, 64-bit
  Address sizes:          48 bits physical, 48 bits virtual
  Byte Order:             Little Endian
CPU(s):                   8
  On-line CPU(s) list:    0-7
Vendor ID:                AuthenticAMD
  Model name:             AMD Ryzen 7 Pro 7735U with Radeon Graphics
    CPU family:           25
    Model:                68
    Thread(s) per core:   2
    Core(s) per socket:   4
    Socket(s):            1

------------------------------------------------------------------------

Then, I booted a BSD livesystem (NomadBSD), looked at dmesg(1):
------------------------------------------------------------------------
# dmesg | grep SMP
FreeBSD/SMP: Multiprocessor System Detected: 16 CPUs
FreeBSD/SMP: 1 package(s) x 8 core(s) x 2 hardware threads
------------------------------------------------------------------------

And I installed it's lscpu(1) and that reports:
------------------------------------------------------------------------
Architecture:            amd64
Byte Order:              Little Endian
Total CPU(s):            16
Thread(s) per core:      2
Core(s) per socket:      8
Socket(s):               1
Vendor:                  AuthenticAMD
CPU family:              25
Model:                   68
Model name:              AMD Ryzen 7 Pro 7735U with Radeon Graphics=20=20=
=20=20=20
------------------------------------------------------------------------

Do I misunderstand something from the above?

Best regards,

Dirk

[1] https://www.amd.com/en/products/processors/laptop/ryzen-pro/7000-series=
/amd-ryzen-7-pro-7735u.html
