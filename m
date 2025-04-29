Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D80A3595D;
	Tue, 29 Apr 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745914539; cv=none; b=pac024GUgz0Efgzq56Tk5mp9jYfJqjAEG8xCgkRwWDFHhknD4UAemcKOrp1IXxsRj4CghEfmbovLIWONi1RXSuduR/cqjnc/IPxicQqpXWAwkAMhKFgNIDvfYtEX8xUEzGWD/526KmJ1/bWkX8mRcIOb9Sb3adonSWwBzrSTVXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745914539; c=relaxed/simple;
	bh=J0wimz9jKKgoXtvpMIq+8sf+2SdUBW04fvJ8CiLaI2U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NZCanuANZy+GMxA85KINzPRvTD/ekyMWBwjFyrBm8qvak2rvqNOdMCurcnIQ+SHmXEpAw2bDDyWxgtITTi5jhHsmwA1zuiAQXK+IzzfEmag7mrp9c0V1rMSDsSdp43HoalWHmBj9T9WesevEIej5CpJKlTwBrpXXxUDjrCdWa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JJTAKQGo; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JJTAKQGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745914530;
	bh=J0wimz9jKKgoXtvpMIq+8sf+2SdUBW04fvJ8CiLaI2U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=JJTAKQGoN/7XdCMyYzYnMtJMyp9uUUgepOkgrQxt8pU+1K8HpDndJNSKWrrgn4hLi
	 SW+y3IIHPg0iI/bX4Vq7Q08UY1ovhjZql/XpdzgMWy8B/dJ1mopOoP47O19GpqoQuT
	 TbexB1HXDKN4NcWZ9uLTdM81D65teoZUd0AfAsDMdVK2PiyAZurwy9RCxnWbqbJQhb
	 fJ9toNi6TW7N4kIfWa1lx+E3oNKzh4UfJgw3XCPj4BoYvUD7ui0xu13juqHtpuKKnD
	 ZYCLLxfLgR1zUR2V9tEqVlzS+70Y7menlkI75nHKmcIO/umfpmQSuekNYtRvti9Yz5
	 oKq+oTL6kXc/A==
Received: from apertis-1.home (2a01cb0892F2d600C8F85Cf092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 910FC17E049F;
	Tue, 29 Apr 2025 10:15:29 +0200 (CEST)
Message-ID: <885a04cb450c3ebbb9fb831d51eaa76fccbdc827.camel@collabora.com>
Subject: Re: [PATCH v2] ASoC: SOF: topology: Fix null pointer dereference
From: Julien Massot <julien.massot@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	kernel@collabora.com, Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi	
 <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>,  Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen	 <kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart	
 <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Liam Girdwood <liam.r.girdwood@intel.com>, 
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 29 Apr 2025 10:15:28 +0200
In-Reply-To: <f31be238-b281-456a-9069-554e7b5b7019@collabora.com>
References: <20250428-fixup-of-sof-topology-v2-1-7966515a81b7@collabora.com>
	 <f31be238-b281-456a-9069-554e7b5b7019@collabora.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Cristian,
On Mon, 2025-04-28 at 23:37 +0300, Cristian Ciocaltea wrote:
> On 4/28/25 4:32 PM, Julien Massot wrote:
> > Prevent null pointer dereference in snd_sof_load_topology()
>=20
> It looks like the commit description is now incomplete.

Thanks for noticing, sent a V3.
>=20

--=20
Julien
