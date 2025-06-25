Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF20435280
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 22:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750890107; cv=none; b=VGvwAK4EnB0/R85Px/WbZ58EDx69cjycm7DyhsoZ0QE5T3W9gVg7rxoTrpWUAkbHQbHHuvHm4gvurAIuIicG3vXTVd/lIYWcH03c3zHPgBp4lePJ066ROUsPQNwXF2aDVOpQZT9CzMTvpMss6g3WccOiZonSHlbmMa1vhuZZsXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750890107; c=relaxed/simple;
	bh=fY67UzbVulfTBZct+uEcSfPtFWShD+JHkVnLxvFZ7Do=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu0x3AkOVMUvAHQQ56yuAGUA/4cBIs0/bdnhVvM8OMOqOsqf/e446xAHdmwv+TocHvzJyTweLcqmSdZyz131W1tdt/3AKhbWJoL6n2vFtrq2DaAs6wf7Q0Vuo29XIn52YL7BbpMK+D+caJVUw2kcmHP61p1aNGD5zLTAmjUhYi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHcuHlKQ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHcuHlKQ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-237d849253fso781475ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750890105; x=1751494905; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g19+8q6djvy5sxUj6fKW3hbWJ20AxD+Rc3g0stgFGGs=;
        b=BHcuHlKQvSXQhTY3Gna04sFUp9gGS+jW2wMolg+Gk2hXuGV5G22vEklIt9G6v8Z80D
         GOvRnB+gYAjiiAlcCc13hwV8gMINbJcnD5uxSsEx/aqz3+T+Wp7V4MJRuOdLxmTOiLDi
         fUKneo+pc3dKlTTiT28zbDtDZcUHYl80QjHbZ2CvBB7W+X0iV0WPUQI/FR6d6upn6bmt
         KH5yKPfQD5Lm4473J4OsSeP43LmnamUd9z0aOZa17rATrAaWtZfKJfc3Enmac3CnT7Ei
         ReuIbgk/Ho0UTtFoQtt73ySFDPtoyp5D/j/s0n1SuTifdLdAxT2uuuWHjXtn7AxRcRXi
         VO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750890105; x=1751494905;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g19+8q6djvy5sxUj6fKW3hbWJ20AxD+Rc3g0stgFGGs=;
        b=SzktT5wKzR6dE15MS2tDIhhXEiIClJyLSFmdmUnVhzbYjgMSz4T5VJxlX2lNYf7BC2
         m+vSGqibL05rypaFbdE+4gxtsQvMmIF0Ac5c1tPqNWJDYmL2t+/UsDXm9OwqqQnxT5FJ
         LNfl/YORJESi9m4O7SmR3YZOgOd2md75+WeJo4qSL4lSulXp9rf6LRYc+xEkj1AJQ7zj
         vXoNqIi8AuLfH26KYDaY1be0GK4Fcylx5PyEufLMcqB98araQQa/pyjp780xPhAWLoqC
         9gCer0Bu+vQmF0VGVsMvKWruiKLovu2MkKFe71bTEbZ+kaOuRl2DIaiB9/7d+FEqlJvY
         UXLA==
X-Forwarded-Encrypted: i=1; AJvYcCVI5xl7OYkQukcCh2MSkapb43Rhx0SmWh9KlfnumlttcvPWuQE9h+DGL9m0LpZZnTaJ3yFnd1/mbvt3d6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUQZHghNayJUMhJ+P2V9SXDWpx+8TGk4YNSCgCQvhi7VAcm3E
	jwDe0+hwq3rjj4msvoTCh0idv2gvwzFIiTxtSInVlMcQoW6v2dOZWGUHT3vJAGulDMeRYcgdfAk
	OxTWvhadOO/TFEr/EIxGTSOed4Eux8vnhSQ==
X-Gm-Gg: ASbGncvhdlv+qZEy2rteoB0cGeKwb8M4d/5NbsRUyyAtt7fQl1YM/h/j9765BRI7LKd
	zbIo8bX9Dp4CN9wpmIEdiMjE9cwLyG3CzVPWwcLB8uZuGw0em8xLajiWA29uYfpyLkcNN8On8a8
	t/0HT6YdwhmNaD/HRfAHUt47ouZcsKhnH2oVlELQfI44wb
