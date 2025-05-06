Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385BD22DFB1;
	Tue,  6 May 2025 08:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520401; cv=none; b=iDR+sDtz7U3KceT6U7DdzhBj/OpFkXWAeFPXzxMZaHHSOPEF98NjIdyArexx5dVK7djszqST96potvxSiSQnYyIRcq3jvGW9fNIma9faoM22p3YbiKguAUcOhJBc2mUNaD13/686+fQoOpkMe2lmVEK+b5Y5swDXlxMOxUMUPd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520401; c=relaxed/simple;
	bh=Xz/XZoWdLK9sjxD5LgW3w0A+B+hpmKHOEi8obS3nq38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ak7LW9V7SMdP15euZOeaAWYq9WJIzI/tvpQ5Kcy8S7ZdwuSIkTXJfphUazg6CLRrtj2ZklKCDXcJOHUgqaOHVN3JYANet4BP2tjKJA/uBojDkNnWgXpYLH87WOLi4XoTCzRbvAqMYovWrytfLHjjtsn1AMEf4xZoTaLvOV+mMsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=j9Z2yEth; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="j9Z2yEth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520398;
	bh=Xz/XZoWdLK9sjxD5LgW3w0A+B+hpmKHOEi8obS3nq38=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j9Z2yEthJUOpZhCQGy8ad6UVLa5tE+PmU25AQXWomdrypN9ePQmxewE3PfoVuDkJH
	 x8LMGp6bm/c0H5lSmZ4dEHNd3M4Uu5tkhNlaLLZHBJY8fVAtoO+7mheqa0/fWq24WY
	 JMW+FSRIMKyxlZ+CNCCiPxg4qUaPhU/UZ/D4w1+7PEHdjVy2nyGjWJVUlypqwt0WdT
	 AxwUWEGWTOlBMCAq9k77tkUr9+dv2dkbehKgKaC5wooLsH4+hpA+FS6owyAYhQGOci
	 5n5cBP5saJDzr7N020b95TWO8dVLfLAeA1bAvcCqg8bOl6Rjrspr//+3Ar86KYeW8r
	 qNN6okFAWJICw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF62217E049F;
	Tue,  6 May 2025 10:33:17 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250409205001.1522009-1-robh@kernel.org>
References: <20250409205001.1522009-1-robh@kernel.org>
Subject: Re: [PATCH] arm/arm64: dts: mediatek: Add missing
 "#sound-dai-cells" to linux,bt-sco
Message-Id: <174652039790.26427.3827996167340215423.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 09 Apr 2025 15:50:00 -0500, Rob Herring (Arm) wrote:
> Add missing "#sound-dai-cells" which is required by the linux,bt-sco
> binding.
> 
> 

Applied to v6.15-next/dts64, thanks!

[1/1] arm/arm64: dts: mediatek: Add missing "#sound-dai-cells" to linux,bt-sco
      commit: b8202a12cdd771b55a9565814022ea8c69572cd7

Cheers,
Angelo


