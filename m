Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD0382;
	Mon,  9 Jun 2025 12:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470439; cv=none; b=FxizdTI5WNKriAgD5KMJr7r15j3sLrEf9dCaPnK4BQXW83NM7t8hbUXbTN+ch5sUG7nnzjd4mftVTEk5vsWRRxooE9XDCN8UIpEMZ8fDZCu/yJ4GYWMN81op/orK07sRNmwBjR57SNTJz2qp2QT+DUDQVZkSOXoC3rBT+vUCrOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470439; c=relaxed/simple;
	bh=Ch0K/QAxSkYrJl/3IsHQdVItmuPaMWgOraAhIo5Tel0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LmSCiKKppqRFyz49BBwd5pK5l+DMvTbGTzAxU4jV31j9l4P2TTW/N0xGzsIXUmEwsuDI9k6DkDbmtZ4gWWi0Ld/58SAS5559VIcOEP6gCMMBEX/JtTCsH8dQbeZ5TezSsSryvfcSiDcQTjsjkiMaKJWkJfc1SFE3i4m+Fd+CCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GKuIMGu3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GKuIMGu3"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 559C0WvK1981245;
	Mon, 9 Jun 2025 07:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749470432;
	bh=KfT47f4YC4sHbAPf2iUwhK0CCB8qwr74xhJZbfhK/ps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GKuIMGu3dJbx5hNpKhFmX5+IK+tGAbVy4vEAxw1Q6yZ98XOmPk3irPVZq6ws9XEBV
	 EWOhujqkY0c6jLRvCmDfdP4WUcPrZEHmA0J78eB51IbHMaPg6b2X+GWMQ/QkJ+bn8t
	 8fan9QnqIGpP6ewa5BUn7VKYMaa/hHb3dDIod7Q4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 559C0W431356753
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 07:00:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 07:00:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 07:00:32 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 559C0Wfc1365631;
	Mon, 9 Jun 2025 07:00:32 -0500
Date: Mon, 9 Jun 2025 07:00:32 -0500
From: Nishanth Menon <nm@ti.com>
To: "Kumar, Udit" <u-kumar1@ti.com>
CC: <vigneshr@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <b-padhi@ti.com>
Subject: Re: [RESEND PATCH] arm64: dts: ti: k3-j784s4-mcu-wakeup: Configure
 wkup_uart0 with clock settings
Message-ID: <20250609120032.yxmcyiw7dchv2kmp@wanted>
References: <20250603042448.783956-1-u-kumar1@ti.com>
 <20250603160147.47orn74obh2lz3qm@rethink>
 <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51c56999-5f47-45fd-a4b2-4b79ecae0227@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12:47-20250608, Kumar, Udit wrote:
> Hello Nishanth
> 
> On 6/3/2025 9:31 PM, Nishanth Menon wrote:
> > On 09:54-20250603, Udit Kumar wrote:
> > > From: Bhavya Kapoor <b-kapoor@ti.com>
> > > 
> > > This commit adds the assigned-clocks and assigned-clock-parents
> > > properties for wkup_uart0 in J784S4. Specifically, the assigned-clocks
> > > property is set to reference the clock identified by
> > > "wkup_usart_mcupll_bypass_out0", ensuring the UART operates with the
> > > correct clock source.
> > > 
> > > The assigned-clock-parents property specifies "wkup_usart_clksel_out0"
> > > as the parent clock. This configuration is critical for establishing
> > > the proper clocking hierarchy, enabling the UART device to function
> > > reliably across different baud rates.
> > Please fix the commit message - not clear what specifically in the clock
> > hierarchy does permit the multiple baud rates.
> 
> need your advise here .
> 
> unlike other UART of main domain.  wkup_uart currently has two parents clock
> (clock-1 is at 96Mhz and clock-0 is at 19.2 Mhz).
> 
> By default, current fw selects clock-1 as parent.
> 
> Let me know, if explicitly we need to set parent as clock-1.
> 
> If yes then i will roll out v2 with current message , if no then please drop
> this patch

I personally do not see a need for the patch, then.
> 
> Thanks
> 
> Udit
> 
> > 
> > > Signed-off-by: Bhavya Kapoor <b-kapoor@ti.com>
> > You need to add your SoB.
> > > ---
> > > Link to v1: https://lore.kernel.org/all/20241009072056.3511346-1-b-kapoor@ti.com/
> > [..]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
