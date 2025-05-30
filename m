Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661823373D
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748616550; cv=none; b=blWTvxy7EhOAM5vVs62ksfIb6NUGt0A7u1mPc3mIvOqefUNKNZijWPZOG1kfWaKxtAc6cFLNEbETZR0wsLjcHdJ71voGc4T0gfvmTdjHgfmB5A9e/ABQPHNaybsD7T0dklaMacNk7c8sip/HNdxAfv/zn2kIoQ7U/4Sip5m11Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748616550; c=relaxed/simple;
	bh=xCNfuyvxx6iLo5ulZx8nFYzeb8g6UcIsQlbE2N0TeMs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VwS/DI1UPCMM7i6tSCX2ZT3otJNK41oR0vp8AbhqUegG2DkI9dutuGCY7vZUawSh7fQPXHG5JmomH/ASu1HPlYiMDwAm4i6Ve/LNKE0qeSg8uifxC8XBdxhRfpQs+tlvEVLJX/EIQOglmqZL9R3LGhT/HvJ6jbvczRf4eeXKq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E9gXIZ6G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E9gXIZ6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748616547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nqepNYXQjbf85ZLuzzTPOpz+hwwqGB6HGZsk6zu1D10=;
	b=E9gXIZ6GA5GQ6zC+sYvJKHbDROxGm+JtbsKLxncOCwi8ZqXlXDm+SSkBP1DTgFk+ERfGQ+
	k6rtVlfxKMkEqoV9EOZ5ebdAiBX+r3sZsGrgalaIQoPrGMOSrvq3uIXt/wmVGPkkCOm96k
	HuG7Hnoi7+gBOSo3Vsyf54DwhyH+s0k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-CqSKCk_8P42nE_eFDwES0Q-1; Fri, 30 May 2025 10:49:06 -0400
X-MC-Unique: CqSKCk_8P42nE_eFDwES0Q-1
X-Mimecast-MFC-AGG-ID: CqSKCk_8P42nE_eFDwES0Q_1748616545
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c96c1977so14859235e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748616545; x=1749221345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqepNYXQjbf85ZLuzzTPOpz+hwwqGB6HGZsk6zu1D10=;
        b=o69ZFZrRyxXqhluuxIMBDmqN5BiZU0gVmzwGCXpds2zv13nnMRBPPfrcPAdaBwk0//
         t7+dIHzMjv/iyH+wz/Bi6+e66nRvkNkO3cvVpGGJ5vOCwv4VKJMDg6pU/RHz6nqGeRjk
         gPSTOxqq0wIS3/gjz65/UlLtw6kDeN3LuxZINwPXfNL16wGa6QkBAFbZyExpxMMEkRCn
         LyhEqoe+UbdbsIAn5RX53SNZsSEcwdUraMCTv/oSk1NQicoBCO5oDZFhKdljR036UAsv
         U/LywgthfZbs3t4616UPwkPc5Q4An2IbOZyX0b7iBO29gapJG1/LDK6RXCitepHQKw9w
         Najg==
X-Forwarded-Encrypted: i=1; AJvYcCXmanGs6kY5LLdq57xTDAk/7mbGYBQX2vh5V+zATPqEDccz+EeXtjqm7LvBPiQX2tjOueVHbytWYW3pnl8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfUEt6xJE9ZWblVvyK9eqS0CkvRjLqSx5/ggcfWK1EYJ7VDwn8
	MZTKkFXF2pA25ievFHU2G+mhUxUU6hPrz+a1ygqU/lBqtKjOf35GHLCh249+7lL9028yl8Bvwh2
	pfSfEaFHMR1+PECLFmFnu9VJ1yKQYfX1JMQ1l5QYSYLu7k1bcjfWkas7xraBUb+c8UQ==
X-Gm-Gg: ASbGnctyithZEYM2N8ppEcfdk5blsztCQdyEbt4qULO9QDBrJ3ubkSRvu86ovDLKQ11
	0noK1TwepDahE0xKGsafM24ra4uaeYx27phT/H4W2rq/QIt8FFFMQV0M1MpMxE451Y1fB0sF8m+
	94uidisgvLQ//Mpi8DwdAcVmj9sMMKqdpIvlEK1F05YgZEtTxxb5Xmllp8F6ttt7/cXkB2vL/WM
	Woa5hoGW1uJWFAp/9FP/XvgAS5OBi9y8WBXdi4KqxxKG6RP7v7roLO58pp144lXERTMlMJ8nPn1
	zdro3FEEtLa/SwpEDeNZ6OkSq9pSRzIA
