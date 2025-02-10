Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20745255E56
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739212203; cv=none; b=rvdFyS73Ggrit86vSeZL9QQWi7xuKiW1kQODondwmvxD58kHYx/Do6haFCMIiLBj0hvqhWDFPRB4HJtY3/XTZRPc08Wob4DDpMYjmuij4JGoVb7TVgktAx8wEeMhPkWQiTIMJsbnftAIyxRsiSY1MmMJFulzllJmNObuULGCQxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739212203; c=relaxed/simple;
	bh=Fs2SI084SUM6x98iGfpAx+q5HqA67z7eJeUEbFVCc7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQCEEDpj8XlzfT+EcJW6rQ3HluBioPEL/8E5kHOWW6Uj7kdPdRTWf4kgfVCfkrZVJ6NML/Ljnp8dnVDf53WRWeY82E0/RxuoOV4GxBd8FeVQqywQ6Bq9u4+zFQBMmEEEtNuG4D1ZRf7j5Ol0JW+H/UJVy8u1ckVcRVfwiAdHrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QgZgkhwv; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QgZgkhwv"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5de636e6937so543a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 10:30:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739212199; x=1739816999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18dP3+LaF2AaadT5me9dYAdXYGeZHxbpqh7E6EUUPkM=;
        b=QgZgkhwv46T11S2YS53wDcXWLpNznbrotHlPAHdwxHecvB0CUXQwIIrGRtyfum32IX
         KinYqezQkv5ezbRctQ8g58TNqGYakcxX7ImwpxhBSxz+JnGTMY7nU2kxIYquh3/oDf5U
         zLRDfmvYF4FhgC2qZ1uxUTj9ewZR0wKcnnVJXHgWJROZYOwWcx2EruCP9/yaJEdvSAyG
         TMcCUz/9CeN2Ia9bK38dmfWD4T3qgWtvvx/wm3adnGsdnDDVb/c1VDPvo6vIXXWGH9bi
         Zj7qiPhCbSp9L3D84BLW9Myw2/fxMOMq9/4qplQXzkharDDZzHlZsHEVcHKBisbl1YtU
         tn7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739212199; x=1739816999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18dP3+LaF2AaadT5me9dYAdXYGeZHxbpqh7E6EUUPkM=;
        b=s5XwNPj/hNm3wubgyIesyDECWv82w/wCWLX7py7tsy0SqSyOw4NEwu/jsk/reYxAcI
         fQHQcmK3/J+lolCGYSGmVA66xoOc/3v3z/cjJgubNC2LxvSpijj0JyNyGce7bj82cVlK
         4fKiXi5fLP0X9781htyo9uGToqTIqqi73VcYLmPC7ReetrhRJO6wuOUwD0hQiW0G9xk0
         IrKVnlS8Ek7rsAMMqZqd47mHj+ScK3reMmCJKT5rV72hRQyM4Y48afLzMxCfXBFfaSPG
         7uTDB+6xKRhkM7Ng4TEBWinRCPOKQQpt/41UrmS+HTZgcCSf1OOEnQ2Yo25iUdZNT5yb
         AyoA==
X-Forwarded-Encrypted: i=1; AJvYcCU7MnW++kTWbjpnVq8NvfT3imq5iQJNoOZnx1N3JVB8tMyNpeEjMpiEqtPw6Op59CAi8DUN/yoFcYJtduA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPpdelDK+qdqbCC3VIFPksw9X0ub79pJliwIC3LlpP1FQWLHrT
	S1M5OCXR1turwrpIrXrW93Ea8lo1bmxy4JEmJ2deKTymXVcbreot8QMm1J96xOjsco7Qs89HF/6
	cyHq1EMvUj1SxTqJ3E/pMkmWRbUrGOlENXeoW
X-Gm-Gg: ASbGncv/Z17DM0bQzGt7onnvNTZ3t6IwnAKhHnPlNF1Z9x3j7nM3QYhleOKFQYti4Dz
	ZxkqNO7uUu0RfWL/5mYz2/bGEdSN5MgA4YeMz0yKbyumTn+I9fDbNy7VtO1ruHDXnrWeWVQ==
X-Google-Smtp-Source: AGHT+IHytMV0zVjVKlKFZ2Tg+fK0lWmwW05/D3MY9h08RyMfZ/YkTt1kctNVMo3JSAZ7zlN0/VG7/czNHx25AVLtiYM=
X-Received: by 2002:aa7:ca58:0:b0:5d9:5a5c:f2f9 with SMTP id
 4fb4d7f45d1cf-5de5e186224mr164680a12.7.1739212199243; Mon, 10 Feb 2025
 10:29:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207121529.222723073@infradead.org>
In-Reply-To: <20250207121529.222723073@infradead.org>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 10 Feb 2025 10:29:22 -0800
X-Gm-Features: AWEUYZmkWmZJ6al83_2ZRIobnPiQ9lOhpg7ZAn3_XiLTEUTt1Uois_oPUTDq8PY
Message-ID: <CABCJKudA8aUf=SDsVOOsWX_Cq6LAcioOjgtpv+uq+WGwJbxFPA@mail.gmail.com>
Subject: Re: [PATCH 00/11] x86/ibt: FineIBT-BHI
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, alyssa.milburn@intel.com, 
	scott.d.constable@intel.com, joao@overdrivepizza.com, 
	andrew.cooper3@citrix.com, jpoimboe@kernel.org, jose.marchesi@oracle.com, 
	hjl.tools@gmail.com, ndesaulniers@google.com, nathan@kernel.org, 
	ojeda@kernel.org, kees@kernel.org, alexei.starovoitov@gmail.com, 
	mhiramat@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Fri, Feb 7, 2025 at 4:28=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> Hi!
>
> Respin of the FineIBT-BHI patches.
>
> Scott has managed to get LLVM bits merged:
>
>   https://github.com/llvm/llvm-project/commit/e223485c9b38a5579991b8cebb6=
a200153eee245
>
> Which prompted me to update these patches once again.
>
> They boot and build the next kernel on my ADL when booted with: cfi=3Dfin=
eibt+bhi
>
> Aside from the last two patches -- which implement the FineIBT-BHI scheme
> proper -- I'm planning on getting these patches merged 'soon'.
>
> Scott, what those last two patches need, aside from a lot more testing, i=
s a
> coherent writeup of how the mitigation works and ideally also a few numbe=
rs
> proving the performance gains are worth it.
>
> Last version at:
>
>   https://lore.kernel.org/all/20240927194856.096003183@infradead.org/T/#u
>
> Current patches:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fine=
ibt-bhi
>
> Patches apply on top of tip/master.

I gave this a spin with a ToT Clang; LKDTM 's CFI_FORWARD_PROTO test
now traps in __bhi_args_1 as expected, and the changes look good to
me. The is_endbr() clean-up also fixes the gendwarfksyms+ftrace build
issue reported earlier. Feel free to add:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

One thing I realized is that CONFIG_CFI_PERMISSIVE doesn't actually do
anything when FineIBT is used since we lose track of CFI trap
locations. I'm not sure if that's worth fixing, but perhaps we could
disable FineIBT when permissive mode is enabled to avoid confusion?

Sami
