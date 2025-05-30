Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7E7165F13
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615769; cv=none; b=kA8yxN/P70kKTyUslq4QnJ2XouzlDqvuTwPKxbn4ndiIeJLPqjhc4mSsdFvCF0bRcXDp5GqXhSY3fZKp9g5WqXlxwiNqhZYpnYAkt/mtA93rr9jxPzLz4RDYP+yaMi94MLgspO/g+neJ56RyPGj6JUwBTFDcI7H4deOeGEo7A9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615769; c=relaxed/simple;
	bh=27JjugbWAkMyhqdjxxJD5MX+cgMWdDlMfl0Uvy8Dgac=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K+Cl4wDf2RKt6DIrydo6A78HDn8t/Pk0rHbQPu0UddnQbyhZTJdyKHJ/0act2bIdx9pobO1MyGq/5BAfGth1SG4dhKbI+nZWPEE7jqT+KAoxlxWEBzfn39DAvH2p2WqqaEQfHw57BI8r5yxVs4kpqlLDjYrW7AvDe34gbUzcUrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6As4DWo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6As4DWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748615766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b/a5/vGJlf6FRqZe0d0YrCOWXV3mq8ZW9W/UpoyL/gU=;
	b=c6As4DWoR3vIgRp++U5XTcdC8weVtj7mvaJRVnnbN7vip/5C5OIMEi42HnbMWrTs5Vl4qJ
	m1rkcePifzl/HqEYzqydBH2qPH4flEEpsAVvuBrTVnxIDt7nxqG5zvjGzfocsxuDanavo4
	eOvedJYW1w/WdiKJSvtAaUxuev6qThA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-Upi_9UgQMRuQCeKNUfkzbw-1; Fri, 30 May 2025 10:36:04 -0400
X-MC-Unique: Upi_9UgQMRuQCeKNUfkzbw-1
X-Mimecast-MFC-AGG-ID: Upi_9UgQMRuQCeKNUfkzbw_1748615763
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d50eacafso8322895e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615763; x=1749220563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/a5/vGJlf6FRqZe0d0YrCOWXV3mq8ZW9W/UpoyL/gU=;
        b=pBU88Cm8nZf4yF8kZbendU7w7uIqE+bzk0m9lenzGGfSH2P0/P5yRhsHOxLuPbOGc+
         K2UxqbOl9adog17T9F2BUeOmdp2M07bl5ZEO0L2ulFyJTcnxQhb9dP35AApScZDHJjr7
         2DuqULMZDAD0kOdmmvOxoKlvPwS9Uu73E1ZGDC4cYk4HN1BiLIzcL2anDjuB51i656xo
         Aw7PfJIJoGKrWk6Ms9z9FOj9NK9ShplxjDWsR8sfntSi0hzVdtS6ELz6zHqEhE+MPT9u
         iJfoTnNKo0v6Qq/PcZ7tARLjJGL31VVlxnSU7xfX5ikpP26Wij7KglDeFoN1BnwhkzTW
         KRDg==
X-Forwarded-Encrypted: i=1; AJvYcCW4B9hZvWT9Gj7bG6TtAICfCOoH+YSAxShhpJDdeBpKogAe8lqaISQZzPASNrdCaMwVDtWM5d8mcscmsII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEUWvUZIhIqaDMBMNeKQG/fR8C50C0KMzI2RjmG0Mf/nUkyIZi
	jRg+Zrv7RMCiqTVKrKhobIbWjsIkb6LzW931A0H800hbYnVgOL3cY2AygoYlESZE2RtHNq6CgGo
	ANRbxAtElMN03U2ejJoDjoIgmC78ybGHaMCMcuW2ADfJgq9iLM99j9Ga2XhzblmERnA==
