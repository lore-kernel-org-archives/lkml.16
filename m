Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB50C2EF;
	Sun,  6 Apr 2025 09:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743931872; cv=none; b=pllK2+LEKBDwe5QBC86DXtqgNh4ynU5m8s1b8zIdRX+OJM6c7Kxx+6zKm2YmehqKKe0/XqqiNebN69BZJUcfPCJ+khIEntiKiLVVuRXt4l4cIC4hKm8KX81trJp12HljfM3YikMO8trPODE79fWXzxcldER/MT/5SozPOIvJw9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743931872; c=relaxed/simple;
	bh=KNR9s/z37rrTB883Rr+3wXkXm+XAx8K2YsXKsd82FdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zxii+EqJyufFG8LH7K7CAMQNmZEnI7M7Uw7F9HAPctQZXPTQY1VrOIy8lMbifDZvyho9Bnc4Vi/tfYWNokgvNawlYsQ3eBrsY8FJauh6cDdIAfKst764KV37Alp2fMRNAbF1lE9hBG6lm0x8UUXIKV/3Wza1ihdgCTXoYBcgCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=juzZYhUR; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="juzZYhUR"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f8df49e75fso966286b6e.1;
        Sun, 06 Apr 2025 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743931867; x=1744536667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHmP/Qg/EJyJa26FRzbLoPkPrFVf0HVFbniEqKsAmzY=;
        b=juzZYhURw6oj7S5y0DQ8d4Jn0FiFNcQbJOS3DMXLC7noC9t1ATI9Q/urXb2VyG066h
         /GwcgffMC/dqhdmO2HlN8qnywKf6rtjzboqbaOAFpO2yzkZwEJOiMCn5D/UgVBb/gYbH
         nVim2t5u7gcwpj/hx1pYtXYN5QEa8dz48kAl1O8qA5sn0KOKLC0EGVwJ/m9E4025hNKV
         1ELrRrUYQxIEZOTUPcb5qEi3NUtvXHQVrxQQNzAgkN5xrt//sj0viSXLpGKQDaZ32GR1
         SqpOwXtuzwb89G2dsikh3G8VeuXSoJ3emcrlrl68RTlEcl1wq2ENN8dSYAzHWMLv7ROs
         uifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743931867; x=1744536667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHmP/Qg/EJyJa26FRzbLoPkPrFVf0HVFbniEqKsAmzY=;
        b=CTooW55URQ1MGleHzQ7PO/Tjz/TjEmryMvxZOCGRkZTPbgbrANwVXszHYXsc8tewVY
         1BfClvRtcqhl3+j/NcJQ6KmHNqNTKO6eHvgr43yLtZiTDvxqocFwV27y7/DFqZij70HY
         Sq/EzUm5ImsdPs1jLNIdpC1peM51VLrFibLwzIYCaQYgTWVYwjraOxayRLPOOE5NWkiy
         FHPp7xLDTq9XdaRxwpZP+0AQnVr8ZE58IBSJoBPH7xOAM/q+dNUkdyGArs4JyTI9vriB
         D9fY10C2CbTwBWvjFZ7/NpLkHFfzoP3TLqlgLPOAUUzFWgk/Zwd1O3g/9i9k6Dtj6Yue
         vDmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgrtYRTDdyQn8eR24r55k32UJuLtw3FiAYvPwOU2Vp3MXZYnLfXAVjyAAIzorshBQFGswQUgAEuI01Fa8=@vger.kernel.org, AJvYcCXUONfnhQs+dbEOpSrm65hLYgZveeD/iwUkCDbfvEyzWVFYuwfLw8d4Ma2u/MmEmn0iS67Z19hm3F4mgFLpC8c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXDYn5HKtfgiiBv9UC/pNE+CWmOFMIYxhoGsHyF98aE47WK0M
	N07P8ODhC63pdO4y4ZDDGr1KS2LDMQFJmIgIbe4u5kj/wEp52ifv
X-Gm-Gg: ASbGnctN98/5xEFQNPos7iire7PQHtr1PjWLumruLtjlkLyh3cnVZBgqPYtHOaQDujQ
	l0J/xes8CQZSQeMXdV+bVSi70GEX8IwIiQ/tCZNuvwRxx7FC4404N1TK//+S+/J+8/iUOCrFfiY
	DrgcEH+0APAlUAVMXpXe9qwECDFjAJW4gDvqWcQ9ihvvR+JenTjXUrTAUDz9sbg3vUGRtBxMXfw
	BH2TavW0ck6Vh0dLgaOjXvZsa01DNE8CNuu4/2a7yUOZkLZI+uo3CkuSBeo/DwIXhQUsu5TrM5N
	oyO11avBftaVHts5lbp5iXXjbd3EaJogbf7HLHisf4WUIsUzenrqYJ2ov1bAkM0csSQU4t1mcJC
	LsyTTqd9cJW9jTuQv
X-Google-Smtp-Source: AGHT+IH3FJ5kGG0Wg/P7+DauHff2Q8I3DdhxiyMON9kl/B34ns20VCHv08p5xFw8uDaJF9ytGCKjqA==
X-Received: by 2002:a05:6808:309c:b0:3f8:b73b:682f with SMTP id 5614622812f47-40045578aafmr4837432b6e.1.1743931867307;
        Sun, 06 Apr 2025 02:31:07 -0700 (PDT)
Received: from my-computer.lan (c-73-76-29-249.hsd1.tx.comcast.net. [73.76.29.249])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-400400809e9sm1344818b6e.36.2025.04.06.02.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 02:31:06 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: willy@infradead.org
Cc: Liam.Howlett@oracle.com,
	a.hindborg@kernel.org,
	akpm@linux-foundation.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	andrewjballance@gmail.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brauner@kernel.org,
	dakr@kernel.org,
	dingxiangfei2009@gmail.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	maple-tree@lists.infradead.org,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	wedsonaf@gmail.com
Subject: Re: [RFC PATCH 1/2] maple_tree: add __mtree_insert_range function
Date: Sun,  6 Apr 2025 04:30:08 -0500
Message-ID: <20250406093008.1655905-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <Z_FKugtgoN0l6JNm@casper.infradead.org>
References: <Z_FKugtgoN0l6JNm@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Apr 05, 2025 at 04:22:34PM +0100, Matthew Wilcox wrote:
> On Sat, Apr 05, 2025 at 01:01:53AM -0500, Andrew Ballance wrote:
> > adds the __mtree_insert_range which is identical to mtree_insert_range
> > but does not aquire ma_lock.
> > This function is needed for the rust bindings for maple trees because
> > the locking is handled on the rust side.
> 
> No.
> 
> The support for external locking is a TEMPORARY HACK.  I've talked
> before about why this is and don't feel like explaining it again.

this does use the maple_tree's internal ma_lock. the locking is
done on the rust side using bindings to mtree_lock(). it is done this
way so that rust can track the lifetimes of any values from mtree_load.

the easiest way to do this was to add code to the c side. 
for the v2 I can make changes so that this does not touch the c side. 
