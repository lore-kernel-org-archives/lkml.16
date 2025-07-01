Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D0823ABA7;
	Tue,  1 Jul 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368568; cv=none; b=MmCH5J323g8fdwQwQwe0p8wW3dSqBo5xyBPwMN8Aln9W/z8xVcC9HwVGbQwZShA4zAgaeDTrh2WSeAD9K2szqUpawvjkM3q1uvzc/W8X4CnwN54u7QQ31rwR8+LUS5KaoGhEXnVDrQzN6ojrS8SdVE6rPKiPqJCJiT46D8k7Vj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368568; c=relaxed/simple;
	bh=CAkSiWKP+sJy98dilyg86EM6CTAapR520tBC2bY2n6w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=anXW5G7bTPalQEIaC31NJZwNP2dkXfRFR0ysgczN0teCHatCMH1Unj3ZX5gj7ilMxLtUohqnq75w0zxo938kl2aaRuuTGH6ktBezjUk+E2f+zgiPg3Yx47rpLoLrU/ccCgr0Rka7hfIFf+CGyECsYzghQIoUpReozO/KygZpFGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnfruKrP; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnfruKrP"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55516abe02cso2717972e87.0;
        Tue, 01 Jul 2025 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751368565; x=1751973365; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RW+hX+cQCyvacj8gxDCQmCJ1cgJrO4Ch8WdKLpegjyg=;
        b=AnfruKrPA1sHX5kTP2JAChPdG4LeYevPeHOKAjWhRfTBf77wh8LAf7RZ2h3k7eMr+v
         a9Le7DU9u1sJUBS0HfZ8Wqll9fGRSNE4CB14Gojv6W43VX9WTNwTSDD69HzqPn6NZ91F
         E1qgd+1L/tWoeBXSVw31rn8XX8cvdx9xuIFFjFe0vTpfGcwJKRftFqA+aStWGgwfQx+d
         Dbgv0UOhnw1NYXOzIqN2qSplgbO3fcQsJ3y5TqiPq7maEaKIvZY8wRt2pgK1EsPpveVi
         9bOKjwd1yVQ/z3WCcAntq++KYasDh55nHY0O76Uc9TXheV9dGBt+dwN/tzirEPEe9sdB
         g38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368565; x=1751973365;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RW+hX+cQCyvacj8gxDCQmCJ1cgJrO4Ch8WdKLpegjyg=;
        b=R4q+JaW4+3jFkrNattdcA3GlO2jXKo1IWE8vxWTXJP4145MVMQr+gRPkidDaOszVgv
         uqHIzWvpGVhwJ4uVqW6UsA1SKp8C9sA9wtkvIb3TdDS7JcqA/53RX2cBurrh3NzQIkfC
         FRDry/jAq+Mh3hAiJRhrsjCH6YeA5yOkPHy9L5XW+BYfGuoaqvFnZHhD2vcEaPrUcHDK
         I/wDx2wRDa9iJAbUOd7LM+oNZqZUde9POCjKn/mMwXhTKkCglE8iUzWrZrSzSZSLpg1R
         V503iAkQfigEAJ68l+ScpTjNSqa2bsZKR6b9Fd0QIS9uQQF767DuiEnNWvKY6c1oHhG1
         GJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUimc8Mk/gKQA4vBuUxT50j3lMg24cG7VLuNJwNxtqQupDPpJSz6CqdqcMz7SOdkMEeBFxVLqFtbM3AH74=@vger.kernel.org, AJvYcCXIuopPVrByfnZjHGJIEvwU21rJ7FUm+nFFmT3f9AkkW2zR5Bug3lxEMCvMjI9ERiN29Igp5UoNzrxtCGIPv3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgUvii8aoQR652U69CPN81UzIVCxw2IysBRlOrYzsV8I4Sb5H
	AffsFENJKvFLPTFjPCa+F8WzUbE+JR0JrbVQ/iF0JdD1PTg+Koi8LQYt
X-Gm-Gg: ASbGncsR7qCQUpsQSLLNft1ey7iSR+xeSJsKTFkKiMGUJ2sflUSRZNozCYibSW0Fh37
	+CGJQjO2uqUtmQbLSpnitYkOxWi1K9tEgONJAW6gil/+n3YmDm6bsbNcme4GNeez7jQM/KOhjNI
	TRcnPGAzB78u5RQuygYfnB00JwaJ9BDWB56KLvPM28Es5NuKe5tAksoyLzK9cLexuesNmYHQF/8
	n3Oif9a2j5c8BwhhLGdG29kHRrMIY4ZRNcCNP9sMCG/ucp+LGbfWlTW4Yp1O3HqZyer+bDdl/OD
	fZ1x7jGZk7Hybn6IKkkHKZ14zNaWf7Y6aAnouVhQoF8Ffwb9/eSpNkltzmoWINZivOMyBSoCEFe
	9pKI4lwmH6fw=
X-Google-Smtp-Source: AGHT+IH7beHmzryKHMnEptA76HGQNtp9dSvozMXm0SLIjavGHfqq5azRcWWkcV18tUriffM+X03KIQ==
X-Received: by 2002:a05:6512:33ca:b0:553:a294:3f8 with SMTP id 2adb3069b0e04-5561f8983e2mr965176e87.14.1751368564504;
        Tue, 01 Jul 2025 04:16:04 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b95b7sm1774918e87.108.2025.07.01.04.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:16:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 1 Jul 2025 13:16:01 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v9 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aGPDcUc5ixYF8cQL@pc636>
