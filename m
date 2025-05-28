Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02C7263A;
	Wed, 28 May 2025 11:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748431714; cv=none; b=F0QHyXyYk1yJT4l5VWL4REIQy5Yr04ROW6QSeO1z5MnWNWCAgaVAsXpQT4a6pLswHZmw+h9yJmUY4VXYdyz2odwy+WUTF/9AWoQ5RwCxemEp3Wr+OfvSi0h1KVPM2fOx6tT5lTsZCCrE3ZHyECWtqFCJMshahzbHylEfCklQXjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748431714; c=relaxed/simple;
	bh=Rdwj7CvGValpAUzeiMZcnSBQQBZYEhQiTrlWtf7ChJY=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cu1Zt8yGaG9xnxfS8dm1nihP1Xvt9ylHMwTi7e45SqhmkseDZ4URpVJDm1txoPbqfFbD1VyJZ/DyMm3AASrdRaH4FI9MmP5zomk7KjbbYxMJQi8KQta1BEjY57I5erUN1svk6nwj0HfUTkm6fzmL3BEUo8Aw7OT4ZNfbFX+pAXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6nLd5W1Nz6M4sd;
	Wed, 28 May 2025 19:28:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B605140113;
	Wed, 28 May 2025 19:28:28 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 28 May
 2025 13:28:27 +0200
Date: Wed, 28 May 2025 12:28:26 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Sascha
 Bischoff" <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Mark Rutland
	<mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 14/26] arm64/sysreg: Add ICH_HFGITR_EL2
Message-ID: <20250528122826.0000566c@huawei.com>
In-Reply-To: <20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
	<20250513-gicv5-host-v4-14-b36e9b15a6c3@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 13 May 2025 19:48:07 +0200
Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:

> Add ICH_HFGITR_EL2 register description to sysreg.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>

Hi Lorenzo,

> ---
>  arch/arm64/tools/sysreg | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index 0927754d9fe2c5addbd9693d83b7324f1af66d3e..d2f53fb7929c69895fe8a21ba625d058a844d447 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -3616,6 +3616,21 @@ Res0	1
>  Field	0	ICC_APR_EL1
>  EndSysreg
>  
> +Sysreg	ICH_HFGITR_EL2	3	4	12	9	7
> +Res0	63:11
> +Field	10	GICRCDNMIA
> +Field	9	GICRCDIA
> +Field	8	GICCDDI
> +Field	7	GICCDEOI
> +Field	6	GICCDHM
> +Field	5	GICCRDRCFG

GICCDRCFG in the spec. (you have a bonus R)

Of course the real question was what am I avoiding that made checking these
against the spec feel like a good idea? :)

FWIW with that fixed,
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
for patches 2 to 14.

> +Field	4	GICCDPEND
> +Field	3	GICCDAFF
> +Field	2	GICCDPRI
> +Field	1	GICCDDIS
> +Field	0	GICCDEN
> +EndSysreg
> +
>  Sysreg	ICH_HCR_EL2	3	4	12	11	0
>  Res0	63:32
>  Field	31:27	EOIcount
> 

