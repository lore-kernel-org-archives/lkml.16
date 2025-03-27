Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0351547C0;
	Thu, 27 Mar 2025 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084636; cv=pass; b=mxjpZFovS+ju1tg+JUh3TQcw3sxBaM6/ZLpNERI4HnZZPemVFu/FoFf1d6HG/PjZ61O3DBf4x8LM9CwCv1rwO62OlmozDvUCZAyvCYY5iwtQIF+E+YelBwS4L0o2p4nyThn6xsJr2hR7cjhI4VF8S1yJRb0hmxpZMwIqPryHQms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084636; c=relaxed/simple;
	bh=xuXc7MvjBMPG9ZEhDFgqZF0gyD5LGfdEXc+1TSAKemo=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=POWLU0oSVd6tm97eD6zWFduHvjlDpUOKkcPT4txq3QxETT46oh/J6H+BB5mKGO4BhtUYgn0O5+D25hroKL37Dr3kF50xhDlj9yeUb+QwDXjU0vtSysyRSzwce7XBlJyxMjMPpE9L5xKWmVNW8bTriLSkFUvAYAChWJ6YYpPDeJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b=Tsu6CDEl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=martyn.welch@collabora.com header.b="Tsu6CDEl"
ARC-Seal: i=1; a=rsa-sha256; t=1743084617; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BR0UwQ2FzQkfwb4yaquRNiD4Ly9Wpgqdwcde1mPx31XkjX5dfmmI+mfUyfLZQhPzpwkuY3NyrfYMGID/M+/MLQEBYLLAuk6b5jHDno5BD21kKbuFzkvQWW/yRrDoxBlucUghHXNx9O2dfnUkSj/INu8kmgx5PZZbKSXYiBUiyfU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743084617; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Rd72ZSp0c1wqOF9wFxJf6YkyT5PHaJKvyyrLNbHW2eo=; 
	b=IlCsronZ4F0f4/mnflStJNBut+OjUwriYtWSm7W0brKX7VvYYPbsQN3EQ+vM6fHBHGXqfpsMZLERR2vhegw31eNoTR1RZqbdB5rQzDBwZ7HzwEr0DuCvZF1AaPKmvb9gR4sF/Za3+E579otkt3ZfAhAVS27vvNdjhIA3gWLQdtg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=martyn.welch@collabora.com;
	dmarc=pass header.from=<martyn.welch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743084617;
	s=zohomail; d=collabora.com; i=martyn.welch@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Rd72ZSp0c1wqOF9wFxJf6YkyT5PHaJKvyyrLNbHW2eo=;
	b=Tsu6CDElz48AMNVpLSkoZmt26tnQtpjXQaE6gooPaxh7Vcqf2jEUnb50av4gcg6a
	fHBLHCsFAd0m31nHbykcWeNujd66UNEexuIuEzvvaz8Q0W/q3jr/eO8z33YfBZ5FoXx
	ckcTNDmAsv5irQwLB/1G6bhD2ZetYIJgop6t2MTE=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1743084616848372.7384738795423; Thu, 27 Mar 2025 07:10:16 -0700 (PDT)
Date: Thu, 27 Mar 2025 14:10:16 +0000
From: Martyn Welch <martyn.welch@collabora.com>
To: "Daniel Baluta" <daniel.baluta@gmail.com>
Cc: "Shawn Guo" <shawnguo@kernel.org>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"Pengutronix Kernel Team" <kernel@pengutronix.de>,
	"Fabio Estevam" <festevam@gmail.com>,
	"Rob Herring" <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>,
	"kernel" <kernel@collabora.com>, "imx" <imx@lists.linux.dev>,
	"linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>,
	"devicetree" <devicetree@vger.kernel.org>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <195d7f07c75.da78a5cf8278.1708647163991154090@collabora.com>
In-Reply-To: <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
References: <20250327120857.539155-1-martyn.welch@collabora.com> <CAEnQRZD15J9GOHFL6MfaLtSkgaN6ksT_YL7GvG2U_St8q2+KgA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp: Add device tree for Nitrogen8M Plus
 ENC Carrier Board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail


 ---- On Thu, 27 Mar 2025 13:00:13 +0000  Daniel Baluta <daniel.baluta@gmail.com> wrote --- 
 > > +       mdio {
 > > +               compatible = "snps,dwmac-mdio";
 > > +               #address-cells = <1>;
 > > +               #size-cells = <0>;
 > > +
 > > +               ethphy0: ethernet-phy@4 {
 > > +                       compatible = "ethernet-phy-ieee802.3-c22";
 > > +                       reg = <4>;
 > > +                       eee-broken-1000t;
 > > +#if 0
 > > +                       interrupts-extended = <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
 > > +                       reset-gpios = <&gpio3 16 GPIO_ACTIVE_LOW>;
 > > +#endif
 > 
 > You should not have dead code in the final submission. If it is not
 > used just remove it.
 > 

Agh! Scanned though it a few times, somehow missed the ifdefs. Yup. wIll remove.

Thanks,

Martyn
