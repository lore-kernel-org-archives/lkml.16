Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D2C1A4F12
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874735; cv=none; b=mTly0fi/8x8+T4y1xhPd7CHu6qD3hmI4p6TWhTYsuZRoOHwI/uZRpTpXGYpHlwisWM3uhQ8kmEzIqwiFJnN5BVE+j/QMAVUVySNMK7DI0s6hb8M4FvNOuLPq4yKFhaaMiCec+oh4XWYVAlIlcnoDDvkKt7NCzSTEjBn5M+2ZknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874735; c=relaxed/simple;
	bh=pfVdOI7zeX3QZjonU0bDcxUgEVXtWcwPpFzM+WZZo8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSUGwP3Uw4ho+ILEahqArxrZ/FJE42E7/Yrkyf/IyhCkFxHVyZ+gOrqt/FuD0ok3uLUiyqmALD2mjjsysdd85/bJz1vPhQKeR+uv2tDmBkJJSxLp93Qi9tqOcya+l2Aq9Q2OrQSSaUy9Ce0p9nLUFSqfu0kM06d5cyN7Tb6+Suw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OCq06UAU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OCq06UAU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaec111762bso325609566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738874731; x=1739479531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47JwpRHSzZnwFr+mlMdiSA0nMc8sUlKLRRzJ0WxNtMg=;
        b=OCq06UAUOlIa3ZUA2PsML9QhzWuGuNJSuywDmHnMcHYO1FLRqFn150d/eI1LGgIyLI
         7W1l4IJYNp23Im3JCK8Q4z0qaGqGSm+GzDMcXsV9EYAgJlw61wOIFfH2i7A7cBchscHt
         yBPuPAq8weR7y9IyzqcbhHy2/xmjWju0jNE+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874731; x=1739479531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47JwpRHSzZnwFr+mlMdiSA0nMc8sUlKLRRzJ0WxNtMg=;
        b=ezNRG4adfYcnUCF/kJguC1NToYT/jeT4i7usVwrJNSjSJQPCjaLFwMxby2JNNcwhdH
         5yCmBZroraaZhwyeOAlQ3x9691v0gJANrBaakplPByMqP4+v72vIpCqlo1t9syVqN62U
         m8lo3UWbkoWcMAxuWDBkVaeSf4V6vp+OBoZNQqd5oyWAcJZJfq0YJFR43myg9mwpczYN
         gd2z338sSZ007zGd2u29cLXI3+/EerlaM41oQTGLzrxUBumB42Er2xFPko7ZVx9iqc7O
         uelmIWtyQfEkLzr4tWBnIB5Nkp4MxxVHoL0Nc153XfBYg5HdSefc/23NfoBu63Daaxe3
         0rIw==
X-Forwarded-Encrypted: i=1; AJvYcCVGUHQyxhsdEQ35VV4MCQ2nfqAjnMwddW6U/PRwSCqjs6jJLXhBJhWanky0h2ZKw72paZot2rIqetQwETg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcuaeeLWf5v90+438sh7OAQUuNIWd8ODwsvMxykUB9pvlD2ma8
	eMvqxvsfqhmzvl1U+lvwSbD3X+QYV7KySLRyrwKZ2ELq062Br2oZ3N1ptICh7dnhUJ1dL+/IGWM
	MkZPfog==
X-Gm-Gg: ASbGncsZecCbjMwGFnrD+E1SjQ16WTdnEUahYkmVcT+5aDVUDbzqnxwaF9pmBlSOmXH
	8xldnIvN+v7Rhu4p3dBnJz5ghCD5EPsL0Io+oByujWb7dKjwYbJ14cTyHK1pnrm628FF+1h+MVn
	JRZKbfMsVqZcfhBPu8nKlXtY15MgS7CMLOU0VchLPim8/jquvVUc+c5et0CYuMN48inf1KPD1Wy
	OjEWjXnJrXDLgURkG+jvZpPMhq12e3eztUXVspbd+9t4+EEMfaioDkzfV+ld5bdjY+KffaVTJe9
	9kZ1CeNwL9e2RYg3kKEmV9hVIOKH61fSMyw8oFgzqaGEWZO5c929SfdmRrHIGw3J2g==
X-Google-Smtp-Source: AGHT+IFvDmc+GRnoyNmV2qoTk2EciB43XYZbCOAFqy/7dWOEiye/losoaqp4xvEYzJXsNgyK9ejGig==
X-Received: by 2002:a17:907:d1c:b0:ab3:7812:ba69 with SMTP id a640c23a62f3a-ab789aeecaamr41819666b.5.1738874731207;
        Thu, 06 Feb 2025 12:45:31 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e70bfsm149806166b.104.2025.02.06.12.45.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 12:45:30 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa68b513abcso256017266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:45:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7XULCcqTZRujnBo70sXZFNlu2uzyvEmKAua4iujaRPiJA3ek3/pQsgEojChMK1YCRoIcUpFx4NWVn/Cc=@vger.kernel.org
X-Received: by 2002:a17:907:c0c:b0:ab7:5c14:d13 with SMTP id
 a640c23a62f3a-ab789ca28c4mr31209366b.53.1738874730174; Thu, 06 Feb 2025
 12:45:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202502051546.fca7cd-lkp@intel.com>
In-Reply-To: <202502051546.fca7cd-lkp@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Feb 2025 12:45:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
X-Gm-Features: AWEUYZniy5QwqYp4xcLufzK5aZ9Oiqagy7E0-rznZnU-hDviaSvFAI2cC75shLY
Message-ID: <CAHk-=whSncSTE_Q0as-d989L_niJ6=ViwaDoOK6gTcWHNPkp7w@mail.gmail.com>
Subject: Re: [linus:master] [fsnotify] a94204f4d4: stress-ng.timerfd.ops_per_sec
 7.0% improvement
To: kernel test robot <oliver.sang@intel.com>
Cc: Amir Goldstein <amir73il@gmail.com>, oe-lkp@lists.linux.dev, lkp@intel.com, 
	linux-kernel@vger.kernel.org, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 5 Feb 2025 at 00:09, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 7.0% improvement of stress-ng.timerfd.ops_per_sec on:

I have no idea what the heck that benchmark does, but I am happy to
see that this whole patch series did actually end up improving on the
whole fsnotify cost that I was ranting about in the original
submission.

Obviously this load doesn't actually do the new pre-event hooks, so it
seems to be all just about how fsnotify_file_area_perm() (or some
other fsnotify hook in the normal read() path) now isn't the
unconditional pig that it used to be.

I don't see how that would be worth 7%, but I'll happily take it.

              Linus
