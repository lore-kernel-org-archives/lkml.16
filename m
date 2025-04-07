Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB12566E2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744051530; cv=none; b=WDwWkcaP0Chjlm4s6xlKSDaOOMbxwlCCjb0w2DDcQ3eNp1v9qKQWzxDYF5++8i9GrLTv6lP5yagX3MZC0wmHio/6KQa/Wze3TpdYKSrHaSJ4AMEUED5eAP57BYX99iQTa20ZCMpoCA/zSG6JmvO9qy0XIvA/vIlTkL3eGlInbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744051530; c=relaxed/simple;
	bh=kCJKLDSjLyOdWWiM38jObO7NdawnHGVxGRyRXzGSXvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRROX/3Hr2884iJuPiwUTUY6WDT6uK+x3QEYieSTefe715M34u1Ai8hGswcpJQk0kXOp72oW2DbD4q20lplRK2V0B9WcaPpIlKHZqCfvsNz5X782rDZ0GE8H3Ll4Jjm75aatywDf5QVjouHnS2p5omXPKR3jAbdV/p6AxBjkrkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=TS5IcDHv; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TS5IcDHv"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2963dc379so775188366b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744051526; x=1744656326; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YV+MhlununtLQYS7kRmmuuDW4TFofcQ44XcCu4Jl/Co=;
        b=TS5IcDHvz5sBt+1vztRSVGhEUqqRCVCnMrw5ev+1HqP+8IjbZ3tZ12NIOzW4Be2KCF
         XheQn8e7nAXHFcdqaW421fhhy5kONnrvoY+wOHmbUz8NBibZAa20DRgUB6MIQMV/RisC
         /B9l4vVJbd5kUS7ml9Dsl00vq3jQ1OcFTs65A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744051526; x=1744656326;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV+MhlununtLQYS7kRmmuuDW4TFofcQ44XcCu4Jl/Co=;
        b=LBnQMGJiTMHNS6K0C8SZO/E0XaTW+GYj9bzTNHFHbEjo9ByzL3NWuHRLIpJgVowyOX
         yVyjJ4lTi6NOy/uvP4zgyO+oumyzXt7XA2bV1SAzK7lblXBL6Xa1hsi4wZWXH15xdGnb
         ZSpkxAkG3sioDkq81MzYWAtbL9xwBrgDUEqNCDQPbrt1S+jBcVp2VMemifVNDCBaD+KX
         /F4uI3cS40Bh10KXmqxN814ryvm7qtjGwvP0zVtDniDwj79vdiCC64671krp67OeP7Gf
         SBNfOs8jdLdNtbIwpnYioBwtJRApWmqA63jbbbqXg33a9O4sWIivZ86DV9u5qqu5uvwr
         EXkA==
X-Forwarded-Encrypted: i=1; AJvYcCUnlFGpWaAw4xzgs4J8rNDvp6UTu+VcJmamOe2s++4H7ehJUINrCdkn+o58XgChlatJdeNu4cXP83KsLpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqSx+Xi4sj3ayyJ5tNgHYO+giDZLnoUPyctMZIdu8f5A7N27QQ
	usew92v/ye+kx2evyz9QLyS9ZfWgXcTpaWzSnqSHHNoOjsildbV7HACS8sd4vOfL2YrwSlJqheY
	5GTw=
X-Gm-Gg: ASbGncszMoCCxAfIsnCyojSMOTlLgEjZtpn2RyrsxJqkw36moDN4W0DCrFH0XJsGDnf
	OC7PXv4VSruRI4ki3VDCszcvZEFpn1rLSCXGGbADD7hTalXLPo4TcBRmHCKmKqeP2IQoklpQx6X
	fhuQtm7fF90IXblbu5A83P6pvab5/7wAl59/EmtMvjQ61a0DKCWVqRL/jg4/mDT7yfsJPSTOIpH
	j5rd+iCYm/DNkkbDPGAisWeqUcKQNLVDcBTwjvW4f2yxFP6zFlMUnLJgrFiEroWA/nKBpF4pbfW
	lCL39lAtCVBgd/zA1MUS3QnVhSFeV1cVS0ZDUumvimXooNDgMrscRVTcmi6G//veansBusYFoXa
	GZluUFgldgBCfAmgNSQI=
X-Google-Smtp-Source: AGHT+IH0aSz0btXArk1bQbipzIl/PJzj9JIKsFDQp1ZbfR7JPjeTQyoqhuMvKJDjkzaEWMRszqqtFQ==
X-Received: by 2002:a17:906:6a14:b0:ac2:e059:dc03 with SMTP id a640c23a62f3a-ac7d198ff85mr1286945366b.38.1744051526089;
        Mon, 07 Apr 2025 11:45:26 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c018691csm788094766b.150.2025.04.07.11.45.24
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 11:45:24 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abf3d64849dso779545666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 11:45:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVoS6c6vl9n6a1xioqT/t/VCPlMMp2E0MbGeh3n6ewMIB2n92ENSuBvqd5y2EhAbeTtbLpAELwttQj7TDQ=@vger.kernel.org
X-Received: by 2002:a17:907:60d0:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ac7d198fd31mr1350764866b.48.1744051524005; Mon, 07 Apr 2025
 11:45:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
 <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net> <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
 <637b45cd-9de4-48f7-ab72-ac0ed7b80f09@roeck-us.net>
In-Reply-To: <637b45cd-9de4-48f7-ab72-ac0ed7b80f09@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 7 Apr 2025 11:45:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=whD_bqOrBx96DViC_ZrNjg8isyQbTZbx1StxFFOQW+u_A@mail.gmail.com>
X-Gm-Features: ATxdqUFGJHzfhDBOCwu4l3f0iwdb0kb7-N7PYlvBMixbpuSRHYsE38RKFnAJ4a0
Message-ID: <CAHk-=whD_bqOrBx96DViC_ZrNjg8isyQbTZbx1StxFFOQW+u_A@mail.gmail.com>
Subject: Re: Linux 6.15-rc1
To: Guenter Roeck <linux@roeck-us.net>
Cc: Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Johannes Berg <johannes.berg@intel.com>, Oak Zeng <oak.zeng@intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 10:15, Guenter Roeck <linux@roeck-us.net> wrote:
>
> > Hmm. Why didn't that show up on x86-32? Or maybe it did and you're
> > just quoting the xtensa case.
>
> I didn't see the problem on x86. I didn't check others.
> Let's see.... openrisc and parisc are affected as well. I don't build
> allmodconfig for all architectures, so that may miss some.

I think what is going on is that gcc is smart enough to turn the
64-bit divide by a constant into a series of shifts and adds and a
32x32->64 multiply instruction.

Presumably on some other 32-bit architectures, that optimization
doesn't trigger - perhaps due to them not having the 32x32->64
multiply?

           Linus
