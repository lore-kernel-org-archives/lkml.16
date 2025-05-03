Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731CA1A8401
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 10:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746269505; cv=none; b=sG2kzvacCrjRNGvoRIMBd5PbHVdaz4xzLNzvgUtFLhPmyDzlLVLbE2VLlFOC2yTnhw75HTGUgznvYmGNyilBg3FUVJ+IzK5A8DBM8KRM/3OpUkATEbChh+Nxqi9j9F9QO1YMa+nO2yTB3OS205FwFhSZPA+DVJ+yinIbdqSIz+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746269505; c=relaxed/simple;
	bh=dSucHwVtqOFmPoMKpg5Bd4dRqgxmOyXDuUiIVO7MFl8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SSNfNGvXYfOaPG3MH/hhwASqBD8UbtLmLwh7jHmNrWanq55kO1kn7ze4tAn/0f1iafXX9y332v1127ax7Qbo7WAOGJWTtrJxO8zdzjutdAC1aOMVeFlDqFeUSGneFSqAjdShrG9hfOUPdb4Y5WBvca0tFkKfiArfQcjxoaHogrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuDhl037; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuDhl037"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1894812f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 03:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746269500; x=1746874300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKmm5TvrPg9oQ1URCXS5LBX8P812WGgG3aH+bVrAxB8=;
        b=DuDhl037pufB7Yn2LoecGZTfMBEzj1RCwQco/Cy5mo9ad+KJ+fT19K3WtExfW8HY6w
         rBfXKB89RFl42KfSWIOe7pIW/yo3Al4zuyoIuZXJ8JyeyBs14sq6gmrdpdkpLSRnqqMx
         aMg4MXJmVnLrh01llHPL8kvgmLvWbznlgX6s33aUc+gtsZxgDdEXJCU8/Sz6TgFP8JLA
         HYXzT/Pc8v5XuDHeAV20txi7Wx1GF+X3fvfs8BKXkW4SbXS4G+fJaoXi3rjJ9tIF5mcm
         90jVkQNPPogxrCCYKEIKaL/DdAWNhqHjOMJYn5DJQ7ZLCpAIwMtkJsrb4fixAi5UOBpN
         jZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746269500; x=1746874300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKmm5TvrPg9oQ1URCXS5LBX8P812WGgG3aH+bVrAxB8=;
        b=f1yd/gzmDsQ+OlD/taFvmMGWTXkcAkhpWS8UGrZvoTAoZoKMALCjQeGmQ84AzimOqz
         4myt4KKzl85UENbXWwKACCO3UDsXMCEcdzaXyKOYROY5dUs6RT6piTZqWMPlKAjSUw1L
         Xgjs5mNNrjU8XpdDLcPQnZz01U6fkKj1kiX7PVh0FyBxpULvfoNZHMDDBJ4aghsKG/R8
         llbsyvseGJvfmXpeU4YAQfGedjYGX0me9QU60RA4WfYwUnUB7Xbg9GIFGaXUj5zGPAKw
         tImCxtbAFATA8KAbWEzS36El3NbRcbdBGZ/Ny0xAKdkrx4vhri5VGporgXr31Oi40r3N
         QGYg==
X-Forwarded-Encrypted: i=1; AJvYcCVqsqwg6FnpOaM2mG0brg0WL5OwdnPvbbwgYs6gx2XV/jcmRTFOvWo/oM+H/Gi8ChDboDqlVaBm0srM1V0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzayzt5Sx+YpES4vJsxCYpCbv5ua1T5QIRI/VAsbtC731/CbIbt
	tV3H+9ieS9lX/Y7O5UK0rWKCv6D42/q8EJsIo0eO4duK7uSA5dNL
X-Gm-Gg: ASbGncufamreeTiuelMqGOn26AzIKjOsqy+gFN40Yu63EE6frd/fs+JDGINv+oXKfKM
	Lf1MEJh/pLVLOm2UJnlzzdNX0Rqf9qOhESUIgK9mLwIq4tBAlPvBTdq8DumgT0J1AFBCsC5F0CS
	hnFY6tVLNaZLog/5lFqfKz6X/UC0Blyibpddrr7Jtp8190ytgkNJrXIDtAKQd09LTzrQ2amX7kP
	0TEkutVzXMqPqSLd7r4FOTDc5pOIsLvY252efgma33nraQ2NdmlJFV8QQNUKpYICDqp8vB/zqE8
	B1FzExy6rfg7ThWy1w44Lt6WFzE8cuI8705c1QQBh4h65O4bsC70kksiVP/2mIWrbjgDJt6wYE+
	hXaOn2JqArMubdQ==
X-Google-Smtp-Source: AGHT+IGpvbqKFgXd6ruS4Gr8hR4TzxizfJhYh/jSoL+HlKMpT1QlR7Aji7JVEgjh5nC9pu63SxIg8w==
X-Received: by 2002:a05:6000:4387:b0:390:df75:ddc4 with SMTP id ffacd0b85a97d-3a09fdbc112mr674998f8f.44.1746269499519;
        Sat, 03 May 2025 03:51:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0fe7asm4579200f8f.61.2025.05.03.03.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 03:51:39 -0700 (PDT)
Date: Sat, 3 May 2025 11:51:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Kevin Koster <lkml@ombertech.com>, Oerg866 <oerg866@googlemail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>
Subject: Re: [PATCH -v2] x86/microcode: Consolidate the loader enablement
 checking
Message-ID: <20250503115137.3c113eaf@pumpkin>
In-Reply-To: <20250414112633.GBZ_zw6WlMbXr7q7cM@fat_crate.local>
References: <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
	<20250407095848.7933a358c9f450fe03fb8234@ombertech.com>
	<20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
	<20250408002150.8955343f4e2f2ac31b4663e8@ombertech.com>
	<20250407135533.GDZ_PZVZ-2CKmhbt7d@fat_crate.local>
	<20250408172250.GCZ_VbaqKsshMYTdaE@fat_crate.local>
	<875xjcteq2.ffs@tglx>
	<20250411110741.GCZ_j3_dLFQ5fGhHqw@fat_crate.local>
	<20250414095933.GAZ_zchcLNPpUHF9IN@fat_crate.local>
	<Z_zoG9Dn0u4ngMrj@gmail.com>
	<20250414112633.GBZ_zw6WlMbXr7q7cM@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Apr 2025 13:26:33 +0200
Borislav Petkov <bp@alien8.de> wrote:

...
> An additional thing we could do - and since I'm fan of namespaces - we can
> start supporting a "microcode=" cmdline in parallel and have it do
> 
> 	microcode=disable

You probably want 'loader' in the name as well.

	David
