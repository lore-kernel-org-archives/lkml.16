Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3048CFC;
	Tue, 29 Apr 2025 20:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957116; cv=none; b=jw+7mjUGjDMYElDXvZ2qi9p3oSHX2ryVl7+FIdBtLrdDdTgTTE20n0FqeIzOwpl1vxUoHvV7xnpj2NilHoQlNGNbq2fk46j5LRnkXOz41FFew4xzkk4ID745ZpKP+A9ehJBdnZBbsoxLH69pdBFkdeUiy5noDygxrxHpUOqN/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957116; c=relaxed/simple;
	bh=CH8sSlpxog/OcbKyxWb4I/Q8dJEc4mRErAiIp6l4Ju8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MDPxB+EdzJK4iGmOczDGL5E0lFT857a2Ib2oiVoKTdxwUNZSHe7AxnPdLoNDKpjeoD0VAZ4xaIvXQu0LvZPQP9BUTe5Kv3lOB7oS+wC6G/CsVOSKGl2FeMO84PjLtnYoxDOpqe0E46j2/Wht2lvhshFAEpARv2svFKeB5vr7M6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 3286D1CF6EA;
	Tue, 29 Apr 2025 17:36:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 934AA20011;
	Tue, 29 Apr 2025 17:35:50 +0000 (UTC)
Message-ID: <1490923bf0b7d5e32ded1393c1f7a3e4e640de5b.camel@perches.com>
Subject: Re: [PATCH] checkpatch: remove %p4cn
From: Joe Perches <joe@perches.com>
To: Aditya Garg <gargaditya08@live.com>, pmladek@suse.com
Cc: admin@kodeit.net, airlied@redhat.com, akpm@linux-foundation.org, 
	alyssa@rosenzweig.io, andriy.shevchenko@linux.intel.com, apw@canonical.com,
 	asahi@lists.linux.dev, corbet@lwn.net, dri-devel@lists.freedesktop.org, 
	dwaipayanray1@gmail.com, geert@linux-m68k.org, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@rasmusvillemoes.dk, lukas.bulwahn@gmail.com, marcan@marcan.st, 
	mripard@kernel.org, rostedt@goodmis.org, senozhatsky@chromium.org,
 simona@ffwll.ch, 	sven@svenpeter.dev, tamird@gmail.com, tzimmermann@suse.de
Date: Tue, 29 Apr 2025 10:35:48 -0700
In-Reply-To: <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <20250428123132.578771-1-pmladek@suse.com>
	 <PN3PR01MB95971954FC5E026C59B6F8EDB8802@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 934AA20011
X-Stat-Signature: ty3t4amg1am4wfranj4it66hgc5ywusk
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Pi+sZD950+7lYGkQr89DieUnwzGYH3J8=
X-HE-Tag: 1745948150-531653
X-HE-Meta: U2FsdGVkX1/F/WflSpAiJ6Heq+tSmgatCv6cN3WW0dk6b5ZPd+jMUMgkgjrAVyTPWC1efrCNTJDnLnXh91eX/OoUJU0btcvbXg4J60vd7JqFt34/NaVW+QRRNzNuF0kha7z0aCOJ2COg6+11wgZuD5Wkuetnuh2tOR3bfaEG14K5bxuu589aJQuZvYWDkIT1pqWusGBVw0brO2eEyTKfCxszgF1+zDiCMvANHDIbyQj+boU7QSiHxFVCMNzUeqeWvHpGJMOekc7SvDDFtH+DJ+mkKclqXy6GXWFeuEh0L8GGQi07oZHfPs5cMjaFnGUG8NJdfCJSN3/s513PP4ctRcSx11Qd6FNK

On Tue, 2025-04-29 at 16:07 +0000, Aditya Garg wrote:
> %p4cn was recently removed and replaced by %p4chR in vsprintf. So,
> remove the check for %p4cn from checkpatch.pl.
>=20
> Fixes: 37eed892cc5f ("vsprintf: Use %p4chR instead of %p4cn for reading d=
ata in reversed host ordering")
>=20
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 44e233b6f..f79f0a085 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -6891,7 +6891,7 @@ sub process {
>  					    ($extension eq "f" &&
>  					     defined $qualifier && $qualifier !~ /^w/) ||
>  					    ($extension eq "4" &&
> -					     defined $qualifier && $qualifier !~ /^c[hnlbc]/)) {
> +					     defined $qualifier && $qualifier !~ /^c[hlbc]/)) {

Probably needs to be something like:

					$qualifier !~ /^c(?:[hlbc]|cR)$/

>  						$bad_specifier =3D $specifier;
>  						last;
>  					}

