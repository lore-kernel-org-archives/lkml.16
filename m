Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC01EEA40;
	Thu,  5 Jun 2025 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749130248; cv=none; b=Y4/B9hwr/sOYrrlS7K5CuSGKNEOwPoJ74XMQAuo3S05pnAh2beBY90uQZ0io3AfMUtxXXw2lcn+f4rjEWu6r8o1L117a+rxbB9Rj07atXGcwomhbdo8Lf8DZLGCQfm2X7ZE8faFl14jUBeY6bYpwMYkHHAagtAUJwC7J2q7mRhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749130248; c=relaxed/simple;
	bh=NMWEAjEnzZjApTVwiRgXnucHoBIYdvfSZ3X1Z3+VKyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DWxBdmk0VtogsSdyJrwME7OJgLqBddsxMhDsHpMh8IbzVKo0M2hntHKQNTgVvmpzkxIpRlBXEMb8brkz19Hc4ZzSYtvRHC55/PQkWYfEO5XH/MS5RDsf9OjOXLMe8G+9XZe7ELw2uDmb7TGxNt7HKluWPvly6NSFk+dd6DYlxq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIpvC2Un; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIpvC2Un"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-552206ac67aso1131995e87.2;
        Thu, 05 Jun 2025 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749130244; x=1749735044; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ELiHfGb3gJOhYFEbnYSWkZyihCqMCFVCR+nZR19Yl7U=;
        b=LIpvC2UncqevOqLQUuBC6hyAKIma4AlaQrkkQ0KSPUuoWvKSD467CV6hl2qwEaiwBV
         uO3B9RsLC53nO2qkxnfCdVsgDZLYip16GFffMSQoMAQrVNOPi0cu1Q8+6A/ekM5BtHYh
         G2297mFR4miNiTp26BsfnEHjusne4HdoKFl5p4mCRdJPPJmOuFoswIboH9fWuc1Wvr4v
         3AbHvVNMpoqGbDJUoq/l+oMbzf4CNBwtIaD5vjh0qvUaYmUMAYlkmWCmLa+g4enbK8Xo
         WzPOCctXzG9zpaEWiLCQNEc1tzprMQDpTR4pvjy6uWbgjgANvX8ju8mMfwhwpbag8lKS
         Kx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749130244; x=1749735044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELiHfGb3gJOhYFEbnYSWkZyihCqMCFVCR+nZR19Yl7U=;
        b=bNAvMELn54CA/hrUssYbUL2xC1NgrjbaNDQvzqXc4Cp39xfZ6WCjgQtt76bxlpIWYb
         09TYS1rIxHPPf+9G3mMtrjTO4IPpRfJ+TcMP2N4oc4Zuc0bsDuHps8LdbKK6ebsbqZep
         I/j51/HS6lj8oR1/MXLlqB2In0G5feVn5Y2i6/HeJVg8Rd3rPlF9VIpckDKDqR7XFLaO
         M3bnMyTrQpbDvgjzSOb8iuKnELHceoazF29PtxtQDtdF+4XE0v/cdslISs6HFZmzrTEs
         Yyz6Wsx1E5bYvZuR6LZC4s3kXtMygQfylcMbBHRBZhMsK73sIl6BzGYESlNLVCCcUo1j
         +mgg==
X-Forwarded-Encrypted: i=1; AJvYcCW0LAchqcUSyisjMeB6ZJKrjilyY+3Gy8ZSIg8Zymm7iuKUteNqGSaCvbUN6/r1Gu4aRMq5nF4Zx5KLKEk=@vger.kernel.org, AJvYcCW2AZogBlBA/7MQkcqN0iy1cHYtbiqOytPVwgNmSIltWALX2g0+RmB5n8FdfkCfcTABpEs0RHZMGsQsPJHDN/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNvcGytqNTGYiJ9CnKQR5fxzJNXpWt2qDR+dRAGkpfCFZv2OVk
	M6e5ZBaJx8XHesCZC1tzsqJH6MoBxzEhCVKMNPoriiLVerRAB/SSyIE/
X-Gm-Gg: ASbGnctHhONXJcjj7k1l9m38K4kAha1OCBDJp53+N18SfDA2vZ5WDU05yjePNz1TVba
	ZlsXKhsiGC2NUyvapunNxqUt1JNRAOgTDOlDV10fig+LEhNOJfbZ5Z8Th8g9W9gSJ3EiEEm1aKO
	r7t2qVa/mGpXtzos5qwt9cq0cJXWRB8xiIrnZmFW25XsOTxBq/eKZ6tF5xIOQ6kEJFDk5IbujQ6
	44lYV2dGxYqlNmHWekw6f+4ZsQJzTcYY5Qhwd7OnRpAX+UQs7AI1idjvn+R6rc+RV+URux5yEPD
	mXO98S9IcHeAXwRjnY9WGVCe89dIPPu3uEQU2rf6wfJKUfQBQTJcvFSB+pXFAA9oesFCJaK6Q43
	Z+FMmyvkZyMf83OrJScP9+M7Rm/fG
X-Google-Smtp-Source: AGHT+IEF+PITkMRWLVOjyJ0cqd4cnK3Xcxhp4Mve7qYR67GwKQOBFCd8LgQs47YQTlm7h85zXe3RRQ==
X-Received: by 2002:a05:6512:ea0:b0:553:2f57:f8af with SMTP id 2adb3069b0e04-55356bf152amr2102514e87.20.1749130244273;
        Thu, 05 Jun 2025 06:30:44 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d325sm2605610e87.49.2025.06.05.06.30.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:30:43 -0700 (PDT)
