Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B6F322E;
	Fri, 31 Jan 2025 11:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738321379; cv=pass; b=mWf+rX+ybMwlBcM2ZggjfQvvbxDxOQ1UWDNwyXb6SL5KedJylgdFJ6dIfRYM18mQZrNB6AcJrh3Ly3/citYqWFBM9JhZbmJUfA7YvJISG1MmqHr2XsVxNpXKxR/H25lQCXq8Drs+6gBegbQj85Lt8VLSuNxqZ6ZKJw0SKZp+1pk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738321379; c=relaxed/simple;
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ovoLeXED2X7b7qgwcXL2v9FDI1fM+qlmf28AbwZvzEMg+YR+1HUz7Ag1dTXUbM4NPhwhzxP7d72o7TayOryF0hvJvkE9cz21GlwCVe9O3mRCEeuxC7MThT2Jcpuv8RtT2lmrm+enxu8UMoCCuxaWfTpxov+81TBX3bntWIpLNMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=AsPyoanP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="AsPyoanP"
ARC-Seal: i=1; a=rsa-sha256; t=1738321347; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hkql+bgGsvPgUJbPyMiWHR3VvDrgD3/F2Fvco6ZqedgPxoNDct9nPoroK/UOC1kg8fiKi2MwL6CgzCAE9/gzg+T1Mk/Ly2GWJSHMUtmWzSIMwqycUrHJHMLwwhLw8iJbxWJN72z1lyC0zLymeHrPlQTegGctm93eEpsF9ka2wBY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738321347; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=; 
	b=WSkZ36BG4IYlZYIZSpBtsHGTfoBKrNrVDfaB0tSwC/7NfiFt6NlFho0ZcVElMwuh8Caup6iLzQ6Bd7JCBaCb5ufANpTjllZt+UWXOMFZ64xw9t7MYOmuL0aykqsGXOSd/1DClH6fhba/X4oX+gjFxdkVLeDDFRdnrXWke6jCCFk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738321347;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ezAMBD29GkkB4e4t8a/2A1rSsnKm9LPumN4NESuMnWY=;
	b=AsPyoanPmBfmqtoZVvtj7k2FLUm21bkSi7HNPPMp6hR2oKm2q94Lfi7d+mr4lpz/
	dMn9S51J90ADF/Qj45pmfVL4/k7kCTjMGoR9DwKrOHHKj4EVM7qXoaT0Wnf13hXiPYZ
	wZ0BSVaw5ZheIl4LueSw73Y7ZVpWXx0WqFE+H7VU=
Received: by mx.zohomail.com with SMTPS id 1738321342354706.4067778296129;
	Fri, 31 Jan 2025 03:02:22 -0800 (PST)
Message-ID: <8b924147e03693d04e1800b19a65ac773b699365.camel@collabora.com>
Subject: Re: [PATCH 2/3] drm/panfrost: Add support for Mali on the MT8370 SoC
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard	
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, Steven Price	
 <steven.price@arm.com>, kernel <kernel@collabora.com>, dri-devel	
 <dri-devel@lists.freedesktop.org>, devicetree <devicetree@vger.kernel.org>,
  linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Fri, 31 Jan 2025 12:01:51 +0100
In-Reply-To: <1003b393-770a-4e2b-b5ed-054f1f9072b4@kernel.org>
References: <20250116-mt8370-enable-gpu-v1-0-0a6b78e925c8@collabora.com>
	 <20250116-mt8370-enable-gpu-v1-2-0a6b78e925c8@collabora.com>
	 <20250118-meticulous-black-caracal-ec7f0d@krzk-bin>
	 <194b7237128.10f9923a41656565.5574753983898665940@collabora.com>
	 <1003b393-770a-4e2b-b5ed-054f1f9072b4@kernel.org>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External

On Thu, 2025-01-30 at 14:21 +0100, Krzysztof Kozlowski wrote:
> On 30/01/2025 13:15, Louis-Alexis Eyraud wrote:
> > Hello,
> >=20
> > sorry for the delay,
>=20
> You gave yourself 12 days to respond, which is fine. But to me, you
> gave
> 15 minutes and immediately sent v2.
>=20
> So now your v2 will be still rejected.
>=20
> Best regards,
> Krzysztof

Hello Krzysztof,

my apologies if you felt offended I sent my v2 patchset too early after
replying on the mailing list.
I meant well.

As I felt your first remarks were appropriate and precise enough to me,
I've submitted a second version so that the modifications to review
could be available shortly after my reply.=20

I'll be more cautious next time.

Regards,
Louis-Alexis
