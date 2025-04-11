Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BA21EE7D3
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403377; cv=none; b=oKrzEOZC7d3D6eywU6vxsiYTlkB9zV/PGJET/jKGehxvgqY5WzV71RNgS3cXH+DxfXaKml2cEbILsVh2mhpUFZT5+2ZH2Gdhlhj9l/B9clpxoSh/J6BWXCSzqmMvEMBKzsEpmY7pWLwA99iICZwCABWRrgXXZmn8RpyJy4WKXzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403377; c=relaxed/simple;
	bh=G2upKdynmt1RjnHyNCDv/lSNPDpDWCongvD075BmuaE=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Kb0xVhapuiTmcTe5LeZ/DbDZkREUIIROuY10KXYlHfbful7Wpm1felbCKXqtvunyDtb5YAJCmUCMaGr3EE5ZP+2QFJsD3E+Hh1fcdyXTDllR2/hLPFsMDIsSt3P1QYaOiy8E0NNbOLu/1HL/1kKGRsVfI4eAJGTqOyeOvJhWrfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BEwZzqKt; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="BEwZzqKt"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5aecec8f3so371955985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1744403374; x=1745008174; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Si33EQaNiOX83vVGoKq7qCxj0Ykt9ILvVjkrrHoUTd8=;
        b=BEwZzqKtTCCRpPmb8EBcqXZE7UzA21ssZcrMCGaHR7q91HjkVsHNyPxzFgtuJNecN4
         XIf+OyMuJjCj5671MIV4W/VI+Mr/TwXmQ5GgkCuiImGjgGmuMRKHSAqUtv6q5/QmR4EJ
         qA7XB3L3D85CrFfYr5ACp8V0n7aksCTwJEtCWzo7baMjQMgsaqTIl8ET9BZr9uQrNG2A
         6G++uAbuqbFa45eQT4flB7AdXLjGYY5lxS635U0igzPZl2UQ2gWZR7VSA+qB82peocgl
         L5rtQkHJgDXuDav7m4rLcxfa5lpnKlmfg2SA3kWThxAAC3afptgTQC8aDOFZPxH2nxy8
         0Pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403374; x=1745008174;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Si33EQaNiOX83vVGoKq7qCxj0Ykt9ILvVjkrrHoUTd8=;
        b=b3nFwV5yeyeTOJFh5yEqXB2JU7CedPmq44ZOFnLg7ak3kziYcftd/Uleu++Qlyx6qJ
         /9g4EyWXIX+h68bgm33W+VJauSoLNZfXtAEwfjT/plCCCCXWW8FJnBA1q1GEmFSLPJp3
         9U67+sbmOz0Uk4jvSPY1ZuZCvjA+MHL4CHASsbFDDd9Py19jCHw5qb7WNj0bnQOsLml5
         sK9IBG6IJFE1YTHBhgEGAZPYmb8Z/Qv3PjyoTzxvraU/TaP6sZtfTNpivOqPPmh0LOX6
         WUWeZpJ+ZUhgqBd7J/RMhUtqT+ypH2xbx2JtHOU09KlsGHrSbhj0hk/67RSDRdU4bR6+
         /GmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMpef/8jTsNEWnS9/ln5k0IaltK0VA0j20T9ONlZRuaGuuRe5go+OpYnCbzM/tNEBczPkPZ6W2/rTQ3HA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxumE9nGQrbiWDhpbWQSTs0v98gM6kOWXhnG+H11aOUnAn+gk
	wM/wXbdLclepdxsoIh885AZiRdpKaSGpDVYfSK3kE35j+5qBlWvczJtqyhHW6w==
X-Gm-Gg: ASbGncuISN+f7WMNHpqQE+alXhaq/lMN43L1P3BBFakbJ5uLiwMzkWccoKv5fSQSTQp
	JzNjJoBV4+HHD/cZb7E9z6G1vSEUnFyjomJvsm4y/p53LXsEwPlTnBCfUNGi0ZrHDoSFF/p5DBl
	2OS9Xiu+apIi4n9T4qInJdbjd4f05L5Ur6G2n4jENrNyEWHxYEK3e+ODjCgR+G9UhlQ31awNuEt
	TXT8+d3p9dU2CZqaDJ49ylo62JnuYQe3qQukoeUmoylf4e/o5FXOpoLezmfBDHqvBto74fzpudc
	+N6J46P62oWhD+xskxDD5xM2KOxNC8RhYV5egQRjgwFIx9Aitu0vwlB/xml7mHf0VzkfXfGS0L5
	U2sDpsYmgExXRmcm5NGH1
X-Google-Smtp-Source: AGHT+IGX8jjaOEeQbsS4xcs3SmPRbhfdrNv00id6cLRqMi8NgNQGE8aExoTjJ+O834zObzXAxutypg==
X-Received: by 2002:a05:620a:4555:b0:7c3:d5a4:3df3 with SMTP id af79cd13be357-7c7af0e4069mr643280685a.34.1744403374553;
        Fri, 11 Apr 2025 13:29:34 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8951f5esm311259085a.48.2025.04.11.13.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:29:34 -0700 (PDT)
Date: Fri, 11 Apr 2025 16:29:33 -0400
Message-ID: <937e51d0b9babb8edd206c7f4eee230e@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250411_1406/pstg-lib:20250411_1552/pstg-pwork:20250411_1406
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Casey Schaufler <casey@schaufler-ca.com>, Canfeng Guo <guocanfeng@uniontech.com>, GUO Zihua <guozihua@huawei.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/6] selinux: constify network address pointer
References: <20250318083422.21489-6-cgoettsche@seltendoof.de>
In-Reply-To: <20250318083422.21489-6-cgoettsche@seltendoof.de>

On Mar 18, 2025 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> The network address, either an IPv4 or IPv6 one, is not modified.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/include/netnode.h  | 2 +-
>  security/selinux/include/security.h | 2 +-
>  security/selinux/netnode.c          | 8 ++++----
>  security/selinux/ss/services.c      | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)

Merged into selinux/dev, thanks.

--
paul-moore.com