X-Received: by 2002:a05:600c:45cc:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-450d87fd9bemr29521665e9.3.1748616544760;
        Fri, 30 May 2025 07:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1wWSt4EOdCrn3nu9eAYOCpvVHbBH3wN274HNH/BJAXiBBKw/lUmBOmEnT4BiZNKp2UDKduw==
X-Received: by 2002:a05:600c:45cc:b0:44d:a244:4983 with SMTP id 5b1f17b1804b1-450d87fd9bemr29521355e9.3.1748616544335;
        Fri, 30 May 2025 07:49:04 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb051bsm19991885e9.18.2025.05.30.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:49:03 -0700 (PDT)
Date: Fri, 30 May 2025 16:49:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Cameron
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
Message-ID: <20250530164903.0f9f8444@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250530080120-mutt-send-email-mst@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<aa74b756f633dbee5442cf4baa2c1d81a669d2f9.1747722973.git.mchehab+huawei@kernel.org>
	<20250528174212.2823d3de@imammedo.users.ipa.redhat.com>
	<20250530080120-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 May 2025 08:01:28 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, May 28, 2025 at 05:42:12PM +0200, Igor Mammedov wrote:
> > On Tue, 20 May 2025 08:41:31 +0200
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > Create a new property (x-has-hest-addr) and use it to detect if
> > > the GHES table offsets can be calculated from the HEST address
> > > (qemu 10.0 and upper) or via the legacy way via an offset obtained
> > > from the hardware_errors firmware file.  
> > 
> > 
> > it doesn't apply to current master anymore  
> 
> indeed. Mauro?

Michael,
it's trivial conflict in machine compat,
could you fix it up while applying?

we have another series in queue that depends on this one being in merged. 

> 
> >   
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > >  hw/acpi/generic_event_device.c |  2 ++
> > >  hw/arm/virt-acpi-build.c       | 18 ++++++++++++++++--
> > >  hw/core/machine.c              |  5 ++++-
> > >  3 files changed, 22 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> > > index d292f61b4e41..3cf9dab0d01a 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -318,6 +318,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
> > >  
> > >  static const Property acpi_ged_properties[] = {
> > >      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> > > +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState,
> > > +                     ghes_state.use_hest_addr, false),
> > >  };
> > >  
> > >  static const VMStateDescription vmstate_memhp_state = {
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index da3ebf403ef9..3126234e657d 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -893,6 +893,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
> > >      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > >  };
> > >  
> > > +static const AcpiNotificationSourceId hest_ghes_notify_10_0[] = {
> > > +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> > > +};
> > > +
> > >  static
> > >  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >  {
> > > @@ -947,15 +951,25 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> > >  
> > >      if (vms->ras) {
> > >          AcpiGedState *acpi_ged_state;
> > > +        static const AcpiNotificationSourceId *notify;
> > > +        unsigned int notify_sz;
> > >          AcpiGhesState *ags;
> > >  
> > >          acpi_ged_state = ACPI_GED(vms->acpi_dev);
> > >          ags = &acpi_ged_state->ghes_state;
> > >          if (ags) {
> > >              acpi_add_table(table_offsets, tables_blob);
> > > +
> > > +            if (!ags->use_hest_addr) {
> > > +                notify = hest_ghes_notify_10_0;
> > > +                notify_sz = ARRAY_SIZE(hest_ghes_notify_10_0);
> > > +            } else {
> > > +                notify = hest_ghes_notify;
> > > +                notify_sz = ARRAY_SIZE(hest_ghes_notify);
> > > +            }
> > > +
> > >              acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> > > -                            tables->linker, hest_ghes_notify,
> > > -                            ARRAY_SIZE(hest_ghes_notify),
> > > +                            tables->linker, notify, notify_sz,
> > >                              vms->oem_id, vms->oem_table_id);
> > >          }
> > >      }
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index b8ae155dfa11..dfd36cf063c7 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -35,9 +35,12 @@
> > >  #include "hw/virtio/virtio-pci.h"
> > >  #include "hw/virtio/virtio-net.h"
> > >  #include "hw/virtio/virtio-iommu.h"
> > > +#include "hw/acpi/generic_event_device.h"
> > >  #include "audio/audio.h"
> > >  
> > > -GlobalProperty hw_compat_10_0[] = {};
> > > +GlobalProperty hw_compat_10_0[] = {
> > > +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
> > > +};
> > >  const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
> > >  
> > >  GlobalProperty hw_compat_9_2[] = {  
> 

