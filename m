Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE23E2620E4;
	Wed,  9 Apr 2025 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201926; cv=none; b=tWvrAL9+64+P5DvBNYIg+RjP51ls60x8WS+beOMdG8KVpzDJcmmbxYXpphHkAQ9ShWE82cL56E/NVY2DUngtOwmdvsr4XTyA0OIepO8KDNMvTznAEm0D/sCsV1hglZxI9JlTyB4CwaQHm7dfqNxGD/d5VHwkC4uwNu6YzbrRPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201926; c=relaxed/simple;
	bh=XOh91lN8AEqXFXIq3i+RvJ8nO5R+kWkUOOoTRfSQYXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXccOUFwCjV2VaT/SMtV3u1LUkisg9EOZp9YIQzFqbnqCGHPg76Vw091eCfS5Zqw8h2EoCOER0mfyDwfSQgjmA59nx7Nv5dV4vsap8tX+lgWVZ6O/JXDyOL7cDDS7/7CsvYruB1EdsiATZdvil7tRRGziYqcv5KyX5DVL+45u/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C452915A1;
	Wed,  9 Apr 2025 05:32:04 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFEB33F59E;
	Wed,  9 Apr 2025 05:32:01 -0700 (PDT)
Date: Wed, 9 Apr 2025 13:31:58 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <20250409-heavenly-sceptical-ara-bceeb9@sudeepholla>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
 <2003940.PYKUYFuaPT@steina-w>
 <20250409121829.GA11949@nxa18884-linux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409121829.GA11949@nxa18884-linux>

On Wed, Apr 09, 2025 at 08:18:29PM +0800, Peng Fan wrote:
> + SCMI maintainer, Sudeep and Cristian
> 
> On Wed, Apr 09, 2025 at 12:59:50PM +0200, Alexander Stein wrote:
> >Hi,
> >
> >Am Montag, 4. November 2024, 09:56:21 CEST schrieb Alexander Stein:
> >> BBM protocol supports a single power button, supported by driver
> >> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> >> using linux,code. Add a reference to this schema and add linux,code as a
> >> supported property.
> >> 
> >> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> >
> >Is there any other feedback or things to do here?
> 
> I see Rob already gave R-b.
> 
> Not sure this should go through Shawn's or Sudeep's tree.
> 

I am fine either way. Peng, just let me know if you want to pick this up.

-- 
Regards,
Sudeep
