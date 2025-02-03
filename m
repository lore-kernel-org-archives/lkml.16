Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806711D5146;
	Mon,  3 Feb 2025 11:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580735; cv=none; b=Orm/fk5Kf4Lm8BpEg5/bbMrZi8t8RwWuDyiHvGWGAIjr+n6e2VvueZu9Fr4+/Ns9t0mMI2ctKCTuJHMGzxW1Lhd/DPc+acoPKPaT3X/wWmbB+qi45UL9w9OgN6nk7VAJ+AHy/F7BatbbO75SOfFvs7mJRQBIogzv/sFP67bVpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580735; c=relaxed/simple;
	bh=JADNOHwZuM/Kt2BoITbiOVwJSHUgBRO8bNiqSXLiZjs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSKDWRx8xs1ogqllCE/HDCqWXDodCYn1JvkwPIRRZPRMtDyYb1OZ3ASZxohNmFvQsqXUFoHQl/rRmHHgeCh7XlSWYq9pwXKsChH+SVuRnKsXw3Ny7xOo2Ozsax1qzU1Ng2U4oO9X1jtQjCr/cIChCvbdejuHXgLI24KEAEwbEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YmkCr3G7nz6K90T;
	Mon,  3 Feb 2025 19:04:40 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 025CB14011B;
	Mon,  3 Feb 2025 19:05:30 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 12:05:29 +0100
Date: Mon, 3 Feb 2025 11:05:27 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "
 =?ISO-8859-1?Q?N=EDcolas?= \"\"F. R. A. Prado\"\"" <nfraprado@collabora.com>,
	Thomas Gleixner <tglx@linutronix.de>, "Peter Zijlstra"
	<peterz@infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] perf: Fujitsu: Add the Uncore MAC PMU driver
Message-ID: <20250203110527.00006747@huawei.com>
In-Reply-To: <OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
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

On Mon, 3 Feb 2025 07:18:38 +0000
"Yoshihiro Furudera (Fujitsu)" <fj5100bi@fujitsu.com> wrote:

> > 
> > mod_devicetable.h
> > for the acpi device table.  
> 
> After checking, I found that
> linux/mod_devicetable.h is included in linux/acpi.h.

True but with a few really tightly couple exceptions, normal
kernel policy is follow include what you use principles.


Thanks,

Jonathan


