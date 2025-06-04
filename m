Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1861F09A3
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749023278; cv=none; b=VXK2GK7C3wdXO4k9cor1cgXV5PG4LcMmMr21bPyb5saQLpHaEYtOiBLs7E3RpLQiaV2UE2gojI++UK4MYxD32MmRvqmCUp74plPZIHe+1+nJErkSidlP2lkYzF/N0775kND6Ad0ceMHs155Cn9/StED1r/y9ta/keCutQ0xTNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749023278; c=relaxed/simple;
	bh=t2007AxeJCzN8DYFU1TDmOYxveSLIawRFTPoFEFfSlA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qMGoH6Ji+JiJV45sjazSlopEFMSgiWFsEfeZ4ugfk6Kx169vfWYQyyOcUiJXIRw0tLtfJi6O07r2GgOXCNGEZ8zMeV4LF9alZZJ8Zk+OHpiy5ryeEzrwJaAQk8n9iOWXs7WRAXikWK65Ycvxy2pHAl6OgqdWJKFwkG3vqICK0ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RvlWTmPD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RvlWTmPD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749023274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ygmWQWXbYd84BZ22kC3DM6odLW06NCGE4pAVf3jq5k=;
	b=RvlWTmPDymK55iwxv8wYT0bUunm1R3r6lMmXhVA39KxN5fYZ9cMbPx7GjNs5/7iNWR+K6w
	zV5FLFbGgxNpYgmDfol/s9Rqu0m5vGHZ2OgDZjKyPMj3MFNI5Wlahx7y8TKsqoSLZIAsZM
	hfGZHvnC6sAu5eKyNTLob12SQ+dmii8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-5yOee6gtM4av2Xn0EXf91w-1; Wed, 04 Jun 2025 03:47:52 -0400
X-MC-Unique: 5yOee6gtM4av2Xn0EXf91w-1
X-Mimecast-MFC-AGG-ID: 5yOee6gtM4av2Xn0EXf91w_1749023272
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450de98b28eso2885585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749023271; x=1749628071;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ygmWQWXbYd84BZ22kC3DM6odLW06NCGE4pAVf3jq5k=;
        b=GEtvQ2kwBQ2xdDWoZRo5id8HVj9sNtaVsngH8w3HVP40/dPjiZz63BeqTsTBH8gkrr
         tUuP93sPSzi8KE7snNZWSoIu79Y9sevf6pG4k7133+NgjRE623CntPXbBX+/vgE2Lnu9
         oFobNj2HoZkI6LH/IxMJ4s3YuPi6vni5BISCvrwZD4wdFlFI/CfMQkX94nUuX3c7lBZY
         pXw9Qtqdl0HInIzvYd6+x/Pl8PJnV1tFgMNnvc1jmwTM9PzL/t1623mQy0PDFwPs7PYp
         5DGnxHuh74TApd4wT385TrG09b8FC1AznnBLZA1Qdw57aDozmMKTQI/CroM5iLvreDA8
         PvBA==
X-Gm-Message-State: AOJu0YwE1y2ZNCkmZOWd7sEuT7LQk/3uLtpSNK5HRI13uEX6unez7/S5
	EuAKSz+SWtJv3MPljmojJXERRUlZCzc6yaSbafU5JM3IAMe8QEhCpowsGA5AGP62uyo0w0ecpsD
	8ysZ70X83kLvdCpevTwZWQ2ooDwv75taAIPjI0OLYIwJCZfIQP0leymxSMMCSeccCjA==
X-Gm-Gg: ASbGncu89nPEHYEDEWBUVqk/nQRRMEVfH0T6dOM6AMMuvw9jTADdYVNKhlGJ2E1nhfT
	5BEUJ0GSFGBudK4zD5bUx73ZNaNR1FBz/swvOFu6qTxp2WZ7vdw7T010fUoSK1bseGs13tPDYnS
	zCeTIwBpZ2D0mc2G4QtH6Q81mSmIl1hxlXchhHwtytXwrtmz4jHxpwsMwf114YadvIuXUsTWACR
	X1yBBd+GJfi7/0hjgqB16TKi1BJ+x539grfTVdlZUA2kVvcmNSpfdv8gsRfXriewJN65ChU73H2
	mMLzYjU=
X-Received: by 2002:a05:600c:4f46:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-451efeb62edmr16204885e9.13.1749023271472;
        Wed, 04 Jun 2025 00:47:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJk55eb8TjJoA47+XoMh9gAce9YiEwRtdQfUP3XiuiMssBNBDp3zfR4HUA5bIORLwXMaPKeQ==
X-Received: by 2002:a05:600c:4f46:b0:442:f4a3:a2c0 with SMTP id 5b1f17b1804b1-451efeb62edmr16204515e9.13.1749023270973;
        Wed, 04 Jun 2025 00:47:50 -0700 (PDT)
