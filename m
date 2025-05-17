Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D913DBA0
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 00:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747440699; cv=none; b=JmOgKT3IT4KHcjXAozYjPbR/2omLuU0bjT0l2zx01qng0UFPcaAm8IqG26e9UBfuGRkfS/KXs03ScUTFPxfNdMqNxMIFTSEVJSZiofnAQDXYwwPTz6Gf5f1Cq7VuRBWJD/tYlSwteAur+9ZN16MCVSKd4nZqOpXlm1CWx2KQpx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747440699; c=relaxed/simple;
	bh=FX8b4oCuG4IVOFOQSKHFlo1eQzerdzk5CDDAXtD0XCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbF3ka5uk+qOrh3hkGpknWpAyNE6oYUeyk/27hEJs1Ip1ifTVdvaj7PejNENykJsvLh62jWPvO+vuF978C1L00R9g4V79DiFq/QUIRUtLRTunOKJpV3/vbUt6ahsionWkrzxKBT9CsgVGNLTDH6e2e6HZXa5prfkrWFBsLhEHiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2MfKYvGt; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2MfKYvGt"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-48b7747f881so69421cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747440696; x=1748045496; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aniVC6canQgxaWgJD3a9PLmTu0yFNxiW+5ag0PRUJ60=;
        b=2MfKYvGtx/RixC5M1jQekiF9LugKqj55KHDA1/3SyxNJB0exvm429Aw1G+7cZWh/3B
         lcYst/T2kgf0ujSTSnEs/yN7k8rKp690dmq18H2TWLuKMYBJfclazuxWNU/kegP2zdIT
         klBBnCnqgS75+UiaMtG2c7cPLcr/Y7zMmPQrxtNoYRJl37gy0bBmrOn/cCjrQZNx2lZM
         1of5116Jq0Df4m0bA5e/lsvxXUMZAUL7dXAQQx8qozsNDwaQhjM2iILhigFFc/FKppQ1
         ZqWHPUeNzayXlureQhpJwVLrtTE8YSmjuendJ5YvbUl4+aeGuDOqLrRmxwqCEx1+uixj
         EZKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747440696; x=1748045496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aniVC6canQgxaWgJD3a9PLmTu0yFNxiW+5ag0PRUJ60=;
        b=Os+vVBgSdEBQXHsEJzJ6mQSfimpQGccBchZQ5Vvk2zl2muB+dgusVMCRXUd7cuKlum
         9ZdgUVCEsPmZLLCd3atoneqNDQ2owRe3CBuw5x7nFKeHSTJH8WaBRv8kHpCdbjqtuYY6
         rxbQwgGysfqHY0DUDcT8ymfKzABsog/G+gRrw4v8S28IDS6OtzQR9C0J6BqARdJARRDH
         3XnI45EnnAud6tZZsf6qifBMMG+XKYqsaEAWJGaX/i7DxOJ3BLqc6OibZY6iDCCI2Ix5
         jV6AglCWP9tKe3JyGrHPziYEySZ6+jQB7LcfI7oDtcQKwYzw3RivNGnZUsWlkHbFH4R4
         Q8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVxVJ6azn6oZQMhNjgyYWml0Zr89mdsIocxg9Yz3wNh0w49zQCcviiTtvV0A7Ort3HPKsysdUHnB1G/b8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeeGVqWB1WXWl6FNeuaNb/zmii/J5dMwpGp+LkX0tE26x3DQLe
	dkN2QTbRY09pkvG8EtblvGYwyRIB1dnlIGadfWmUKeqsVStON2fCJLofJU3Z/3iC8R9UY8k0vMK
	8CFBDggQPZyuxDZXsnuC5Cgl6BQ6Q59SPD+5fjs1nzI6nKWtNss8kj54Nva0=
X-Gm-Gg: ASbGncvMcpzHFU46JbkJwdjOuDFqA60uwqQ7EJQ+OwDEA8x6J0FScyz4cwcMmV7fFrk
	055o7Prh7ycq8T15QgaVwzaBatWj3X1IeEPxs4z6RREGbbQQzRJYg3xmRo0tS1i7akeXezBf9hd
	P+jvpfSjaUOUJNNwFgVfZvEaadVVcO/LLq0dmCVoVQMJpG7RldOrx7gh/gFXUnLdE=
X-Google-Smtp-Source: AGHT+IGPOZWrPrjkmWdcVg5EEsfeP6vMtBk0wUAf5ctoLIauWcxBEwB4ZH/mITlVlE++i7KnfaaK+9qR3r7BaWBiBIY=
X-Received: by 2002:ac8:5a08:0:b0:47d:4e8a:97f0 with SMTP id
 d75a77b69052e-4960136a0a5mr653771cf.29.1747440695907; Fri, 16 May 2025
 17:11:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com> <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
