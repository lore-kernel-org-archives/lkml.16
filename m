Received: from mta-outp-cfd-1.case.edu (mta-outp-cfd-1.case.edu [129.22.103.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A78D27875C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 12:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=129.22.103.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227068; cv=pass; b=CsTn4UJPcSNYrRowG8MWUNtXm/zxsHo90GJTbXCLgyQRe7v6SCNvuKZgZjxlmVcMxH5VK9lYKdggaFkz2F9HFCexcyJ27DNm2482vJCRDd2isU9Z/D740mSde/+X54OFUSBggt/PrgNEGulFMtWsLNhqqVnal+3/h9HkgSrAnGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227068; c=relaxed/simple;
	bh=ziBnVImEQka1k/5ArPVUpuK5Uv55pJxDufSS4gEWcPs=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nRI1sNIu5lplV4mMddbqICNTJ8E2DICcJ/NajAUeH9dqQ7aBBW9y7QExpwXbsLAV5gJ6CaeMnb/WnViKMRzTtAS0GP1hwR6nULQaxd0wYtpiRjFU9fCv27SpptlfkyBG21jOjbQOQBt48QELkHrhaoPgZWldXtOfRn5wrHwSQis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=case.edu; spf=pass smtp.mailfrom=case.edu; dkim=pass (2048-bit key) header.d=case.edu header.i=@case.edu header.b=JWQiFX7I; arc=pass smtp.client-ip=129.22.103.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=case.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=case.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=case.edu header.i=@case.edu header.b="JWQiFX7I"
Authentication-Results: mta-outp-cfd-1;
       spf=pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.160.200 as permitted sender) smtp.mailfrom=case.edu ;
       dkim=pass (Good 2048 bit rsa-sha256 signature) header.d=case.edu header.i=None header.s=g-case;
       dmarc=pass (p=REJECT sp=Undefined pct=100 dis=NONE) header.from=case.edu;
ARC-Filter: OpenARC Filter v1.0.0 mta-outp-cfd-1.case.edu 50A4050A
Authentication-Results: mta-outp-cfd-1; arc=none smtp.remote-ip=129.22.103.196
ARC-Seal: i=1; a=rsa-sha256; d=case.edu; s=cwru-mta; t=1747227064; cv=none;
	b=hBWNCWvDGyUTgh05ivACAGnPvgzlW4+NMBtCiWsihu4s54iiC26M4XKnZHnJoqqlEWOtE0pQKhxTNlCC5xnuuzu/uW5Y9UU0HNKlBKKIlNIartvs7aP3fNbpBIEvxYKxTznwrlWwf+Uluhan0fqT359vC3tzlm7cNnF1rwphbFbGyezakUiXfjY9Oy1nPFB3HjDKqY664To7goeqTeXAr4gFVT/RS/P0bxcnsjVBDyq2vE4NKfVGKFbdZrt+d6vtbBQM68ataM/J2ElTDGAgVjc4vx499KCcGilsmeSVkNPpfhxZ9U0PxlRU52WS1y71OV2WTv4x6vrUoC4rzbbLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=case.edu; s=cwru-mta;
	t=1747227064; c=relaxed/simple;
	bh=ziBnVImEQka1k/5ArPVUpuK5Uv55pJxDufSS4gEWcPs=;
	h=DKIM-Signature:Message-ID:Date:MIME-Version:Subject:To:From:to:
	 subject:message-id:date:from:mime-version:dkim-signature; b=iufcDIaAH22cKKmLpu3F9SPCkRWrxS96Fshtr7Z3tfryhOTuqgb32cLMrrd5SScTRxuTZG06ONOvNOEWiTbDeqGstTbTSPoTtihWFP+0RF6YeS5P3kbw3rICFr3eUbIzt9ZsG0yB8teZ4e7a4YCtPBnX7HsO997zXouwoDscuupJiHpx7UZ+Eztyq2SQdwKThoUmOSN7iOwaQc04Bl5rZFP+MQjEH68MIyr4VfYgt5ApgwKCCes5wSdeek2UlWI9r1dtLZ9KAHlg+3FcSSuQ5W+TBIc+ZRZ0aj7rml6S0Zb0iQctM8RgycJJ4/95LfDbrV7n3xuuN0uc+wAC4xKEPg==
ARC-Authentication-Results: i=1; mta-outp-cfd-1; spf=pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.160.200 as permitted sender) smtp.mailfrom=case.edu; dkim=pass (Good 2048 bit rsa-sha256 signature) header.d=case.edu header.i=None header.s=g-case; dmarc=pass (p=REJECT sp=Undefined pct=100 dis=NONE) header.from=case.edu
Received-SPF: Pass (mta-outp-cfd-1.case.edu: domain of case.edu designates 209.85.160.200 as permitted sender) client-ip=209.85.160.200
Received: from mpv-out-cfd-1.case.edu (mpv-out-cfd-1.case.edu [129.22.103.196])
	by mta-outp-cfd-1.case.edu (Postfix) with ESMTPS id 50A4050A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:51:04 -0400 (EDT)
