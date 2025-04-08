Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0E264A85
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104243; cv=none; b=d7pYHVXPA847YReOkYwwMGZBPQGWY87hFMk1PPK/4nP0ar5Gf7TCIqjnq8BU18nMliJ4IrjhbhsBtBuKU4NjYacsqKFSFZ9CQtENWyZiaf7DnKz3KoWS6LY+E3RaP2Aqj7h6q1GEBgaWm+jst4/nuNOBcudIYuAIOFFXVrFO4tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104243; c=relaxed/simple;
	bh=r4Hu3N2qKPWYSdMjMLUU4leSKcHEUEyG3mqTdjIjwD8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IBqE08ZYr5KdYMOecIsDbYxzf17CQA/LjEsVV8GzaDm14T7z8WgNsyWHEBcKdSXLeCIO7W4a5uqGc81QMjpYK1J4zo2sONffHoD2dka8HkE05kPOwHpUTzPP16PFylZsKTrNrS0tbLGwPYq/MFVdq7XorTO8LtJM/zDaF7XdzGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EptftRut; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EptftRut"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39134c762ebso2364129f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744104238; x=1744709038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EODn55UQ9S18QAKwAlJvt1H624Nxq9sbpLwSEPWET5s=;
        b=EptftRutMCTUsm77PtxOdojcFepRdD1KNkn2FD8lPd5IdKcMSsGHD15hp+XRYNrhfl
         KUL0pTdwuajKFY0GUvT6/CuYrwh1SwVYa2lbJ2HYCoE8zTZnKP27DurCGFag0bJyGRAU
         i1ZFlWk2jKJyx57ZiVfVPlBWKuwiYtqe8IxyvM2TALgj6nuc4pXkGnbSVgzD5YFFmevd
         GRvVyncHeyKLV3JPQidr6LRgdLGGZJWm3GDf9xQiy0dhy2Na5eZDxWPfGGHrgjmsLpN9
         P2cyF/afgQndYlnzye39Pke3LdqzZAZxBKqoYmozeTqewA2L0Ja5um3Wx4p6ZjVEwDeo
         ZjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104238; x=1744709038;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EODn55UQ9S18QAKwAlJvt1H624Nxq9sbpLwSEPWET5s=;
        b=ik/FCXdFt5DN8qdrFOZ460utIUhC8d3lU0alnn0wdfBDQHlqP946FiMYhGKpCiA878
         3OkS7a+o+FdDBU5IfE1Nf7QYkIf/RpFRsWQ7DBEg1CGMd5IW5HnufYVS9Zjrl8QtMFB3
         f9ace2HcspMLFDrsYQzxchEIzesGk7+J4vRP6+qTNFrRKnp7DgIAiExQuBDnMPqtgvus
         Dg3+TRgQd5PvU2b33sTM2vRh68A/5nXljrk3D+1JF9oUJKV5EHWrfriFowXoQXqImlM7
         gJdVTlIfhfC0X3NOHD13m4lwsdZJolibg3tiWQTYCIrg3qXeVA2Im4A0N/psnfKLG/SG
         tZ1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1rpiu9MLM6gIPsdC3HVYEtepDZ/sVEw9barycH8BiozlVszKO9l6o54SappmX5BAQqtwuuvu7y9bp7A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCu/xKlGgVzzGKtFdFwQN2VpK26BIEsmFNldBfFyguSmH36Qkj
	EbfgrLcNUO5rscDCKsqSwNMFspRr4jQDyoT3GWjRksZNvzQe9Z8p3ok6YtTPZQz9UJASDKTUncE
	blpXlNU/vvXQhIw==
