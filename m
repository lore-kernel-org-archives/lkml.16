Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9913D1F55FA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 17:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747415047; cv=none; b=ScZipfMq/65T8+b29VKVh+gYd5pDI+CHfpLpXr+IieArkWga6Mgs7rXAY17vweE8tht84oqzyRofFf0/GSrKgNfpVfRlhQ1pttyA2hcluUAq1d4g4W+b+GfVmOC4iVUAkcG8+HcvB/5vZnYh+mZNZ4UtqVcGB3NTcmhSe09N0SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747415047; c=relaxed/simple;
	bh=Y7MCP1I+dwj+AxtoCqGecCRUgH9/xSUvxVcSFworKCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvxrEAz0WRjm8kPUr97aL8MIUR/Abqzdsr0J8ZgpnHFyF212IvTmm+f2Rp0aJT3D6TonDKJWOvvYzg1GoNnlLL8+12WlJOKZn0K2Y0EfImI1oP0QnpooReOKNKDE/6ACX0o2i1ZpmoHY81vj24VEoawxqoV28PHNNoBAptzuECU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNh1oYyY; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNh1oYyY"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-48b7747f881so10501cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 10:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747415044; x=1748019844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TopauMUbFM2f71jlF/cst0GNivIXI3eCkit7EEeyTIo=;
        b=GNh1oYyYjRxaLweqCSM8Oq0iDJJqietuu9yYeQNosCcyHZ4hFFu8Sqan/k55u6e4J8
         f4okQV78ve7X0rhqLen+RRjJZ6kQqeJ2AZfAlC340Iwi/exxaSke9B86edAHzaWDI0dY
         Ir2j6f4Z6Nrj1GpK71m67uzA5Hp8+2QaJ0znP8Os1AV7HUSXMeKDF9LCzdd2LrkZCcTG
         h7+SFlgS38az0PGBY+6pWcXeJ5cThsN6ExLXv44+4PoE18B/MuksasdganETTOxVTL59
         E5IoUY4BSxXNorPuZBK/YhJOaHT3CnpGzJgjaGF/KgOOsvNnF8VZ/OzS1eY70OsgPEFC
         2xXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747415044; x=1748019844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TopauMUbFM2f71jlF/cst0GNivIXI3eCkit7EEeyTIo=;
        b=u4iF0DaFXTVoraqAVxi7nURH2BzI6UpNALeAMU/DuzFHXd+s9Wk4P5lC5j6MhT+wBT
         llddx02yMTsqSLy+WOkS57AvLH5W2Lkj412eQ5rl8EytzzG56X6q8D81wQPNgRb0WKP/
         ykwu8m0bjOOblIhfxkVqO1ecFeO4Gl0NEWewM9oJ8fjjj5wlzhBkYeJuzceG1yFLsyG5
         Nw3nRM+ICm+jzuLzZ33tFenHEwbI+kYLD5BHBce5huy/P6QdIa7idXVTMmu9vko90Dom
         ea3WEabOCPu2VM6ssvq//YbCvr5egL+II2ePd/6y+5Z8rBVkbwBYOG7MUZLt1EFFwBF0
         BxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWbtabYFSn/UT/sC5Oj5m7jXudK0/xIOV9I4yjHbnzrYuTIID4NroTv+RftlzxGZwfiVcVPF7yI7iwiL8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLKIEFyOH4eKouTouEgZqzcTO0wEgLQE8Un7bGzBb/9pDWO0ZB
	8UwJrfb9XVe3GcAZNsoMeRWRqYmSUdusMHLpb0hhMR1EJr8U+FspVRdWVj4+1bCC4xpPznKgLuE
	gqcufsZjpL6j0ChHvFAVEqU4FEA/HwkVlA2V6JmW6
X-Gm-Gg: ASbGncsoIHBX0utPHiyAlaaC3UvQZV2ijCrpMal6izjtUuUgPamqO/Tgtj7pIzgdNUD
	71sIkcImG6ww0jvyJarEml07F/HFiiUVplCo2p4+t5bnfdR3SG5M9RunohItIo6VZSkuz6+EMnq
	q76Lf3eY6JChmYbqY9rh2oG+Rr3BYW19bmSwqcaFCkxA==
