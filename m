Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222645038;
	Tue, 10 Jun 2025 02:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522618; cv=none; b=EE0MRUbLZ1xraTUouLvNNfV37qSbcMSF8CsP0DE15Zsgvgx0jIHGAayE+xmmFqv2cWGc9iGSHtAKy8WKOWiJ8RrudjmDQnoZOIHjunYx8W1xrFlDxAAy2ewxn1KQXJO/y87GRMxPAgoTv7DJ8Izfgan9+Felb3n0awnUFltbVL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522618; c=relaxed/simple;
	bh=v3LESvPLiUPkpigP+R05pYukPxN/Hh3UfMtabIzddaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SI7NUfMYqyw81BBtTbTWNnasGw7CJX4JG13054u39mxRKRy89zOqC4TZaA4dCkeE7qttyJktar8LfADTSWEeHHmuV1RRG4sSKpp5i7DXC4+/x4C5Uu2CIxvHTr31SZFQCONW16NmVCjHwD5RYiAT+S8LjPPFti24ol7/QMHpA7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTYe6FAP; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTYe6FAP"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d09b0a5050so298332885a.3;
        Mon, 09 Jun 2025 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749522616; x=1750127416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=OTYe6FAPOlaQkB9gVsTIX9OCEfCtigtEuv/lnG7+wOwcUvmfqre78rwnitldtaLjOi
         fds/cnm2HY+VmdH7JHrCLgfcDS/ZZrJQ7uJBdhJ5BhQ1OcVOAuMhwk6IiWWaSJrWdchC
         ZqRZu7PpYLz+RaXyDZENkGeHgdzD88XJ8eDIrCiFGhXLQBDL9KvwE+CHpx326bHSrdtw
         XjKa4rofYS9cTEWFH79pAabqAtPCKJ+hkgItieijpcvbe/Z8W5hxYalaUNLf0dLsMdRn
         +ewqh3ZTV3VG0ahH9oljS5TezZbaI8UuksGs1VpOhxwETIQ+aV70kyEWxA4rtk3D5t7N
         /VNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749522616; x=1750127416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SgElAs0y1ZJkhsU5o9mYZFAkDt+b5eZOursoEKVdA8M=;
        b=uq2AJXdBEs81ZRHYYa147kmuNlj9V7XOVUK0LXF8y9AHQGcimxQk2sR3TpUI35kfRb
         lSHkCWGsM+h2MOpIFIoubEpe2F6Qfgi8X6EXpQ4RAGketJBBOTqvDSDOuZCRLirXzzkg
         6oOuU+WhRbCPo9pzc0/wPcawiIwDB5Oc07DK7hodwZ/+83dUAqzAMcdy8xIOy0onwmoH
         /FteM9GyyoJSneg6VVUStU7jsGhvCRJTjTRYNP/IDivTa9h8cga3MsHgB2nNhdoyZZTX
         yeViRcburzl7tMzUOZ9JLREq/3EGGQg+JjOOVEUkv9yu9Z+RlLYq+cmwFFhOeYjR2qOn
         4dxw==
X-Forwarded-Encrypted: i=1; AJvYcCVMLAKkQFkPiKHjdRVhCzlFWEIJp7dJVwAqBPwkKbSuStjsoJnl6bUXdIlaPznnuRum/fYJG75q89+z@vger.kernel.org, AJvYcCXLRMy69Rzc4AtJNEEq/whf/JyaoMiaDVc8GmyK31J6rpxUX+7uBg+Y6hBugN9PJkEYcLjHG9j0nJm4TNyn@vger.kernel.org
X-Gm-Message-State: AOJu0YzJUbrSSRqHDGO2QkezOYJfftHaIVf4mt26E9TZArMJpFbZsz4K
	BYpDYu8/xRcyZfcCJ5jnv2i2et+T50s7U1e61IqUVWEP9mpySiFAGZkz
X-Gm-Gg: ASbGncsXewSYflritXpAiYtFwDnUqOUrn47HQPU9BqGPZtMlIIHf2FbzlTZUU+vE1Uy
	BAUoB3OZDG9B/CfTirH73AZAAD6Z+4yzy++FB+iiJC1dcKSWuaP56m3Jt/a4SxkVpjJJRRY23Yn
	yVMvpgnJ/xVuvvuTE+T9HMl/cQgmMJNgjPs4bjzqgwMXo7TJYNYmbFqGcPpD/C6uYSjZ2S8ZNRp
	eIVtaczlmDp3vq1wbvsTv//B061XOTdHO2p5UCRjSWhYfM9dcQjzlKLWDItBoiHrLYgSbJo0BIl
	K/iEe9roo6n8CAdDVX1NOCexAfUjZLMYTynl5g==
X-Google-Smtp-Source: AGHT+IHGAP6xmALkZKuYBUNxKptzmmUckUcUQvkX0yXZ+9n+f0ZjvsKWM3DmWJRkyqr7YpGIbcY5lw==
X-Received: by 2002:a05:620a:1d06:b0:7d3:99db:c4c with SMTP id af79cd13be357-7d399db0c51mr593864685a.6.1749522615969;
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d2517fa678sm626750385a.22.2025.06.09.19.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 19:30:15 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:29:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <orrz4ibchqfiqbbhyxbvlt4ejtu2roankisfy7gfuza2b4phgl@5mbjjnmcm2si>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
 <174952038849.949885.15347540485983948845.b4-ty@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174952038849.949885.15347540485983948845.b4-ty@gmail.com>

On Tue, Jun 10, 2025 at 09:53:12AM +0800, Inochi Amaoto wrote:
> On Tue, 13 May 2025 22:31:25 +0200, Alexander Sverdlin wrote:
> > Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> > is quite advanced and provides SoC power management functions as well.
> > 
> > The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> > and an associated SRAM. The corresponding control registers are mapped into
> > RTCSYS address space as well.
> > 
> > [...]
> 
> Applied to fixes, thanks!
> 
> [1/1] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
>       (no commit info)
> 
> Thanks,
> Inochi
> 

Should be for-next branch, I execute in a wrong branch....
The url should be
https://github.com/sophgo/linux/commit/3a8cef361be50c59013cdb2d804c12476c76e848

Regards,
Inochi
