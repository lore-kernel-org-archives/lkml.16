Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D5722B8A4;
	Fri, 27 Jun 2025 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056775; cv=none; b=l9DJcQOrM/VIBFz60J8Y01MT61f/bcNiotr0uHWB8QIsvDW1tUXW0LXNPVgWSV/qa0KPHLtZE1wPuvuCiQnOSHTANH1vnAUOwD4Nk5E6IQFg5faspbBxVrq2Aly3bA+11cWqE1dR89ED+E2GbqzTM7BjG6hu6suj7Lj3TxAhiB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056775; c=relaxed/simple;
	bh=xMIC34Yma/hoOGQGXI6PG8KF2iqrWt1g1NKLa2vytxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFYLMb5DxpjZOwNHzIWfotJ3fv5sYh2Jih5vQ9lASXuERtavohR637LBPrQLG/B8n51Bdda7gi5AqydYYSHBtHGGY+NJ8gTvzBVEShKm7XwxCCyOJJtxJLMqJriVNEKnZzBBnG3WhtoUFf1ypIOzhcQG4q21jEmV14ujIDgFIY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=heyaC5DY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="heyaC5DY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A67C4CEE3;
	Fri, 27 Jun 2025 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751056775;
	bh=xMIC34Yma/hoOGQGXI6PG8KF2iqrWt1g1NKLa2vytxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=heyaC5DYoKO4mA4UI5zOdxp0wscwLigmLkJO/K25li/YpkWupM//orRUHUuog6JYs
	 b+g/BhkDk5FuXIYx6qTxE1nyUII5q1afdHRyOVR/tdTOxgNmEiwvKrtPptuSU+FYGQ
	 5pcKboNIZKvP+1TMHMHGJpgC+7K1V3et97Tr/WlsCSpu/qYU/JLu6Th9GyX2YnEKZC
	 X0UwvAHliA1mGwrjCi3eLtHXFwNQYjzMQ0kKL/0IUITHiIFbRhTSBzgHE1xc8ol5R2
	 4S55aOwz8GbZoUQCt1XnaVg1ebaxyiTWxnM2YBGGp7pW7x61f7kFll+2A/L3FzL5da
	 tOhMssofYsXMQ==
Date: Fri, 27 Jun 2025 15:39:34 -0500
From: Rob Herring <robh@kernel.org>
To: wenswang@yeah.net
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, jdelvare@suse.com,
	linux@roeck-us.net, corbet@lwn.net, Jonathan.Cameron@huawei.com,
	michal.simek@amd.com, naresh.solanki@9elements.com,
	festevam@gmail.com, rodrigo.gobbi.7@gmail.com,
	grantpeltier93@gmail.com, laurent.pinchart@ideasonboard.com,
	cedricjustine.encarnacion@analog.com, nuno.sa@analog.com,
	ninad@linux.ibm.com, jbrunet@baylibre.com,
	kimseer.paller@analog.com, xzeol@yahoo.com, leo.yang.sy0@gmail.com,
	Mariel.Tinaco@analog.com, johnerasmusmari.geronimo@analog.com,
	linux@weissschuh.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: hwmon: Add MPS mp29502
Message-ID: <20250627203934.GA42694-robh@kernel.org>
References: <20250625065956.964759-1-wenswang@yeah.net>
 <20250625080425.966014-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625080425.966014-1-wenswang@yeah.net>

On Wed, Jun 25, 2025 at 04:04:25PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>

Your threading is weird and patch 4 is missing. This patch can be 
squashed with the 1st binding patch.

> 
> Add support for MPS mp29502 controller
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 493e7232f09f..2066696ecff4 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -291,6 +291,8 @@ properties:
>            - mps,mp2888
>              # Monolithic Power Systems Inc. multi-phase controller mp2891
>            - mps,mp2891
> +            # Monolithic Power Systems Inc. multi-phase controller mp29502
> +          - mps,mp29502
>              # Monolithic Power Systems Inc. multi-phase controller mp29608
>            - mps,mp29608
>              # Monolithic Power Systems Inc. multi-phase controller mp29612
> -- 
> 2.25.1
> 