Received: from mpv-local-ksl-1.case.edu (EHLO mpv-local-ksl-1.case.edu) ([129.22.103.235])
	by mpv-out-cfd-1.case.edu (MOS 4.4.8-GA FastPath queued)
	with ESMTP id DED33684;
	Wed, 14 May 2025 08:51:04 -0400 (EDT)
Received: from mail-qt1-f200.google.com (EHLO mail-qt1-f200.google.com) ([209.85.160.200])
	by mpv-local-ksl-1.case.edu (MOS 4.4.8-GA FastPath queued)
	with ESMTP id EKB30362;
	Wed, 14 May 2025 08:51:03 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4767816a48cso197679351cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 05:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=case.edu; s=g-case; t=1747227061; x=1747831861; darn=vger.kernel.org;
        h=in-reply-to:organization:autocrypt:from:references:to
         :content-language:subject:cc:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ziBnVImEQka1k/5ArPVUpuK5Uv55pJxDufSS4gEWcPs=;
        b=JWQiFX7Ie/OZz5ou87Ue+h7iD60o97/i7v0/RuKKfOqCaMy/DI/yl2VT7oeviK/qbp
         oAa/t5K2V/kJ4ONJRxAual4BC6znwM8ZS/4pODF31LXPaCsGInm87jYOUK3GUd2gRRkz
         839KtAULdm+K+kgGRmr9G0dhkja3Sy51/Sbb7NZRBTeDhFW3wq9kMahindJmDavIOG8W
         Hre6dZwh4RWHVez6pQks6DpeMMtikXo3EpR35OTXnspxsdqKDLzMZ9JPsu6HDK7ShizN
         pWLTX47CIsvFWSokVgJ/GkUW1embLOhxMln0tqDbPXJvRkbS5me5bYcCbVjthfkThXO7
         2WMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747227061; x=1747831861;
        h=in-reply-to:organization:autocrypt:from:references:to
         :content-language:subject:cc:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ziBnVImEQka1k/5ArPVUpuK5Uv55pJxDufSS4gEWcPs=;
        b=r08NubKg+EU6RYMe8BCmwR2CKo0nL+iC8RXyopZ+XngVmKgg/PFXRdlRaLDitggZZU
         QBif2K13ENZDAOt+mqZqlbFWXAhWhfulaX3ZglzuEqG5Mjmv08FAjYlp05KZSEYphTf/
         ThRCv6XECLE9EjEwYLAyN5Ip7Ee76419oEdsNnqnqeycqfFsHkOHN3molRyAapv22iaZ
         SaWk3FNQpriTnZ3+I4V2qhHVFPMil6KQD60/OzMpE4Hf3aMJ+48ImFPONUwrLXjJQIgL
         Zsw8P3SmPVdwwngZl3KE2hJdwPSLwyHyswUGtnKu8LBxQBksMrbP6AB/WTzpXVybih2U
         P5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpZy1l5tG+A9iAnJW/lnYLttUCHfxeCFOwMD5O4KdZjMF3WalQ1hnZVKlriydP712Ep76Y9FLwN+P5KlY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rTzkpSGHP7tKs/JsSvGQ4mf50glzyqkfcBQqcF49fjg5Nbef
	gOP2QpmUbjRYP2f5hH9HsCaIitnfB8UlsnMa3e+gAFGZi/fIYvOD0fmwz9VgtGnpamtd4/307A3
	srdcT/8jzKtKCoLYzQK4pOoz2BFUK80/B1eYWv819MQc+YCaZ7Sx8S2ImiK0R4aKKKmnGxY8=
