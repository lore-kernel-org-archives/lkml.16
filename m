Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06600210191
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593274; cv=none; b=CwYMv2CsVRgwvac7ENXw3o5abq1Bv+TFPrfXedlbyDjrRUMrSvdUPbbU6IlRxFvjrr959QsD/zLYVquARhCRRdZ3bx5E6BBVjPWp8ldVDHEqXLMyOTmPGfWvxyLpHdaqk07vUfMM/MHbJCcDH5gRKTdle44X75r5fOSZUSL+Tr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593274; c=relaxed/simple;
	bh=PEylN40ovPvqu66thVvU2Yc1ghDNMElRKhlE7s7Zuqw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IdmaDW+Ps1LGM2ncmUHrnaVl+5QxUAPFD27mUdv4mEooA/Xtdc2ANc8XC9E8BvIoQVqrwDOJhNFVgs+eX44mMq5WZB+E0K31oFBtKkfcm5DL0G1nmhzwx2q3Ul+RqIQpisckyTLO6CQzQ3481ZGokqFPTuRuPGMNBQZWzttL23A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjHmF0d7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjHmF0d7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738593271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F42ZWEZSjDs8muCcZtEdgyHtqWloh4W/QCbSOShskaM=;
	b=RjHmF0d7JAAZsBGms0RFNuseAXvsvLwYheT+TLnYbti/Uink6cXdYvwKxVfrRUHXgAWVYQ
	xChwaKjaHipFOM31a3ttGDMQdki1o7ZA496tWO1ilD83GhY9w0TZFJS3GMUsZAD9O1NCvH
	AxuadoAi4tHpXEKQlrz3cPUv86aWdkg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-KZpqLk5QPsSspZseuzqX0w-1; Mon, 03 Feb 2025 09:34:27 -0500
X-MC-Unique: KZpqLk5QPsSspZseuzqX0w-1
X-Mimecast-MFC-AGG-ID: KZpqLk5QPsSspZseuzqX0w
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38a2140a400so3079710f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 06:34:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738593266; x=1739198066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F42ZWEZSjDs8muCcZtEdgyHtqWloh4W/QCbSOShskaM=;
        b=F6D5d7fw3teiWKzUOovxtW/tHLHBhS52BLDQXBA8/xB/in2nYMywhQckd5z8t3GmV0
         qIifeCgfiBod5GhxKSsJjkt7Qj1QiGuyVjQAaf7cFrbosWcSSRh8+uB/u2Pno+hoH08s
         vEPxS43NWnM/wMJX/DS1WXB+PRcYsdTEV+eLxHkXSCQK8+kHk62grbf3udEf41QqmMW5
         y72KBu+/C6nUHHMQUX4pKgErgrNdgPlUDSBbwiIn2cWtyYEvIvJ62ts94/BulwBImHk8
         3Ozzf+QCtINOlfkVrNxmtmGSLbJIgwUYwA5I44cfC9aKCptEdBn45FdTQqZDEIXRPHBx
         69HA==
X-Forwarded-Encrypted: i=1; AJvYcCWHiao1bUe4y617mRPMLem034tQeAsTDcQX43CqikveD7BpqhyopBeLf0JQw5nrbZrNs59WvMcuBFwR6iI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrk09s82m9KXlJFnGfrbdCewYHousz5+YPafnGKIBECinKAbIi
	rbp/8ek9ebzLEACcUFJM1ptMZopUkABq/RjAvW9mx6J6ZyW6uyCzhPSwAXUwWhVXFwlbhHTdNRt
	p1m6O+F5JGEFXF5R+LO+Wxytz8L9NPm2O09MrAbmf804u7OBGxJ65sFaeE/qD2Q==
X-Gm-Gg: ASbGncu8Oa0mE0uzHc1oO39+kmYL88BMjaqslWrd2IrYws8u3YSCRUyfcFjWOBppJab
	SSQDSgzy3C7d7mMWOr8dmsCTDpMmmJL3W1cztsb7OHAyBBMvbCG1apb0Xg/lWHjLKlxHkv6scA8
	ffGnPRLBJZPzFusoV4e5cenrYCE9wrs425NeU4d3H6tTHYEJqet1SUvWw2Mm/n/9EiJ3ptynrLb
	lk/jqvf6Y4HjsZyfXsiGC3pNbQpcJtKsLDU5chP/s4Jsqzy7RG4fSfGcRsk2CpFPQchgkbeEtgY
	i8na2aa9CWxRD3M9w8u5W4xo6Ji/S7a2E0UHTA2rw8fFdb16EiXR