X-Google-Smtp-Source: AGHT+IFKXARrSfKL+9xNOlbPtVYHwZM6qrpJo3T7BXj9LdX7AfoWvzwRDFFoqykiNT/0XdN8osdK+KD/NGBdKkzuT78=
X-Received: by 2002:a17:903:1d0:b0:235:caf9:8b1d with SMTP id
 d9443c01a7336-23824386a36mr32101155ad.12.1750890105116; Wed, 25 Jun 2025
 15:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOR=gxQahs8SXmObsj-6-ux3BMpTZc=8WrSZ83hikpoBZR3OZg@mail.gmail.com>
In-Reply-To: <CAOR=gxQahs8SXmObsj-6-ux3BMpTZc=8WrSZ83hikpoBZR3OZg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 25 Jun 2025 18:21:33 -0400
X-Gm-Features: Ac12FXyB1lK2xXaaDmdcbOOHhW0Nsg7vExzYclAd6iHTFl-d_nupHwfvqHY-ep4
Message-ID: <CADnq5_P-60BpvNJf5W16TPbFDXRM5wtHh10iiZm2z6DEDFqn=g@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IFtSRUdSRVNTSU9OXSBSWC01ODAgKGdmeDgwMykgR1BVIGhhbmdzIHNpbmNlIH52Ng==?=
	=?UTF-8?B?LjE0LjEg4oCTIOKAnHNjaGVkdWxlciBjb21wXzEuMS4xIGlzIG5vdCByZWFkeeKAnSAvIFJPQ20gNS43?=
	=?UTF-8?B?LTYuNCsgYnJva2Vu?=
To: Johl Brown <johlbrown@gmail.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>, 
	Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, "Yang, Philip" <Philip.Yang@amd.com>, 
	"Kim, Jonathan" <Jonathan.Kim@amd.com>
Cc: amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx-owner@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="000000000000c1bb9606386cde67"

--000000000000c1bb9606386cde67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adding folks from the KFD team to take a look.  Thank you for
bisecting.  Does the attached patch fix it?

Thanks,

Alex

On Wed, Jun 25, 2025 at 12:33=E2=80=AFAM Johl Brown <johlbrown@gmail.com> w=
rote:
>
> Good Afternoon and best wishes!
> This is my first attempt at upstreaming an issue after dailying arch for =
a full year now :)
> Please forgive me, a lot of this is pushing my comfort zone, but preventi=
ng needless e-waste is important to me personally :) with this in mind, I w=
ill save your eyeballs and let you know I did use gpt to help compile the b=
elow, but I have proofread it several times (which means you can't be mad :=
p ).
>
>
> https://github.com/ROCm/ROCm/issues/4965
> https://github.com/robertrosenbusch/gfx803_rocm/issues/35#issuecomment-29=
96884779
>
>
> Hello Kernel, AMD GPU, & ROCm maintainers,
>
> TL;DR: My Polaris (RX-580, gfx803) freezes under compute load on a number=
 of kernels since v6.14 and newer. This was not previously the case prior t=
o 6.15 for ROCm 6.4.0 on gfx803 cards.
>
> The issue has been successfully mitigated within an older version of ROC =
under kernel 6.16rc2 by reverting two specific commits:
>
> de84484c6f8b (=E2=80=9Cdrm/amdkfd: Improve signal event slow path=E2=80=
=9D, 2024-12-19)
>
> bac38ca057fe (=E2=80=9Cdrm/amdkfd: implement per queue sdma reset for gfx=
 9.4+=E2=80=9D, 2025-03-06)
>
> Reverting both commits on top of v6.16-rc3 restores full stability and al=
lows ROCm 5.7 workloads (e.g., Stable-Diffusion, faster-whisper) to run. In=
stability is usually immediately obvious via eg models failing to initialis=
e, no errors (other than host dmesg)/segfault reported, which is the usual =
failure method under previous kernels.
>
> ________________________________
>
> Problem Description
>
> A number of users report GPU hangs when initialising compute loads, speci=
fically with ROCm 5.7+ workloads. This issue appears to be a regression, as=
 it was not present in earlier kernel versions.
