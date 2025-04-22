Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA0938B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 07:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745307190; cv=none; b=UwP4Y8mM0+atpMINWN+Pbzy4jJvYcoqCphpCJVWsoEjlnzuzf94s4cQVZ5tUIY34rJlvap7QnHmbq1ha6z45fvEo4NSPVR4/NN+JByMIdwYjtDP00W4mZTcHSXi6INOykQSe+SXJ7dM1R0o9h37ggsmHck2xTmBIWIZXRVCsoaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745307190; c=relaxed/simple;
	bh=KCKtNI8oKaAtANC6BVqswXA1z43vtATYfeCwlx1mXXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZ6WuLZ/hDxc6V8F7bmNtfr8P+QO6vVnRCinnqcV1HcHUHBpTw3OLZPVWTZaiHO/Z4W1ZS/Y6J7iUCjyNLgQjt21zuB0mF6zhRNuD3Fjg3h8jfttIdRapm/g7j9JTNTlqTEcnE8hzW+Oa4IqSo6UEAPXqEo4vLt2dL57kuJL1Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b=KAUA4l7V; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=quwenruo.btrfs@gmx.com header.b="KAUA4l7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1745307186; x=1745911986; i=quwenruo.btrfs@gmx.com;
	bh=8UcabMiHlOiUmtWlykgDsjhfYnSx2DHn1206N3qbBGY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KAUA4l7VbAvjcEBAsvrNcQri0SKdVUBRQuqVIMT/6GVfftE20VN7SGFBwDvqIEUb
	 WKtbgtfv6Qde6ZH8L6Z1UlaFAYFFPahEIofxVioheJoyBN4b7dRmiDuDZARF0SGVT
	 D7L+sLnVFOVDmokv/Cu//UZESEnOEiofRUpN/4DUrNtSll7WToB/OjZU/N3MtLzEe
	 P57/br4US+uJENtnq4rW8kUf+OgkwoxIqdyiFoYCny/N9EbEl0tGA9m3bMuAfeNTY
	 PAABZkMUbBBFWnzbxTfXiFcPao6L7nNMafdBVYuiAV9cQybFCYvdw0R+7doUSyD3W
	 QRWQDn11oWEJRt44Zw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.0.229] ([159.196.52.54]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MA7GM-1uHcVf3XNi-00A2bM; Tue, 22
 Apr 2025 09:33:06 +0200
Message-ID: <ecca749e-9c84-40ef-ae2a-d630a249b764@gmx.com>
Date: Tue, 22 Apr 2025 17:02:55 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.15-rc2 unable to boot on 32bit x86 with PAE
To: Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 LKML <linux-kernel@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, x86-ml <x86@kernel.org>
References: <4599013d-bc74-4f81-9db7-070806ea9162@gmx.com>
 <20250418160515.GAaAJ4O2HnktVgmZ1v@fat_crate.local>
 <aAc-h1TJV7do7JXa@gmail.com>
Content-Language: en-US
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Autocrypt: addr=quwenruo.btrfs@gmx.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNIlF1IFdlbnJ1byA8cXV3ZW5ydW8uYnRyZnNAZ214LmNvbT7CwJQEEwEIAD4CGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4AWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1YAUJEP5a
 sQAKCRDCPZHzoSX+qF+mB/9gXu9C3BV0omDZBDWevJHxpWpOwQ8DxZEbk9b9LcrQlWdhFhyn
 xi+l5lRziV9ZGyYXp7N35a9t7GQJndMCFUWYoEa+1NCuxDs6bslfrCaGEGG/+wd6oIPb85xo
 naxnQ+SQtYLUFbU77WkUPaaIU8hH2BAfn9ZSDX9lIxheQE8ZYGGmo4wYpnN7/hSXALD7+oun
 tZljjGNT1o+/B8WVZtw/YZuCuHgZeaFdhcV2jsz7+iGb+LsqzHuznrXqbyUQgQT9kn8ZYFNW
 7tf+LNxXuwedzRag4fxtR+5GVvJ41Oh/eygp8VqiMAtnFYaSlb9sjia1Mh+m+OBFeuXjgGlG
 VvQFzsBNBFnVga8BCACqU+th4Esy/c8BnvliFAjAfpzhI1wH76FD1MJPmAhA3DnX5JDORcga
 CbPEwhLj1xlwTgpeT+QfDmGJ5B5BlrrQFZVE1fChEjiJvyiSAO4yQPkrPVYTI7Xj34FnscPj
 /IrRUUka68MlHxPtFnAHr25VIuOS41lmYKYNwPNLRz9Ik6DmeTG3WJO2BQRNvXA0pXrJH1fN
 GSsRb+pKEKHKtL1803x71zQxCwLh+zLP1iXHVM5j8gX9zqupigQR/Cel2XPS44zWcDW8r7B0
 q1eW4Jrv0x19p4P923voqn+joIAostyNTUjCeSrUdKth9jcdlam9X2DziA/DHDFfS5eq4fEv
 ABEBAAHCwHwEGAEIACYCGwwWIQQt33LlpaVbqJ2qQuHCPZHzoSX+qAUCZxF1gQUJEP5a0gAK
 CRDCPZHzoSX+qHGpB/kB8A7M7KGL5qzat+jBRoLwB0Y3Zax0QWuANVdZM3eJDlKJKJ4HKzjo
 B2Pcn4JXL2apSan2uJftaMbNQbwotvabLXkE7cPpnppnBq7iovmBw++/d8zQjLQLWInQ5kNq
 Vmi36kmq8o5c0f97QVjMryHlmSlEZ2Wwc1kURAe4lsRG2dNeAd4CAqmTw0cMIrR6R/Dpt3ma
 +8oGXJOmwWuDFKNV4G2XLKcghqrtcRf2zAGNogg3KulCykHHripG3kPKsb7fYVcSQtlt5R6v
 HZStaZBzw4PcDiaAF3pPDBd+0fIKS6BlpeNRSFG94RYrt84Qw77JWDOAZsyNfEIEE0J6LSR/
In-Reply-To: <aAc-h1TJV7do7JXa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7KG+egaxrwUoNAsLpellrKDsYzJZZIUgwDpawe3gG10o2fSV93D
 BPgnWptjF0TVkxS0FGRbCwASP2r4bap2//Fyne0Uzd4UnrfY1bNcfkkH8p6DW/yHTXCMqCs
 sAsDOd4sBkzevLpz9UeruIk7g1FlEd0SNY8zcO2O0LReAdtvdJckkyZT/EVEoJJUnoa9j5/
 Fg4DOmX7+fIRwbhaCYHWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d2YznXTB4Ps=;2PezDJpBvNoX4uwCm4dBEPLLVUX
 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
 A==



=E5=9C=A8 2025/4/22 16:30, Ingo Molnar =E5=86=99=E9=81=93:
>=20
> * Borislav Petkov <bp@alien8.de> wrote:
>=20
>> On Fri, Apr 18, 2025 at 08:31:23PM +0930, Qu Wenruo wrote:
>>> Hi,
>>>
>>> Recently I'm testing a situation where highmem is involved, thus I'm
>>> building the latest 32bit x86 with HIGHMEM and PAE, and run it inside =
a qemu
>>> VM.
>>
>> Does that fix it:
>>
>> https://git.kernel.org/tip/1e07b9fad022e0e02215150ca1e20912e78e8ec1
>>
>> ?
>=20
> That commit caused other problems - the best fix we have right now is:
>=20
> 	https://git.kernel.org/tip/83b2d345e1786fdab96fc2b52942eebde125e7cd

Thanks, I'll take a try again.

But considering how rare 32bit + highmem systems are nowadays, I still=20
have one questions/concern:

- How to make sure we really got highmems?
   The kernel docs only mention that highmems need temporary mapping,
   and proper kmap/kunmap() handling.

   But I still didn't have a straightforward idea of how to verify,
   without adding manual ftrace events when a highmem page is hit.

   E.g. free only shows 3GB memory even if I enabled highmem + PAE.

   Since HIGHMEM64G is removed, I'd expect to get some values more like
   4G instead?

Thanks,
Qu


>=20
> Thanks,
>=20
> 	Ingo