X-Google-Smtp-Source: AGHT+IHUaBFHW96Gs4xsEMUJyhcH24pQ1u14SHiLgmq/cKMRqCcwxgl8G1NgEJjpkTBcJE4+1Si9chMOdv4Rj6w=
X-Received: from wmby23.prod.google.com ([2002:a05:600c:c057:b0:43c:fcbd:f2eb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a8a:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39d6fc4f25fmr8511614f8f.30.1744104238380;
 Tue, 08 Apr 2025 02:23:58 -0700 (PDT)
Date: Tue, 08 Apr 2025 09:22:37 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN3q9GcC/2XSS07EMAwG4KugrgmynadZcQ/EIs+hElA0gyrQa
 O6OhxZalFWVqJ9j+fd5ONXjWE/D/c15ONZ5PI3TmxzQ3d4M+Tm+Haoai1wMBGTAk1bza1QtACI
 3bknbQf58P9Y2fv6UeXyS8/N4+piOXz9VZ7ze/vczKlSaYrFRCoVaHw7TdHipd3l6Ha4FZtojv
 yASFJOulsmXrGOH9IakwQVpQSW5jBliK5E7ZPaIFmQEAWMMHmyIRnfI7pFbkL0iAxga2FIpdcj
 9IQSEBTkFqgQGzck16/uX/B6ZBXlBgFVTC05ysB0KG0JaXwqCatJoyJboXN8e79E6CBbkkXxqu
 RRr+pwQ9orXdKU9ZUprMokUJa2ebUuBhGtU8hXmnDNgKLTcDwP/1sLK3tiVkTDtLTDHCuj7vUC
 9MYLfFdTCKDEHciFqdj0zO4a/zAhLxNn4mAhbP3y0G9OwRibNgrLZGZQIOMD/Ji+XyzeabLZai gMAAA==
X-Change-Id: 20240723-vma-f80119f9fb35
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6266; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=r4Hu3N2qKPWYSdMjMLUU4leSKcHEUEyG3mqTdjIjwD8=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn9Orrar5BK5Vo24GI4uDyp2BfqPQKp16/q6sP/
 z5bXEzuWQOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ/Tq6wAKCRAEWL7uWMY5
 RgavD/9JYzBjHS+Mn55+CIHd6R11q6PJ9iGaChY83cMM8tv0fulhJCkWA/xSNFSV5rPCPUmbPH3
 oFEV6ftccSd8Se0v5QwtbYbBIzmD6om5FxjZhZpB/3/nqhOMtJsOljhY3Qn2ZaE1F9iLiK2jbY/
 1ZUBE8FS4khC5yEEmWQomuLET5rn3usxeyc3PtP7PsqNiofErTzCOBqees7TGDKDcu3cpLpXVK4
 udt/JvRrFR3+xOdOozwT2Kzs+xVx8zX5/TRG/6PqjCcsnT04s0J7t0z48dl7xhYi9TEntrX1uit
 LEXAHCGsdkB1S/F1jrS1fWbflOECzSL/+mpBwpj0RKvrLn0NBIIzp4cMmlkzODAFMcEiQEBDwEH
 paqFGuPV4XXUzMb9I8ujcwxvML1Pqy/UMJbxlKPUMODD2/T0u9szhAx4DOEJRVOegkOMWPVed1M
 ehLCkpQSEjecFUZ9QxaGMFxxhwMbnPurR+WT/thx3I9vli62mhhduwgwDeuqbOZLNuqyoJk2+jL
 1VVxPIhfpuHTum0GiDgZbdwZo84V0c43Lzdb66360Hav+TpQZlzkDEoOfH14faeEIFxXUe6M5QR
 h3kATRj5Oq/N75H3uNR6BSUm85/YB08BwL0pX9a2p2GzZXJsG/xqzuUOAOqlvyEYJ+QUfok+Vq/ VnCfI0skGi2vGhg==
X-Mailer: b4 0.14.2
Message-ID: <20250408-vma-v16-0-d8b446e885d9@google.com>
Subject: [PATCH v16 0/9] Rust support for mm_struct, vm_area_struct, and mmap
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Balbir Singh <balbirs@nvidia.com>
Content-Type: text/plain; charset="utf-8"

This updates the vm_area_struct support to use the approach we discussed
at LPC where there are several different Rust wrappers for
vm_area_struct depending on the kind of access you have to the vma. Each
case allows a different set of operations on the vma.

This includes an MM entry as proposed by Lorenzo:
https://lore.kernel.org/all/33e64b12-aa07-4e78-933a-b07c37ff1d84@lucifer.local/

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v16:
- Rebase on v6.15-rc1.
- Fix conflicts in rust/kernel/miscdevice.rs.
- Rephrase MAINTAINERS entry title to match style from
  https://lore.kernel.org/all/20250326215541.1809379-1-rppt@kernel.org/
- Don't provide mm abstractions on CONFIG_MMU=n. See first patch for more.
- Link to v15: https://lore.kernel.org/r/20250304-vma-v15-0-5c641b31980a@google.com

Changes in v15:
- Add MAINTAINERS entry.
- Pick up new Acked-by and Reviewed-by tags.
- Link to v14: https://lore.kernel.org/r/20250213-vma-v14-0-b29c47ab21f5@google.com

Changes in v14:
- Rename VmArea* to Vma* as suggested by Liam.
- Update a few comments in patch 02.
- Link to v13: https://lore.kernel.org/r/20250203-vma-v13-0-2b998268a396@google.com

Changes in v13:
- Rebase on v6.14-rc1.
- Remove casts that are now unnecessary due to improved Rust/C integer
  type mappings.
- Link to v12: https://lore.kernel.org/r/20250115-vma-v12-0-375099ae017a@google.com

Changes in v12:
- Add additional documentation to modules at the top of mm.rs and virt.rs.
- Explain why the name Mm is used in commit message of patch 1.
- Expand zap_page_range_single with docs suggested by Lorenzo.
- Update safety comment in vm_insert_page
- Mention that VmAreaMixedMap is identical to VmAreaRef except for VM_MIXEDMAP.
- Update docs for as_mixedmap_vma.
- Add additional docs for VmAreaNew struct.
- Rename `get_read` -> `readable` and equivalent for write/exec.
- Use mut pointers for `from_raw` for VMAs.
- Update safety comment for fops_mmap.
- Add additional docs for MiscDevice::mmap.
- Don't introduce and immediately delete mmgrab_current.
- Reduce active_pid_ns comment at Andreas's suggestion and link to get_pid_ns.
- Fix documentation test in rust/kernel/task.rs.
- Fix warning about unused variables in lock_vma_under_rcu when
  CONFIG_PER_VMA_LOCK=n.
- Fix minor typos.
- Link to v11: https://lore.kernel.org/r/20241211-vma-v11-0-466640428fc3@google.com

Changes in v11:
- Add accessor for the vm_mm field of vm_area_struct.
- Pass the file to MiscDevice::mmap for consistency with
  https://lore.kernel.org/r/20241210-miscdevice-file-param-v3-1-b2a79b666dc5@google.com
- Link to v10: https://lore.kernel.org/r/20241129-vma-v10-0-4dfff05ba927@google.com

Changes in v10:
- Update docs for `set_io`.
- Check address in `zap_page_range_single`.
- Completely redo the last patch.
- Link to v9: https://lore.kernel.org/r/20241122-vma-v9-0-7127bfcdd54e@google.com

Changes in v9:
- Be more explicit about VmAreaNew being used with f_ops->mmap().
- Point out that clearing VM_MAYWRITE is irreversible.
- Use __vm_flags to set the flags.
- Use as_ and into_ prefixes for conversions.
- Update lock_vma_under_rcu docs and commit msg
- Mention that VmAreaRef::end is exclusive.
- Reword docs for zap_page_range_single.
- Minor fixes to flag docs.
- Add way to access current->mm without a refcount increment.
- Link to v8: https://lore.kernel.org/r/20241120-vma-v8-0-eb31425da66b@google.com

Changes in v8:
- Split series into more commits to ease review.
- Improve read locks based on Lorenzo's doc: either the mmap or vma lock
  can be used.
- Get rid of mmap write lock because it's possible to avoid the need for
  it.
- Do not allow invalid flag combinations on VmAreaNew.
- Link to v7: https://lore.kernel.org/r/20241014-vma-v7-0-01e32f861195@google.com

Changes in v7:
- Make the mmap read/write lock guards respect strict owner semantics.
- Link to v6: https://lore.kernel.org/r/20241010-vma-v6-0-d89039b6f573@google.com

Changes in v6:
- Introduce VmArea{Ref,Mut,New} distinction.
- Add a second patchset for miscdevice.
- Rebase on char-misc-next (currently on v6.12-rc2).
- Link to v5: https://lore.kernel.org/r/20240806-vma-v5-1-04018f05de2b@google.com

Changes in v5:
- Rename VmArea::from_raw_vma to from_raw.
- Use Pin for mutable VmArea references.
- Go through `ARef::from` in `mmgrab_current`.
- Link to v4: https://lore.kernel.org/r/20240802-vma-v4-1-091a87058a43@google.com

Changes in v4:
- Pull out ARef::into_raw into a separate patch.
- Update invariants and struct documentation.
- Rename from_raw_mm to from_raw.
- Link to v3: https://lore.kernel.org/r/20240801-vma-v3-1-db6c1c0afda9@google.com

Changes in v3:
- Reorder entries in mm.rs.
- Use ARef for mmput_async helper.
- Clarify that VmArea requires you to hold the mmap read or write lock.
- Link to v2: https://lore.kernel.org/r/20240727-vma-v2-1-ab3e5927dc3a@google.com

Changes in v2:
- mm.rs is redesigned from scratch making use of AsRef
- Add notes about whether destructors may sleep
- Rename Area to VmArea
- Link to v1: https://lore.kernel.org/r/20240723-vma-v1-1-32ad5a0118ee@google.com

---
Alice Ryhl (9):
      mm: rust: add abstraction for struct mm_struct
      mm: rust: add vm_area_struct methods that require read access
      mm: rust: add vm_insert_page
      mm: rust: add lock_vma_under_rcu
      mm: rust: add mmput_async support
      mm: rust: add VmaNew for f_ops->mmap()
      rust: miscdevice: add mmap support
      task: rust: rework how current is accessed
      mm: rust: add MEMORY MANAGEMENT [RUST]

 MAINTAINERS               |  13 ++
 rust/helpers/helpers.c    |   1 +
 rust/helpers/mm.c         |  50 +++++
 rust/kernel/lib.rs        |   1 +
 rust/kernel/miscdevice.rs |  45 +++++
 rust/kernel/mm.rs         | 344 +++++++++++++++++++++++++++++++++
 rust/kernel/mm/virt.rs    | 471 ++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/task.rs       | 247 ++++++++++++------------
 8 files changed, 1054 insertions(+), 118 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20240723-vma-f80119f9fb35

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