X-Gm-Gg: ASbGnctmIbe8lJ3sZOhSAXEbe8KaSKi91dNamN1jEiUSOQjVLh8O6eh6eMAx7qlk09+
	GxCC4j86557lqKoFmfstZGzMl0oDm8Kf1eOEghRDyqlqXwzxdSFVOoB1lkiTocOiilszW5GsTp/
	k9D/6nUP/dzJoknBn2xd4TRRqs4trcbR6O/5J6s8/TNOH7DW6wZTuF9fXMsvyFZiwCncwas8rSh
	NN2I3jwvfEKM5nLpbNI/Jwy20kFGHW74ICuUPpxkV2186XjRFGybKwxtPGkUFIgJ8HeJduUvh93
	aIsP3R/5v5XtocDxU00Si74lclfainsjtW4UtvG93sUfgYj6iLLcLwgfU0x9BbvHRMDWgXwWQg=
	=
X-Received: by 2002:a05:622a:2304:b0:474:f1b5:519c with SMTP id d75a77b69052e-49495cdca55mr60905791cf.32.1747227061187;
        Wed, 14 May 2025 05:51:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzQHI2rEryjYi08itQLGH9hVhvibYUYkKurYuspAd1v6/xkb8OjQbB/Q3z9M0RpvvTMatudg==
X-Received: by 2002:ad4:5bae:0:b0:6e8:f470:2b11 with SMTP id 6a1803df08f44-6f896e566cdmr50454446d6.23.1747227049536;
        Wed, 14 May 2025 05:50:49 -0700 (PDT)
