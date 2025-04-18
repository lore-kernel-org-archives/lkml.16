Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7796E2116EE
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744979688; cv=none; b=hGf5U7rlXCVj0F6Z0f1Ger9R2XVi4foTd9caQ6NEXMv535rzFUW0iBlcR/7GuTycrhKR/6QFc1hG9FgaKW0HtEDDnHxrGpx3jZ3xEURmsHzpFaglUwbffZ3sPBrK1XQBY8FLCKkOhMSdVOlRe7wanedTxelMonjXq/iu5wm1Bdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744979688; c=relaxed/simple;
	bh=43hHFRCwrwfsE5PGa6AoyXcX6jfLuJQDkXOgCch4+f4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTf6yzvEg2SvdTpaaiDRl2J58WytXbXkMcYYaHesG1CKWDiq1Fb4pHRWFLSKvwi1YqHrNnucZLhzV6oPBZtbWIcWdtgoClJsiIpENsvoeqyLMf0t89hVRwFSL/K3PUgmtrY/9747KzKYs9yVi0icFfsIoULiRwma2muytyd0S7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=orbstack.dev; spf=pass smtp.mailfrom=orbstack.dev; dkim=pass (2048-bit key) header.d=orbstack.dev header.i=@orbstack.dev header.b=lFzcgBr2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=orbstack.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orbstack.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orbstack.dev header.i=@orbstack.dev header.b="lFzcgBr2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ae727e87c26so1207358a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orbstack.dev; s=google; t=1744979687; x=1745584487; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43hHFRCwrwfsE5PGa6AoyXcX6jfLuJQDkXOgCch4+f4=;
        b=lFzcgBr2a6tbyJ3q7TWhNXxd2ok5oySM2t0HdSkPholovtgTP7LwzPpOOzxlb4AP8F
         LTiS0xTnmRSualSki2EM01N+cPcE7XT99zyJknyApjl97ufDbuHbURArb0k0wOmbkRti
         EmWovSoeYSIWpYnQH7TIKTES+YHNCDyIpdhWZ+9Zc8MCj3G+XE+UXqLyalWAUkjJQfZS
         cYNX9FYOjZlHm7QBS3TVfTf2yfkNh8TalEYODimEJSVyIdfScL+2kaNXrM+h2Nd3dgMU
         ApvDEWiEy9gloFvZ5zxDyrksDc+oexU99V9XZ193DNr3yBzAFPjRAEOhAxk9kFSfBuFS
         tbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744979687; x=1745584487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43hHFRCwrwfsE5PGa6AoyXcX6jfLuJQDkXOgCch4+f4=;
        b=heOFgidHlVA0UhqgDY18BCNi3YWM7ny0uVN48aT/kLTuWqIqDc1fmVwfYmbImBzC+1
         sIYjdiYQKXxe9kP82OkfBm8I/RfSGbRU2ZLGbPf3fMzT3c2m6uTfyhtp4Uxn1yWaszqT
         0oQrwAUQdpfp5Uj3HYsZtFqJLDO9ihiE1unAlJHs6j2sst7vzKaNpRJDI0wWHkrx1cpx
         rUOTOFtpBvOwMKPZYFO47NiZpEackxUWG7Bptdiu0AMuejdc/YiseNHIvMv3imLXXJiE
         afDzc0cfu9e/wbujibRJu4sp9ZhcBmwRXJ71YYdGPtObUsTyceprziqZRsawBlcrwhh+
         R8rA==
X-Forwarded-Encrypted: i=1; AJvYcCUqUq/LCbAr9coc3LDBzDGt7lHjv5Dib7m4m4GJqbW0OBwqYWVZAP9Mr76LUxYvlGhe1GAIRWkIQvcm+RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJo9VgX7EypGD8LRb1RKjPEFZym1vTKTDhUoXw13vlL0wzqOet
	8M3VYXOjhM5gHQFtwX0uUzIbCLXwAD0QLqagS6lMMCBAGuFcLMDxLGTOTHPlwfIl96YRg9H/Q+2
	vgvMpvwvtrwHr9kSarzFnsokcUsebJV6PJbwKpQ==
