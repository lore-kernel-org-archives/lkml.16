Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B9A2AE99;
	Mon,  3 Feb 2025 07:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738567467; cv=none; b=jNH1j+VoxJSzufGyk68BDIQsW/GyEfhNi2Hu+4AtHIe/7RA5oqoOnY/bTHI8YX4yKtHj1hqQBo24rsbA3OtPk72ejGk/fOnFSWEJl6NsBg/ou4Ca1qDNMwb3NEvyo6BDMvRK8n8tgnjGVRZd1NnMqC7cA63mKNwsJDQ2xbRPwLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738567467; c=relaxed/simple;
	bh=OqgD85/7bIAJyUYEBqgq8wzvekzYox1KAlmROyC8qI4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SLWAer/HyI1p6Alo/0n2IsdO5pn+1/ffepyJpdLXRQ6MBt6gW3S4qU5J1N4taPggy91AsxuF5Qy+JWvXV0qrXi6UIHcr1F5VAssvOiEeIgWZvm+DLvPE7Zh8nJz+ES+hauz2iJl0NtNK90ag5/8J5+mw16ksV8c3Lz94qMOu540=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wdF6T+KC; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wdF6T+KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738567460; x=1739172260; i=markus.elfring@web.de;
	bh=76ak89OEGf6cpJT+ox2q4ztkodd+5nXQpwjXqZ9yOKc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wdF6T+KCAbAQPHtval/iWwDO33k8/S4h1JYkZkuCvIRGwjbHt4JnkKQi+xGR4+Bw
	 H0BC5+gGoV5Bkygpv1QydzwlAEMqnRTPt5Z3tdA+s/szywNlr8krtmc9bPgqTJL/l
	 m43pM0uYNjr86d6LJoGFn3vRbfVvmmH3UhogIx6YkeHzpIK88ewzM5ltRK0GmHuYz
	 uJ65bY3H4HxJCiICSVN16WeM9AA2cOSDCyj2pE3qtIfe6LG8MfIcoZleKl+Ic730P
	 z8CVRgmJuWNeKZ9UYlho4uzq63KesQSPsgvhMznyhGunfkF9iBghglX/9RlPGodHP
	 saV32DJWQnwT3Ot5pA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.29]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MyvBA-1tSHoc1goM-00tLWv; Mon, 03
 Feb 2025 08:24:20 +0100
Message-ID: <80cae791-663c-4589-b67e-d4d1049fcd98@web.de>
Date: Mon, 3 Feb 2025 08:24:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [01/16] coccinelle: misc: secs_to_jiffies: Patch expressions too
To: cocci@inria.fr, Julia Lawall <Julia.Lawall@inria.fr>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Easwar Hariharan <eahariha@linux.microsoft.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, Ricardo Ribalda
 <ribalda@chromium.org>, Victor Gambier <victor.gambier@inria.fr>
References: <20250128-converge-secs-to-jiffies-part-two-v1-1-9a6ecf0b2308@linux.microsoft.com>
 <565fb1db-3618-4636-8820-1ca77dad07a2@web.de>
 <2402812d-b818-4d1b-9653-767c9cd89dda@linux.microsoft.com>
 <9ca0337d-e378-4de5-99be-1dfa1d4f8cff@web.de>
