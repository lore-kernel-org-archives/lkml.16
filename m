Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFE52EAE5;
	Mon, 23 Jun 2025 09:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671458; cv=none; b=qudtP93BQDmwFNsH/9tEYB4JzEGt4TYpzGGxroRyGuRFYfhWGjkmNGLXaS3PvKUJf3A/PKauVViiXWJ0oraRhwP7q3myw5GLygQG1bHaskqs8+Za+Qw4GY9O+MbFdjovs3O8FPvINDiy94ufvJXpaRHrDolOGxqGav4OnoYYt1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671458; c=relaxed/simple;
	bh=SwoRLQ+iuWPKqGVWX7YPE161XfI39ceasvYcyMBIjx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ufyRAHDdtJvsK8MEViVx8AUjbMMWPqZBjqJ8rW70mS7HulgiBqW4KsHdqorP2au41YXlgXUheKA8O0IBDa5NtF8OSX3VvZC3bQT3Q97xqjCLBPfE2xWAZkdo9FQ7v3GgGXtFmZmM5YPZlQPeX/WMbcUe07EUocnRXBgk7ESPKss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eg5JeYzi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eg5JeYzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750671454;
	bh=SwoRLQ+iuWPKqGVWX7YPE161XfI39ceasvYcyMBIjx4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eg5JeYziaxU8gpuHcQwT2T8BRQsgn6EzUbazcS9qgbmZwsIcXFP1H40vWmcqVt1Pl
	 5GoqgyPbgCatv6icJmlMG1KSgnaNVGzdbfT/U3jGtEieuvN9VIiTuCfChbpCGVHoVp
	 L5AkIMFPjtCiEyVyZXvReDh9scMKB/iGFHRESnWNPZy37kow8TIdDhH+fltdtgiuug
	 gh1QqwaWuImV5FIv10z0Z4W7US4N6RvyCjmT99xVsRaerGtZ6Mwd4dCDi58La7mxWF
	 9pLGqVsNh6fh72Un8Hq77janpuYIiFYAtye04UeSea9OQYw3Fu0xvsV0V8nLtmY/5o
	 hC8cAKTr0C4fQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D755F17E05BD;
	Mon, 23 Jun 2025 11:37:33 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, bleung@chromium.org, tzungbi@kernel.org, 
 Laura Nao <laura.nao@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 chrome-platform@lists.linux.dev, nfraprado@collabora.com, 
 kernel@collabora.com
In-Reply-To: <20250318102259.189289-1-laura.nao@collabora.com>
References: <20250318102259.189289-1-laura.nao@collabora.com>
Subject: Re: (subset) [PATCH 0/2] Use ChromeOS DT hardware prober with
 MT8192 Spherion trackpads
Message-Id: <175067145378.62389.7783242126407636871.b4-ty@collabora.com>
Date: Mon, 23 Jun 2025 11:37:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Tue, 18 Mar 2025 11:22:57 +0100, Laura Nao wrote:
> This series marks the trackpads for the Google Spherion variants as
> "fail-needs-probe" and makes them compatibile with the ChromeOS DT hardware
> prober.
> 
> Laura Nao (2):
>   platform/chrome: Add support for Google Spherion in HW prober
>   arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as
>     fail-needs-probe
> 
> [...]

Applied to v6.16-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt8192-asurada-spherion: Mark trackpads as fail-needs-probe
      commit: 6cf6156bc71b5234c1dfce5a1a57c0229448ae40

Cheers,
Angelo


