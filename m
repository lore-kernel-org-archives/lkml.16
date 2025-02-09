Received: from bits.crawford.emu.id.au (bits.crawford.emu.id.au [116.255.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0355E2837A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 05:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.255.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739078386; cv=none; b=aM6RP+mhrLLEDbXFS/L/VfxFP16pBs1ZEsRv6pACSeN5sX3R0ebeSjB4wDGpzF+x7BuPwzmdvleUCdeMBVZV1toAm2BL0eMpaKe7ThyeA3snbFJqPpgy+IsvGNuhJcddxAJuwBvuMls1wYFU35i7bZvM2IpQsIRPC4G3dx+F+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739078386; c=relaxed/simple;
	bh=4yx8M4pGYzfPBwi9B1ZudNXzp3ki8TljJ2p3x5k1Zxc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bcYuAVx6wrQgoPhBDWfKZsTECp1WsYYCG30o1CALKGPXx20s4TAekQGoliWZKmO7EypIPPCz4O2cFdE2NRNwDnjc8IkeYwsvLACXenKdrxplCD7MVBsaJ+840GAOgAoIGgwX2mtEvNodvb1TsMxqYVLKyw9+FS1Yv/6jhwQsXug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au; spf=pass smtp.mailfrom=crawford.emu.id.au; dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b=FBfdricL; arc=none smtp.client-ip=116.255.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crawford.emu.id.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crawford.emu.id.au header.i=@crawford.emu.id.au header.b="FBfdricL"
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
	(authenticated bits=0)
	by bits.crawford.emu.id.au (8.18.1/8.17.2) with ESMTPSA id 51954pSI3801527
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 9 Feb 2025 16:04:52 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 51954pSI3801527
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
	s=s1; t=1739077495; bh=4yx8M4pGYzfPBwi9B1ZudNXzp3ki8TljJ2p3x5k1Zxc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FBfdricLB9fT1OF79evoKmh0ZfqXtaqBxyajs5agnav8nGCgPse/HW6RGVEITIoO1
	 hWIzJCE9olgvpHSpVSLf+m8fQ6bMfzRQU21OoB6VnzVUbOetpPOKvgpLrPtlbL3Dhw
	 95fU/RgnXDHg50wPILbhtQbmpCP1HfOSaLyXEm2WEX6ryvpCHfQkahxWn58qr9TBmX
	 lhsj6XwAxmjc6w+IgVQEggr69jYy0vCUORDB60u4bceOPKtyBYAnjnCxgqWwUU+7Zt
	 DnJKSg4zorE4HeIYCYmgG968O2cW5uHGw/dYQqssF8o4W7eDnBCST+irFm2ofX39j0
	 3oKdtYckfzDRA==
Message-ID: <7b832b532bc6544ba19afc086857641301a121c4.camel@crawford.emu.id.au>
Subject: Re: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return
 value
From: Frank Crawford <frank@crawford.emu.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Bart Van Assche
 <bvanassche@acm.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers	 <ndesaulniers@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>, Kees Cook	 <kees@kernel.org>,
        Jann Horn
 <jannh@google.com>, linux-kernel@vger.kernel.org
Date: Sun, 09 Feb 2025 16:04:51 +1100
In-Reply-To: <01d03e10-b832-415c-9dfd-61be31b49b1e@roeck-us.net>
References: <20250206175114.1974171-1-bvanassche@acm.org>
	 <20250206175114.1974171-30-bvanassche@acm.org>
	 <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
	 <7304c187-d80c-44dd-bbaf-4de1555a8278@acm.org>
	 <01d03e10-b832-415c-9dfd-61be31b49b1e@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Feb 2025 16:04:55 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 1.0.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean

Bart,

On Thu, 2025-02-06 at 15:41 -0800, Guenter Roeck wrote:
> On 2/6/25 15:34, Bart Van Assche wrote:
> > On 2/6/25 2:51 PM, Guenter Roeck wrote:
> > > On 2/6/25 09:51, Bart Van Assche wrote:
> > > > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > > > index e233aafa8856..8e3935089fca 100644
> > > > --- a/drivers/hwmon/it87.c
> > > > +++ b/drivers/hwmon/it87.c
> > > > @@ -3593,7 +3593,9 @@ static int it87_resume(struct device
> > > > *dev)
> > > > =A0=A0=A0=A0=A0 it87_resume_sio(pdev);
> > > > -=A0=A0=A0 it87_lock(data);
> > > > +=A0=A0=A0 int err =3D it87_lock(data);
> > >=20
> > > I am not going to accept patches with inline variable
> > > declarations
> > > if the patch is fixing an earlier problem, sorry. This only
> > > results
> > > in unnecessary backport failures.
> >=20
> > Hi Guenter,
> >=20
> > Is this perhaps how you want me to format this patch?
> >=20
>=20
> Yes, that would be ok.
>=20
> Guenter
>=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index e233aafa8856..5cfb98a0512f 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -3590,10 +3590,13 @@ static int it87_resume(struct device *dev)
> > =A0=A0{
> > =A0=A0=A0=A0=A0=A0=A0=A0 struct platform_device *pdev =3D to_platform_d=
evice(dev);
> > =A0=A0=A0=A0=A0=A0=A0=A0 struct it87_data *data =3D dev_get_drvdata(dev=
);
> > +=A0=A0=A0=A0=A0=A0 int err;
> >=20
> > =A0=A0=A0=A0=A0=A0=A0=A0 it87_resume_sio(pdev);
> >=20
> > -=A0=A0=A0=A0=A0=A0 it87_lock(data);
> > +=A0=A0=A0=A0=A0=A0 err =3D it87_lock(data);
> > +=A0=A0=A0=A0=A0=A0 if (err)
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return err;
> >=20
> > =A0=A0=A0=A0=A0=A0=A0=A0 it87_check_pwm(dev);
> > =A0=A0=A0=A0=A0=A0=A0=A0 it87_check_limit_regs(data);
> >=20

Thanks for that (and to Guenter to get it correctly formatted).

I will check it doesn't cause any other problems, but given the
location, I think it should be all fine.

> > Thanks,
> >=20
> > Bart.
>=20
Regards
Frank
