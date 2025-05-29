Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBF110785
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 04:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748491425; cv=none; b=Wj2mZLK+sWRaiPH9R7cfJagj3UJpna/SDRtuHQqFfMBXUMqRdu8MtQqQr2kGOBBj6/aCrA12VBLJmby0P5aDNRsSv8odwscutVNNaQ8czhzCDdmeLQ0/bmC/SOCGE2s1neIsKj8FmzLt943Y7hfmLbWxgxQV0WOPrls/4u1cQNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748491425; c=relaxed/simple;
	bh=bjf/JLayP19bwsqdRmI9LExctVLA/PfSC/qjpvMxmXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Or6HxUF33Upu2RywO9bsle+JZjlUgSuJLw65Dyt5vKJqygOb7sWIUSytqJ/vtTcQj76PQVOxJFl6Asy+gN6SbiveRdrxMtaYnktxhpvYoTcVyAG9dsbJf1cDO70rULkuc8zp6Jvh7ZPwVlT0+JbDiPQgjugDtRCOh650KXZIQE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=hnJvOwyI; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="hnJvOwyI"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D06493F71E
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 03:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1748490902;
	bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=hnJvOwyIkjvin+FB0DgEwX15JwTDzmGztxhHSj4mkKDBtMNKQFeKuSc52K+tDO0rQ
	 j2QAq/XTKTuqVkg3cvZcHuWdbRSVUvCjIRb+ylvGnTvwoDa3SomJywoMyPyytxOBA8
	 h2Uh5B6n1AwYZjg3wxsP35VM2c8sbS83aHosUfgmB/4/BYNKYogL/40Ahgzi68xgKl
	 nmeYmi5fmPUZlpPwctBW3MRauA1IxEjvsa7l5mIeJy2fkxR46AGVwgAYF3ID3r3MER
	 LyeDPSOoQx9O8ZadBoO2ed+iY2IUi886FldVTh30IyF7e6LMOZYAn8+G6qKX2Q7Qf+
	 MK4yJr39brg+A==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-60498322443so443619a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748490901; x=1749095701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4vVrDxJRiSVvwJTAsACN8FW8gcbiroxOJCqMNoZKGU=;
        b=p5V0K5ca3xo+yNaQYDOpdV4jB2MYMN/N7FTlOdQXCjgx4tUB0ivrVeMSWnO4lKeZ1o
         GlslvKfiZoJV2QjQT1f4f2I3srH8GVMyhUgKwGRLrNo9N9iiVIkO3tThRFH9PhX5CU7v
         nUE2pvnpHixWRY5npSszL3esoO78DfRsxzSAK8JCwFZzCBUUjmEJzt9Ih7tj8ZyjKEhX
         4mGYoNatx4Escoft7kTd+tmJEQCUx3Zro+kXlBoRaem3Rx8lbz2EwZXTuRl7G3d3OXsV
         n5ArTbxUYjLw0oqr8hZmhHOKNbseOkJlzD6KCVNtINsrQhcCVRQU5f3cXfVIAGlkuw32
         ArMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzPSPJzKBZWni9envP9LgmOUJWWGO4Co6GHFGjO/QDzmdP2LqxHttJVRAqHlBzchutHCXkIuGKsCPk90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3/eioXhYFcgjq4tAH3YZ1f+1Rw8/moy5o/bs/u2aMR0OhtpN/
	Fjqyah6Y3u2VEHctLd6iF7zVWErfnJ5ZFvcJT3rFlhCTInEZNPQ9I9d7H6Lcd6bc1VL93mvtG8L
	5GbjbQNbBGrXidQXo4/dDN423BfRPrQOLDTa1vULBxwi012zU8HyoGyXE8H99vkOEtdGFfAdXPA
	7kElkDz+LSpjRDrMCSctZ+yQIYgy5oH7/IzvXOZM2JgcJMAzCPpavRnOHw
