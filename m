Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B141261563
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739295648; cv=none; b=hoN8U53lKB1/GOv7NhgE+OHs1n+fgh9zv9u7EBypKqMGQ19GG4DgFsMkq8evlGeq0hsHydGgVrI4VlEXRz6RnYvWj/fISdu3yTkUzvhrMxuaRLVzlbkKOS6D+MH8Wlq8U2gub18JeXkeZWI9k5rCX1KJYwk7I+Si5qFN2ZBaNfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739295648; c=relaxed/simple;
	bh=Gl89qtb2MUsfe/8pKuOXnBbxD2G598AXAHnqxWboVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZx7OKDP4NgU1kBnIJTD/bCGY/7mNAKSBwFKQ35I+INr2WXrjUU8l3h32XaFiAJ20sqhBA+kwMAOTx6qBHg6jHU7qcKCoxTv4MLWX0CzJHgtJ/PzlnF2UwjfRL/6T74sE8jlXwU8GaIOIKuE1Xpr6k32bVAtShfjt6K2P5pHNTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Cs30FbkJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Cs30FbkJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so1081466566b.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739295645; x=1739900445; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=Cs30FbkJU/z6+kOX/NeQi+nEKmLnplFjDXoQvoKD07u2VcZjlUbXT62v5+iZoxBTA4
         Fkx1CbTKJlg4tBN1q7CeTtarEUx5wM5cFK1OR4AAI9T5yeuzWf9Jllsy5oC/6xiex9O4
         d0bC5Td/oRCsZE1b1gehef4d49gOga+vbQOT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739295645; x=1739900445;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sz+2zlib0S1+CTvsIUDnMSNs7707USycABHIy9UgNmQ=;
        b=X+JqfYLWJK1nuAc64J2LvFl+6cLIyOyTTf1Z/DfpCLbjbDooRJxf0Jw99rPmbxGgiU
         zGVJEA/4ERXeQqdiVBGE/2LEUOXyaOEn6+QaKdfJMIjncGnJ/nh7Ambxl16paOlbTQV9
         kJPNJ85ryVrWAUEG0Q+Cfjhv5X925E9TiaEbx8Zuhx6OCrC0JxBpAJ/SiU8OhV2fACFW
         yb1aUrA5y/K2nTMsVyh247/BuQIu/TUfssYauk2zoPmg8TZ7GvFfvhr64EWRxSlWX9iY
         Ee/vVXBuDwms3q/aA20J3QPRtZf2G5etIXOM9D4QPWFw/vP/Dd3u4t8ewp9QWGfBpoVt
         3rmA==
X-Forwarded-Encrypted: i=1; AJvYcCWWPNL33y5WL2/Cm4+0U71qQF3hZJqXCY+ZS7E7R+uGFtPdzmbqxznAga7487P2OhFwOZ5qHQ3yGeVb6jk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2OFcHtQ369X6DPsxLJFuTcvClrZpVFWGTddlupr075E6aN5n
	OuGdau91jJYe+2kZqlMIhh69yV1p3fo7VLrJy00iNFhmostzgtuumJZW/h20P9Zi/lNeBOwZ0aq
	K4qk=
X-Gm-Gg: ASbGncuxzlQDmYWpOScx/d/SsQLjcfjgiWOMvB6yWQrWKyB2GPzGimPYostoKF4cFyW
	2938zz7VqE2fTaMUxQVnoMOY0X9Jg4RPQlMKmFgn2DMukLXcfK1uCHV1zyZCJ1MgFNQ7OM5us1y
	3oVDOZKHcL1KnrhXZk02vavHVcisVF2UMDMP4cIxkX+6VBpD2gnQDRpCkT56lKt+827erEXL5ZN
	9r4ned6bRGHdw4cgo+F1no4bJgwDUJX9psUQaWJ7B2sX6aBmZ0wQjhDBqxWk44Mz+z+izc5kW9V
	VitxsvHwy0w3bgqI1GE/Dn1PVEszplvJlYBUROHdwxGg5QPuX30H/DE7n3Wd2reAIQ==
X-Google-Smtp-Source: AGHT+IFRbVyhQF3WMyGNNM2N/xejmkS7Fqr0A8ooi9gafNd6VWOZSrVCEn0a1cOn0R9nwJZkkK6J2w==
X-Received: by 2002:a17:907:1b0f:b0:aa6:94c0:f753 with SMTP id a640c23a62f3a-ab789ba48cfmr2334209066b.33.1739295643639;
        Tue, 11 Feb 2025 09:40:43 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7dc2943c2sm186610966b.168.2025.02.11.09.40.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 09:40:42 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5de6e26db8eso5524776a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWothpH3/aKqSqa36j2Ubb+hJe1nsCIiBOz7RZGNinAoAk5UfN+j2PuTqZblOCujhZnoyjYbq5XJICtWpQ=@vger.kernel.org
X-Received: by 2002:a05:6402:278d:b0:5de:44b1:478 with SMTP id
 4fb4d7f45d1cf-5deadd05019mr166853a12.0.1739295641520; Tue, 11 Feb 2025
 09:40:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6Ow+T/uSv128wdR@duo.ucw.cz> <20250211141109.GV1868108@google.com>
 <CAHk-=whdcXj==9TkCpQYpmzLweCoDzd9_i8SrODjaQ3ysSe6dw@mail.gmail.com>
 <20250211155614.GY1868108@google.com> <20250211160125.GA2274105@google.com>
In-Reply-To: <20250211160125.GA2274105@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 11 Feb 2025 09:40:24 -0800
X-Gmail-Original-Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
X-Gm-Features: AWEUYZkX_fOqnnjmQb4I4Q6pfCSRa56tSaSWMI6CSJkYDffeNhXYzTzv3XAJhhs
Message-ID: <CAHk-=whFeiixFbNx8F8rVeCC-Zdco_sFyYynAbRyJH_NAx0Ukw@mail.gmail.com>
Subject: Re: MAINTAINERS: Move Pavel to kernel.org address
To: Lee Jones <lee@kernel.org>, tools@kernel.org
Cc: Pavel Machek <pavel@ucw.cz>, kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 08:07, Lee Jones <lee@kernel.org> wrote:
>
> > Out of interest, how did you apply it?  b4 was playing up for me.

So I had no issues, but I don't actually use b4 to apply the patches,
only to fetch them.

>   Fetching patch(es)
>   /home/lee/bin/apply-patch.sh: line 134: /tmp/<Z6Ow+T/uSv128wdR@duo.ucw.cz>.mbox: No such file or directory
>
> Where apply-patch.sh: line 134:
>
>   b4 am -3 -slt ${PATCHES} -o - ${id} > ${MBOX}
>
> My first guess would be the stray '/' in the Message-ID.

I don't know your apply-patch.sh script, so maybe the bug is there,
and it's your MBOX thing that you create without quoting the message
ID.

But in case it's actually b4, let's just add tools@kernel.org to the
participant list.

              Linus
