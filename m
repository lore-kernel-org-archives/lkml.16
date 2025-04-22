Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5167293B71;
	Tue, 22 Apr 2025 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340179; cv=pass; b=EO+vgZWP6xOmdPrpWPggtIdZOQofPT65FY75ObobxT+IujMxHDQSEMkUjig6ZZ2dfm1GSB8TJGiCvPCREWFa3WVfSm7amNYY9PbVNKj+nw5hUDJf2G3x+PgvTG5HmiyQPsPjAStz6qa3NHfHoacwJmpcEA4slWqoul9W5U9Dytw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340179; c=relaxed/simple;
	bh=J5ouDC0Gsmx0WlcN6oLSy44vs3al9Pki25fBSKjq8Kw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UNSUbD8p/YLw1oRIpwnHAL4ohZvlwAmIoirRjWESxYQmADkcdH4xNtp9yzfYO7+yYgRvxXI8/wVGDTNfPqtPBU/K1XPCDsjSvSl+7uisZLjL2C1eDER1znyrVkoVcpk1bHMd1Gjwm5K2TcNr1gtg+q3RiP1N1m+Nt0Ia3wQQNtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Qv1F9bnt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Qv1F9bnt"
ARC-Seal: i=1; a=rsa-sha256; t=1745340124; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=maHts2vpcW2tjJ8ka3XxMyy8VNz1eLmM0ImKB1vvNnhymMiYRqbghXqWc8NXFznyFMhcYuhWkZXHWVxkHIV2MCaliC0v4vlmBMz2xDzAU1oy/Umj5PaElqq4VaYbpf9C4FNgTVPFsOt4DWzaFMAaLODIwivN/4FVTjRfZYrQKV4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745340124; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vChu2eP17VcCVjPNfN1+BoXsYLLiBUzHEokfxyhGBSc=; 
	b=V50ibU7/H5e83ZajSS2oDH9KfjXC92N5Etc8GONIoJI/19KTEzWAyR5bvV09CUOVzAbPRqxlCJHz0IhqClbSHEgxRPvejBKihovvBAOiSfCXM8KQ7GjGtzuqoFXe5sgU7spW/WSnCdp1yaT+EUn3sb8F5gSdrFFtfiAwkTaBD7A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745340124;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=vChu2eP17VcCVjPNfN1+BoXsYLLiBUzHEokfxyhGBSc=;
	b=Qv1F9bntY7HRo2c+vHFeKcO1hjBLG9cAQkU4+6RQhLuTrlkFx/DYTWv2vULH7TEV
	bJc3mQgTs72xUFHA49vOyzi17HnAzSFrmoIS/VEsgyLmUCBcj1kv1Yw9wLZ9RYHSgGU
	9HLpAmz1xj+D5S7X9EW3witPwwYCN8oqS/5j86Oo=
Received: by mx.zohomail.com with SMTPS id 1745340121608854.5907869786862;
	Tue, 22 Apr 2025 09:42:01 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 0/2] Add a Rust GPUVM abstraction
Date: Tue, 22 Apr 2025 13:41:51 -0300
Message-Id: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/GB2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMD3fSC0rJcXSPLFONUA3MjszRjEyWg2oKi1LTMCrA50bG1tQCiH0C
 pVwAAAA==
X-Change-ID: 20250320-gpuvm-29d3e0726f34
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Changes from v1:
- Added more people to cc.
- Used Benno's suggestion to remove the #[allow] (thanks, Benno, that is
  indeed better!)
- Added markdown as applicable in the docs/comments (please let me know
  whether I missed any)
- Changed the order between docs and attributes to match the rest of the
  code in the Rust crate.
- Did *not* remove the # Arguments section from a few functions yet, let's
  push this dicussion down the line, Miguel.
- Changed the placement of OpRemap, i.e.: it was not next to its impl block by
  mistake.
- Misc doc fixes, i.e. missing periods, missing ///, lines that would
  not render properly on the browser, etc (thanks, Miguel)
- Removed spurious clang-format change from patch 1.
- Added a return statement for find_bo/obtain_bo (thanks, Charalampos!)

Changes from v0:
  This version changes how `LockedGpuVm` operates. The previous code assumed
that the interval tree would be protected if all the associated GEM's resvs
were locked, but this is completely unrelated. In fact, this initial version
only aims to support the core VA range management feature of GPUVM, and not any
of the "convenience" functions like "exec_lock()" and friends, so this function
was removed accordingly.
  
  LockedGpuVm is now produced by a call to GpuVm::lock(). This takes a generic
guard type to signal that the driver-specific locks have been acquired in order
to protect the VMs tree, and hence its view of the address space. This approach
is somewhat similar to CondVar, but also incurs in the same pitfall: it is up
to the caller to give meaning to the guard by ensuring that it actually
protects against concurrent access to the VM. Maybe this is a good candidate to
the upcoming "Pitfall" docs section?

  Note that LockedGpuVm::obj was removed. I'm not really sure why this field
was there in the first place, but callers should indicate the object through
the sm_map() and sm_unmap() APIs instead.

  I am not sure why GpuVm::inner uses UnsafeCell, though. I did not touch this
so that we can first discuss whether UnsafeCell is really needed.

  The docs were also updated. Care was taken to reuse the C documentation as
much as possible.

  Itemized changes: 

- Rebased on top of nova-drm
  - Use `srctree` in the docs
  - Add docs as appropriate and remove #[allow(missing_docs)]
  - Remove `impl DriverGpuVa for ()`. Drivers can to that themselves, if they want.
  - Added #[inline] to getters, as Rust cannot inline across crates otherwise (unless this changed recently?)
  - Exposed `drm_gpuva_op_unmap::keep`.
  - Removed `pub(super)` from unsafe fns meant to be called from the C code. 
  - Added "# Safety" blocks to the above.
  - Removed `exec_lock_gem_object()`.
  - Removed `exec_lock()`
  - Removed `LockedGpuVm::vm_exec`. This initial version does not support `exec` calls at all.
  - By the same token, removed `LockedGpuVm::drop()`
  - Removed `LockedGpuVm::obj`. This object has to be passed explicitly.

---
Asahi Lina (2):
      rust: helpers: Add bindings/wrappers for dma_resv
      rust: drm: Add GPUVM abstraction

 rust/bindings/bindings_helper.h |   2 +
 rust/helpers/dma-resv.c         |  13 +
 rust/helpers/drm_gpuvm.c        |  29 ++
 rust/helpers/helpers.c          |   2 +
 rust/kernel/drm/gpuvm.rs        | 807 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |   2 +
 6 files changed, 855 insertions(+)
---
base-commit: e7de41cc4b01dd5500a0c2533c64bdb3f5360567
change-id: 20250320-gpuvm-29d3e0726f34

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

