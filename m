Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0637483;
	Thu, 30 Jan 2025 13:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738242469; cv=none; b=IY33v0Il69IuUp55P61p8dtL2EyQx6SG540248Rhriyo3fLrCBe8YoPvXhZVF2Up5bTRVxx8LfxubrZ7wyGpCF1RPEew2Al9tJf74aoj08hMGacDXOqcxtkLzfQXFH09bm10h90kuZDTN8LauBl/qkU4INUDpJvtdG/tzmxwPWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738242469; c=relaxed/simple;
	bh=Xl56z502L2AwFcIudvqF0uPEmOqfZYAQcbPBE6EBMFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcF6JKMTRc50PaY0J7DIdcRfjS6U/WMtELQr5ZD0hcgHNjMoZys8AvSS+4bnuZPkJezEDgRfXPVZgjS2a9Jri9+KsB3L9UMINnrxMlianhRT2le05aSqkZCSFpkzKC2fNE63q+JaeDcgovr2rORNpJMiyQYZ0FPjkaiLrEI9giI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDA58497;
	Thu, 30 Jan 2025 05:08:09 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A885A3F63F;
	Thu, 30 Jan 2025 05:07:42 -0800 (PST)
Date: Thu, 30 Jan 2025 13:07:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH V1] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <Z5t5l9MXsAzg5VIp@pluto>
References: <20250107052004.762817-1-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107052004.762817-1-peng.fan@oss.nxp.com>

On Tue, Jan 07, 2025 at 01:20:04PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> scmi_requested_devices is organized in IDR based link lists, so only
> need to search the link lists when there is a match protocol_id.

Hi,

while the original implementation of this loop was awful (my bad), I think
this optiomization indeed NOW changes the logic of the checks....

...you can have number of proto_id/name pairs describing requested devices
and the idea of the logic in this loop was to catch ANY duplicate name across
ANY of the protocol list as stated in the function Dox:

---
 * This helper let an SCMI driver request specific devices identified by the     
 * @id_table to be created for each active SCMI instance.                        
 *                                                                               
 * The requested device name MUST NOT be already existent for any protocol;      
 * at first the freshly requested @id_table is annotated in the IDR table        
 * @scmi_requested_devices and then the requested device is advertised to any    
 * registered party via the @scmi_requested_devices_nh notification chain.       
---

The 'awfulness' of the original loop was that it was trying to do 2
things at once:

- loop all the lists in the IDR for ALL protocols looking for a
  duplicate name anywhere, and FAIL if ANY found

  ... WHILE at the same time:

- save the head of the protocol list_head matching the requested
  id_table->protocol, if any already existing, so as not to have to scan

So, indeed the original loop was meant to be an optimization, even
though probably unreadable....

... having said that, I cannot really recall WHY I decided to avoid ANY
kind of duplicate naming given that teh match happen by proto_id/name...

....maybe just for clarity ? not sure...even what the effects could be
of having such duplicated names across protocols...

Thanks,
Cristian
