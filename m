Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0CC2288D0;
	Thu,  6 Feb 2025 11:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840128; cv=none; b=VW5kuDUX4RP+TX97VIl9rt0nrowS1Rm7qUWfbXta7/fD32cwuw7/+nIT6K5eA9/RkLoQLcqiLVTe9QE0s3Ha4TogClR5wLJB7atIo32SVY9uHYMbMpe0uZCvAWwbg3oi4Xfz7UvQSA0MRFqSoxh4N0NfkxDY3CQdM9wDNL47Mf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840128; c=relaxed/simple;
	bh=YsyAjTedAN5lyZo0FlAMasVTbgpk/AriGqi3k2NqfyI=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JyWR7Lv7WiiS1s/9Mdrg08nwDWn3mO62AzNX/ZbijbYcbKrsL6A6vtP+wWGMPZxfEqBDui6ARRtxWd6sIwfsWrXQN8CNRZ0EcbfRU8zh6Uqya23skvIF9UdkwanFZcdsNPctCX0n5NtJV5rDrsZ9jg1zAPRIFFas70KkZdPnIqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YO9wn3cq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YO9wn3cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738840123;
	bh=YsyAjTedAN5lyZo0FlAMasVTbgpk/AriGqi3k2NqfyI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=YO9wn3cq+a2cUFa1ojHtArWBgvsEXO2/5exII35hqGFtERjeT/HUdGMicR8is2p42
	 PMAh5yoAiaONcZ5/4ZQetDuCBICzQpnYXGBoN+uG6+5wuFo4EWdtL0F4/2TBj7JzuV
	 UasLuj0oBb/g6Ciwbv1L0vAF5Cn9YUzs1zktw2IPiptsVngA6xzP6iywkOg4RTk1w1
	 2D4FLbeSvEGL5truUC0NHAytEeqzTP6jgH4+KsvnQ3cNuKuHif5lBjICFaTbdt7SYF
	 iYl3eJv7P2Bl8Jp+asbIRZQGHosjZqdxzph/GiLg8cVAE/sFtjaPIJV5MNXbrX0VFh
	 PFtI27MiYf6ig==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 510A617E0F9F;
	Thu,  6 Feb 2025 12:08:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, upstream@airoha.com, 
 Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller
 node
Message-Id: <173884012324.110657.10404370781267442733.b4-ty@collabora.com>
Date: Thu, 06 Feb 2025 12:08:43 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Sun, 05 Jan 2025 16:03:02 +0100, Christian Marangi wrote:
> Add Clock Controller node for EN7581 SoC to correctly expose supported
> clock for any user in the SoC.
> 
> 

Applied to v6.14-next/dts64, thanks!

[1/3] arm64: dts: airoha: en7581: Add Clock Controller node
      commit: 7693017580e9be839fa5f27130bb6500f3597595
[2/3] arm64: dts: airoha: en7581: Add SNAND node
      commit: 8e2e6908a8919a8608866626e5b3bcf242f90b38
[3/3] arm64: dts: airoha: en7581: Add default partition table for EVB board
      commit: 34833a6f17f6ea99fa9d7788d93221f610061d23

Cheers,
Angelo


