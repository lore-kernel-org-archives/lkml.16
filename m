Received: from mx.skole.hr (mx2.hosting.skole.hr [161.53.165.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377EE1F4160;
	Mon,  7 Apr 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.53.165.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037181; cv=none; b=kidkAp2mpsTujBRSO2uGCq3vSk3jlCnfC15i2iYuU/Q0DgOK/ND0CT5SOa9ConAglYLPt+rwUz1ipRK66gknIdZEyV4R5kFuyuWCvDP7f+qrD9xx1PLYs+yfA4qaz8aOs2h2Q7OzedFDzF6B4Foxe1FNhwxK/1Um06HcAvIPLfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037181; c=relaxed/simple;
	bh=Z92JR4zUuoOdidOhoZgrwuyKBqUSeognIf9uluCZ6dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tuLvtSS2FshyTDls8rACdBS71xIe1UATVb+XVN//Sv4CTmhwCUBd/LSN4CUcCF2BhDo5KaroQgSsQo1CDwkhvIediMk07uNPjMqDA0t070mFLNv32CByl2rI2jn+YEmURKpCFfCwv4uk4w7Q1uJn1kfLNccAkH58PQ6N+5Cyrkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr; spf=pass smtp.mailfrom=skole.hr; arc=none smtp.client-ip=161.53.165.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=skole.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skole.hr
Received: from mx2.hosting.skole.hr (localhost.localdomain [127.0.0.1])
	by mx.skole.hr (mx.skole.hr) with ESMTP id 9BCFA83320;
	Mon,  7 Apr 2025 16:38:58 +0200 (CEST)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje.mihanovic@skole.hr>
To: Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-spdx@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Date: Mon, 07 Apr 2025 16:38:19 +0200
Message-ID: <12647854.O9o76ZdvQC@radijator>
In-Reply-To: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=duje.mihanovic@skole.hr;
 keydata=
 mDMEZokhzhYJKwYBBAHaRw8BAQdAWJZ0hsI/ytTqHGFV8x6tzd5sB596cTeeDB4CQsTf+wC0KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBG3/QdYN8x
 S1t2umMK0xk1JFj60DBQJmiSHOAhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJEK0xk1JFj60D1GABAJVSorZdMOlrp/oQtCSH/G53NE56x/JHA8VX+ZQBd/H3AP4/EcUf6eef
 DUxVMh2bdkmuQKsVZGgOGiXpMksrVntWBrQpRHVqZSBNaWhhbm92acSHIDxkdWplLm1paGFub3Z
 pY0Bza29sZS5ocj6ImQQTFgoAQRYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSH/AhsDBQkJZg
 GABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEK0xk1JFj60Dlw8A/i4lPOL7NaYoYePDq
 l8MaJaR9qoUi+D+HtD3t0Koi7ztAQCdizXbuqP3AVNxy5Gpb1ozgp9Xqh2MRcNmJCHA1YhWAbg4
 BGaJIc4SCisGAQQBl1UBBQEBB0DEc9JeA55OlZfWKgvmRgw6a/EpBQ8mDl6nQTBmnd1XHAMBCAe
 IfgQYFgoAJhYhBG3/QdYN8xS1t2umMK0xk1JFj60DBQJmiSHOAhsMBQkJZgGAAAoJEK0xk1JFj6
 0DG5MA/iuo4l2GDEZ1Zf+XaS//8FwdXDO9nHkfbV2MHjF4NZXwAQDroMzBdMcqVvc8GABFlTTgG
 j7KrRDz2HwWNyF8ZeprAQ==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 25 February 2025 14:10:41 Central European Summer Time Ricardo=
=20
Ribalda wrote:
> If the git.Repo object's scope extends to the Python interpreter's
> shutdown phase, its destructor may fail due to the interpreter's state.
>=20
> Exception ignored in: <function Git.AutoInterrupt.__del__ at 0x7f1941dd56=
20>
> Traceback (most recent call last):
>   File "/usr/lib/python3/dist-packages/git/cmd.py", line 565, in __del__
>   File "/usr/lib/python3/dist-packages/git/cmd.py", line 546, in _termina=
te
>   File "/usr/lib/python3.13/subprocess.py", line 2227, in terminate
> ImportError: sys.meta_path is None, Python is likely shutting down
>=20
> Use the `with` statement to limit the scope of git.Repo and ensure
> proper resource management.
>=20
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

checkpatch suddenly broke for me with the same error as shown here and the=
=20
patch fixed it.

Tested-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>

Regards,
=2D-=20
Duje



