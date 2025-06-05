Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A941EDA12;
	Thu,  5 Jun 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129776; cv=none; b=U9pseO2uBHmuGKb6Y1V1vS2hBWohxYKosUwaZo5gmZvj3SwCFZKTQFpUPfW4tPyqe3gHkCh6oWcd8A4iuc2lWGCmk1o+yhYHX477WQfkTm09NSEeRLUe8i0chfy2NtM2M3vu3b0tvd9xnVcoQ71e3SBirvHOv4k6eKf/rw3ni6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129776; c=relaxed/simple;
	bh=CfFh3w0ThJN+yAH5vQnSPQ1cohCNV0n239N6A/m/PpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZE27c9AF8UhyjkfMmg3ieZy8DKeznKkL3JQ1lLScgG+YwJJ2dnSQjcP0LEymefi+kg1osgA0544aNXaitVDdaWmpVplLcaxSQFkEWfzkqtm1M1ldRc/KTGwHBFAE023scAU6/RI99uJwNpTugT7tTVxjyI3+ExR1I6Kh/kVTIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ef5dZqDj; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ef5dZqDj"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5534edc6493so1206868e87.1;
        Thu, 05 Jun 2025 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129772; x=1749734572; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I/GGnrCZDhPfrx6amA2Y2XENRlSPIkx2oqNJAJB+2Yg=;
        b=Ef5dZqDjjSyZlj0zoQHWjHQyGYDYDtjWKzLhjgwRn5+QEASJkZmpEQud/YUlCNdZGh
         GwoX8kxe8LpPXdJnA4IL2yv38CmKMn4PP8FMyx+6b7FuIQ04MdCPKs91YvzW7C5EVuvV
         RGouY/IpX+q3CITjagZCTPpaCH0RJF3ehlP2XlIUd3czB7gpvvEtXSRMGR+j93OGT53J
         RQpJw3txa+RuR+sP7tZdbMR5SWVRzksETHBOFmb+kttIAEqonxCQ3Y0bdTqfY+/PNoqz
         6ysVQgoK0llzFX7SjvV6jZUR9MOwHdwvvVd+PEG5/YPiOBDVVb6XaaKnft8Hfh4G5McO
         KEqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129772; x=1749734572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I/GGnrCZDhPfrx6amA2Y2XENRlSPIkx2oqNJAJB+2Yg=;
        b=kUsLq6UUDLB9PvyI9D+HiDRUex11/r2rLbQFzH/PoAYShqsuNUBZCuHba2ATSJTymt
         WM/y1wVR8L8njsclgSn6VceGMZZkRqkOpfXJAxieSIMYwWn9XDJEbgF62xoUrlwq91ic
         I+ZGOIxcaVr0X3hUJceld/MDWCiRL7ZR+/w8cJCpL3tXwonsakdtG/jTAsYrR3ZJFp75
         RoWinAZdvzvf3W9hKb2uJuZ3GLsJco3vo61ch3EsCxzI9jYdqVgIu18kspUamhi5Rn1v
         +HVuV+iuysbfWyzkrpXe16rlNbpVuzI9Qbz+v1IMGF+noZtRPfgUDawFGJt2jAPVbC1e
         rbjw==
X-Forwarded-Encrypted: i=1; AJvYcCV/YGjJSkgtLeQ5elrJwPnBnrN5bVA0cb+8t4/fKsHI0lGJqpR6OrDaNf5FNhFohg9qDfL0r1HeD8wkmtnz3+g=@vger.kernel.org, AJvYcCWjy4JwjfS5V2Flpiq1nghNHpREaMX1vrl/rIkTehVMqvTv/KBFlagfP4218F2kgLoYWOXR8ulC8rC3NAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYBh0QrkVAapoAK9B0yG9z5CGvvSWWRAXf6gByFT7K2G47YF6B
	Pw7uETEEDomS2dYyHUjS3uxLbLqOIyV7c0VUuvJtiN81CkjzHo6/z4Xt
X-Gm-Gg: ASbGncsZ4gyVe7Yb6LTGMFNkRtJlhyoAFOgPTRhZPAvmkHB1Y7tXZjyB4OHybNqeQIY
	nbYQ44X8Gk52ThJezuNO3LwOlgCkQgtN2nFBMAPJmtowdTzhSJl15ZE28zt9vh/mYs6GUT/jz1r
	bNiVv4LioTVLMV80Pp0UI6JXyjR0KKUO+eHkdzXTwDq1ceVR8sqIbSiQu/IcHPESFThbQ5rePs7
	EXu6jxPSAyqV4TUFLdtcnnYxta8oOJkmHX5daDT0+s0JqajSwSAW7jiolEBCfm7bBxWT9FcF/6T
	CPY+qu5WhalqH1nXVWhqCjsGKWfx5spToYVYyHPNDcKcb8VhcKJ1Doqbusx9uNPIMapPrFy/3on
	vapT4sN1l0OHCU7NdJ25YEEjlC/RO
