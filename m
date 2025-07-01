Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE8826A1DE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368927; cv=none; b=UHyfNk6IOHSemrn9VbvQlU7iz6vk2vwoKsGNwDAC4SjHOxK1lUFpdVO18DrOf9U/OPUeiyE9Q3UqAmVy4VGJ6xG5NZpnh6MZA6u0KvgfQQoM5IVdVAiCZ5d3i9ohZcnZ8FrJe+p0dvR5iKusk2LUKfRASHefswz0UaKdt0tWchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368927; c=relaxed/simple;
	bh=t7zkl/qlRj4bl42LCaW7PP/E22dbIn6npeQKVgaEFxQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=s9QXY8VbWRSGKq5conK0cjBIgfZD4kT2ptPYnmsaMbzYHdA7m9QK63IN2OZc8I3Vtvy7gPNthqJIPfhFh5zePjZrFXlLjadPjOYoDaK1L1KmF7EiP7S7+G490AByhcHSbTpYg/nz8+YjXb3GXs/r60RTs0zxtDlg6idzboXLMc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=GHxdOp1T; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=73Ubm0CM; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="GHxdOp1T";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="73Ubm0CM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751368924; x=1751973724;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ype0RXWkZlnpbFqpY1x56iV2OcirmQognCCOHtgnUhY=;
	b=GHxdOp1TQlnXScmmzp9jCJc+kUqZv8KWDtOOa8f44GFfzle2p3QZEHUju9yxNev7hnVG9JPA8vYbQ
	 T70J26mZRkaJy+wV2Yqe5BJG3vZbVXpRdvHpKHee/p1KS2DZj+qZoLmG4H4a+Hz0s3rs/TYMU5sUEI
	 mqhC/EmtTUz0FvXE9YCpLbqUOxi3FGUV4soren1gozCLplXkGVzv6NQJNgeSjqn+P4/JpvcNxK5H6/
	 NgM+2UzDHIGHhvjhSUMyVRwn/zukSjgItKo5dhkKVcAASklzQvgCkER2eORkdaLPSviLO1GEnzLxOK
	 x8XJcOFMWUjl1trcsECQCNpwiZSod+g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751368924; x=1751973724;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=ype0RXWkZlnpbFqpY1x56iV2OcirmQognCCOHtgnUhY=;
	b=73Ubm0CMpwm1Mu67KoqKjyrZpyKh+6Sb1jL5TC9Dhm9KAGTWm5AFOQkUqy/8/Y2IVApvr5GPsPb4e
	 ipLNslWCw==
X-HalOne-ID: 9ceca3db-566d-11f0-b5ef-f78b1f841584
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 9ceca3db-566d-11f0-b5ef-f78b1f841584;
	Tue, 01 Jul 2025 11:22:03 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v9 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aGPDcUc5ixYF8cQL@pc636>
Date: Tue, 1 Jul 2025 13:21:53 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <190A8A7B-A46B-4073-8EFC-14A0EB6EF3DC@konsulko.se>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221615.3325221-1-vitaly.wool@konsulko.se> <aGO9a06HutqljjNS@pc636>
 <31E257E1-AB52-4115-A264-56F545AB84A9@konsulko.se> <aGPDcUc5ixYF8cQL@pc636>
