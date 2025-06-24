Received: from mailrelay5-3.pub.mailoutpod3-cph3.one.com (mailrelay5-3.pub.mailoutpod3-cph3.one.com [46.30.212.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6826A1BE
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.212.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750767386; cv=none; b=YiU40bA5+DNGrdcHDsBwB2pCioxD6QSQL0XeFwG22GDw3mbL51qXIpGaDg9nYBHG4EIw2oQ+At1JKSOvdHlfbpI78CVzM+EGnrfVsHQATNgQ4w4yZR5/RmFhk1emT57AkyFtzNGOYBlG8AWTDiyl+diLHto8zFV9Cx+FSn2eUl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750767386; c=relaxed/simple;
	bh=zrvi77xSHk1MKReIAMpc6aIPXchnFwbbbWCkQnC3Bg8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=WqS2y80b3aCDNTBjPtf/lY1cnZq3Ug3wdnmShW4tCte4+8batCCnb3mfUDxVC2/1Ar0BkD3ITexZKR3MGUOF8c/iSF4qvIPgZv3f0kLW+ss3LDDlkWs0Yk+3FXLvn3h1rv4r3bMjflrvDQjiKWQz84rMXc4jt3jecROzJe0SZc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=O1Y3yI7y; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=bZ6Ahj+E; arc=none smtp.client-ip=46.30.212.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="O1Y3yI7y";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="bZ6Ahj+E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1750767312; x=1751372112;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=M1Kg+66kgHeJqX/QTGsvuXZbak7RCmywd80sh5ukf3U=;
	b=O1Y3yI7yDGtiM9CJBlbGz+wXBfbYrUpUbsnMBZ/MQBv16Gl7XVKButbAve9mGYAp3S8jgAdDUgGn6
	 IkOTDz5oDWzMCszy22AG/G4qECmO7V0pU8ocjI+WlCSiwgL9xHypEuZTGWN3vQRXcTdvgfLZjBeo7E
	 70jjzTwYge3Wh9WF8uGmu01fWKRi80HuxrL5D6hWzJxlEQsAsM5Y0yBLz4/mz87EslFz/ji+v5JNCZ
	 H7pbrka4q9qZ4PvSAQTLz/KPJJsBJz21qRAlpOUxfXRTNW5BrFF40J8G/QPy2dYyR/XMHt7LE7Ak2x
	 xUmf56OJ2hJLKHP8fVeWEjRn05oIy4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1750767312; x=1751372112;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=M1Kg+66kgHeJqX/QTGsvuXZbak7RCmywd80sh5ukf3U=;
	b=bZ6Ahj+ExbkkRKMS4MKnICYB62Nu0dxU9dEaCvG8p/lb+BVUOP+EBn9ZfKDKz+TULZ0c2AzmSzsu7
	 MmvVSCSCQ==
X-HalOne-ID: df90b046-50f4-11f0-af95-d7c209f8bd06
Received: from smtpclient.apple (host-90-233-201-126.mobileonline.telia.com [90.233.201.126])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id df90b046-50f4-11f0-af95-d7c209f8bd06;
	Tue, 24 Jun 2025 12:15:12 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH] mm/vmalloc: allow to set node and align in vrealloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <aFqT1mK7SYsYd3DZ@pc636>
Date: Tue, 24 Jun 2025 14:15:01 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D562EE6A-DE99-4C97-8934-D60682DDE711@konsulko.se>
References: <20250624095121.3243540-1-vitaly.wool@konsulko.se>
 <aFqT1mK7SYsYd3DZ@pc636>
To: Uladzislau Rezki <urezki@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 24, 2025, at 2:02=E2=80=AFPM, Uladzislau Rezki =
<urezki@gmail.com> wrote:
>=20
> On Tue, Jun 24, 2025 at 11:51:21AM +0200, Vitaly Wool wrote:
>> Reimplement vrealloc() to be able to set node and alignment should
>> a user need to do so. Rename the function to vrealloc_node() to
>> better match what it actually does now and introduce a macro for
>> vrealloc() for backward compatibility.
>>=20
>> With that change we also provide the ability for the Rust part of
>> the kernel to set node and aligmnent in its allocations.
>>=20
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>> ---
>> include/linux/vmalloc.h |  8 +++++---
>> mm/vmalloc.c            | 16 +++++++++++++---
>> 2 files changed, 18 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>> index fdc9aeb74a44..7d5251287687 100644
>> --- a/include/linux/vmalloc.h
>> +++ b/include/linux/vmalloc.h
>> @@ -197,9 +197,11 @@ extern void *__vcalloc_noprof(size_t n, size_t =
size, gfp_t flags) __alloc_size(1
>> extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, =
2);
>> #define vcalloc(...) alloc_hooks(vcalloc_noprof(__VA_ARGS__))
>>=20
>> -void * __must_check vrealloc_noprof(const void *p, size_t size, =
gfp_t flags)
>> - __realloc_size(2);
>> -#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>> +void *__must_check vrealloc_node_noprof(const void *p, size_t size,
>> + unsigned long align, gfp_t flags, int nid) __realloc_size(2);
>> +#define vrealloc_noprof(p, s, f) vrealloc_node_noprof(p, s, 1, f, =
NUMA_NO_NODE)
>> +#define vrealloc_node(...) =
alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
>> +#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>>=20
>> extern void vfree(const void *addr);
>> extern void vfree_atomic(const void *addr);
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index ab986dd09b6a..117894301db1 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -4081,10 +4081,12 @@ void *vzalloc_node_noprof(unsigned long size, =
int node)
>> EXPORT_SYMBOL(vzalloc_node_noprof);
>>=20
>> /**
>> - * vrealloc - reallocate virtually contiguous memory; contents =
remain unchanged
>> + * vrealloc_node - reallocate virtually contiguous memory; contents =
remain unchanged
>>  * @p: object to reallocate memory for
>>  * @size: the size to reallocate
>> + * @align: requested alignment
>>  * @flags: the flags for the page level allocator
>> + * @nid: node id
>>  *
>>  * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If =
@size is 0 and
>>  * @p is not a %NULL pointer, the object pointed to is freed.
>> @@ -4103,7 +4105,7 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>>  * Return: pointer to the allocated memory; %NULL if @size is zero or =
in case of
>>  *         failure
>>  */
>> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>> +void *vrealloc_node_noprof(const void *p, size_t size, unsigned long =
align, gfp_t flags, int nid)
>> {
>> struct vm_struct *vm =3D NULL;
>> size_t alloced_size =3D 0;
>> @@ -4127,6 +4129,13 @@ void *vrealloc_noprof(const void *p, size_t =
size, gfp_t flags)
>> if (WARN(alloced_size < old_size,
>> "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>> return NULL;
>> + if (WARN(nid !=3D NUMA_NO_NODE && nid !=3D =
page_to_nid(vmalloc_to_page(p)),
>> + "vrealloc() has mismatched nids\n"))
>> + return NULL;
>> + if (WARN((uintptr_t)p & (align - 1),
>> + "will not reallocate with a bigger alignment (0x%lx)\n",
>> + align))
>> + return NULL;
>> }
>>=20
>> /*
>> @@ -4158,7 +4167,8 @@ void *vrealloc_noprof(const void *p, size_t =
size, gfp_t flags)
>> }
>>=20
>> /* TODO: Grow the vm_area, i.e. allocate and map additional pages. */
>> - n =3D __vmalloc_noprof(size, flags);
>> + n =3D __vmalloc_node_noprof(size, align, flags, nid, =
__builtin_return_address(0));
>> +
>> if (!n)
>> return NULL;
>>=20
>> --=20
>> 2.39.2
>>=20
> Do we have users which require alignment and nid? I see that it is =
part
> of kvrealloc() API only.
>=20

There=E2=80=99s a patch pending inclusion of this one which will be the =
user of this change. I was reluctant
to combine these 2 in one series because the second one is on the Rust =
side, but it can be found
here: https://github.com/vwool/linux-mm/pull/new/realloc-extend.

~Vitaly=
