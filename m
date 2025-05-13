Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D551012CD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154422; cv=none; b=M6weQC/+VZ/oN35gIxsLEwEFMcpEMahpiHXL9Ls3f6Au7wffj9/BXghhfmtk34xk5vdxPH5rf87iZFsNZNLxH/fxYG6GDMh7xMgd5o707Htcpkeng3rwU353hxsD0NiBd/uL2tEqCoAjRqQsRl6+MNJ54IWUqZipspER+jukL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154422; c=relaxed/simple;
	bh=ZTvOfyt27ngXKsIHWQ1g0X5LM2B8iC/5VO98mqpFpBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0R5uzlXmT1enADqdYTYm2eZPhksZ8lzvxYDhKQED6E5dBqVMHt/1c88wIdI06gVKD2qtwAM4LX9H3z7m+6pxV0VhsEOing2ZvNK8FiAhIr/Hllz3NyJ6ldumWFLLObfgqqGMGwAzws538SLhqjEN682ziYAISNPSHrhCN/dAdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v5dm0lD1; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v5dm0lD1"
Message-ID: <964d667a-c17e-47ff-b7d8-fb5b5a2f1eef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747154415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1pd8a86ouCHKkC4nVa+pxW5IeRMYr8wsSfrdSRatPCY=;
	b=v5dm0lD1mmwG9XVDa+coeBFMQiCdVvbRDgihk9r4mx4Xi132k7MmF8jV5Yx3H79h6jAyPM
	PFclKaNv4y/EYlD0fe02SvWUj0QquI4WwSMmdTGkkBeYo9qB6cc9t0KCoutqdL9oTi9DBD
	tZu8+JQ0KoAmsBPlqbVYVeT3IBvKlD4=
Date: Tue, 13 May 2025 12:40:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 09/11] net: macb: Move most of mac_config to
 mac_prepare
To: "Karumanchi, Vineeth" <vineeth.karumanchi@amd.com>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <20250512161416.732239-1-sean.anderson@linux.dev>
 <6a8f1a28-29c0-4a8b-b3c2-d746a3b57950@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <6a8f1a28-29c0-4a8b-b3c2-d746a3b57950@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/13/25 11:29, Karumanchi, Vineeth wrote:
> Hi Sean,
> 
> Sorry for the delayed response.
> 
> We are working on MACB with two internal PCS's (10G-BASER, 1000-BASEX) supporting 1G, 2.5G, 5G, and 10G with AN disabled.
> 
> I have sent an initial RFC : https://lore.kernel.org/netdev/20241009053946.3198805-1-vineeth.karumanchi@amd.com/
> 
> Currently, we are working on integrating the MAC in fixed-link and phy-mode.

I had a look your series and based on the feedback you got I think this
patch will help you ensure the PCS changes stay separate from the MAC
stuff. I found it confusing on first read that you were configuring the
"1G" PCS from the USX PCS callback. I think you are using 1G/2G speeds
with the "1G" PCS and 5G/10G speeds with the USX PCS?

Do you know if there is any public documentation for 10G support
(even on non-versal SoCs)? That will make it easier to review your
patch.

--Sean
