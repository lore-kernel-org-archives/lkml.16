Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB911283C9E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632920; cv=none; b=A26uugDz4EXzpjkp5fit8RJH3brJFKIs8vwtPeP5GakhkL++NUOjuJXPQdEshHvVP9MiZY2H2wLkg8xkVRE+p7wpSoJKKB4MeGYlR427OT0bDMfY69poDJsaI6rGRxtKGe85no6Y7vjoFyyDXfrCQn3bgHT5OshoRj202IJBSRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632920; c=relaxed/simple;
	bh=RmNN38IOqGOxQw3vAObUst92tVyWxds+Q/EvUHM6Nys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=k/VhK3u5mAQWBEftV+l9kYaB0AihPKkqtc3ZjkMK8EYD/WP6QH1X3pyaWnw95KowfGvQ2t6MKJG3na6E7vuQj5aODfWDnf3UoRR/dr+gBUNaD0aODjuZvxrlybCheqVgfZv4zqr3YN05wQMJSz6h9odUWzeCsAY9Pp98xc959Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=gxemlVfV; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="gxemlVfV"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1254099466b.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746632916; x=1747237716; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmNN38IOqGOxQw3vAObUst92tVyWxds+Q/EvUHM6Nys=;
        b=gxemlVfVoBl7+qwuAAfXdnfEC4PCoEsQvHmbq2PbITpWinmZwsLdK0O17HuF8DYrFd
         JqbX9TrHEppVDvHIZXpm2b4e5exFSQjkKocgHwNjXG2mMNGqtNB2jBGNkeMbqtjOurTW
         lxQ5VUFYmfkvSl7aEoo0JoBaap2IQpGafQn8UR9hvyuFXpJCeyRtp3HgP4gNUE7YBIBN
         5yDPcO4ru+NLNDGc5vDgUIXF2zvaqn/I2XeG+55snh3RLtXofINsUngsFkoK3VW5O4O2
         YeUoocoiJ6N0fS/fABPQs/edaBcSifRd1VeaGt3eG+ogZrKgQAygtly1NSS9qb6CBvzD
         OtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632916; x=1747237716;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmNN38IOqGOxQw3vAObUst92tVyWxds+Q/EvUHM6Nys=;
        b=og4tW9CByAaqLseuvszt2VsCQ2BqGpwm/0dN3QTX9KB7pfewtDokCG2H5aPP/rjRmm
         zJYI+ldifAFPzdy6uy1am4h3ziAub49k0hxUoiRF+SqmP8SjECl5BV9dpysKiMcEy1es
         /ETD/WCpJAC8QBDKbqbmmqNg84M0gLe1p3xV26Xem4X/rulDspJZEj8uJzC7TMH5d6bj
         d/fhjgRG0q+brkmNGVue4sJ79QDZ1lCWMq5j3aVcv0H0pu6BsJYhTTjNv/y7XJCZc74y
         6xYjhvPMYUiDGDX4e+uIATrcBY9RiKj0hUuSa9qv1rf/hIr0JZrHmzSIDTKP52sxn/QO
         ZMCA==
X-Forwarded-Encrypted: i=1; AJvYcCUCEQv9+7JUlslBgSmlCB/nF2bOFH8lGPal7CnNVvVtoESsAL3CbcGd6O/8WdkGyO3fxaGovmBQ1Vwb1RI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjG5BUwFnEpecSanSY1aaHjQ2Y0nmabljAzoBrwrNobYGREZSc
	KYuSL8ACGYPaZxb6QxE6wQ0vOoW/QgGb+JsYaC2xbuZODP+1lDDvtgT9HZyKNsV8REPdGBXEKdp
	6EqgzH5OZJj6dA4zZCXjDD8LiLmj2BSEz6WHidVVjoGTz947Uo8riqw==
X-Gm-Gg: ASbGncsdmXDkW7cwEtvWLTjsj6owLPD0RuMQLl595Qsxrlsu3i+xGSAFJnwxaqsSwMJ
	ws4rEBYVWKU2NoOe1JWcw0MgAnt02majL0k2ryhFzxn+jTIh9Bi+h5gWXFQfO6DTCtXRRbcjVHr
	lFWKLoGPpQgZ/SxbrDY8ZHFNVPddD04wPOuz1/ErfFkSjCIe1+PH8Pcj29jwFw2A==
X-Google-Smtp-Source: AGHT+IEAltjxdalh/5XKuPwAg0pv1b4lg33oCEm/9+0ThGBN1Qpg5xKiNbvqIrHXaTlQhgG7QhMV/i8ffK6cBVRnyqw=
X-Received: by 2002:a17:907:874e:b0:ace:cb59:6c4d with SMTP id
 a640c23a62f3a-ad1e8d545eemr366290466b.43.1746632916020; Wed, 07 May 2025
 08:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428154859.3228933-1-max.kellermann@ionos.com> <202505071602.yJrZsTiu-lkp@intel.com>
In-Reply-To: <202505071602.yJrZsTiu-lkp@intel.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 7 May 2025 17:48:24 +0200
X-Gm-Features: ATxdqUHZtrIZ4qATIqCPYmFI3WbE7fVjUqBiwmJIjt8Br1WsR1D-K7F_EFAuSc0
Message-ID: <CAKPOu+-y6vng-hc7HN=+0U0cuEZCWm-BuYC3GOGGTwJHrJMDjw@mail.gmail.com>
Subject: Re: [PATCH 1/4] fs/netfs: convert `netfs_io_request.error` to a `short
To: dhowells@redhat.com, netfs@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 11:01=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:

> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__cmpxchg_called_with_bad_pointer" [fs/netfs/netfs.ko=
] undefined!

Okay, not all architectures support cmpxchg() with a short. I can drop
this patch, but I'm curious why netfs_read_to_pagecache() uses
cmpxchg() when everybody else simply assigns the value. Maybe, if
cmpxchg() turns out to be unnecessary, we can keep this patch? David,
can you explain? You added it in commit ee4cdf7ba857a ("netfs: Speed
up buffered reading").

Max
