Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FCD256C61
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971111; cv=none; b=TReHFCz/u5U4PeBgd1NWC/MZYwKPkwRwV3s2kvGNmkB7kKxw7wqLe/nopQVn0V8Vtt1yMLhBjRbbxGOZS+/LHtrch4LHROnPQyIHxC5hHBhgtVN+dsfCJf2yfJVriXlImGxfQfYHv/OjLTGUH4Rn0oLZ8e+0N/1XnFRNTskUUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971111; c=relaxed/simple;
	bh=cM33UAwyJND5T5KYi+1AyHi1Q2ZMFF8LyUSi11M41rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qLZ9HB3v46Q3HtUh0VZvS66B8hBKQvurc5S09/7O5Jy4LZJj83gJq9ABHr+nmgpWEF80mTKENfk1t1r1zKK5Gt6bBcZhCs16DKQZCdzJF4edRHIRz3Gzv15mQaEpmm4oM8g32yoDBAwNKzGmoQgFY+K5nVZjBpkXE224LNvYSdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gDJZBcnG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gDJZBcnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746971107;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c7dbJlbXPbkcfssQF7d4dE0piRNaAUADT6wmNuA7lGM=;
	b=gDJZBcnGXbxwJmrIUHFBTycDpSC/Y2aS389uOuoH/Ys+6VMH2Rh+aEEbH/P+ftBcXGcGwT
	2j6qIkOO4J9b0oO5fNtWBzVdtIgNcQuAXkT96eGrlr3mocvD60K9CrhBy+gIf7qg0XkcJX
	HWBBgKRCWgEMxk/m1hPQZoGkpNCsUj8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-0V1ygZcaMnCqtqXMVcQzjA-1; Sun, 11 May 2025 09:45:06 -0400
X-MC-Unique: 0V1ygZcaMnCqtqXMVcQzjA-1
X-Mimecast-MFC-AGG-ID: 0V1ygZcaMnCqtqXMVcQzjA_1746971105
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d007b2c79so21651115e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971105; x=1747575905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7dbJlbXPbkcfssQF7d4dE0piRNaAUADT6wmNuA7lGM=;
        b=VxSCBoUv9FMFe8bb7rYGb4qztNZIigisR0AEP3RSm5ZxxsV9teke5mBk1vB7Z3lzbZ
         tTqVjh2ufNfbauu0hLKu6HLzXQFH+tRAZlBj6j4toq25AKwRqCTLtEG3QnVAz8GCdugA
         e/9ZbuuHOH7a15jrlVZjbv4tgND1keRHxetvuFaOfsjAc7HslTCnvhH1Hh4vA2kltJzJ
         GeVbnibKB+a1quPFKKYlXw5bvIKHixaLtvQrV7m6SO/HyaTC/t9ZdWV1xeaPSqO0NZuT
         1Wq2gr+MC4pRmCzuVrOs0Zxv+MdF75MioGdoJNW5TcnmXSj9vDtTu4ZFS+u5vHpxg7eI
         1dmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6IZqTrguUk7iDgNzmZsRaiA5cZFD2c6SdVgb4+Xb2oqBFK3YwlyZ7+MtIeYWIovwcw42fYtW+BrYjPRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYZug+Hh8gEQLvZcaLNahVORAMAbHP40O/WCAA6JKMMKTrhgL0
	jD9XK9ZqWjBrQC+98QSAjsssc4kPFCCGoleeCu88L23YxO2Qi8qGDbV2ph7Cyd20YJEGIjBbGMq
	GR7srN/2bD03tLC9mKOAOURWianHZqrHulQ/0dS5jHhqHPE6N6toB4r7JNcZjJw==
X-Gm-Gg: ASbGncvrzuylyuMusah5wvnUh0jJKeCA/c3FEw1nO57yEjFULJaq7Wbh+VeIhF24ci7
	foKEiKj+iUAFq2ClC6iwzdxy2r2ewgO0wtfgCrVGpvVXQlqIrrGNsk9Nuhqh8luOs18PSm9mFs+
	raHZKNDAat5AAXdeJDr8iuI38KD+QSC+hOEmoBEaviCn3z6DJyPH55w/y681LEY5dt2nWBMLd9W
	yw1+2+M+VRq1oSlbtFfSGuKMLDB0+Whhx0J1I/cPGrUMfzZHOfEssNK/jyIEL19PSuNYVW71M3j
	uBLoLQ==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442e17571f9mr29608735e9.11.1746971105138;
        Sun, 11 May 2025 06:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjugeslMB+OEOMGI+vERZc9KXuo4qMFZSJw2ShVFirM1rKca0gaw9FqmBMO1XA2Pe8SLYXwQ==
X-Received: by 2002:a05:600c:6612:b0:442:e147:bea6 with SMTP id 5b1f17b1804b1-442e17571f9mr29608585e9.11.1746971104721;
        Sun, 11 May 2025 06:45:04 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442e3166b1csm32064655e9.0.2025.05.11.06.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:45:03 -0700 (PDT)
Date: Sun, 11 May 2025 09:44:59 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Gavin Shan <gshan@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 00/20] Change ghes to use HEST-based offsets and add
 support for error inject
Message-ID: <20250511094343-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1741374594.git.mchehab+huawei@kernel.org>

On Fri, Mar 07, 2025 at 08:14:29PM +0100, Mauro Carvalho Chehab wrote:
> Hi Michael,
> 
> I'm sending v8 to avoid a merge conflict with v7 due to this
> changeset:
> 
>    611f3bdb20f7 ("hw/acpi/ghes: Make  static")



