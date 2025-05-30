Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35426D299
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748606499; cv=none; b=UKe8rL9Wy1jFyI3eL4b3/9AJqIMLqVoYwL+G8U32J/TgORPyPz6ET2bAgqnixewifQpOzRUPKEUkS4UJ4JgO6GrYjxtJ9VQPbAmDAWDTGBBAH2+n1pH4XPPDMrDQcz8vn2EQaj3Z0Be7m5LmwjoBGzVGxO4/O9ThfHx0LXvmf74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748606499; c=relaxed/simple;
	bh=ssBU7ew2CyurUUHd3fgFEYsdYoHHLH9PeUvxnIJsnCk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZ+v7wrxZ4undNCYt+lbM8xyNo2gUVjM7/VKMDspt11cJCbcXIliAsBpUtjy4pruch16N3rFCVWs22aAKDrWXmkt6NT94tQ2ueTI/OHT8CpA2hQB/8kcdVVVwbl8OQIlKEeBU8wLUNdjF+xbRUwYySK7XIuxlCQg8r76xBJ/zoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CL6A4bzA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CL6A4bzA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748606496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+WPaWb2DBUzybHtEtz5+SIZgM6ykPPLxKGgnQITZGiM=;
	b=CL6A4bzAkKdGySR7tuFX9HdB8tMJIaLsISVJe1Jf5DBTFSJXUMn6d+DiKU5P8szVOXaBWA
	NXDvnA1t/kxa1suukX6/R+ZmDh6ERC4Yhk5pMTPDfScJwtYsNC0SQ35kup/o9y0JmMA2SZ
	yf1nFHKEZN4nYcN8okiHIF3mZdABFNs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-ELLxJ_qzM5ahNlU3akBRkA-1; Fri, 30 May 2025 08:01:34 -0400
X-MC-Unique: ELLxJ_qzM5ahNlU3akBRkA-1
X-Mimecast-MFC-AGG-ID: ELLxJ_qzM5ahNlU3akBRkA_1748606493
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a1f6c5f4f2so800596f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748606493; x=1749211293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WPaWb2DBUzybHtEtz5+SIZgM6ykPPLxKGgnQITZGiM=;
        b=EfmE68RGZrmfmH/w7yDt6LNqnl8FpPo7w9bNEFwHdxS7MHzJJAdgAixpiwq6SmmzmV
         qSKI8i+Lwzet6gefu7PEghEdbBEaYtCwRQbAjjXJnvt6L6goDRfPAyOKESjsN+L7VhYN
         Bds/GjjTDwszcMHeKNndQWAChuoALG6YGolyTvnLmgFvXl9HlTKjep6AiCru0JRxpK0Y
         tlfSvvrUoHIalOxet65amlccw7Bxkl3YqCnvWrlKYxwctDr2IvIWahwhr8f0416pTQha
         scvyVPGDFU1xtkhr+Rv1VmOEVwNjrPIeMS5NTzRo6HB+lThf5vo0UCRIpwtushRWMkpH
         KzPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmcxF/RacQo0sVSp7wzxnRvXp+1ZFR+w/uDPc7196KCOSbnqyyNyov4zxka/6uDps17h/WnNouYKcTFIg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xHivFCcQwK7S06n9pJ/CxbFBLtIlk1gVf3doYUY6pvkeh54C
	/OxBDqgqtFPdWLcOU5LkDZ07Tlb7159FmUSsY6aUpqWtj3VnGB0V7aLddJvmre0NMg/CVVjbyB3
	hj0PLEy7Q0BQLceWKwZgOj5TinXzE3w+kFiNhVt1uG5X4jpj6yYfGbeATGYiYy/5Cnw==
