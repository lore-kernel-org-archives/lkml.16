Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9489235077;
	Mon, 12 May 2025 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747063570; cv=none; b=B0eyc+RC0yVxPbTylPva61E8MQQnHeTOQl5GFFY974xW1KajLd+KzKHqZJpF36w23nkrhNIAUk29itNTwG79fruPWXP/bmlSU0MSXgN48ZRDALHPDPe3IFU8gpmK98enyPDvDAPbPDey/grrtVsf8+HFetHpPozYJ5b6U54Gi58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747063570; c=relaxed/simple;
	bh=5EkUf1PscTHPkCMWeXYpTdT9UJVhoVSs8dc2HVxVZvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGUjp7APnejlF9gphNoXnTaB+RzQh98DC2lzrCF3ehaa3tPekjG/fvwkjNJXQapGhJhSsB/LvJvhbjIot8pNUWsbTSmSwUUgEoaBhdx7URSVTsASSx9LPL7eqgSJ2a7FNLcM9MjFWb2TgTvqjUBUT+M1grp6CJGN+BWoCkSD4vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ys8qdg1E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ys8qdg1E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD749C4CEE7;
	Mon, 12 May 2025 15:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747063570;
	bh=5EkUf1PscTHPkCMWeXYpTdT9UJVhoVSs8dc2HVxVZvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ys8qdg1EFUGfsN9N4QbOF4640oc7xz7B0Ty06jMqCwZR37ReBvhPVs22RkbkqGu3e
	 zjiyqPbTvg/WxVhg1xjnqMwtiDx2PrVwarph58glmnzZlSGwKcQ62/4syWdgATOl73
	 qsGSCNxSIGqsRBUvYcf6WKqogNvhxRmMWVjqL+Uxl4dyjjuVBxyjRz0q9U1XwCA34U
	 1yxboNSqu9j1xykWaVrSkILG3q7SMc1FWRP/P6DMA4GL7op4oU7Vizl/HIHFxQqxCz
	 wGVGne1PtBqJ02B/HL03MrnTcudnWkQAUeZrYRBFkVV8DmtyXFiY+Cl+IYfQLRG3v4
	 IWmWOKfFdy13w==
Date: Mon, 12 May 2025 10:26:07 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor+dt@kernel.org, krzk+dt@kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: trivial-devices: Add Maxim max30208
Message-ID: <174706356668.3377581.9001459605267583230.robh@kernel.org>
References: <20250503190509.33074-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250503190509.33074-1-rodrigo.gobbi.7@gmail.com>


On Sat, 03 May 2025 16:01:01 -0300, Rodrigo Gobbi wrote:
> The temperature sensor for maxim is a simple i2c driver,
> it's eligible to trivial devices.
> 
> Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
> ---
> Inspecting the code of max30208.c digital temperature sensor (i2c),
> I can see that the probe method does not support additional properties
> and only does a few things related to the IIO subsystem.
> Also, since was added in the tree, there is no binding file.
> I'm suggesting a change to add that compatible to the trivial-devices file.
> Tks and regards.
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

