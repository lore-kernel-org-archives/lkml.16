Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC0328B7F8;
	Mon, 30 Jun 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751301606; cv=none; b=FFhZq8wRVZVpbWiC9yVxxGqQgkqVzNXjxBkDJC8W+USwj+kCGfAMCCLDqvoLv8i4gI4QRu3QVSsPddSyGjf8NGUohVV8WI4LzWGlNwroIJignc4OCjcpU/Clwc5/KuGRZkXrmC8hKwcyYiRcAL7JejBI4MYibF74IyNxcv3hCB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751301606; c=relaxed/simple;
	bh=yJMy8Apkm0/ab9XGmbHBkU8XSnaqjCpcBvGdBTlbS6E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDEs23r1POJGMpHleLKRv3w/jS36giQc1LiBWt3V0gaFDCM3QBaU4eSyzlL0oweh78F+mwRDbENpLExfDTdbl/OlU/6A5CnQjSwDTVfC2F/qspDf/vrXXmrDqCDfGNznXHwY5iV9a3feh47rcx7B+WRzwygdW1KjbvfCYaKcbR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSSjHaYC; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSSjHaYC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b51f5218so4852186e87.0;
        Mon, 30 Jun 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751301602; x=1751906402; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mvxFM51uVXBLV1vC4dKJrFsVI8rMXQnN9LU3Zlb1RIM=;
        b=DSSjHaYCyTWYsTE7WwGqdsLph0s32+XqgYL8+MnUkASORTA637o7p0GOOmEHo/oynm
         ntxun6Zzz5mV0/RQCsf78sHyjtqOmxdQITkEyXPzfznZ7838LAr8YcSVu4LaQj1cnBgp
         Z+2PPQ0ovDGnfxbTM+s5TWGR6xvDx9fM9nEZpH2VFRKifRowd+LqwXWcBnlykcysmZPR
         A1LeDd8IOH3ajICL9wV4OvUtnpFm2d85yZ6vcZcyetKX+XlS5akKBv5ufyggw4sXdWDe
         cUgtAitnbmkrbaTco6zlgf2zgcqqaIusZaaa51RVnyS2VvCIAdZmal73cQ6F7HIxNx7y
         +IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751301602; x=1751906402;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mvxFM51uVXBLV1vC4dKJrFsVI8rMXQnN9LU3Zlb1RIM=;
        b=VAde1eN1bjg7cPrG8RiDUKaO9WjjXldYNFdxO4WtRl9nb87/3ehTd1Xw/z78jKU0lX
         13peCKG/bl629H/8KkYBqyK66CPxNu5OCVAdRM9YnB5c0OUQx1Gjdy+wlpEpbehvi2Ob
         ktgebdqFD4THxGPT9acBuz10Vte49xhQ9G+3eCIV5Y+e3MHo4+4ilmzWwunl3PSPVaFp
         wwod+WI5/ejUIAvYyplUwov3PU6gxVh2yCOVFS9zDjgrAGSDfIjmi+DjDbe6pDdXT+CT
         Qrs/uU58Evb9NH2FcCX4t9ya7gYTqX6IS16GiwOVCC5nn6Tms+qMjvC8++eM14J+IYGS
         Hgww==
X-Forwarded-Encrypted: i=1; AJvYcCUqVKau5ACZmTZre2fXpNiYM/BWkFo5Gw/2U8hTtnP21shwfChk0ITDGJeZIINLZz7eIW1LGbODGO3kL7Q=@vger.kernel.org, AJvYcCVBT/NhkSzroV/iuYCQUTsOk2MB3IWtH6Wa5aVn1J22P0U4IdibvbObcIhm3KVl5+Ba0WBfrVVe9HA9JWaV+wE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7M0TrssvJeFWABoGAXCYfX11AyRcHQ/FdnnafS1DAvG81za/+
	1DlMt/p+tYC5s+JwirKbt0hrpCs4pG9sBRLczZT108n2Bs5HDcm35Mi2