X-Received: by 2002:a5d:5f91:0:b0:38c:617c:ee23 with SMTP id ffacd0b85a97d-38c617cf0b6mr12208914f8f.41.1738593266258;
        Mon, 03 Feb 2025 06:34:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHtVY45PGtIr0pSxyki41xnGwS70JYyXOCj1wQAyEUNvYcO14qC4i5UKTzGOoJhapWajfMvcw==
X-Received: by 2002:a5d:5f91:0:b0:38c:617c:ee23 with SMTP id ffacd0b85a97d-38c617cf0b6mr12208877f8f.41.1738593265718;
        Mon, 03 Feb 2025 06:34:25 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23deedfsm159552995e9.16.2025.02.03.06.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 06:34:25 -0800 (PST)
Date: Mon, 3 Feb 2025 15:34:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250203153423.3e4de17c@imammedo.users.ipa.redhat.com>
In-Reply-To: <9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 18:42:44 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are two pointers that are needed during error injection:
> 
> 1. The start address of the CPER block to be stored;
> 2. The address of the ack.
> 
> It is preferable to calculate them from the HEST table.  This allows
> checking the source ID, the size of the table and the type of the
> HEST error block structures.
> 
> Yet, keep the old code, as this is needed for migration purposes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c         | 132 ++++++++++++++++++++++++++++++++++++-----
>  include/hw/acpi/ghes.h |   1 +
>  2 files changed, 119 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 27478f2d5674..8f284fd191a6 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -41,6 +41,12 @@
>  /* Address offset in Generic Address Structure(GAS) */
>  #define GAS_ADDR_OFFSET 4
>  
> +/*
> + * ACPI spec 1.0b
> + * 5.2.3 System Description Table Header
> + */
> +#define ACPI_DESC_HEADER_OFFSET     36
> +
>  /*
>   * The total size of Generic Error Data Entry
>   * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> @@ -61,6 +67,25 @@
>   */
>  #define ACPI_GHES_GESB_SIZE                 20
>  
> +/*
> + * Offsets with regards to the start of the HEST table stored at
> + * ags->hest_addr_le,

If I read this literary, then offsets above are not what
declared later in this patch.
I'd really drop this comment altogether as it's confusing,
and rather get variables/macro naming right

> according with the memory layout map at
> + * docs/specs/acpi_hest_ghes.rst.
> + */

what we need is update to above doc, describing new and old ways.
a separate patch.

> +
> +/*
> + * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
      ^^^^^^^^ - wrt version, I see it in 6.1.
      our req is to point to the earliest doc where it has appeared.
      it it must point to a later version for some justified reason
      the explanation 'why' should be mentioned in comment message.

please check all versioning/chapters you are touching/adding in this series.


> + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> + */
> +#define HEST_GHES_V2_TABLE_SIZE  92

it's not table but rather an GHES_V2 entry in HEST
and should be named as such (emph on _entry_)

> +#define GHES_READ_ACK_ADDR_OFF          64
please, add a comment like below but for 'Read Ack Register'


