Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972DA35C901
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 03:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746501143; cv=none; b=mnV4rGy2Tsk8XkpbI8Wx9LoFYOcQfnY/zp4Hnd2leWsBBWq8aG6hzXVi2Ot5dLCSB/y9Abvbig1SHd7tbBDw8opL+z3UC8xUJaISA+SGgvP4HNyfNr+Ec9or5N5KOr54AXKECS5ai9Y04wTMNiWCkheAc7Y/AWJemUayHOKeK4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746501143; c=relaxed/simple;
	bh=RqqvXt513iIsi4tEHeAi0LVjqWyjH4X/JB/2aZa5zjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Obke+41XsZT0zY7l2bu0SkCjTIq5Mdd7OFR9BLSHdRvh+te/U8G8z+beRM1ah6uCeDvhNypcY4M4LkYy16zYF2OJtNnu3ssQLbEXFr+sco4MstL2I5CIq2VfK/m78EHDI3BLArZ7M5+YIMrjM8ogBDiyOvJyxSSkVJuZKCtcObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cJn0CY9N; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cJn0CY9N"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-30a509649e3so2803715a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746501139; x=1747105939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RqqvXt513iIsi4tEHeAi0LVjqWyjH4X/JB/2aZa5zjQ=;
        b=cJn0CY9NZ3pbmevczDz/80RrUdulL3i9FvnttFsS2l1L67X1YTc1UNTLgcYTwROx6g
         IYyCqOlv3Z8Wilg1d1+7qaY16FGrzQ9Un8YFP7AojmNPirSp6o/zLmbsIkKuoDIWgUDU
         YYFfkKEVcH5rmf8u0MonNsafcDynGSvHL0I2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746501139; x=1747105939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqqvXt513iIsi4tEHeAi0LVjqWyjH4X/JB/2aZa5zjQ=;
        b=aR8vkqjAJ1Oqbjfs8flrweKgsqTPDf0MRdt4JadUa/ZLs0hxMAKdkxN8OxKXtAI+Mb
         K3yzpQZYSH+BZ4a2UUZ8qTlNl9efnJM0M9ZU1qRN1OxMvdBVv3C/6UM2mm7C20F13u1V
         pz/hBzhDfYXRHQu878hohEgKQd7Uu2ukWlO1ISXQ2fuiQJwIW/0dCcV9nhNoZudpPOds
         l1QF9itrKAOoNx/lME5qeW65g5I3/9RM0YLJPEFAaXKVrw80/iN2PF7j3zoi2l9gi2xX
         4WtiV2oBgWPNtlGmbWqzUm+fV8ddqCHGtElIaVyuKVukyl0rjq6Dk5ehd9hZuW1FVkWO
         YLKw==
X-Forwarded-Encrypted: i=1; AJvYcCXj9IUQ7OCW+RdbCWcQiqfbndwk+fW7tLg0fFuZLyjudNhDvH5Kbe6MKyU2Rph04kR7yzYg7MMPlGQpbgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTiNeXhSuB8O1EV2A81NP4J9wbv7X3B1XGvcs3CKfyV4IwmBj
	4EUuHkzuTkIJykkidQdKJfzJBARgxWyzsMeS0Z94TaEpXXRKnbP/035N6P8u7g==
X-Gm-Gg: ASbGncvO+GGzMIS+m/Nkev6bCK84Cp5SktLyNDGwyruWNgL2btCSAIcDYnV0eddrMdF
	Fx10BoHUv2TxASPcEEKZsYbUrCTgUK/M2Opsd8ASpRDXTfljOou/kuJxeQ8Psb+3Qum+oZLigCd
	kL7jt45k1fJ0Oq5YtEwqJlP/bD/0TOfdnuhO/Oqah5mzC/JS/E+PukE7DeB8kU/pYT+XllgPCvQ
	g6eMfql4RoHvjMhGCy2qC1kApRnk88kzupLkqdiIw9rGQdy4Fg3Y6Gi8qKINcy1FeK18Eu+wVNC
	XpotKKq5vlWM5Q3Ezl+UGfxmWy8l6K5X0XqrBr3nYWM=
X-Google-Smtp-Source: AGHT+IEoP0z3CQ01WfsoSBzGXyLXz6fM+zSx5xAVq1j+5tcUHWpw1G3BbjuLnXDQ6/FXH15JqRBSUA==
X-Received: by 2002:a17:90b:3f83:b0:2fc:a3b7:108e with SMTP id 98e67ed59e1d1-30a7dabd723mr1736929a91.4.1746501138855;
        Mon, 05 May 2025 20:12:18 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:761:97e0:917d:ad1e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a47642083sm9968386a91.45.2025.05.05.20.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 20:12:18 -0700 (PDT)
Date: Tue, 6 May 2025 12:12:14 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] BPF fault/jitter-injection framework
Message-ID: <giu7jtmw7ixfej4hkpmdjy6agplhokinyo7lzfd6pc3chi6zm3@7jjqpl4m5r2i>
References: <5l4btekupkqatpxkfaolqhc5kw5wra3xvd7dosalem6zuo5vp5@vwfd7idoqdzv>
 <CAADnVQKgEViz3gQ2QJzCmnm-ou-r-=_i3yLaW5JoKK9okVcGzA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAADnVQKgEViz3gQ2QJzCmnm-ou-r-=_i3yLaW5JoKK9okVcGzA@mail.gmail.com>

On (25/05/02 19:10), Alexei Starovoitov wrote:
> To call schedule_timeout() bpf program needs to be sleepable.
> Majority of LSM and ALLOW_ERROR_INJECTION hooks are sleepable.
> All syscalls are sleepable too.

Thank you for your reply, Alexei.

A question:
Are "ALLOW_ERROR_INJECTION hooks" some sort of BPF programs type?
I looked at libbpf but couldn't find any mention of ALLOW_ERROR_INJECTION.

Is there a way to make sure that "bpf_sleep()" can only be called from
those special programs (that would require CONFIG_FAULT_INJECTION)?
