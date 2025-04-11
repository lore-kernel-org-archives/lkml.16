Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E1B208A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372958; cv=none; b=jl+qh62+kvvD3+KU2aFltDC6OpJwy0wqN0Y7cGGJKSbwG00qKtqN1V/uFHcTg5H3ys/OY38apDwGPA1dEamE9gCFdG6PYuFmeSlMOA3J3+U45sIEPOAyhVFFMOURT8e8CEuFIk6/zZLYswPXChtnnngJT+wLqmNWuC38CcBqT5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372958; c=relaxed/simple;
	bh=GTjbhTQPyiG7xqaQ8UvxUgMzU1fT+plNfKHQKxJGeGA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jnvpQaqWPUuxkFiRnLtN5jOhES+B/EHmQYS87ClgR7UesAHzb06lH5sFCOg+K42c2RW5meTUNPxBudHCUUg7zlK4Pwho4HwK6y8sWAAN/Iu39Eao1uZDCi+StcA/CB88fk0t/D4eJ7S03o8l/6s+ecp2kDYh8RQ1c+k6NQ3vHcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=UrRru4YP; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="UrRru4YP"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b116321aso2223982e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744372954; x=1744977754; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GTjbhTQPyiG7xqaQ8UvxUgMzU1fT+plNfKHQKxJGeGA=;
        b=UrRru4YPlzshDiLyrWm880rKssAO7ysYexclrH8GjvZi2XwticNMFI+kbonmE0viEo
         /490V23DMTPL0YVjQgLfIWnu9jDmy2FZudBxm9jDky2qbxDxxCzCI/wCR0seVOulGX1u
         R8PIYc6afUnNieN8fpnE969N1uREL+T2gNPx7nCcFFhevoz3j6X/DWKkCWyeFedvyp+7
         IzcVSoNM6YWA8153W3lCX6cBxbiCryNE8DMn4IKA3YGasL+rVQ/qQlv2WrskULcM+nlL
         ExwHXUppyIIE8oVKx3d67K6KYRSxzVdj1lFAsYTbzsDfguEl70Bqbqjht9i4UK+MPOqC
         +aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744372954; x=1744977754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTjbhTQPyiG7xqaQ8UvxUgMzU1fT+plNfKHQKxJGeGA=;
        b=crq/xwYA+TGPT5egJakTuzRfNOueVm0+4UMQLKhf/qIvv81MlAcD1JQVd32HpHbIsp
         1jySy7jFyrI022D8MBMkEOQuTf2j5800QPNtjK01BCydii59SElvrnmucYh7N3f2+qlQ
         8IKITIRm3czIBQrdn2EL/XyLpL994VNGJ1EuB3gZtMrbXyKQ9JVMkUzAWcddMRIi5jjv
         5wHBD4MVLzexmqKQbRIcPZsOnU293qqckwmF9xF90Fu/ID9oH0hPcMGPUXkARYKZIhQr
         7janXDCnq8fur77gOCmkxOVOmn/i2k/eix6SE4Zyk0TOZb0lE6P41LOUtRKp2s/7KRRJ
         BsjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMUijkDYGNtWXKTGISgfnAwl79YHzkpT/U6PXl9JJqbke5cIuO0C8OKQ7+x+6NvS4q4gHM1wwm9Z9BtCg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/edGntjqxtppuhEjOpj1EyRMJvDss1SCR/qGODEqPzrLy6uU0
	vmcDW60VfLg+AjDnkhSE9iFNqnRMxP5ZzjIiMX3zPv7yVE6rLRe1B5ryvthdKaI=
X-Gm-Gg: ASbGncv4JI79rITeS2SpHMU+IQ6GtOGDL4YumWh4x68RK2Hp5RJVjeNxlCOrCbHFDZz
	3xecbIHJxKCRoec97cb0UP67NWDqV9LEIW/rNmP/s2vLqL36b9V7oXeBZw7qt4+ZZlafpbhYqZf
	kfKpEer7+5aUa5slAQLOTrDEG526qPPqe3zNBkzsFQObXoDztop/5XvoBW9fRw38dIMuJmpxKlD
	MXjuK7TG6iJDjHmmmt16123OrY1dESb3JKdg5RdNuPTixXeIka1Qw0wiI32WOySc6we1atrXEE7
	8rTmlumCDq1eQguOt6CXSvxlcld/7mmKMQy3ZDL8eSyankRa757iIHeLlOaFNlfFt/uLboGLpKt
	tnYvsqcKJPmUBYZuN8WQ0yNA=
