Received: from mailrelay6-3.pub.mailoutpod3-cph3.one.com (mailrelay6-3.pub.mailoutpod3-cph3.one.com [46.30.212.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D552BCF6F
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 20:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750883368; cv=none; b=nXMAUVk2OcZClpMNHV+xxUdv6yIP7jOsHcbUVMniF+v3BDct6gyVan/fiNEs9WQ8Vpwae+WzWdZrXc02cb4SoR1mLi5B3TPqMNlc0VqdS1fgqA5DC2PPtiWLYsfF09TgjQ3xsfHEUEIj3GkcQSfYFGi84yAV8toOJB58NaR0O6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750883368; c=relaxed/simple;
	bh=vuzj/xayTr95WcffBwjHoYH2sEOFOq8LE0VUip3uJHQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UBjcas7QwI3p8MkzPSvuxgEi68d8T2aiHC2DF/4v8noEl+w5AFwP9MqRMBnEttgHhxfiZuwlpTnl5qK9GC7Pr05GseBJvpYlE0HWnSRVSPZJexnz0iwymsc36Q1xyYn0OK45uIqSL8CsyMiucOHWwCSTGRzXpn3dxlyDk/zGd+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=xlWYxEIt; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=e1VP2Tqq; arc=none smtp.client-ip=46.30.212.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="xlWYxEIt";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="e1VP2Tqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750883356; x=1751488156;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=mFicMW97oCaFX3ytmFZghvLQmZgDqR8OgB6iTx+baCA=;
	b=xlWYxEIt96EYtxtxqfAkDKuAn42RhF4BXnMhnbDT4tX9n8AZs/S7PBTGJHkJtZWCDOwujMmd8Hvpx
	 uA+V1ub2XXvaGc68ADH67NAcIJJ8JI8+Jqq0WwwJ1b9mMR+p9g2jb7Wsc3BqFmdRtUEFVGcYSjRVKI
	 kn3pTyP6IM96YqO9zGtHY/2Al0BBJoHSpXDlZD8nyIpP3flgxtOdLsrwRjfe+2gES0gI7faSJJ5ud0
	 fPo6ZBy4GifEPHmRBAiyg8DicoqJW3k7ovWISrZAM0sdNUe0kp+so0+inW71+UBy3jB2dv3nbWStNw
	 5ru0KiBrS8KyqjQc+6phNWvVRrUTHBg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750883356; x=1751488156;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=mFicMW97oCaFX3ytmFZghvLQmZgDqR8OgB6iTx+baCA=;
	b=e1VP2TqqOq6P+uUeLxOSceSYWSkdKhkMQ7NYvr4vQ2yjSIBjR4EMk8hv2ppLiDME9rAD+XXA5HRFg
	 UmXUSZqDQ==
X-HalOne-ID: 0f22a303-5203-11f0-843b-417246ffdc90
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay6.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 0f22a303-5203-11f0-843b-417246ffdc90;
	Wed, 25 Jun 2025 20:29:16 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v3 2/2] rust: support align and NUMA id in allocations
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aFxI-rjvktSe3h8M@cassiopeiae>
Date: Wed, 25 Jun 2025 22:22:36 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C349F54D-348D-44FE-A02F-E75C78608734@konsulko.se>
References: <20250625062917.3379804-1-vitaly.wool@konsulko.se>
 <20250625063026.3379921-1-vitaly.wool@konsulko.se>
 <aFxGQWG_81Peu7mP@cassiopeiae> <aFxI-rjvktSe3h8M@cassiopeiae>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 25, 2025, at 9:07=E2=80=AFPM, Danilo Krummrich =
<dakr@kernel.org> wrote:
>=20
> On Wed, Jun 25, 2025 at 08:56:05PM +0200, Danilo Krummrich wrote:
>> On Wed, Jun 25, 2025 at 08:30:26AM +0200, Vitaly Wool wrote:
>>> Add support for large (> PAGE_SIZE) alignments in Rust allocators
>>> (Kmalloc support for large alignments is limited to the requested
>>> size, which is a reasonable limitation anyway).
>>=20
>> Please split this..
>>=20
>>> Besides, add support for NUMA id to Vmalloc.
>>=20
>> and this into separate patches.
>>=20
>> Please also add some information to the commit message what you need =
node
>> support for. Do you also have patches to add node support to Box and =
Vec?

No, but there is a zswap backend implementation written in Rust and it =
should be  NUMA id aware.
I=E2=80=99m planning on submitting that basically as soon as this piece =
gets accepted.

>>=20
>>>=20
>>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>>> ---
>>> rust/helpers/slab.c            |  8 +++++--
>>> rust/helpers/vmalloc.c         |  4 ++--
>>> rust/kernel/alloc.rs           | 28 ++++++++++++++++++++++--
>>> rust/kernel/alloc/allocator.rs | 40 =
+++++++++++++++++++---------------
>>> rust/kernel/alloc/kvec.rs      |  3 ++-
>>> 5 files changed, 59 insertions(+), 24 deletions(-)
>>>=20
>>> diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
>>> index a842bfbddcba..221c517f57a1 100644
>>> --- a/rust/helpers/slab.c
>>> +++ b/rust/helpers/slab.c
>>> @@ -3,13 +3,17 @@
>>> #include <linux/slab.h>
>>>=20
>>> void * __must_check __realloc_size(2)
>>> -rust_helper_krealloc(const void *objp, size_t new_size, gfp_t =
flags)
>>> +rust_helper_krealloc(const void *objp, size_t new_size, unsigned =
long align, gfp_t flags, int nid)
>>=20
>> This should have a comment making it obvious why the function has two =
arguments
>> that are discarded. I think we should even separate it with an =
additional inline
>> function.
>>=20
>> I do agree with discarding the align argument, given that it's not =
exposed to
>> users though the Allocator API.
>=20
> What I meant is that proper alignment is implied when krealloc() =
succeeds.

I agree, I need to add some comments explaining this.

>=20
>> I do disagree with discarding the nid argument though, since you =
change the
>> generic Allocator::realloc() API to take a node argument, which for =
KREALLOC and
>> KVREALLOC is silently discarded. If we introduce it, we should do so =
for all
>> three allocators.
>>=20
>>> {
>>> + if (WARN_ON(new_size & (align - 1)))
>>> + return NULL;
>>=20
>> I don't think we should have this WARN_ON(). If we want to warn about =
this, we
>> should already do so on the Rust side. The helper functions in this =
file should
>> not contain any logic.

Agreed.

>>=20
>>> return krealloc(objp, new_size, flags);
>>> }
>>>=20
>>> void * __must_check __realloc_size(2)
>>> -rust_helper_kvrealloc(const void *p, size_t size, gfp_t flags)
>>> +rust_helper_kvrealloc(const void *p, size_t size, unsigned long =
align, gfp_t flags, int nid)
>>> {
>>> + if (WARN_ON(size & (align - 1)))
>>> + return NULL;
>>> return kvrealloc(p, size, flags);
>>> }
>>=20
>> Same as above.
>=20
> This is actually different though, here kvrealloc() may succeed even =
if the
> requested alignment is not fulfilled, so this is incorrect.

I can move this logic to the Rust part, too. My point here is, for =
Kvrealloc with a large alignment we=E2=80=99ll just make the decision to =
use vmalloc, period. We can indeed do that on the Rust side.

~Vitaly

