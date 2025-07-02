Received: from mail186-10.suw21.mandrillapp.com (mail186-10.suw21.mandrillapp.com [198.2.186.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8212923A9A3
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.2.186.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751496139; cv=none; b=u8nQGlEfY7J3wQvFTEr0JdJaHYFNIiAwY6eCWLZ1gpMxs1+VfYNY6sL5RqHlqxWET97mSFL+mqaPUkkCSzTKXXJxPX7zi4zcMS2FevsKwduTlLU5C3RJE4PTbeDidWMyJ0WgFB3I8+/untW2eycxFTbaBYPJ/CMK60pnjKdRW30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751496139; c=relaxed/simple;
	bh=kh5WZR7d9dorGuI7Q6IIci1P7Y/xEBeQAyK9ligdiU8=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Date:
	 MIME-Version:Content-Type; b=Hey/zkK/JOjeGZHMpdlBHRd+2kddu6hfemnXKgcB5DKnIShwvFnU0cpGs3wbK06BoFg3UCGct/De4uKNPe/0xulrFSM4EPGpe8+xuYwJsh5+57dcYeDK93ZNGvxviMznou2zSpBYgNNF9cFNJckrKP5DO0hLZu/XnjsRUP//jFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech; spf=pass smtp.mailfrom=bounce.vates.tech; dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b=m52R/Zbg; dkim=pass (2048-bit key) header.d=vates.tech header.i=ngoc-tu.dinh@vates.tech header.b=Bk63xhpX; arc=none smtp.client-ip=198.2.186.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vates.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bounce.vates.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mandrillapp.com header.i=@mandrillapp.com header.b="m52R/Zbg";
	dkim=pass (2048-bit key) header.d=vates.tech header.i=ngoc-tu.dinh@vates.tech header.b="Bk63xhpX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1751496136; x=1751766136;
	bh=SHAawigTxxv6yh6TdZAJGRPMMIrw2ifj78O7i+3plPQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=m52R/ZbgEqSLPzTueva15ms/alji5VupZIRXBRzw6ZO9qLmvEIVEaPIgJc1k/q39B
	 1+MO5Q5zw/gIMySM7Y+XJZ/togwXHWbufOhQdQk9DYLpKGcDrgi+gQ4/b14XH1WsZZ
	 efAn3yrrkDYZjTEK7fyulZnWOSwnDJxxwjj16ZxGR3cZKpZt22Ud99j3K0PoCR+t2r
	 tY8d7Vv4ZZQhM6280DbzMima51gm+FDU1wwGcsoNgq+LzKVbIyS6Qn1mTyiqg2up6m
	 FszCOUks42X3jIxVFYwlSh3f4Hxuu4qwe5ArjsSeaOTQ7quXXl6Uf3pk9pDsA4Cdz3
	 TMp2IEDdYFvCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1751496136; x=1751756636; i=ngoc-tu.dinh@vates.tech;
	bh=SHAawigTxxv6yh6TdZAJGRPMMIrw2ifj78O7i+3plPQ=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bk63xhpXfcLqo20k0VGWRGuB+rsZ+fB5rlsbpPAWLOD09l0q/4vNYwULJ91j2fQgN
	 6aN43Q03mLoZu6gVE+HKBNCN+stc/8NZif/CNXcKsSykRJlYtslJBKd/xR+GhBYn2T
	 M9GoZBt8cV9o7xteTRp5KqNCJeVKDfyCo2XbA5Q29TVWingIEj21HU5Tj08J0rrNRT
	 HOVWs7o6V8WZxNs5ujtpsM7q3kFb4q01h9K8u6gbAQt2alTfn9m8ZqgU1DsuloQCWl
	 egmRYYM4OJsgwi2L17zgtpRgwvNmg3Ihof+V3Ndy4uMVD0q/08laCfa1jPrlHolJ0f
	 aOfzttmf/STdw==
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
	by mail186-10.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4bXZf03r69z5QkLn0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 22:42:16 +0000 (GMT)
From: "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20xen/gntdev:=20reduce=20stack=20usage=20by=20dynamically=20allocating=20gntdev=5Fcopy=5Fbatch?=
Received: from [37.26.189.201] by mandrillapp.com id c5b97b06e3454a01bccd03bf6ec2a807; Wed, 02 Jul 2025 22:42:16 +0000
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1751496134720
Message-Id: <ab668ddb-1ea5-4444-95fc-f31469b4f05e@vates.tech>
To: Abinash <abinashlalotra@gmail.com>
Cc: jgross@suse.com, sstabellini@kernel.org, oleksandr_tyshchenko@epam.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, "Abinash Singh" <abinashsinghlalotra@gmail.com>
References: <20250629204215.1651573-1-abinashsinghlalotra@gmail.com> <5e67d651-830a-4d99-af37-26f2d0efd640@vates.tech> <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
In-Reply-To: <CAJZ91LC610AsBZ8X3u8ZxAUhc6QT0FHeffQT0ARmnMgsGrdZQQ@mail.gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c5b97b06e3454a01bccd03bf6ec2a807?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250702:md
Date: Wed, 02 Jul 2025 22:42:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/07/2025 23:53, Abinash wrote:
> Hi ,
> 
> Thanks for pointing that out.
> 
> I haven=E2=80=99t measured the performance impact yet =E2=80=94 my main f=
ocus was on
> getting rid of the stack usage warning triggered by LLVM due to
> inlining. But you're right, gntdev_ioctl_grant_copy() is on a hot
> path, and calling kmalloc() there could definitely slow things down,
> especially under memory pressure.
> 
> I=E2=80=99ll run some benchmarks to compare the current approach with the
> dynamic allocation, and also look into alternatives =E2=80=94 maybe
> pre-allocating the struct or limiting inlining instead. If you have
> any ideas or suggestions on how best to approach this, I=E2=80=99d be hap=
py to
> hear them.
> 
> Do you have any suggestions on how to test the performance?
> 
> Best,
> Abinash
> 
> 

Preallocating may work but I'd be wary of synchronization if the 
preallocated struct is shared.

I'd look at optimizing status[] which should save quite a few bytes.

Reducing GNTDEV_COPY_BATCH could be a last resort, but that may also 
impact performance.

As for benchmarks, I think you can use iperf and fio with varying packet 
sizes/block sizes.

> On Mon, 30 Jun 2025 at 16:05, Tu Dinh <ngoc-tu.dinh@vates.tech> wrote:
>>
>> Hi,
>>
>> On 30/06/2025 06:54, Abinash Singh wrote:
>>> While building the kernel with LLVM, a warning was reported due to
>>> excessive stack usage in `gntdev_ioctl`:
>>>
>>>        drivers/xen/gntdev.c:991: warning: stack frame size (1160) excee=
ds limit (1024) in function 'gntdev_ioctl'
>>>
>>> Further analysis revealed that the large stack frame was caused by
>>> `struct gntdev_copy_batch`, which was declared on the stack inside
>>> `gntdev_ioctl_grant_copy()`. Since this function was inlined into
>>> `gntdev_ioctl`, the stack usage was attributed to the latter.
>>>
>>> This patch fixes the issue by dynamically allocating `gntdev_copy_batch=
`
>>> using `kmalloc()`, which significantly reduces the stack footprint and
>>> eliminates the warning.
>>>
>>> This approach is consistent with similar fixes upstream, such as:
>>>
>>> commit fa26198d30f3 ("iommu/io-pgtable-arm: dynamically allocate selfte=
st device struct")
>>>
>>> Fixes: a4cdb556cae0 ("xen/gntdev: add ioctl for grant copy")
>>> Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
>>> ---
>>> The stack usage was confirmed using the `-fstack-usage`  flag and mannu=
al analysis, which showed:
>>>
>>>     drivers/xen/gntdev.c:953: gntdev_ioctl_grant_copy.isra   1048 bytes
>>>     drivers/xen/gntdev.c:826: gntdev_copy                     56 bytes
>>>
>>> Since `gntdev_ioctl` was calling the inlined `gntdev_ioctl_grant_copy`,=
 the total
>>> frame size exceeded 1024 bytes, triggering the warning.
>>>
>>> This patch addresses the warning and keeps stack usage within acceptabl=
e limits.
>>> Is this patch fine or kmalloc may affect performance ?
>>> ---
>>
>> Have you measured the performance impact? gntdev_ioctl_grant_copy is
>> called quite often especially by the backend. I'm afraid calling the
>> allocator here may cause even more slowdown than there already is,
>> especially when memory is tight.
>>
>>>    drivers/xen/gntdev.c | 24 +++++++++++++++---------
>>>    1 file changed, 15 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
>>> index 61faea1f0663..9811f3d7c87c 100644
>>> --- a/drivers/xen/gntdev.c
>>> +++ b/drivers/xen/gntdev.c
>>> @@ -953,15 +953,19 @@ static int gntdev_grant_copy_seg(struct gntdev_co=
py_batch *batch,
>>>    static long gntdev_ioctl_grant_copy(struct gntdev_priv *priv, void _=
_user *u)
>>>    {
>>>        struct ioctl_gntdev_grant_copy copy;
>>> -     struct gntdev_copy_batch batch;
>>> +     struct gntdev_copy_batch *batch;
>>>        unsigned int i;
>>>        int ret =3D 0;
>>>
>>>        if (copy_from_user(&copy, u, sizeof(copy)))
>>>                return -EFAULT;
>>> -
>>> -     batch.nr_ops =3D 0;
>>> -     batch.nr_pages =3D 0;
>>> +
>>> +     batch =3D kmalloc(sizeof(*batch), GFP_KERNEL);
>>> +     if (!batch)
>>> +             return -ENOMEM;
>>> +
>>> +     batch->nr_ops =3D 0;
>>> +     batch->nr_pages =3D 0;
>>>
>>>        for (i =3D 0; i < copy.count; i++) {
>>>                struct gntdev_grant_copy_segment seg;
>>> @@ -971,18 +975,20 @@ static long gntdev_ioctl_grant_copy(struct gntdev=
_priv *priv, void __user *u)
>>>                        goto out;
>>>                }
>>>
>>> -             ret =3D gntdev_grant_copy_seg(&batch, &seg, &copy.segment=
s[i].status);
>>> +             ret =3D gntdev_grant_copy_seg(batch, &seg, &copy.segments=
[i].status);
>>>                if (ret < 0)
>>>                        goto out;
>>>
>>>                cond_resched();
>>>        }
>>> -     if (batch.nr_ops)
>>> -             ret =3D gntdev_copy(&batch);
>>> -     return ret;
>>> +     if (batch->nr_ops)
>>> +             ret =3D gntdev_copy(batch);
>>> +     goto free_batch;
>>>
>>>      out:
>>> -     gntdev_put_pages(&batch);
>>> +     gntdev_put_pages(batch);
>>> +  free_batch:
>>> +     kfree(batch);
>>>        return ret;
>>>    }
>>>
>>
>>
>>
>> Ngoc Tu Dinh | Vates XCP-ng Developer
>>
>> XCP-ng & Xen Orchestra - Vates solutions
>>
>> web: https://vates.tech
>>



Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


