Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2E8488
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 04:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739246491; cv=none; b=XNtnUbmJ8+U5Cp6bNlf/MOvzYm70cuJXvNbEpVuoYU17Lh/TpY7qB5QJtZoV8lKVB4/mv9zC7UzhlsrDVQ7xtrn6FLoZI+Z/f28NN509OOc2jNw/4geQCUTSFxURPAexQJjByWfGjAUEBbByr4V4oBrK3uBDCvNoFx4fFEydjgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739246491; c=relaxed/simple;
	bh=S+zdcfJtPCvC1BH2Jp8SSo4wCM7YozlYfZJMVZB5jmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BjmL5oKMfknkk/eVUr1UAVn3HwacxGfct7PsK9ACFZ3sI/yeTx9ewWmMZQd38vl1I2YyqoKgMzGpWGLZ182BCnFuBYRJTitxkQGAPjec5Cn1WfezbwmUVRiCckqg7mdFcCrQO0pAel19qHR4PMxarQESoqAwrG2h/I9G8y0nQrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ytMLcodC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ytMLcodC"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f61b01630so51219645ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739246489; x=1739851289; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S+zdcfJtPCvC1BH2Jp8SSo4wCM7YozlYfZJMVZB5jmk=;
        b=ytMLcodChHtPxbDOAPOQYVb7QVcIlKZIi/NhQXa6sfRhI/RntimuhxILSPHX6r3vvx
         V85zgt54xPeElsKhOKQKXbgcYco3GPDqHVBJTPObJEsmI4GgAIlXqf9RTb7A7Hgb4eA3
         DcLylUd7PsL9H/KYc8AAI1g4AOgInDD7FFoF356adXfb3J5EHmLDoYZxSxqSYeenXuq2
         eBEdizs49Yvf7+RGorBZnK0azmsL/3FdlieqEhn5yzV8X+fyxPwkE5fJUVL6UDrktmhc
         HWEoMhsAw7wTCgYMJOUjWn+YS/WYCQgtAGclDQAyy437HGUsIR4y8JoR11u4i76wBL6Z
         FBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739246489; x=1739851289;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S+zdcfJtPCvC1BH2Jp8SSo4wCM7YozlYfZJMVZB5jmk=;
        b=AtEID4tlpPXLnArWcpOGNBe1GHjCy6ODIKhaAhj9L68FxHKhWGBn30YXvdWN18Ha67
         SspvBS5e0m4wnFnrXcd2mgA3pTvTvxTczt+VtEp6ovNp+oaO+aNauPH8nGClLnP8fmsk
         aA7QeDNolpu2MWz/bykcCrYfF/gPrAt3z3O0GLgALKfjg53zJU63RV4tgP+76+IkLC5y
         VnDMlycXix47l5f+8/utAwvvBQhb6nD2xEUfKdv0QFlhhZ3L0H3wAXc/ouPtDXUIlbaX
         xdObtttZ9PkPWYVTK9gok3uAz5haoSnUIy05fJLuk0xAADMllG0jwoLAbbcbv7Zs6DM5
         Ioog==
X-Forwarded-Encrypted: i=1; AJvYcCXkGAykcbljENOm7lT9lxiS9j+N4cAiJryRTnUJStNuNiWKZGXxk70MAz20nkVxUXYeRlciswjgu5sst2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCx4dyvhDwy4p4kIXvMnNn5aCPowZIU5ynpkgGbWERqsnGwINy
	kH+T4Otqid+4Y2/iJIZaDQhiuvuK9a7uiKZDlgG8YKC0NljVZyKFfnOnoQXrFNo=
X-Gm-Gg: ASbGncugHzLLnOBlWhLN8sVLtx3eaow3mjuwKudkBPp8gwJevaPs4438UI32PE9JM2X
	51y6ntD3gc7kyr7CjW4fBSu9UWt/PbAImrTTMiVEurhVcU9WMlMABree4eVMb9qrGsA+hsZJE1L
	lhR0nSWQ9M2Bz8a/kiB7rPxkKbAbME510Z962D/9RKnNPNQVgGrQ5gmZ+S4S2Si6ErsuAeRW+DS
	gSbmv3coU1/zAAp04N8sJkCkRC+Aj7tttSee9DxS5MWbGurQBtBaz1uN2J3ymSDN2PaQ6cmY6bY
	D3jv9IP+aqWgz3DdyJJUFyy5Nw==
X-Google-Smtp-Source: AGHT+IHQ1bwdnVi0Eyewf84joQokKW1zoJC8VDUOsdcQJkNXtQirRClUT8g3wnWg5KqEmtasn/ZbjA==
X-Received: by 2002:a17:902:ce89:b0:21f:6d63:6f4f with SMTP id d9443c01a7336-21fb6bf60c4mr27609325ad.2.1739246488700;
        Mon, 10 Feb 2025 20:01:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368d51ebsm87094655ad.252.2025.02.10.20.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 20:01:28 -0800 (PST)
Date: Mon, 10 Feb 2025 20:01:26 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org
Subject: Re: [PATCH V5 1/3] riscv: mm: Prepare for reusing PTE RSW bit(9)
Message-ID: <Z6rLlkphtv99+bH3@debug.ba.rivosinc.com>
References: <20241113095833.1805746-1-zhangchunyan@iscas.ac.cn>
 <20241113095833.1805746-2-zhangchunyan@iscas.ac.cn>
 <87frl0snf6.fsf@all.your.base.are.belong.to.us>
 <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAfSe-tRFEXiXJ=tHVnXy4Kb6O7-E2Sr_xybLYxma=ypMhqz9w@mail.gmail.com>

On Tue, Feb 11, 2025 at 09:20:22AM +0800, Chunyan Zhang wrote:
>On Thu, 30 Jan 2025 at 16:42, Björn Töpel <bjorn@kernel.org> wrote:
>>
>> Chunyan Zhang <zhangchunyan@iscas.ac.cn> writes:
>>
>> > The PTE bit(9) on RISC-V is reserved for software, it is used by devmap
>> > now which has to be disabled if we want to use bit(9) for other features,
>> > since there's no more free PTE bit on RISC-V now.
>> >
>> > So to make ARCH_HAS_PTE_DEVMAP selectable, this patch uses it as
>> > the build condition of devmap definitions.
>>
>> Heads-up: It seems like Alistair's series [1] that removes the devmap
>> PTE bit will most likely land in 6.15.
>
>Yes, I've been keeping an eye on Alistair's series, intended to update
>this patchset after Alistair's patch that removes the devmap PTE bit
>got merged.

Please keep in mind that even after claiming back devmap PTE SW bit, a compile
time decision to select between uffd-wp and soft-dirty is not desirable.

>
>Thanks,
>Chunyan
>>
>>
>> Björn
>>
>> [1] https://lore.kernel.org/linux-mm/cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com/
>