X-Gm-Gg: ASbGncsnoDlaz2kLqtAlMHwcU1xuRHF6JRmvq6EgHiauam6dlFUgd4uMC+3dd5FgmiW
	JluuebBAOKSz/OYXRDqH2F6vpZzuxs5ddhjXNW9RzI8+/RajLdDOp3HLNh19ApqWVPmGoU1xESF
	gXN/y1GeZlVhnTGN+xNenHX06JHU3TRaCRg7ARe1iz3kz6I2Azf36DyD+ML2Fp8z2FIxHDLMEKQ
	o8Htqp/ungRMWQx72lLYAX5Nfr8Y3XKuLytey/EMOJHZN13aPIA8w8NAD0c2OsmAvAm2lSmPku/
	72dLbkUKhbOxfW+FOJ1OQntYIYYfpBBp
X-Received: by 2002:a05:600c:8b68:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-450d651182fmr45228785e9.10.1748615763048;
        Fri, 30 May 2025 07:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV3HJ8ILb3aqwl8Zpd/iyskFtiwxOT/H5EXz/BdpsSQTWkKiiuGboUgNaAOEqcUU7F2TbGtg==
X-Received: by 2002:a05:600c:8b68:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-450d651182fmr45228485e9.10.1748615762654;
        Fri, 30 May 2025 07:36:02 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa249esm19938405e9.13.2025.05.30.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:36:02 -0700 (PDT)
Date: Fri, 30 May 2025 16:35:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] acpi/ghes: move use_hest_addr out of
 acpi_build_hest()
Message-ID: <20250530163558.2182fcb3@imammedo.users.ipa.redhat.com>
In-Reply-To: <e1abcd0e1c5b66d91a7faed5b4147951c11b2e6d.1741094512.git.mchehab+huawei@kernel.org>
References: <cover.1741094512.git.mchehab+huawei@kernel.org>
	<e1abcd0e1c5b66d91a7faed5b4147951c11b2e6d.1741094512.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Mar 2025 14:30:56 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The only reason why we're passing ags to acpi HEST table build
> is to check if migration will be used or not.
> 
> Well, we only need migration for arm, as other architectures
> will only use the new code. So, move this out of acpi_build_hest(),

> as otherwise we can't use it for x86, as the hotplug logic there
> may not initialize ags during acpi table build time.

