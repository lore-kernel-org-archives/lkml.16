Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD04313AD3F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744851434; cv=none; b=I1mgDx1C5XEb27wSJMGv4S2k5FXd3YtKsQe5AK93K7S+VnFoJtZIeGL5TURlwehbmhQemeCb22raPMscUsmG72T6pN+AvlvHEPzjHIqmEW0Uk+McSygQOKtye5+kujI2V/XgMs9NZf467jlnCfLP7wPscn9lgcYRBua6mi0SNEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744851434; c=relaxed/simple;
	bh=bvnrkExgcIJ3mH71DX3lJFkQNmbMFSdk6PKkTeJMU/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+MMBk2CS7izjLsqn4noL20LxcP7naCeGBBBDdX16YKIw8be6Bd1DnaiV/D43JXJZUmUnwHG9L0gzo4JLzootnzihfQy14CJ9En0kud2i2l65iLIWTrjlFjiBcJ37F1WAV/M2Stq4XVuLO/r73VPa+VebgRJvJbCLZIxdbhY9Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Gxu924AY; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Gxu924AY"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-227d6b530d8so2787785ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 17:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744851432; x=1745456232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OqMi74owdbjJ4GxEtEoAoxlT+JzRCaJ0xkE6rbcBBmo=;
        b=Gxu924AYbxu/VL5NijTyL9zmEFoUzMk8gGx1BPbY0rCk1aqkzmQWJL+Ri/18Gfjplt
         WmNi75YHx/RLsUKdzx0tIiYPawVMJOEUD7wgSBp8OM+AvM8JQy/duVekMgbj+jn9qtm5
         AdKgTUeDsdrzu7oDp24slqCdi5V4fYYl5ywykf7yKtMSVfRBk2Dme1rXFmlAM6jg0z7i
         CkDiTpXV8VfxU9zb2ZeaclHq4+tqeY8bviVfGFiB+7s6TD29HcuUuxvVYl4IMAHnJ/7G
         Ii57b8CPLaiG2En8wCboZ2JrtS8/o6RwlU0MsqSp4vE+JJrErw13DPDkEJ2q72GuPiw5
         555Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744851432; x=1745456232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqMi74owdbjJ4GxEtEoAoxlT+JzRCaJ0xkE6rbcBBmo=;
        b=kcRsZvMlnRGQj5YKXhffX4lpEzf4vIYeRazyCgjb/xlXzEWmBRGlGHYzOI1a3ic/pb
         gTXHnZOmU6+AUbhtisx33MOfr26xCW0M5BL9J8HgE5c6z6yLBlpc1UIzri1Li14DePa8
         6I1yPXeJSStDjsiwfEpBX7kXynGUlgZ/fKEYEC5guj3WAfoSizBUkp3EDoy1N0+wgLxH
         U3k/gqPUKJc8TauHlrPKT20KKoH7mCpgpg3dF+K+YHgUDGxAk5cC/jocwNHEMvHG9PpY
         jkP0v6ifYr2/1ja8ufNY0FT7M8PF+rTDEPo+DffKq7hn1MA8KdcxZOw24YKI4ZRdKLjE
         UtEA==
X-Forwarded-Encrypted: i=1; AJvYcCUYIy07ZYhDoNLwann4vL2Yup3i/C6oiEAInu7hCRLAWjP6UB00Q9W2RjrGG1se0Jauefe7Ia/LUTvfZec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gG6I5aJPpn3z976LaG/athAm9Nhzq6bUnQnGFMZNu0Ea3Gqi
	oV6VMn0EaphqSzong3uTBs/su8NiI9BmWMMdF6ZbvnEm5kmrVU7IPON+5DFURQ==
X-Gm-Gg: ASbGncv9bfLk/UYjld04zsXyd3MeJv0bp4TPIr2VUMGpiy6RHsrWOZLFNnulvssk2Uv
	pcV45Z5EHlQprt+5q77QcHPa+KeMRwYmovlSKmpInNPT1SgeINfiNaajpmMfbRMwdG52L6qGZef
	drW3lBqcBvtDK69LRrIoPzEsy/2fMp8N9UY0xfwNWDOcWSwwnSNL1hBdEbZeh497PnYgDZ3k1sP
	NuG1kmgqUgfdsPi6l95ZHHvWlovH6eoe12SqYji44Q/1ffhZYza4NRllpRB1CQoiiG7PHw3b8kg
	xfxk3pA0Xi4//3WnAM8mso8VJvcuv+12N6GmR/veewfbGmGQ5lqT83bSVkb5JW6unWs/d9ThwFB
	vKq9z9Q==