Message-ID: <27e17dbf-df6a-48fc-a652-ad48a776f668@gmail.com>
Date: Thu, 5 Jun 2025 16:30:42 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
To: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Cc: dakr@kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, airlied@redhat.com,
 rust-for-linux@vger.kernel.org,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
 Petr Tesarik <petr@tesarici.cz>, Andrew Morton <akpm@linux-foundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Sui Jingfeng <sui.jingfeng@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
 Michael Kelley <mhklinux@outlook.com>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
 <20250528221525.1705117-2-abdiel.janulgue@gmail.com>
 <20250529004550.GB192517@ziepe.ca> <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
 <95ff963ddabf7c3cd2cfd07d0231a0073ff6847e.camel@redhat.com>
 <DAED5BUK7TUQ.4JRHFMWZ99W3@nvidia.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <DAED5BUK7TUQ.4JRHFMWZ99W3@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05/06/2025 08:51, Alexandre Courbot wrote:
> On Thu Jun 5, 2025 at 3:21 AM JST, Lyude Paul wrote:
>> On Fri, 2025-05-30 at 23:02 +0900, Alexandre Courbot wrote:
>>> On Thu May 29, 2025 at 9:45 AM JST, Jason Gunthorpe wrote:
>>>> On Thu, May 29, 2025 at 01:14:05AM +0300, Abdiel Janulgue wrote:
>>>>> +impl SGEntry<Unmapped> {
>>>>> +    /// Set this entry to point at a given page.
>>>>> +    pub fn set_page(&mut self, page: &Page, length: u32, offset: u32) {
>>>>> +        let c: *mut bindings::scatterlist = self.0.get();
>>>>> +        // SAFETY: according to the `SGEntry` invariant, the scatterlist pointer is valid.
>>>>> +        // `Page` invariant also ensures the pointer is valid.
>>>>> +        unsafe { bindings::sg_set_page(c, page.as_ptr(), length, offset) };
>>>>> +    }
>>>>> +}
>>>>
>>>> Wrong safety statement. sg_set_page captures the page.as_ptr() inside
>>>> the C datastructure so the caller must ensure it holds a reference on
>>>> the page while it is contained within the scatterlist.
>>>>
>>>> Which this API doesn't force to happen.
>>>>
>>>> Most likely for this to work for rust you have to take a page
>>>> reference here and ensure the page reference is put back during sg
>>>> destruction. A typical normal pattern would 'move' the reference from
>>>> the caller into the scatterlist.
>>>
>>> As Jason mentioned, we need to make sure that the backing pages don't get
>>> dropped while the `SGTable` is alive. The example provided unfortunately fails
>>> to do that:
>>>
>>>      let sgt = SGTable::alloc_table(4, GFP_KERNEL)?;
>>>      let sgt = sgt.init(|iter| {
>>>          for sg in iter {
>>>              sg.set_page(&Page::alloc_page(GFP_KERNEL)?, PAGE_SIZE as u32, 0);
>>>          }
>>>          Ok(())
>>>      })?;
>>>
>>> Here the allocated `Page`s are dropped immediately after their address is
>>> written by `set_page`, giving the device access to memory that may now be used
>>> for completely different purposes. As long as the `SGTable` exists, the memory
>>> it points to must not be released or reallocated in any way.
>>>
>>> To that effect, we could simply store the `Page`s into the `SGTable`, but that
>>> would cover only one of the many ways they can be constructed. For instance we
>>> may want to share a `VVec` with a device and this just won't allow doing it.
>>>
>>> So we need a way to keep the provider of the pages alive into the `SGTable`,
>>> while also having a convenient way to get its list of pages. Here is rough idea
>>> for doing this, it is very crude and probably not bulletproof but hopefully it
>>> can constitute a start.
>>>
>>> You would have a trait for providing the pages and their range:
>>>
>>>      /// Provides a list of pages that can be used to build a `SGTable`.
>>>      trait SGTablePages {
>>>          /// Returns an iterator to the pages providing the backing memory of `self`.
>>>          fn pages_iter<'a>(&'a self) -> impl Iterator<Item = &'a bindings::page>;
>>>          /// Returns the effective range of the mapping.
>>>          fn range(&self) -> Range<usize>;
>>>      }
>>>
>>> The `SGTable` becomes something like:
>>>
>>>      struct SGTable<P: SGTablePages, T: MapState>
>>>      {
>>>          table: Opaque<bindings::sg_table>,
>>>          pages: P,
>>>          _s: PhantomData<T>,
>>>      }
>>
>> Hopefully I'm not missing anything here but - I'm not sure how I feel about
>> this making assumptions about the memory layout of an sg_table beyond just
>> being a struct sg_table. For instance, in the gem shmem helpers I had this for
>> exposing the SGTable that is setup for gem shmem objects:
>>
>> struct OwnedSGTable<T: drm::gem::shmem::DriverObject> {
>>      sg_table: NonNull<SGTable>
>>      _owner: ARef<Object<T>>
>> }
>>
>> So, I'm not really sure we have any reasonable representation for P here as we
>> don't handle the memory allocation for the SGTable.
> 
> Maybe I need more context to understand your problem, but the point of
> this design is precisely that it doesn't make any assumption about the
> memory layout - all `P` needs to do is provide the pages describing the
> memory backing.
> 
> Assuming that `_owner` here is the owner of the memory, couldn't you
> flip your data layout and pass `_owner` (or rather a newtype wrapping
> it) to `SGTable`, thus removing the need for a custom type?

I think what Lyude has in mind here (Lyude, correct me if I'm wrong) is 
for cases where we need to have a rust SGTable instances for those 
struct sg_table that we didn't allocate ourselves for instance in the 
gem shmem bindings. So memory layout needs to match for
#[repr(transparent)] to work

