Received: from mailrelay-egress12.pub.mailoutpod2-cph3.one.com (mailrelay-egress12.pub.mailoutpod2-cph3.one.com [46.30.211.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5B1E51FE
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 18:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751047860; cv=none; b=JKWvW8VxEHILGyjd0+iWeIX7oj6bqLJ1CExkv087VSa/k+Rs8sSeF+cO9JRffaBu9ruruyekWUU6i4UkPu74HoNSbCsHbfHGC+nWXKj1U40VtGda77BZBgKQ28B8KO1CdDkZULfBPUZPYWF8pcoTg5EwzbcsyfCep4Q0P4IVkuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751047860; c=relaxed/simple;
	bh=Hv+9O7HrnX0/J7CgKhPYFI+7nWXw+JcLuXM8buvZvk0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hWw5FRj6zOAP646OdgQllh5LlATqDtfVtjdLklUigVylQECel+1sfDLPB/XIJ49YhiauokWjHnjiFaWKEPPXWyAwQ8E774jODzMeRCZGaVWjs9fR6fQ6m3tXViBnBxVRh8q3T8Eb1vqry+S0BWgH04LT0/5HOH3SMGpoFn5zr3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=qiMPlLBR; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=rFeZF0i5; arc=none smtp.client-ip=46.30.211.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="qiMPlLBR";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="rFeZF0i5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1751047855; x=1751652655;
	d=konsulko.se; s=rsa1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=XBOGYFAznulMUaolsApT67ql/M6IhZHN+6i+OYqgSdU=;
	b=qiMPlLBRqupA3rzYcFvb2wPRhFRe1UqUovDxOj3c98D7RvJ++WdC6k/cKXZvokuypuJXy/o5W8AGb
	 CnjwxpcQURatqF04VpP9/hbcysaEL/WJY7bKhk2guPNHOOsBP9Lip9wcmMG8tv+noc+rl30isIB/5G
	 YUYtYDVAz1yIWZgfeRXBKkh95fir3RVdvltjK7oMUXzWUh3yaoS1/YXJbo9lHQnwXg2DVbx9udS3mt
	 VpTomP3flhLsnuqQWx6UhTQFrZdhAMhuYdhYO7QMIbM6pzXBnYhPq/1bsSkT7J6N6I9KqvugJI9736
	 Whinikb7Q2zt/DY28DqaGSHX8yNgjBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1751047855; x=1751652655;
	d=konsulko.se; s=ed1;
	h=to:references:message-id:content-transfer-encoding:cc:date:in-reply-to:from:
	 subject:mime-version:content-type:from;
	bh=XBOGYFAznulMUaolsApT67ql/M6IhZHN+6i+OYqgSdU=;
	b=rFeZF0i5Pp8KGwYuiv4ZZZOBO2cOv5RFI8t9PZHPXSsJLJjjaYZQWFMTszy3hKuWowkfPLEh6JhOx
	 hxsZxO5AQ==
X-HalOne-ID: 10c644c6-5382-11f0-b0ec-f78b1f841584
Received: from smtpclient.apple (c188-150-224-8.bredband.tele2.se [188.150.224.8])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id 10c644c6-5382-11f0-b0ec-f78b1f841584;
	Fri, 27 Jun 2025 18:10:54 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.200.121\))
Subject: Re: [PATCH v4 2/4] mm/slub: allow to set node and align in
 k[v]realloc
From: Vitaly Wool <vitaly.wool@konsulko.se>
In-Reply-To: <CAJ-ks9mB8tAG+vE2RnN0+3-pqcQU_KkmZUHU++-uswpxLBp9Kg@mail.gmail.com>
Date: Fri, 27 Jun 2025 20:10:44 +0200
Cc: linux-mm@kvack.org,
 akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org,
 Uladzislau Rezki <urezki@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <A2FBF97F-5122-4C06-A1EC-F997E01A8672@konsulko.se>
References: <20250626083516.3596197-1-vitaly.wool@konsulko.se>
 <20250626083632.3596363-1-vitaly.wool@konsulko.se>
 <CAJ-ks9mB8tAG+vE2RnN0+3-pqcQU_KkmZUHU++-uswpxLBp9Kg@mail.gmail.com>
To: Tamir Duberstein <tamird@gmail.com>
X-Mailer: Apple Mail (2.3826.200.121)