X-Google-Smtp-Source: AGHT+IHAineX5/E3p8aip+x16qwlR/Pv+CEyZMgvoH/E9C7b0jUlNJ17aQboLMM60Vu5iSE2N3U/DA==
X-Received: by 2002:a17:902:f642:b0:224:26fd:82e5 with SMTP id d9443c01a7336-22c359a248emr63796785ad.48.1744851431911;
        Wed, 16 Apr 2025 17:57:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3e0e19d2sm9328595ad.91.2025.04.16.17.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:57:11 -0700 (PDT)
Date: Thu, 17 Apr 2025 00:57:09 +0000
From: Michael Rubin <matchstick@neverthere.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] staging: gpib: Removing unused function CFGn
Message-ID: <aABR5Ykv5lawt_BE@tiamat>
References: <20250409181809.401724-1-matchstick@neverthere.org>
 <2025041522-startling-parlor-aa65@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041522-startling-parlor-aa65@gregkh>

On Tue, Apr 15, 2025 at 04:47:34PM +0200, Greg KH wrote:
> On Wed, Apr 09, 2025 at 06:18:09PM +0000, Michael Rubin wrote:
> Already in my tree?  I'm confused, this didn't apply at all.

Sorry for the hassle here. I will be keeping my tree much closer to yours
going forward.

I just did a comparison of your tree and mine with the following commands:

$ git fetch origin
$ git rebase origin/staging-testing
Current branch work-next is up to date.
$ git log --oneline origin/staging-testing..HEAD
01bb7ebee650 (HEAD -> work-next) staging: gpib: tnt4882: u8 over uint8_t
b362526c049a staging: gpib: lpvo_usb_gpib: u8 over uint8_t
c0086ac9f8c6 staging: gpib: gpib_ioctl: u64 over uint64_t
dfde322a6458 staging: gpib: pc2: u8 over uint8_t
0d68978f157c staging: gpib: ni_usb: u8 over uint8_t
6c1d83dae00e staging: gpib: hp_82341: u8 over uint8_t
6e47dd2b355e staging: gpib: hp_82335: u8 over uint8_t
066df8151ebc staging: gpib: gpib_bitbang: u8 over uint8_t
e2f98401b6cc staging: gpib: gpib_os: u8 over uint8_t
d39283e31564 staging: gpib: cec: u8 over uint8_t
76ca6178f5ac staging: gpib: agilent_82357a: u8 over uint8_t
83a4047b9a77 staging: gpib: agilent_82350b: u8 over uint8_t
e3e09b3c0b18 staging: gpib: gpib_user: u8 over uint8_t
7de94cbc8071 staging: gpib: gpib_ioctl: u8 over uint8_t
98b2ae8ac973 staging: gpib: Removing typedef gpib_interface_t
9d1d6dfa3871 staging: gpib: tnt4882: struct gpib_interface
914975f8fc96 staging: gpib: pc2: struct gpib_interface
64c745a7adb7 staging: gpib: ni_usb: struct gpib_interface
c303323266fe staging: gpib: lpvo_usb: struct gpib_interface
576eb9e6c1fa staging: gpib: ines: struct gpib_interface
5f2fb6ca422e staging: gpib: gpibP: struct gpib_interface
0033454014c8 staging: gpib: hp2341: struct gpib_interface
b1ab383f5d09 staging: gpib: hp_82335: struct gpib_interface
41ebb7c070bf staging: gpib: gpio: struct gpib_interface
ef391db774c0 staging: gpib: fmh: struct gpib_interface
701c5a45b91a staging: gpib: fluke: struct gpib_interface
88d5e0847f06 staging: gpib: common: struct gpib_interface
77b611bf3468 staging: gpib: cec: struct gpib_interface
803d5bfacf86 staging: gpib: cb7210: struct gpib_interface
294e66a9b7bc staging: gpib: agilent_82357a: gpib_interface
6eafa79e636a staging: gpib: agilent_82350b: gpib_interface
7a309862d53f staging: gpib: struct typing for gpib_interface
b248b9d75062 staging: gpib: uapi: Fix CamelCase and IBA Dup
$

I sent over the following series:

1) v2: u8 and u64 remaining patches

2) v3: the gpib_interface_t series (I broke the tree with v2).

3) The IBA Camel Case patch.

See if you can apply the CFGn patch after all the clean up. Not sure why that
does not apply cleanly. It does in my tree right now after the sync and rebase.

Michael Rubin

When th