X-Gm-Gg: ASbGncvtEWWW+xOSrjzLsNyOKqfB0GPW+DEjb/hZyzWqNDkpT6SUxoHRymQJJ2iGNwh
	SaE4th0JDcIwUhAvn2PB38SNr0O/eQKEcGpaTjtU8IsfyFtZreIgRxFfBfFDjXGWvyjDC90u0Kj
	kuXfWwOmcc0gp8vZYRNmnZXht58whN7yx4BQGfjBvDUBBGk4sVfeYnlYxg/fYudyofg1e3SpTln
	VOABVgMc64D39QKgjx/NiMGsXqbV99QrYFzJrKui1nU9xzoF2wzzCj46Tvz6EqhECv6QQsGB3kV
	KWvniZMnqMOg2DwLPzo0zt2slVtFP1jUe3a/kmslFGuHiTIrrSf5vqt71oiloDYwwMSelzXH8vS
	ioa+1MlNA3G0=
X-Google-Smtp-Source: AGHT+IFLlHdz+izlLLQDh456GiXwtgcpoFyOKhudz16ZRyhokDMTXoBjMRRc74Und57f5eSHwbDAbg==
X-Received: by 2002:ac2:4e05:0:b0:553:33b3:b944 with SMTP id 2adb3069b0e04-5550ba44a0dmr4170546e87.54.1751301601911;
        Mon, 30 Jun 2025 09:40:01 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ec0a7sm1480042e87.237.2025.06.30.09.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:40:01 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 30 Jun 2025 18:39:59 +0200
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: Uladzislau Rezki <urezki@gmail.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 1/4] mm/vmalloc: allow to set node and align in
 vrealloc
Message-ID: <aGK937QUSmKkXleq@pc636>
References: <20250628102315.2542656-1-vitaly.wool@konsulko.se>
 <20250628102537.2542789-1-vitaly.wool@konsulko.se>
 <aGJnXLl_OLqwjAUt@pc636>
 <9E9F1FCB-E4BF-463B-B2C3-833572B3918A@konsulko.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9E9F1FCB-E4BF-463B-B2C3-833572B3918A@konsulko.se>