> On Jun 26, 2025, at 10:53=E2=80=AFPM, Tamir Duberstein =
<tamird@gmail.com> wrote:
>=20
> On Thu, Jun 26, 2025 at 1:39=E2=80=AFAM Vitaly Wool =
<vitaly.wool@konsulko.se> wrote:
>>=20
>> Reimplement k[v]realloc() to be able to set node and alignment
>> should a user need to do so. Rename the respective functions to
>> k[v]realloc_node() to better match what they actually do now and
>> introduce macros for k[v]realloc() for backward compatibility.
>>=20
>> With that change we also provide the ability for the Rust part of
>> the kernel to set node and aligmnent in its K[v]xxx [re]allocations.
>>=20
>> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>=20
> Hi Vitaly, there is a typo in the subject line: it should be slab, not =
slub.

Thanks, corrected.

>=20
>> ---
>> include/linux/slab.h | 12 ++++++++----
>> mm/slub.c            | 33 ++++++++++++++++++++++-----------
>> 2 files changed, 30 insertions(+), 15 deletions(-)
>>=20
>> diff --git a/include/linux/slab.h b/include/linux/slab.h
>> index d5a8ab98035c..119f100978c8 100644
>> --- a/include/linux/slab.h
>> +++ b/include/linux/slab.h
>> @@ -465,9 +465,11 @@ int kmem_cache_shrink(struct kmem_cache *s);
>> /*
>>  * Common kmalloc functions provided by all allocators
>>  */
>> -void * __must_check krealloc_noprof(const void *objp, size_t =
new_size,
>> -                                   gfp_t flags) __realloc_size(2);
>> -#define krealloc(...)                          =
alloc_hooks(krealloc_noprof(__VA_ARGS__))
>> +void * __must_check krealloc_node_noprof(const void *objp, size_t =
new_size,
>> +                                        gfp_t flags, int nid) =
__realloc_size(2);
>> +#define krealloc_node(...)             =
alloc_hooks(krealloc_node_noprof(__VA_ARGS__))
>> +#define krealloc_noprof(o, s, f)       krealloc_node_noprof(o, s, f, =
NUMA_NO_NODE)
>> +#define krealloc(...)                  =
alloc_hooks(krealloc_noprof(__VA_ARGS__))
>>=20
>> void kfree(const void *objp);
>> void kfree_sensitive(const void *objp);
>> @@ -1073,8 +1075,10 @@ kvmalloc_array_node_noprof(size_t n, size_t =
size, gfp_t flags, int node)
>> #define kvcalloc_node(...)                     =
alloc_hooks(kvcalloc_node_noprof(__VA_ARGS__))
>> #define kvcalloc(...)                          =
alloc_hooks(kvcalloc_noprof(__VA_ARGS__))
>>=20
>> -void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
>> +void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, =
int nid)
>>                __realloc_size(2);
>> +#define kvrealloc_node(...)                    =
alloc_hooks(kvrealloc_node_noprof(__VA_ARGS__))
>> +#define kvrealloc_noprof(p, s, f)              =
kvrealloc_node_noprof(p, s, f, NUMA_NO_NODE)
>> #define kvrealloc(...)                         =
alloc_hooks(kvrealloc_noprof(__VA_ARGS__))
>>=20
>> extern void kvfree(const void *addr);
>> diff --git a/mm/slub.c b/mm/slub.c
>> index c4b64821e680..2d5150d075d5 100644
>> --- a/mm/slub.c
>> +++ b/mm/slub.c
>> @@ -4845,7 +4845,7 @@ void kfree(const void *object)
>> EXPORT_SYMBOL(kfree);
>>=20
>> static __always_inline __realloc_size(2) void *
>> -__do_krealloc(const void *p, size_t new_size, gfp_t flags)
>> +__do_krealloc(const void *p, size_t new_size, gfp_t flags, int nid)
>> {
>>        void *ret;
>>        size_t ks =3D 0;
>> @@ -4859,6 +4859,15 @@ __do_krealloc(const void *p, size_t new_size, =
gfp_t flags)
>>        if (!kasan_check_byte(p))
>>                return NULL;
>>=20
>> +       /*
>> +        * it is possible to support reallocation with a different =
nid, but
>> +        * it doesn't go well with the concept of krealloc(). Such
>> +        * reallocation should be done explicitly instead.
>> +        */
>> +       if (WARN(nid !=3D NUMA_NO_NODE && nid !=3D =
page_to_nid(virt_to_page(p)),
>> +                               "krealloc() has mismatched nids\n"))
>> +               return NULL;
>> +
>>        if (is_kfence_address(p)) {
>>                ks =3D orig_size =3D kfence_ksize(p);
>>        } else {
>> @@ -4903,7 +4912,7 @@ __do_krealloc(const void *p, size_t new_size, =
gfp_t flags)
>>        return (void *)p;
>>=20
>> alloc_new:
>> -       ret =3D kmalloc_node_track_caller_noprof(new_size, flags, =
NUMA_NO_NODE, _RET_IP_);
>> +       ret =3D kmalloc_node_track_caller_noprof(new_size, flags, =
nid, _RET_IP_);
>>        if (ret && p) {
>>                /* Disable KASAN checks as the object's redzone is =
accessed. */
>>                kasan_disable_current();
>> @@ -4919,6 +4928,7 @@ __do_krealloc(const void *p, size_t new_size, =
gfp_t flags)
>>  * @p: object to reallocate memory for.
>>  * @new_size: how many bytes of memory are required.
>>  * @flags: the type of memory to allocate.
>> + * @nid: NUMA node or NUMA_NO_NODE
>>  *
>>  * If @p is %NULL, krealloc() behaves exactly like kmalloc().  If =
@new_size
>>  * is 0 and @p is not a %NULL pointer, the object pointed to is =
freed.
>> @@ -4947,7 +4957,7 @@ __do_krealloc(const void *p, size_t new_size, =
gfp_t flags)
>>  *
>>  * Return: pointer to the allocated memory or %NULL in case of error
>>  */
>> -void *krealloc_noprof(const void *p, size_t new_size, gfp_t flags)
>> +void *krealloc_node_noprof(const void *p, size_t new_size, gfp_t =
flags, int nid)
>> {
>>        void *ret;
>>=20
>> @@ -4956,13 +4966,13 @@ void *krealloc_noprof(const void *p, size_t =
new_size, gfp_t flags)
>>                return ZERO_SIZE_PTR;
>>        }
>>=20
>> -       ret =3D __do_krealloc(p, new_size, flags);
>> +       ret =3D __do_krealloc(p, new_size, flags, nid);
>>        if (ret && kasan_reset_tag(p) !=3D kasan_reset_tag(ret))
>>                kfree(p);
>>=20
>>        return ret;
>> }
>> -EXPORT_SYMBOL(krealloc_noprof);
>> +EXPORT_SYMBOL(krealloc_node_noprof);
>>=20
>> static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
>> {
>> @@ -5079,10 +5089,11 @@ void kvfree_sensitive(const void *addr, =
size_t len)
>> EXPORT_SYMBOL(kvfree_sensitive);
>>=20
>> /**
>> - * kvrealloc - reallocate memory; contents remain unchanged
>> + * kvrealloc_node - reallocate memory; contents remain unchanged
>>  * @p: object to reallocate memory for
>>  * @size: the size to reallocate
>>  * @flags: the flags for the page level allocator
>> + * @nid: NUMA node id
>>  *
>>  * If @p is %NULL, kvrealloc() behaves exactly like kvmalloc(). If =
@size is 0
>>  * and @p is not a %NULL pointer, the object pointed to is freed.
>> @@ -5100,17 +5111,17 @@ EXPORT_SYMBOL(kvfree_sensitive);
>>  *
>>  * Return: pointer to the allocated memory or %NULL in case of error
>>  */
>> -void *kvrealloc_noprof(const void *p, size_t size, gfp_t flags)
>> +void *kvrealloc_node_noprof(const void *p, size_t size, gfp_t flags, =
int nid)
>> {
>>        void *n;
>>=20
>>        if (is_vmalloc_addr(p))
>> -               return vrealloc_noprof(p, size, flags);
>> +               return vrealloc_node_noprof(p, size, 1, flags, nid);
>>=20
>> -       n =3D krealloc_noprof(p, size, kmalloc_gfp_adjust(flags, =
size));
>> +       n =3D krealloc_node_noprof(p, size, kmalloc_gfp_adjust(flags, =
size), nid);
>>        if (!n) {
>>                /* We failed to krealloc(), fall back to kvmalloc(). =
*/
>> -               n =3D kvmalloc_noprof(size, flags);
>> +               n =3D kvmalloc_node_noprof(size, flags, nid);
>>                if (!n)
>>                        return NULL;
>>=20
>> @@ -5126,7 +5137,7 @@ void *kvrealloc_noprof(const void *p, size_t =
size, gfp_t flags)
>>=20
>>        return n;
>> }
>> -EXPORT_SYMBOL(kvrealloc_noprof);
>> +EXPORT_SYMBOL(kvrealloc_node_noprof);
>>=20
>> struct detached_freelist {
>>        struct slab *slab;
>> --
>> 2.39.2
>>=20
>>=20

