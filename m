Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BB9205AB4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738590115; cv=none; b=phSr3vU/cQYxX4dyiQ3Q21lR9mENBCVzIv290koHtzeJZAR2IhuIwP/px3T5UCdAC5cpGn3rK9k964P7YNU7tdDMo2Mvs3authj5mlVLNuhDrhaqrOGpJj+Qj+VD9WWanw8A9XBUIRYGwiru0O1zXDu68sqzF/xqPR1OlchwD18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738590115; c=relaxed/simple;
	bh=6WkRoWDaOg/YrwMZ2NuEJDRktBm85qql1pOV/jPK4yo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EWMo+UzVyB08o7QdegSzBC9VbQ+FbNUe2Gg7WK5b4XnU/WtPK+oVB4dGrkRi/HBw6Pf8hMdYxRvBj1WQqmdQaVJUPy9LQBF4XD2vK0CblQQPTwOHJ7bzSypDffxTPM/YVegsN1BKSW3Cey9WeP0kVvVGf9AdCvXeUPCm0cKp6YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XsHnv3p0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XsHnv3p0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738590111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhBJ+hCaRcSX/GLOKrl8eXDZTHXwWK2qzC6ZUGkMnLM=;
	b=XsHnv3p0c2eXe75r1tQUSj6hfuE0ofOMGBJHWz1tzb27tP/l3yMUdX4kFD3TAifZYbCrtc
	MHr2d1B4B65ZJIMWAx8D9uncp0vqvqXh8ZozZfrwa8v1t9wlCDh9RGDxYvPCaS+M7mrwky
	TkhxaS+JGYpdA0LgyZdkX4iViSH8/HY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-1mUM_ixYN4SiFgioHfq5hA-1; Mon, 03 Feb 2025 08:41:50 -0500
X-MC-Unique: 1mUM_ixYN4SiFgioHfq5hA-1
X-Mimecast-MFC-AGG-ID: 1mUM_ixYN4SiFgioHfq5hA
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385dcae001fso1904952f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590109; x=1739194909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dhBJ+hCaRcSX/GLOKrl8eXDZTHXwWK2qzC6ZUGkMnLM=;
        b=FYilCdwmCpn+3+Bgf41RSq0PEUtiboyuXXEyOzbdnhAGORyDUf+4BDQehWxegTstKn
         gKADBlxd2ZYWYk0VXFdJTdvl5lNDQWJopnSV/C+KopZNC5rLjePSyyvlqWNd7c27Eg51
         cShznAi2Xa0ib1zRjBQS42RW85Pa4s8Xt89Ao0/UnBk9sHgGRiLWCG8JaxCZ4LP+lden
         YPPWaQnezEHqkBrajjbZqs3xRzgKVnYv99lEj7KWQjcYX4xrXgH0vb+CN9C8jqjgfc74
         PYMX86T2ECeSp/5VRVcfTSPtst1oAeobK/9dXCca1XYU3saYgfd9xW7gYqKtehzRjY3h
         HsNA==
X-Forwarded-Encrypted: i=1; AJvYcCX7vvt7oXvDB6hkX6P0d1dxGAu05UbQCa+NSsC5MpWFcYfjYdoEFKjsx32J25Vie3Nxh1u9cbrgT+2zEhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/WUebRzWLPGM8yLk9FasHkCxq3+05Q4lAoF3I5dbp3uh6IAX3
	2JSTexTxooM2M+xJL3J/Ym5hxwkKHyOcPG/n6XIB1BK4kOvlNtdm0hZhzP35R9eW98qk6lEG9BL
	m6LntjMl0W8I2MzujdV8XLEOH26AdKuIfHf0HJcKR91GC6PQtituIkdsFKqJPxg==
X-Gm-Gg: ASbGncs4sVL8VJIVzJJzYIWTLoE37sLhv/aqA/lncjlS/Gq3Bk5+l/+8NDZ6tlFdr7m
	DUGWjePLYD6I/nbNqv66JIyV6Vf1//uxVotQNBPovJKaua93UaNFFj+ggzCVhhxydiB98Ids3MF
	fYjGxah05jW9zhIIecoCcYE1f9F8TZK0Jczck5793OaGBA7WJwHRB+YbenqLHLHf8QE+eIam6p4
	+VKga4jwTtfPkaDlu34p0a5GN/RqhsP0rfOW/pnFLblF1qqcTrThJycHY8prpoUAhrQaGxM3vKg
	GQBAhhnEOUTGG4+JDfreVpR5IvrQtiKHFTadwuhAoKHxkUc5TixP
X-Received: by 2002:a5d:6c66:0:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-38c51930efdmr16806875f8f.11.1738590108836;
        Mon, 03 Feb 2025 05:41:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFseaFy2uoghFvsLt3OCFWC6qb8SE+SmhTMyVZiVfT94VaAqxVWgt+Vb4X+ABRz55jVdTlA4A==
X-Received: by 2002:a5d:6c66:0:b0:382:6f3:a20f with SMTP id ffacd0b85a97d-38c51930efdmr16806854f8f.11.1738590108485;
        Mon, 03 Feb 2025 05:41:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23de772sm154182255e9.13.2025.02.03.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:41:47 -0800 (PST)
Date: Mon, 3 Feb 2025 14:41:46 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/14] acpi/ghes: add a firmware file with HEST
 address
Message-ID: <20250203144146.67655189@imammedo.users.ipa.redhat.com>
In-Reply-To: <5082df62da57450674413f13c20e937330676a0a.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<5082df62da57450674413f13c20e937330676a0a.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jan 2025 18:42:43 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Store HEST table address at GPA, placing its the start of the table at
> hest_addr_le variable.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c         | 16 ++++++++++++++++
>  include/hw/acpi/ghes.h |  1 +
>  2 files changed, 17 insertions(+)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 4cabb177ad47..27478f2d5674 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -30,6 +30,7 @@
>  
>  #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
>  #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> +#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>  
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> @@ -349,8 +350,11 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    uint32_t hest_offset;
>      int i;
>  
> +    hest_offset = table_data->len;
> +
>      build_ghes_error_table(hardware_errors, linker, num_sources);
>  
>      acpi_table_begin(&table, table_data);
> @@ -362,6 +366,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>      }
>  
>      acpi_table_end(linker, &table);
> +
> +    /*
> +     * Tell firmware to write into GPA the address of HEST via fw_cfg,
> +     * once initialized.
> +     */
> +    bios_linker_loader_write_pointer(linker,
> +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                     sizeof(uint64_t),
> +                                     ACPI_BUILD_TABLE_FILE, hest_offset);
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -375,6 +388,9 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> +    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +
>      ags->present = true;
>  }
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 9f0120d0d596..237721fec0a2 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
>  };
>  
>  typedef struct AcpiGhesState {
> +    uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;

