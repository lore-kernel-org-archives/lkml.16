Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8980F1E0DE8;
	Fri, 13 Jun 2025 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749791997; cv=none; b=Pekvuk1CwhfHtX8n4lpj2gs1FHGAaXECV2xiI861LwMN1zHHJohcMQ+G5Itk+CLBe4fowMFaMVlqGDrFfzpZv3TnhWeYh0qu7Md0KpJ299bMx5IcIqMjxkCgnPOPzjDHUNZdLhVZftx5WIMjJuc69Xbgz95fm2bfrEbVLcsfaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749791997; c=relaxed/simple;
	bh=ptZLwYHmiAC1yec4Gg5juWYzR17LLoKlGX10JLGA4yo=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X2Q3rUT/Ok9ybpm5Pol+NZEcMlyaf3T2QUDVQIrq1OorD6ipblzLPSt2f+lVAda2WB1nhnZAqSIjuVVB5x+/cn/eLsH/TyST0M/xZYmhbFiiIfyYBPrNnTm80e6zkY4xG7alVI8/yM33dYZqg+Kn5q7FxxwqV58ILeeeRbp7OuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=QvuINQWn; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="QvuINQWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749791992;
	bh=j9lhSwodmqSZLtijyE0pSLrkjXtCG6UQNDWeeUmgbW8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=QvuINQWnEYPzu6AiW//WC2jHdsSgWYaKlBuTLW6kwJTlFGj6iAGW8/qDn+talgmly
	 dkG5UehVSGzVgQZQbo5S0KuKFAPzBUsjt86qXJhkf1AHwPV5MPe9FXztTuQ0By/dRF
	 NlCWml1pUnYk+rXEuiYyg6or2JzFHmKKRNi3yzYcyf9DWCgMJkGZW2tnubQ6DEAXAt
	 iqXZQPeIi/euzBI7GXW7W/HbtudZoiWOrURkZSi2XnYvH3a9qt7mFALREivlMaQSkx
	 O1hOL74z78zGYghiRHkm3jlsWEBNypNMZT+Ioxxig9DZphR+NnWX+z/8Ly/F8ubc5r
	 dEuftikvGR4hQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5763A680F3;
	Fri, 13 Jun 2025 13:19:51 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Peter Yin <peteryin.openbmc@gmail.com>
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v2 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Message-Id: <174979199120.342730.12220286428468673903.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 14:49:51 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 11 Jun 2025 16:05:09 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
> 
> Based on:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> commit-id: cb3f397b17bbda3f2998eff9e54b040c8fa85cc9
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

