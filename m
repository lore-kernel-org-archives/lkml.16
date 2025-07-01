Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E709BA34;
	Tue,  1 Jul 2025 00:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329023; cv=none; b=R/I6OrmOLJLCeMckZdhuOXih3TIENeTGxYd4bvaNnPA+nlOFRCmSgP2+li1IX7Ns8uBTfnT4HY52BK5XZnpadhc9jZF8uYNEMQFisTruFAaYMxFUzs/l7RT10F+XjtUiWBoKe8jK2+Yin+YHP/prpRSIu3E/GMYn34Z8ahVS26s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329023; c=relaxed/simple;
	bh=TLKN5Pu765bVYHav1Rg/mhwuw5Lc7MHjGgEH14LQRCc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ijrI7TlONzhxKq3VAr60gtVdLV2u0qcDqJaj2B1gmAgS62fyhtXP0xhYkrFMCvNuovm38mn4ndQPzESLrcqWckjp5BU3cCNAjMTNgzolQZau7pAWo5GaVwxdwbQUCHqChHbWwpXLiVSgl+j5sD3sBbhL3FcMXtreO6XKl0ZCeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=RZWtX3aQ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="RZWtX3aQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751329012;
	bh=hvoathe2minC31qj03ooB60wR+d2j58arkQnnk4R8YA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RZWtX3aQ1OJJSOcPc0ETc2Ze7JRQhY1qj+uePmSqazjcFGU5y8b22+UowAKECjvXl
	 rpnm9le3jfroboA1St2+StF5q39pnMd+gjURPYFVRHzvjyY5YW24J9t+E98C6inJUO
	 SsV64c6V2TzTfR+wVCiXnpITnjcM+q0SpkOPbCnR0N+N77skmsVTb5XVoXnXWK1CS9
	 p/oA2+S1pn910DbpDa37e+5KgLnv3AOGq4LrBQAnwO0e94IVZ9LU1mbPH95qF1VPqW
	 ZSycR8mSa82XoEOGAsOCY3j2ElclyPZExZQUgtHDvLGhGS+Cn0XP/yYU097Vd25Cuw
	 dRYhBE2BfTEqw==
Received: from [127.0.1.1] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2C47E640B3;
	Tue,  1 Jul 2025 08:16:50 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: patrick@stwcx.xyz, Marshall Zhan <marshall_zhan@wiwynn.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250630073138.3315947-1-marshall_zhan@wiwynn.com>
References: <20250630073138.3315947-1-marshall_zhan@wiwynn.com>
Subject: Re: [PATCH v5] ARM: dts: aspeed: yosemite4: add gpio name for uart
 mux sel
Message-Id: <175132901095.54792.12200042730026640443.b4-ty@codeconstruct.com.au>
Date: Tue, 01 Jul 2025 09:46:50 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 30 Jun 2025 15:31:37 +0800, Marshall Zhan wrote:
> Add gpio line name to support multiplexed console
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

