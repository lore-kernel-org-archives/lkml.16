Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78DE645
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746971165; cv=none; b=agOHcc8dHQOAV9Q0yDYyQDF/Ljy8eZ0Y+bIEhfGcq6PGeZByZIEWRU4GW2uIrteicl1jVhFtm3egdG5NB3iGkF25L/6H1BUP69Mpq9p/drgUxfSImWvsl68kaFswR3n2NCiMwjBjOGsiKcfWEQqSH10APF9Z+T+86X9+G1tUQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746971165; c=relaxed/simple;
	bh=4GBA4p87fjNoRncYXPPmJZ44MPwWta/GXPU9r2zEEc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pM5bsd1wsVliDA2ECyKq0JQ5bdggS/tisuYCvhSelFTLwxQ2tRAk+LBA1hxjCg663QhVifNEWoCOQ4iDMTK5wbtLRJATyToEO6iwxj5xlp9qL1TrqfMKHLnuyW9LriA2vCE+Sqhz/fpvvkl0N1Ky3aNvVco7ujVOTQiLzRr7bIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SUzBbprD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SUzBbprD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746971162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=++4BTrVLtU+bH/DduG/YVrNpWw/0yt4z9p0yidUBYL0=;
	b=SUzBbprDL87jVbtMS96UxwKPKsyAzQX2gAEVJGicZA2+jH7wejuOorbS6M7IOF8l84e+zX
	7hzcOUQqHpkbcv7RwySYXQrqY3VcUKOinPwo/s1Olbkzd7Ajalu/9sFRRE//FMin6n5W8A
	fWXRaMHoqXLQA4S37CvG/YPg9qQcxsQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-jLaubrVfO3SY3mxqRaKIeg-1; Sun, 11 May 2025 09:46:01 -0400
X-MC-Unique: jLaubrVfO3SY3mxqRaKIeg-1
X-Mimecast-MFC-AGG-ID: jLaubrVfO3SY3mxqRaKIeg_1746971160
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso24984005e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 06:46:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746971160; x=1747575960;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++4BTrVLtU+bH/DduG/YVrNpWw/0yt4z9p0yidUBYL0=;
        b=Wkgn06aCQkkDajbsYm/6h2lJXXfb3kaJ1cKIkZ7N1K2Sg4eA9IiLbde1sI8X5cUNyl
         OsLKza4O58Xh/jioYDFVxpoU3JruYA+z/yIKUp7WAoNxMBiAzbRrsGNVtLAobYY7RQFe
         Q2He4AQJ03Jbur/jdCEwcTxetcIsFZQZlRTTdQRUu4nWDqZP6PTbQgKICE2UwUWJrsRk
         ETmozVjQYb6uWwR8D9lEQLKbCwSEiCbp7TDsHX16p+0SKNW+/Rt+Qnc/pX5G45uiL5Ps
         TW2wsOGwz2BFiIfFqcknyg7wJS8bTscWCSs5vjoUMzr00N12G0pyFOhaq51BPSl/FLD2
         vyXg==
X-Forwarded-Encrypted: i=1; AJvYcCWM6nCIOwxfUurPsnryU+oXRLEqWpS/1H9i19XQsJR7hh46HH7NNGPOM06jApDBeH9/0oxFUhYKTqxbEwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeYgKd6ZMeD582QvXgvZJyD3fo9EVWJ2wCg/G5O9lK0T0s/zRs
	oe5NH5GiOKrLjOzKdd2BcnIKni1QD51BIhEhohSSMHc4C9RkgULq7v+Mnvcox3Hnx/TkKELMnoO
	qIMRA6ZVDuk4Q7pKv0vcWIx9pL2pE+2wA+gZz420VC5NpDLVzHa11jqgNYPYuzQ==
X-Gm-Gg: ASbGncvcOitRqPeHWmWzILbyojEFqplZP0IWFqSaiaNvxzOogFu1Jf/xzmjZeYY1D1C
	3DggYey8ba0vJzSlo7sIaLC+U9kP3iEDJ51CecglS9v43kbmHMzlL6LxZ3e13rfKzjJVtRrK31r
	z7GJsw8okiBxelAUYOVmhdvj/MFeZdAp5ZV4jOTqIMoSL8M5VeYeXXQHfYTxHS7OnFppMux6wTM
	22G5CXsXkbAbbz/7Z8MsvZODoO4icFj24FDq5gBmuPFf/hOzSU6tGKRKUKMQPjhDNoCDYC2buJu
	DqT36Q==