In-Reply-To: <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 May 2025 17:11:24 -0700
X-Gm-Features: AX0GCFvFOovu7Z0DqoZ_MCwL_uCqy5cgF3AG7KDL9VDNjVFMzhVnWod8qvvueLI
Message-ID: <CAJuCfpEfSr7a911zNiigVVP6Z20gjks7Yyy27UDwL4s=0P4hKw@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 10:03=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> Hi David,
>
> On Fri, May 16, 2025 at 6:13=E2=80=AFAM David Wang <00107082@163.com> wro=
te:
> >
> > Hi,
> >
> > I caught a page fault when I was changing my nvidia driver:
> > (This happens randomly, I can reproduce it with about 1/3 probability)
> >
> > [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address=
: ffff9d28984c3000
> > [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
> > [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> > ...
> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> > ...
> > [Fri May 16 12:05:41 2025] Call Trace:
> > [Fri May 16 12:05:41 2025]  <TASK>
> > [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> > [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> > ...
> > (full kernel logs are pasted at the end.)
> >
> > Using a image with DEBUG_INFO, the calltrack parses as:
> >
> > RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134 lib/allo=
c_tag.c:352 lib/alloc_tag.c:573)
> > [Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.c:355)
> > [Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1305)
> > [Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/module/main.c=
:795)
> >
> > The offending lines in my codebase:
> >         126 static inline struct alloc_tag_counters alloc_tag_read(stru=
ct alloc_tag *tag)
> >         127 {
> >         ...
> >         131
> >         132         for_each_possible_cpu(cpu) {
> >         133                 counter =3D per_cpu_ptr(tag->counters, cpu)=
;
> > >>>>    134                 v.bytes +=3D counter->bytes;   <-----------=
---here
> >         135                 v.calls +=3D counter->calls;
> >
> >
> > Nvidia drivers are out-tree... there could be some strange behavior in =
it causes this.. but,
> > when I check the code, I got concerned about lifecycle of tag->counters=
.
> > Based on following defination:
> >         108 #define DEFINE_ALLOC_TAG(_alloc_tag)                       =
                     \
> >         109         static DEFINE_PER_CPU(struct alloc_tag_counters, _a=
lloc_tag_cntr);      \
> >         110         static struct alloc_tag _alloc_tag __used __aligned=
(8)                  \
> >         111         __section(ALLOC_TAG_SECTION_NAME) =3D {            =
                       \
> >         112                 .ct =3D CODE_TAG_INIT,                     =
                       \
> >         113                 .counters =3D &_alloc_tag_cntr };
> >         114
> > _alloc_tag_cntr is the data referenced by tag->counters, but they are i=
n different section,
> > and alloc_tag only prepare storage for section ALLOC_TAG_SECTION_NAME.
> > right?
> > Then what happens to those ".data..percpu" section when module is unloa=
ded?
> > Is it safe to keep using those ".data..percpu" section after module unl=
oaded,
> > or even during module is unloading?
>
> Yes, I think you are right, free_module() calls percpu_modfree() which
> would free the per-cpu memory allocated for the module. Before
> 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous
> memory") we would not unload the module if there were tags which were
> still in use. After that change we load module tags into separate
> memory, so I expected this to work but due to this external reference
> it indeed should lead to UAF.
> I think the simplest way to fix this would be to bypass
> percpu_modfree() inside free_module() when there are module tags still
> referenced, store mod->percpu inside alloc_tag_module_section and free
> it inside clean_unused_module_areas_locked() once we know the counters
> are not used anymore. I'll take a stab at it and will send a patch for
> testing today.

Ok, I went with another implementation, instead dynamically allocating
percpu memory for modules at the module load time. This has another
advantage of not needing extra PERCPU_MODULE_RESERVE currently
required for memory allocation tagging to work.
David, the patch is posted at [1]. Please give it a try and let me
know if the fix works for you.
Thanks,
Suren.

[1] https://lore.kernel.org/all/20250517000739.5930-1-surenb@google.com/


> Thanks,
> Suren.
>
> >
> > I was expecting page fault when I make following experiments:
> >
> > 1.Load module A
> > 2.Load module B
> > 3.module B alloc memory, and handover the memory to A
> > 4.unload module B
> > (memory profiling report module B has memory not freed)
> > ... after a while....
> > 5.unload module A, where A free the memory. (when A kfree the memory,
> > the counters used to be in module B's ".data..percpu" section should
> > be referenced, it that section is gone, a pagefault should happen).
> >
> > But, after several trials, not page fault reported....
> > Would kernel keeps ".data..percpu" since ALLOC_TAG_SECTION_NAME has ref=
erence to it,
> > or I just need wait longer for kernel to "purge" those sections.
> >
> >
> > Full logs:
> > [Fri May 16 12:02:28 2025] nvidia-modeset: Loading NVIDIA Kernel Mode S=
etting Driver for UNIX platforms  550.144.03  Mon Dec 30 17:10:10 UTC 2024
> > [Fri May 16 12:02:28 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loadi=
ng driver
> > [Fri May 16 12:02:28 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:=
26:00.0 on minor 0
> > [Fri May 16 12:03:45 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloa=
ding driver
> > [Fri May 16 12:03:46 2025] nvidia-modeset: Unloading
> > [Fri May 16 12:03:46 2025] nvidia-nvlink: Unregistered Nvlink Core, maj=
or device number 240
> > [Fri May 16 12:04:38 2025] VFIO - User Level meta-driver version: 0.3
> > [Fri May 16 12:04:38 2025] nvidia-nvlink: Nvlink Core is being initiali=
zed, major device number 239
> >
> > [Fri May 16 12:04:38 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes cha=
nged: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
> > [Fri May 16 12:04:38 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Modu=
le  570.144  Thu Apr 10 20:33:29 UTC 2025
> > [Fri May 16 12:04:38 2025] nvidia-modeset: Loading NVIDIA Kernel Mode S=
etting Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
> > [Fri May 16 12:04:38 2025] nvidia_drm: Unknown symbol drm_client_setup =
(err -2)
> > [Fri May 16 12:04:40 2025] nvidia-modeset: Unloading
> > [Fri May 16 12:04:40 2025] nvidia-nvlink: Unregistered Nvlink Core, maj=
or device number 239
> > [Fri May 16 12:05:40 2025] VFIO - User Level meta-driver version: 0.3
> > [Fri May 16 12:05:40 2025] nvidia-nvlink: Nvlink Core is being initiali=
zed, major device number 239
> >
> > [Fri May 16 12:05:40 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes cha=
nged: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
> > [Fri May 16 12:05:40 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Modu=
le  570.144  Thu Apr 10 20:33:29 UTC 2025
> > [Fri May 16 12:05:40 2025] nvidia-modeset: Loading NVIDIA Kernel Mode S=
etting Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
> > [Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loadi=
ng driver
> > [Fri May 16 12:05:40 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:=
26:00.0 on minor 0
> > [Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloa=
ding driver
> > [Fri May 16 12:05:40 2025] nvidia-modeset: Unloading
> > [Fri May 16 12:05:41 2025] nvidia-nvlink: Unregistered Nvlink Core, maj=
or device number 239
> > [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address=
: ffff9d28984c3000
> > [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
> > [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> > [Fri May 16 12:05:41 2025] PGD 163001067 P4D 163001067 PUD 0
> > [Fri May 16 12:05:41 2025] Oops: Oops: 0000 [#1] SMP NOPTI
> > [Fri May 16 12:05:41 2025] CPU: 0 UID: 0 PID: 35898 Comm: modprobe Tain=
ted: G           OE       6.15.0-rc6-linan-0 #587 PREEMPT(voluntary)
> > [Fri May 16 12:05:41 2025] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MO=
DULE
> > [Fri May 16 12:05:41 2025] Hardware name: Micro-Star International Co.,=
 Ltd. MS-7B89/B450M MORTAR MAX (MS-7B89), BIOS 2.L0 07/18/2024
> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> > [Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d=
 86 02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5=
 40 e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 =
ff 8b
> > [Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
> > [Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 =
RCX: 0000000000000008
> > [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 =
RDI: ffffffff95d4fdc0
> > [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 =
R09: 000000000000fcf8
> > [Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 =
R12: ffffffffc04609b0
> > [Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 =
R15: 0000000000000000
> > [Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c3=
000(0000) knlGS:0000000000000000
> > [Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 =
CR4: 0000000000350ef0
> > [Fri May 16 12:05:41 2025] Call Trace:
> > [Fri May 16 12:05:41 2025]  <TASK>
> > [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> > [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> > [Fri May 16 12:05:41 2025]  __do_sys_delete_module+0x274/0x310
> > [Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
> > [Fri May 16 12:05:41 2025]  ? fpregs_assert_state_consistent+0x21/0x50
> > [Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
> > [Fri May 16 12:05:41 2025]  do_syscall_64+0x4b/0x120
> > [Fri May 16 12:05:41 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [Fri May 16 12:05:41 2025] RIP: 0033:0x7fe9ed928a67
> > [Fri May 16 12:05:41 2025] Code: 73 01 c3 48 8b 0d 99 83 0c 00 f7 d8 64=
 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00=
 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 69 83 0c 00 f7 d8 64 89 =
01 48
> > [Fri May 16 12:05:41 2025] RSP: 002b:00007ffe17759568 EFLAGS: 00000206 =
ORIG_RAX: 00000000000000b0
> > [Fri May 16 12:05:41 2025] RAX: ffffffffffffffda RBX: 0000564f850b7e70 =
RCX: 00007fe9ed928a67
> > [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: 0000000000000800 =
RDI: 0000564f850b7ed8
> > [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: 1999999999999999 =
R09: 0000000000000000
> > [Fri May 16 12:05:41 2025] R10: 00007fe9ed99bac0 R11: 0000000000000206 =
R12: 0000000000000000
> > [Fri May 16 12:05:41 2025] R13: 0000000000000000 R14: 00007ffe177595a0 =
R15: 00007ffe1775aa60
> > [Fri May 16 12:05:41 2025]  </TASK>
> > [Fri May 16 12:05:41 2025] Modules linked in: vfio_pci_core(E-) vfio(E)=
 drm_client_lib(E) amd_atl(E) intel_rapl_msr(E) intel_rapl_common(E) binfmt=
_misc(E) edac_mce_amd(E) kvm_amd(E) snd_hda_codec_realtek(E) nls_ascii(E) i=
wlmvm(E) nls_cp437(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(E) kvm(E)=
 snd_hda_scodec_component(E) mac80211(E) irqbypass(E) uvcvideo(E) vfat(E) s=
nd_hda_intel(E) libarc4(E) ghash_clmulni_intel(E) fat(E) videobuf2_vmalloc(=
E) snd_intel_dspcfg(E) sha256_ssse3(E) uvc(E) snd_usb_audio(E) sha1_ssse3(E=
) snd_hda_codec(E) videobuf2_memops(E) iwlwifi(E) drm_ttm_helper(E) videobu=
f2_v4l2(E) aesni_intel(E) snd_usbmidi_lib(E) snd_hda_core(E) ttm(E) snd_raw=
midi(E) gf128mul(E) snd_pcsp(E) snd_seq_device(E) ppdev(E) snd_hwdep(E) cry=
pto_simd(E) drm_kms_helper(E) videodev(E) cryptd(E) cfg80211(E) snd_pcm(E) =
videobuf2_common(E) rapl(E) snd_timer(E) sp5100_tco(E) drm(E) mc(E) wmi_bmo=
f(E) k10temp(E) tpm_crb(E) rfkill(E) snd(E) sha3_generic(E) video(E) soundc=
ore(E) jitterentropy_rng(E) sha512_ssse3(E) tpm_tis(E) ccp(E)
> > [Fri May 16 12:05:41 2025]  sha512_generic(E) tpm_tis_core(E) joydev(E)=
 drbg(E) tpm(E) ansi_cprng(E) libaescfb(E) ecdh_generic(E) ecc(E) parport_p=
c(E) parport(E) sg(E) rng_core(E) evdev(E) msr(E) loop(E) fuse(E) efi_pstor=
e(E) dm_mod(E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc1=
6(E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) efivarfs(E) raid10(E) r=
aid456(E) async_raid6_recov(E) async_memcpy(E) async_pq(E) async_xor(E) asy=
nc_tx(E) xor(E) raid6_pq(E) raid1(E) raid0(E) md_mod(E) hid_generic(E) usbh=
id(E) hid(E) sd_mod(E) ahci(E) xhci_pci(E) libahci(E) nvme(E) xhci_hcd(E) l=
ibata(E) i2c_piix4(E) i2c_smbus(E) r8169(E) nvme_core(E) realtek(E) usbcore=
(E) scsi_mod(E) scsi_common(E) usb_common(E) wmi(E) gpio_amdpt(E) gpio_gene=
ric(E) button(E) [last unloaded: vfio_pci_core(E)]
> > [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000
> > [Fri May 16 12:05:41 2025] ---[ end trace 0000000000000000 ]---
> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> > [Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d=
 86 02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5=
 40 e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 =
ff 8b
> > [Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
> > [Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 =
RCX: 0000000000000008
> > [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 =
RDI: ffffffff95d4fdc0
> > [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 =
R09: 000000000000fcf8
> > [Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 =
R12: ffffffffc04609b0
> > [Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 =
R15: 0000000000000000
> > [Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c3=
000(0000) knlGS:0000000000000000
> > [Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
> > [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 =
CR4: 0000000000350ef0
> > [Fri May 16 12:05:41 2025] note: modprobe[35898] exited with irqs disab=
led
> > [Fri May 16 12:05:41 2025] note: modprobe[35898] exited with preempt_co=
unt 1
> >
> >
> >
> >
> > Thanks
> > David
> >
