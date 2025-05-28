Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7A228C2C6
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748446940; cv=none; b=q5uSP/RwEhq+PhpdavTxRptX/NKeSPog8IXa+cNAZ2pAV/jT9PvcEziMr/KHPAsUPp1haAGWEmDcuH4qmFcA7OcGP2aYAbMmH2u0hFeaMRowdufF6IpG5BDeoTG5bi9TKKM/pxPgSzLciEwH4VUZGwBBRkwMboUEkX6dhsywN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748446940; c=relaxed/simple;
	bh=HkS4d+IzeZMS7tBXehHuEfl4moAn3ga2VIQfnbEmVBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nkmnNFnvFGsYi7oosjiYpTvE/SBRxzwohx4T2dcEJNH1+JiCvm1jd7Sx2C5K74kiV2K8zuEMHTEqawHm/kvXjAyu8rqDMc1uRUYXKl98I67CGpIhxpkQy803xp/7AxQ/XaEiwBJDL1NhT+eT9NGFmubxlIUcXOOp3I58cCtc4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sf1/vDLj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sf1/vDLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748446937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JkVFHjCN69rMIYnSueLHuwO87ncH71LzvKdYlcB5jDE=;
	b=Sf1/vDLjLg4Sase7XL4gN093yGfnrycbrpKCnFICRavytGBtk3eXXzad/x3trZNuPslhaO
	FS/Rdo4zX1qRUs3z/Fj0kSJpa0x4Gd0+ObxJmfucE8QCXr3Bb6fj/5n0xXU1nwvGc+lzd9
	sJ/lYSiZk8H6+OMy65ErEVnkOMi9ogE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-m1RrOjqYOeimbbmdOYKPrA-1; Wed, 28 May 2025 11:42:16 -0400
X-MC-Unique: m1RrOjqYOeimbbmdOYKPrA-1
X-Mimecast-MFC-AGG-ID: m1RrOjqYOeimbbmdOYKPrA_1748446935
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso34866395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446935; x=1749051735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JkVFHjCN69rMIYnSueLHuwO87ncH71LzvKdYlcB5jDE=;
        b=Xzm64D/pe0dS6PodwF1JJLE9clxW78FTHXkY+oocc+M8O5zqHScHa8RVCiS8ZOi5nq
         dvaTwCkUQQAkCzyY9kwSso1sjBaRkeDyX4Y2AjWECBq5ZCE6HKM7XJg4eUVHfuTbvEnH
         Mt74pAX+TIh2nIv247qDXOQElAA0ZsQoXxDfptyA5bP5zNCIWVLxdN8s8j/xhfvgjCkZ
         ApxKKKV3RCCivBNFHnU/hw/xDnNf7gNYGZdos4qLsjf7IWdHW30ROpXVjE7+8d4LfEc4
         UweRJ5MXOvbV2GzUzrMABJdbfS3Vc2jWWdsPYEVhQFdy581AU3B5vmgge6KGBk6ObLx9
         eO0A==
X-Forwarded-Encrypted: i=1; AJvYcCW77lYDK5EI4KE/R3L2TWPcz1vZRkbZMFbbU5jyEH1JyP9F+VsjPTQrGF0Rlc38m+ir3Iqq4WRq7u+D0Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVimTz3Sr+YAvNaumsGJHdU58LHCWV5zUFnnPLa56lvfDIGq+r
	qtV8iJxPpAmiO42fPar0UjT8aMkujQPNQeBgUNmWv8Gjm1uVG1m5L92h0oyiMD99gf5YOFavtye
	AsS8wP4tz60wVmNZ6+BSFS0UDqjvkXL18yQ2RHKu0kRduLio0s5p86zQIJGV8Y26g7w==
X-Gm-Gg: ASbGncumjQzonJjREb4eQ7d9NMaXzQIADvccWeM7rK4sOobRikIu6vAygSINJPzj+w0
	O5ef1yK+Ujt2FJSrkM746JDD6zaSZ/FMIhRMC4ZXxmXAK1aLyfP1ZtDHcZx0eE1LzIZaYq9Z+ot
	TCI2h8aLT+cbADzN+F6ywKTEaAyzb9DjRrbYKi3c8SqRf7iI4FibCOTmM7Zq2stv1v+i7z4P57t
	oPTFYuMe3Oa+392ZCZneZXyMXQDbXCFyoMwpTCpT9h7YMUG1ymfvak0AnzqnOMIhVUZGdy3X35w
	J16QzkN7P+/p0SVdUtEHedquNX1uSDuw
X-Received: by 2002:a05:600c:4ecc:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-44c941880cbmr198078795e9.10.1748446934784;
        Wed, 28 May 2025 08:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhMhP3AFA8siIQZeA7ho8Lq7zKFRO7eRXp30XQAFRSeMpQ9zxWigwT0rvakMhJPQqK4OZRhg==
X-Received: by 2002:a05:600c:4ecc:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-44c941880cbmr198078455e9.10.1748446934380;
        Wed, 28 May 2025 08:42:14 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1dd785sm25901345e9.39.2025.05.28.08.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:42:13 -0700 (PDT)
Date: Wed, 28 May 2025 17:42:12 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan
 Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 12/20] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
In-Reply-To: <aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 May 2025 08:41:31 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
> from the hardware_errors firmware file.


it doesn't apply to current master anymore


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/generic_event_device.c |  2 ++
>  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
>  hw/core/machine.c              |  5 ++++-
>  3 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index d292f61b4e41..3cf9dab0d01a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> +                     ghes_state.use_hest_addr, false),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index da3ebf403ef9..3126234e657d 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  
>      if (vms->ras) {
>          AcpiGedState *acpi_ged_state;
> +        static const AcpiNotificationSourceId *notify;
> +        unsigned int notify_sz;
>          AcpiGhesState *ags;
>  
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
>          ags = &acpi_ged_state->ghes_state;
>          if (ags) {
>              acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->use_hest_addr) {
> +                notify = hest_ghes_notify_10_0;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> +            } else {
> +                notify = hest_ghes_notify;
> +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> +            }
> +
>              acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> -                            tables->linker, hest_ghes_notify,
> -                            ARRAY_SIZE(hest_ghes_notify),
> +                            tables->linker, notify, notify_sz,
>                              vms->oem_id, vms->oem_table_id);
>          }
>      }
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b8ae155dfa11..dfd36cf063c7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -35,9 +35,12 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
> -GlobalProperty hw_compat_10_0[] = {};
> +GlobalProperty hw_compat_10_0[] = {
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> +};
>  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>  
>  GlobalProperty hw_compat_9_2[] = {