can you expand on what hotplug logic you are talking about?

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c           | 16 ++++++++--------
>  hw/arm/virt-acpi-build.c | 12 ++++++++----
>  include/hw/acpi/ghes.h   | 25 +++++++++++++------------
>  3 files changed, 29 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 1fd5ba941771..ea00fed75c16 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -243,7 +243,7 @@ ghes_gen_err_data_uncorrectable_recoverable(GArray *block,
>   * Initialize "etc/hardware_errors" and "etc/hardware_errors_addr" fw_cfg blobs.
>   * See docs/specs/acpi_hest_ghes.rst for blobs format.
>   */
> -static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
> +static void build_ghes_error_table(GArray *hardware_errors, bool use_hest_addr,
>                                     BIOSLinker *linker, int num_sources)
>  {
>      int i, error_status_block_offset;
> @@ -289,7 +289,7 @@ static void build_ghes_error_table(AcpiGhesState *ags, GArray *hardware_errors,
>                                         i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
>      }
>  
> -    if (!ags->use_hest_addr) {
> +    if (!use_hest_addr) {
>          /*
>           * Tell firmware to write hardware_errors GPA into
>           * hardware_errors_addr fw_cfg, once the former has been initialized.
> @@ -372,7 +372,7 @@ static void build_ghes_v2_entry(GArray *table_data,
>  }
>  
>  /* Build Hardware Error Source Table */
> -void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +void acpi_build_hest(GArray *table_data, bool use_hest_addr,
>                       GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId *notif_source,
> @@ -386,7 +386,7 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>  
>      hest_offset = table_data->len;
>  
> -    build_ghes_error_table(ags, hardware_errors, linker, num_sources);
> +    build_ghes_error_table(hardware_errors, use_hest_addr, linker, num_sources);
>  
>      acpi_table_begin(&table, table_data);
>  
> @@ -398,7 +398,7 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>  
>      acpi_table_end(linker, &table);
>  
> -    if (ags->use_hest_addr) {
> +    if (use_hest_addr) {
>          /*
>           * Tell firmware to write into GPA the address of HEST via fw_cfg,
>           * once initialized.
> @@ -411,13 +411,13 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> -                          GArray *hardware_error)
> +                          bool use_hest_addr, GArray *hardware_error)
>  {
>      /* Create a read-only fw_cfg file for GHES */
>      fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
>                      hardware_error->len);
>  
> -    if (ags->use_hest_addr) {
> +    if (use_hest_addr) {
>          fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
>              NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
>      } else {
> @@ -529,7 +529,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>          return;
>      }
>  
> -    if (!ags->use_hest_addr) {
> +    if (ags->hw_error_le) {
>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
>      } else {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 154337e1a77b..71da17b652b2 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -964,9 +964,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
>          ags = &acpi_ged_state->ghes_state;
>          if (ags) {
> +            bool use_hest_addr = ags->use_hest_addr;
> +
>              acpi_add_table(table_offsets, tables_blob);
>  
> -            if (!ags->use_hest_addr) {
> +            if (!use_hest_addr) {
>                  notify = hest_ghes_notify_9_2;
>                  notify_sz = ARRAY_SIZE(hest_ghes_notify_9_2);
>              } else {
> @@ -974,7 +976,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>                  notify_sz = ARRAY_SIZE(hest_ghes_notify);
>              }
>  
> -            acpi_build_hest(ags, tables_blob, tables->hardware_errors,
> +            acpi_build_hest(tables_blob, use_hest_addr, tables->hardware_errors,
>                              tables->linker, notify, notify_sz,
>                              vms->oem_id, vms->oem_table_id);
>          }
> @@ -1143,8 +1145,10 @@ void virt_acpi_setup(VirtMachineState *vms)
>      if (vms->ras) {
>          assert(vms->acpi_dev);
>          acpi_ged_state = ACPI_GED(vms->acpi_dev);
> -        acpi_ghes_add_fw_cfg(&acpi_ged_state->ghes_state,
> -                             vms->fw_cfg, tables.hardware_errors);
> +        AcpiGhesState *ags = &acpi_ged_state->ghes_state;
> +
> +        acpi_ghes_add_fw_cfg(ags, vms->fw_cfg, ags->use_hest_addr,
> +                             tables.hardware_errors);
>      }
>  
>      build_state->rsdp_mr = acpi_add_rom_blob(virt_acpi_build_update,
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index df2ecbf6e4a9..eae6d4d0a562 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -73,31 +73,32 @@ typedef struct AcpiNotificationSourceId {
>      enum AcpiGhesNotifyType notify;
>  } AcpiNotificationSourceId;
>  
> -/*
> - * AcpiGhesState stores GPA values that will be used to fill HEST entries.
> +/**
> + * struct AcpiGhesState - GPA values that will be used to fill HEST entries
>   *
> - * When use_hest_addr is false, the GPA of the etc/hardware_errors firmware
> - * is stored at hw_error_le. This is the default on QEMU 9.x.
> + * @hest_addr_le: GPA of the HEST table. Used on QEMU 10.x and above.
> + * @hw_error_le: GPA of the etc/hardware_errors firmware.
> + *               Used only on arm64 virt-9.x to preserve compatibility
> + *               with QEMU 9.x.
> + * @use_hest_addr: True if HEST address is present. Used only on arm64,
> + *                 to identify if QEMU 9.x migration is needed.
>   *
> - * When use_hest_addr is true, the GPA of the HEST table is stored at
> - * hest_addr_le. This is the default for QEMU 10.x and above.
> - *
> - * Whe both GPA values are equal to zero means that GHES is not present.
> + * When both GPA values are equal to zero means that GHES is not present.
>   */
>  typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
> -    bool use_hest_addr; /* True if HEST address is present */
> +    bool use_hest_addr;
>  } AcpiGhesState;
>  
> -void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +void acpi_build_hest(GArray *table_data, bool use_hest_addr,
>                       GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId * const notif_source,
>                       int num_sources,
>                       const char *oem_id, const char *oem_table_id);
> -void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
> -                          GArray *hardware_errors);
> +void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> +                          bool use_hest_addr, GArray *hardware_error);
>  int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
>                              uint64_t error_physical_addr);
>  void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,