X-Gm-Gg: ASbGncs6v+wxXB1PL4eZLGFS8ebTklyevXDfLLO7LzTp1b1zeK1banZ6p2qXkfyswnQ
	n7O4O663rj4GJMQ+ybKsWi30G7UCV/PUEynRhz49vChcllg8C84xz/ycN+bCQHyp01nCrn8Vxco
	GMEb22UTbomotuq1T9M2gwwGgkkSJGy93MqXDLxIlK0lXy8s2x/Lw2QkDH
X-Google-Smtp-Source: AGHT+IG5hnVsBWjkUmDaGddd3kNxM76BE02aaGQ6/6mkeMa3Whu0GdcJvbuW86cKDIht0D9pPl2GmX8ETJhwFoXXPkE=
X-Received: by 2002:a17:90a:d64f:b0:2fe:d766:ad95 with SMTP id
 98e67ed59e1d1-3087bb47646mr4283842a91.9.1744979686618; Fri, 18 Apr 2025
 05:34:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325121745.8061-1-danny@orbstack.dev> <CAFnufp14ap0UfJcn2uwU4-3cstr313J86HvRCcKULZLRU=nZ6Q@mail.gmail.com>
In-Reply-To: <CAFnufp14ap0UfJcn2uwU4-3cstr313J86HvRCcKULZLRU=nZ6Q@mail.gmail.com>
From: Danny Lin <danny@orbstack.dev>
Date: Fri, 18 Apr 2025 05:34:35 -0700
X-Gm-Features: ATxdqUEj80hmbgdtqMeJNMf-q7-FLAiu7bNMA3xCWWCR3yFNOjqZUWqbn0J4ixs
Message-ID: <CAEFvpLe=wtaRGx0QyzCFgwhr+gWXHjWgcQLJrppb0EdsCFw7UQ@mail.gmail.com>
Subject: Re: [PATCH v4] net: fully namespace net.core.{r,w}mem_{default,max} sysctls
To: Matteo Croce <technoboy85@gmail.com>
Cc: netdev@vger.kernel.org, Matteo Croce <teknoraver@meta.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org, 
	Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 3:11=E2=80=AFAM Matteo Croce <technoboy85@gmail.com=
> wrote:
>
> Il giorno ven 18 apr 2025 alle ore 12:06 Danny Lin
> <danny@orbstack.dev> ha scritto:
> >
> > This builds on commit 19249c0724f2 ("net: make net.core.{r,w}mem_{defau=
lt,max} namespaced")
> > by adding support for writing the sysctls from within net namespaces,
> > rather than only reading the values that were set in init_net. These ar=
e
> > relatively commonly-used sysctls, so programs may try to set them witho=
ut
> > knowing that they're in a container. It can be surprising for such atte=
mpts
> > to fail with EACCES.
> >
> > Unlike other net sysctls that were converted to namespaced ones, many
> > systems have a sysctl.conf (or other configs) that globally write to
> > net.core.rmem_default on boot and expect the value to propagate to
> > containers, and programs running in containers may depend on the increa=
sed
> > buffer sizes in order to work properly. This means that namespacing the
> > sysctls and using the kernel default values in each new netns would bre=
ak
> > existing workloads.
> >
> > As a compromise, inherit the initial net.core.*mem_* values from the
> > current process' netns when creating a new netns. This is not standard
> > behavior for most netns sysctls, but it avoids breaking existing worklo=
ads.
> >
> > Signed-off-by: Danny Lin <danny@orbstack.dev>
>
> Hi,
>
> does this allow to set, in a namespace, a larger buffer than the one
> in the init namespace?

Yes, the idea is that each net namespace is controlled independently.
Privileges are still required to write to the sysctl for whichever
namespace you're in, so unprivileged containers wouldn't be able to
exceed host limits.

Best,
Danny
Founder @ OrbStack

>
> Regards,
> --
> Matteo Croce
>
> perl -e 'for($t=3D0;;$t++){print chr($t*($t>>8|$t>>13)&255)}' |aplay
