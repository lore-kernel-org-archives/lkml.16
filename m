Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8ED218C31
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746578044; cv=none; b=c9uAwQ96T3xmEgEOnftL8+5CegE1nemjV5561GJDcFD5cyz5IespzEgUjdneJklsQoQypwP2Q7qzCKNQDnLdVsUaEtphe3cgmPN2+I2MNvzoUMyd2ukSPMqs4Vhvd0Bi9ZxW3nVwzePF/4gUTt5WPjZHP7c3JiFNqzMu6I79UYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746578044; c=relaxed/simple;
	bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oeo6WdWgYnzpo45SVmbLlYTWbp+1OrlWGoxRj5l82mJBrJ26+/ys4bw7yUqtjReGWTPeMc5M7e177x6Xm6skkrTsbiaw5r7rQBBnEY5SSdl/OUoSe9L9A4PA+WG9s7H7CXA97mCso1XRGemkce0PfXRhCTXIE0ZXl8ruaHxLbCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kSKERhjT; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kSKERhjT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e45088d6eso19176055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 17:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746578042; x=1747182842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
        b=kSKERhjTb40FhesK3LHEgSX/XbgOFttomOzDBuk12Hn6AZ2/irEAIBct1gTc00g1qG
         V0898JQ6yDNdFKUMon1xM6Nutrnev4/fM9hpkrWfS1O/OB9pn2QjOAUIj+uyOlkInWbK
         69iNT0AVggJMvdaOhnR1k7kzJgMoqiGr+/OiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746578042; x=1747182842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdPNOq0pjB3xZhqMYIrpIyO5gfG9RcmV+YpxEba+ohY=;
        b=WkFE7cNM1xp3BqAoNJAJuHB5XWlAYQMQsipba/kEFIGTuECLTS9LcNqO56NWtPlnba
         +ULMmHnA7zL8HOLG5Pd7j3MDQZ3kIejqzEWgT/DtZ60Ne1fcsfA/DdJQaXpIZjJmrcvs
         q0NOHkEUlheJFnmbCyHQ2lgLGUziLN9aZ03yrx771HWrbdaadn4vbaLqk7sOLBcBaKLN
         XajdpfXO58IG5rTl5PQ775jbUHLioS7n3JgyPeRzlBfHOfXY6UFHHVVh49ArCAu8q84N
         Y76LF7jittk83rtZJz3k+ZtUzc2aYFxkOpcyUbhTGSzY830Rbjme/usSpuHbahCFV3Hn
         +E1g==
X-Forwarded-Encrypted: i=1; AJvYcCVGg69Xqn6oycq0IVHn8sGAq29f3iu5nbjaJYZ4VZQdgEgJeunmvuQW2oyZGcQCFjpLuPfKp9nkH77oeiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvF8jcbAoZhsw4rL+Db9IM3XN1DGKksiyvGHAbFA3xr9je1c6v
	5aIUsXnVNWU8mnbvJiqg65osu5mQ6JlZ9kqnP1HvtPY9dXzsRoY436rPgSFPUQGMvn3ccQJ09oK
	XrQ==
X-Gm-Gg: ASbGncsUy/MzdSiN2Os7cKsOq1K4pbYdflvjWgFWLgi5QDaMYDDLRWuzvJ3v5C+dK8J
	f6X4a73kF/hLS8sAppQL//EQaUO78awSBN8r4WwdFd1Wsbk7GQ6Jqq/Q68mm6wd7I+Vm8m/LMne
	dESD7KglJNPft29Idg+ofrt+SFOY4nlWpjL8cTNBo3nb707dimp6gYioBa/rR7R61PENTD2Rp2e
	ElOlyMqiZu/lfd5RtvLKFWp+tlq81jEQlFqF+52BILM2EcxAkq+BdupaZcLbL0qrDih2WAwc1e6
	Z2fBt0kmcfkaNReQgGyFoTwig6heCiAAR8wWptCf6QQ=
X-Google-Smtp-Source: AGHT+IEm3hL38ThjzaykrymnEF7K2NaQu8yqxFHrqArTRPBah7mE6MXKbahuZoQJeZDMqvThzSeSIQ==
X-Received: by 2002:a17:902:cf11:b0:224:7a4:b2a with SMTP id d9443c01a7336-22e5ea42257mr19436395ad.11.1746578041903;
        Tue, 06 May 2025 17:34:01 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:761:97e0:917d:ad1e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5bedb84asm6854505ad.88.2025.05.06.17.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 17:34:01 -0700 (PDT)
Date: Wed, 7 May 2025 09:33:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Misbah Anjum N <misanjum@linux.ibm.com>
Cc: Ritesh Harjani <riteshh@linux.ibm.com>, senozhatsky@chromium.org, 
	yosry.ahmed@linux.dev, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	christophe.leroy@csgroup.eu, naveen@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
Message-ID: <6r6hex7p53bsbaje4u7so7tfsz6jemazerzujzraibiah7eq4b@m5vgjaff2cdz>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
 <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3374b7cf6a68364c389a260d7ec9067f@linux.ibm.com>

Hi,

On (25/05/06 11:09), Misbah Anjum N wrote:
> I am facing this issue even with the latest kernel: 6.15.0-rc4-g5721cf0b9352
> The suspecting commit is: 44f76413496ec343da0d8292ceecdcabe3e6ec16. The
> commit introduces zs_obj_write() function.
> Link: https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

Can you try the following fix
https://lore.kernel.org/linux-mm/20250504110650.2783619-1-senozhatsky@chromium.org
