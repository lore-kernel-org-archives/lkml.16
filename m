Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833774437C;
	Sun,  4 May 2025 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746373435; cv=none; b=UNVoy1ADIZwxJ9+PMIWp64MoGPCubEaDomrZ40rWFBhfDX7k9PFhLSGc2DOfl0ayzYy4L3PNom8L/wDR+ZTfjeqP7SWvMSpGBTwk1I03ns4sPd4mI7nx+dFvzVy2/00d+U45YihxuX+PrtPAx2GrVZUMm5Epi8TBNTQ7sQoECeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746373435; c=relaxed/simple;
	bh=6DJau/ACCvP1u3X6+20Sa5uRqyjyrp8RV0gNi2WDDQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pX8eQh2OBIt8opxtQILlE94gZTt9Dq+mZXM2SGlchlWK2zaRpCr8lJPMEqj4437uImjjp1vqzXjd6V/4we/LzXpxBbdCyfrMPXhm1tBtKVS9+6QfAuhfEN3h2YSevRUd7QqVpc2TP2JwxuvW/pRac3busaxZ16FjBn7HKXtrnEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=hLMG7WHO; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="hLMG7WHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746373430; x=1746978230; i=deller@gmx.de;
	bh=86M3Ya/VEjd0CJsvpFsdMEi9HnVfOkADn+aFXBwuci4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hLMG7WHOosrmnuRjtf4C/hO7fdTIEqNtPuj3aH6mx312QRV7ubuPsTA4op7vPvgW
	 tglqULzhd5WH43FRZGxOWXcx7afqyX2dAnI4C71KQhtxCSrqaOksxwn3e9jMpFM2v
	 DPIpwYVecrf2xUBlCUmviNRQoa8RRTD+7n63pMh1Ej3ROXpeJBiO/kSGv1BUBdnGE
	 70SEI/nmtUWqh5dAm9UYKzxveFOVyEWmha3wJiP0WAC8dBZZmd8RFOsxsC10AUz5m
	 L/cvXP/RSjy2aIikRQoiT1tVYioC8i4XnoFQS5UFS6WP/NEoE+qw4iTd0FTtFh5vn
	 qsqPNwYxmRTKY720Zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100 ([109.250.63.181]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9MpY-1v5gig1rPQ-00x5iw; Sun, 04
 May 2025 17:43:50 +0200
Date: Sun, 4 May 2025 17:43:48 +0200
From: Helge Deller <deller@gmx.de>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>
Cc: Camm Maguire <camm@maguirefamily.org>
Subject: [GIT PULL] parisc architecture fix for v6.15-rc5
Message-ID: <aBeLEPtn_fpuBgFz@p100>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:xwDmdXgtxcmXQ/PqVNw2FobIo5yaqNfufsShbFAEViO/eCo9p+p
 qHCQabuIntEO1QU/BM8ucVzqWJKpcfKO/dbwJiR2NZUg1vlbuDLbakZpfTkonJm0EQhjMVZ
 EPHZNKJDim1bEDHOieiqyAFq5yZRxFFAhuQH74mL7ijBQP4xbEm8vsFTwZERaA8ZzvV1JnB
 GbXn/B4z8mAytX2uaW8lQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JkOIJ8AgG0s=;826ARpRybcTKu4T1th43PxoKfAg
 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
 g==

Hi Linus,

Please pull a fix for the parisc architecture which
prevents programs crashing on a SIGFPE signal.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 38fec10eb60d687e30c8c6b5420d86e8149f7557:

  Linux 6.14 (2025-03-24 07:02:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git tags/parisc-for-6.15-rc5

for you to fetch changes up to de3629baf5a33af1919dec7136d643b0662e85ef:

  parisc: Fix double SIGFPE crash (2025-05-04 17:30:03 +0200)

----------------------------------------------------------------
parisc architecture fix for kernel v6.15-rc5:

Fix a double SIGFPE crash.

----------------------------------------------------------------
Helge Deller (1):
      parisc: Fix double SIGFPE crash

 arch/parisc/math-emu/driver.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
