Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FA41FC8
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 22:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743374695; cv=none; b=W3A5rlnVnVl6CZBV5R+J4BUMGTKGSVNuglqByHTkLAKd6uUroboHrzMP6RYACIy59frTg/L79FcnKS7yZ72sJgfoILY+bM3uQH9NF/0yrl8wG7obdZHaWnlBsQXmLsRHnbTJS6Pg1mNBFEa5BFcZTnoFaJXgP0rJL1ZFYkk4+Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743374695; c=relaxed/simple;
	bh=FS/ZM5OQLv03Ny4iJC4eMRJ7foffcS/ETeiodsWWCas=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=soQ/UQYIvubP9GxqHFV1zJqIHjmR4vffQVUYbWzSVPU26NHmz25fjdLOqkJCQTmMzD13yc6MBCF80LmWNruXkyvZMKQpnr9sB5Qm/cgoL9Xw+c+xc1QN9o321k6bXYix2iO+uyQqWc/sGW4tZWHW0f8G1Fn3KKd5jNQ6QgIGUkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=au1bnvFg; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="au1bnvFg"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52UMiJPZ2998636
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 30 Mar 2025 15:44:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52UMiJPZ2998636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1743374661;
	bh=uQjNrCA2abb1dCMcAFSILRDE0EVEkoS7UON1Hg8revU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=au1bnvFg09VieFIsVOTtI0Xb6wjhJfepG2WWvdzcdPUSVYHKiaLjFazCgfaMcOLBi
	 IBozWVsTHWkTycoZe8WxsGpx/m6gvpMmVhcrf383CIJVArcLG7sd4XOw9A+PXZNM+r
	 rsX76g7h/MY9Xz2GWSTqwuvdJ1EqL+88p2tHLPdkqK6+tNvaqGdVD2/KAJrLjo2zgB
	 LN+Rbu93yGFNLbSRYpMC3w8p0edKvxLwFTha2O3qzEztaWMZQhCIjUN7yG/Xpg0NJ8
	 +hTjXRl8dPLc1ihdyXq6Giqjb8JPYuabtjfk13Zj8pDytYvYZAt9i4VngGOq7s707a
	 5O3j3+yhLay9w==
Date: Sun, 30 Mar 2025 15:44:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Uros Bizjak <ubizjak@gmail.com>
CC: Ingo Molnar <mingo@kernel.org>, x86@kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_-tip_2/2=5D_x86/hweight=3A_Use_POPCN?=
 =?US-ASCII?Q?T_when_available_with_X86=5FNATIVE=5FCPU_option?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250330191544.213e07d8@pumpkin>
References: <20250325164854.199420-1-ubizjak@gmail.com> <20250325164854.199420-2-ubizjak@gmail.com> <Z-Mme_OxuhYfxgzO@gmail.com> <CAFULd4bCnnL-CBFwgAQtN9S+sUE_wikda6E+8k9632J9b62dCg@mail.gmail.com> <Z-kVT4ROZJXx6kui@gmail.com> <CAFULd4a2eOhZ4TPQRsLtN1yPYSfgqsXR_yOG+z3PedE-ZCMynw@mail.gmail.com> <20250330191544.213e07d8@pumpkin>
Message-ID: <0C7D298A-86E7-427F-B45B-25C2F663D2FA@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On March 30, 2025 11:15:44 AM PDT, David Laight <david=2Elaight=2Elinux@gma=
il=2Ecom> wrote:
>On Sun, 30 Mar 2025 18:07:30 +0200
>Uros Bizjak <ubizjak@gmail=2Ecom> wrote:
>
>=2E=2E=2E
>> The kernel is currently compiled with -mno-red-zone, gcc-15 introduces
>> special "redzone" clobber to disable red-zone in the function that
>> includes asm() when/if the kernel starts using redzone=2E
>
>I really don't understand the point of a stack 'red-zone'=2E
>In any function that contains memory writes the cost of a
>'sub $n,%rsp' at the top and corresponding add at the bottom
>is surely noise=2E
>
>	David=2E

Perhaps you should check out the performance numbers instead=2E
