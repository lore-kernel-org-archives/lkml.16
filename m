Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A72D1D5CC6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749780421; cv=none; b=j0VhiQZEesQpwnyfVXwcnXqJYxtS2rcFYHaUlQfNKfs51Y6/R371McE1NZ1eh9cf0/lJsLmICGM8RfIakf139oG91MKgWIn1Ey3/8QlKsfq7vkjV+4NYlnUtyGwT39ytyUsZ3xc4nNLwporLdSQaGnaVdcv7AwWSdXmQ1nhNlQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749780421; c=relaxed/simple;
	bh=nCxKwbZk4e1A1IebS659hmsoseH4KT29iPS1HkLVXXE=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=KuXs1PV9NWxDzNYLiQ4CXdnBSe2bIWlx2tbFoyFGi2kYa97djuGWErM9O8ShShBo7aP8A0tU9WhZQZpSmU6VC4n6974JDN+uccCYynkWB+90FNKLMEr8MLneCnwS1/HjnyKAoKmAAig4o0GpEemNK3kdXEVrbt6+UxvpP5GqmDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZWQdhMxB; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZWQdhMxB"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749780407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q1hLQZrnvipPz+3ANyt0Y2ORYvaf1oK6TEmtgPjNftQ=;
	b=ZWQdhMxBz57PYxRverZ/XRcz6H+dQXt7NKN9SaTlFGJhoWD4jfvwxj6X+zJKrAyWbB+SA+
	vi/v3h8YQA3YqNin1MBts/UKWsfmcyXTDBjquOHqqLy8Auo6ekiXI06v1yOMkEyOyxIbYn
	H6rgxpz18e6WBJkXXXYVt8j+63/0zfE=
Date: Fri, 13 Jun 2025 02:06:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yajun Deng" <yajun.deng@linux.dev>
Message-ID: <2d5322bce3f450da329e5e146bf0a850afa55fe4@linux.dev>
TLS-Required: No
Subject: Re: [PATCH RESEND net-next v2] net: phy: Add c45_phy_ids sysfs
 directory entry
To: "Andrew Lunn" <andrew@lunn.ch>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <737294c1-258f-4780-80f8-e7a72e887f8b@lunn.ch>
References: <20250612143532.4689-1-yajun.deng@linux.dev>
 <737294c1-258f-4780-80f8-e7a72e887f8b@lunn.ch>
X-Migadu-Flow: FLOW_OUT

June 12, 2025 at 11:31 PM, "Andrew Lunn" <andrew@lunn.ch> wrote:



>=20
>=20>=20
>=20> +#define MMD_INDICES \
> >=20
>=20>  + _(1) _(2) _(3) _(4) _(5) _(6) _(7) _(8) \
> >=20
>=20>  + _(9) _(10) _(11) _(12) _(13) _(14) _(15) _(16) \
> >=20
>=20>  + _(17) _(18) _(19) _(20) _(21) _(22) _(23) _(24) \
> >=20
>=20>  + _(25) _(26) _(27) _(28) _(29) _(30) _(31)
> >=20
>=20
> Is 0 not valid?
>=20

Yes,=20the MMD starts at 1. See "include/uapi/linux/mdio.h".

> >=20
>=20> +#define MMD_DEVICE_ID_ATTR(n) \
> >=20
>=20>  +static ssize_t mmd##n##_device_id_show(struct device *dev, \
> >=20
>=20>  + struct device_attribute *attr, char *buf) \
> >=20
>=20>  +{ \
> >=20
>=20>  + struct phy_device *phydev =3D to_phy_device(dev); \
> >=20
>=20>  + return sysfs_emit(buf, "0x%.8lx\n", \
> >=20
>=20>  + (unsigned long)phydev->c45_ids.device_ids[n]); \
> >=20
>=20>  +} \
> >=20
>=20>  +static DEVICE_ATTR_RO(mmd##n##_device_id)
> >=20
>=20
> This macro magic i can follow, you see this quite a bit in the kernel.
>=20

Okay.

>=20>=20
>=20> +
> >=20
>=20>  +#define _(x) MMD_DEVICE_ID_ATTR(x);
> >=20
>=20>  +MMD_INDICES
> >=20
>=20>  +#undef _
> >=20
>=20>  +
> >=20
>=20>  +static struct attribute *phy_mmd_attrs[] =3D {
> >=20
>=20>  + #define _(x) &dev_attr_mmd##x##_device_id.attr,
> >=20
>=20>  + MMD_INDICES
> >=20
>=20>  + #undef _
> >=20
>=20>  + NULL
> >=20
>=20>  +};
> >=20
>=20
> If i squint at this enough, i can work it out, but generally a much
>=20
>=20more readable KISS approach is taken, of just invoking a macro 32
>=20
>=20times. See mdio_bus.c as an example.
>=20

Okay.

>=20 Andrew
>=20
>=20---
>=20
>=20pw-bot: cr
>
