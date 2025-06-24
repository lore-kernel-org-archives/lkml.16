Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBE41DF98B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752569; cv=none; b=bkLB/fePJ3Xn83vzKivkkQfSGbvSmFV9Ywjl3Q7OE8hG5X6vCh8md9QooyxefRVxbFVL8IpWKFHSdBweAUzPiC/t3uQuWN59sw31CmOD6DULbttmYzdOYy8oSaOgwuvxKOXFhWpwNtYrgYvCOdNrAw/jup3n+V7c2EYTPmVofHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752569; c=relaxed/simple;
	bh=6w7HSZGhK45DPIsbkV62+DwVdsnNAXnxSIWtej5+4dM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=doozjCdoJASowe5NOZxykTM1y5++h9doHlABiUrZI9faB3JUVPVkE+EAmc759tKt4D0L0uG17waxjdjBIfQXfoX3k+VKgJbZz74LeGZmoPTqCIvTsPpqvWHdqqCCVRsDdynWADYP5r4rOzynybyixUkVuy7rOx59sTV7kGPVPBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdQKv05Y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdQKv05Y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so125142f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750752566; x=1751357366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4LRbvi/Gmtszalnm+pLeOpEJNzEX6Ie3DE8xLsBDqw=;
        b=DdQKv05YDDnu4nkJLqZzg1kOqSlPdz2OmDXD2vZTMOTtqa+kBsw99nPhph5byrlNdN
         7uqTR+3inBLkbkblXAzLnXyuWQkf3S0G+Zx8P0wT9algEBUAIPTIun+CFEF5Mj1jyZGD
         FXANAoZ5yz0l7M6+yvkuokWmoRxzUKGvKyrOc93HQMt+3D3MId4iFiQ1dqGNgks3qKZV
         xZTNRKxsoLeew2LaX6iEysywM7jONQu8IzGny5EO2evnquJWD3dUP6IDY0ySq69cjVoa
         BqcMDBpxRCgu3axd23gFygDiHhHLEGuDcE84kNpMJfjkEA7+gZiKJpoCN3sFWurpYf/f
         0Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750752566; x=1751357366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H4LRbvi/Gmtszalnm+pLeOpEJNzEX6Ie3DE8xLsBDqw=;
        b=Ufw/CBv9Raci2TAyIwjcelBpk7FhmOel/IaxHKLGV7rJJtjmzxjXTL+0JBrb2ku0sz
         tuCrmYxlVsaj/YuH+yFdshVTJIQgqp/lTqp/QUB8Q3f40Nb2xmyAbIiwDO0lUuJwbCYe
         0lRBphf3kxZBDaM4C+Gu7OobuHbA9LGqccGBgeEfL5BeQSm6bNV6towflSqILF8Qr8c9
         niHIAI+Nnuu86/OPpQEEiERH3RBV4ujACrYOkKyo3bGjD7fExxXtux3YV8/EShCg79Hn
         GySPaQ4Sda9gzl3FbWOYpfZcwgITYH7q1BmGzGz81hkozbpw5zwbxYddbxcmjMTgkeqW
         cbtQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Nyrae/2QZWzn7fJruTpRRy+qCUy6xO2n1Wqccag/5dCp8RugnkvPlUpOt+xO6fiAvzBRbGMHmcmjk/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP0ds3fM8qVpQWtuhzGhBLPdtI0v9u7uWN3IzBUjPZhr/KEB/X
	kvdhrC/dB/MRY6rYKZLS644CVyW4C2UzDcfG2HUOONYrpqrJ0Z+2Lxzx
X-Gm-Gg: ASbGncuRtqckhdWZ2vQs9kMwqs5kYsCk/4CAqVgegMpt3DdjJeG4PFb7BzlG+JlckL/
	ygCGxI/t+GF7lSREvlLgmxGFgwdIrFN9jOImgpdxAbY78oOXsRuJHcXKKcBCoD7fUuhwH7FHPFj
	BI/GSr+UQURLGoWTurPdtgG9s6Z+zNExJ4V4fUzBYWV9pGicezekzWXfjJwN9vBS27RmAMz5Bih
	/tMSnBX4a6dlI78scK+3HRswPLO9zytv3ekrJhsAqLs9fNTwHl6mA1lcTgCbWllCGJq3uW4pzfF
	JFwPvO7KWF3K8ZCHvSB71+YDYNUd0mlsOkZXwvZELdrzVuhZNMlevI8AFuxzwaQ8d10leaYD7A9
	RfpfopSi6ck//rl8r38kChYFB
X-Google-Smtp-Source: AGHT+IF8IKQNChSNIe1UoqKF0QyQ1YvhqMwCfYdXLtHOm+kn8HxQSARG/apae1/sAFWf4Eg7sjiYsw==
X-Received: by 2002:a05:6000:4313:b0:3a5:8977:e10f with SMTP id ffacd0b85a97d-3a6d12fc169mr13401694f8f.28.1750752566421;
        Tue, 24 Jun 2025 01:09:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45364703701sm134824385e9.27.2025.06.24.01.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 01:09:25 -0700 (PDT)
Date: Tue, 24 Jun 2025 09:09:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: rkrcmar@ventanamicro.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra
 <atishp@rivosinc.com>, ajones@ventanamicro.com, cleger@rivosinc.com,
 apatel@ventanamicro.com, thomas.weissschuh@linutronix.de
Subject: Re: [PATCH v2 0/2] RISC-V: turn sbi_ecall into a variadic macro
Message-ID: <20250624090923.5521a0f2@pumpkin>
In-Reply-To: <mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
References: <20250619190315.2603194-1-rkrcmar@ventanamicro.com>
	<mhng-C1133FA3-71C3-4ECC-B3BF-13DC7640464D@palmerdabbelt-mac>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 15:53:58 -0700 (PDT)
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> On Thu, 19 Jun 2025 12:03:12 PDT (-0700), rkrcmar@ventanamicro.com wrote:
> > v2 has a completely rewritten [1/2], and fixes some missed trailing
> > zeroes in [2/2].  The fixes in [2/2] are important for v2, because
> > sbi_ecall doesn't fill the registers with zeroes anymore.  
> 
> The SBI spec says "Registers that are not defined in the SBI function 
> call are not reserved." and I'm not really sure what to make of that.  
> Specifically: does that mean implementations are allowed to ascribe 
> custom meaning to those parameters and might start doing stuff if 
> they're not set to zero?

Or does it mean they aren't guaranteed to be preserved?

	David
