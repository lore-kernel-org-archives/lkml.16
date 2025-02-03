Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1181FBEA3;
	Mon,  3 Feb 2025 08:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738570650; cv=none; b=cj/ihl0bXt8SaF0W6EIV9SOd5L6oogMARf27w+Oh6UVr/GjB/6dAyV4McQF4H2U22yqC4TMtax9O/X4IqXyoxRkSRcr3NzG3WNQcKruh5YE3PldQ25otPSnrGZVgdjbklDzei2kSe/FwTyI3cK+EX9oXaUEwonZzfmp5+doEcHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738570650; c=relaxed/simple;
	bh=AxxM+Oghro50qL7SrbRKfKWGi2Z4tqUKdB9L5D5SM3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgpwEBoiQJ+uoCsE1SFib8GiTb4ySYWSlGTOKvI4+V/ixuYt/jqn/caDjyxLVoLC1vySkYE5G8jPePxLfeieAmlNe+cOD+WlrBalNqCBdZ4hJKz+S+Ab5TZXJ3I+Qylo4pw1LPFngaLXClAgjoqs5YCzj3G23EwT/Cdt3jX9dvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nq/RdrYe; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nq/RdrYe"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso4345300e87.2;
        Mon, 03 Feb 2025 00:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738570646; x=1739175446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KwY9dmn9tpB/fEfgIGlxZgLK8oRB5S74OHPETM9i7n8=;
        b=Nq/RdrYezgD+EAH96RD7kmJ4sc0lEFB30LvHLgkVTe2unQ/HnsStRZSwjYDkDVHjuz
         jrM6ApdJ0kZJuJARzB7Y9ghIT/T10NSSdptKU8/jCLijbXF0U9HtzxOL9g1BnAd5voQo
         P1RDXnL2J1DDc51dpWJdDABL3jvf5PqX3L0kDGLzLzIbz9jxXnmwMbG5ussubaJCumX4
         Zs9qUp1PB7ZbsGw2WZqxQtevATAFPOy4UR8DEtwCa1KNpHZ/NOvMd0UHLKuG2r4LN1ab
         /e7pb+VJqnV8rN0gd3Q/vWtHTzJZskOGV9apxE6TLfr3KNnmmHvzWJbRbFhHGp69S5J7
         z72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738570646; x=1739175446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KwY9dmn9tpB/fEfgIGlxZgLK8oRB5S74OHPETM9i7n8=;
        b=rbJuBMIdesLTkUsuYFFZVr8JwhZMG6Y5du0mTDq9xNaFGaP/LEhBEQgHq8Xaap0gUm
         5ggzrJp2/RaT5BII/RHZLfhNyMWEMzWYSmBGn2gJxc1nfh67uDuloVQvVu2275T58eY9
         VUMZEfGyFUT8ylge3WkY1dFX9+b8QHkSon5wusaFGC+Pgj3vV95ueGt/3m+qKrJelBIU
         MHODJ1EAYYYoCiyCb2I0Cn/TT7aLw6/4zvczNwl4hgCoL9qSIsgnHjYQddiwlX4Abu5C
         nRKxyIVNaDK9se86k5Saad3Ub4FvP4bTGMkp8pb22UOEhna1dODHNR69yF9wZNWnXMr4
         8ecA==
X-Forwarded-Encrypted: i=1; AJvYcCUmLqTkmVXO8ge+1Z9JllWupnhRfmHUifhia6Pp6pjF5sExR0PU43+p3z/uORSDOFLRA76x7Pat/kRES9rip3I=@vger.kernel.org, AJvYcCXULkzZ+cWBm4vK4eU65uZzCkgBOplowqQh4YHr/R4MCF2mzDuwPtBsTnYb8rZoRebchj8ENYoNPunP4Lo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9RSE5wliozqw/Q/MESMnUWD2Qv+cIVkjiuAGKhCogQpZ0vtHY
	tX/lwRjcihVVcSnO39EHrQ8ZN18Cb1jUTzpEdtgur+zxND+zMDMt
X-Gm-Gg: ASbGncuWitVCE9jVm/vVJJFHHbHMgN0Muo3JtHXqYofhsCG4ohq94t2t30V02y7VC0D
	WYhaygtktnmbEGPcvnadTwn5edMvz00Q5oZC6aAaRAx4qb0M5rclCgeVfS35LsmxKCK/3XzuX2U
	28owmvaFtIKy6WZUj3obj+4IRSLxIhLF4eK4YGY82LKYJ2VujRDLjIDPLv/TX3PmHjZ/pMmv3MQ
	8Es7Uu6r/rx+E33dAGkUYteJNFd2Tlu5Jk2NA6BrTaoXk3vVyisn+WrL1gLtsRExOlDOov23Rkw
	Q+WWsiFexdB+80MgbZM5hWI6C64c6LhXO7g3llDwKaVWzV/hUZVWPOFkMN0tWw==
X-Google-Smtp-Source: AGHT+IGKBQ+wd7FfWEWtUosmj3C2VaV+XSwzA8bbZUlfkgoRAt1WJR3dEXACCIH8JBI2gdBWC6ZcMg==
X-Received: by 2002:a05:6512:3d21:b0:542:234b:9a6a with SMTP id 2adb3069b0e04-543e4c32c2bmr6941786e87.33.1738570645823;
        Mon, 03 Feb 2025 00:17:25 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0fbcdsm1242277e87.60.2025.02.03.00.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 00:17:24 -0800 (PST)
Message-ID: <c3a56770-d483-409a-8586-610ce6a718e7@gmail.com>
Date: Mon, 3 Feb 2025 10:17:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Christoph Hellwig <hch@lst.de>, Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 daniel.almeida@collabora.com, aliceryhl@google.com, robin.murphy@arm.com,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <CANiq72=R2N+QiCiHZQu-6YJ9aYpn_bik3BW3U=nAW3jL7unzLw@mail.gmail.com>
 <20250108151858.GB24499@lst.de> <Z36X_ZnCmBQBMoZ6@pollux>
 <20250109080812.GA20431@lst.de> <Z3-NqwAG_96yq8VD@pollux>
 <20250110083955.GA5395@lst.de> <Z4D5a5NYrAbNxUL6@pollux>
 <Z4kG5AcVeQKegLnb@pollux> <20250128092334.GA28548@lst.de>
 <Z5qeoqRZKjiR1YAD@pollux> <20250131075751.GA16720@lst.de>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <20250131075751.GA16720@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 31/01/2025 09:57, Christoph Hellwig wrote:
> 
> Which doesn't help me a bit.  Every additional bit that the another
> language creeps in drastically reduces the maintainability of the kernel
> as an integrated project.  The only reason Linux managed to survive so
> long is by not having internal boundaries, and adding another language
> complely breaks this.  You might not like my answer, but I will do
> everything I can do to stop this.  This is NOT because I hate Rust.
> While not my favourite language it's definitively one of the best new
> ones and I encourage people to use it for new projects where it fits.
> I do not want it anywhere near a huge C code base that I need to
> maintain.
> 

I do acknowledge your reservations about the possible maintenance burden 
due to the introduction of a rust (or another language) consumer of the 
dma-api. But I was hoping that we could arrive at some sort of common 
ground?

If this rust middle-layer abstraction is unacceptable to you, could you 
perhaps suggest a solution so that all rust device driver don’t end up 
with redundant dma coherent allocator rust code? Could the rust team do 
something about it?

Thanks,

Abdiel

