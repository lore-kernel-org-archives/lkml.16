Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE5C28C5AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746736877; cv=none; b=gAWe8TeGxwbbzwKe4Dt7i0SAz7j/rGc29ObjddZqMn67otel5Ozr3MLPCAO7IZJWWCJ/qV6jwc60FMf2wvjk5t7G3TEZ1g/29DfDbVvike9yYVUy8MPLKL2o941gTCrInXds8YeNrJDNqVUulqeTeaybNkznSnViv1rgp4AU5kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746736877; c=relaxed/simple;
	bh=37lV7jPkW6YLz6WO5s2EcM1hxUEERekb4IJ7GhriYd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vgb25koenpnP6rp0PstunGfsyZtrsk7wxD/v2HmPFxq81ziFHuyEvo9RFtdRz2K0YBHWA19Rhb96zEihaew2JFbm8Ro7D6JsifIuYMcn+Hk5XR10c2PxOhWRwHrjK2W3YxWNbSb8OEj2lPKCacqVdYtOeLXAlgJwHZjTPx+cB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jx1jR0gp; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jx1jR0gp"
Message-ID: <52b8aa58-d0ec-40ac-b4c9-277d9a1061ec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746736873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PQucGydOn5xsFCXrercW6KxVZ/vpaAqjNKGUt41GUao=;
	b=jx1jR0gpXuWbZPepm3f9jklTARJAFPGpaQsjvk14OWAGxIv32Ba7axHlMf5eIKbxq73al9
	lM50VhpKZ94Yv6/ps3HmDUN5/NVQklDV35dWqg2h3hSg6HG3OwOvHsTlAY2TLenkcngeG5
	gEl0u4YiRzPd+KDLhBl6mQ0iSKW7p90=
Date: Thu, 8 May 2025 21:41:01 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] net: dpaa2-eth: convert to
 ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Andrew Lunn <andrew@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 linux-kernel@vger.kernel.org
References: <20250508134102.1747075-1-vladimir.oltean@nxp.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250508134102.1747075-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 08/05/2025 14:41, Vladimir Oltean wrote:
> New timestamping API was introduced in commit 66f7223039c0 ("net: add
> NDOs for configuring hardware timestamping") from kernel v6.6. It is
> time to convert the DPAA2 Ethernet driver to the new API, so that the
> ndo_eth_ioctl() path can be removed completely.
> 
> This driver only responds to SIOCSHWTSTAMP (not SIOCGHWTSTAMP) so
> convert just that.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com> # LX2160A

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
