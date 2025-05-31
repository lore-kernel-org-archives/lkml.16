Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1DEAD0;
	Sat, 31 May 2025 09:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748684275; cv=none; b=QD4+JDTt+LvxxutB8s9SnZ98vExL8/Jo3MkxwXsfdVbdOGWrSVk+67zl7JwaBgVVT/M1lADWt/rIYgyMqJOdGXy2vWLPqaghhjzoiSVzVquoPmQ7NTKqcZIacczm3wWXiONvRxXXzvlyfSMGfPx9xwrAFfr/uZns9iSUexGCCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748684275; c=relaxed/simple;
	bh=iYoiiZF3675d1cOL29QNB0MBlhtJ9YHSUGYiAeQGfuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fmHH3tgarXXdGF/nvo1G23SKfdERjmFtasbrpvPAiLCKSGrtywjuFqDBbCNWrBmWY//BO7R0OE732DYwk1WKD6vkYB0wlY2SK5m+lbxeMHUwC8g6Pp7pZfao0Otzo2soiHk14OiUSpJNyVYTb+DYWD9WSgVqVdFORNamO7KAGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c3M4svPN; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c3M4svPN"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54V9bKUs2857327;
	Sat, 31 May 2025 04:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748684240;
	bh=YCcKjdVOPE9WOzG8bceQSsuc4dKtSsVhhPh6vA/1a2g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c3M4svPNv/Svq3T8GOw8MFg7jOOkg2aAesUEjQWtoJEBv+DFpkRGCRkK0VNVE4ZSt
	 JTIRisJBwJITO1fdnrN0GII/v7HohiIOmQ7x7jOpfp4pzru/Rikr1lmGAOgSu8jQMj
	 h/508I1o80c235jqEi8bUROXyB6KmoLXKBkGhqnQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54V9bKSF1469677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 31 May 2025 04:37:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 31
 May 2025 04:37:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 31 May 2025 04:37:19 -0500
Received: from [10.250.148.85] ([10.250.148.85])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 54V9bFxL146542;
	Sat, 31 May 2025 04:37:16 -0500
Message-ID: <7024867d-91ac-40eb-b41f-eed811032f95@ti.com>
Date: Sat, 31 May 2025 15:07:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/2] Extend mmio-mux driver to configure mux with
 new DT property
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Peter Rosin
	<peda@axentia.se>,
        <s-vadapalli@ti.com>, <danishanwar@ti.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vignesh
 Raghavendra <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>,
        Thomas Gleixner
	<tglx@linutronix.de>
References: <20250304102306.2977836-1-c-vankar@ti.com>
 <f844e44e-6b71-442a-ae3c-7bbe74a908af@ti.com>
 <2e80f6bc-2fb0-4f0d-9450-cbcf4dddca66@ti.com>
 <2025053128-profound-importer-8436@gregkh>
Content-Language: en-US
From: "Vankar, Chintan" <c-vankar@ti.com>
In-Reply-To: <2025053128-profound-importer-8436@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Greg,

On 5/31/2025 11:22 AM, Greg Kroah-Hartman wrote:
> On Fri, May 30, 2025 at 10:35:24PM +0530, Vankar, Chintan wrote:
>> Hello Greg,
>>
>> I have tried to implement Timesync Router node to the suitable
>> Subsystems (Interrupt controller and Mux-controller). Thomas
>> has provided a feedback with a reason why Timesync Router is not
>> suitable for irqchip. But I didn't get a proper feedback for mux-
>> controller subsystem.
> 
> What do you mean "proper feedback"?
> 

By proper feedback, I meant, from the comments I was not able to figure
out whether Timesync Router will be acceptable in the "mux-controller"
subsystem or not.

>> Can you please help me deciding in which subsystem I should implement
>> it, if not mux-controller can it go in drivers/misc ?
> 
> Why not mux?  What's preventing that from happening?  Why would misc be
> better?
> 

Sure, if mux-controller subsystem is acceptable, I will implement the
Timesync Router with that and post a series.

I thought of misc, when mux-controller subsystem is not acceptable and I
could not find any other subsystem which is suitable for Timesync
Router.

Regards,
Chintan.

> thanks,
> 
> greg k-h
