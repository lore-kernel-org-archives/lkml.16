Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1140299AAF
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749744547; cv=none; b=ViVLU5JqKN2t51vr2hkqJUY6P//Y2cS7ajKDOb8Ew4c8JJ2affiFySr9Z9Vn9S42bQYSTume+qRgh8KK+Hl+XUCXW5blPO5bSiXQqyQ9v/qVkE+CHGS1PFbwoMsxwLTOD+x8BMBtroRfDWvFD1QZ44TYqOcihKbXjASnpIIi6cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749744547; c=relaxed/simple;
	bh=5ZsFqs6YRBSpEXPJ66K163muhjEApZge0VBuemuztS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=Qh60UO+/j1lTaWKFNzUbDixlKaF0DIMH+qmS9IkSX+Y2SywTnUkQLfYQOCCWicTOwFBy7biiip9c4DH1iym3slpBFdAGgsnXamxyZKqnQfdQiv9jSHRDh5kgI1ovhQyg/IyY71oGjvPhqud0/mrSWwxd3t7zfpz+yt6Xs4XKL0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=dw2otF2z; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="dw2otF2z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1749744532; x=1750349332; i=markus.elfring@web.de;
	bh=APZOXjECcKxUksmd/sNY9sgNAxEMEPXyb6RUNIXv86Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dw2otF2zTfCBY0S/lRappzkh7U77HXO2T42PdaJ34PFKOki8nlFcDcGT+ZL8deeW
	 GtZm0y1v1JuW9xPueJ1K/oqwL03KdCzCmxImQFV+Ko3iUNZMABxA2VZNQUMIQulBo
	 USREmCgVIC/HuCeEt3aZG8QoXjNYHPRVFbV0WVvkZTQgzJ0R6F2mLNCatQtnKojhi
	 AZazCjyKdk4JbmliT/IrIlu7mzVVpOrAQuj1fdN0dpgmv4tZfmGZrzCPxEhxjxCw0
	 FeftqPEFLFfvuXnR6Lhc/q8ai7Xa4gNX2tVsNpAYPmbcBzfKAHRg09/fhyxFS8jzt
	 zXltv1vGcdg0qa9BiQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.213]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MCXZh-1uYEfw3amB-001XEi; Thu, 12
 Jun 2025 18:08:51 +0200
Message-ID: <42bc5a8c-1b3d-46cf-a8d8-1b54ebf5ecbb@web.de>
Date: Thu, 12 Jun 2025 18:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH v?] coccinelle: misc: secs_to_jiffies: Implement
 context and report modes
To: Easwar Hariharan <eahariha@linux.microsoft.com>, cocci@inria.fr
References: <20250610174521.12294-1-eahariha@linux.microsoft.com>
 <00e40c21-4797-41df-b082-318f474f76ae@linux.microsoft.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jakub Kicinski <kuba@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Ricardo Ribalda <ribalda@chromium.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <00e40c21-4797-41df-b082-318f474f76ae@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Q4yP38GzTqLlnhOK25hukdskfLeFwr8aAoul3NnAQ3m30MyraQF
 H+n3IxdhZU4b5qPYNFMOK7hxI3RJ5KLJ1IDTnU67OlbbTSmRl0wIcOOwniZgXVhOMg7I+/+
 xvY/7eJk1hZdHXkETQEbfRRlxGls4qIf0pVJwkm+wSUCILz3OvxLgbD7p6mrmXVXAe/HpOf
 KYnWj4eXn+9TKsh0EsRyg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wfm5OIaZZaM=;W91Zq/84ssN3wnkY8d0m9NaTwBD
 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
 G+Kkiki

>> ---
>> scripts/coccinelle/misc/secs_to_jiffies.cocci | 49 +++++++++++++++++--
=E2=80=A6

Did you overlook the addition of patch version descriptions?
https://lore.kernel.org/all/?q=3D%22This+looks+like+a+new+version+of+a+pre=
viously+submitted+patch%22
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.15#n310

Will any information from previous patch review approaches trigger more de=
sirable effects
also for such an SmPL script variant?


>> -@depends on patch@ constant C; @@
>> +@pconst depends on patch@ constant C; @@
>> =20
>>  - msecs_to_jiffies(C * 1000)
>>  + secs_to_jiffies(C)
>> =20
>> -@depends on patch@ constant C; @@
>> +@pconstms depends on patch@ constant C; @@
>> =20
>>  - msecs_to_jiffies(C * MSEC_PER_SEC)
>>  + secs_to_jiffies(C)
>> =20
>> -@depends on patch@ expression E; @@
>> +@pexpr depends on patch@ expression E; @@
>> =20
>>  - msecs_to_jiffies(E * 1000)
>>  + secs_to_jiffies(E)
>> =20
>> -@depends on patch@ expression E; @@
>> +@pexprms depends on patch@ expression E; @@
>> =20
>>  - msecs_to_jiffies(E * MSEC_PER_SEC)
>>  + secs_to_jiffies(E)

Please reduce duplicate code for such SmPL rules.


>> +@r depends on report && !patch@
=E2=80=A6

Please reconsider the condition selection once more.
SmPL code can probably be shared between the operation modes =E2=80=9Corq=
=E2=80=9D and =E2=80=9Creport=E2=80=9D.
Would you get further development ideas from previous contributions?

Regards,
Markus
