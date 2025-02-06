Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65889215079;
	Thu,  6 Feb 2025 09:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833977; cv=pass; b=QreDaSTIIyW0heSOShhmbtnHiAVHi9IA6jat3plTQmOoad7gl1OuoqB74EPmEE4z/7mNNxfa9oP2DRVrcodaf634qqfBZTSiOnweUL+TxK/ORbpplpUYHmrVSUmNgNFpSohH3sC45jqZvlinRxZSJvC2lAuVcBjGVMzBwTiwuuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833977; c=relaxed/simple;
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Slhl60EkjT6in78HKjaxXz0p4jjeAWrwCoeMVrpezHSdRArpbD4gOmkyys2lh5BBIgWH8qbtE5KguzOEjljeyp/7M+oTsNG3CHbDanGjM18ZN9fbpIxJYTxdfzhYHamR5AFJdf3ZklYi8OyCVZLDVHQSZRVRtZPz7ve3e0TbQcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b=XixU04o5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=louisalexis.eyraud@collabora.com header.b="XixU04o5"
ARC-Seal: i=1; a=rsa-sha256; t=1738833953; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=i8qmlm7TQ9YdxwhBzd7v5DxSdYVKqHb9rqfhtyynEIWGfb5Px1J1YHVJAB4fGsgA4qcBIUnWS2cbIf3p09NkfgQs7MukwZiBJZwK9F+dURTBHsaNP4wDh1gA5q7rNX6HRu30qHx3uoivLKXpD16GgonbjrUByJUAYqmNh6XLrko=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738833953; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=; 
	b=DYoq1DD6SveaaStvmrn6xyWMB+NfNWq5Xb+l0hRCYffV2ILQTQ/5jgajRgUd+q67Sk4AngnuPwud+th1ZI2uFlI6+iOn2t2PPtU+djWrO8jDfdS/QEk6oCuyhX23wt5if6dFf/5ppgSo6lWitSDa9BGyeFP8hG/zlWm48TFZfSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738833953;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Wzd+dOcVOVn7IKH7PTteO59qiKoj7qRfKTgzHatX4Rc=;
	b=XixU04o5JpLnZ8PmlweIXQbaj5w/Gx8QBL06y9vY/L0mCcqyiT7GgMARa9sNBrkE
	vmJVcGdmkL6Ngh9WW1YZfOIpL1zrixFYNxOfLpysrpS9QtkKR1GjeOMKQUthSbJ+n3L
	p0YdM9Bq9LC8BZnlWMajJ6LZlZMt75KZSrmcarLc=
Received: by mx.zohomail.com with SMTPS id 1738833949854891.3350291196675;
	Thu, 6 Feb 2025 01:25:49 -0800 (PST)
Message-ID: <6f893666c09c39159fa0c273c435cf53509f6fba.camel@collabora.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: mediatek: add mt8370-evk board
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Date: Thu, 06 Feb 2025 10:25:46 +0100
In-Reply-To: <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
References: <20250115-dts_mt8370-genio-510-v2-0-fc9b01d08834@collabora.com>
	 <20250115-dts_mt8370-genio-510-v2-1-fc9b01d08834@collabora.com>
	 <83a354d0-e220-449e-b03a-12012ab0d5b6@collabora.com>
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

On Wed, 2025-02-05 at 15:21 +0100, AngeloGioacchino Del Regno wrote:
> Il 15/01/25 11:29, Louis-Alexis Eyraud ha scritto:
> > 1. Add compatible for MT8370.
> > 2. Add bindings for the MediaTek mt8370-evk board, also known
> > as the "Genio 510-EVK".
> >=20
> > The MT8370, MT8390 and MT8188 belong to the same SoC family.
> > It is a less powerful variant of MT8390 SoC and their main
> > differences are:
> > =C2=A0 - Arm Cortex-A55 cores number (4 vs 6)
> > =C2=A0 - Arm Cortex-A78 core speed (2.0 GHz vs 2.2 Ghz)
> > =C2=A0 - Arm Mali-G57 GPU core number (2 vs 3)
> >=20
> > Like MT8390, MT8370 hardware register maps are identical to MT8188.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
>=20
> Since you have to resend the series, please remember to add Conor's
> Ack
> that was released in v1; in v2, this commit didn't change at all.
>=20
> Meanwhile... please also collect my
>=20
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
Hi,

I'll add the missing code review trailers and fix the commit message in
the other commits before sending the v3 patch set.

Regards,
Louis-Alexis
