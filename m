Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C61A272E44;
	Tue, 27 May 2025 15:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748358586; cv=none; b=uANOT7AnljpNUJqA+ckj+mbfQe7Z2di83V0mjoscyF+WvoFBHrWb9gzLfgQUbVbZPQQcdgG3/c/rRnysKCNHyHP3emIOe6Fy9l791kGYi3qMmyvucDseboRjgSFbnDln3ZknK1hS6/G3YppTbFJmrBKlygpsyZivEKbym+tiVeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748358586; c=relaxed/simple;
	bh=nsO9cYZYOEgibWuYBKwUuC4t8IIr1eOXLL2A0MiTgIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BzazPnc3oqiXe6XJ2Viyt2AIYN0exrd21/f0JSj5D97s3g8pwYu+/xSk5SacaKv7Eoz9RmUemRE7ykFWFktTueeufRYM2H0TdZcE9wUWqiffBH0kAodqNwkbRu604hHciDKmcElDoCa3DuSBxRrGU6iZUhF7XHcHmtHdop/hwtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=QwfAqKoj; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="QwfAqKoj"
Received: from [192.168.42.116] (p5de45227.dip0.t-ipconnect.de [93.228.82.39])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B2C0D2FC0055;
	Tue, 27 May 2025 17:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1748358178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZ9WkBCJJaU9Gi5utnNrrLjpOjPwylwZcl5TUZRb86I=;
	b=QwfAqKoj1i3miFKYIZfs53TEmdWOybu0DLiiBAWQQehGIGkV49OZ43vb3LdVJGDoyrR69C
	5+XDriHfQlygS5w8uL4wYOgQrD+FLfHfD1WRLKgu4Vcq0x6nnlXWVGjrqh7OBhxkw/soIi
	e8EDsJwQklsur17o6TE36/6X92Ljx7I=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <2c8504d2-7b17-4ce2-b75b-76b73c5fddda@tuxedocomputers.com>
Date: Tue, 27 May 2025 17:02:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.16-1
To: Hans de Goede <hansg@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 PDx86 <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Sebastian Reichel <sre@kernel.org>
References: <pdx86-pr-20250527124435-2181824944@linux.intel.com>
 <aDWq/U57DO7fMu4K@duo.ucw.cz>
 <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <4cac7f91-608b-4362-99ed-4d8cd5935900@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Am 27.05.25 um 14:47 schrieb Hans de Goede:
> The HID subsystem has no intention to provide a separate
> API for HID lamp array devices instead userspace is expected
> to use /dev/hidraw# and openrgb, the defacto standard for userspace
> RGB LED control, has been working on supporting this for over
> a year already:
>
> https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests/2348
>
> and this support is scheduled to get merged before the next
> oprnrgb release. Also note that openrgb will need to support this
> regardless of the patches we are discussing now, since other
> hw is using this natively.

Hardly anything to add to what Hans wrote, just that now that the kernel side is 
done, I started working on the userspace side to push that forward: 
https://gitlab.com/tuxedocomputers/development/OpenRGB/-/tree/tux_lamparray 
(based on the MR by CalcProgrammer1 linked above)

Best regards,

Werner


