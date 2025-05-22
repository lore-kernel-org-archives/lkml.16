Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3360427057B
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952770; cv=none; b=l9wmcuyWmKy7IVu7e2nvo+oIlHs5MJttwfC0o8GMkrJbmBI3CI/tkNy5Qb6LqxqRqEMstwyFrdx0hjv1dLwFLU4+cbpiUAie07K+gUBp0mkZuSTJOS9mi9f6DNmSZ3Y6Jl3oGK5T9/1IJl1s/pW1gOLtXLQYinf0M0AExOLQSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952770; c=relaxed/simple;
	bh=yXfmq+fsOH2ydhYAaJ/O8G8cyrnfKS0KGUVUMAH0MGk=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=GGEObtp1GL29GsQJNUiuOvG9/L/eVy51e88tZGO3ZY6Ppr341ELKYmG8I+Mhdr/mj1DBA6oXHvkHGgHqZk84SxylOkqoVdfu7tmP5rk/ymVzFk75sNYHwDMu0eDzjCC43Fpb6WAtpaagv3vzYcpmDLpY07UUpg07L/pAO1a2zVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=PE8bp2bC; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="PE8bp2bC"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6f8ce89468cso55845076d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747952767; x=1748557567; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=PE8bp2bC2u+7hVMWFXDxIhgHhKxulbXWcGxnUpIhrgzangQno0wz8wTj2SBpQlx+RH
         HWbPzJONY/k5V5KhKxFzRg0mqcSuevNUob7nbBRkNe4zNv5ta0ZZRbKuMkupvRu1j4H/
         L5g61hkwn3G2TrJtCWpQppB/pCl9f/CPqdvv0wvc5m0YvonN/44WK2eHjcRrBNO9b+Bz
         rMI5Soc4po1JoBDybn3lJlA6EaENodtYQjDPfzlCn/d0jltsqZogc7KaymbExTqk6b2E
         5S0ojIzkilaxs5NcdiEorb9gq51ZYUhzmmerYI6Csq70Rwqskc1RTDHHPC4a/b2ToWTE
         +pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952767; x=1748557567;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jmptf5RMBQqSn8lkxlWoyMCjmS+Mv7H8iKTTl/Kwouo=;
        b=iWh5mmKnQTiaGaFAFBZxSaGmqtfGwWuClO1Fd0DAADZCRKZShkCWui8pBVOjlcylgh
         s8/Z3qCVZdqAuHisOamijKLldlpRa02Jq/P1PR2gfuKhotztomQ32ve2LwDYhmLOKAOv
         I9Sf618CiPJvg+fVKDtXKN6qED0HS/7Xpdb4TABEianaA7d1Axuhm4L80ZYWDRYeUUgG
         +e8lEcELg+yUeRakZs+7HPtmFDcvxw4mYzhCiSTPZgc60xU6klA3sbnI6gpP7y7wc4j0
         ycSYINKcZ2im5EHn3X94uCDTl3oAelS1Tzj5Pc4e+IqN3WbB6rfXTDaL1koFFoDAl3uJ
         /9sg==
X-Forwarded-Encrypted: i=1; AJvYcCVGzKeKrL3WuNofqrYnlzxLsbMz1DmH/yFP5TJqy7H+9kInU89F8yw485nWk30jbYUJrpMdx2b1KTEy6Kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeGNNTUMd1S88VMAOVLVsCcm8LGuJvqU9mlNCai+Pgp/QcbWNv
	njAPFPy81SBKgcdF0IP0W1/9rnaQ800epAx/3mL52GA/MxUHekzTgV1OECWTvyJUbg==
X-Gm-Gg: ASbGncvwmvd55Ufl6sU/AkIJtdKVvIsosS+XVV1Tm7vTx135fR0Wt6JUJYAmGNKwrE7
	c74XIVFwsHiD8RIy/5TUXn+cY5QYuK/WZoeHVLtEG8EYFNfaxUMDjcAr4NZ8bsA1R6B3IV/834s
	IBoxpcFiziyhz5T3xld6h7RbyYQLUPoCs/qiOupXGlRD/Af4/F82hYqGK+ukfBMvE9lvXxhXgWY
	61BBsNbAL7xfd2IC5J3m5FPq7ICDxmha2HtnjCOY3y6DTMtYnNJPmlMcZuZVpTKym2RJdVJBZqr
	leehIS4ErToazYZG3FCzCFw5/FrJdWXhDNNpgzseUX5OFz5wNzcc/c/yMC9OgEjwnGVbQSqtq2k
	xi+nEe7flOxVsnjxT8CtE
X-Google-Smtp-Source: AGHT+IE2zN7SH+0SaGrs2tzepSFkLMKNXBgIbbn8M9DQcRbDJBs1dDzlx85ZuSxbIPErdUE31K4qXg==
X-Received: by 2002:a05:6214:1947:b0:6f2:b094:430e with SMTP id 6a1803df08f44-6f8b0829131mr503375636d6.25.1747952766984;
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f8b0987259sm105076766d6.120.2025.05.22.15.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 15:26:06 -0700 (PDT)
Date: Thu, 22 May 2025 18:26:05 -0400
Message-ID: <0bb73a49ccbc93e90ea87c0dbb4097ae@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250522_1740/pstg-lib:20250522_1730/pstg-pwork:20250522_1740
From: Paul Moore <paul@paul-moore.com>
To: Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Amir Goldstein <amir73il@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, linux-arch@vger.kernel.org, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 2/7] lsm: introduce new hooks for setting/getting inode  fsxattr
References: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>
In-Reply-To: <20250513-xattrat-syscall-v5-2-22bb9c6c767f@kernel.org>

On May 13, 2025 Andrey Albershteyn <aalbersh@redhat.com> wrote:
> 
> Introduce new hooks for setting and getting filesystem extended
> attributes on inode (FS_IOC_FSGETXATTR).
> 
> Cc: selinux@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> 
> Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> ---
>  fs/file_attr.c                | 19 ++++++++++++++++---
>  include/linux/lsm_hook_defs.h |  2 ++
>  include/linux/security.h      | 16 ++++++++++++++++
>  security/security.c           | 30 ++++++++++++++++++++++++++++++
>  4 files changed, 64 insertions(+), 3 deletions(-)

The only thing that gives me a slight pause is that on a set operation
we are going to hit both the get and set LSM hooks, but since the code
does call into the getter on a set operation this is arguably the right
thing.

Acked-by: Paul Moore <paul@paul-moore.com>

--
paul-moore.com
