Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC8F265CB6
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747730100; cv=none; b=Px52YARBRm7uj5TV1OKpdMi0TMDL1u2tsMFILZQ9zz0KPD+GcDxBDayNgR/opLkKBaaYgJl92Pfx4lut3uL7WRggc8mmYtK56bOE1apsG58NjilQ6BODmQGPzV8CIqo/VOFSQFQQsMNp1E2N5Wg1V/Gxf95ocyySX2j1m131rGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747730100; c=relaxed/simple;
	bh=Tdh5UlTgTA7i3CrP20v5Ptgdnafwz59HG1w7O90i/UU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qgE9EVIomnct141XROUnXw0Rr4JzTLpYJfmH3wpD6C+9SDiuUJmuC4A+3bYN9+NUACGqW3/WXqVdwmlkblGf5HSTlMPLvOXdbcjh9TVcG3VrBCY4MfXl3WbrqFUlX4A8tbwB8FGCmi//zW42QL4UKsMg0H/NmCZ27kugWttJX4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b1nmW6zKFz6M4pS;
	Tue, 20 May 2025 16:30:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A6BC21402FF;
	Tue, 20 May 2025 16:34:53 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 20 May
 2025 10:34:53 +0200
Date: Tue, 20 May 2025 09:34:51 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 04/20] Revert "hw/acpi/ghes: Make
 ghes_record_cper_errors() static"
Message-ID: <20250520093451.0000245a@huawei.com>
In-Reply-To: <1ee2df288540088176a1ac27c70cc2736d10ad16.1747722973.git.mchehab+huawei@kernel.org>
References: <cover.1747722973.git.mchehab+huawei@kernel.org>
	<1ee2df288540088176a1ac27c70cc2736d10ad16.1747722973.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 20 May 2025 08:41:23 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The ghes_record_cper_errors() function was introduced to be used
> by other types of errors, as part of the error injection
> patch series. That's why it is not static.
> 
> Make it non-static again to allow its usage outside ghes.c
> 
> This reverts commit 611f3bdb20f7828b0813aa90d47d1275ef18329b.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
FWIW (which is maybe just that I don't read the commit message
again if you have to do a v10 ;)

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


> ---
>  hw/acpi/ghes.c         | 6 ++++--
>  include/hw/acpi/ghes.h | 2 ++
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index b85bb48195a0..b709c177cdea 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -390,8 +390,8 @@ static void get_hw_error_offsets(uint64_t ghes_addr,
>      *read_ack_register_addr = ghes_addr + sizeof(uint64_t);
>  }
>  
> -static void ghes_record_cper_errors(const void *cper, size_t len,
> -                                    uint16_t source_id, Error **errp)
> +void ghes_record_cper_errors(const void *cper, size_t len,
> +                             uint16_t source_id, Error **errp)
>  {
>      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
>      AcpiGedState *acpi_ged_state;
> @@ -440,6 +440,8 @@ static void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      /* Write the generic error data entry into guest memory */
>      cpu_physical_memory_write(cper_addr, cper, len);
> +
> +    return;
>  }
>  
>  int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 578a582203ce..39619a2457cb 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -75,6 +75,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
>                            GArray *hardware_errors);
>  int acpi_ghes_memory_errors(uint16_t source_id, uint64_t error_physical_addr);
> +void ghes_record_cper_errors(const void *cper, size_t len,
> +                             uint16_t source_id, Error **errp);
>  
>  /**
>   * acpi_ghes_present: Report whether ACPI GHES table is present

