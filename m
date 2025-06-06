Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A2A283FFA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200424; cv=none; b=VH1gJ432h09aJvhqF4YMQ2LVQf35e1um/cWUPQfUlQLzPiP6uzN4fkh2jDOE+NI9oabspo3O/CQqbi5O3pQ5Et26pGU313NdPFYUNnrmoUqJFQa4Ov07JTXLDO9Wae6BKKXA8Dxk7dLOxBvql5TUXBbSUvLFiFGffOs/mu0kkKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200424; c=relaxed/simple;
	bh=/eAfRKkG8umOInYvuV8Ox5HGkToOXh0S4FrQTBYSvyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HmxU/vLjRDI23fOZryxJ+B8fj1hQEnGn/qV8+E+GzlZUm2Jt+CnL3sYp4dOKISHu+erXRydy0CiGfoTLjt3AaJ8R/jYeuIjGvR3Oxm6hNnM+eQzRXpnFLkan8TfJi/xg89CPVKZ9maWpLn94jTLsH2CECks09dfkgGVCQTsbEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjREHAPf; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjREHAPf"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-445135eb689so10179345e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749200419; x=1749805219; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5PC5oMgoZ+UFSPHr55ppMv4d7kRuQFao40OCKHLwKl8=;
        b=JjREHAPfKYRGWGxqGODL4We4LZkBxVTp2vT/lu8JFm0oeYuiVyVCwnU/FWJFY/3ngw
         xxpdtorNYBP1MFgIUXclTVcWKCcxG4i1wYtiUK56dCgCVAe3GHHjnYCTTtohXfVaUHv1
         iqtBO5gByfdZvCTfNd5KUXum9IVIXIoM9hK8QNPkoKkVMcjRTPpF3g7arFlOOojx/Wj+
         9NaT42Xp7e8YCXPRBHMwyz6zakJmpb8ORrEXREgraHH5InfUqz4Ey3FoPX/z5r2GS6r3
         om6y2P67yRM6C4rKkI10dSFElAzJALRIh8rR+OfH7cRrdVcLeChxJsJFFuv7JGe5rF0Q
         yWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200419; x=1749805219;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5PC5oMgoZ+UFSPHr55ppMv4d7kRuQFao40OCKHLwKl8=;
        b=u5C5koy/K3HePLXrb9HIH0ZN/Zhvxr4jisOUU+T0Yg5CfawgTjBuOELeTELGcUKNGS
         JmMtoguFJpUkqM9UZx/fn9O+IYyaTuAsVXeLa6i/XyMb5DoVtOI4Qbifc0XL4prxwXdc
         D6od1IlmlFcy3NNGNIwUyHAHux8D9UICka6ypwz8mOnSJaaZgb82ZM0fyd26rH3O4o6U
         /hkaZAD1BneVVB7BOlokSdNE6WdSY94ufBYiU3wO1MoGIG9h8694aJDlqec/2r36n8/U
         +WsWTWRiHUS0mZXhc/9ZsfDNQgrKvRlW2KPhLhjsP8ChnlQGi9+uzMhwXAifiQ8ln+5s
         00PA==
X-Forwarded-Encrypted: i=1; AJvYcCUqPmgQHruaChl5XHCSmq8wU2eICL1bi6Q56U/d0upJB9iwD3vp0fqk99/UJzgWQmFnA0uv3/BotDDLGP4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5QXzQeNHdtGmQo/claNLUd4z/ZN208jDLSPczOaNIA4RV7AFD
	m6lsWOnQzTCuW39GRCWpWykCTPSYnQ7IdIIhAWb67/MYeTlw7ClvNv2lX8Vl34TBIrQC6oO4Zfd
	pSAg7klrVmtN8DVxgWQ==
X-Google-Smtp-Source: AGHT+IH/QYbvsS/U9rVKnUtVrlndHv1MOMIqsNE73OS3DtORTGUsobRwG7K0tQKguV825pTOaG1xyT76+ZRfs+s=
X-Received: from wmsr2.prod.google.com ([2002:a05:600c:8b02:b0:450:da87:cebb])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c177:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-45201417bfbmr24715585e9.1.1749200419659;
 Fri, 06 Jun 2025 02:00:19 -0700 (PDT)
Date: Fri, 6 Jun 2025 09:00:17 +0000
In-Reply-To: <20250603205416.49281-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250603205416.49281-1-dakr@kernel.org> <20250603205416.49281-2-dakr@kernel.org>
Message-ID: <aEKuIRI6UvgCZ-z5@google.com>
Subject: Re: [PATCH 1/3] rust: completion: implement initial abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org, 
	tmgross@umich.edu, chrisi.schrefl@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 03, 2025 at 10:48:50PM +0200, Danilo Krummrich wrote:
> Implement a minimal abstraction for the completion synchronization
> primitive.
> 
> This initial abstraction only adds complete_all() and
> wait_for_completion(), since that is what is required for the subsequent
> Devres patch.
> 
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Juri Lelli <juri.lelli@redhat.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Ben Segall <bsegall@google.com>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
