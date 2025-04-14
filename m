Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE3827587E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641133; cv=none; b=lO9a9JXuV7xgwkDJekcfha4bIEkymTzQ6cV3o0m3p04zgiSPWhXV0OeZO7P0P9rAAQPcbJv/AJsIky/kLiYwU017m1iL89JO1HYsWwR3IlcMeneP+nNIzk463Apx7qy8nJikdntoBzlFMpkNy8Zvs5DVSQM4A5QooCYl1P/7uLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641133; c=relaxed/simple;
	bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XEm9Qes8EpoyYAMs4IIhpBnoYwPt4AwR8QL4/RprBclUhd6Flphm1SstEJWMKiCK/wQu1eHuUg33iD/Lr0nYECBNSdpz0I/Q3HidTeyzPVi8QYidiXguzJvIhsZBOmDZzoPPCZwAxGzX2R72tqHO2kESlJRLsQx6R0oFXNfL1YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l181PuiL; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l181PuiL"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso8267505a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641130; x=1745245930; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
        b=l181PuiLnD5gbUWl50xgG8XAkYQjSe4d+g5arp/t5k4PC55svZd42MUK74PTzbpGUJ
         KtTSEWkqWqg0v0mJZRPoKc3+o5n+VFXXyVrdY9mVgDe6eHx5CD0uLS5p64LiMfoHnKZ8
         vXNPOed3YmeLceV1Cr5zAMAe7ftnRVu5FJU4j2szdE0MNoXtSknPE0fqtPIZhkhr1SJt
         n/OWME5mLR15qKx8a+8p+0qZsNnZupFzC2IVT6kTiPxfXgHjZpIZ3S+aMLfJwqxZTln4
         w0J1yfWqKdMlP9hJZ96PJjlA0ZyIBzoqjSg1vuXuan0YlO2UPBXtjGmpVujk/C14Mr+e
         kbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641130; x=1745245930;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qaPnQFoggjTvbZSrFzdoznbRVbBYn7p2ZNBLBZBMjhk=;
        b=eknzhf1kj/Wsk+OqeaYnk6pWmCC3ausba5v2qPQNQbTOz1Gm1Jnfv8dXX6zOI4/rfh
         zWWcN1CslwnX7heo0DbHj7y5S2Kn3Uul09QzRV6t0A0iSgqKcA10eOg+rv09Mo7aHEdV
         kpBHxPBBcxjl1IRqc0vJE0TC2shdLczJ8jPLzijNRCwMjqXMdzXjfcIJKusg2qlF0EDn
         WYH+sufNC6aZ38H2awiXwCbncITuCIisifkgd+o/NlqRKTB6sZ9dg8S8U2IzOPiTuoC8
         mk2dTJGByjNf115SxonJOC/IT3bJNA6ucUqXrCPmV0OrV1N4BCo6+4pBBs9YkvRNE+VZ
         gocQ==
X-Gm-Message-State: AOJu0Yweh+sFUiy7bT9y5Pvgaa0VbkwsLe1IQBZsfQK0Y4Ly7G2xFI7b
	MYg99YgO95Xeu6pjWmRQ9kbAFYkP60NQ2EdgO69FAURP5qfdcmfSiRxI7vLy2XuHWAWOLQ6rDCX
	Vr/4dScsWGLgqEm2ShGPzWeVNga9Wumws12+zOw==
X-Gm-Gg: ASbGncs1RrOhzbXBknOqcVIKoS6XDMdxtdGljJtjdvlZcZfwtsQgxnyhNvmgUUT8xA1
	blKRVkeJa0+3YY7Dsr02twZ13E9xjAKy84CnzBFPBj2gsDaUZFC1I0/Z2BFAhijnpNIi8VBFLx9
	jrNgzx/K4xrb293pEAyQCCMg==
X-Google-Smtp-Source: AGHT+IFwifLEktr9aApbyUVSW8lz9lOQQfiZXAuDaosCai1wQCjS4QaqENkSe9iSjJgq3a6xKGk9HoI7OY+yLN/dBDA=
X-Received: by 2002:a05:6402:2350:b0:5ed:5fa2:98d9 with SMTP id
 4fb4d7f45d1cf-5f370115dfamr10868064a12.28.1744641129574; Mon, 14 Apr 2025
 07:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: ludloff@gmail.com
From: Christian Ludloff <ludloff@gmail.com>
Date: Mon, 14 Apr 2025 16:31:57 +0200
X-Gm-Features: ATxdqUHgwk6QnA7tWrnbRv2z6G41jj9yv6cmRAuOUO6oR2RE0gElrJrwXP2CyaY
Message-ID: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
Subject: Re: [tip: x86/urgent] x86/cpu: Add CPU model number for Bartlett Lake
 CPUs with Raptor Cove cores
To: linux-kernel@vger.kernel.org
Cc: Pi Xiange <xiange.pi@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Tony Luck <tony.luck@intel.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>, 
	x86-cpuid@lists.linux.dev, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

> +#define INTEL_RAPTORCOVE IFM(6, 0xD7) /* Bartlett Lake */

Please fix this. It has the core and the product reversed. That is, it
should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
the bulk of that file.

And yes, you also want to fix this for INTEL_PANTHERCOVE_X
and /* Diamond Rapids */ entry.

The macros refer to products.
The comments refer to cores.

Consistency, please.
Sanity, please.

--
Christian