> 
>     On Jun 30, 2025, at 12:30 PM, Uladzislau Rezki <urezki@gmail.com> wrote:
> 
>     On Sat, Jun 28, 2025 at 12:25:37PM +0200, Vitaly Wool wrote:
> 
>         Reimplement vrealloc() to be able to set node and alignment should
>         a user need to do so. Rename the function to vrealloc_node_align()
>         to better match what it actually does now and introduce macros for
>         vrealloc() and friends for backward compatibility.
> 
>         With that change we also provide the ability for the Rust part of
>         the kernel to set node and aligmnent in its allocations.
> 
>         Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.se>
>         ---
>         include/linux/vmalloc.h | 12 +++++++++---
>         mm/vmalloc.c            | 20 ++++++++++++++++----
>         2 files changed, 25 insertions(+), 7 deletions(-)
> 
>         diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
>         index fdc9aeb74a44..68791f7cb3ba 100644
>         --- a/include/linux/vmalloc.h
>         +++ b/include/linux/vmalloc.h
>         @@ -197,9 +197,15 @@ extern void *__vcalloc_noprof(size_t n, size_t
>         size, gfp_t flags) __alloc_size(1
>         extern void *vcalloc_noprof(size_t n, size_t size) __alloc_size(1, 2);
>         #define vcalloc(...) alloc_hooks(vcalloc_noprof(__VA_ARGS__))
> 
>         -void * __must_check vrealloc_noprof(const void *p, size_t size, gfp_t
>         flags)
>         - __realloc_size(2);
>         -#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
>         +void *__must_check vrealloc_node_align_noprof(const void *p, size_t
>         size,
>         + unsigned long align, gfp_t flags, int nid) __realloc_size(2);
>         +#define vrealloc_node_noprof(_p, _s, _f, _nid) \
>         + vrealloc_node_align_noprof(_p, _s, 1, _f, _nid)
>         +#define vrealloc_noprof(_p, _s, _f) \
>         + vrealloc_node_align_noprof(_p, _s, 1, _f, NUMA_NO_NODE)
>         +#define vrealloc_node_align(...) alloc_hooks
>         (vrealloc_node_align_noprof(__VA_ARGS__))
>         +#define vrealloc_node(...) alloc_hooks(vrealloc_node_noprof
>         (__VA_ARGS__))
>         +#define vrealloc(...) alloc_hooks(vrealloc_noprof(__VA_ARGS__))
> 
>         extern void vfree(const void *addr);
>         extern void vfree_atomic(const void *addr);
>         diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>         index 6dbcdceecae1..d633ac0ff977 100644
>         --- a/mm/vmalloc.c
>         +++ b/mm/vmalloc.c
>         @@ -4089,12 +4089,15 @@ void *vzalloc_node_noprof(unsigned long size,
>         int node)
>         EXPORT_SYMBOL(vzalloc_node_noprof);
> 
>         /**
>         - * vrealloc - reallocate virtually contiguous memory; contents remain
>         unchanged
>         + * vrealloc_node_align_noprof - reallocate virtually contiguous
>         memory; contents
>         + * remain unchanged
>          * @p: object to reallocate memory for
>          * @size: the size to reallocate
>         + * @align: requested alignment
>          * @flags: the flags for the page level allocator
>         + * @nid: node id
>          *
>         - * If @p is %NULL, vrealloc() behaves exactly like vmalloc(). If @size
>         is 0 and
>         + * If @p is %NULL, vrealloc_XXX() behaves exactly like vmalloc(). If
>         @size is 0 and
>          * @p is not a %NULL pointer, the object pointed to is freed.
>          *
>          * If __GFP_ZERO logic is requested, callers must ensure that, starting
>         with the
>         @@ -4111,7 +4114,8 @@ EXPORT_SYMBOL(vzalloc_node_noprof);
>          * Return: pointer to the allocated memory; %NULL if @size is zero or
>         in case of
>          *         failure
>          */
>         -void *vrealloc_noprof(const void *p, size_t size, gfp_t flags)
>         +void *vrealloc_node_align_noprof(const void *p, size_t size, unsigned
>         long align,
>         +  gfp_t flags, int nid)
>         {
>         struct vm_struct *vm = NULL;
>         size_t alloced_size = 0;
>         @@ -4135,6 +4139,13 @@ void *vrealloc_noprof(const void *p, size_t
>         size, gfp_t flags)
>         if (WARN(alloced_size < old_size,
>          "vrealloc() has mismatched area vs requested sizes (%p)\n", p))
>         return NULL;
>         + if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page
>         (p)),
>         +  "vrealloc() has mismatched nids\n"))
>         + return NULL;
>         + if (WARN((uintptr_t)p & (align - 1),
>         +  "will not reallocate with a bigger alignment (0x%lx)\n",
>         +  align))
>         + return NULL;
> 
> 
>     IMO, IS_ALIGNED() should be used instead. We have already a macro for this
>     purpose, i.e. the idea is just to check that "p" is aligned with "align"
>     request.
> 
>     Can you replace the (uintptr_t) casting to (ulong) or (unsigned long)
>     this is how we mostly cast in vmalloc code?
> 
> 
> Thanks, noted.
> 
> 
>     WARN() probably is worth to replace. Use WARN_ON_ONCE() to prevent
>     flooding.
> 
> 
> I am not sure i totally agree, because:
> a) there’s already one WARN() in that block and I’m just following the pattern
> b) I don’t think this will be a frequent error.
> 
Could we just drop such assumption(b)? Instead we just eliminate it and
thus we do not spam the kernel buffer :)

Also, there is another:

>
> + if (WARN(nid != NUMA_NO_NODE && nid != page_to_nid(vmalloc_to_page(p)),
> + "vrealloc() has mismatched nids\n"))
> + return NULL;
>
I can easily trigger this with continuous kernel splats after adding
vrealloc_alloc_test into the vmalloc test-suite:

<snip>
[   53.517781] ------------[ cut here ]------------
[   53.517787] vrealloc() has mismatched nids
[   53.517817] WARNING: CPU: 46 PID: 2213 at mm/vmalloc.c:4198 vrealloc_node_align_noprof+0x11b/0x230
[   53.517829] Modules linked in: test_vmalloc(E+) binfmt_misc(E) ppdev(E) parport_pc(E) parport(E) bochs(E) snd_pcm(E) sg(E) drm_client_lib(E) snd_timer(E) drm_shmem_helper(E) evdev(E) joydev(E) snd(E) drm_kms_helper(E) vga16fb(E) soundcore(E) serio_raw(E) button(E) pcspkr(E) vgastate(E) drm(E) dm_mod(E) fuse(E) loop(E) configfs(E) efi_pstore(E) qemu_fw_cfg(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E) mbcache(E) jbd2(E) sr_mod(E) cdrom(E) sd_mod(E) ata_generic(E) ata_piix(E) libata(E) i2c_piix4(E) scsi_mod(E) psmouse(E) floppy(E) e1000(E) i2c_smbus(E) scsi_common(E)
[   53.517879] CPU: 46 UID: 0 PID: 2213 Comm: vmalloc_test/10 Kdump: loaded Tainted: G        W   E       6.16.0-rc1+ #263 PREEMPT(undef)
[   53.517886] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
[   53.517887] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[   53.517889] RIP: 0010:vrealloc_node_align_noprof+0x11b/0x230
[   53.517894] Code: 89 4c 24 08 e8 76 b0 ff ff 4c 8b 4c 24 08 48 8b 00 48 c1 e8 36 41 39 c4 0f 84 64 ff ff ff 48 c7 c7 90 c4 28 a2 e8 25 a8 d3 ff <0f> 0b 31 ed eb 95 65 8b 05 f8 cf 90 01 a9 00 ff ff 00 0f 85 dd 00
[   53.517897] RSP: 0018:ffffa6db87f27e08 EFLAGS: 00010282
[   53.517900] RAX: 0000000000000000 RBX: ffffa6db9a315000 RCX: 0000000000000000
[   53.517902] RDX: 0000000000000002 RSI: 0000000000000001 RDI: 00000000ffffffff
[   53.517904] RBP: 000000000000a000 R08: 0000000000000000 R09: 0000000000000003
[   53.517905] R10: ffffa6db87f27ca0 R11: ffff98c5fff0a368 R12: 0000000000000002
[   53.517908] R13: ffff98c201d06a80 R14: 0000000000009000 R15: 0000000000000001
[   53.517912] FS:  0000000000000000(0000) GS:ffff98c24cf17000(0000) knlGS:0000000000000000
[   53.517914] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   53.517916] CR2: 00007fe515c11390 CR3: 000000084bf03000 CR4: 00000000000006f0
[   53.517920] Call Trace:
[   53.517923]  <TASK>
[   53.517928]  ? __pfx_vrealloc_alloc_test+0x10/0x10 [test_vmalloc]
[   53.517937]  vrealloc_alloc_test+0x22/0x60 [test_vmalloc]
[   53.517941]  test_func+0xd5/0x1d0 [test_vmalloc]
[   53.517946]  ? __pfx_test_func+0x10/0x10 [test_vmalloc]
[   53.517949]  kthread+0x109/0x240
[   53.517955]  ? finish_task_switch.isra.0+0x85/0x2a0
[   53.517960]  ? __pfx_kthread+0x10/0x10
[   53.517963]  ? __pfx_kthread+0x10/0x10
[   53.517966]  ret_from_fork+0x87/0xf0
[   53.517971]  ? __pfx_kthread+0x10/0x10
[   53.517974]  ret_from_fork_asm+0x1a/0x30
[   53.517980]  </TASK>
[   53.517981] ---[ end trace 0000000000000000 ]---
<snip>

Please drop that WARN(). The motivation is, we should serve the memory.
Because, processes can migrate between NUMA nodes and they still have to
be able to allocate memory.

Moreover, in the current vrealloc() implementation, memory is fully reallocated
on a new NUMA node in any case and the old allocation is released after copying
the data. So it does not matter if the NUMA node has changed.

--
Uladzislau Rezki
