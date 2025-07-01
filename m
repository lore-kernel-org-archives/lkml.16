Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9EC22488B;
	Tue,  1 Jul 2025 08:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360158; cv=pass; b=ZQr9SPS0/O+VhEOWuj7nk4sqYvmo37oXaW2ob1zdoJ18oEW9Zh7UWlTeRk289XoDpEXG1rm61REHVtJGBBIp2SwmjgPB2qRXIKZo1K2d6jPuvCxQZLHzWV6IoGBkS0ZcDRjtsjCPRNvzVcK1/7WP0vC6UcEFs1dZGJUd+pFytRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360158; c=relaxed/simple;
	bh=k10PVkQT/9l2bcOjXOjH+r6VpHPgv0j15HJsYBK9uFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S64rUPkRIzqcONslPKV85c7M2VAH8ysZldJcVB4WmYXaoO2mygQrEd8opg3yBu8w992MsR+fg2r6L6RMBRcss+miB4aE2P8CdC/LVVcVG86r79sMgyb3mPZlWiZZAMPvnnJ/zT2T7RVvR4BlMkZnLSPMw0h/03sWXlGCZVGR278=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=JZ2VrbNa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="JZ2VrbNa"
ARC-Seal: i=1; a=rsa-sha256; t=1751360128; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iXVLzTc0MYcUhCmNc0zoT8nYZniOsIwfRSdBoWAfmk8a3Ib7qya7A78A7WGWbO3ipKncfG9dW5CEW158AUEqcbE2qsA9COJ0UwsALbsbWmjN5K/hJwvRaZwAe9RHqOUmBm/M2TZvKyNdxNF8BA9YFBMxXyWxcYJR8pgaIzTuR5s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751360128; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=; 
	b=gQw3TB5guJkE4ZVQQGU1sFnYxUQzpsv//xEYk08I//G0VWcODeMs+5dBnIC42r4LcrygQA8jvPNGvqMVSA79gw+Qw3Q8pQVaTbbasRLaKkoHEXsFZDSHMnUpeMa4Q1le++i5RAp3JaOq5Uxr3VXChZTz86XfUaFBLmLNQ4GrIM4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751360128;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=LBaHHeBZtreqORo2ZrKJra35Hs9YmlKhQvZuFYmqjYM=;
	b=JZ2VrbNaTm3OpMX0YVnCl55PmHvPYXyQnlT1ukmO0ND2/Ypap1INngGBZHGOIy+Z
	Y7Yqzpa2LmBdNATgtWoIQ6LdDI3X9HPN3BmCRqLdW/SHABuJ0QJ81S+TfdVGdNsit4H
	eJUEAJ0TIOr4/zbT5ChIQNTsWrhaHaEEdecBdfSY=
Received: by mx.zohomail.com with SMTPS id 1751360126517482.5342375792277;
	Tue, 1 Jul 2025 01:55:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Subject:
 Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
Date: Tue, 01 Jul 2025 10:55:21 +0200
Message-ID: <5039013.31r3eYUQgx@workhorse>
In-Reply-To: <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
References:
 <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <5acizoywvjolaffojiawqlzixiclrqzohuhq55lbsjm6yhhlwi@w2amqugl3ee2>
 <DB0KL629S4E4.3ENNM27XN3IYM@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

On Tuesday, 1 July 2025 10:19:33 Central European Summer Time Diederik de Haas wrote:
> Hi,
> 
> On Tue Jul 1, 2025 at 1:10 AM CEST, Sebastian Reichel wrote:
> > On Mon, Jun 30, 2025 at 08:12:27PM +0200, Diederik de Haas wrote:
> >> On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
> >> > The ROCK 4D's actual DC input is 5V, and the schematic names it as being
> >> > 5V as well.
> >> >
> >> > Rename the regulator, and change the voltage it claims to be at.
> >> 
> >> Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
> >> sounds problematic ;-)
> >
> > This is basically "just" documentation, as the DT just describes
> > a fixed regulator (i.e. nothing software controllable). This just
> > changes a number in sysfs :)
> >
> > Note, that the 5V DCIN is a USB-C port, which does not do any PD
> > negotiation, but has the 5K1 resistors on the CC lines to "request"
> > 5V. If for whatever reason a higher voltage is applied (which does
> > not happen as long as the power is provided by anything remotely
> > following the USB specifications) there also is an over-voltage
> > protection chip. So it's not problematic :)
> 
> I was worried about and wondered why I/we did NOT receive reports about
> boards being fried. Good to know, thanks!
> 
> > OTOH adding a Fixes tag does not hurt ;)
> 
> Cheers,
>   Diederik
> 

to add to what Sebastian already said: I purposefully didn't include the
Fixes: tag because there is no functional change here. I don't think
cosmetic fixes are worth pulling into stable kernels unless they're a
dependency of a follow-up functional fix patch, which isn't the case
right now. If such a functional fix patch does emerge, it can explicitly
declare its dependence on this patch, or even have our robot overlords
figure it out itself.

In that sense, I do think a Fixes tag hurts, because it needlessly
adds to the patch queue of the stable kernel people, and it's worth
pointing out that while I claim this patch has no functional change,
that's always predicated on the understanding that it does not
unintentionally break anything. In this case the chance is essentially
zero though, but I won't bother re-rolling this for that tag alone.

Regards,
Nicolas Frattaroli


