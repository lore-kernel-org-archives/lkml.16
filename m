Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F56B274648
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746792284; cv=none; b=lwY9qm/JqYmnQjh7tPgpc8OVuwjotLq99LAEwFcW0gSrO/Z6E+9qfiFHyfdjqPjwE1QV+ADQk3AjzyEx12mH7XEC9P69KsfXNw1kWZZTPervgb7IJPP83eBpgt3j/ZMc0fsAdCzQMBMsZsx25ryf1luaiJUoIq44Su5X3kFQOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746792284; c=relaxed/simple;
	bh=IIrzDuF95i3T1fR9qzKCjDkczS4spB7V74LrGsPZDBY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAA41hqHk//Xd4/IHmibf+bTycpVCWJunoRJIwDToj/dMK+ydTA9PNFi1VY46e72Kw2Eph4PybC/BTh6Jpu8mOP9yLl8GButTpHZurry4d2W/2L0nkLQ2GYePqntM4NLRtgufqP4A5n0bj1xiPeyQhYeXizXHQHKAjQeoxAhqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KSQPZhrR; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KSQPZhrR"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so10556605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746792281; x=1747397081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/+j7dWXLRB7gikNu3uuJO50SKhj44CIYJgSM0vJqWE=;
        b=KSQPZhrRSA1bqZwzfzjs7pmRfsyDxxKEgkpG1UiU74QcUj3rJ5oJ0ut/ZdwZPNIv8n
         /oxjZ7SBoiFlCoRfOnMvskzKHuuv15mtERGKkwTkg/mIQG8+CDu5WeuR5NRwcOsriJZR
         1M3nKglfS/Eouh2YnRX6NsV/ISPMRCJEDjMDzY25i3wXs/FiPe1mzFlrGHccY3Jz4YNG
         BYoYtWbVByv0JqiSNpilC2Cg9JiHcR3GkJsZ8KMw0rNwob29Pqtl6+gAQZJ84tXi/qkm
         Pys9av7Nlw7/0kqZo+j0YI0seea5dNkxz/WdMS/KjWs2Pl8zhJYJQ8zDiGE9qvIm+XhR
         5gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746792281; x=1747397081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/+j7dWXLRB7gikNu3uuJO50SKhj44CIYJgSM0vJqWE=;
        b=JfcpjbsWb7YPPLjcANAdkZYwJrBGNRncuHub6yNOpZkhr2CnfkFCWvwXotpUSRF0FW
         Adt1Ym5AavOEkzn7SGac3UbkxbvZrbK9yjGtSMHpVTg+kyKimbHOMQc/JAKL4GM5m4td
         oshJ/02ICoA81SjKnPJConme2v6MrLIbhSg6fCCfKLXRztwbd9aBAme8YdETCmFmXLfB
         P60w/HeaDW9erDSWshFXHXqvgPXKX3wiaZ+tNRRKyIuliRYPnIU7zBE9QfbhP+Esmeub
         9eX20jNNFrvtLcP+sKfuK9T6R1N5IN26xjJ070eFndozyVnzSL8vH46G0HTpWfY7GnZF
         jebA==
X-Forwarded-Encrypted: i=1; AJvYcCWpGMACTH6/UgrMa1l1BmMo9zMTUs4CKPrxf4e2JgNtiROHyLZbZfKoB0OJ5fXRMkZwbdfCIsqRR1GZsgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYNaiTxElvZpY/4CsOG3IzylfB8mHyzBZp7nZnnLrL35AcK5H
	gadNkwuIzoBvCfiu+ZawCVzfQ+6ZtAS3iM2wc4zy6PgYtnYfLzK4
X-Gm-Gg: ASbGncs4LTCqE2FH8BwngGEsCmealVpMJiVKJ1xFGBvkmz5XkDxgkWaiDCuqsOCpYQR
	+R3rcLUyr3MYLxvEDXCF/Uqmm6vWo2hgaYpxpZoiFqTbTiKm/JaQy9ADi2H/NTCCFnWH+Fops/q
	NKgBXG2ipF5nQyotI7mEPNKtwxXdyN57sMEFYdxdjdvQmtBXk1raoqBY7hitQ4PP/dAZQREdhQG
	68Qi1C5Pt+kEktO7VZ5PvVZcgnn1NSkQeD6p29zsBv0gissQd4IzmDpulG+R+Bk1jW2vEHmYBcd
	SezWuN5hRP7x9MrsPrlUC9IBVeznI58OM6W89WTc6OtYec5bt2m6XIMVikxp0/N6s6tpbInmLEu
	aEmo=
X-Google-Smtp-Source: AGHT+IGd7iLBRssL0nGsfBVMjPK8EmoUHUizu+T1tNRzten6zWGA0jW4H+tHpBC+Jp0T+o49Tvgk7A==
X-Received: by 2002:a05:600c:1c8f:b0:43c:e467:d6ce with SMTP id 5b1f17b1804b1-442d6d11a67mr25832135e9.4.1746792280358;
        Fri, 09 May 2025 05:04:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bef4sm71391165e9.24.2025.05.09.05.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:04:39 -0700 (PDT)
Date: Fri, 9 May 2025 13:04:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "H. Peter
 Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov
 <vkuznets@redhat.com>, Ard Biesheuvel <ardb@kernel.org>, David Woodhouse
 <dwmw@amazon.co.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32'
 subarchitecture
Message-ID: <20250509130438.309220f5@pumpkin>
In-Reply-To: <aBr_GZ9P7k_I7RU6@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
	<20250506170924.3513161-5-mingo@kernel.org>
	<cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com>
	<aBr_GZ9P7k_I7RU6@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 7 May 2025 08:35:05 +0200
Ingo Molnar <mingo@kernel.org> wrote:

...
> Let's just have x86_32 as the internal primary subarchitecture name, 
> with support for historic aliases like 'i386'. That it cleans up things 
> for defconfig naming is a bonus.

Aren't there 3 variants?
Although the 3rd x32? running ILP32 in 'long mode' isn't used much
(if at all?)

	David
