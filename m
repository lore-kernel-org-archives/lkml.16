Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F322C325B;
	Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876789; cv=none; b=eAeKfAJu+iGc5FrTqHjlIKkZ8N2ukfWDI+okaZkkt2zHYhY5wO/X4LInT1gJbSIr2paPoJegvBq2AnKcX9cRNSEQ3DrR5kRo9ClJZ1iwW/GbymucTLdH5f9MgJMELGHaqOUIk9PNoUMmJmNdnnBnFMFQKWfN5S+oyvLOWkKfscs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876789; c=relaxed/simple;
	bh=Ne3gQDGNR+fc9eT5DJJdL5V8H/ySv24dUclSgAsgI3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+uTjlcI/geO8/E0z1WlczwXsJglCcfj5263rJCa/fu6pnAPqzFfbzixppTcFXzi1eGoVBnCWEt2KFHffO1EfP6BoA8/FUo586fbQuaJLbqQpSYcPZUzVOwYrucgzxQqT3WlOFzyLg2KCGg+XqaIMdAylMgX4C9HKaUrBoYBbQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8RXNkr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8RXNkr5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D290C4CEEA;
	Wed, 25 Jun 2025 18:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750876789;
	bh=Ne3gQDGNR+fc9eT5DJJdL5V8H/ySv24dUclSgAsgI3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8RXNkr5OwQEpMXK4RtS9V68i1Qvq4HEAJav6fuIAKALQUxJMU6tKWh8NO6ushrn5
	 zCRTdqWH7DdODZySzkau7PCNaDBXcOw9jmstHn4bOYi5csSpCSFM4zvV+iOBhFjTI7
	 iMocPlkq/T3MltzRWEZw4xMK9+ux8p79GjOx0pjCXPFruteFC7LB3WkubdO19Wvcy7
	 deizZzbng8niI2ibvLX4zNp4sY3BOftfvri48XQNigiT5B5Q6xmer8ILjjschjt08f
	 hxvb5jJlH6iJGfUuCIqFXOG8f1LMqC/ntianHDZzsH+pIK3Ea7XfCx/NA7a5G4oyRL
	 /P0ol9R0EwZJw==
Date: Wed, 25 Jun 2025 13:39:48 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Pascal Paillet <p.paillet@foss.st.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Etienne Carriere <etienne.carriere@foss.st.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/7] dt-bindings: regulator: Add STM32MP15 SCMI
 regulator identifiers
Message-ID: <175087678758.1997493.17415728035364820579.robh@kernel.org>
References: <20250603-stm32mp157f-dk2-v2-0-5be0854a9299@foss.st.com>
 <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603-stm32mp157f-dk2-v2-3-5be0854a9299@foss.st.com>


On Tue, 03 Jun 2025 11:02:09 +0200, Amelie Delaunay wrote:
> From: Etienne Carriere <etienne.carriere@foss.st.com>
> 
> These bindings will be used for the SCMI voltage domain.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> Signed-off-by: Pascal Paillet <p.paillet@foss.st.com>
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> 
> ---
> Changes in v2:
> - Add external regulators and Pascal's SoB
> ---
>  .../dt-bindings/regulator/st,stm32mp15-regulator.h | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

