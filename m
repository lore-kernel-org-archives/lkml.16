Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC73E254862
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744147611; cv=none; b=mTE3gYwn3l3g5MoM5/Aj0+DYMyZjYIYbeN83/QHsIgrmn64HI6Ljhr16vAko68svqNw2lH5nENQ/tHCX5eF2YMzT16x1Yfm53Y9blc3Y3Z6NJQFyNnnpHEoCoe8xvcZaftu9Ehd2jojcSSbrWKZ5u4WxW7fTc179XOxVq5zYtfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744147611; c=relaxed/simple;
	bh=7LKUWjnLCebKEJsYfMC0UFPbE42B0nxtQl4RKlVFaf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rrDZkkqyX2S1cB4FuWNs5Nvrv9D0Xf/jdvsWuZAVDxNZZku/QU68gPrXw0F3vpZcnxePo3inulKGM0Vbp436gpJf7gfFgHO2qW4sQwEQn+9OQdYj/rTFG0+HldH4qFunBk0mA4/jaJMvivSDhBkfVhTUGtGKlZzPqtoaHScQF80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Acji8zBU; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Acji8zBU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1744147606; x=1744406806;
	bh=7LKUWjnLCebKEJsYfMC0UFPbE42B0nxtQl4RKlVFaf4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Acji8zBU7bZxIrppeIevtnXQGo0VjtRQe8ZVq3C3DBj6yLlMMuA/xYk/+0It2dP1B
	 uj785+/b039YDZxFF03+tfoqY1+7st6YHXWEj5R/ib29jWgd8oSNaKoN9FXH4Xhj+U
	 qjakgGE9qS+ADt0UzCzYRR0jM7i3GYl0b64LaItuzx4b3E8r2o4eA4OMisSuV/oCOD
	 7LcdhWC7AQPiWbYx+O6FCxkA1lH/bngMQUpr7E1FlyZOaCh1gTW5cExuN2wYJnA+f6
	 q33B95iX5yYsfCXfdF8ZlOReuELcKMHLq3ediYhbQvg7p4xX/MkwfpmPcD7PYHt/EE
	 YBECgDJZJKrZg==
Date: Tue, 08 Apr 2025 21:26:41 +0000
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Denis Mukhin <dmukhin@ford.com>
Subject: Re: [PATCH v1 1/1] x86/early_printk: Fix comment for "pciserial" case
Message-ID: <GMIIrDo1vH0Ni3cBch2IihNIHQZwVq7fnCCfEUhioMOenKIFID-7Wj79YNX4DCZ77pi1lhJQhKSB-WFgIRm1ogRVb1xr5B1KrhPK6LmbVGA=@proton.me>
In-Reply-To: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>
References: <20250407172649.792996-1-andriy.shevchenko@linux.intel.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 86644e737da1e97c3388400cd7ee9c085200a10b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, April 7th, 2025 at 10:26 AM, Andy Shevchenko <andriy.shevchenko@=
linux.intel.com> wrote:

>=20
>=20
> The comment seem contains the copy'n'paste error when mentioning "serial"
> instead of "pciserial" (with double quotes). Fix this. With that, move
> it upper, so we don't calculate buf twice.
>=20
> Signed-off-by: Andy Shevchenko andriy.shevchenko@linux.intel.com

The change looks good to me, just in case:

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

>=20
> ---
> arch/x86/kernel/early_printk.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_print=
k.c
> index dc053641698c..4a9ba7cb7e5a 100644
> --- a/arch/x86/kernel/early_printk.c
> +++ b/arch/x86/kernel/early_printk.c
> @@ -442,9 +442,9 @@ static int __init setup_early_printk(char buf)
> }
> #ifdef CONFIG_PCI
> if (!strncmp(buf, "pciserial", 9)) {
> - early_pci_serial_init(buf + 9);
> + buf +=3D 9; / Keep from match the above "pciserial" /
> + early_pci_serial_init(buf);
> early_console_register(&early_serial_console, keep);
> - buf +=3D 9; / Keep from match the above "serial" */
> }
> #endif
> if (!strncmp(buf, "vga", 3) &&
> --
> 2.47.2
