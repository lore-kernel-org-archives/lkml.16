Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDDD139566;
	Wed, 23 Apr 2025 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745438454; cv=none; b=I3QiY0AeisOOaVQ67+PhJWg7hsxF9cJNwx+Mkbrm5AmVHQBDu/YZq54+vr5obcLlRpDsFZZCWxOSQ9Nk0WFtrtleVMywL8mMDvZ2jHmckoKcDV17kUs8bRdZg/lUvYF0HqQZoq22qNWPUxsZRnGmKKu+qrEIYE4uK7C7d4vhJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745438454; c=relaxed/simple;
	bh=eeN4uP6ZPXCS0FAApmam56hAV3urgK48l5lZpCceTos=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oxCmc8RdOh17IS+ZJ+PbqAp4Mzt4pA/JSqcoevV4G8JNX1yQGyXXBibSgDO08dd+VC9NPE3zqU+IeIJlw04VG7y6+vCpyhWESQWXxFI01w8POFuU+TvTbNLSPN68AFnpyecveeDSbvxbYoAtnPeLBi6QCi+657G6KpLEe4ObuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=TyU7OtVp; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="TyU7OtVp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=eeN4uP6ZPXCS0FAApmam56hAV3urgK48l5lZpCceTos=; b=TyU7OtVpzcaiONQbKs/29i/Jgy
	DTlRT+1cTVcTuip0jxv5tEy0OpGclo7qvPq2314W5N/WyIbH29S40TQNHpOpFi0iy8ui2TnbZEuZ3
	Tx8Jo8BHeXo55/is26yWsR2WvMgxLa9uUrIv1DTb5F5L+FCCWH5KOjb3YPy0vF9dDftkbufGlMsPc
	WZirD0DF4jdkwKjtBrzMec/bIHai07EyhojFU1wLTwLjAVqVYw++O70wrbzXT6IWgMcYBKwyeDimO
	DNO/+lLGnAWDy3oTvNUkQE4UcmZN7ziwRwFEmD2XGWxUFyV+QzzEdi1f7H9dpDbYsoMQVcRmhPTRX
	7e10P8dA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1u7fuk-000P4e-1E;
	Wed, 23 Apr 2025 21:37:45 +0200
Received: from [92.206.190.59] (helo=[192.168.1.141])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1u7fuj-0006e4-1i;
	Wed, 23 Apr 2025 21:37:45 +0200
Message-ID: <967a33de6bd994c6675fef8acd53508d19c917dc.camel@apitzsch.eu>
Subject: Re: [PATCH] ASoC: wm8998: Add Kconfig prompt
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela
	 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, Charles Keepax
	 <ckeepax@opensource.cirrus.com>
Date: Wed, 23 Apr 2025 21:37:44 +0200
In-Reply-To: <8c49fe8d-460e-4587-8d37-1208aa7dad7c@opensource.cirrus.com>
References: <20250418-wm8998-v1-1-21c4bead9cd8@apitzsch.eu>
	 <aAZS8XVHtw5zxD2d@opensource.cirrus.com>
	 <8c49fe8d-460e-4587-8d37-1208aa7dad7c@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27617/Wed Apr 23 10:38:53 2025)

Am Mittwoch, dem 23.04.2025 um 12:09 +0100 schrieb Richard Fitzgerald:
> On 21/4/25 15:15, Charles Keepax wrote:
> > On Fri, Apr 18, 2025 at 10:22:04PM +0200, Andr=C3=A9 Apitzsch via B4
> > Relay wrote:
> > > From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > >=20
> > > Add tristate prompt to allow codec selection.
> > >=20
> > > Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> > > ---
> >=20
> > Generally its good to say why one wants to make the symbol
> > selectable, usually its to use it with simple card, although at
> > least historically I think simple card struggled to handle the
> > required set_sysclk calls for these codecs.
> >=20
> > But I have no objection to this being exported:
> >=20
> > Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> >=20
> > Thanks,
> > Charles
>=20
> Yeah, I just checked simple-card and friends and I see no evidence
> that it has a way to make the necessary calls to enable the clocks
> and PLL on the WM8998.
>=20
> Of course, the intended machine driver might not be simple/audio-
> graph so that might not be a problem. Though a more specific machine
> driver could simply select the codec driver it uses.
>=20
> This is why it helps to say why you need this change.

Hi,

the WM8998 is used by the BQ Aquaris M5 [1]. I forgot to mention it in
the commit message.

Best regards,
Andr=C3=A9


[1] https://wiki.postmarketos.org/wiki/BQ_Aquaris_M5_(bq-piccolo)