X-Received: by 2002:a05:600c:8284:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442d6d1fb3bmr91934435e9.10.1746971160229;
        Sun, 11 May 2025 06:46:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg1Snjzp8begn9I45ToiSojXxDwp/vHKoP5jUyb2OD3rmo2ILs2v5Bo4MPNzqnhClIlKlDtQ==
X-Received: by 2002:a05:600c:8284:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-442d6d1fb3bmr91934185e9.10.1746971159771;
        Sun, 11 May 2025 06:45:59 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d685c2d7sm92530965e9.30.2025.05.11.06.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:45:59 -0700 (PDT)
Date: Sun, 11 May 2025 09:45:55 -0400
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
Message-ID: <20250511094546-mutt-send-email-mst@kernel.org>
References: <cover.1741374594.git.mchehab+huawei@kernel.org>
 <20250511094343-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511094343-mutt-send-email-mst@kernel.org>

On Sun, May 11, 2025 at 09:45:04AM -0400, Michael S. Tsirkin wrote:
> On Fri, Mar 07, 2025 at 08:14:29PM +0100, Mauro Carvalho Chehab wrote:
> > Hi Michael,
> > 
> > I'm sending v8 to avoid a merge conflict with v7 due to this
> > changeset:
> > 
> >    611f3bdb20f7 ("hw/acpi/ghes: Make  static")
> 
> 
> 
> Applied 1-13.
> Patch 14 needs to apply compat to 10.0 machine type as well.

Sorry i meant 1-11.