> +/*
> + * ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
> + * Table 18-380: 'Error Status Address' field
> + */
> +#define GHES_ERR_STATUS_ADDR_OFF  20
> +
>  /*
>   * Values for error_severity field
>   */
> @@ -212,14 +237,6 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
>  {
>      int i, error_status_block_offset;
>  
> -    /*
> -     * TODO: Current version supports only one source.
> -     * A further patch will drop this check, after adding a proper migration
> -     * code, as, for the code to work, we need to store a bios pointer to the
> -     * HEST table.
> -     */
> -    assert(num_sources == 1);
> -
>      /* Build error_block_address */
>      for (i = 0; i < num_sources; i++) {
>          build_append_int_noprefix(hardware_errors, 0, sizeof(uint64_t));
> @@ -352,6 +369,14 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
>      uint32_t hest_offset;
>      int i;
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags = NULL;
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +    if (acpi_ged_state) {
> +        ags = &acpi_ged_state->ghes_state;
> +    }
>  
>      hest_offset = table_data->len;
>  
> @@ -371,10 +396,12 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>       * Tell firmware to write into GPA the address of HEST via fw_cfg,
>       * once initialized.
>       */
> -    bios_linker_loader_write_pointer(linker,
> -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> +    if (ags->use_hest_addr) {
> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }

I'd move this patch before 2/14, to avoid issues during bisection.

Also legacy variant is hidden in build_ghes_error_table()

    /*                                                                           
     * tell firmware to write hardware_errors GPA into                           
     * hardware_errors_addr fw_cfg, once the former has been initialized.        
     */
    bios_linker_loader_write_pointer()

 and after this patch we end up with scattered code that should pick
 only one them (but doesn't).

As prereq, I'd move legacy into acpi_build_hest() as separate patch,
then do this patch adds above 'if' gate,
and followup patch [2/14 currently] adds  bios_linker_loader_write_pointer(ACPI_HEST_ADDR_FW_CFG_FILE)

>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,

shouldn't we do the same for fw_cfg_add_file_callback() hunk added
in previous patch and related 'fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE'
we need only one of them.

> @@ -420,6 +447,78 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> +static void get_ghes_source_offsets(uint16_t source_id,
> +                                    uint64_t hest_addr,
> +                                    uint64_t *cper_addr,
> +                                    uint64_t *read_ack_start_addr,
> +                                    Error **errp)
> +{
> +    uint64_t hest_err_block_addr, hest_read_ack_addr;
> +    uint64_t err_source_entry, error_block_addr;
> +    uint32_t num_sources, i;
> +
> +    hest_addr += ACPI_DESC_HEADER_OFFSET;
> +
> +    cpu_physical_memory_read(hest_addr, &num_sources,
> +                             sizeof(num_sources));
> +    num_sources = le32_to_cpu(num_sources);
> +
> +    err_source_entry = hest_addr + sizeof(num_sources);
> +
> +    /*
> +     * Currently, HEST Error source navigates only for GHESv2 tables
> +     */

> +
not needed newline

> +    for (i = 0; i < num_sources; i++) {
> +        uint64_t addr = err_source_entry;
> +        uint16_t type, src_id;
> +
> +        cpu_physical_memory_read(addr, &type, sizeof(type));
> +        type = le16_to_cpu(type);
> +
> +        /* For now, we only know the size of GHESv2 table */
> +        if (type != ACPI_GHES_SOURCE_GENERIC_ERROR_V2) {
> +            error_setg(errp, "HEST: type %d not supported.", type);
> +            return;
> +        }
> +
> +        /* Compare CPER source address at the GHESv2 structure */
> +        addr += sizeof(type);
> +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> +        if (le16_to_cpu(src_id) == source_id) {
> +            break;
> +        }
> +
> +        err_source_entry += HEST_GHES_V2_TABLE_SIZE;
> +    }
> +    if (i == num_sources) {
> +        error_setg(errp, "HEST: Source %d not found.", source_id);
> +        return;
> +    }
> +
> +    /* Navigate though table address pointers */
> +    hest_err_block_addr = err_source_entry + GHES_ERR_STATUS_ADDR_OFF +
> +                          GAS_ADDR_OFFSET;
> +
> +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> +                             sizeof(error_block_addr));
> +
I'd drop newlines for related read/processing

> +    error_block_addr = le64_to_cpu(error_block_addr);

> +
> +    cpu_physical_memory_read(error_block_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +
ditto

> +    *cper_addr = le64_to_cpu(*cper_addr);
> +
> +    hest_read_ack_addr = err_source_entry + GHES_READ_ACK_ADDR_OFF +
> +                         GAS_ADDR_OFFSET;
> +
> +    cpu_physical_memory_read(hest_read_ack_addr, read_ack_start_addr,
> +                             sizeof(*read_ack_start_addr));
> +
ditto

> +    *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
> +}
> +
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> @@ -440,8 +539,13 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> -                         &cper_addr, &read_ack_register_addr);
> +    if (!ags->hest_addr_le) {
> +        get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
> +                             &cper_addr, &read_ack_register_addr);
> +    } else {
> +        get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
> +                                &cper_addr, &read_ack_register_addr, errp);
> +    }
>  
>      if (!cper_addr) {
>          error_setg(errp, "can not find Generic Error Status Block");
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 237721fec0a2..6c2e57af0456 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
> +    bool use_hest_addr; /* True if HEST address is present */
>  } AcpiGhesState;
>  
>  /*

an

