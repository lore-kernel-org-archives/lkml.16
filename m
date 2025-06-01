Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDBE9460;
	Sun,  1 Jun 2025 06:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748760866; cv=none; b=Kb4XRgXChXg9Y738rMOmxS6HsvN0Y9Up4qesITm8Jss8LEbMW54uXLipSvlNdLh2RXHf/PO3A23kYtB4UxoJqkQwpo1f+t8iAPHsC6hPHTCf+f9fwBRy8vwUb4xfwrK39yUSW4J9ZNcS/EfjWT1xG8aRRXysCNLw8sc69cdRf2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748760866; c=relaxed/simple;
	bh=F3oXdP3aGJdqdV9ToT9ZMcwFwuEYVxAdznWXmx05go4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvonGgFdKS0ysTEZD9I63NI2XKRwVV/7dTtadJFilPSQzxXrwqKDV0OeTGw5xXhnHsmFpSmVibURdR/y50SJpsC6RhnZnZ1q42TZWcXaYYok4bGStX2719hY+FH3zvDwapA3zxFSwPjZXMolXrDKmo1ghuGQrAV0mPxszCw44O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ZUlNNePj; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ZUlNNePj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1748760861; x=1749365661; i=deller@gmx.de;
	bh=sLgU7wMMAZhRNYBk/+571d7I3Sezhl/v9JsMnf0efxc=;
	h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=ZUlNNePjP7IHnCJoC/N/NggZmt2Gp11jiMEPZcX446WtRd543fWVp37KqiRQd9ta
	 HiWaalm55B/cs3TGoSlrL76Tq3W9oOsbCGdHZy2cJN66P9ZrHO0tPqUGg8ZGMULdO
	 43J1nedGhNCIZrp+pJHvvzgiCNDasAyWHiVZ26NRqN4aYvJM6j+KxpPWiK5YpZeCd
	 R6flUKqmjbpl3S8Vn7C+g06JTBOpwwvK7qbteJpFZ5iTX9Qys7ZDO7xqI8b3BUKu9
	 wEgJJsXKgGClrDn9LnIkdkeyDeX5BqcakWPTphK2jvo0TiquukeYGkGeFv3zJ8OVl
	 +fk1NZJIqT1dBZLR5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([109.250.63.171]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1urvSp0b86-00bZd5; Sun, 01
 Jun 2025 08:54:21 +0200
Date: Sun, 1 Jun 2025 08:54:19 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org
Subject: [GIT PULL] parisc architecture fixes and updates for v6.16-rc1
Message-ID: <aDv5G-QGm102O5nO@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:AOW/k/9GNYcnSuDIYhqT1SQZmXzfYzCUIc0rHMsQPqPOZlghcYe
 ut7k56lAjqv9MHc2Kyi+xYs+Ye3Y/1Np/czEOes4VLFM3CIj5vpVyiMuRIhhlbgUhe8XJDD
 TDaFukhu7SUBCd7/ERV243u/D2PfxLm13wE+zmC3nBaJhzv49mnoC864rSH468GqG+3KtdG
 qHoe7wKRJnPfxluecNxLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DVVL+LGQTfE=;IVUVs3sppapO2C94T/OognzbP1f
 l6TXMg2+zlXt3gLoNrMCiizaOFEyCeQzg0HCSDADThkrFOYnZC0N5rxcxF9G4myg8AjqrKqdE
 mu+MzRpieqn5IOLHRaqKtx2unSwk77FeahSHsD6QBGWC1ugcuaG8L+Tz68fef7l35IkbGP3Tw
 kaUKOLzixIb2CnbU9uRQ2pYrEtVqZ6dQq/l+uFAVShMtwQuWxL9YrIN7duZpnbJSF6zk25pdT
 CF+VaDsohT9rxRdKLKi+3m/g9Jw+r/0EEJ4TfxdY328c/yjQipinlEGz3NBJmgMgSP1LhXLj9
 eOwQYIKF/622a9BeQ3Ptu54O0XgFArp+Oa85CplmWGTGBn4Q/UdeXE1G5xMef7H07V8tIoTvN
 bbCP5od7371ksbYlVkTBvJ0xlikv++lMwCyB9LPKgLB2l2dqOJjdRZz1xhJp8FXjko8UsKRjL
 o7o7CitUsc7ngSvkf1X51e2EziYrJdYvfNIL9cMAJNc599zWDW383n1RaJImCuK5scz8v4pNk
 Y9p3QhIJQ0c3kFZozvjUxOh1ZYdbV/Zt02LplyttpcjtRyEEXu30JJlbDbI2Ql8m+ojkk0BfO
 Jxy+DTDYZPnejPYZ99rigXtGxbA0xP7jGUQSGDutjDFJXIIWiizjnzOWljuD4yN6UAhRmHWk2
 MXBYYWph3xMc8Mo3KZzC/BGqODgQsjR8x2ORiGgJEVLwo7tTrWqGX8h4K9LxL0ABIwMuSEyZh
 KfxkqdoCHNSNT6hh8xLLR09mCbEH+HgLfhkFsxAwlrxcx3/JvJ2uV2k/wopOxx3tW9wXNX/IS
 ijCCapsu2ntzWtzfGsgwiNu1OPVZfSPgDeBB3MHOFZ9LgDNrbHQK30xPdq48+7clRKjL7zLm3
 8b6XjxEPvYTtvDWRg85TJWY6KdKITspRtV3CxxQfw/VMq14JAstHTFXCAnP8okhCmPE2bMeN9
 tpUW1ZS5OkbHY338YCK6j0Iq0KGFv5dVQn3MEAKwwN6EX0+9Uomedt1zoXVvBlzWBNAc7vl2Y
 aQalO3fuV/s/jf/ZXQZzGBDZg98C96zs88++y97p7nf61N+3yCiRPykHtMVbm2WJOQoGGvZva
 PWapiaNoEiX0N6py9auO9AfVeUOoQxpLbUG0aDq7VHmIpXjzbjt34Q6jW2vUIoseMafR5zUaL
 V9Q4x+taLAwkBZKQCt6ehm1IR37rKM8XNb5I5AA8fOIYA2av3ktZx9fCM/7ZXGV+MYmA6UOga
 lsoZd4OIkHFihB6i/OZ40L5zYokGDRQ6Km6dZajHbejp5BjOfN4zirHnzI7MOrbi/+0Fb2Gbm
 nBW8s526NfFYTNu8IGvhCAbGCumWtV0/wFsRZmx9Xh0bZI8KHo2OUpbYd51Ywn6ckLOp8g8XQ
 dVw2xaRBIdOz6kUvAoSPd/sNhlif6nFSFe1d5GgK0Wzf2pg8czGMFHqIat8Wj+Q4rXdMmCnEb
 AgY9ORC/RPikLEkgZQoPDMGuKPEuIM9nFvxOdbR6QKz8ZszPAvXlHwDElFrFnBblmyEBL9B0r
 m8sj/15lvieLQro+Apd9bC0/bbGuEgCPPuMThrnjKlpm3i+yp0juDFvr4m5OCVxNmRxngKc5H
 5lV1B72tGKLAr2n5nQRlT7Mv6tTITpzEBV1+iXsndfBkB/hQ7d9U97jtR4EAK4/jMLklgklCO
 tPOomwmFxihNVT7qC8ufCyP2CwCk1WC+0weEyQQhbCfyH5/K3+ipMLHbNOMaOaxd89QlHTT6h
 ksrOohJ0Zj3EI219bL2OFzBsyqM79Jc441jyzeYG6MgRnzmZkpFvy8ysnwVHl9rOR/9L+Ytld
 GL0raBNS+F8lsiFQ5uTOER8AF/pjC9lnqHdGI9n6nNuC5EY6zDzH6viYZ9ZhQVMHjcFgTagXO
 mkIdc8SzY/f/7yeHjh5eImY38nZLTg6LE8fWH1+RvFmZ/f8BpNR8LxsXInxcuw2cZ6mE4XWyM
 /z6HLVCfwc28Fw5ppBkV8IU9TzBaWlXCjSVaOTH/XPwnXlhXPGd6EqyiLQl/t0mx9spMHHBM6
 /QdD1Om1mnjSZpU+WPI5DMb4MtkBzsveOn646xrAMoKeFH9vaEp2A++VdpYOPaLwoirj47JkG
 tCcIa0nOJloUOFIcft4pZ22cH4Cv1pgRaygqYLo8803igkZ9Ko+Ha9oXaD2b0lvu7E4KH67V8
 TgD7nXtPNdkVR43S59R1697XmNk3QSHRX1DgCsxaVlGVha3ib0vy+x9RKEf+nteqWQLyJ2+/d
 2igjz2EcASGGEDD//sa+GOPZwzQYofBOaKdDOe9soWlY4SRYAkL2iFyt32IRuXZibtURu2ov7
 fh3FjV4cHRP5eQ1Og09QDyo+MCAy74ICgcmmQqefiXh6xut2rrLSTGLS/gzYb5Wp6kCNk5EHc
 qcWal6g8UJ8CAaUj6CLPQzGC+hMFnQ0fwOb87pvqaXemi4qA5SKIDjoy4Ndh2RFrh0FsLiXuT
 s+Vs7qb8nSFakLX3AbcumHvaZ+6oPSlfFSfIVekiuddTSpIbVwYixBzCk+bgq1pcXsOGMP8cL
 L2X9ppJEeDCmCoKMZ5Ou+lLwiN3mU+4pzzdecbl3Y58YCRmAloJBazCnRtOKXbEb5wgUFLSRE
 TKKnOFS4eWINjN45MInGJLcQH1cqfje9AZNEO7amNjTrgydNl8tIiQ40qt9TrGD1Z7MCHv/cC
 /beJekHG+iils0aAT8UDfqSam+wqVF91Wm4zvMM9jL5Nf7qvj0mh9Wf1k2X5uOBX3La0kDqFP
 CD/77nvXElGhvsXXUO84jTTmfYk98z3fin43utWrPqoZ+JFklfALNA+B78HBzE7NGx5UXbjxc
 6XEnma4Ob/mR2ks6b0RiwDaJEA+wYjfg5KhWzjdEvzwXG+xvOUWkqbn2PmTXQcRIMpkAx0lZC
 Mc0RAkRIIIpG3lgH7g+zZBiC6RX+G7clTIGvQvEoc+cl0CjV1ibK/5xaNRfvxvMpWPfoPEIgs
 7LkOFQs3MrzAsWpdnB7NS7xvyHxPlw3YNSz9/vGe6WHCZVUtOwC/FpLby+tPoRwd2PjMeKokl
 UXdYT1aYqkxAsJ4ZiBBxJnjkiqi/azo64RgfyZe5KgRewpFshKXoTdo9TNMgXcsygZGtswR8i
 sTf/6uwsfSUYP1KvjRyPvF+oKmPod75SPFowa0J0A1LflK+TbLm52cZzZgwsAkc+rILIDpxBQ
 fbn1LfkUEStZ8KygjTFhXoxcZ

Hi Linus,

Please pull the patches for the parisc architecture for this merge window.
Nothing exiting this time:
header cleanups, a printk formatting fix and enablement of building with gcc-15.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit b4432656b36e5cc1d50a1f2dc15357543add530e:

  Linux 6.15-rc4 (2025-04-27 15:19:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.16-rc1

for you to fetch changes up to 213205889d5ffc19cb8df06aa6778b2d4724c887:

  parisc/unaligned: Fix hex output to show 8 hex chars (2025-05-31 16:50:39 +0200)

----------------------------------------------------------------
parisc architecture updates for kernel v6.16-rc1:

Fix building with gcc-15, formatting fix on unaligned warnings
and replace __ASSEMBLY__ with __ASSEMBLER__ in headers.

----------------------------------------------------------------
Arnd Bergmann (1):
      parisc: fix building with gcc-15

Helge Deller (1):
      parisc/unaligned: Fix hex output to show 8 hex chars

Thomas Huth (2):
      parisc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      parisc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/parisc/boot/compressed/Makefile     | 1 +
 arch/parisc/include/asm/alternative.h    | 4 ++--
 arch/parisc/include/asm/assembly.h       | 4 ++--
 arch/parisc/include/asm/barrier.h        | 4 ++--
 arch/parisc/include/asm/cache.h          | 4 ++--
 arch/parisc/include/asm/current.h        | 4 ++--
 arch/parisc/include/asm/dwarf.h          | 4 ++--
 arch/parisc/include/asm/fixmap.h         | 4 ++--
 arch/parisc/include/asm/ftrace.h         | 4 ++--
 arch/parisc/include/asm/jump_label.h     | 4 ++--
 arch/parisc/include/asm/kexec.h          | 4 ++--
 arch/parisc/include/asm/kgdb.h           | 2 +-
 arch/parisc/include/asm/linkage.h        | 4 ++--
 arch/parisc/include/asm/page.h           | 6 +++---
 arch/parisc/include/asm/pdc.h            | 4 ++--
 arch/parisc/include/asm/pdcpat.h         | 4 ++--
 arch/parisc/include/asm/pgtable.h        | 8 ++++----
 arch/parisc/include/asm/prefetch.h       | 4 ++--
 arch/parisc/include/asm/processor.h      | 8 ++++----
 arch/parisc/include/asm/psw.h            | 4 ++--
 arch/parisc/include/asm/signal.h         | 4 ++--
 arch/parisc/include/asm/smp.h            | 4 ++--
 arch/parisc/include/asm/spinlock_types.h | 4 ++--
 arch/parisc/include/asm/thread_info.h    | 4 ++--
 arch/parisc/include/asm/traps.h          | 2 +-
 arch/parisc/include/asm/unistd.h         | 4 ++--
 arch/parisc/include/asm/vdso.h           | 4 ++--
 arch/parisc/include/uapi/asm/pdc.h       | 4 ++--
 arch/parisc/include/uapi/asm/signal.h    | 4 ++--
 arch/parisc/kernel/unaligned.c           | 2 +-
 30 files changed, 61 insertions(+), 60 deletions(-)
