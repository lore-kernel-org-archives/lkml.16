Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D219276058
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749143126; cv=none; b=MmCBYrGO4u4KBc6FCKVsDR2umszvzvADWCazQRLM8VnI46Xt3ILzu/DhqRUmRj7pl5AJ9iQNALRXxaB8KMkXx1HvnCmGESU/qBX9UvLvk8LxFf5IglHS+eSncft7MExMh7EoWyPyW7RweFnlUsdetMPt0d1hX0IBkKplWu4z5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749143126; c=relaxed/simple;
	bh=819nSBPoIuWMydruyeOciA20s0lPu+TSZhECeNKmWZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A++ocl8M11K/A5wMjisazeCy8whSsqXylL0luTw3ywwoIsUbugwNsozvclmW1RV6KHGwaqc9sOcgZehYWPCpjc1qyzF23IqlktPWI4DqFFQAE6P1XALdnaeB1zjpUUMNDr+zcorQVZ32SO1cyEgN+Jd4YZhpoXNDqTDieyerMZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aax4s851; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aax4s851"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55598xf2016027
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EbkEQB58Ld4nL18JV6VryQl6iNajcUl8L84
	E7nzQctY=; b=aax4s85163gigXOSCZo619XDaKDt2qlpNzNsSo6iIDinkkkA9XR
	7N0tEUSYs468CyM/SiPAVXrv/8/tFNOW0ua1CKRACVnsO3Jaz08IfJTcJOx4jevv
	wiLmSUf00tacOdChRGW3NVNOdtRuBOl5EuwdU9kZe3uez0svHNgm+vLi76Jb0yvP
	EVMgSBLXnftYBeKl2gUzx6uNuhYnSFQ8BjRMfvKbOLewvddx4CJZ+Oc9HVgBcKDR
	K1ouMASrQxWy8wI3lvYTNqX8AniBEeAIGy3s2M38l3LupsooqHZTVFq0JB5ZA/3S
	QwQ9vixeP1o31tTmwpgzODijGlgBKJbdabw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be85sce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:05:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3122368d82bso1860354a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749143122; x=1749747922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EbkEQB58Ld4nL18JV6VryQl6iNajcUl8L84E7nzQctY=;
        b=XNvfjl/pXymUOB+o5WBtXOZxCpW7R9sA/3/B5LBbWVaC5z2ZnmsxhmWELI4r+Z0c0r
         fDCA18Svsz1I1uE/C38AaVJolJd9CAnH6iTbC2yTFScVSKw45c99XTF+ZT/wc1p9iQXH
         N9RZ3rEjnhTshzqOxd5yQ5rrfu3AR21+y2kJAjacV1FP8qd/oqQS7GV93lLp7J01clBz
         BFl4fdZyBlcIpNNxaT+UXzmK3aK0ncb1xe+9LlBEek/JJriXBMVgSPL2iUm/n+ea7e5T
         9CeGnPhmc9C13h17g3kcrBNSI9Vsw+ALBQzkQzIhpswp15e7YOm+36Gy1tDOGL4UezWK
         reNA==
X-Forwarded-Encrypted: i=1; AJvYcCWYaG9thSVdaWols6KLIMAPaHy3vIEqaTgKIPq49Q8Fq12C87ATTaBFTjULRF02jrQsQ9sy9An/wTe+4LU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAeZiof+p4BTXu1in04E7VIXtH9zv/yS0pUvYig0GGuKRee+N1
	ats/MIxzIeI4Wn/oRJ0g44ERfon6whwsNF+8lvFmHldu5lruHSRDnxvhH8rQKALDYY6pfhLtmAB
	rYpLCQHB5ki9IdsHPXlBSVR+z/CpscpK+hGzI9409IFsUaoamvtxTlgGImzHsyjtRAWI=