Received: from ?IPV6:2603:6010:dc00:1e:f5e5:3614:5780:f83d? ([2603:6010:dc00:1e:f5e5:3614:5780:f83d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e39e0b8bsm80792476d6.20.2025.05.14.05.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 05:50:48 -0700 (PDT)
Message-ID: <ad62849c-1728-4bae-b0d5-7d87dc94825f@case.edu>
Date: Wed, 14 May 2025 08:50:47 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chet.ramey@case.edu
Cc: chet.ramey@case.edu, David Howells <dhowells@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Marc Dionne <marc.dionne@auristor.com>,
        Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
        Linux AFS mailing list <linux-afs@lists.infradead.org>,
        linux-kernel@vger.kernel.org, linux-cifs@vger.kernel.org,
        "openafs-devel@openafs.org" <openafs-devel@openafs.org>
Subject: Re: [PATCH] afs, bash: Fix open(O_CREAT) on an extant AFS file in a
 sticky dir
Content-Language: en-US
To: Jeffrey E Altman <jaltman@auristor.com>,
        Etienne Champetier <champetier.etienne@gmail.com>,
        Christian Brauner <brauner@kernel.org>
References: <433928.1745944651@warthog.procyon.org.uk>
 <20250505-erproben-zeltlager-4c16f07b96ae@brauner>
 <CAOdf3grbDQ-Fh2bV7XfoYvVBhgBAh7-hZyyxTNt1RfGekrA-nA@mail.gmail.com>
 <66c958db-0408-451d-b362-fed1f56d7c6d@auristor.com>
From: Chet Ramey <chet.ramey@case.edu>
Autocrypt: addr=chet.ramey@case.edu; keydata=
 xsDiBEEOsGwRBACFa0A1oa71HSZLWxAx0svXzhOZNQZOzqHmSuGOG92jIpQpr8DpvgRh40Yp
 AwdcXb8QG1J5yGAKeevNE1zCFaA725vGSdHUyypHouV0xoWwukYO6qlyyX+2BZU+okBUqoWQ
 koWxiYaCSfzB2Ln7pmdys1fJhcgBKf3VjWCjd2XJTwCgoFJOwyBFJdugjfwjSoRSwDOIMf0D
 /iQKqlWhIO1LGpMrGX0il0/x4zj0NAcSwAk7LaPZbN4UPjn5pqGEHBlf1+xDDQCkAoZ/VqES
 GZragl4VqJfxBr29Ag0UDvNbUbXoxQsARdero1M8GiAIRc50hj7HXFoERwenbNDJL86GPLAQ
 OTGOCa4W2o29nFfFjQrsrrYHzVtyA/9oyKvTeEMJ7NA3VJdWcmn7gOu0FxEmSNhSoV1T4vP2
 1Wf7f5niCCRKQLNyUy0wEApQi4tSysdz+AbgAc0b/bHYVzIf2uO2lIEZQNNt+3g2bmXgloWm
 W5fsm/di50Gm1l1Na63d3RZ00SeFQos6WEwLUHEB0yp6KXluXLLIZitEJM0wQ2hldCBSYW1l
 eSAoQ2FzZSBzdGFuZGFyZCkgPGNoZXQucmFtZXlAY2FzZS5lZHU+wl8EExECAB8FAkPi19EC
 GwMHCwkIBwMCAQMVAgMDFgIBAh4BAheAAAoJELtYafBk6nSrelkAn31Gsuib7GcCZHbv5L5t
 VKYR9LklAJ4hzUHKA49Z0QXR+qCb80osIcmPSc7ATQRBDrBvEAQAkK6TAOKBEM+EC4j6V/7o
 /riVZqcgU5cid2qG9TXdwNtD9a3kvA/ObZBO93sX59wc6Bnwo4VJxsOmMlpGrAjJsxNwg3QH
 akEtf8LXRbVpj5xStdmBdQZUhIQyalo/2/TZq5OijtddUQcL5cs70hTv/FpT3wUvr2Xr8rjF
 41IFEz8AAwcD/A0CZEGlzIrT5WCBnl6xBog/8vKiUCbarByat3d1mL6DbizvKNXQRTC9E/vE
 dENAWCQCjr75Bu55xT8n3SXGtWdDC5xmZ/P3OBYORP8yl8H8I1FIosWOFirbIeYdZPq8SPD1
 HL+EXo9zSiHVrrZRJ19ooCKKbSdXHFCY+aJG+0KZwkkEGBECAAkFAkEOsG8CGwwACgkQu1hp
 8GTqdKvjcACfZlkVCDwaz/NTO9cy3t69oWpVPNwAnRwe0qk/WL/gfhH346xh5B3HFbFN
Organization: ITS, Case Western Reserve University
In-Reply-To: <66c958db-0408-451d-b362-fed1f56d7c6d@auristor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L5LSTY5M39gWnvMqVGp47caB"
X-Mirapoint-Received-SPF: 209.85.160.200 mail-qt1-f200.google.com chet.ramey@case.edu 5 none
X-Mirapoint-Received-SPF: 129.22.103.235 mpv-local-ksl-1.case.edu chet.ramey@case.edu 5 none
X-Junkmail-Status: score=10/90, host=mpv-out-cfd-1.case.edu
X-Junkmail-Signature-Raw: score=unknown,
	refid=str=0001.0A002119.682491D1.0015,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0,
	ip=0.0.0.0,
	so=2016-11-06 16:00:04,
	dmn=2013-03-21 17:37:32,
	mode=single engine
X-Junkmail-IWF: false

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L5LSTY5M39gWnvMqVGp47caB
Content-Type: multipart/mixed; boundary="------------frKCS23FeCmgMLcTNF0WGjn4";
 protected-headers="v1"
From: Chet Ramey <chet.ramey@case.edu>
Reply-To: chet.ramey@case.edu
To: Jeffrey E Altman <jaltman@auristor.com>,
 Etienne Champetier <champetier.etienne@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Cc: chet.ramey@case.edu, David Howells <dhowells@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Marc Dionne <marc.dionne@auristor.com>, Steve French <sfrench@samba.org>,
 linux-fsdevel@vger.kernel.org,
 Linux AFS mailing list <linux-afs@lists.infradead.org>,
 linux-kernel@vger.kernel.org, linux-cifs@vger.kernel.org,
 "openafs-devel@openafs.org" <openafs-devel@openafs.org>
Message-ID: <ad62849c-1728-4bae-b0d5-7d87dc94825f@case.edu>
Subject: Re: [PATCH] afs, bash: Fix open(O_CREAT) on an extant AFS file in a
 sticky dir
References: <433928.1745944651@warthog.procyon.org.uk>
 <20250505-erproben-zeltlager-4c16f07b96ae@brauner>
 <CAOdf3grbDQ-Fh2bV7XfoYvVBhgBAh7-hZyyxTNt1RfGekrA-nA@mail.gmail.com>
 <66c958db-0408-451d-b362-fed1f56d7c6d@auristor.com>
In-Reply-To: <66c958db-0408-451d-b362-fed1f56d7c6d@auristor.com>

--------------frKCS23FeCmgMLcTNF0WGjn4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNS81LzI1IDEwOjQyIEFNLCBKZWZmcmV5IEUgQWx0bWFuIHdyb3RlOg0KDQo+Pj4gU28g
dGhlbiBqdXN0IGRvbid0IHJlbW92ZSBpdC4gSSBkb24ndCBzZWUgYSByZWFzb24gZm9yIHVz
IHRvIHdvcmthcm91bmQNCj4+PiB1c2Vyc3BhY2UgY3JlYXRpbmcgYSBidWcgZm9yIGl0c2Vs
ZiBhbmQgZm9yY2luZyB1cyB0byBhZGQgdHdvIG5ldyBpbm9kZQ0KPj4+IG9wZXJhdGlvbnMg
dG8gd29yayBhcm91bmQgaXQuDQo+PiBUaGlzIGJhc2ggd29ya2Fyb3VuZCBpbnRyb2R1Y2Vk
IGFnZXMgYWdvIGZvciBBRlMgYnlwYXNzIGZzLnByb3RlY3RlZF9yZWd1bGFyDQo+IA0KPiBD
aGV0LCBJIGRvbid0IHRoaW5rIHRoaXMgaGlzdG9yeSBpcyBjb3JyZWN0LiANCg0KSSB0aGlu
ayBFdGllbm5lJ3MgdGVyc2UgY29tbWVudCBhY2N1cmF0ZWx5IHN1bW1hcml6ZXMgdGhlIGN1
cnJlbnQgcHJvYmxlbQ0KKGFuZCBtYXliZSBpdCB3b3VsZCByZWFkIG1vcmUgY2xlYXJseSBp
ZiBoZSBoYWQgdXNlZCBgYnlwYXNzZXMnKS4NCg0KLS0gDQpgYFRoZSBseWYgc28gc2hvcnQs
IHRoZSBjcmFmdCBzbyBsb25nIHRvIGxlcm5lLicnIC0gQ2hhdWNlcg0KCQkgYGBBcnMgbG9u
Z2EsIHZpdGEgYnJldmlzJycgLSBIaXBwb2NyYXRlcw0KQ2hldCBSYW1leSwgVVRlY2gsIENX
UlUgICAgY2hldEBjYXNlLmVkdSAgICBodHRwOi8vdGlzd3d3LmN3cnUuZWR1L35jaGV0Lw0K


--------------frKCS23FeCmgMLcTNF0WGjn4--

--------------L5LSTY5M39gWnvMqVGp47caB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQR8ATX7CIqvbGbGULm7WGnwZOp0qwUCaCSRpwUDAAAAAAAKCRC7WGnwZOp0q8F+
AJ9LqPEdLlhWqcMgSVEfvfVvQQaLUQCeJ3uT3ggHKj9klGbE8GZKsHHVarM=
=1TNa
-----END PGP SIGNATURE-----

--------------L5LSTY5M39gWnvMqVGp47caB--
