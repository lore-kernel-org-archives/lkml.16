Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3915E1E485
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747916232; cv=none; b=mhmucKKcyz6H1NbZpvGTUcPA+AVsBRI8vffV6QeXyhvDODUBxEq+5bgzVWJIOaYTpPG8Z+3k5nMUIu4U2ztwP+ddffWRUxGcS8+/5mJHVogW+HRbotp4THGLQICnhUDaS2I66HNXttPJIT42w5jlSanZ4xsmhIyd+fuYq1jq0AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747916232; c=relaxed/simple;
	bh=eiUAPtWkklVAkMrYR4Bk7yeefVmpei03jtQi4YPJahM=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nNNpxLdOgRVmb5jgqQblEx6wHZihyQB3Kxz3UG8M+v2lfFxGC6pd1c8OYB/5bSIovH+GJcdPgrR/SRllX4ajF9IiXpccsFfOK+tWwifXoamdmpnVot9EofdAQa9CMdQIgQUJ/OgL87/KmsVUCILlufOk/3tnuP9+x8ZAKfLWPIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=AY1gHKJF; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="AY1gHKJF"
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-60169001e0cso1216758a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747916228; x=1748521028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiUAPtWkklVAkMrYR4Bk7yeefVmpei03jtQi4YPJahM=;
        b=AY1gHKJFaUKV1+1KsHChtdmUTfeaq/+H16DnkSa1m5DDXNl/HWhdJMBGVfhbh1V79x
         3YkMTNCWAru9XSIKBjkKHKgRbPtQ+iAAIefvK9g5l6IldZpr9u0Iplk9jjPdB8FLdaly
         b7k7R3uV7dtKeUD3xCg5KFJZCBs2QQXXsSPl8SQY65L8GpJG9NspaO9U8hx2ToUmdSQd
         9Z2SPFBjLPwtheRGFVB087xtrwsp6oNe0cmIHkwdia4YE1+5zCx2Yn7oFHtdMZ5X84fG
         ogFsyBk7NHGUPjPD3SC737mSu6QdnOBUDSdKa8OxUWlN6bG7Uq/kPLpg75wjek0iezUP
         tRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747916228; x=1748521028;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :subject:cc:to:from:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eiUAPtWkklVAkMrYR4Bk7yeefVmpei03jtQi4YPJahM=;
        b=cd6seZV7K7Nmv61oRd/WltqI5F14uS7Vy+Z8FTstwl6yIxphsDygmGA39wsYXaQ2/6
         Sb0ZDKDC8WVednn7AnVnHv4e9SA1PPfqoO5n0hS9AJsSlIFgiir2+jM6/GGOKP1+aFe8
         J56w1oszp6nDbyKAMQs33JdjPDcTIec2P5Z9xRaQiOriNf4DvDp3Qng4yjvB3tkyOIRf
         q9ta2eGLpooTxGCPDyQJMYASzvmiIaDyvAY9fLyxSaKJTloG5rs1Vlw2lprwVPzrKyxz
         ohimsbo2g4YN3CBdXC+pB/joanCuONppcOyV4iavEhT5itcv/9sRABJIHFjph8yG8lRJ
         x7Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUkUHUEmjsRCeoMqpDpE19H//OhP98MSCmN+lmW8+ANcHChCtKm7QAb/zmhvFO/uv6XTAdtOyQt58NEJxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+oZSP2kjYGhcQ/KRKSInsL9QK90x4XDKtrnqb/y8zPMqekz3j
	77mW9H9b6yKX/9i+MrJ3n3lD+lI39EqNuEbpw40PchXNjGf209SCetTwmNgxozY5JeM=
X-Gm-Gg: ASbGnctkgnJrGDTs+XHlkyedIVLxs56bnQYPQlcFY0rIRP7yKjub/UFdSIO3KwcdGVv
	wMXMQgpvqJYuPTSKMXuKqYjMrj7YoT0YEgPkY3/Oz0eCgwP0ddPn8rd2xkiuUbc+fzLvD/JwyeS
	Ek6SIrn66DryFSLnwCT+E6GLnoKH5myK+enK2lGAPcKustQZZnIb4oDe+1B7bcuJMNzHPqnaNw2
	qK1DA4pF4eDmtm1DzQSIMBeqkpmWyjzm+dn84jIHafx9+xjEQWAVH+bs0HHiln7H+E7R0yTkwU3
	DLDHuoBltfn0oj5qkTdJGy6ICGsmXUyVrw+6mY1F2WsO2Rvdc2bx7rJ4BPzWPYrq1gn3EoaPbw=
	=
X-Google-Smtp-Source: AGHT+IGlOm7kKNiIMa4LYQU01uE9DXQXr/EXxT9p4EDhhkg8mLhr6eFDmP3LkE+YOmae5nnJZU74TQ==
X-Received: by 2002:a17:907:28d1:b0:acb:7de1:28b9 with SMTP id a640c23a62f3a-ad52d49b404mr686859466b.5.1747916228283;
        Thu, 22 May 2025 05:17:08 -0700 (PDT)
Received: from lb02065.fkb.profitbricks.net ([212.227.34.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047bd6sm1055733066b.29.2025.05.22.05.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:17:08 -0700 (PDT)
Message-ID: <682f15c4.170a0220.3893a.e498@mx.google.com>
X-Google-Original-Message-ID: <20250521165909.834545-2-pchelkin@ispras.ru> (raw)
From: Jack Wang <jinpu.wang@ionos.com>
To: pchelkin@ispras.ru,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Cc: bp@alien8.de,
	dave.hansen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mark.rutland@arm.com,
	mhiramat@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	rppt@kernel.org,
	tglx@linutronix.de,
	x86@kernel.org
Subject: [PATCH 6.1 1/1] x86/modules: Set VM_FLUSH_RESET_PERMS in module_alloc()
Date: Thu, 22 May 2025 14:17:06 +0200
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521165909.834545-1-pchelkin@ispras.ru>
References: <20250521165909.834545-2-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fedor Pchelkin <pchelkin@ispras.ru>

From: Thomas Gleixner <tglx@linutronix.de>

commit 4c4eb3ecc91f4fee6d6bf7cfbc1e21f2e38d19ff upstream.

Instead of resetting permissions all over the place when freeing module
memory tell the vmalloc code to do so. Avoids the exercise for the next
upcoming user.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lore.kernel.org/r/20220915111143.406703869@infradead.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

I confirm this patch fixed the random crashing ontop of 6.1.139 I've experienced
on our Icelake and Cascadelake servers, servers are working fine after appling
the fix, thx!

Tested-by: Jack Wang <jinpu.wang@ionos.com>