Applied 1-13.
Patch 14 needs to apply compat to 10.0 machine type as well.


> As ghes_record_cper_errors() was written since the beginning
> to be public and used by ghes-cper.c. It ended being meged
> earlier because the error-injection series become too big,
> so it was decided last year to split in two to make easier for
> reviewers and maintainers to discuss.
> 
> Anyway, as mentioned on v7, I guess we're ready to merge this
> series, as patches here have been thoughfully reviewed mainly 
> by Igor and Jonathan over the last 5-6 months.
> 
> The only change from v7 is a minor editorial change at HEST doc
> spec, and the addition of Igor and Jonathan's A-B/R-B.
> 
> This series change the way HEST table offsets are calculated,
> making them identical to what an OSPM would do and allowing
> multiple HEST entries without causing migration issues. It open
> space to add HEST support for non-arm architectures, as now
> the number and type of HEST notification entries are not
> hardcoded at ghes.c. Instead, they're passed as a parameter
> from the arch-dependent init code.
> 
> With such issue addressed, it adds a new notification type and
> add support to inject errors via a Python script. The script
> itself is at the final patch.
> 
> ---
> v8:
>   - added a patch to revert recently-added changeset causing a
>     conflict with these. All remaining patches are identical.
> 
> v7:
>   - minor editorial change at the patch updating HEST doc spec
>    with the new workflow
> 
> v6:
> - some minor nits addressed:
>    - use GPA instead of offset;
>    - merged two patches;
>    - fixed a couple of long line coding style issues;
>    - the HEST/DSDT diff inside a patch was changed to avoid troubles
>      applying it.
> 
> v5:
> - make checkpatch happier;
> - HEST table is now tested;
> - some changes at HEST spec documentation to align with code changes;
> - extra care was taken with regards to git bisectability.
> 
> v4:
> - added an extra comment for AcpiGhesState structure;
> - patches reordered;
> - no functional changes, just code shift between the patches in this series.
> 
> v3:
> - addressed more nits;
> - hest_add_le now points to the beginning of HEST table;
> - removed HEST from tests/data/acpi;
> - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> 
> v2: 
> - address some nits;
> - improved ags cleanup patch and removed ags.present field;
> - added some missing le*_to_cpu() calls;
> - update date at copyright for new files to 2024-2025;
> - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> - added HEST and DSDT tables after the changes to make check target happy.
>   (two patches: first one whitelisting such tables; second one removing from
>    whitelist and updating/adding such tables to tests/data/acpi)
> 
> Mauro Carvalho Chehab (20):
>   tests/acpi: virt: add an empty HEST file
>   tests/qtest/bios-tables-test: extend to also check HEST table
>   tests/acpi: virt: update HEST file with its current data
>   Revert "hw/acpi/ghes: Make ghes_record_cper_errors() static"
>   acpi/ghes: Cleanup the code which gets ghes ged state
>   acpi/ghes: prepare to change the way HEST offsets are calculated
>   acpi/ghes: add a firmware file with HEST address
>   acpi/ghes: Use HEST table offsets when preparing GHES records
>   acpi/ghes: don't hard-code the number of sources for HEST table
>   acpi/ghes: add a notifier to notify when error data is ready
>   acpi/generic_event_device: Update GHES migration to cover hest addr
>   acpi/generic_event_device: add logic to detect if HEST addr is
>     available
>   acpi/generic_event_device: add an APEI error device
>   tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
>   arm/virt: Wire up a GED error device for ACPI / GHES
>   qapi/acpi-hest: add an interface to do generic CPER error injection
>   acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
>   tests/acpi: virt: update HEST and DSDT tables
>   docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
>   scripts/ghes_inject: add a script to generate GHES error inject
> 
>  MAINTAINERS                                   |  10 +
>  docs/specs/acpi_hest_ghes.rst                 |  28 +-
>  hw/acpi/Kconfig                               |   5 +
>  hw/acpi/aml-build.c                           |  10 +
>  hw/acpi/generic_event_device.c                |  44 ++
>  hw/acpi/ghes-stub.c                           |   7 +-
>  hw/acpi/ghes.c                                | 233 ++++--
>  hw/acpi/ghes_cper.c                           |  38 +
>  hw/acpi/ghes_cper_stub.c                      |  19 +
>  hw/acpi/meson.build                           |   2 +
>  hw/arm/virt-acpi-build.c                      |  35 +-
>  hw/arm/virt.c                                 |  19 +-
>  hw/core/machine.c                             |   2 +
>  include/hw/acpi/acpi_dev_interface.h          |   1 +
>  include/hw/acpi/aml-build.h                   |   2 +
>  include/hw/acpi/generic_event_device.h        |   1 +
>  include/hw/acpi/ghes.h                        |  51 +-
>  include/hw/arm/virt.h                         |   2 +
>  qapi/acpi-hest.json                           |  35 +
>  qapi/meson.build                              |   1 +
>  qapi/qapi-schema.json                         |   1 +
>  scripts/arm_processor_error.py                | 476 ++++++++++++
>  scripts/ghes_inject.py                        |  51 ++
>  scripts/qmp_helper.py                         | 703 ++++++++++++++++++
>  target/arm/kvm.c                              |   7 +-
>  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
>  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
>  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
>  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
>  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
>  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
>  tests/qtest/bios-tables-test.c                |   2 +-
>  32 files changed, 1695 insertions(+), 90 deletions(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
>  create mode 100644 scripts/arm_processor_error.py
>  create mode 100755 scripts/ghes_inject.py
>  create mode 100755 scripts/qmp_helper.py
>  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> 
> -- 
> 2.48.1
> 

