Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EC31FC0EA;
	Mon, 26 May 2025 13:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264655; cv=none; b=W8xBFP4Vk0lFnnXEGxCHhGkMrJzWc0+94xuoepFntrrUoG2xVyA7j0InxE37EV11txRjJDIuJLaY3iyCwkTZn3cqIxBJaDNpHZ+0d+4yTIot6dBNUIMCZHRp3k4QeZ0iAU8jzdnxSNBe4WYJqxRUiozGuCyVDiayYgO3253279s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264655; c=relaxed/simple;
	bh=wbVZiFmXwev0gwrEsOeAMboGoCc09zmui6KUEqZX+DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVzk8qkaMdkk5ceveMxR8bRZ1LU8eVEB99EW5tXvpg7sowb7WI6yESJFtZXtZd8uCSwHZxkguB4wb/oDXaIxHMZ42Xw6wI9UPKvDyI4u5eAC8WvujRig3gid6Kkv/Ne7jvp891iP/Au28wEbra/R4SE8DNUStKaQF2WpxU+Z7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVWx3oVE; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVWx3oVE"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54acc0cd458so2818839e87.0;
        Mon, 26 May 2025 06:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748264652; x=1748869452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2yCa2GdViCiB3X5UlZL3nXJrusQdUTZkaipPeBJHwY=;
        b=RVWx3oVE5pop1qQBlt5sX4FVagMnfF4k189fB1zBAxlV1HpYBAe/OYmGkm5pNwz/M3
         iawfY54YFybOpfzDxbvKIWKhU0qPqoC1Ytloyze0PhR3IZS8IcXrMWZfcaWLmEJtgnof
         OexC0F4P67z2FaXguclS1sjkMTSxhRLTn+CbjTts4NbjOQGeYW6qtJZQMLDVghLayEfa
         EXV2CNFgBAMBsj6pdcRY4Z/7cqH6F/5n0hmU3+62YV0ibwcrgoneb29f35G2n8p6SUGk
         oN/78vzpuuW2N9ISf2coqjs7akrOTy96BQvnZbDPqCiOmcuWyQIancHJVsdWuaKMMjra
         TAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748264652; x=1748869452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2yCa2GdViCiB3X5UlZL3nXJrusQdUTZkaipPeBJHwY=;
        b=KA4RWeuN6IUg3H7Cqi3/myhKK7yGzfLUhLRPbsS9l5KjOcXfsGv0FqZ3qUN8QpS1jD
         bpYDoyoFQDCoOA/hJn2VgLueEA10ZCJZ0BuXsoiLzacQj6JtJOwPsp5M0nND51knTarX
         FBTxcgT607Ar2kILL9rpaUegTLfb/MPWvz2j2EmH2GAQDjvA0IaCcIH6yJlSUMRL9ZCN
         Q+9WMtTu2CY1MNy3/amabDvVL77GTqdTp19+L7fhPBxvF0zAmQRxBGo1YBdQ2GRZGmmZ
         uZM7c9QNH/iIY/WA4XCcK7DoRN3C/KjHz07yBrMDjiEMSG90FnjxLY92haWDdm+ihOgd
         Cjvg==
X-Forwarded-Encrypted: i=1; AJvYcCUxDHLP7jPEjebmzclryIMtVL6Qkp1R7nN563taiDgtQTP5ENYI7DSWoSRZvrjKtTYfi/u1kfzkPVIs7Xt1uys=@vger.kernel.org, AJvYcCWnoJOvnCtR6Ap/YeggfgYJfHlAaQPEAlx9MT/f8tg3hU5VrF+OzBD00Nx6fR0R62322B2M1HEhp72stZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy48EzEOyA/YTVkikkdvCW3Iaw6+iDCLnUZznrpG0cYCXTXkLjk
	mdIclHOPm7Zxo04ltezdmIl8yO1R+0b8MEycbv3MoGBVibInESGglygs