X-Gm-Gg: ASbGnctZoOlpxxfJiFxvXyf5V8EbY+aGAqIMEDKJyGaZBXNuEOxJonCwAVlbVyRFaeI
	ljaA6o7oFj2GsUm7zw1OzmcJfazgsfKqzheRBIVv0NM4FZQuRoUZCGYaIdN81ZnqYvJsAgFoQBR
	y0IQApVZdsOsynQiTfvGDv1xuoAcKoKK61m7vKJaYUQIvxWNUIDtjvN0AQLDKanrAP38thVa426
	TdZWx+KKCIdlq6ePAmSKsxZG+RpPB4Mrm33sstr0ZaYQ3nvX/E262TxmlaDs/NuKgwUBnOcyCEM
	o2wD3A==
X-Received: by 2002:a05:6000:4023:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a4f89a7defmr1467419f8f.6.1748606493157;
        Fri, 30 May 2025 05:01:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1gVcqHAhAJ9QWvV4I/CcNLL95rHuwb8avC98d08tABfzwj9pgURbSqB3ZvasaIXJegFy+Dg==
X-Received: by 2002:a05:6000:4023:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3a4f89a7defmr1467369f8f.6.1748606492597;
        Fri, 30 May 2025 05:01:32 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe5b7b0sm4698399f8f.10.2025.05.30.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 05:01:31 -0700 (PDT)
Date: Fri, 30 May 2025 08:01:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Ani Sinha <anisinha@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250530080120-mutt-send-email-mst@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
 <aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
 <20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528174212.2823d3de@imammedo.users.ipa.redhat.com>

On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:
> On Tue, 20 May 2025 08:41:31 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Create a new property (x-has-hest-addr) and use it to detect if
> > the GHES table offsets can be calculated from the HEST address
> > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > from the hardware_errors firmware file.
> 
> 
> it doesn't apply to current master anymore

indeed. Mauro?

> 
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  hw/acpi/generic_event_device.c |  2 ++
> >  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
> >  hw/core/machine.c              |  5 ++++-
> >  3 files changed, 22 insertions(+), 3 deletions(-)
> > 
> > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > index d292f61b4e41..3cf9dab0d01a 100644
> > --- a/hw/acpi/generic_event_device.c
> > +++ b/hw/acpi/generic_event_device.c
> > @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> >  
> >  static const Property acpi_ged_properties[] = {
> >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> > +                     ghes_state.use_hest_addr, false),
> >  };
> >  
> >  static const VMStateDescription vmstate_memhp_state = {
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index da3ebf403ef9..3126234e657d 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
> >      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> >  };
> >  
> > +static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> > +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > +};
> > +
> >  static
> >  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >  {
> > @@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >  
> >      if (vms->ras) {
> >          AcpiGedState *acpi_ged_state;
> > +        static const AcpiNotificationSourceId *notify;
> > +        unsigned int notify_sz;
> >          AcpiGhesState *ags;
> >  
> >          acpi_ged_state = ACPI_GED(vms->acpi_dev);
> >          ags = &acpi_ged_state->ghes_state;
> >          if (ags) {
> >              acpi_add_table(table_offsets, tables_blob);
> > +
> > +            if (!ags->use_hest_addr) {
> > +                notify = hest_ghes_notify_10_0;
> > +                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> > +            } else {
> > +                notify = hest_ghes_notify;
> > +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> > +            }
> > +
> >              acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> > -                            tables->linker, hest_ghes_notify,
> > -                            ARRAY_SIZE(hest_ghes_notify),
> > +                            tables->linker, notify, notify_sz,
> >                              vms->oem_id, vms->oem_table_id);
> >          }
> >      }
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index b8ae155dfa11..dfd36cf063c7 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -35,9 +35,12 @@
> >  #include "hw/virtio/virtio-pci.h"
> >  #include "hw/virtio/virtio-net.h"
> >  #include "hw/virtio/virtio-iommu.h"
> > +#include "hw/acpi/generic_event_device.h"
> >  #include "audio/audio.h"
> >  
> > -GlobalProperty hw_compat_10_0[] = {};
> > +GlobalProperty hw_compat_10_0[] = {
> > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > +};
> >  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
> >  
> >  GlobalProperty hw_compat_9_2[] = {

