Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8D1C5D7D;
	Mon, 28 Apr 2025 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745830877; cv=none; b=T9hY7D1Vd1eirf8+eEBwOnf7FkKMcmpWCUvf45yRtu9+47eYB6o+LcCgqbKFZGdFmMa6hcqJVM4w04FZD5rqQF6JzeuD82wtd+u7+zPa2vavuYnq3d3PwBadWs6dLfUQTAkajNdiOS6N0nIXDs+n+SnL3+SLwL01AxAGX7gMdws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745830877; c=relaxed/simple;
	bh=2FiqQ0lqpxnXDiKt3Y64cAG6xao81V1A55zkKBRZ6KQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=m1QbYecml2Sw9QBdMC0Yoh6LokLQZYLbY8P07LfbZ1H1WMSw/knqfWjx5t0ZUuFjggc0GX31WwKYJB2WO5qAmZgQvuqMOI/mbxENgvEI3uw2tzM4WirXhte/kOm0UeChoe5tPWesvzWcHfhej2FGRovBQCMoTZvDOlhd9NgyfNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GB1kbE3K; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GB1kbE3K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745830854; x=1746435654; i=markus.elfring@web.de;
	bh=N5TM2MWXPktxJ6+QkYB1LobVq7/QhRKnPDbuFXe/aXQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GB1kbE3KxnsU0klSc+Nt+fqK1SB5braPL0jhiB3ANSBq7yP2nx8hbE3+5zyp09Z2
	 pLP8QwqjpeoTJJdaPSBIMtbTojtT6pI2nyCldMwL6LDODNSj8J63EVA8JR2wctOwn
	 egccmm6R6KTJPnqgbT7HSD9cKxJ00FFmdON1In7ZVHJ+QU39YAqSY9wBmNyokq+23
	 tX4VDyaklPO+6j8tz82sil4cMr6+1cI18taevp04WK9IZz+ZnwiT7nxuloetCETc5
	 AoAsX3cM22OJi9SF3nGmMuabl9mNKzaE0t3MkdsdFR/bO136YjqfMgMiErWZGHtno
	 jXK/aa8u2rVsDSBLFg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.68]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MV2Ka-1uY2ka1WGE-00Yv4e; Mon, 28
 Apr 2025 11:00:54 +0200
Message-ID: <edab112f-9449-4862-8f8a-0beae136e0c6@web.de>
Date: Mon, 28 Apr 2025 11:00:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
References: <20250428061318.88859-2-thorsten.blum@linux.dev>
Subject: Re: [PATCH] regcache: Use sort()'s default swap() implementation
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250428061318.88859-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jYu1RbvTuavSHVuDYYd1PGKmz1Cij6OikwHrZn+YTrZY7+roVcx
 iANh31gwRuBqBzDlRnANjub2DiVnTYEt/t5URbS8bX7yJIWiR09TwnEIU73S1E6X4+g1FIz
 mk+uMJRgRyKtEl9CFw6A+iUmL1kn9hRYto6jDnrIyt2ASITP7jIErIjTI5kFYas6nYNzPJt
 lb3tKYx/xnquBgYfJClBw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EbpGoGf2SVg=;Y678rU9vnGiiKBZGUWMtY/nypG9
 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

=E2=80=A6
> +++ b/drivers/base/regmap/regcache.c
=E2=80=A6
>  void regcache_sort_defaults(struct reg_default *defaults, unsigned int =
ndefaults)
>  {
>  	sort(defaults, ndefaults, sizeof(*defaults),
> -	     regcache_defaults_cmp, regcache_defaults_swap);
> +	     regcache_defaults_cmp, NULL);
>  }
=E2=80=A6

Would the following source code formatting become applicable?

+	sort(defaults, ndefaults, sizeof(*defaults), regcache_defaults_cmp, NULL=
);


Regards,
Markus