References: <20250630221511.3325123-1-vitaly.wool@konsulko.se>
 <20250630221615.3325221-1-vitaly.wool@konsulko.se>
 <aGO9a06HutqljjNS@pc636>
 <31E257E1-AB52-4115-A264-56F545AB84A9@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31E257E1-AB52-4115-A264-56F545AB84A9@konsulko.se>

On Tue, Jul 01, 2025 at 12:54:36PM +0200, Vitaly Wool wrote:
> 
> 
> > On Jul 1, 2025, at 12:50 PM, Uladzislau Rezki <urezki@gmail.com> wrote:
> > 
> > On Tue, Jul 01, 2025 at 12:16:15AM +0200, Vitaly Wool wrote:
> >> Reimplement vrealloc() to be able to set node and alignment should
> >> a user need to do so. Rename the function to vrealloc_node_align()
> >> to better match what it actually does now and introduce macros for
> >> vrealloc() and friends for backward compatibility.
> >> 
> >> With that change we also provide the ability for the Rust part of
> >> the kernel to set node and aligmnent in its allocations.
> >> 
> >> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
> >> ---
> >> include/linux/vmalloc.h | 12 +++++++++---
> >> mm/vmalloc.c            | 19 +++++++++++++++----
> >> 2 files changed, 24 insertions(+), 7 deletions(-)
> >> 
> >> diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
> >> index fdc9aeb74a44..68791f7cb3ba 100644
> >> --- a/include/linux/vmalloc.h
> >> +++ b/include/linux/vmalloc.h
> >> @@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t size, gfp_t flags) __alloc_size(1
> >> extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
> >> #define vcalloc(...) alloc_hooks(vcalloc_noprof(__VA_ARGS__))
> >> 
> >> -void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> >> - __realloc_size(2);
> >> -#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> >> +void *__must_check vrealloc_node_align_noprof(const void *p, size_t size,
> >> + unsigned long align, gfp_t flags, int nid) __realloc_size(2);
> >> +#define vrealloc_node_noprof(_p, _s, _f, _nid) \
> >> + vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
> >> +#define vrealloc_noprof(_p, _s, _f) \
> >> + vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
> >> +#define vrealloc_node_align(...) alloc_hooks(vrealloc_node_align_noprof(__VA_ARGS__))
> >> +#define vrealloc_node(...) alloc_hooks(vrealloc_node_noprof(__VA_ARGS__))
> >> +#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> >> 
> >> extern void vfree(const void *addr);
> >> extern void vfree_atomic(const void *addr);
> >> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> >> index 6dbcdceecae1..776c68f84ce2 100644
> >> --- a/mm/vmalloc.c
> >> +++ b/mm/vmalloc.c
> >> @@ -4089,12 +4089,15 @@ void *vzalloc_node_noprof(unsigned long size, int node)
> >> EXPORT_SYMBOL(vzalloc_node_noprof);
> >> 
> >> /**
> >> - * vrealloc - reallocate virtually contiguous memory; contents remain unchanged
> >> + * vrealloc_node_align_noprof - reallocate virtually contiguous memory; contents
> >> + * remain unchanged
> >>  * @p: object to reallocate memory for
> >>  * @size: the size to reallocate
> >> + * @align: requested alignment
> >>  * @flags: the flags for the page level allocator
> >> + * @nid: node id
> >>  *
> >> - * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size is 0 and
> >> + * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If @size is 0 and
> >>  * @p is not a %NULL pointer, the object pointed to is freed.
> >>  *
> >>  * If __GFP_ZERO logic is requested, callers must ensure that, starting with the
> >> @@ -4111,7 +4114,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
> >>  * Return: pointer to the allocated memory; %NULL if @size is zero or in case of
> >>  *         failure
> >>  */
> >> -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> >> +void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned long align,
> >> + gfp_t flags, int nid)
> >> {
> >> struct vm_struct *vm = NULL;
> >> size_t alloced_size = 0;
> >> @@ -4135,6 +4139,11 @@ void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
> >> if (WARN(alloced_size < old_size,
> >> "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
> >> return NULL;
> >> + if (WARN(!IS_ALIGNED((unsigned long)p, align),
> >> + "will not reallocate with a bigger alignment (0x%lx)\n", align))
> >> + return NULL;
> >> + if (nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)))
> >> + goto need_realloc;
> >> 
> > By this goto change, you bypass the two important checks below. For
> > example if you shrink the allocated size, you do not need to perform
> > any allocations. Instead the patch goes and allocates a new area.
> > 
> > You just need to remove:
> > 
> > - if (nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)))
> > - goto need_realloc;
> > 
> > to make it working.
> > 
> 
> I am not sure I’m following. If we get a request to reallocate for a different node then we should either reject it or do the new allocation for this new node and copy the data to the new place. Shrinking the allocation on the old node doesn’t seem to be right. Or am I missing something?
> 
If your process migrates to a new NODE, which is fine, it does not mean
that you have to perform all this bouncing movement(reallocate on a new node).
Next time it can be migrated back. Process are allowed to migrate and access
to a remote memory.

Let's keep it simple.

--
Uladzislau Rezki
