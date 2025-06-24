Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586F43C17;
	Tue, 24 Jun 2025 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777432; cv=pass; b=B65uLAV7sQmK/TYSx4xYIGFqNGEHxjonMoOLZTU/oF7V19mc0lQfZcwF72okILNHlp2o5aUNkjDlJJ4aJbukUxQK6dxIsghehi+3KhsfxMuGOr+JHAXF2+BCqKqeWBVfH0lF8jhlGIy04jsToUp1oMAYjQx2mcIkRuJhyHQqSpQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777432; c=relaxed/simple;
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zm1uQ0mGtOwLW0xnWCsNq4rBhB4JFkobvtVRxXZm8FT/RUMhArT4gl4d6FZdUXArFC5dYdMXHVSdonlGjo4D4gwzQqHzPNdwh3dZq1u6Xo/4luUwloWJbfhzUzQ4GlTL5WCPJJ/YrTocaGtKZ8yyK7xRpH3YIjM4pLxibaWSlFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b=BGcojCJT; arc=pass smtp.client-ip=136.143.188.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nfraprado@collabora.com header.b="BGcojCJT"
ARC-Seal: i=1; a=rsa-sha256; t=1750777414; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QNhvekAmOyJlSaTPeOgdH1E2Ub4zERAV6edgOXXdI0FUdEpW7V/FCSUdBUnW6H6Puq5FmetNYBwHUNWM0Zs3H+3ExFeDFWsKbiSh/xoyDX/vKm2wf0GCkTF4wFVQDfXQDYeOMYkCrbz2vBVYuilte/Sm/cY8weRn6C3jDdQCXUA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750777414; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=; 
	b=eTcwFEa7cgN+sJI/MQaEVvj7GY/8WfHQnvRO2JLi4xtAnO1D3JxYrKSVtjLJfXxxl4LDFpTfzppV3hMaG9pw9E5WguludlhgLxIKODPZP9Sd55q7m2iWRlW7hTpGewYANIk3rsdwMgHD0plHMcqM8+HkrPAX+8AqJndn1CSimE0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750777414;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=C9Hv1uTZX3yr514rv90DZ1Rmj6G2ElIhixYW3I7htvM=;
	b=BGcojCJTmLwUDU/okdPTeoxUIln1VdOuHJw0JK+z3tpC8f5TzfqvTCYFeb0gxFgT
	4hURD370c1Ndko/lmXC0l0G0BCuyD1QjzmESRKGIEwiw0up6sZhKXfeUwzUeBFhWbN1
	l67b63G1lgJAFVeI5OjUXFyy/kNX7mdkFQ3J+cBs=
Received: by mx.zohomail.com with SMTPS id 1750777412568887.5168202530137;
	Tue, 24 Jun 2025 08:03:32 -0700 (PDT)
Message-ID: <60d033a5380674c3ad45d3245de63aacc5d73f73.camel@collabora.com>
Subject: Re: [PATCH v1 0/2] mfd: Add driver for multifunction MediaTek SPMI
 PMICs
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	lee@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  kernel@collabora.com
Date: Tue, 24 Jun 2025 11:03:30 -0400
In-Reply-To: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
References: 
	<20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
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

On Mon, 2025-06-23 at 14:00 +0200, AngeloGioacchino Del Regno wrote:
> Some MediaTek SPMI PMICs, like MT6363 and MT6373, are multi-function
> devices, as they have and expose multiple sub-devices; moreover, some
> of those also contain an interrupt controller, managing internal IPs
> interrupts: for those, a chained interrupt handler is registered,
> which
> parent is the SPMI controller itself.
>=20
> This series adds support for the MT6363, MT6373 SPMI PMICs and their
> interrupt controller.
>=20
> AngeloGioacchino Del Regno (2):
> =C2=A0 dt-bindings: mfd: Add binding for MediaTek MT6363 series SPMI PMIC
> =C2=A0 drivers: mfd: Add support for MediaTek SPMI PMICs and MT6363/73

For the whole series:

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas
