Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268CA2144A8
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064675; cv=none; b=IzBeKsxnw1wBN+atP0+jBCnW0okwraocAx3KQ4IoeWVp3A7ueKaVv2OUWBxeskgXAX+Hl4ZGWigCiwP6c4+uAuh7a7jsGlfVzTYANMsJKii+nsvs4DFdpVJMWWGYMLJP6Wah9z681/uI60oNHGsSHEE2bGZyplvVRKCX5bV4OiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064675; c=relaxed/simple;
	bh=vNNOALAKojuc1IVmn4YDr6ggA0d46EQHEfPXL/A816s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpWblfbqD3s8p6py1IP5QBKc8rcCRKvznkVjhFaK5y/wqD3+5N4Q/a7i2YDbT8yEnFKVrN7xtlG6E8NjM91p4PrHDoH6xPE5eaArIrdOfDql07E62vk/zzUmanJ14pn6kLGTaY+9bZyY5FJODzzhqlvLUj8WyZX6CkMgr355JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KkTehqYX; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KkTehqYX"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso871762a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746064670; x=1746669470; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=KkTehqYX0jB9UxVZxFQTt38bMsh+t5V+RLQOeijqakuyCqp7qINnjMKXNYo7oqU7dS
         gn7yvL85UAbjkpKNQRRR1oDpXgm0eHTqYwUqkqpT+6OHxqmN14u+6SRtmYWvloh/lOWb
         klKDYirZS1Peq48PDAHRkYxj2yhaBK1brpJ0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746064670; x=1746669470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WydL3B0dnp8hxEJArR4oBSH0m050M1di9pDwlQ1+3BI=;
        b=MmPyO8z+TNVInfnWnd8OLkyN9erkUCI+m+939h9bkvnVeSsvz51knFfER76UleFzji
         vMX4we0AZFmux5nSnxsbTW47+DUuJSGxxhMLTGTfBALogEhl5TjRnzmu2JSHR54dusg/
         LJS87EXpNQj9qDyEa+QeM+Fj91Q9Gt8Rywl9XAQYZXKET87rTNifsJQjrbg6QjwAEZQ/
         8rBW2LFpTlps/XdiNIo4ghpjkP6fdE4NeIwIvBW2ekScVwoFFrNH8a4pxy8aKZvA/038
         ZKtEC3Nea7AF5Vj2WmBt3d/e1Vph/Pfaafz8aVdcOUevmy9JaB3iXrWXoHYduuXxC2TR
         mHPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9KWGMOAoY5zOt+qxydAaIP2/knXAod8IaaRZfRXE6md8AsjzSnPPRsYuzuEDJOs+60JY7zD3rVpEyjkk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyROkXyExElD97q+x/1oldgWQ2Mc01DUdXHkWe50a3fdqdYT4Hc
	6eJ4LXAZ8HxL9XV0/QMdfqmihM8LBeRgGEV50dZkiZRYn4jmr2AHQV3O7Xz1UpAD+DbnUqA3m4Z
	h4eM=
X-Gm-Gg: ASbGncvG/7Z3WF37oQebQLjuY7cPxrCzh8KPCgRhTLy1o2izhGpJGqNMLyiBApIFrIb
	7/ZYkQh9mL5TtkHPlNB/EQ9eLILhDDJKy6bSGYKwhm0fvwj6RhgPfFWlINBUSl2BxRq3bAgAyV0
	xcz3EW8MuBQxVEnyJaYmYLPBOpHo8RGz0WWpfcn/jXRzjgRNbWmbKrApPlcXKplD7MkFweJuB1z
	nXr6bTrt5PPj7suFMdxkRVNOiapCIZXD8erUaMVFLHzVSwdAGppKdttzRxLqh/yNwlwtUU/x+X2
	IqDgfej4I6qPyFZ5i98sj3EVUcr1GY/U2cub928IK5HWca2X8vRq0tMMMPm6qA9ogVH3TGf3OFG
	F5qUc7KHH0Z7N7aY=
X-Google-Smtp-Source: AGHT+IHhovwkzSXLX9Y0PZOldzylNs10M5y5n9PhrICpNfGQc/9+syCC0q5caPoAV+shBEp91mUzUw==
X-Received: by 2002:a17:906:7307:b0:ace:6e8b:516c with SMTP id a640c23a62f3a-acef425cdb5mr143489166b.20.1746064670227;
        Wed, 30 Apr 2025 18:57:50 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1ac8sm984136466b.182.2025.04.30.18.57.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2c663a3daso89842166b.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 18:57:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXUC++RlfdaF+O/hDJ8H8QAXjAb+z0R4AxyekJbE+Y+WrHjDT128pKB2U+kS/wCsQwecHzQFXz+L0UunXQ=@vger.kernel.org
X-Received: by 2002:a17:907:86a4:b0:ac3:5c8e:d3f5 with SMTP id
 a640c23a62f3a-acef4299d67mr153004566b.27.1746064668786; Wed, 30 Apr 2025
 18:57:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
In-Reply-To: <20250430-unterminated-string-init-clang-v1-1-10eab729bf3d@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 30 Apr 2025 18:57:32 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
X-Gm-Features: ATxdqUFgZ1ZDKZdSgMYuRCt9GwTeRVMgI6qtOB7_7i5pEIVOBrqHEKYehH_TDJc
Message-ID: <CAHk-=wiHt40bxkx=1-2iecw32h5i8GXi=zpD0nUVdZxfh2k8mg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Properly disable -Wunterminated-string-initialization
 for clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Apr 2025 at 15:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Clang and GCC have different behaviors around disabling warnings
> included in -Wall and -Wextra and the order in which flags are
> specified

Ahh, ok. The clang behavior makes sense, even if it's obviously not
how gcc does it.

Will apply. Thanks,

                 Linus