X-Gm-Gg: ASbGncuCPeus6Kqge+G/QxFGXH7rBF7NgkUAobywdNsiVKq6KmpxbPbD6lE2ReZe83s
	f/62W6iu8RBUStp6AmHpgkqcyU/n4RSul8piJKpUA865i7s+GPH+XMJznK6/fLoCDGhsgknwk7O
	kkf3QRw+5LnIzvF8VbykB8wJg3nu8qWprkOV+y/0WVX2dK5DmLj3AEz9MGnOdbsJh2CECuBhMMP
	ILosDn75aV5j6btN7sruLA2gmJwJHjrAeY9aSBOq+dD4HZYNio6KWdcm9iYTxugApKp3uolTDY/
	gX/f7F9POc76h0c6WYpsZw==
X-Received: by 2002:a17:90b:3c8b:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-313476822a8mr553655a91.26.1749143122127;
        Thu, 05 Jun 2025 10:05:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPJUfGbJeepthRjlidQ5BtvtcAZ1b5FdMU7vtyVPeWNPG8V6k9gBXP8rxjS/GImIe6wJ3m7Q==
X-Received: by 2002:a17:90b:3c8b:b0:311:f99e:7f4a with SMTP id 98e67ed59e1d1-313476822a8mr553575a91.26.1749143121480;
        Thu, 05 Jun 2025 10:05:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:89fa:e299:1a34:c1f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313318e6932sm1544185a91.5.2025.06.05.10.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 10:05:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: robdclark@gmail.com, rob.clark@oss.qualcomm.com
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
        Eugene Lepshy <fekz115@gmail.com>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>, Jun Nie <jun.nie@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm Adreno GPUs),
        linux-kernel@vger.kernel.org (open list),
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK:Keyword:\bdma_(?:buf|fence|resv)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v6 00/40] drm/msm: sparse / "VM_BIND" support
Date: Thu,  5 Jun 2025 10:03:26 -0700
Message-ID: <20250605170436.158386-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=6841ce53 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=zBYVM8QCAAAA:8
 a=ajksXRGWIgAGF9WJ9h0A:9 a=eVM1_HBmYRkA:10 a=YgSuLXRpIuYA:10
 a=te1wHPZ5H10A:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=ArXkYGXkE6hBHcUMFODu:22
X-Proofpoint-GUID: Gxz8j6aVGeI9UnaFusi3_2YYXjCCD_bT
X-Proofpoint-ORIG-GUID: Gxz8j6aVGeI9UnaFusi3_2YYXjCCD_bT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1MSBTYWx0ZWRfXy+oGeP0sjJVr
 0IDZsrPaWMXMphtmXSJmcT9vsuQKQeNGclYi+PSZqGeZBZzK4GTR8k0j4lbVMXQBuDuO5bAJxER
 pxvf9NTh5NtsmfK9zcXv5/S48anB0OoQ1TWuyTblo9ovxN8FMGDd6ZlIBTZMF7DcV8D3RfIUNUL
 r7qgxidKXoJlRKbeaZCfnhnl5OTmtBpH8zRmo/ulnVh+U1IHtB04XRZ47wDJYeN858kM4ADDCwf
 G12W1pSzk6eNyg0//4a5aJ7uh0RhXX615HdmWXKLZmVCAkWABKhyC1xortzihjW5pjXrmpvlaSK
 m9pkTx9rs9NyGb4r6uA217jMqa52k9p/1mk6ZevDh/FV8yQ/CwFBpf2TlnFDQluHa4+rVVJ8S68
 tcCFmDvtWVR/21IO3pStOh6C2ZETTDLkjok4ei1HXLMuJsJyNnz5Btt2PnzpppO37ijOCNoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_04,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1011
 mlxlogscore=999 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506050151

Conversion to DRM GPU VA Manager[1], and adding support for Vulkan Sparse
Memory[2] in the form of:

1. A new VM_BIND submitqueue type for executing VM MSM_SUBMIT_BO_OP_MAP/
   MAP_NULL/UNMAP commands

2. A new VM_BIND ioctl to allow submitting batches of one or more
   MAP/MAP_NULL/UNMAP commands to a VM_BIND submitqueue