X-Gm-Gg: ASbGncvNXHb0FL1k28vd15o1jbaAtG7sFqXZYW70WCsaEYTmbmGiBRG3btDeb35htJG
	zMIDa5FO7N2OSg6VNMKtP5DNAAiveYZEDKGKNdXSoFGA2amQ6Ja/mb8FvOIL1rW4tORy0opLwgY
	wFv3yTS1XIwV4ygiiznWl57kiDJMaiQuVF0rmDiDbYxrv8b3/H+aYkYspkT7EUIW74MNaYzHDbH
	/5a+fMD8vyPz+dwqq2MM9thfsQoEBK7YF/8498DVWZD6yAvE6MzSzZ9oCU91MiRsy7lyZSD4up2
	qUUuMtBL4uBnUfS5O21a6aagtDS4MVxmOvvlEdcxg3gZ43kW0dXvJq8u2ZsT42jnG+y8lYtepVl
	rp2YaN/ZDZk3tNUy/3bX+RkES78I0FAVi9BpvhUQ=
X-Google-Smtp-Source: AGHT+IHMvM2cn9Sebeh8KS/nonuFNkYq1+2FpxCDUBtOw1DGLegUUAF8fUEBN/E9/r6S37bXQ8AGvg==
X-Received: by 2002:a05:6512:414e:b0:552:2115:ecc4 with SMTP id 2adb3069b0e04-5522115ee67mr1102763e87.50.1748264651113;
        Mon, 26 May 2025 06:04:11 -0700 (PDT)
Received: from [192.168.1.146] (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532202f7fbsm422523e87.148.2025.05.26.06.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:04:10 -0700 (PDT)
Message-ID: <44a70b0c-af38-4706-90e3-0e0a7f6ad6f8@gmail.com>
Date: Mon, 26 May 2025 16:04:09 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] rust: add initial scatterlist bindings
To: Lyude Paul <lyude@redhat.com>, dakr@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
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
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
 <20250512095544.3334680-2-abdiel.janulgue@gmail.com>
 <36b45e41522a61409b379c15f21bb547d4913d1e.camel@redhat.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <36b45e41522a61409b379c15f21bb547d4913d1e.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lyude,

On 15/05/2025 23:01, Lyude Paul wrote:
> 
> I think you might have made a mistake below
> 
>> +impl<'a> Iterator for SGTableIter<'a> {
>> +    type Item = &'a SGEntry;
>> +
>> +    fn next(&mut self) -> Option<Self::Item> {
>> +        self.pos.map(|entry| {
>> +            let sg = entry.as_raw();
> 
>                 ^ sg is the last iterator position
> 
>> +            // SAFETY: `sg` is guaranteed to be valid and non-NULL while inside this closure.
>> +            unsafe {
>> +                let next = bindings::sg_next(sg);
> 
>                     ^ and we fetch the next iterator position
> 
>> +                self.pos = (!next.is_null()).then(|| SGEntry::as_ref(next));
>> +                SGEntry::as_ref(sg)
> 
>                     ^ but then we return the previous iterator position, sg
>> +            }
> 

Just had a second look at this again.I think the previous code is okay. 
I integrated the iterator fixes you suggested, however the mapped 
sgtable crashes on dma_unmap_sgtable().

One hint is that the fix seems to skip the initial entry of the sgtable? 
The previous code doesn't skip the initial entry when iterating:

fn next(&mut self) -> Option<Self::Item> {

   self.pos.take().map(|entry| {
      let sg = entry.as_raw();
      ^ sg is the current iterator position from self.pos

      let next = bindings::sg_next(sg);
      self.pos = (!next.is_null()).then(|| SGEntry::as_mut(next));
      ^ update the iterator position for the next loop to sg_next()
        or set to null if sg_next() is the last entry

      SGEntry::as_mut(sg)
      ^ Return the current iterator position
    })
}


Regards,
Abdiel