X-Google-Smtp-Source: AGHT+IEwIKYHbMMEr/jo+r+xatlgUtrQPzZIKO5wJ5iewcxyMtfUMY3FWDxahgxsZWK7voxV+V3tiB7RKsPs22soC8M=
X-Received: by 2002:a05:622a:1342:b0:480:1561:837f with SMTP id
 d75a77b69052e-494a1cf1ffcmr9250761cf.8.1747415043812; Fri, 16 May 2025
 10:04:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com>
In-Reply-To: <20250516131246.6244-1-00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 May 2025 10:03:52 -0700
X-Gm-Features: AX0GCFtboWUf_kCH1GeRXCie9Un61m9o9asqsFseB2pvHY34uN8n1QGtgFEu5bE
Message-ID: <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Fri, May 16, 2025 at 6:13=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
> Hi,
>
> I caught a page fault when I was changing my nvidia driver:
> (This happens randomly, I can reproduce it with about 1/3 probability)
>
> [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address: =
ffff9d28984c3000
> [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
> [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> ...
> [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> ...
> [Fri May 16 12:05:41 2025] Call Trace:
> [Fri May 16 12:05:41 2025]  <TASK>
> [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> ...
> (full kernel logs are pasted at the end.)
>
> Using a image with DEBUG_INFO, the calltrack parses as:
>
> RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134 lib/alloc_=
tag.c:352 lib/alloc_tag.c:573)
> [Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.c:355)
> [Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1305)
> [Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/module/main.c:7=
95)
>
> The offending lines in my codebase:
>         126 static inline struct alloc_tag_counters alloc_tag_read(struct=
 alloc_tag *tag)
>         127 {
>         ...
>         131
>         132         for_each_possible_cpu(cpu) {
>         133                 counter =3D per_cpu_ptr(tag->counters, cpu);
> >>>>    134                 v.bytes +=3D counter->bytes;   <-------------=
-here
>         135                 v.calls +=3D counter->calls;
>
>
> Nvidia drivers are out-tree... there could be some strange behavior in it=
 causes this.. but,
> when I check the code, I got concerned about lifecycle of tag->counters.
> Based on following defination:
>         108 #define DEFINE_ALLOC_TAG(_alloc_tag)                         =
                   \
>         109         static DEFINE_PER_CPU(struct alloc_tag_counters, _all=
oc_tag_cntr);      \
>         110         static struct alloc_tag _alloc_tag __used __aligned(8=
)                  \
>         111         __section(ALLOC_TAG_SECTION_NAME) =3D {              =
                     \
>         112                 .ct =3D CODE_TAG_INIT,                       =
                     \
>         113                 .counters =3D &_alloc_tag_cntr };
>         114
> _alloc_tag_cntr is the data referenced by tag->counters, but they are in =
different section,
> and alloc_tag only prepare storage for section ALLOC_TAG_SECTION_NAME.
> right?
> Then what happens to those ".data..percpu" section when module is unloade=
d?
> Is it safe to keep using those ".data..percpu" section after module unloa=
ded,
> or even during module is unloading?

Yes, I think you are right, free_module() calls percpu_modfree() which
would free the per-cpu memory allocated for the module. Before
0db6f8d7820a ("alloc_tag: load module tags into separate contiguous
memory") we would not unload the module if there were tags which were
still in use. After that change we load module tags into separate
memory, so I expected this to work but due to this external reference
it indeed should lead to UAF.
I think the simplest way to fix this would be to bypass
percpu_modfree() inside free_module() when there are module tags still
referenced, store mod->percpu inside alloc_tag_module_section and free
it inside clean_unused_module_areas_locked() once we know the counters
are not used anymore. I'll take a stab at it and will send a patch for
testing today.
Thanks,
Suren.

>
> I was expecting page fault when I make following experiments:
>
> 1.Load module A
> 2.Load module B
> 3.module B alloc memory, and handover the memory to A
> 4.unload module B
> (memory profiling report module B has memory not freed)
> ... after a while....
> 5.unload module A, where A free the memory. (when A kfree the memory,
> the counters used to be in module B's ".data..percpu" section should
> be referenced, it that section is gone, a pagefault should happen).
>
> But, after several trials, not page fault reported....
> Would kernel keeps ".data..percpu" since ALLOC_TAG_SECTION_NAME has refer=
ence to it,
> or I just need wait longer for kernel to "purge" those sections.
>
>
> Full logs:
> [Fri May 16 12:02:28 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Set=
ting Driver for UNIX platforms  550.144.03  Mon Dec 30 17:10:10 UTC 2024
> [Fri May 16 12:02:28 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loading=
 driver
> [Fri May 16 12:02:28 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:26=
:00.0 on minor 0
> [Fri May 16 12:03:45 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloadi=
ng driver
> [Fri May 16 12:03:46 2025] nvidia-modeset: Unloading
> [Fri May 16 12:03:46 2025] nvidia-nvlink: Unregistered Nvlink Core, major=
 device number 240
> [Fri May 16 12:04:38 2025] VFIO - User Level meta-driver version: 0.3
> [Fri May 16 12:04:38 2025] nvidia-nvlink: Nvlink Core is being initialize=
d, major device number 239
>
> [Fri May 16 12:04:38 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes chang=
ed: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
> [Fri May 16 12:04:38 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Module=
  570.144  Thu Apr 10 20:33:29 UTC 2025
> [Fri May 16 12:04:38 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Set=
ting Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
> [Fri May 16 12:04:38 2025] nvidia_drm: Unknown symbol drm_client_setup (e=
rr -2)
> [Fri May 16 12:04:40 2025] nvidia-modeset: Unloading
> [Fri May 16 12:04:40 2025] nvidia-nvlink: Unregistered Nvlink Core, major=
 device number 239
> [Fri May 16 12:05:40 2025] VFIO - User Level meta-driver version: 0.3
> [Fri May 16 12:05:40 2025] nvidia-nvlink: Nvlink Core is being initialize=
d, major device number 239
>
> [Fri May 16 12:05:40 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes chang=
ed: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
> [Fri May 16 12:05:40 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Module=
  570.144  Thu Apr 10 20:33:29 UTC 2025
> [Fri May 16 12:05:40 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Set=
ting Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
> [Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loading=
 driver
> [Fri May 16 12:05:40 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:26=
:00.0 on minor 0
> [Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloadi=
ng driver
> [Fri May 16 12:05:40 2025] nvidia-modeset: Unloading
> [Fri May 16 12:05:41 2025] nvidia-nvlink: Unregistered Nvlink Core, major=
 device number 239
> [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address: =
ffff9d28984c3000
> [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
> [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> [Fri May 16 12:05:41 2025] PGD 163001067 P4D 163001067 PUD 0
> [Fri May 16 12:05:41 2025] Oops: Oops: 0000 [#1] SMP NOPTI
> [Fri May 16 12:05:41 2025] CPU: 0 UID: 0 PID: 35898 Comm: modprobe Tainte=
d: G           OE       6.15.0-rc6-linan-0 #587 PREEMPT(voluntary)
> [Fri May 16 12:05:41 2025] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODU=
LE
> [Fri May 16 12:05:41 2025] Hardware name: Micro-Star International Co., L=
td. MS-7B89/B450M MORTAR MAX (MS-7B89), BIOS 2.L0 07/18/2024
> [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> [Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d 8=
6 02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5 4=
0 e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 ff=
 8b
> [Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
> [Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 RC=
X: 0000000000000008
> [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 RD=
I: ffffffff95d4fdc0
> [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 R0=
9: 000000000000fcf8
> [Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 R1=
2: ffffffffc04609b0
> [Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 R1=
5: 0000000000000000
> [Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c300=
0(0000) knlGS:0000000000000000
> [Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 CR=
4: 0000000000350ef0
> [Fri May 16 12:05:41 2025] Call Trace:
> [Fri May 16 12:05:41 2025]  <TASK>
> [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> [Fri May 16 12:05:41 2025]  __do_sys_delete_module+0x274/0x310
> [Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
> [Fri May 16 12:05:41 2025]  ? fpregs_assert_state_consistent+0x21/0x50
> [Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
> [Fri May 16 12:05:41 2025]  do_syscall_64+0x4b/0x120
> [Fri May 16 12:05:41 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [Fri May 16 12:05:41 2025] RIP: 0033:0x7fe9ed928a67
> [Fri May 16 12:05:41 2025] Code: 73 01 c3 48 8b 0d 99 83 0c 00 f7 d8 64 8=
9 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00 0=
0 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 69 83 0c 00 f7 d8 64 89 01=
 48
> [Fri May 16 12:05:41 2025] RSP: 002b:00007ffe17759568 EFLAGS: 00000206 OR=
IG_RAX: 00000000000000b0
> [Fri May 16 12:05:41 2025] RAX: ffffffffffffffda RBX: 0000564f850b7e70 RC=
X: 00007fe9ed928a67
> [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: 0000000000000800 RD=
I: 0000564f850b7ed8
> [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: 1999999999999999 R0=
9: 0000000000000000
> [Fri May 16 12:05:41 2025] R10: 00007fe9ed99bac0 R11: 0000000000000206 R1=
2: 0000000000000000
> [Fri May 16 12:05:41 2025] R13: 0000000000000000 R14: 00007ffe177595a0 R1=
5: 00007ffe1775aa60
> [Fri May 16 12:05:41 2025]  </TASK>
> [Fri May 16 12:05:41 2025] Modules linked in: vfio_pci_core(E-) vfio(E) d=
rm_client_lib(E) amd_atl(E) intel_rapl_msr(E) intel_rapl_common(E) binfmt_m=
isc(E) edac_mce_amd(E) kvm_amd(E) snd_hda_codec_realtek(E) nls_ascii(E) iwl=
mvm(E) nls_cp437(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(E) kvm(E) s=
nd_hda_scodec_component(E) mac80211(E) irqbypass(E) uvcvideo(E) vfat(E) snd=
_hda_intel(E) libarc4(E) ghash_clmulni_intel(E) fat(E) videobuf2_vmalloc(E)=
 snd_intel_dspcfg(E) sha256_ssse3(E) uvc(E) snd_usb_audio(E) sha1_ssse3(E) =
snd_hda_codec(E) videobuf2_memops(E) iwlwifi(E) drm_ttm_helper(E) videobuf2=
_v4l2(E) aesni_intel(E) snd_usbmidi_lib(E) snd_hda_core(E) ttm(E) snd_rawmi=
di(E) gf128mul(E) snd_pcsp(E) snd_seq_device(E) ppdev(E) snd_hwdep(E) crypt=
o_simd(E) drm_kms_helper(E) videodev(E) cryptd(E) cfg80211(E) snd_pcm(E) vi=
deobuf2_common(E) rapl(E) snd_timer(E) sp5100_tco(E) drm(E) mc(E) wmi_bmof(=
E) k10temp(E) tpm_crb(E) rfkill(E) snd(E) sha3_generic(E) video(E) soundcor=
e(E) jitterentropy_rng(E) sha512_ssse3(E) tpm_tis(E) ccp(E)
> [Fri May 16 12:05:41 2025]  sha512_generic(E) tpm_tis_core(E) joydev(E) d=
rbg(E) tpm(E) ansi_cprng(E) libaescfb(E) ecdh_generic(E) ecc(E) parport_pc(=
E) parport(E) sg(E) rng_core(E) evdev(E) msr(E) loop(E) fuse(E) efi_pstore(=
E) dm_mod(E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(=
E) mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) efivarfs(E) raid10(E) rai=
d456(E) async_raid6_recov(E) async_memcpy(E) async_pq(E) async_xor(E) async=
_tx(E) xor(E) raid6_pq(E) raid1(E) raid0(E) md_mod(E) hid_generic(E) usbhid=
(E) hid(E) sd_mod(E) ahci(E) xhci_pci(E) libahci(E) nvme(E) xhci_hcd(E) lib=
ata(E) i2c_piix4(E) i2c_smbus(E) r8169(E) nvme_core(E) realtek(E) usbcore(E=
) scsi_mod(E) scsi_common(E) usb_common(E) wmi(E) gpio_amdpt(E) gpio_generi=
c(E) button(E) [last unloaded: vfio_pci_core(E)]
> [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000
> [Fri May 16 12:05:41 2025] ---[ end trace 0000000000000000 ]---
> [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> [Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d 8=
6 02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5 4=
0 e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 ff=
 8b
> [Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
> [Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 RC=
X: 0000000000000008
> [Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 RD=
I: ffffffff95d4fdc0
> [Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 R0=
9: 000000000000fcf8
> [Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 R1=
2: ffffffffc04609b0
> [Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 R1=
5: 0000000000000000
> [Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c300=
0(0000) knlGS:0000000000000000
> [Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> [Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 CR=
4: 0000000000350ef0
> [Fri May 16 12:05:41 2025] note: modprobe[35898] exited with irqs disable=
d
> [Fri May 16 12:05:41 2025] note: modprobe[35898] exited with preempt_coun=
t 1
>
>
>
>
> Thanks
> David
>