I did not implement support for synchronous VM_BIND commands.  Since
userspace could just immediately wait for the `SUBMIT` to complete, I don't
think we need this extra complexity in the kernel.  Synchronous/immediate
VM_BIND operations could be implemented with a 2nd VM_BIND submitqueue.

The corresponding mesa MR: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32533

Changes in v6:
- Drop io-pgtable-arm patch as it has already been picked up in the
  iommu tree.
- Rework to drop gpuvm changes.  To mitigate the limitation of gpuvm
  when it comes to lazy unmap (and to avoid ~5ms of unmap per pageflip!)
  a vma_ref refcount is added.  This refcount is incremented when a BO
  is pinned for scanout, and for userspace handles and dma-bufs.  The
  VMA is torn down when this count drops to zero, breaking the reference
  loop between the VM_BO and BO.  But as long as a pin or userspace
  handle is keeping a reference to the BO live, we allow the harmless
  reference loop to live.  (This is only for kernel managed VMs, which
  includes the kms VM.)  If no userspace process has some sort of
  handle to the BO, it is unlikely to be reused again.  (The exception
  is GET_FB, but in that case the vma_ref >= 1 due to pin for scan-
  out.)
- Drop gpu sched changes for throttling and move this into the driver.
  We can re-visit a more generic solution when some other driver
  realizes they need the same thing.
- Link to v5: https://lore.kernel.org/all/20250519175348.11924-1-robdclark@gmail.com/

Changes in v5:
- Improved drm/sched enqueue_credit comments, and better define the
  return from drm_sched_entity_push_job()
- Improve DRM_GPUVM_VA_WEAK_REF comments, and additional WARN_ON()s to
  make it clear that some of the gpuvm functionality is not available
  in this mode.
- Link to v4: https://lore.kernel.org/all/20250514175527.42488-1-robdclark@gmail.com/

Changes in v4:
- Various locking/etc fixes
- Optimize the pgtable preallocation.  If userspace sorts the VM_BIND ops
  then the kernel detects ops that fall into the same 2MB last level PTD
  to avoid duplicate page preallocation.
- Add way to throttle pushing jobs to the scheduler, to cap the amount of
  potentially temporary prealloc'd pgtable pages.
- Add vm_log to devcoredump for debugging.  If the vm_log_shift module
  param is set, keep a log of the last 1<<vm_log_shift VM updates for
  easier debugging of faults/crashes.
- Link to v3: https://lore.kernel.org/all/20250428205619.227835-1-robdclark@gmail.com/

Changes in v3:
- Switched to seperate VM_BIND ioctl.  This makes the UABI a bit
  cleaner, but OTOH the userspace code was cleaner when the end result
  of either type of VkQueue lead to the same ioctl.  So I'm a bit on
  the fence.