> 
> > As ghes_record_cper_errors() was written since the beginning
> > to be public and used by ghes-cper.c. It ended being meged
> > earlier because the error-injection series become too big,
> > so it was decided last year to split in two to make easier for
> > reviewers and maintainers to discuss.
> > 
> > Anyway, as mentioned on v7, I guess we're ready to merge this
> > series, as patches here have been thoughfully reviewed mainly 
> > by Igor and Jonathan over the last 5-6 months.
> > 
> > The only change from v7 is a minor editorial change at HEST doc
> > spec, and the addition of Igor and Jonathan's A-B/R-B.
> > 
> > This series change the way HEST table offsets are calculated,
> > making them identical to what an OSPM would do and allowing
> > multiple HEST entries without causing migration issues. It open
> > space to add HEST support for non-arm architectures, as now
> > the number and type of HEST notification entries are not
> > hardcoded at ghes.c. Instead, they're passed as a parameter
> > from the arch-dependent init code.
> > 
> > With such issue addressed, it adds a new notification type and
> > add support to inject errors via a Python script. The script
> > itself is at the final patch.
> > 
> > ---
> > v8:
> >   - added a patch to revert recently-added changeset causing a
> >     conflict with these. All remaining patches are identical.
> > 
> > v7:
> >   - minor editorial change at the patch updating HEST doc spec
> >    with the new workflow
> > 
> > v6:
> > - some minor nits addressed:
> >    - use GPA instead of offset;
> >    - merged two patches;
> >    - fixed a couple of long line coding style issues;
> >    - the HEST/DSDT diff inside a patch was changed to avoid troubles
> >      applying it.
> > 
> > v5:
> > - make checkpatch happier;
> > - HEST table is now tested;
> > - some changes at HEST spec documentation to align with code changes;
> > - extra care was taken with regards to git bisectability.
> > 
> > v4:
> > - added an extra comment for AcpiGhesState structure;
> > - patches reordered;
> > - no functional changes, just code shift between the patches in this series.
> > 
> > v3:
> > - addressed more nits;
> > - hest_add_le now points to the beginning of HEST table;
> > - removed HEST from tests/data/acpi;
> > - added an extra patch to not use fw_cfg with virt-10.0 for hw_error_le
> > 
> > v2: 
> > - address some nits;
> > - improved ags cleanup patch and removed ags.present field;
> > - added some missing le*_to_cpu() calls;
> > - update date at copyright for new files to 2024-2025;
> > - qmp command changed to: inject-ghes-v2-error ans since updated to 10.0;
> > - added HEST and DSDT tables after the changes to make check target happy.
> >   (two patches: first one whitelisting such tables; second one removing from
> >    whitelist and updating/adding such tables to tests/data/acpi)
> > 
> > Mauro Carvalho Chehab (20):
> >   tests/acpi: virt: add an empty HEST file
> >   tests/qtest/bios-tables-test: extend to also check HEST table
> >   tests/acpi: virt: update HEST file with its current data
> >   Revert "hw/acpi/ghes: Make ghes_record_cper_errors() static"
> >   acpi/ghes: Cleanup the code which gets ghes ged state
> >   acpi/ghes: prepare to change the way HEST offsets are calculated
> >   acpi/ghes: add a firmware file with HEST address
> >   acpi/ghes: Use HEST table offsets when preparing GHES records
> >   acpi/ghes: don't hard-code the number of sources for HEST table
> >   acpi/ghes: add a notifier to notify when error data is ready
> >   acpi/generic_event_device: Update GHES migration to cover hest addr
> >   acpi/generic_event_device: add logic to detect if HEST addr is
> >     available
> >   acpi/generic_event_device: add an APEI error device
> >   tests/acpi: virt: allow acpi table changes at DSDT and HEST tables
> >   arm/virt: Wire up a GED error device for ACPI / GHES
> >   qapi/acpi-hest: add an interface to do generic CPER error injection
> >   acpi/generic_event_device.c: enable use_hest_addr for QEMU 10.x
> >   tests/acpi: virt: update HEST and DSDT tables
> >   docs: hest: add new "etc/acpi_table_hest_addr" and update workflow
> >   scripts/ghes_inject: add a script to generate GHES error inject
> > 
> >  MAINTAINERS                                   |  10 +
> >  docs/specs/acpi_hest_ghes.rst                 |  28 +-
> >  hw/acpi/Kconfig                               |   5 +
> >  hw/acpi/aml-build.c                           |  10 +
> >  hw/acpi/generic_event_device.c                |  44 ++
> >  hw/acpi/ghes-stub.c                           |   7 +-
> >  hw/acpi/ghes.c                                | 233 ++++--
> >  hw/acpi/ghes_cper.c                           |  38 +
> >  hw/acpi/ghes_cper_stub.c                      |  19 +
> >  hw/acpi/meson.build                           |   2 +
> >  hw/arm/virt-acpi-build.c                      |  35 +-
> >  hw/arm/virt.c                                 |  19 +-
> >  hw/core/machine.c                             |   2 +
> >  include/hw/acpi/acpi_dev_interface.h          |   1 +
> >  include/hw/acpi/aml-build.h                   |   2 +
> >  include/hw/acpi/generic_event_device.h        |   1 +
> >  include/hw/acpi/ghes.h                        |  51 +-
> >  include/hw/arm/virt.h                         |   2 +
> >  qapi/acpi-hest.json                           |  35 +
> >  qapi/meson.build                              |   1 +
> >  qapi/qapi-schema.json                         |   1 +
> >  scripts/arm_processor_error.py                | 476 ++++++++++++
> >  scripts/ghes_inject.py                        |  51 ++
> >  scripts/qmp_helper.py                         | 703 ++++++++++++++++++
> >  target/arm/kvm.c                              |   7 +-
> >  tests/data/acpi/aarch64/virt/DSDT             | Bin 5196 -> 5240 bytes
> >  .../data/acpi/aarch64/virt/DSDT.acpihmatvirt  | Bin 5282 -> 5326 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.memhp       | Bin 6557 -> 6601 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.pxb         | Bin 7679 -> 7723 bytes
> >  tests/data/acpi/aarch64/virt/DSDT.topology    | Bin 5398 -> 5442 bytes
> >  tests/data/acpi/aarch64/virt/HEST             | Bin 0 -> 224 bytes
> >  tests/qtest/bios-tables-test.c                |   2 +-
> >  32 files changed, 1695 insertions(+), 90 deletions(-)
> >  create mode 100644 hw/acpi/ghes_cper.c
> >  create mode 100644 hw/acpi/ghes_cper_stub.c
> >  create mode 100644 qapi/acpi-hest.json
> >  create mode 100644 scripts/arm_processor_error.py
> >  create mode 100755 scripts/ghes_inject.py
> >  create mode 100755 scripts/qmp_helper.py
> >  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> > 
> > -- 
> > 2.48.1
> > 