>
> System Information:
>
> OS: Arch Linux
>
> CPU: Intel(R) Core(TM) i7-7700K CPU @ 4.20GHz
>
> GPU: AMD Radeon RX 580 Series (gfx803)
>
> ROCm Version: Runtime Version: 1.1, Runtime Ext Version: 1.7 (as per rocm=
info --support)
>
> ________________________________
>
> Affected Kernels and Regression Details
>
> The problem consistently occurs on v6.14.1-rc1 and newer kernels.
>
> Last known good: v6.11
>
> First known bad: v6.12
>
> The regression has been bisected to the following two commits, as reverti=
ng them resolves the issue:
>
> de84484c6f8b (=E2=80=9Cdrm/amdkfd: Improve signal event slow path=E2=80=
=9D, 2024-12-19)
>
> bac38ca057fe (=E2=80=9Cdrm/amdkfd: implement per queue sdma reset =E2=80=
=A6=E2=80=9D, 2025-03-06)
>
> Both patches touch amdkfd queue reset paths and are first included in the=
 exact releases where the regression appears.
>
> Here's a summary of kernel results:
>
> Kernel | Result | Note
>
> ------- | -------- | --------
>
> 6.13.y (LTS) | OK |
>
> 6.14.0 | OK | Baseline - my last working kernel, though I am not exactly =
sure which subver
>
> 6.14.1-rc1 | BAD | First hang
>
> 6.15-rc1 | BAD | Hang
>
> 6.15.8 | BAD | Hang
>
> 6.16-rc3 | BAD | Hang
>
> 6.16-rc3 =E2=80=93 revert de84484 + bac38ca | OK | Full stability restore=
d, ROCm workloads run for hours.
>
> ________________________________
>
> Reproduction Steps
>
> Boot the system with a kernel version exhibiting the issue (e.g., v6.14.1=
-rc1 or newer without the reverts).
>
> Run a ROCm workload that creates several compute queues, for example:
>
> python stable-diffusion.py
>
> faster-whisper --model medium ...
>
> Upon model initialization, an immediate driver crash occurs. This is visi=
ble on the host machine via dmesg logs.
>
> Observed Error Messages (dmesg):
>
> [drm] scheduler comp_1.1.1 is not ready, skipping
> [drm:sched_job_timedout] ERROR ring comp_1.1.1 timeout
> [message continues ad-infinitum while system functions generally]
>
> This is followed by a hard GPU reset (visible in logs, no visual artifact=
s), which reliably leads to a full system lockup. Python or Docker processe=
s become unkillable, requiring a manual reboot. Over time, the desktop slow=
ly loses interactivity.
>
> ________________________________
>
> Bisect Details
>
> I previously attempted a git bisect (limited to drivers/gpu/drm/amd) betw=
een v6.12 and v6.15-rc1, which identified some further potentially problema=
tic commits, however due to undersized /boot/ partition was experiencing so=
me difficulties. In the interim, it seems a user on  the gfx803 compatibilt=
y repo discovered the below regarding ROC 5.7:
>
> de84484c6f8b07ad0850d6c4  bad
> bac38ca057fef2c8c024fe9e  bad
>
> Cherry-picking reverts of both commits on top of v6.16-rc3 restores norma=
l behavior; leaving either patch in place reproduces the hang.
>
> ________________________________
>
> Relevant Log Excerpts
>
> (Full dmesg logs can be attached separately if needed)
>
> [drm] scheduler comp_1.1.1 is not ready, skipping
> [ 97.602622] amdgpu 0000:08:00.0: amdgpu: ring comp_1.1.1 timeout, signal=
ed seq=3D123456 emitted seq=3D123459
> [ 97.602630] amdgpu 0000:08:00.0: amdgpu: GPU recover succeeded, reset do=
main time =3D 2ms
>
> ________________________________
> References:
>
> It's back: Log spam: [drm] scheduler comp_1.0.2 is not ready, skipping ..=
. (https://bbs.archlinux.org/viewtopic.php?id=3D302729)
>
> Observations about HSA and KFD backends in TinyGrad =C2=B7 GitHub (https:=
//gist.github.com/fxkamd/ffd02d66a2863e444ec208ea4f3adc48)
>
> AMD RX580 system freeze on maximum VRAM speed (https://discussion.fedorap=
roject.org/t/amd-rx580-system-freeze-on-maximum-vram-speed/136639)
>
> LKML: Linus Torvalds: Re: [git pull] drm fixes for 6.15-rc1 (https://lkml=
.org/lkml/2025/4/5/394)
>
> Commits =C2=B7 torvalds/linux - GitHub (Link for commit de84484) (https:/=
/github.com/torvalds/linux/commits?before=3D805ba04cb7ccfc7d72e834ebd796e04=
3142156ba+6335)
>
> Commits =C2=B7 torvalds/linux - GitHub (Link for commit bac38ca) (https:/=
/github.com/torvalds/linux/commits?before=3D5bc1018675ec28a8a60d83b378d8c39=
91faa5a27+7980)
>
> ROCm-For-RX580/README.md at main - GitHub (https://github.com/woodrex83/R=
OCm-For-RX580/blob/main/README.md)
>
> ROCm 4.6.0 for gfx803 - GitHub (https://github.com/robertrosenbusch/gfx80=
3_rocm/issues/35#issuecomment-2996884779)
>
> Compatibility matrices =E2=80=94 Use ROCm on Radeon GPUs - AMD (https://r=
ocm.docs.amd.com/projects/radeon/en/latest/docs/compatibility.html)
>
>
> ________________________________
>
> Why this matters
>
> Although gfx803 is End-of-Life (EOL) for official ROCm support, large use=
r communities (Stable-Diffusion, Whisper, Tinygrad) still depend on it. Com=
munity builds (e.g., github.com/robertrosenbusch/gfx803_rocm/) demonstrate =
that ROCm 6.4+ and RX-580 are fully functional on a number of relatively re=
cent kernels. This regression significantly impacts the usability of these =
cards for compute workloads.
>
> ________________________________
>
> Proposed Next Steps
>
> I suggest the following for further investigation:
>
> Review the interaction between the new KFD signal-event slow-path and leg=
acy GPUs that may lack valid event IDs.
>
> Confirm whether hqd_sdma_get_doorbell() logic (added in bac38ca) returns =
stale doorbells on gfx803, potentially causing false positives.
>
> Consider back-outs for 6.15-stable / 6.16-rc while a proper fix is develo=
ped.
>
> Please let me know if you require any further diagnostics or testing. I c=
an easily rebuild kernels and provide annotated traces.
>
> Please find my working document: https://chatgpt.com/share/6854bef2-c69c-=
8002-a243-a06c67a2c066
>
> Thanks for your time!
>
> Best regards, big love,
>
> Johl Brown
>
> johlbrown@gmail.com

--000000000000c1bb9606386cde67
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdkfd-add-hqd_sdma_get_doorbell-callbacks-for-g.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdkfd-add-hqd_sdma_get_doorbell-callbacks-for-g.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mcciqhdn0>
X-Attachment-Id: f_mcciqhdn0

RnJvbSAzMDEyYmJiYjM3ODA4M2MyYWYzNDMzZWVkYjljMmMyNGNiZTgzOTVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFdlZCwgMjUgSnVuIDIwMjUgMTg6MTU6MzcgLTA0MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1ka2ZkOiBhZGQgaHFkX3NkbWFfZ2V0X2Rvb3JiZWxsIGNhbGxiYWNrcyBmb3IgZ2Z4
Ny84CgpUaGVzZSB3ZXJlIG1pc3NlZCB3aGVuIHN1cHBvcnQgd2FzIGFkZGVkIGZvciBvdGhlciBn
ZW5lcmF0aW9ucy4KVGhlIGNhbGxiYWNrcyBhcmUgY2FsbGVkIHVuY29uZGl0aW9uYWxseSBzbyB3
ZSBuZWVkIHRvIG1ha2UKc3VyZSBhbGwgZ2VuZXJhdGlvbnMgaGF2ZSB0aGVtLgoKRml4ZXM6IGJh
YzM4Y2E4YzQ3NSAoImRybS9hbWRrZmQ6IGltcGxlbWVudCBwZXIgcXVldWUgc2RtYSByZXNldCBm
b3IgZ2Z4IDkuNCsiKQpDYzogSm9uYXRoYW4gS2ltIDxqb25hdGhhbi5raW1AYW1kLmNvbT4KUmVw
b3J0ZWQtYnk6IEpvaGwgQnJvd24gPGpvaGxicm93bkBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92Ny5jIHwgOCArKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjguYyB8IDggKysrKysr
KysKIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y3LmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92Ny5jCmluZGV4IGNhNGE2YjgyODE3
ZjUuLmRmNzc1NThlMDNlZjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9nZnhfdjcuYwpAQCAtNTYxLDYgKzU2MSwxMyBAQCBzdGF0aWMgdWludDMy
X3QgcmVhZF92bWlkX2Zyb21fdm1mYXVsdF9yZWcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYp
CiAJcmV0dXJuIFJFR19HRVRfRklFTEQoc3RhdHVzLCBWTV9DT05URVhUMV9QUk9URUNUSU9OX0ZB
VUxUX1NUQVRVUywgVk1JRCk7CiB9CiAKK3N0YXRpYyB1aW50MzJfdCBrZ2RfaHFkX3NkbWFfZ2V0
X2Rvb3JiZWxsKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAorCQkJCQkgIGludCBlbmdpbmUs
IGludCBxdWV1ZSkKKworeworCXJldHVybiAwOworfQorCiBjb25zdCBzdHJ1Y3Qga2ZkMmtnZF9j
YWxscyBnZnhfdjdfa2ZkMmtnZCA9IHsKIAkucHJvZ3JhbV9zaF9tZW1fc2V0dGluZ3MgPSBrZ2Rf
cHJvZ3JhbV9zaF9tZW1fc2V0dGluZ3MsCiAJLnNldF9wYXNpZF92bWlkX21hcHBpbmcgPSBrZ2Rf
c2V0X3Bhc2lkX3ZtaWRfbWFwcGluZywKQEAgLTU3OCw0ICs1ODUsNSBAQCBjb25zdCBzdHJ1Y3Qg
a2ZkMmtnZF9jYWxscyBnZnhfdjdfa2ZkMmtnZCA9IHsKIAkuc2V0X3NjcmF0Y2hfYmFja2luZ192
YSA9IHNldF9zY3JhdGNoX2JhY2tpbmdfdmEsCiAJLnNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVf
YmFzZSA9IHNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVfYmFzZSwKIAkucmVhZF92bWlkX2Zyb21f
dm1mYXVsdF9yZWcgPSByZWFkX3ZtaWRfZnJvbV92bWZhdWx0X3JlZywKKwkuaHFkX3NkbWFfZ2V0
X2Rvb3JiZWxsID0ga2dkX2hxZF9zZG1hX2dldF9kb29yYmVsbCwKIH07CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjguYwppbmRleCAwZjNlMjk0
NGVkZDdlLi5lNjhjMGZhOGQ3NTEzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y4LmMKQEAgLTU4Miw2ICs1ODIsMTMgQEAgc3RhdGljIHZv
aWQgc2V0X3ZtX2NvbnRleHRfcGFnZV90YWJsZV9iYXNlKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJbG93ZXJfMzJfYml0cyhwYWdlX3RhYmxlX2Jhc2UpKTsKIH0KIAorc3RhdGljIHVp
bnQzMl90IGtnZF9ocWRfc2RtYV9nZXRfZG9vcmJlbGwoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXYsCisJCQkJCSAgaW50IGVuZ2luZSwgaW50IHF1ZXVlKQorCit7CisJcmV0dXJuIDA7Cit9CisK
IGNvbnN0IHN0cnVjdCBrZmQya2dkX2NhbGxzIGdmeF92OF9rZmQya2dkID0gewogCS5wcm9ncmFt
X3NoX21lbV9zZXR0aW5ncyA9IGtnZF9wcm9ncmFtX3NoX21lbV9zZXR0aW5ncywKIAkuc2V0X3Bh
c2lkX3ZtaWRfbWFwcGluZyA9IGtnZF9zZXRfcGFzaWRfdm1pZF9tYXBwaW5nLApAQCAtNTk5LDQg
KzYwNiw1IEBAIGNvbnN0IHN0cnVjdCBrZmQya2dkX2NhbGxzIGdmeF92OF9rZmQya2dkID0gewog
CQkJZ2V0X2F0Y192bWlkX3Bhc2lkX21hcHBpbmdfaW5mbywKIAkuc2V0X3NjcmF0Y2hfYmFja2lu
Z192YSA9IHNldF9zY3JhdGNoX2JhY2tpbmdfdmEsCiAJLnNldF92bV9jb250ZXh0X3BhZ2VfdGFi
bGVfYmFzZSA9IHNldF92bV9jb250ZXh0X3BhZ2VfdGFibGVfYmFzZSwKKwkuaHFkX3NkbWFfZ2V0
X2Rvb3JiZWxsID0ga2dkX2hxZF9zZG1hX2dldF9kb29yYmVsbCwKIH07Ci0tIAoyLjUwLjAKCg==
--000000000000c1bb9606386cde67--
