Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734C201011
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580017; cv=none; b=eERD94+lfDHg1oEC+hLXZpHHZgwLJAgfm03rYgWXUaJTB2ZnV9UpsgEZWUcalv811aCEu90rnfbA8shHGz4U+2orcvYhpTw7iNLk1nz+N36guYR8Z7Eh2jfmRZEsjJOomFWV9Q1zfnnCBesmjW/uoilh32ZPcOT1oIBhYpV1hTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580017; c=relaxed/simple;
	bh=AjVh0mM+pOYFq9kWgi1Xo5gLNGKpFLMnNOMhLofFfEI=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CO7sTiVVyu3BjJ2PEx61w2AhoTqgUiOt0hZwV/wNRkF+poQyV9+GN/WDy2r6tO1Ygsovm/1jhYixcze3WMiWFcu4SV+ZZpJ170Tv+EtGEwFHP7qJjWtQmFp1O/d+LH2H9ZhcX+f1uS52hUAwZUXu5ZPFcl8qYqttoXkjAiUQXxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjy24lQrz67CtD;
	Mon,  3 Feb 2025 18:52:42 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 30758140155;
	Mon,  3 Feb 2025 18:53:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:53:31 +0100
Date: Mon, 3 Feb 2025 10:53:30 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/14] tests/acpi: virt: add a HEST table to aarch64
 virt and update DSDT
Message-ID: <20250203105330.00002c99@huawei.com>
In-Reply-To: <343a2a84c1cf4a3998d40a188658bd42bc689602.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<343a2a84c1cf4a3998d40a188658bd42bc689602.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Fri, 31 Jan 2025 18:42:53 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> --- a/DSDT.dsl        2025-01-28 09:38:15.155347858 +0100
> +++ b/DSDT.dsl        2025-01-28 09:39:01.684836954 +0100
> @@ -9,9 +9,9 @@
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001516 (5398)
> + *     Length           0x00001542 (5442)
>   *     Revision         0x02
> - *     Checksum         0x0F
> + *     Checksum         0xE9
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -1931,6 +1931,11 @@
>                  {
>                      Notify (PWRB, 0x80) // Status Change
>                  }
> +
> +                If (((Local0 & 0x10) == 0x10))
> +                {
> +                    Notify (GEDD, 0x80) // Status Change
> +                }
>              }
>          }
> 
> @@ -1939,6 +1944,12 @@
>              Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
>              Name (_UID, Zero)  // _UID: Unique ID
>          }
> +
> +        Device (GEDD)
> +        {
> +            Name (_HID, "PNP0C33" /* Error Device */)  // _HID: Hardware ID
> +            Name (_UID, Zero)  // _UID: Unique ID
> +        }
>      }
>  }
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Diff looks good.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