- Switched to doing the gpuvm bookkeeping synchronously, and only
  deferring the pgtable updates.  This avoids needing to hold any resv
  locks in the fence signaling path, resolving the last shrinker related
  lockdep complaints.  OTOH it means userspace can trigger invalid
  pgtable updates with multiple VM_BIND queues.  In this case, we ensure
  that unmaps happen completely (to prevent userspace from using this to
  access free'd pages), mark the context as unusable, and move on with
  life.
- Link to v2: https://lore.kernel.org/all/20250319145425.51935-1-robdclark@gmail.com/

Changes in v2:
- Dropped Bibek Kumar Patro's arm-smmu patches[3], which have since been
  merged.
- Pre-allocate all the things, and drop HACK patch which disabled shrinker.
  This includes ensuring that vm_bo objects are allocated up front, pre-
  allocating VMA objects, and pre-allocating pages used for pgtable updates.
  The latter utilizes io_pgtable_cfg callbacks for pgtable alloc/free, that
  were initially added for panthor.
- Add back support for BO dumping for devcoredump.
- Link to v1 (RFC): https://lore.kernel.org/dri-devel/20241207161651.410556-1-robdclark@gmail.com/T/#t

[1] https://www.kernel.org/doc/html/next/gpu/drm-mm.html#drm-gpuvm
[2] https://docs.vulkan.org/spec/latest/chapters/sparsemem.html
[3] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=909700

Rob Clark (40):
  drm/gem: Add ww_acquire_ctx support to drm_gem_lru_scan()
  drm/msm: Rename msm_file_private -> msm_context
  drm/msm: Improve msm_context comments
  drm/msm: Rename msm_gem_address_space -> msm_gem_vm
  drm/msm: Remove vram carveout support
  drm/msm: Collapse vma allocation and initialization
  drm/msm: Collapse vma close and delete
  drm/msm: Don't close VMAs on purge
  drm/msm: Stop passing vm to msm_framebuffer
  drm/msm: Refcount framebuffer pins
  drm/msm: drm_gpuvm conversion
  drm/msm: Convert vm locking
  drm/msm: Use drm_gpuvm types more
  drm/msm: Split out helper to get iommu prot flags
  drm/msm: Add mmu support for non-zero offset
  drm/msm: Add PRR support
  drm/msm: Rename msm_gem_vma_purge() -> _unmap()
  drm/msm: Drop queued submits on lastclose()
  drm/msm: Lazily create context VM
  drm/msm: Add opt-in for VM_BIND
  drm/msm: Mark VM as unusable on GPU hangs
  drm/msm: Add _NO_SHARE flag
  drm/msm: Crashdump prep for sparse mappings
  drm/msm: rd dumping prep for sparse mappings
  drm/msm: Crashdump support for sparse
  drm/msm: rd dumping support for sparse
  drm/msm: Extract out syncobj helpers
  drm/msm: Use DMA_RESV_USAGE_BOOKKEEP/KERNEL
  drm/msm: Add VM_BIND submitqueue
  drm/msm: Support IO_PGTABLE_QUIRK_NO_WARN_ON
  drm/msm: Support pgtable preallocation
  drm/msm: Split out map/unmap ops
  drm/msm: Add VM_BIND ioctl
  drm/msm: Add VM logging for VM_BIND updates
  drm/msm: Add VMA unmap reason
  drm/msm: Add mmu prealloc tracepoint
  drm/msm: use trylock for debugfs
  drm/msm: Bump UAPI version
  drm/msm: Defer VMA unmap for fb unpins
  drm/msm: Add VM_BIND throttling

 drivers/gpu/drm/drm_gem.c                     |   14 +-
 drivers/gpu/drm/msm/Kconfig                   |    1 +
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   25 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c      |    5 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c     |    4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   22 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |    2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h         |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |   49 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   |    6 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    4 -
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |   99 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   23 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h   |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |    2 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_crtc.c     |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |   28 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c    |   18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |    4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |   19 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |   18 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c            |   14 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  184 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   29 +-
 drivers/gpu/drm/msm/msm_fb.c                  |   30 +-
 drivers/gpu/drm/msm/msm_fbdev.c               |    2 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  553 +++---
 drivers/gpu/drm/msm/msm_gem.h                 |  277 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c           |   48 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c        |  104 +-
 drivers/gpu/drm/msm/msm_gem_submit.c          |  306 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c             | 1486 ++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c                 |  211 ++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  147 +-
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   14 +
 drivers/gpu/drm/msm/msm_iommu.c               |  302 +++-
 drivers/gpu/drm/msm/msm_kms.c                 |   18 +-
 drivers/gpu/drm/msm/msm_kms.h                 |    2 +-
 drivers/gpu/drm/msm/msm_mmu.h                 |   38 +-
 drivers/gpu/drm/msm/msm_rd.c                  |   62 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c          |   10 +-
 drivers/gpu/drm/msm/msm_submitqueue.c         |   96 +-
 drivers/gpu/drm/msm/msm_syncobj.c             |  172 ++
 drivers/gpu/drm/msm/msm_syncobj.h             |   37 +
 include/drm/drm_gem.h                         |   10 +-
 include/uapi/drm/msm_drm.h                    |  149 +-
 56 files changed, 3553 insertions(+), 1260 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.c
 create mode 100644 drivers/gpu/drm/msm/msm_syncobj.h

-- 
2.49.0