X-Google-Smtp-Source: AGHT+IGUkWPUVcTxMOH4yIrjfz5Gt3Qal4jvY6QFmn4eIjhXcLJmVM6uyLDL0ne8sloZ4dGqhpJwAg==
X-Received: by 2002:a05:6512:12c3:b0:553:35ca:5922 with SMTP id 2adb3069b0e04-55356e04c18mr2010599e87.56.1749129771676;
        Thu, 05 Jun 2025 06:22:51 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533791d026sm2640505e87.168.2025.06.05.06.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:22:50 -0700 (PDT)
Message-ID: <5c72682a-ede9-4a48-a214-f1795115816b@gmail.com>
Date: Thu, 5 Jun 2025 16:22:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: add initial scatterlist bindings
To: Alexandre Courbot <acourbot@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: dakr@kernel.org, lyude@redhat.com, Miguel Ojeda <ojeda@kernel.org>,
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
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <DA9JTYA0EQU8.26M0ZX80FOBWY@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/05/2025 17:02, Alexandre Courbot wrote:
> On Thu May 29, 2025 at 9:45 AM JST, Jason Gunthorpe wrote:
>> On Thu, May 29, 2025 at 01:14:05AM +0300, Abdiel Janulgue wrote:
>>> +impl SGEntry<Unmapped> {
>>> +    /// Set this entry to point at a given page.
>>> +    pub fn set_page(&mut self, page: &Page, length: u32, offset: u32) {
>>> +        let c: *mut bindings::scatterlist = self.0.get();
>>> +        // SAFETY: according to the `SGEntry` invariant, the scatterlist pointer is valid.
>>> +        // `Page` invariant also ensures the pointer is valid.
>>> +        unsafe { bindings::sg_set_page(c, page.as_ptr(), length, offset) };
>>> +    }
>>> +}
>>
>> Wrong safety statement. sg_set_page captures the page.as_ptr() inside
>> the C datastructure so the caller must ensure it holds a reference on
>> the page while it is contained within the scatterlist.
>>
>> Which this API doesn't force to happen.
>>
>> Most likely for this to work for rust you have to take a page
>> reference here and ensure the page reference is put back during sg
>> destruction. A typical normal pattern would 'move' the reference from
>> the caller into the scatterlist.
> 
> As Jason mentioned, we need to make sure that the backing pages don't get
> dropped while the `SGTable` is alive. The example provided unfortunately fails
> to do that:
> 
>      let sgt = SGTable::alloc_table(4, GFP_KERNEL)?;
>      let sgt = sgt.init(|iter| {
>          for sg in iter {
>              sg.set_page(&Page::alloc_page(GFP_KERNEL)?, PAGE_SIZE as u32, 0);
>          }
>          Ok(())
>      })?;
> 
> Here the allocated `Page`s are dropped immediately after their address is
> written by `set_page`, giving the device access to memory that may now be used
> for completely different purposes. As long as the `SGTable` exists, the memory
> it points to must not be released or reallocated in any way.


Hi just a silly observation while trying to think about other ways to 
tie the page lifetime to the sgtable. Why can't we just use a lifetime 
bound annotation?

It's simpler and it seems to work:


impl<'b> SGEntry<'b, Unmapped> {
     pub fn set_page<'a: 'b> (&mut self, page: &'a Page, length: u32, 
offset: u32)

So with this, my erroneous example fails to compile. Here the compiler 
enforces the use  of the api so that the page of the lifetime is always 
tied to the sgtable:


let sgt = sgt.init(|iter| {
    |                             ---- has type 
`kernel::scatterlist::SGTableIterMut<'1>`
71 |             for sg in iter {
    |                 -- assignment requires that borrow lasts for `'1`
72 |                 sg.set_page(&Page::alloc_page(GFP_KERNEL)?, 
PAGE_SIZE as u32, 0);
    |                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
              - temporary value is freed at the end of this statement
    |                              |
    |                              creates a temporary value which is 
freed while still in use


Regards,
Abdiel
