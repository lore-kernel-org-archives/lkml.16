Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5AA19BBC;
	Wed, 14 May 2025 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747234391; cv=none; b=W0gZBlAKTxZ5+am1lm20RokXrQRLFzTxO6bpGugjmJonA5Q1rGrr6hIQM0BsK88/Yiv6PqIeWsYEzKLSWQqt8e+jzR6Gs1J6cdH23AOmQQytGVSUDnaJUwGaUmsMz1lSWzOSrRe0S88oG2CCWffParmiiJhSjsoA2YirU2GnB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747234391; c=relaxed/simple;
	bh=HZpq70PxcZCLy6lilP9mOIlfD5LkNvndpjxNjMCCUrc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfRIczntKZ6owUw7xlUzVtFS6YTXLeHfYFd3eULXZwE9pih4ZPj+nDbEsJH8ma2baFfbJfnV3OT2MaPcESnruohg21a047MrwesvSoq2fbcpEkk3PM22T36dk5/AdGcwA3MdaB5P2ju+q7gd904AtY7nmgNilZyAsii+bVAN2TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FB4+ROQn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FB4+ROQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960F6C4CEE3;
	Wed, 14 May 2025 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234389;
	bh=HZpq70PxcZCLy6lilP9mOIlfD5LkNvndpjxNjMCCUrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FB4+ROQn+Q5DpRPNLHwehrsFbFQ5dr3MSn6uYe1BHxtuMTN+OAxZ+/1oX5Qb82aLR
	 ANYbhtLPPk4KjUUZGmTMPkCurUi+m4dFJhAz7MBePwhKbJg2b5EIkg/zbn0fXIM8eF
	 4hFjBlHTfu4neZHW2XHVjLKs/dPwbN50pO7mYSmAZ2JWGL1oeHsAyl/DqKDCIsM6bs
	 P2OgHfsY3ekYNzIm+S9QwuqVTaWCt0NJa1Eqmieqhkv3ZwMpgWIjSrh+9dxl3rqeDY
	 qLNi8VqQkdjfzpt69LqE2xqIUTREQOAx1XkEveOy6dQpiZjrayNORg2z6GtHH3KQ41
	 C9jjkuXaskr/A==
Date: Wed, 14 May 2025 09:53:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: krzk+dt@kernel.org, tglx@linutronix.de, magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com, paul.walmsley@sifive.com,
	alex@ghiti.fr, daniel.lezcano@linaro.org, conor+dt@kernel.org,
	aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
	tim609@andestech.com, linux-kernel@vger.kernel.org,
	geert+renesas@glider.be, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/9] dt-bindings: interrupt-controller: add Andes
 QiLai PLIC
Message-ID: <174723438154.2170160.6461910184012543621.robh@kernel.org>
References: <20250514095350.3765716-1-ben717@andestech.com>
 <20250514095350.3765716-4-ben717@andestech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514095350.3765716-4-ben717@andestech.com>


On Wed, 14 May 2025 17:53:44 +0800, Ben Zong-You Xie wrote:
> Add a new compatible string for Andes QiLai PLIC.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!

