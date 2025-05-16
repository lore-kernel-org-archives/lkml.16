Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765883232
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401217; cv=none; b=Z9ORnl4igAxfFLACR/tbKTJ57ihcGqAKFZJZkO2OwVi6fe3fEnGWr1BAYRbjU+cZttGr4Yl5jp9EDjvCbD8dTvd+Iju92U6EJncl854oFqihaSy/nb3HYTauEFj3VCV1u0eGcGv/4SjNTWGcab6b5+wkSUJqeu987fAXTUo4FOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401217; c=relaxed/simple;
	bh=IsAANWVCLZd+B/824y5ZEsdIagzG8xZ0ELPRfSy6Y/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GACGMjmljkcXQ7D14NHDX2Zy1YgWMFqeOIMLK65EV7Hd0u+ag7nVpFfqovnLPR5iWhaFaYpSpNu0tCdoVaQjhFwhS/ZNuX3dgJMh54ZceM/hmLrkPdSlnhDlnQ96176ij6vplLWzG3MHhlDAG1IdI9Hr+JdAWTDViUTM8L9CD9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=SNSNO+ih; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="SNSNO+ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Oo
	CdmYL9Qu8u5gGOwJxG6K2/QoL5v6Jy0+zblOekNy4=; b=SNSNO+ihhAX4Yh6pvq
	AsEOgG8XKgJO2VaNrvwVdwCni1Xf/DmD9WUeVFQ4+deGaHeghzSbnFILy3Ef5M6V
	IFuVMSEL05KNjsAoF0b6cBD5MQgsQd1oVwfUc73xy1QcXjKlS5kIc47Sncr8DO3V
	BFWFZ5eCU5DuHo/6hh8ml6rgg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDHAl_POSdoJXONBw--.60693S4;
	Fri, 16 May 2025 21:13:04 +0800 (CST)
From: David Wang <00107082@163.com>
To: surenb@google.com,
	kent.overstreet@linux.dev
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: BUG: unable to handle page fault for address
Date: Fri, 16 May 2025 21:12:46 +0800
Message-Id: <20250516131246.6244-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wDHAl_POSdoJXONBw--.60693S4
X-Coremail-Antispam: 1Uf129KBjvJXoWfGw48uw45ZF48Cw1DGF45Wrg_yoWkKrWxpr
	yFgFW7KF48Jr1kXFs7J3W3tw4UAwnrCa15WryxKr1F93WUu3yDJF9rAr1UJFZ8Jr47ta12
	vFn2q3WjyF1rXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UEjgsUUUUU=
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbBkAlPqmgnM2XZCQAAs1

Hi,

I caught a page fault when I was changing my nvidia driver:
(This happens randomly, I can reproduce it with about 1/3 probability)

[Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address: ff=
ff9d28984c3000
[Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
[Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
...
[Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
...
[Fri May 16 12:05:41 2025] Call Trace:
[Fri May 16 12:05:41 2025]  <TASK>
[Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
[Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
...
(full kernel logs are pasted at the end.)

Using a image with DEBUG_INFO, the calltrack parses as:

RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134 lib/alloc_ta=
g.c:352 lib/alloc_tag.c:573)=20
[Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.c:355)=20
[Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1305)=20
[Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/module/main.c:795)

The offending lines in my codebase:
	126 static inline struct alloc_tag_counters alloc_tag_read(struct alloc_ta=
g *tag)
	127 {
	...
	131=20
	132         for_each_possible_cpu(cpu) {
	133                 counter =3D per_cpu_ptr(tag->counters, cpu);
>>>>	134                 v.bytes +=3D counter->bytes;   <--------------here
	135                 v.calls +=3D counter->calls;


Nvidia drivers are out-tree... there could be some strange behavior in it c=
auses this.. but,
when I check the code, I got concerned about lifecycle of tag->counters.
Based on following defination:
	108 #define DEFINE_ALLOC_TAG(_alloc_tag)                                  =
          \
	109         static DEFINE_PER_CPU(struct alloc_tag_counters, _alloc_tag_cn=
tr);      \
	110         static struct alloc_tag _alloc_tag __used __aligned(8)        =
          \
	111         __section(ALLOC_TAG_SECTION_NAME) =3D {                       =
            \
	112                 .ct =3D CODE_TAG_INIT,                                =
            \
	113                 .counters =3D &_alloc_tag_cntr };
	114=20
_alloc_tag_cntr is the data referenced by tag->counters, but they are in di=
fferent section,
and alloc_tag only prepare storage for section ALLOC_TAG_SECTION_NAME.
right?
Then what happens to those ".data..percpu" section when module is unloaded?
Is it safe to keep using those ".data..percpu" section after module unloade=
d,
or even during module is unloading?

I was expecting page fault when I make following experiments:

1.Load module A
2.Load module B
3.module B alloc memory, and handover the memory to A
4.unload module B
(memory profiling report module B has memory not freed)
... after a while....
5.unload module A, where A free the memory. (when A kfree the memory,
the counters used to be in module B's ".data..percpu" section should
be referenced, it that section is gone, a pagefault should happen).

But, after several trials, not page fault reported....
Would kernel keeps ".data..percpu" since ALLOC_TAG_SECTION_NAME has referen=
ce to it,
or I just need wait longer for kernel to "purge" those sections.


Full logs:
[Fri May 16 12:02:28 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Setti=
ng Driver for UNIX platforms  550.144.03  Mon Dec 30 17:10:10 UTC 2024
[Fri May 16 12:02:28 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loading d=
river
[Fri May 16 12:02:28 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:26:0=
0.0 on minor 0
[Fri May 16 12:03:45 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloading=
 driver
[Fri May 16 12:03:46 2025] nvidia-modeset: Unloading
[Fri May 16 12:03:46 2025] nvidia-nvlink: Unregistered Nvlink Core, major d=
evice number 240
[Fri May 16 12:04:38 2025] VFIO - User Level meta-driver version: 0.3
[Fri May 16 12:04:38 2025] nvidia-nvlink: Nvlink Core is being initialized,=
 major device number 239

[Fri May 16 12:04:38 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes changed=
: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
[Fri May 16 12:04:38 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  =
570.144  Thu Apr 10 20:33:29 UTC 2025
[Fri May 16 12:04:38 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Setti=
ng Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
[Fri May 16 12:04:38 2025] nvidia_drm: Unknown symbol drm_client_setup (err=
 -2)
[Fri May 16 12:04:40 2025] nvidia-modeset: Unloading
[Fri May 16 12:04:40 2025] nvidia-nvlink: Unregistered Nvlink Core, major d=
evice number 239
[Fri May 16 12:05:40 2025] VFIO - User Level meta-driver version: 0.3
[Fri May 16 12:05:40 2025] nvidia-nvlink: Nvlink Core is being initialized,=
 major device number 239

[Fri May 16 12:05:40 2025] nvidia 0000:26:00.0: vgaarb: VGA decodes changed=
: olddecodes=3Dnone,decodes=3Dnone:owns=3Dnone
[Fri May 16 12:05:40 2025] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  =
570.144  Thu Apr 10 20:33:29 UTC 2025
[Fri May 16 12:05:40 2025] nvidia-modeset: Loading NVIDIA Kernel Mode Setti=
ng Driver for UNIX platforms  570.144  Thu Apr 10 20:03:03 UTC 2025
[Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Loading d=
river
[Fri May 16 12:05:40 2025] [drm] Initialized nvidia-drm 0.0.0 for 0000:26:0=
0.0 on minor 0
[Fri May 16 12:05:40 2025] [drm] [nvidia-drm] [GPU ID 0x00002600] Unloading=
 driver
[Fri May 16 12:05:40 2025] nvidia-modeset: Unloading
[Fri May 16 12:05:41 2025] nvidia-nvlink: Unregistered Nvlink Core, major d=
evice number 239
[Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address: ff=
ff9d28984c3000
[Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
[Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
[Fri May 16 12:05:41 2025] PGD 163001067 P4D 163001067 PUD 0=20
[Fri May 16 12:05:41 2025] Oops: Oops: 0000 [#1] SMP NOPTI
[Fri May 16 12:05:41 2025] CPU: 0 UID: 0 PID: 35898 Comm: modprobe Tainted:=
 G           OE       6.15.0-rc6-linan-0 #587 PREEMPT(voluntary)=20
[Fri May 16 12:05:41 2025] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[Fri May 16 12:05:41 2025] Hardware name: Micro-Star International Co., Ltd=
. MS-7B89/B450M MORTAR MAX (MS-7B89), BIOS 2.L0 07/18/2024
[Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
[Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d 86 =
02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5 40 =
e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 ff 8b
[Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
[Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 RCX:=
 0000000000000008
[Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 RDI:=
 ffffffff95d4fdc0
[Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 R09:=
 000000000000fcf8
[Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 R12:=
 ffffffffc04609b0
[Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 R15:=
 0000000000000000
[Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c3000(=
0000) knlGS:0000000000000000
[Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 CR4:=
 0000000000350ef0
[Fri May 16 12:05:41 2025] Call Trace:
[Fri May 16 12:05:41 2025]  <TASK>
[Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
[Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
[Fri May 16 12:05:41 2025]  __do_sys_delete_module+0x274/0x310
[Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
[Fri May 16 12:05:41 2025]  ? fpregs_assert_state_consistent+0x21/0x50
[Fri May 16 12:05:41 2025]  ? srso_return_thunk+0x5/0x5f
[Fri May 16 12:05:41 2025]  do_syscall_64+0x4b/0x120
[Fri May 16 12:05:41 2025]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[Fri May 16 12:05:41 2025] RIP: 0033:0x7fe9ed928a67
[Fri May 16 12:05:41 2025] Code: 73 01 c3 48 8b 0d 99 83 0c 00 f7 d8 64 89 =
01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 b0 00 00 =
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 69 83 0c 00 f7 d8 64 89 01 48
[Fri May 16 12:05:41 2025] RSP: 002b:00007ffe17759568 EFLAGS: 00000206 ORIG=
_RAX: 00000000000000b0
[Fri May 16 12:05:41 2025] RAX: ffffffffffffffda RBX: 0000564f850b7e70 RCX:=
 00007fe9ed928a67
[Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: 0000000000000800 RDI:=
 0000564f850b7ed8
[Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: 1999999999999999 R09:=
 0000000000000000
[Fri May 16 12:05:41 2025] R10: 00007fe9ed99bac0 R11: 0000000000000206 R12:=
 0000000000000000
[Fri May 16 12:05:41 2025] R13: 0000000000000000 R14: 00007ffe177595a0 R15:=
 00007ffe1775aa60
[Fri May 16 12:05:41 2025]  </TASK>
[Fri May 16 12:05:41 2025] Modules linked in: vfio_pci_core(E-) vfio(E) drm=
_client_lib(E) amd_atl(E) intel_rapl_msr(E) intel_rapl_common(E) binfmt_mis=
c(E) edac_mce_amd(E) kvm_amd(E) snd_hda_codec_realtek(E) nls_ascii(E) iwlmv=
m(E) nls_cp437(E) snd_hda_codec_generic(E) snd_hda_codec_hdmi(E) kvm(E) snd=
_hda_scodec_component(E) mac80211(E) irqbypass(E) uvcvideo(E) vfat(E) snd_h=
da_intel(E) libarc4(E) ghash_clmulni_intel(E) fat(E) videobuf2_vmalloc(E) s=
nd_intel_dspcfg(E) sha256_ssse3(E) uvc(E) snd_usb_audio(E) sha1_ssse3(E) sn=
d_hda_codec(E) videobuf2_memops(E) iwlwifi(E) drm_ttm_helper(E) videobuf2_v=
4l2(E) aesni_intel(E) snd_usbmidi_lib(E) snd_hda_core(E) ttm(E) snd_rawmidi=
(E) gf128mul(E) snd_pcsp(E) snd_seq_device(E) ppdev(E) snd_hwdep(E) crypto_=
simd(E) drm_kms_helper(E) videodev(E) cryptd(E) cfg80211(E) snd_pcm(E) vide=
obuf2_common(E) rapl(E) snd_timer(E) sp5100_tco(E) drm(E) mc(E) wmi_bmof(E)=
 k10temp(E) tpm_crb(E) rfkill(E) snd(E) sha3_generic(E) video(E) soundcore(=
E) jitterentropy_rng(E) sha512_ssse3(E) tpm_tis(E) ccp(E)
[Fri May 16 12:05:41 2025]  sha512_generic(E) tpm_tis_core(E) joydev(E) drb=
g(E) tpm(E) ansi_cprng(E) libaescfb(E) ecdh_generic(E) ecc(E) parport_pc(E)=
 parport(E) sg(E) rng_core(E) evdev(E) msr(E) loop(E) fuse(E) efi_pstore(E)=
 dm_mod(E) configfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc16(E)=
 mbcache(E) jbd2(E) btrfs(E) blake2b_generic(E) efivarfs(E) raid10(E) raid4=
56(E) async_raid6_recov(E) async_memcpy(E) async_pq(E) async_xor(E) async_t=
x(E) xor(E) raid6_pq(E) raid1(E) raid0(E) md_mod(E) hid_generic(E) usbhid(E=
) hid(E) sd_mod(E) ahci(E) xhci_pci(E) libahci(E) nvme(E) xhci_hcd(E) libat=
a(E) i2c_piix4(E) i2c_smbus(E) r8169(E) nvme_core(E) realtek(E) usbcore(E) =
scsi_mod(E) scsi_common(E) usb_common(E) wmi(E) gpio_amdpt(E) gpio_generic(=
E) button(E) [last unloaded: vfio_pci_core(E)]
[Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000
[Fri May 16 12:05:41 2025] ---[ end trace 0000000000000000 ]---
[Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
[Fri May 16 12:05:41 2025] Code: e3 4c 03 64 24 08 4c 39 e3 72 bf 8b 0d 86 =
02 f6 00 31 ed 31 c0 eb 17 48 63 f0 49 8b 54 24 20 83 c0 01 48 8b 34 f5 40 =
e6 d4 95 <48> 03 2c 16 89 ce 48 63 d0 48 c7 c7 c0 fd d4 95 e8 78 3f f5 ff 8b
[Fri May 16 12:05:41 2025] RSP: 0018:ffffb2eb40bdfe00 EFLAGS: 00010202
[Fri May 16 12:05:41 2025] RAX: 0000000000000001 RBX: ffffffffc04609d7 RCX:=
 0000000000000008
[Fri May 16 12:05:41 2025] RDX: 0000000000000000 RSI: ffff9d28984c3000 RDI:=
 ffffffff95d4fdc0
[Fri May 16 12:05:41 2025] RBP: 0000000000000000 R08: ffff9d25035aed08 R09:=
 000000000000fcf8
[Fri May 16 12:05:41 2025] R10: ffffb2eb40bdfe00 R11: 0000000000000001 R12:=
 ffffffffc04609b0
[Fri May 16 12:05:41 2025] R13: ffffffffc19ef000 R14: ffff9d2502ab6870 R15:=
 0000000000000000
[Fri May 16 12:05:41 2025] FS:  00007fe9ee051040(0000) GS:ffff9d28984c3000(=
0000) knlGS:0000000000000000
[Fri May 16 12:05:41 2025] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[Fri May 16 12:05:41 2025] CR2: ffff9d28984c3000 CR3: 000000011278d000 CR4:=
 0000000000350ef0
[Fri May 16 12:05:41 2025] note: modprobe[35898] exited with irqs disabled
[Fri May 16 12:05:41 2025] note: modprobe[35898] exited with preempt_count 1




Thanks
David