Content-Language: en-GB
In-Reply-To: <9ca0337d-e378-4de5-99be-1dfa1d4f8cff@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HFy0LVj+DeY80/+bsPHMXBwLtRD+7CynvELc3D19FkeUZr+iQwn
 tQDzZFV/qBLLeet8ApiuPh0I0fDpfZYd7gmj26W2keHKbLVpFDZRGgRPrOcXEbVUrR+hUaV
 oddoLg2mxi2s/7bATo0/je8bYMTNkYAP2FlDbhSr3XDhlVQaXki0I64NZVmAvG90SGe6I1f
 S9Rwr0P4NtnFwriJhZI6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G8MfkOHipCo=;iGUbWBarwetgRpfOnz+/TFA0Ypd
 0XD5yRGwm0/UY0h0Nm/X3ZYENbJS7LSO33rohKyPfAO2kizP7kWsiwuBCcqY/DB3Q1yGiA1FQ
 BKl+aWQhhInChLUFyPTwYiHRiO94ip3qo8fW10x/8QZLXRr9tHpNlErB31KGh5UJSJZ43KLmj
 I1C31EUGLVjPS+TZvtuTGYlz5qs66MXi6YtFGxtx9nUcnkBfJwerFcuU5MVOv0jX6UF4+Uj1F
 akR9+Rx617/fs7OVZxKDVO5k9XaH4s6tc/DPle4YR7Q3gAXXaczPSrAHXBpxe59yhl+LMw1zB
 +dJT4d8k5ZOfyi7q2gXgnABMSg+kOGQ2yRxNcoUO5n/a6Rdwvb402lx2MtgKmpQSTnOrTZBR4
 Ubit4jhFfXZjti1SdUG4kznuyUMYdfkvj7j+/cQLIvueqqNn5F1Ys/y6YPMTX6FXjo9WqXfqx
 tu+LjNX2RmN/JXYuojAfMt1/04jvhto6ILRzl9pDX7NoKKl0XP08Fk5gCOMi22fGANLTI7IrB
 JAN6DSyJuOWTT9G4KFZh9E9Vhrz4zkLOB0lek7TeRP3Qc+SQ2hxqPQUPQqFTxw4Uk/MoAJouY
 DaZxxDcKU392sTybh2+XInX100H+Nz53n623w/zsNBnrYmVFxa4N/888+K/+RcR9tyZNeYKXI
 1EJpisfhSsCDRbtNHQGC5jJB6+Y9DbqHu0A79DdMGtxsDxNSQumRxHjHKWsNHR/IP9ThQSUKx
 8nSF2uI8GlAq0lyiAaoWdAJ06rw/k18y46WtCIMnIjY3csQhu7gI5NSd8wwzoHggDOaV1MWjB
 6DlRvlA+Q3xABi+P0OBjb6PpeOaa1+O5ErlPdMon+EjrMGrKbifSKtuGLK4zY+R0gYcESqyt5
 f6MVEp0wc+TZ5+kpGiR6v/Nn3uVhwbHqvxY/jC2xch5gdHYCm4/etXFB9hH4jLDUdLJruyeVI
 wE8dOt6lU6aqFVNHawdSY+CAavWhHR9UJl1fdS47fxgPgufgmd9C+zWucTgaqh6gQYrzqc7iJ
 5k8DtYILabEtOz/ti9dZ0bjIIf63hRJcGFNJchvS40OXTOTi8laX4Yuf08eumLdED6YbmBxwZ
 26Z7uguC35MwXolazAGIVBsKcJ76opr1efjAQX2EGFAxkKlkwmbxkCluc92A1cSYDbMRcdzgB
 MQXXbcE9pBEaJoDOXKpacJz/bk1jWzRWRqhgT9v64/Qfo2yh2CdREzHm8fOKSA57bVvqPTr5r
 p9kdhdVkthhsQXH5fnlC7H97kktZAmfsufNVi5hwJOwe7uiZmq2svb7N5axKqK9TZ/tuvtgMj
 yhCyDwM4MHUSvb+52uC9su3dh5gWjcqr4q5HjWupqNX0r/sZCciDk+7S1h0zV8FYCLT

> I tend also to present possibilities for succinct SmPL code.
> Unfortunately, software dependencies can trigger corresponding target co=
nflicts.

@adjustment@
expression e;
@@
-msecs_to_jiffies
+secs_to_jiffies
 (
(
-e * 1000
|
-e * MSEC_PER_SEC
)
+e
 )


A command (like the following) can indicate how isomorphisms are applied
for the transformation of some data into SmPL disjunctions.
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/bd08cad3f802229dc629a=
13eefef2018c620e905/standard.iso#L252-257

Markus_Elfring@Sonne:=E2=80=A6/Projekte/Coccinelle/Probe> spatch --parse-c=
occi suggestion3_for_Easwar_Hariharan-20250128.cocci
=E2=80=A6
@adjustment@
expression e;
@@


(
-msecs_to_jiffies
  >>> secs_to_jiffies
(-e -* -1000
  <<< e
)
|
-msecs_to_jiffies
  >>> secs_to_jiffies
(-1000 -* -e
  <<< e
)
|
-msecs_to_jiffies
  >>> secs_to_jiffies
(-e -* -MSEC_PER_SEC
  <<< e
)
|
-msecs_to_jiffies
  >>> secs_to_jiffies
(-MSEC_PER_SEC -* -e
  <<< e
)
)


Grep query
msecs_to_jiffies



I find parts of such a data representation improvable.
I would usually expect here that parentheses for the selection of call par=
ameters
will not appear in the first text column
(so that confusion will be avoided for the usage of delimiters according t=
o SmPL disjunctions).



The isomorphism specifications represent also a software development statu=
s.
It seems that they do not contain direct support for SmPL disjunctions so =
far
(as an explicit entity).



The identifier =E2=80=9CHZ=E2=80=9D is used by the referenced macro.
https://elixir.bootlin.com/linux/v6.13/source/include/linux/jiffies.h#L530=
-L540
https://lore.kernel.org/linux-kernel/173831299312.31546.879788998548796583=
0.tip-bot2@tip-bot2/

Is there a need to take further (preprocessor symbol) variations better in=
to account?



How do you think about the handling of multiplication factors within bigge=
r expressions
(and not only at the beginning or end of a term)?



Would you be looking for further restrictions on expression combinations?

Regards,
Markus
