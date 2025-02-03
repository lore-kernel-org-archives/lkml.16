Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1ED25A656
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738594587; cv=none; b=pLE2O3OWMfD+dH371RuCnndeh1VJ9aPSl+p9QasIvFXzrYwEY++u/W4U2ZNK3HFu1yLhElCSsZC9U/T/AwNWZIPzLRLlqvwtpijhMTxcR8xkjiqWPSg2IaGT3CD+CJ0IKJuJGEVn6VLbvaACSrRBWse8PjuHEshNrUXNBI575y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738594587; c=relaxed/simple;
	bh=YXQzn1p+a9MG1EOkTTFbt4By4FYIlU1oWkJn7J/iWOg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T365Ym3OeFkzcmhmtam/tuVkMqFfPSk9KcUYfFTWs1IaoGYl07BrDIR/ElUSWB+cGxxXPr42YVawuIj+DRLC+YU9RkO/cPeZXKsnnciHPAJnTIKuvZaKS7R+FiOBvxLyP1nuGUQ7FtcHbWgUXdGo4xYJ8pN0bOeUuL9OJhJxX/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L6B/tjOS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L6B/tjOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738594583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpVWyB1VjMpTnWgMvsuey9cqmooTRXL8lylghjWh4bA=;
	b=L6B/tjOSyptdHOksIQ8AQeQLcOpIoRbZG9nilSFjUHAQSpHUGZJcbUAQpKeQCftCF3Wh97
	JimTIMc1d8eBs1s9zZnWm3MaBkZ87n+Ye18g7tFj7ZN4PB5I6zQNFXjgVMIB7p1VR0txGD
	dyD+71kVbCb6MrA3oY9tAhY51vb/1Ao=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-rq4Y5PygN5KY3gcnkA_Z0A-1; Mon, 03 Feb 2025 09:56:22 -0500
X-MC-Unique: rq4Y5PygN5KY3gcnkA_Z0A-1
X-Mimecast-MFC-AGG-ID: rq4Y5PygN5KY3gcnkA_Z0A
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38c5dcb33a5so2858772f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:56:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738594581; x=1739199381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpVWyB1VjMpTnWgMvsuey9cqmooTRXL8lylghjWh4bA=;
        b=n0qAFBGz00x72RCrourR9RuLhCpMpNvWmpRQ8iwwspbzHPrtFJl8u0bi0n5G1cGKjk
         UL25JDQ2Y1ES+ANtTNWvrdc1EIadBR6JfVg/OfXuXKz3oonBdIgz5HpY4NY/cEn7+MsN
         fUc1KYTR2+6/EqHzv3Un7KjugtfSdRx5DtyDZHDytUlX51cYk8v8RoTc45eEjXmRd7N1
         0k3fN9XqAcVjkyD9mgO7pi483j1LYdm6lIVOAmp+WwHiGJZsZjyV1afgjOHXMIV2KQQ4
         wg2G/QAxF1SVRReE28X2ulJ7/8ctFEiH2s3b0/mngLkpux27NQLKuIO0rxrXXu5+QCwv
         3NJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcjHoLp0yOy0kOmnt1HVVitIueSrL2Iz/m/FRogZLyD/ejRjL3AEIuEfdYAUypxz8wy7EXkSfci5E32i0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAM/U4RufyzY8d4AAK3Q5ER6LGqAGwJyTwBT1rD0dExYsbMNW3
	a1KYXFwktznlVpJ6REmw3xhCoXZTGpW6nmnal6LzenmheezbAij8SpNKxG01dvEycOk6aPcaslK
	al1OI4gdKqm1a293xFEAb4jwkBqJQVAxUGyjOZDKuW5fBU95nR7B4OfNXvzstNQ==
X-Gm-Gg: ASbGncvPCDgu2PVsgb9pO4nI4dKmq1ffxo6LNwe7CQC4wDafdFf4+gGhbiQs8AeLwHI
	SzoPEQDJ200TI/hsZiovAQBXSbOmFUQ25gqfxUEYbgAxona9dkXk2jKyyOg3dEpqhcxZceoUzKy
	Pgja62wd80ITEeuTXy88f+fWJX8QIspOJ1ZMXneKZsWmlznZ2zIFJt9IN3Fd4Kum2dl1/0mYpdK
	wGuQw7Z/Gxw33uHwvVdbyPBV28HkeyyRdDRvL+LoGy4jFZqEtFHSjATsqHpLQfNNiZYiY/niGMX
	kmTn2ovrhSPeaH8Ez6gkqJ3YhlNGcpz3hC0UaIwtDU+W6qhZrKnw
