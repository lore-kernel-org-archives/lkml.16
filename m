Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7849628F939;
	Fri, 11 Apr 2025 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359825; cv=none; b=I9V8iFqiIUUXznQm2kPDyJz55u8VjYad4B1PGQaaxIWkRPBIFK3+ICVboB2nZ+bvLQ9ki/ytfEtQhe563aVviHLFxY6xFOCluCTHBMCn0WUCXLrXckmniG86e5LnDQcd4aFOqbyNkzc4wrue0YtFTGJ42bF7op/CsslbRNoJwhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359825; c=relaxed/simple;
	bh=fA+MpSDHIN+qzgKOcqVh+9dEMsxcCZTkoUpUBw48PnQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sz1m8H/hvDR1DXoQjHX4FyuRIN/QOcGZmAjZYeEUpCeI8p0np5ZVFPfVWaDfwq2uk/kH7o0ANj9tBRji+I8hrV8WqdGCmNHAzGyQDUx4Mvz3DuDuL4ihN7z44uRBg+AYET3L8gx1XrzpotRt2U6vdcZfMXNU4zPY7HKkaMMM+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZYqNb4lsqz6M4Yq;
	Fri, 11 Apr 2025 16:19:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 23733140275;
	Fri, 11 Apr 2025 16:23:35 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 11 Apr
 2025 10:23:34 +0200
Date: Fri, 11 Apr 2025 09:23:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: "Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com>
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
Message-ID: <20250411092332.00004b73@huawei.com>
In-Reply-To: <TYYPR01MB67157AE764B00DEAC97D4EAAC1B62@TYYPR01MB6715.jpnprd01.prod.outlook.com>
References: <20250116045911.3382537-1-fj5100bi@fujitsu.com>
	<20250116045911.3382537-2-fj5100bi@fujitsu.com>
	<20250130170422.00004c6f@huawei.com>
	<OS3PR01MB6903DC3738709A4536A62613D4F52@OS3PR01MB6903.jpnprd01.prod.outlook.com>
	<TYYPR01MB67157AE764B00DEAC97D4EAAC1B62@TYYPR01MB6715.jpnprd01.prod.outlook.com>
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

On Fri, 11 Apr 2025 02:56:59 +0000
"Koichi Okuno (Fujitsu)" <fj2767dz@fujitsu.com> wrote:

> Hi, Jonathan
> 
> Sorry for the late reply.
> Also, the person in charge here has changed from Furudera to Okuno.
> 
Hi,


> > > Text identical to memory-pwrite-count
> > > which suggest two things.
> > > a) naming inconsistent.  Why is mac mentioned here and not in the name  
> > earlier.  
> > > b) This comment is perhaps wrong as I assume has something more tod owtih  
> > with  
> > >    energy estimation?  
> > 
> > We are currently checking and will reply later.  
> 
> After checking with the hardware team,
> the 'ea' events are measured at different points and may therefore 
> return different values.
> Since memory-pwrite-count and ea-memory-mac-pwrite currently return 
> the same value, they share the same description.
> However, we have defined distinct event names to accommodate potential 
> future enhancements.

As any future enhancement to make these different will also need a change
to the documentation to reflect that difference (and hence a kernel patch)
maybe it is better to not provide the second event for now?

Or is there some other subtle effect to do with groups that can be enabled
at the same time? I've forgotten how the driver works!

Jonathan