To: Uladzislau Rezki <urezki@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jul 1, 2025, at 1:16=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>=20
> On Tue, Jul 01, 2025 at 12:54:36PM +0200, Vitaly Wool wrote:
>>=20
>>=20
>>> On Jul 1, 2025, at 12:50=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>>>=20
>>> On Tue, Jul 01, 2025 at 12:16:15AM +0200, Vitaly Wool wrote:
>>>> Reimplement vrealloc() to be able to set node and alignment should
>>>> a user need to do so. Rename the function to vrealloc_node_align()
>>>> to better match what it actually does now and introduce macros for
>>>> vrealloc() and friends for backward compatibility.
>>>>=20
>>>> With that change we also provide the ability for the Rust part of
>>>> the kernel to set node and aligmnent in its allocations.
>>>>=20
>>>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>>>> ---
>>>> include/linux/vmalloc.h | 12 +++++++++---
>>>> mm/vmalloc.c            | 19 +++++++++++++++----
>>>> 2 files changed, 24 insertions(+), 7 deletions(-)
>>>>=20
>>>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>>>> index fdc9aeb74a44..68791f7cb3ba 100644
>>>> --- a/include/linux/vmalloc.h
>>>> +++ b/include/linux/vmalloc.h
>>>> @@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t =
size, gfp_t flags) __alloc_size(1
>>>> extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, =
2);
>>>> #define vcalloc(...) alloc_hooks(vcalloc_noprof(__VA_ARGS__))
>>>>=20
>>>> -void * __must_check vrealloc_noprof(const void *p, size_t size, =
gfp_t flags)
>>>> - __realloc_size(2);
>>>> -#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>>>> +void *__must_check vrealloc_node_align_noprof(const void *p, =
size_t size,
>>>> + unsigned long align, gfp_t flags, int nid) __realloc_size(2);
>>>> +#define vrealloc_node_noprof(_p, _s, _f, _nid) \
>>>> + vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
>>>> +#define vrealloc_noprof(_p, _s, _f) \
>>>> + vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
>>>> +#define vrealloc_node_align(...) =
alloc_hooks(vrealloc_node_align_noprof(__VA_ARGS__))
>>>> +#define vrealloc_node(...) =
alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
>>>> +#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>>>>=20
>>>> extern void vfree(const void *addr);
>>>> extern void vfree_atomic(const void *addr);
>>>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>>>> index 6dbcdceecae1..776c68f84ce2 100644
>>>> --- a/mm/vmalloc.c
>>>> +++ b/mm/vmalloc.c
>>>> @@ -4089,12 +4089,15 @@ void *vzalloc_node_noprof(unsigned long =
size, int node)
>>>> EXPORT_SYMBOL(vzalloc_node_noprof);
>>>>=20
>>>> /**
>>>> - * vrealloc - reallocate virtually contiguous memory; contents =
remain unchanged
>>>> + * vrealloc_node_align_noprof - reallocate virtually contiguous =
memory; contents
>>>> + * remain unchanged
>>>> * @p: object to reallocate memory for
>>>> * @size: the size to reallocate
>>>> + * @align: requested alignment
>>>> * @flags: the flags for the page level allocator
>>>> + * @nid: node id
>>>> *
>>>> - * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If =
@size is 0 and
>>>> + * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). =
If @size is 0 and
>>>> * @p is not a %NULL pointer, the object pointed to is freed.
>>>> *
>>>> * If __GFP_ZERO logic is requested, callers must ensure that, =
starting with the
>>>> @@ -4111,7 +4114,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>>>> * Return: pointer to the allocated memory; %NULL if @size is zero =
or in case of
>>>> *         failure
>>>> */
>>>> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>>>> +void *vrealloc_node_align_noprof(const void *p, size_t size, =
unsigned long align,
>>>> + gfp_t flags, int nid)
>>>> {
>>>> struct vm_struct *vm =3D NULL;
>>>> size_t alloced_size =3D 0;
>>>> @@ -4135,6 +4139,11 @@ void *vrealloc_noprof(const void *p, size_t =
size, gfp_t flags)
>>>> if (WARN(alloced_size < old_size,
>>>> "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>>>> return NULL;
>>>> + if (WARN(!IS_ALIGNED((unsigned long)p, align),
>>>> + "will not reallocate with a bigger alignment (0x%lx)\n", align))
>>>> + return NULL;
>>>> + if (nid !=3D NUMA_NO_NODE && nid !=3D =
page_to_nid(vmalloc_to_page(p)))
>>>> + goto need_realloc;
>>>>=20
>>> By this goto change, you bypass the two important checks below. For
>>> example if you shrink the allocated size, you do not need to perform
>>> any allocations. Instead the patch goes and allocates a new area.
>>>=20
>>> You just need to remove:
>>>=20
>>> - if (nid !=3D NUMA_NO_NODE && nid !=3D =
page_to_nid(vmalloc_to_page(p)))
>>> - goto need_realloc;
>>>=20
>>> to make it working.
>>>=20
>>=20
>> I am not sure I=E2=80=99m following. If we get a request to =
reallocate for a different node then we should either reject it or do =
the new allocation for this new node and copy the data to the new place. =
Shrinking the allocation on the old node doesn=E2=80=99t seem to be =
right. Or am I missing something?
>>=20
> If your process migrates to a new NODE, which is fine, it does not =
mean
> that you have to perform all this bouncing movement(reallocate on a =
new node).
> Next time it can be migrated back. Process are allowed to migrate and =
access
> to a remote memory.
>=20

Indeed, but in that case the caller is expected to specify NUMA_NO_NODE =
in vrealloc_node_align(). If the caller did specify an exact node we =
can=E2=80=99t just silently disregard that, we should either respect =
that or fail.

~Vitaly

