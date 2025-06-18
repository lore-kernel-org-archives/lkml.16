Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E4B27FB38
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237898; cv=none; b=Tf5XLgSqFdGcbiz4p7Pbglx+d5Ig9AbS4UP3coweCsDql82FZ3uGHuPU1CnIZBvCkysVhFruofymyKzsYpgjhzFfrkfT8o+VsIzGBTgImE6V/7+5iTER0QgyBIzO9tDKOHRz9IINMB6eTSHXXt8rBKMGFxCztMfg1MtspSKTQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237898; c=relaxed/simple;
	bh=Xic6yythlsoNSAjolh1nYVsErlhXz0Oc+XXjcgxahSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH5w5Y7HPwi8B7uSU4Ee4Ws5fgsIOFSnVjTp3KYsdL7oNJoXcd6SdI8ubvrpLoVyEVmJL+vW0kK7jxJWg3WhaU9Unz8I0QX38ZtUZlvAcWuvr+ERQ7A3PGnTE4XLEq1Q8/zSKGoYiYRmDH/o7NsZnJnF1gQ4pleywwCE02Ykkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Mv9BwxxI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Mv9BwxxI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453398e90e9so37325545e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750237895; x=1750842695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xic6yythlsoNSAjolh1nYVsErlhXz0Oc+XXjcgxahSw=;
        b=Mv9BwxxI369lGz4Td+kzyiIvWatC4erbIlL6Ldqk3PwTyLI0eoWWDEA8WFx6fSdlNS
         Xvnh37KNa8WS3Z9YlyJwj0x4IY7TTxvUO8bhqD5113d/Lu5SjA/JuPSXBecEBIB0URjZ
         3hJugerkUbegtng7ZS+ihdj4M0XvjXFalrO15UX/Z+GTsu/vCqqaabtJ+529+jrkaXV2
         BChKtO/20YAs8bx7EIHRAAaBgboKeL7lIFgOhe1Af+T2YN3p6jeSY6U4sp4IutzKxGag
         p4jj5PUYUV2F2/qM/3VsTowSzlGDD4EQg0ih3KwpphZ5Pd2sNxhPJSMtgHKyyq5nyheb
         2VWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237895; x=1750842695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xic6yythlsoNSAjolh1nYVsErlhXz0Oc+XXjcgxahSw=;
        b=X2cWgiS4onm0eKdndX/A1V4BGmHEodV3SbqlT7H/Glv2Ssm5cC3evTphp/KRzxGKyf
         tFLGrI91UYF77wwyoh8S79k43svJld3PhJHN/B4rSr2MNy8/9m8EyJsNZaG78r28cGUG
         z9jcUTYbCVLk6O8z1f7bnrmXpMnR2GsYCmiqyRcV/pSUcKUsQ/k9iJrUTF1pV+q+9cxt
         Uikw5Lo8xWLnENdd7jIiH9bm+cXnT/VOx6BfYeOPuFhKWUJE1HeKpRbz0FXbBTFlxZO2
         hSe408s/nheHGXvtOdr+IsJjeu3Qo/bc8oyT2sOzowsNyXRgPIy4qEqcwsjAvS3z914T
         sqng==
X-Forwarded-Encrypted: i=1; AJvYcCXxYPxN6oRpgmOVte6Z2IacdTwzcB9/rcHKmI8JzE57i5BE/6dnZr2YtH6CcSKYlhcqxuiaUfFuOQtB7Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUjHLR6b+Ea26yQKv1Bzv8Wm984HLBJzXN7bAvwLMQjeWS/ih4
	vPnrRBdyYHd/FQkwsmjw67nH/MmWYC9wR6HxfSAoxg73Bv3JX/8ZR5Q77jHuAi2S2ow=
X-Gm-Gg: ASbGncuRZU6ae2neyShThUlhwrCTmYuHVMv7b8MlqoCpCTqXTnycqGpo6Mzhmfu5I48
	lBMkrcsvwdwANTT68DVIiQ8eMH/YbAPmkNkJRCNEGr6yTx3klBTdNLttKKV5mKKJKoNsIba1kmZ
	Y9zwODRxhdRACbY4xnDWl1XVdl6VSloeEF/LFlsg5B+0t+P0QPsplACa91rRb4J/Xzptfqudv67
	VztZC5cy2s5vONFuneyfIVHFvJ/dZpVoGhH+9HStvZ5dtBaTyut/HCnv0oy2z9Gvo4HH+vSPhsS
	j9XIM/QQ1iLIuXXLgK6Nsb2gLsSQ+q1BAt+C4k2d1jPgGMkMN7n0XiXXkP6FCGj9
X-Google-Smtp-Source: AGHT+IHth8tmdPesho4g//IjdtOAT3JnLdL6ZM3vgZT/gBezc4P/g/WR7hoAIoTWAN4G1Zdnoxkw2g==
X-Received: by 2002:a05:600c:1ca1:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-4533cacf2d1mr127594585e9.1.1750237895025;
        Wed, 18 Jun 2025 02:11:35 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c64esm207493835e9.7.2025.06.18.02.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:11:34 -0700 (PDT)
Date: Wed, 18 Jun 2025 11:11:32 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: YoungJun Park <youngjun.park@lge.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, shikemeng@huaweicloud.com, 
	kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org, 
	chrisl@kernel.org, muchun.song@linux.dev, iamjoonsoo.kim@lge.com, 
	taejoon.song@lge.com, gunho.lee@lge.com
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
Message-ID: <rivwhhhkuqy7p4r6mmuhpheaj3c7vcw4w4kavp42avpz7es5vp@hbnvrmgzb5tr>
References: <20250612103743.3385842-1-youngjun.park@lge.com>
 <20250612103743.3385842-2-youngjun.park@lge.com>
 <pcji4n5tjsgjwbp7r65gfevkr3wyghlbi2vi4mndafzs4w7zs4@2k4citaugdz2>
 <aFIJDQeHmTPJrK57@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yjoup7ez7c23c6mk"
Content-Disposition: inline
In-Reply-To: <aFIJDQeHmTPJrK57@yjaykim-PowerEdge-T330>


--yjoup7ez7c23c6mk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 09:32:13AM +0900, YoungJun Park <youngjun.park@lge.=
com> wrote:
> What issue is the question assuming the existence of competitors in two
> cgroups trying to address? Could you explain it a bit more specifically?

I'm after how this mechanism is supposed to honor hierarchical
structure. (I thought the numeric example was the most specific.)

>=20
> To answer your question for now,
> Each cgroup just prefers devices according to their priority values.
> until swap device is exhausted.
>=20
> cg1 prefer /dev/sda than /dev/sdb.
> cg2 prefer /dev/sdb than /dev/sda.
> cg3 prefer /dev/sdb than /dev/sda.
> cg4 prefer /dev/sda than /dev/sdb.

Hm, than means the settigs from cg1 (or cg2) don't apply to descendant
cg3 (or cg4) :-/

When referring to that document
(Documentation/admin-guide/cgroup-v2.rst) again, which of the "Resource
Distribution Models" do you find the most fitting for this scenario?

Thanks,
Michal

--yjoup7ez7c23c6mk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFKCwgAKCRB+PQLnlNv4
CGhQAQDWZPfH7YCAtcszmQt878EwS0Q3oEcFtFVVjUypa0cpdAD/WaqC+bNMV9R/
kELaQeGCe8tF7XqdyfQXr8OmFCd4oAc=
=Cn64
-----END PGP SIGNATURE-----

--yjoup7ez7c23c6mk--