Received: from fedora (g3.ign.cz. [91.219.240.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d8000d8csm188712405e9.24.2025.06.04.00.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:47:50 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
 linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org,
 linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami
 Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu
 <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore
 <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
 <serge@hallyn.com>, Peter Jones <pjones@redhat.com>, Robert Holmes
 <robeholmes@gmail.com>, Jeremy Cline <jcline@redhat.com>, Coiby Xu
 <coxu@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH RFC 1/1] module: Make use of platform keyring for module
 signature verify
In-Reply-To: <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
References: <20250602132535.897944-1-vkuznets@redhat.com>
 <20250602132535.897944-2-vkuznets@redhat.com>
 <948f5567fe4d9ae39aa2528965f123e42bf82b46.camel@HansenPartnership.com>
 <87r001yzob.fsf@redhat.com>
 <d34555e2b0c4746fc01d5295959a434befcf8b18.camel@HansenPartnership.com>
Date: Wed, 04 Jun 2025 09:47:48 +0200
Message-ID: <8734cgosm3.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Tue, 2025-06-03 at 10:52 +0200, Vitaly Kuznetsov wrote:
>> James Bottomley <James.Bottomley@HansenPartnership.com> writes:
> [...]
>> > Also, are you sure a config option is the right thing?=C2=A0 Presumably
>> > Red Hat wants to limit its number of kernels and the design of just
>> > linking the machine keyring (i.e. MoK) was for the use case where
>> > trust is being pivoted away from db by shim, so users don't want to
>> > trust the db keys they don't control.=C2=A0 If the same kernel gets us=
ed
>> > for both situations (trusted and untrusted db) you might want a
>> > runtime means to distinguish them.
>>=20
>> I was not personally involved when RH put the patch downstream (and
>> wasn't very successful in getting the background story) but it
>> doesn't even have an additional Kconfig, e.g.:
>> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-10/-/co=
mmit/03d4694fa6511132989bac0da11fa677ea5d29f6
>> so apparently there's no desire to limit anything, basically,
>> .platform is always trusted on Fedora/RHEL systems (for a long time
>> already).
>
> It sounds like that's just distro politics:  RH wants to enable binary
> modules (by allowing them to be signed) but doesn't want to be seen to
> be signing them (so they can't be signed with the embedded RH key) so
> that gamers can have performant graphics drivers and the like.  Thus it
> mixes in the db keyring, which usually contains several Microsoft
> certificates and also one from the ODM manufacturer, so now it can send
> would be shippers of binary modules to those groups to get them signed.
> If you only have the built in and MoK keyrings, the only possible
> signers are either RH or the machine owner ... who isn't a single
> entity to deal with.  Personally I think this is a bit daft: Debian
> manages an out of tree module infrastructure using DKMS and MoK
> signing, so I can't see why RH can't get it to work in the same way.
>

I guess such approach can be used with some limitations: the out-of-tree
module must be open source, the vendor of the module must commit to
fixing (inevitable) module build issues when the distro updates its
kernel and so on. It, however, doesn't help the users which want to
build and sign their own modules themselves.

>> As part of the RFC, I'd like to try to understand under which
>> conditions people may not want to trust 'db'. In the most common use
>> case, 'db' is used to authorize shim and the kernel is signed by a
>> cert from shim's vendor_db, not trusting 'db' for modules after that
>> seems somawhat silly. Maybe we can detect the fact that the user took
>> control over the system with MOK and untrust .platform only then
>> (while trusting it by default)?
>
> Well, I think it's pretty obvious that in a standard secure boot system
> most people wouldn't want either Microsoft or the ODM manufacturer
> being in a position to sign module code for their systems.  Indeed,
> when this was first mooted by Red Hat years ago, I thought Microsoft
> refused to be the CA for our modules anyway.  From a security point of
> view, it's separation of concerns: the standard secure boot database
> guards access to the UEFI boot time before ExitBootServices.  The
> kernel is a completely separate security domain and should be guarded
> by different keys.
>
>> A runtime toggle is not something I thought much about: the sole
>> purpose of this part of 'lockdown' (limitimg unsigned modules load)
>> seems to be to prevent someone who already has 'root' on the system
>> to gain kernel level access to e.g. hide its activities. In case root
>> can decide which keys are trusted, isn't it all in vain?
>
> Not exactly, the purpose of lockdown is to make root less privileged
> than ring 0 (the kernel), so that a user space privilege escalation
> does less damage.  The gold standard for all of this is supposed to be
> to foil an Evil Maid attack (physical access) but I don't think we're
> quite there yet.  From the point of view of the keyrings a lot of
> others (like .ima) have trusted signing requirements meaning root can't
> simply add keys, they have to be signed by keys in the existing trusted
> keyring as well.
>
>>  Or maybe if the toggle is to just trust/not trust .platform (and not
>> e.g. disable signatures verification completely, inject a new
>> key,...) this is acceptable? Another option is to have a kernel
>> command line parameter but this is complicated for users.
>
> I was thinking that if the goal is simply to enable cloud db then the
> toggle could be detecting the presence of the MoK variables.  However,
> if the distro politics thought above is correct, that won't work for
> the RH use case of enabling additional binary modules by getting others
> to sign them.  Until we have UKI signing of the kernel command line,
> it's not such a safe vector to use for switches like this because it
> makes the Evil Maid problem worse (and they're hard for users to manage
> anyway as you say).

(FWIW, RH-signed UKI is already present in RHEL/Fedora/derivatives along
with a set of good known UKI cmdline extentions ('fips=3D1',
'crashkernel=3D...',...) so adding e.g. 'platform_is_trusted=3D1' extension
*is* possible).

So if we consider trusting/not trusing platform to be a distro choice
("politics"), then I guess the suggested Kconfig approach may make
sense? I, however, quite like the idea to complement it with an
automatic toggle based on the MOK status: we can make the Kconfig a
tristate:
- Platform is never trusted (current approach)
- Platform is always trusted
- Platform is trused when MOK is not used
To me, this third option makes sense: if a user wants to take ownership
over the system, they can use MOK and sign the kernel itself and/or
out-of-tree modules with it. If the user doesn't care, then there's no
reason to not trust 'db'.

--=20
Vitaly