X-Gm-Gg: ASbGnctecsLEbeGFutjaXEPQhyQ8m+cmbS4ocCiUf5wpMfNQvht0OtBOjUxCo8k0ye3
	B/7yYH2s+H/0TpcZm6gwlcWsf6ctAFpxCPW+k4ERqfD5TJjNK3MH6knfdoLtuOWsvnqenfw==
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id 4fb4d7f45d1cf-602d8f5d70dmr18033634a12.3.1748490901404;
        Wed, 28 May 2025 20:55:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHR0ej2bZUX3SVv9aAplyxdVXsmtwHM6QDoYTrTihqt5ALCD/GbQf0L7mvCwR+nlHJCc5oIyUGYNq9gu+JSggw=
X-Received: by 2002:a05:6402:1d4b:b0:601:3f5b:39ee with SMTP id
 4fb4d7f45d1cf-602d8f5d70dmr18033620a12.3.1748490901054; Wed, 28 May 2025
 20:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-for-upstream-not-instantiate-spd5118-v1-1-8216e2d38918@canonical.com>
 <202505290728.VsNgBfDO-lkp@intel.com>
In-Reply-To: <202505290728.VsNgBfDO-lkp@intel.com>
From: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Date: Thu, 29 May 2025 11:54:49 +0800
X-Gm-Features: AX0GCFuvPqKC8O7DWOhXj72SBZClr0XkXQZTp2dRyjUTIGZ3F1XCKz6JwMpGoeY
Message-ID: <CABscksPBjQ14UrvCVwgVMHZ6NsPKN9tWscaOGBy8TjufgzPGFA@mail.gmail.com>
Subject: Re: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Write Disable
To: kernel test robot <lkp@intel.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa-dev@sang-engineering.com>, oe-kbuild-all@lists.linux.dev, 
	Guenter Roeck <linux@roeck-us.net>, "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 8:00=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Yo-Jung,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 176e917e010cb7dcc605f11d2bc33f304292482b]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Yo-Jung-Leo-Lin/i2=
c-i801-Do-not-instantiate-spd5118-under-SPD-Write-Disable/20250528-163253
> base:   176e917e010cb7dcc605f11d2bc33f304292482b
> patch link:    https://lore.kernel.org/r/20250528-for-upstream-not-instan=
tiate-spd5118-v1-1-8216e2d38918%40canonical.com
> patch subject: [PATCH] i2c: i801: Do not instantiate spd5118 under SPD Wr=
ite Disable
> config: loongarch-randconfig-001-20250529 (https://download.01.org/0day-c=
i/archive/20250529/202505290728.VsNgBfDO-lkp@intel.com/config)
> compiler: loongarch64-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250529/202505290728.VsNgBfDO-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505290728.VsNgBfDO-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    drivers/i2c/busses/i2c-i801.c: In function 'i801_notifier_call':
> >> drivers/i2c/busses/i2c-i801.c:1304:9: error: implicit declaration of f=
unction '__i801_register_spd' [-Wimplicit-function-declaration]
>     1304 |         __i801_register_spd(priv);
>          |         ^~~~~~~~~~~~~~~~~~~
>
>
> vim +/__i801_register_spd +1304 drivers/i2c/busses/i2c-i801.c
>
>   1291
>   1292  static int i801_notifier_call(struct notifier_block *nb, unsigned=
 long action,
>   1293                                void *data)
>   1294  {
>   1295          struct i801_priv *priv =3D container_of(nb, struct i801_p=
riv, mux_notifier_block);
>   1296          struct device *dev =3D data;
>   1297
>   1298          if (action !=3D BUS_NOTIFY_ADD_DEVICE ||
>   1299              dev->type !=3D &i2c_adapter_type ||
>   1300              i2c_root_adapter(dev) !=3D &priv->adapter)
>   1301                  return NOTIFY_DONE;
>   1302
>   1303          /* Call i2c_register_spd for muxed child segments */
> > 1304          __i801_register_spd(priv);
>   1305
>   1306          return NOTIFY_OK;
>   1307  }
>   1308

I think this happens likely because I put the __i801_register_spd() inside =
the:

#if defined CONFIG_X86 && defined CONFIG_DMI
...
#endif

So the function went missing in loongarch. Will fix this in v2.

>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
