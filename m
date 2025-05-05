Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1281D175D39
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449364; cv=none; b=nYffgfWtrSOSB1WNl4Y3TmkbSO/Ei+/YNjv/ndNI2wLM9KYi3NCAsC+ZnCtUPRtKhRY73WgwEvUPt3sr9FRGtb32UP3GalWaCW2AdXmbIOr3iw5oaj0JUExWl3qN2c3IJr/zotpp/vs+Hybtjx7h2ZVp6/hhlScVqWD0OJGJxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449364; c=relaxed/simple;
	bh=h8U5EjZrfZ43MNluZJU7SJSY3c+wYPMqp+iyFq6DTYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWmz0cFmknyc0VTerrEgcc5WvtqYyy4IIBZY210Ttl9Pvvmko+0rdzL5fb8eB43wrYVDOG4Euzy8v6hHEsJve6umUKEn5gzD6Az+QAbWM7Qon5+oY77eugHEXPoxr3n7OcUUdSX+sT+Bpaxd+Pa0jHh/kinaydm9CiN2uD2mLaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=QTiuQjfu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="QTiuQjfu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb5ec407b1so762575566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 05:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746449360; x=1747054160; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8U5EjZrfZ43MNluZJU7SJSY3c+wYPMqp+iyFq6DTYQ=;
        b=QTiuQjfu97S6HjAEBiEp1Wc7QSASiNm7eedJoAN1a7BPZz+WbUqZrdR128wE3dy3Zx
         UKxVVEKcxdBIlf/6kiptIyq+Uobhwh3IRlyu1iSzSi0SUcaZNguFTGG77s8CC6qyT1rz
         8to4nPv6jOXK+1iqaWlL5x8CoEwHPcnlqgC/0JYXPJmEopuMMT+4djo2MFZT2KC6uR40
         ZwkaevAP2/QWPaNNcLCLn1zlKtJYGnUZRmDNOtKXUZM4e+WtEAvFgVgjTiA6chiKXI5d
         UGjRKEmQKNahRjErjmNxShLoCSMlaAqLGDAmoiVotY0BAS2+wJUTXgHd1exYxrBdxl2G
         uMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746449360; x=1747054160;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8U5EjZrfZ43MNluZJU7SJSY3c+wYPMqp+iyFq6DTYQ=;
        b=mJhYvoKZky9cbBuqwGmys5SkVzDOpFA+vfvaaYBmJI5HdOh9+Gj4AtCVXLwvdTU9QC
         2lD+KCI/IKJeoNsrZ8CR/XqfGdPq/OM3lh4r95cESIpQaur8TbwjsbuWxDA24y5dcJGy
         58SxYPZLcBSqeTWx0NMigsCfbAVQTiO9fAynWBdx82NxZ8eBGfVmxZGP1wCkFu0hqxCG
         JUvHoWRs+BjpypaWgLRXbSQfC9AhA41bK6qJKu9qyoF2uU3vpyvBvX2fOZClITfbpOsb
         DWcBf7Mpkz6sEKP9RZN2p8BhLdXP33mhIJ7Gu3RrUIWoOqmERjurhu/YgVpDsytN0lkA
         F7rA==
X-Forwarded-Encrypted: i=1; AJvYcCWyAmJBX4FF/qppdtqzC6foeescU7WUs8qvbN7DhA/6/vXbrQSfC180FYkeU2K/tHLOWC/XjlqdlIPEpX8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3D4kO7Ugblo5NpWwjmke/SVajM4TF46TquPj0QD7Zt0gzsV9n
	e5ZNC/E0+oRYEFR3CnQWqnqQV+LIj0QpQ3UhhtnJEj0lKoRwcTsgzMul9mph3Jv1yF7KHb+8zPP
	d9lOBXHNmNoL4QrAQL9W/9n6iGKukY8HEvkohHA==
X-Gm-Gg: ASbGncsckcxw1nimef3y9QCh88v2Od/umnyARGOIGZmwD5EdD5/7ouSsBcSuDuwgDc9
	PDXZGtadN9UvvbILnheSkvVua5iYptOieHPFMLMAnGzQQYJrVAZbeIlbXzWj/PFD0Qy2rjoHyCY
	cNhz14r51S2tTpshYX8SZoLGD2u6JHDc75qaEXTeu8dGIeAp5ZfAQ=
X-Google-Smtp-Source: AGHT+IEQEtAmpp+U0f2k8eePl7xd6XBIyArt8z5V5X5PFgIVOlVsppqEAvzfY9M3D0lDOqaLheEog4k1PKphraOtuYs=
X-Received: by 2002:a17:907:72d1:b0:ac7:1600:ea81 with SMTP id
 a640c23a62f3a-ad1a4b1d6c9mr659162766b.49.1746449360263; Mon, 05 May 2025
 05:49:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502121930.4008251-1-max.kellermann@ionos.com>
 <bbublxzpnqrzjq5rmmbp772w2darjoahlewqky7caanaknglbx@6wuy5nidsnu3>
 <CAKPOu+_8cbUk=8d41GQGOvUrmG9OuaNVuSQrksDcUQMyFc4tiA@mail.gmail.com> <aBUQ7EzmeWYCyLwB@slm.duckdns.org>
In-Reply-To: <aBUQ7EzmeWYCyLwB@slm.duckdns.org>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 5 May 2025 14:49:09 +0200
X-Gm-Features: ATxdqUEYQB6USgmiCAV7OU2CKrYQgnrzCesPwZ7-NaiO3m6zeMlp7cMoAYide5M
Message-ID: <CAKPOu+_Dk7rLgc+5YbMd4xpcjz74XKnR1jkgaTxu81EvE-q1-g@mail.gmail.com>
Subject: Re: [PATCH] kernel/cgroup/pids: add "pids.forks" counter
To: Tejun Heo <tj@kernel.org>
Cc: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, hannes@cmpxchg.org, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 8:37=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
> +1 on pids.stat, and use rstat and avoid the atomic ops?

rstat right now is specific to the "cpu" controller. There is "struct
cgroup_rstat_cpu". And there is "struct cgroup_base_stat", but that is
also specific to the "cpu" controller.
Do you want me to create a whole new subsystem like the "cpu" rstat
(i.e. copy the syncing code), or do you want to add the new counter to
cgroup_rstat_cpu? (And maybe drop the "_cpu" suffix from the struct
name?)

(I have doubts that all the complexity is really worth it for a
counter that gets updated only on fork/clone. cpu_rstat is designed
for updating counters on every context switch.)
