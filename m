Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C9628D8C2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 22:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751062512; cv=none; b=Ut+OxjwxqKMYIBL6Q/5ARbEtA/4wI4Et5eWaUVU8Dfr1TzeGVnhKarcdz7KVHEgdbZE+4C916ecSWJSy3V93h0Yy1QBpYV8dAp6l4AcCYMhFluZejNJO/kmjhWCZ0JSwXDwgBloFRfbyDpfp7hsqjb56/IpAy5nZeuRT32PT8os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751062512; c=relaxed/simple;
	bh=HMUWz03PPVIAStqshFHJPAV94WE1iSKR4w8UcEZFAng=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EmXeHKdJtzRAYKkYot86nxywJAYyWhUCZsu+nH50RyW4z2O5XFAKrsIEaLDsK+Oj1gOg3xbhPmG2t0a/PHixUlvk9nSdhh1Bv/TAZCNKDn7eEU3k4Zw4Ja+6I1HLNvXi6/toalvoiC3s3KyPWMBtXZq872e2zXp08IpYKzBrrYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=oSMqxT3m; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=bYyN+5qo; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="oSMqxT3m";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="bYyN+5qo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751062507; x=1751667307;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=T13rm+wv6m7Nf4D6++TT2JCiBV05mPjobL0Tfcq7go4=;
	b=oSMqxT3mVtIgTyhYM6isadJjx8RHx8NrYpsWHnGdCFEgFcp7x6cZt1jTnQnwpQEeyydlI7njLEH2r
	 e8SEUrF1tTiChSSBlrpNXX2nGnqLgOBlnhXAJCiipkZZHmKww618I5Zo+Ga+sqxpSY9THsDwROy5Rx
	 yr6C6OIvAv+zfa4N2exSRHayU42eVqubfyyI3NWBP22jCvwCHJ2gJdhEt6cLaBSobhTYiGrYB3Sr7S
	 wlMkKBTz6s990Plk4bLa4ZCCHTDyPYn0ORS5MekXf9YE0IlDYIt4VCrSUJhcchQGjLDpRo/NqW2ir5
	 KSa9aWXTXcyF7G4w0nfwqMvI+0jdCjA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751062507; x=1751667307;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=T13rm+wv6m7Nf4D6++TT2JCiBV05mPjobL0Tfcq7go4=;
	b=bYyN+5qobIuCXNTBp5b7opT+/0Ytp0PMyhfzRgPMGd7PzQEpwWHGZiMcsQ4CQzTO1Lf1MLwIaoiA9
	 SszUceJDQ==
X-HalOne-ID: 2e079c8b-53a4-11f0-b39e-f78b1f841584
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 2e079c8b-53a4-11f0-b39e-f78b1f841584;
	Fri, 27 Jun 2025 22:15:07 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH 2/4] mm/slub: allow to set node and align in k[v]realloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aF7a23G6zTtylrzq@pc636>
Date: Sat, 28 Jun 2025 00:14:57 +0200
Cc: Danilo Krummrich <dakr@kernel.org>,
 linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3E1CA84B-3670-4887-ADA1-055E8A5DE806@konsulko.se>
References: <20250627092901.356909-1-vitaly.wool@konsulko.se>
 <20250627093714.402989-1-vitaly.wool@konsulko.se> <aF51PTZh0gRVFuYu@pollux>
 <aF6DmPmeSpWU3hH_@pc636> <C6331389-1008-4D8B-99AA-C2640671E9A2@konsulko.se>
 <aF7a23G6zTtylrzq@pc636>
To: Uladzislau Rezki <urezki@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 27, 2025, at 7:54=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>=20
> On Fri, Jun 27, 2025 at 02:01:23PM +0200, Vitaly Wool wrote:
>>=20
>>=20
>>> On Jun 27, 2025, at 1:42=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>>>=20
>>> Hello, Vitaly, Danilo.
>>>=20
>>>> On Fri, Jun 27, 2025 at 11:37:14AM +0200, Vitaly Wool wrote:
>>>>> Reimplement k[v]realloc_node() to be able to set node and
>>>>> alignment should a user need to do so. In order to do that while
>>>>> retaining the maximal backward compatibility, the following rules
>>>>> are honored:
>>>>> * kmalloc/kzalloc/krealloc remain unchanged
>>>>> * kvmalloc/kvrealloc/kvcalloc remain unchanged
>>>>> * kvrealloc remains unchanged
>>>>> * kvrealloc_node is implemented as a new function taking align and
>>>>> NUMA id as extra parameters compared to kvrealloc.
>>>>> * krealloc_node is implemented as a new function taking NUMA id
>>>>> as an extra parameter compared to krealloc
>>>>> * kvmalloc_node/kvzalloc_node/kvcalloc_node get an extra parameter
>>>>> (alignment)
>>>>=20
>>>> I see what you're doing here:
>>>>=20
>>>> You created vrealloc_node_noprof() in the previous patch, taking =
the following
>>>> arguments:
>>>>=20
>>>> vrealloc_node_noprof(const void *p, size_t size,
>>>>     unsigned long align,
>>>>     gfp_t flags, int nid)
>>>>=20
>>>> And now you're aligning the newly introduced krealloc_node() and
>>>> kvrealloc_node() with that.
>>>>=20
>>>> The idea for having an align argument on krealloc_node() simply is =
that it
>>>> fails if the alignment requirement can't be fulfilled by the =
corresponding
>>>> kmalloc bucket, such that we can fall back to vrealloc_node() in
>>>> kvrealloc_node().
>>>>=20
>>>> Generally, this makes sense to me.
>>>>=20
>>>> However, now you consequently have to add the align argument to =
kvmalloc_node(),
>>>> kvzalloc_node(), kvcalloc_node() as well.
>>>>=20
>>>> This is what creates this huge diffstat changing all the users.
>>>>=20
>>>> IMHO, the problem here was introduced already with =
vrealloc_node_noprof() taking
>>>> an align argument in your previous patch, since now you have to =
adjust
>>>> everything else to logically follow the same naming scheme.
>>>>=20
>>>> Instead, I think you should introduce vrealloc_node_align(),
>>>>=20
>>> I am probably missing something. Could you please clarify why do you
>>> need the vrealloc_node_align() and other friends? Do you have users
>>> which require vrealloc() or kvrealloc() to support nid and align =
from
>>> Rust API point of view?=20
>>>=20
>>>=20
>>=20
>> Alignment for Rust allocators should generally be supported, it=E2=80=99=
s been listed as TODO for a while.
>> Node awareness is very desirable for e.g. KVBox and for the coming =
zpool mapping.
>>=20
> Thank you for clarification. The comment about TODO i saw. Initially i
> thought that there is a real demand in having it for some users. But
> this is just for future potential ones. So, maybe the comment should
> be removed instead? But i do not have a strong opinion here.

Well, the zpool Rust mapping is in fact ready and will follow shortly =
after we sort out the issues with this patchset.

~Vitaly

>=20
> vrealloc_node_align() sounds indeed better for that purpose.
>=20
> --
> Uladzislau Rezki


