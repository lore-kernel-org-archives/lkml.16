Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CA11DDA14
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743766588; cv=none; b=lqnrm5N7GbpXxCh4aC8tfq6yewDyxEvMk8gWdrxN+Us7iGcSkkp5eV3XF8gX4fkNSwPO0rva0mErk1wdPp7yBy4Dv9pGcNtPNheg+OQfMeP/P6JJoGRZfGqgYOIpV6qVJrRXs3NMVEATf9DgBjFhHA7yu+sXBl27riqZT0NjfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743766588; c=relaxed/simple;
	bh=b6lOS29QIvzQkz2tzfTijH1Smgi5dRbHoXXeQNpP2Wg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R9hkKEqrt+XW0FoxxgDD+SdmZedxmRQelwwi2ODGitmsz4BKzxBpSGGxxxIA5vdhohs/FWretrDSQj1tsapNTD2VDLbiXCXuP0v6TtGg6br28v9v7VDlaswcZ0TMs8fUVBa4HF7OmMO5VBEjKFs06c0HCbRPC39S7xX694rQAlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iRI7svv5; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iRI7svv5"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3996af42857so2055633f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743766585; x=1744371385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClP9YjtKQmcvUTySn7LsfZX9TS6nE1I8Arm8XQx6bLg=;
        b=iRI7svv51+am1HCNwwUR5xXI46UUSrZnosZEdgObUxDicJ4MXd5gbeJmdeBLwiEdW6
         kclRKkpMmzcHAMdeESblWh/h6qiiurt4FCuJ4qF4FGy9Jzuf8v3DmDW/HUV9HE5LnYKW
         FWGhBjPJX9PFFchCvh5BLQHz87y8ay4LDBXOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743766585; x=1744371385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClP9YjtKQmcvUTySn7LsfZX9TS6nE1I8Arm8XQx6bLg=;
        b=wYgp4j7llIy6Z1U2uocDXRe1c5LIu9gQQFYpsfMDnNomi4WLYeHJ+xHpKiJZUafZe8
         3ahDM9WiGDV953iv590AGcA2HSR5CHi2aE0uUr636isWe4zFRj3qveAPpvhRdX54Ri1f
         xB7/8vo4ppd0FsBZF8DkY5xgGHSvW06f/YIgR5zNLkT3LVUyNwxz2CQYvGpQim7JnDCD
         s4bPZOOqJPRu1aCaPW5NvyIeEicRIoF3CQ8spxw+l2OfppJD8gMV1OcHtNBxWrVhxBHr
         XDSX+FHcL3aEWSkG2eQwlCKeGaew6ee9a+q5EKWxP30xv9EfafBgRbydIda1DkCsOeuG
         vGXA==
X-Forwarded-Encrypted: i=1; AJvYcCXrEE0wb42Pu+zFUvPLADvxHLoFrtYwSohCTQ460sxhTp+uKZ2r74cGkCuj1QXJVLvbEj5qgC3Sji9+yu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YymdVhVc5MQstyQQIEJBqLgePu4tjMPtXgRmzXZx8uYC9yohDC3
	VUxhu5OCvuJvtRVvaxphAj7HnZv6ZDLdFMWNn/dwQQ4IsnwIbb+txZhx2I1ZWjdAlR6qfMcCKGn
	ES74T4dKB4Pp1rBC0FXOeFgDJJEFCkHgo/yfT
X-Gm-Gg: ASbGncsXRUfMCTQ3IBmxSRRrisFWOOZK7rzLy0k7oduKCKEIshd/MrowJ4j/kj/qTT6
	K8eSxbv2U1H0VIgfpnDhjo3qWB+eFSNiSxDWJfHe6WUiicEgLo0rCB7aNADOVQ++JkIwGSyp1Cq
	+iXB2CZZVu8eirs91KoaEpAQ/b2EAuw2AZ9ohn8PR4c/Lkaon2/HtB5XQ=
X-Google-Smtp-Source: AGHT+IHUXMXD+UoTXET/xwc7RD5TlNhuLi2TwgtR8WlkyTcizG8Gf4I0EUz9QgemOvsBb46ALzcKJVFNDmMCY0SHs1w=
X-Received: by 2002:a5d:5f44:0:b0:38a:4184:14ec with SMTP id
 ffacd0b85a97d-39cb35a11c6mr2813012f8f.1.1743766585324; Fri, 04 Apr 2025
 04:36:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328132612.511471-1-srosek@chromium.org> <Z-z0O4KafHMVZquk@google.com>
In-Reply-To: <Z-z0O4KafHMVZquk@google.com>
From: =?UTF-8?Q?S=C5=82awomir_Rosek?= <srosek@chromium.org>
Date: Fri, 4 Apr 2025 13:36:14 +0200
X-Gm-Features: ATxdqUFT69KFlnjhu35Sr8LZAMoWIql8uhyAAi662aeXbNi_yD_Gf0bJDElT9g8
Message-ID: <CAOFuAQxK4mFeVXb6NEo_FFSJN1z_xEnca9DkbMiQZYxhUjmq=w@mail.gmail.com>
Subject: Re: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as module
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	ukaszb@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:24=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Fri, Mar 28, 2025 at 01:26:12PM +0000, Slawomir Rosek wrote:
> > This allows to build ChromeOS EC communication protocol helpers as
>
> s/This allows/Allow/.

I will fix that, thanks.

>
> > kernel module which is particularly useful for Android GKI (Generic
> > Kernel Image) configuration. With this change the ChromeOS Platform
> > (CONFIG_CHROME_PLATFORMS=3Dy) can be enabled directly from the vendor
> > kconfig fragment whithout additional configuration in gki_defconfig.
>
> Does it work?  CROS_EC_PROTO is "selected" by other Kconfigs.  Wouldn't i=
t
> be either =3Dy or =3Dn?

Yes, it is already used by android 6.6 and 6.12 kernels. The
CROS_EC_PROTO is used only by other tristates so =3Dm propagates
properly.