X-Google-Smtp-Source: AGHT+IGfFmPQWZYnO10E+LYxQvnTjU0ALMUCd5lFZj8/A33H6zh0WNsaVqCNcFxy/TNaTN0/VfoLsw==
X-Received: by 2002:a05:6512:138e:b0:545:2871:7cd5 with SMTP id 2adb3069b0e04-54d45292cb9mr784659e87.15.1744372953520;
        Fri, 11 Apr 2025 05:02:33 -0700 (PDT)
Received: from h-2001-9b1-c3c7-e600-116c-cc53-dd4f-4ae1.na.bahnhof.se ([2001:9b1:c3c7:e600:116c:cc53:dd4f:4ae1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238d80sm414653e87.71.2025.04.11.05.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:02:32 -0700 (PDT)
Message-ID: <47286334f978e1a9e19efa6fd3af3d06de863080.camel@rivosinc.com>
Subject: Re: [PATCH v4 12/12] riscv: Documentation: add a description about
 dynamic ftrace
From: Robbin Ehn <rehn@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>, linux-riscv@lists.infradead.org, 
	alexghiti@rivosinc.com, palmer@dabbelt.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Alexandre Ghiti
	 <alex@ghiti.fr>, bjorn@rivosinc.com, puranjay12@gmail.com, 
	paul.walmsley@sifive.com, greentime.hu@sifive.com, nick.hu@sifive.com, 
	nylon.chen@sifive.com, eric.lin@sifive.com, vicent.chen@sifive.com, 
	zong.li@sifive.com, yongxuan.wang@sifive.com, samuel.holland@sifive.com, 
	olivia.chu@sifive.com, c2232430@gmail.com
Date: Fri, 11 Apr 2025 14:02:30 +0200
In-Reply-To: <20250407180838.42877-12-andybnac@gmail.com>
References: <20250407180838.42877-1-andybnac@gmail.com>
	 <20250407180838.42877-12-andybnac@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi, thanks,

s/atmoic/atomic

On Tue, 2025-04-08 at 02:08 +0800, Andy Chiu wrote:
> +without a race condition. This series makes atmoic code patching possibl=
e in
...
> +setting the first instruction to AUIPC, and the second to NOP. Now, atmo=
ic

/Robbin

> +patching is possible because the kernel only has to update one instructi=
on.
> +According to Ziccif, as long as an instruction is naturally aligned, the=
 ISA
> +guarantee an=C2=A0 atomic update.
> +
> +By fixing down the first instruction, AUIPC, the range of the ftrace
> trampoline
> +is limited to +-2K from the predetermined target, ftrace_caller, due to =
the
> lack
> +of immediate encoding space in RISC-V. To address the issue, we introduc=
e
> +CALL_OPS, where an 8B naturally align metadata is added in front of each
> +pacthable function. The metadata is resolved at the first trampoline, th=
en
> the
> +execution can be derect to another custom trampoline.
> +
> +CMODX in the User Space
> +---------------------
> +
> +Though fence.i is an unprivileged instruction, the default Linux ABI
> prohibits
> +the use of fence.i in userspace applications. At any point the scheduler=
 may
> +migrate a task onto a new hart. If migration occurs after the userspace
> +synchronized the icache and instruction storage with fence.i, the icache=
 on
> the
> +new hart will no longer be clean. This is due to the behavior of fence.i=
 only
> +affecting the hart that it is called on. Thus, the hart that the task ha=
s
> been
> +migrated to may not have synchronized instruction storage and icache.
> =C2=A0
> =C2=A0There are two ways to solve this problem: use the riscv_flush_icach=
e()
> syscall,
> =C2=A0or use the ``PR_RISCV_SET_ICACHE_FLUSH_CTX`` prctl() and emit fence=
.i in