X-Received: by 2002:a5d:5f51:0:b0:385:f7d9:99f5 with SMTP id ffacd0b85a97d-38c520af7eemr19926046f8f.51.1738594581207;
        Mon, 03 Feb 2025 06:56:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKsfDmXecYcYAqx65QASumXBo2Ly7hd6gI8lbOCu3S2I5c/7iYMyLCugWP7aHHOPbyZATluQ==
X-Received: by 2002:a5d:5f51:0:b0:385:f7d9:99f5 with SMTP id ffacd0b85a97d-38c520af7eemr19925956f8f.51.1738594579237;
        Mon, 03 Feb 2025 06:56:19 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c102bdbsm12847484f8f.28.2025.02.03.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:56:18 -0800 (PST)
Date: Mon, 3 Feb 2025 15:56:17 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/14] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250203155617.50d25320@imammedo.users.ipa.redhat.com>
In-Reply-To: <0fb474d83bcb4464cf8b23822044688bdc3fd945.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<0fb474d83bcb4464cf8b23822044688bdc3fd945.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 18:42:46 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/acpi/generic_event_device.c |  1 +
>  hw/acpi/ghes.c                 | 17 ++++++-----------
>  hw/arm/virt-acpi-build.c       | 32 ++++++++++++++++++++++++++++----
>  hw/core/machine.c              |  2 ++
>  include/hw/acpi/ghes.h         |  3 ++-
>  5 files changed, 39 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 5346cae573b7..14d8513a5440 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 8f284fd191a6..a91dcd777433 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -359,7 +359,8 @@ static void build_ghes_v2_entry(GArray *table_data,
>  }
>  
>  /* Build Hardware Error Source Table */
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId *notif_source,
>                       int num_sources,
> @@ -369,14 +370,6 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>      uint32_t hest_offset;
>      int i;
> -    AcpiGedState *acpi_ged_state;
> -    AcpiGhesState *ags = NULL;
> -
> -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> -                                                       NULL));
> -    if (acpi_ged_state) {
> -        ags = &acpi_ged_state->ghes_state;
> -    }

hmh, can we move this once within series to the place where it should end up at,
instead of rewriting just added code over again,
somewhere at the being of series (maybe as separate patch)?


>      hest_offset = table_data->len;
>  
> @@ -415,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    if (ags->use_hest_addr) {
> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    }

the same as comment in 3/14, please no flipping back and forth which might
break bisection. Also this hunk looks misplaced and should be a part of 3/14

and do not forget about ACPI_HW_ERROR_ADDR_FW_CFG_FILE, that should be excluded
when use_hest_addr == TRUE

I see that 6/14 does that, but order makes it 
 
>  
>      ags->present = true;
>  }
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d411787fc37..9de51105a513 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -950,10 +954,30 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> -                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
> -                        vms->oem_id, vms->oem_table_id);
> +        static const AcpiNotificationSourceId *notify;
> +        AcpiGedState *acpi_ged_state;
> +        unsigned int notify_sz;
> +        AcpiGhesState *ags;
> +
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +        if (acpi_ged_state) {
> +            ags = &acpi_ged_state->ghes_state;
> +
> +            acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->use_hest_addr) {
> +                notify = hest_ghes_notify_9_2;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);

all 9.2 compat hunks look misplaced,
they have no relation to using HEST addr at all,
they belong to the patches that introduce new error type
i.e. where hest_ghes_notify mutates to 2 entry array.

> +            } else {
> +                notify = hest_ghes_notify;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> +            }
> +
> +            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> +                            tables->linker, notify, notify_sz,
> +                            vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c23b39949649..0d0cde481954 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -34,10 +34,12 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
>  GlobalProperty hw_compat_9_2[] = {
>      {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
>  const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 6c2e57af0456..bfc8fd851648 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -76,7 +76,8 @@ typedef struct AcpiNotificationSourceId {
>      enum AcpiGhesNotifyType notify;
>  } AcpiNotificationSourceId;
>  
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId * const notif_source,
>                       int num_sources,

