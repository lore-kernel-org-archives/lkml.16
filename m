Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137AA2BEFE5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751026290; cv=pass; b=IQcZMX5y2DbxAPiQegWi68MEdZkxwruR/a0hZ4sz6zXZN79QK76GVvvymLSzOdHTUt/EQVZfufThjXFPFbSzbIDJl7Gb1RT0+uPAhMmPitWit1AJhsBC/bekkAnuciVA0eAqAcos4aBxPeqsJTKzwbo0W+9u00XvZvkQ1EhInoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751026290; c=relaxed/simple;
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YVEhq5z8cYRZ6PpBQI3A5FFn5h1jA1k7om8tBLRG45ifLJTVIkfiUjgfwjIJ0epIgZa+y4Z8WROa+uVNwvEjfKx9zdQIkEffx3WCG7u3hWuLwCHnrt8Lx9SZ8BSK/CcjxbpRKFek5PgAsxOotnlhN90RIQRceKie1pJ7HFeIMsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=ctkqGwwl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="ctkqGwwl"
ARC-Seal: i=1; a=rsa-sha256; t=1751026271; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cb17DRa+OxjLrwffY5Uj3xYEaiaGmne6sU848NVhVV1eQ3rhc537meq1Vmf6aIAVEs8nNK8x3A1ar3Hw3mvWcMTg25AROWNwkRtKrwkMSTtLzkf0NYz4C4bcsQ6p0iTYFhLxAOOH9LHep9vUB1XeWUPW7zCH9CsvkOEGNlDgUV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751026271; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=; 
	b=WA0HZvOONA5TpwnslXEz/Tkkc9MDxU6c2rMp/t+aX6OQWc9kMV25X+fdRg05rlxhvNGd8BHJ1ootFnV7okW034JUgGXTxOYiyuZLWDTgusN11QiY9FC+5Vtfgao88aS34shPiw5TKTH+blnhk0F3AOoAh4DW7B4dfpBFHtgT3eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751026271;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=;
	b=ctkqGwwlGpULEtLxxvVc8Kv7Mc/irU8SYUzepCakFCtCNMUKyZCUc1/g8YLkXn4j
	R6RXe3YzTCP7wA8OKF1WFVZ2kNzFzNc9pzEPJHBynaIVMNJoiZHxNoGSBPYPx9ZJxb9
	LRiqAZkXcSwurY/h1sJcEwPlW07qbKyZXG6gXr40=
Received: by mx.zohomail.com with SMTPS id 1751026269193941.7172522916828;
	Fri, 27 Jun 2025 05:11:09 -0700 (PDT)
Message-ID: <903b8ec6ab8527e680b43dc7cb8aa7066a555247.camel@collabora.com>
Subject: Re: [PATCH v2] arm64: defconfig: enable further Rockchip platform
 drivers
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner
	 <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	 <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 08:11:06 -0400
In-Reply-To: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
References: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2025-06-26 at 22:41 +0200, Nicolas Frattaroli wrote:
> Enable the rockchip-dfi driver as a module, which is used on RK3588
> as
> well as RK3568 and RK3399 to measure memory bandwidth. For this, we
> also
> enable PM_DEVFREQ_EVENT, which is a requirement for this driver.
>=20
> Also enable the rockchip-rga driver as a module, which is used on
> various Rockchip SoCs, including RK3588 and RK3399, to provide 2d
> accelerated image transformations through a V4L2 interface.
>=20
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>


--=20
Thanks,

N=C3=ADcolas
